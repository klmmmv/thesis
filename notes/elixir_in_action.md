First Steps
========================================================================

High Availability systems have to fullfill the following points:

* Salability
* Responsiveness
* Fault tolerance
* Distribution
* Live updates: releasing new versions during runtime

Erlang process and concurrency in a picture:

![Concurrency in the Erlang virtual
machine](erlang-concurrency.png "Concurrency in the Erlang virtual
machine")[^concurrency]

General Erlang Facts
----------------------------------------------------------------------

> Typical Erlang systems rely heavily on processes (not OS processes), running thousands or even
> millions of them.

The Erlang platform isn't the fastest when it comes to intensive CPU
computations. Other platforms should be considered. Erlang isn't in the highest
places of 


### Good to remember
- Erlang is a technology developed with making highly available systems with
  almost no downtime.
- Elixir is a modern language which gets rid off boilerplate code, code noise and
  duplication.

Most Elixir operators are functions. Example: `Kernel.+(a,b)` represents a
simple sum of `a` and `b`.

BEAM Scheduler genau anschauen. Frage: Warum *paralysieren* Erlangprozesse das
System nicht?

Elixir vs Erlang
----------------------------------------------------------------------

Elixir and Erlang code can do exactly the same stuff, though Jurić [-@juric2015elixir
] states:

> [...] The Elixir solution is usually easier to develop and maintain.

General Elixir Facts
----------------------------------------------------------------------

Elixirs macros work differently than for example C/C++ macros, which work with
pure text. Elixir macros on the other hand work on abstract syntax tree
(AST)[^macros]

[^macros]: Macros transform source code to according code. Making it way more powerful than textual macros. p56. For example: `if` and `unless` tokens are not part of the Elixir language construct, but rather inplemented with Elixir macros. Macros are transformed at compile time.
[^concurrency]: Elixir in Action figure1.1.

Building Blocks
========================================================================

> You should always be aware of the fact that data is immutable. Once a memory
> location is occupied with data, it can’t be modified until it’s released. But
> variables can be rebound, which makes them point to a different memory
> location. Thus variables are mutable, whereas the data they point to is
> immutable.

Elixir pipelines work like unix pipelines `|>.`

Arity is the name for the number of arguments for a functions. `sqrt(a)` is a
fundtion of arity 2. Two functions with the same name, but different arguments
are two **different functions**.
Default values for arguments on functions, is implemented with `\\ 0`.

~~~elixir
defmodule MyMod do
  def double(a, b \\ 0) do
    sum(a, a)
  end
  defp sum(a, b) do
     a + b
  end
end
~~~

Types
----------------------------------------------------------------------

###  Atoms
Atoms are best used for named constants. The text after the : (colomn) is kept
in the atom table

Atoms are used for booleans and null values (Elixir doesn't have a dedicated
type for that):

~~~elixir
:true == true
:false == false
nil == :nil
~~~

 ### Tuples
Tuples group a fixed number of elements together:
~~~elixir
vali = { "valentin", 30, "student"}
age = elem(vali, 1)
put_elem(vali, 1, 31)
~~~

###  Lists
Lists are used for dynamically sized collections. Internally hey are a recursive
structures of head and teil pairs.

~~~elixir
list = [1,2,3,4,56]

# check if element in list
3 in list

List.replace_at(list, 2, 5)
# To actually store that data, put it in a new variable
newlistwith5 = List.replace_at(list, 2, 5)
# alternative list definition for head and tail part of the list
list = [ 32 | [ 12, 11, 45]]
~~~

List function go through the whole list, therefore they are not efficient ~ O(n)~ .

###  Maps
Key-value pair

~~~elixir
map = %{ :atom1 => "bob", :atom2 => 32, :atom3 => "vuidodl" }
# if all keys are atoms you can also write:
map2 = %{ atom1: "bob", atom2: 32, atom3: "vuidodl"}
map2[:atom3]
map2.atom3
~~~

**basic types**: maps are faster to lookup than lists (O(n))

### Binaries 

~~~elixir
<< 257:16>>
# <<1, 1>> because 257 is 00000001 00000001 in binary and uses two bytes
~~~

### Strings 
Strings are represented by using either binary or a list type.
**Embedded string expression:** `string = "This is evaluated by an expression: #{3*4/2+(5*4/23)}"`{.elixir}.
You concatinate Strings with the binary operator `<>`{.elixir}, because they are
binaries.

### Keyword list

### Module a tribute

~~~elixir
defmodule MyModule do
  @moduledoc "Implements basic circle functions"
  @pi 3.14159

  # ":: number" specifies the return value
  @spec area(number) :: number 
  @doc "Computes the circles area"
  def area(r), do: r*r*@pi
end
~~~

### First-class functions

~~~elixir
square = fn(x) ->
  x * x
end
~~~

Call it with `square.(5)`{.elixir}. The dot implicates that it's an anonymous function.
And not a global one, defined somewhere in the modul.

> Because the function isn't bound to a global name, it's also called an
> *anonymous function* or a *lambda*.

~~~elixir
lambda = &(&1 + &2 + &3)
lambda.(1,2,3)
~~~
`6`

### Closures

Lambdas that use variables from the outside scope, indirectly reference that
variable (and other variables). You call those closures. A closure captures a
specific memory location.


### Keywordlists

~~~elixir
days = [{:monday, 1},{:tuesday, 2},{:wednesday, 3}]
# Same as
days = [monday: 1, tuesday: 2, wednesday: 3]
Keyword.get(days, :monday)
~~~

Keywordlists can be used like a typical configuration object (remember: it's
a list). Example `Float.to_string(1/3, [decimal: 2, compact: true]`{.elixir}.
This technique can be used to simulate optional arguments:

~~~elixir
def my_func(arg1, arg2, opts \\ [])do
  ...
end
~~~

The default optionslist is an empty list. But keywordlist options is almost the
same as using maps for the same purpose. One of the difference is, that keyword
lists can be ordered (maps can not).

### Sigils

~~~elixir
# Regular expression sigils
"foo" =~ ~r/foo/
"HELLO" =~ ~r/hello/i
regex = ~r/thisismyregex/

# Generating Strings
~s(this is a string with "double" quotes)

# Generate lists of words
~w(foo bar bat)  # results in ["foo", "bar", "bar"]
~~~

Macros
======================================================================

Macros perform powerful code transformations in compile time. Definition:

> A macro consists of Elixir code that can change the semantics of the input
> code. A macro is always called at compile time; it receives the parsed
> representation of the input Elixir code, and it has the opportunity to return
> an alternative version of that code.

Elixirs language core is quite small and many constructs are not keywords, like
in other languages. But made with Elixirs powerful macro abilities (e.g.
 `if`{.elixir} or `defmodules`{.elixir})

> Macros are compile-time code transformers.

Some constructs are treated in a special way, called [Special
forms](https://hexdocs.pm/elixir/Kernel.SpecialForms.html).

## Runtime
Everything run inside on BEAM instance/process.

> Module names are atoms.

Every defined module is bein compiled into its own .beam file.

There are three ways to run the elixir runtime:

1. The interactive shell iex.

2. Running script files: elixirTest.exs. Every module is compiled into memory and no beam files are created. Sample script `test.exs`{.elixir}: 
    
    ~~~elixir
    defmodule MyModule do
       def run do
         IO.puts("Hello WOrld!")
       end
    end
    MyModule.run
    ~~~
    
    After MyModule.run is called, the beam instance is being terminated.
    Thus making concurrent tasks not finish. elixir --no-halt option

3. The mix tool is used for projects with many source files.

    ~~~bash
      mix new myproject
      cd myproject
      mix compile
      mix run
      # Starts the system and doesn't terminate
      mix run --no-halt
    ~~~

sdfsdf2

### Dynamic function calls

Elixir gives the ability to call functions dynamically with the `Kernel.apply/3`{.elixir} function.

~~~elixir
apply(IO, _puts, ["Dynamic function call."])
~~~

The combination of the arguments are often called MFA (module, function,
arguments). This way you can make a function call decision at runtime.

Control Flow
========================================================================

Pattern matching
------------------------------------------------------------------------

The `=`{.elixir} operator isn't an assignment operater, but called the match
operator. Therefore you can make expressions as 1 = 1 which returns
`1`. As 1 matches 1. This also shows that you can have constants on the left
side of the match.
To tighten a match you can use atoms like :ok if a functions succeeds.
Which guarantees that a specific part of the right side, has a specific value.
If you don't want to use a return value, you can use the anonymous variable
`_`{.elixir}. The following are some usefule matching patterns:

~~~elixir
    # pattern = expression
    {_, time} = :calendar.local_time
    # only retrieve the seconds
    {_, {_, _, secs} = :calendar.local_time
    # retrieve an RGB value where each element has the same value
    { amount, amount, amount} = {255, 255, 255}
    # { amount, amount, amount} = {255, 255, 0} wouldn't match
    # to match against the value of a variable
    expected_name = "Bob"
    {^exptected_name, _} = {"Bob", 24}
    # useful when only retrieving specific fields of a map
    %{age: age} =  %{name: "Valentin", age: 25, profession: "student"}
    # bitstring matching
    # will extract the url from the command
    command = "ping www.google.at"
    "ping " <> url = command
    # retrieve specific bits from bitstring
    # usefule for file/protocol headers etc.
    <<b1 :: 4, b2 :: 4>> = "a"
    # match chaining
    date_time = {_, {hour, _, _}} = :calendar.locat_time
~~~

Pattern matching is also used in functions arguments, where the argument
specifier is the pattern, and the parameters given to the function is the
expression.
 
Multiclause functions (overloading) {#multiclause}
----------------------------------------------------------------------

A *clause* is a function definition specified by the def construct.

~~~elixir
    defmodule Geometry do
      def area({:rectangle, a, b}) do
        a*b
      end
      def area({:circle, r}) do
        r*r*3.14
      end
      # this is the default clause for handling erroneous function calls
      def area(unknown) do
        {:error, {:unknown_shape, unknown}}
      end
    end
~~~

The first clause (function definition) which matches all arguments, will be
executed. Therefore the correct order is important (default clause). Multiclause
functions are exactly one function.

The power of multiclauses show in recursion:

~~~elixir
   # Factorial
   defmodule Fact do
     def fact(0), do: 1
     def fact(n), do: n * fact(n -1)
   end

   # Sum of a list, possible because of the recursive structure of a list
   defmodule Listhelper do
     def sum([]), do: 0
     def sum([head | tail]), do: head + sum(tail)
   end
~~~

Multiclause lambdas
------------------------------------------------------------------------

~~~elixir
    test_num = fn
      x when is_number(x) and x < 0 ->
        :negative
      0 -> :zero
      x when is_number(x) and x > 0 ->
        :positive
    end
~~~

Guards
------------------------------------------------------------------------

Guards are additional "matching helpers". Example:

~~~elixir
    defmodule TestNum do
      def test(x) when x > 0 do
        :positive
      end
      
      def test(0), do: :zero

      def test(x) when x < 0 do
        :negative
      end
    end
~~~

Looping
------------------------------------------------------------------------

Looping is often done with recursion, multiclause functions and pattern
matching (see [power of recursion](#multiclause)). But looping this way can
become memory intensive.

### Tail function calls

Because of compiler optimization, a tail function call (or recursive) doesnt
make the memory usagy grow linear according to its call depth. Therefore it's an
efficient style of programming in functional languages ([Endrekursion](https://de.wikipedia.org/wiki/Endrekursion)).

Comprehension
------------------------------------------------------------------------

Comprehensions are similar to function from the Enum module. They collect all
results from each value into a *collectable*.
Example:

~~~elixir
for x <- [1, 2, 3, 4] do
  x * x
end

mult_table = 
  for x <- 1..9, y <- 1..9, into: %{}, do
    {{x,y}, y*x}
  end

# comrehension filters:
mult_table = 
  for x <- 1..9, y <- 1..9, x <= y, into: %{}, do
    {{x, y}, y * x}
  end
~~~


Data abstraction
========================================================================

In Elixir you call functions over modules and provide data as input. Elixir heavily enforces decoupling the code from the data.

Modules are abstractions for specific data types. You use functions of that module and provide the string variable (in case of the `String`.{elixir} Module) as an argument. In contrast to OOP where you instantiate a string and then call the functions which this instance provide.


Links 
========================================================================

- [Elixir quick start guide](http://elixir-lang.org/getting_started/1.html) 
- [Elixir Reference](http://elixir-lang.org/docs/stable/elixir) 
- [mailing list](http://groups.google.com/group/elixir-lang-talk) 
- irc channel: #elixir on (irc://irc.freenode.net/elixir-lang) 
- [Erlang documentation](http://www.erlang.org/doc) 
- [Elixir crash course](http://elixir-lang.org/crash-course.html) 
- [Erlang memory
  guid](http://erlang.org/doc/efficiency_guide/advanced.html#id68923)
