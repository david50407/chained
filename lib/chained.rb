class Chained
	class DSL
		undef_method *(Class.new.instance_methods - %i( __send__ __id__ object_id ))

		def initialize
			@chain = []
		end

		def method_missing(name, *args, &block)
			@chain << [name, args, block]
			self
		end

		def to_proc
			Proc.new do |val|
				@chain.each do |method_name, args, block|
					val = val.send method_name, *args, &block
				end

				val
			end
		end
	end

	def self.begin
		DSL.new
	end
end

def chained
	Chained.begin
end
