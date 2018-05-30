Organizing a Project
================================================================================

~~~bash
mix help
~~~

Input Option for the Application
--------------------------------------------------------------------------------

By convention, ELixir defines a structure which will help create a user interface
for handling user input on the command line:

~~~
lib
├── issues
│   └── cli.ex
└── issues.ex
~~~

### Adding third party libraries

The [https://hex.pm] project is the package manager of Elixir, just like *npm, RubyGems or pip*.
You can look up all the projects which are available for hex on the website. 
Those can be easily integrated into your project through the "mix.exs" file:

~~~elixir
defmodule Issues.MixFile do
  use Mix.Project
  ...

  def deps do
    [
      { :httpotion, "~> 3.0"}
    ]
  end
end
~~~

