# Chained

Makes `some_context.map &chained.to_something.and_somthing.then_somthing` possible and semantic!

## Installation

Install gem with:

```bash
gem install chained
```

Or with [Bundler](http://bundler.io), in Gemfile:

```ruby
source 'https://rubygems.org' # or other mirror

gem 'chained'
```

then run `bundle install`.

## Preparation

```ruby
require 'chained'
# require './path/chained' # if you downloaded the source
```

## Usage

We can use `&chained` to creating chained-block in simply DSL, like:

```ruby
[1, 2, 3].map &chained.to_f.to_s # => ["1.0, "2.0", "3.0"]

# equal to:
[1, 2, 3].map(&:to_f).map(&:to_s)
# or
[1, 2, 3].map { |x| x.to_f.to_s }
```

And passing arguments:

```ruby
%w( 1 10 100 ).map &chained.to_i(2) # => [1, 2, 4]

# equal to:
%w( 1 10 100 ).map { |x| x.to_i(2) }
```

Or even passing a block (or another chained/symbol-as-method):

```ruby
[[1, 2, 3], [4, 5, 6]].map &chained.map(&:to_f).join('::') # => ["1.0::2.0::3.0", "4.0::5.0::6.0"]

# equal to:
[[1, 2, 3], [4, 5, 6]].map { |x| x.map(&:to_f).join('::') }
```

Surely, we support operations:

```ruby
[1.5, 2.5, 3.5].map &chained.round + 10 # => [12, 13, 14]
[1, 2, 3].map &chained * 100 + 10 # => [110, 210, 310]

# equals to:
[1.5, 2.5, 3.5].map { |x| x.round + 10 }
[1, 2, 3].map { |x| x * 100 + 10 }
```

```ruby
[[1, 2], [3, 4]].map &chained[1].to_s # => ["2", "4"]

# equals to:
[[1, 2], [3, 4]].map { |x| x[1].to_s }
```
