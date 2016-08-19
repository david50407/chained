# Chained

Makes `some_context.map &chained.to_something.and_somthing.then_somthing` possible and semantic!

## Usage

We can use `&chained` to creating chained-block in simply DSL, like:

```
[1, 2, 3].map &chained.to_f.to_s # => ["1.0, "2.0", "3.0"]

# equal to:
[1, 2, 3].map(&:to_f).map(&:to_s)
# or
[1, 2, 3].map { |x| x.to_f.to_s }
```

And passing arguments:

```
%w( 1 10 100 ).map &chained.to_i(2) # => [1, 2, 4]

# equal to:
%w( 1 10 100 ).map { |x| x.to_i(2) }
```

Or even passing a block (or another chained/symbol-as-method):

```
[[1, 2, 3], [4, 5, 6]].map &chained.map(&:to_f).join('::') # => ["1.0::2.0::3.0", "4.0::5.0::6.0"]

# equal to:
[[1, 2, 3], [4, 5, 6]].map { |x| x.map(&:to_f).join('::') }
```
