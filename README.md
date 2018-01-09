# Sack - Single Action Controllers

Build Rails controllers around your deterministic monads with minimal
boilerplate, and a straightforward success / failure pattern.

## Installation

Just add to your Gemfile from Github:

```ruby
gem 'sack', github: 'printbear/sack'
```

## Usage

If you're using the [Deterministic](https://github.com/pzol/deterministic)
gem to build some wonderful functional-esque monads in your helper libraries,
routing to them becomes super easy, check it out:

```ruby
class UserTools
  extend Deterministic::Prelude::Result

  # Attempts to lookup a user by ID.

  def self.lookup(id)
    try! { User.find id }
  end
end
```

Now you want to do something with this (very simple) example, so route to it:

```ruby
# This is kinda like a normal route, but now #perform is the assumed action.

get '/user/:id' => 'show_user'
```

And finally the Sack magic:

```ruby
class ShowUserController < ApplicationController
  include Sack::Controller # Magic

  # Define the operation for this controller based on the library above:
 
  operation UserTools, :lookup


  # Optional: Prepare params to be passed to your operation, in this case,
  # the user ID:

  def prepare
    params[:id]
  end


  # And finally, handle your success case (render JSON in this example):
  
  def success(result)
    render json: result
  end


  # Or, if something went wrong, render your failure:

  def failure(result)
    render json: { error: result }, status: :bad_request
  end
end
```

Of course this is a very simplified example that you could easily implement
as a single #show action, but it serves a quick and easy example for how
this library can be used for merging your deterministic monads with
single action controllers.
