# Implementation and Technical Analysis - Elixir, Erlang, OTP and Metaprogramming {#technics}

We evaluated the goals and specifications for the Compiler - Virtual Machine
architecture in the previous chapters. We further mentioned that Elixir on top
of the Erlang virtual machine is an excellent choice for the implementation.
In this chapter it will be explained how the ASM method is used to get from a ground model
to code. Therefore the theory of directed graphs will be used to transform the 
nature of a SID and SBD into an algorithm.
Further I will describe why Elixir and especially the Erlang platform
almost fit one to one to S-BPM if you compare design choices and theoretical
backgrounds. One of the most important foundations for this work, is the
concurrency model of Elixir and Erlang [^elixir].
For an in depth look of various features and concepts of erlang, elixir and the OTP platform
have a look at [@introducing:erlang], [@introducing:elixir], [@mccord:2015], [@juric:2015elixir], [@pragprog:elixir] and the very good introductory course in [@elixir-lang].

## ASM Interpreter for S-BPM Processes

The purpose of using ASMs and S-BPM together for implementing a BP-runtime,
enables us to automatically verify and execute processes. Validating a BP
still requires manual work. Based on those techniques we are able to model
a BP with a software tool and --- upon correct modeling --- instantiate a 
technical process in a runtime. 
The foundation for the ASM-interpreter is taken from [@fleischmann:2010] and [@boerger:2003].

## SBDs and SIDs as directed graphs {#graphs}

Mathematically speaking, SBDs and SIDs are directed graphs. This point
of view makes it easier to understand how to implement a BP in an 
algorithmic way.
According to graph theory, we can see states as nodes and each node has
possible entry- and exit-edges. Those edges lead to the next node (state).
To model and implement the transition from one node to another, we bind guards
or conditions to the entry- and exit-edges. 
Therefore every node has a set of edges and functions which select one of the
edges as entry or exit, depending on the entry or exit condition. In +@fig:node a single node is depicted.

![A node according to graph theory](images/print/node.pdf){#fig:node}

## Elixir, a modern functional programming language

From the developers website, Elixir is:

> [...] a dynamic, functional language designed for building scalable and
> maintainable applications. Elixir leverages the Erlang VM, known for running
> low-latency, distributed and fault-tolerant systems, while also being
> successfully used in web development and the embedded software
> domain.[^elixir-def]

Elixir is very similar to Erlang and Erlang function can be directly called in Elixir source code. But Elixirs take on the Erlang VM is to provide a modern language which has a great tool support needed in modern software development.
It provides a tool-set for package management, testing and documentation.
Elixir even makes documentation a first class feature of the language itself. This means that providing documentation inside Elixirs modules, can be tested if the documentation itself is accurate. 
The following code snippet shows how to provide documentation tests. The mix tool will extract the code written after **"iex>"** and compares it to the next line `:hello_world`{.elixir}, which is the return value of the function `hello_world`{.elixir}

~~~{.elixir .numberLines caption="The mix tool will test the given example code from the @doc module attribute."}
defmodule DocPresentation do
  @moduledoc """
  # DocPrensentation
  This Modules shall be a representation on how to use 
  documentation in Elixir. You can test given code examples
  provided in documentation. This makes it possible to always
  have a working and up-to-date documentation.
  """

  @doc """
  The hello_world function provides a simple function which
  writes "Hello World!".

  # Example
    iex>hello_world()
    :hello_world
  """
  def hello_world do
    :hello_world
  end
end
~~~

This way, it is pretty easy to keep your documentation up-to-date and always provide examples for developers at the same time.

The mix tool, also supports easy and fast creation of projects. You can run tasks such as test and building escripts, which are directly executable Elixir applications.

As the introduction already said, Elixirs main focus is to write distributed and scalable applications.
Distributed in this context means, that applications are able to take advantage of as many CPU cores as possible, which can even span over the network and are not limited to a single machine. 
Scalability is guaranteed by using Elixir processes as the main building block and paradigm in writing Elixir applications. Those processes can than be distributed to all accessible machines and CPU cores. 
There is no extra implementation needed for scalability and distributed services, as it is an inherent programming paradigm. This topic is discussed in [Elixirs concurrency model](#concurrency)


- tooling
- mix projects
- Elixir is all about extensibility

Elixirs concurrency model {#concurrency}
--------------------------------------------------------------------------------

The Erlang platform was first released in 1987 by Ericsson. Its main goal was to program
the telephone exchange spots and switches in public switched telephone networks.
Those networks had a lot of different agents--- or autonomous computers--- which had to
fulfill tasks concurrently together.

Elixirs concurrency model is actor-based. This means that Elixirs thinks of its
processes the same way, as S-BPM of its subject. Every Elixir process is independent
of the rest of the application. It doesn't share any state or other memory with
other processes or applications. 
A process in Elixir is basically a self-contained sequential program which runs
on its own. It is completely isolated in terms of scheduling and memory access.
In Elixir, a process is implemented in the language. It is not an operating
system (OS) process or thread. It is entirely handled by the Erlang virtual
machine, which always consists of only one OS process. This way the Erlang VM
doesn't need to add OS thread specific overhead to a process and is very
lightweight in comparison.
In comparison, object oriented programming (OOP) languages use objects as their
main way of modeling and implementing software. And hierarchies of said objects
explain the relation of them. 
In contrast to that concept, in Erlang and Elixir, applications are built upon
processes which fulfill tasks and communicate with asynchronous or synchronous messages
to share their results, which lead to the overall goal.
Processes are also the main way to store some form of state and update that state
in the same process.
To give a better illustration of how important processes are for Elixir, the +@fig:vis 
gives an overview of all processes of an Elixir application. The Elixir application
is a web application made with the powerful phoenix web framework [^phoenix]. 
This is the minimum set of code to run a phoenix web application. Each dot represents
one process (252 in total). The edges symbolize links, which is used to model a form of
dependence among processes. One of those links could be a supervision strategy like explained below.

Erlang is capable of handling several 100000 processes on a single machine/Erlang node with 4 cores(see subsection [Nodes]) with standard configuration.
Though it is artificially reduced to "only" 400000 processes per node, the platform is capable of using a lot more processes.
An often cited illustration of how powerful Erlang's processes are, is the usage of Erlang at
Whatsapp serving over two million distinctive connections at a specific point of time [^whatsapp1] [^whatsapp2] [^whatsapp3] [^whatsapp4].
Unfortunately, Whatsapp is not very verbose about its technical implementations and no newer figures than from 2014
have been published.

![A process overview of a blank phoniex web application.](images/webapp.png){#fig:vis .class}

Elixir processes don't share anything with other processes when being executed. 
Supervisors are the common way to handle errors and execution problems,
by restarting them, instead of handling every exception.
Therefore it is important to define a clean initialization function and,
when restarting a process, bring the crashed process into its last working
state. As processes are the way to keep state in Elixir applications, yet 
another process will be used for state tracking of the processes.

This behaviour leads to a certain design decision for Elixir applications,
and the S-BPM virtual machine, which enables and improves the fault tolerance
of such a system.
While there needs to be one centralized instance which keeps track of the state
of every S-BPM-process, executing subjects (also an Elixir process) may be running
on any available Erlang node in the network. Again, this network may span over company
boundaries.
The advantage of this architecture is that a subject or even a whole S-BPM-process supervisor
is able to crash as long as the state process is being kept intact.
This paradigm of supervisors inside a supervision tree is very common in Elixir applications (see +@fig:supervision-tree).

![The supervision tree of processes](images/print/supervision-tree.pdf){#fig:supervision-tree}

As it was stated earlier, the concurrency model is the same as you can find in an 
SID like in +@fig:legislative, chapter 2. So the agents are sending each other messages
and can execute tasks. A very basic implementation of a Elixir process may look like 
in the following listing:

~~~{.elixir .numberLines caption="A process implemented in Elixir."}
defmodule MyProcess do
  def loop() do
    receive do
      :hello ->
        IO.puts "Hello world"
        loop()
      :gruessgott ->
        IO.puts "Grüß Gott die Dame/der Herr!"
        loop()
      after 30000 ->
        IO.puts "Please send something"
        loop()
    end
  end
end
~~~

A process always executes a function which it constantly loops through. It
waits in the ``receive`` block until it gets a message and then executes the 
according tasks. If you send this process a message containing ``:hello``,
the process will print ``"Hello world"`` and start the process loop again (calling the ``loop()`` function).
Also a timeout is set for thirty seconds, after which the process humbly asks
for some messages.

The usage of this process (``MyProcess``) is illustrated in this interactive Elixir (IEx) session:

~~~{.elixir caption="IEx Session on how to use a process"}
iex> pid = spawn_link(MyProcess, :loop, [])
iex> send(pid, :hello)
"Hello world"
iex> send(pid, :gruesgott)
"Grüß Gott die Dame/der Herr!"
~~~

IEx is, as the name suggests, an interactive shell which lets you execute commands and
is an important development tool, just like in python. Line one spawns a process with 
the module defined before, executing the function with the name ``loop`` and with an
empty list of arguments. The result which is stored in the variable ``pid``, is a
process identifier, which is used to access a process.
Depending on what message you send to a process, the statements assigned to the message are executed.

Every message which is sent to a process, gets stored in its own message pool. If there is no
``receive`` block implemented, which handles the incoming message, the message won't be processed, 
though they can be accessed otherwise.

So a process in Elixir is more than just a way of how to model concurrency. It is the main paradigm on how to build the software and keep state. 

### Nodes {#nodes}

With the Erlang platform, there also comes the feature of Erlang Nodes. An Erlang node
is simply an Erlang VM instance. Nodes can be connected to work together. 
It is a very important part of enabling distributed, scalable and fault tolerant applications.
In conjunction with the paradigm of many small processes, distribution and concurrency are
relatively easy to implement and maintain.



Metaprogramming {#metaprogramming}
--------------------------------------------------------------------------------

Metaprogramming can be simply described as code which writes code [@mccord:2015].
This can be best explained with a short Unix shell script as an example: 

~~~{.bash .numberLines caption="Metaprogram as a Unix shell script"}
    #!/bin/bash
    echo "#!/bin/bash" > program
    for I in $(seq 1337)
    do
      echo "echo $I" >> program
    done
~~~

Definitely this program is not very useful nor does it have a real purpose. But
it is well suited to explain what code writing code means. In this example we
write a bash script, which produces an additional bash script, which represents
the program we want to implement. In this case the metaprogram therefore writes
a script, which will print the numbers from 1 to 1337. It consists exactly of
1338 lines (the first being the typical Unix imperative to use bash as shell interpreter). The result looks like follows:

~~~{.bash caption="\"Compiled\" Unix shell script"}
#!/bin/bash
    echo 1 
    echo 2 
    echo 3 
    [...]
    echo 1337 
~~~

Most programming languages represent the source code internally with an 
AST[^ast]. Jones[-@jones:2003] gives a precise definition of the AST:


> An abstract syntax tree captures the essential structure of the input in
> a tree form, while omitting unnecessary syntactic details. ASTs can be
> distinguished from concrete syntax trees by their omission of tree nodes to
> represent punctuation marks such as semi-colons to terminate statements or
> commas to separate function arguments. ASTs also omit tree nodes that represent
> unary productions in the grammar. Such information is directly represented in
> ASTs by the structure of the tree. ASTs can be created with hand-written parsers
> or by code produced by parser generators. ASTs are generally created
> bottom-up.

An Elixir program can be represented in Elixir's own data structures (e.g.
maps, list, tuples etc.). Therefore it's rather simple to manipulate the
program directly. To transform an Elixir expression into an AST, the key word
`quote`{.elixir language=Elixir} is used (hence the term "quoted expression").
This key word transforms the expression into an Elixir data structure (a tuple)
which can be seen as a textual representation of a tree. The following Elixir
code will explain this further:

~~~{.elixir .numberLines language=Elixir caption="Quoting expressions which directly act on the AST"}
    quote do: 2 + 3
~~~

The return value of this statement is:

~~~{.elixir .numberLines language=Elixir caption="Elixir's way of representing the AST"}
    {:+, [context: Elixir, import: Kernel], [2, 3]}
~~~

As mentioned above, this data structure is a tuple with three elements. The
elements are as follows:

- `:+`{.elixir language=Elixir}: Is the operator which will be used to compute
  both its arguments.
- `[context: Elixir, import: Kernel]`{.elixir language=Elixir}: is itself
  a keyword list with two values. Those values represent metadata for the whole
  expression.
- `[2, 3]`{.elixir language=Elixir}: this is again, a list with two values.
  They represent the arguments which will be handed to the operator.

To be precise, the first value of the three value tuple is not an operator, but
a function which can be found in the `Kernel`{.elixir} module. The
`Kernel`{.elixir} module is the basic module for Elixir which provides the
default macros and functions Elixir imports into the environment
[^source-elixir].

~~~{.elixir .numberLines language=Elixir caption="A more complex statement being quoted"}
quote do: if (2 + 3 == 5), do: IO.puts("2 + 3 = 5")
~~~

~~~{.elixir .numberLines language=Elixir caption="The representation of the AST of a more complex statement"}
{:if, [context: Elixir, import: Kernel],
  [
    {:==, [context: Elixir, import: Kernel],
      [{:+, [context: Elixir, import: Kernel], [2, 3]}, 5]},
    [
      do: {{:., [], [{:__aliases__, [alias: false], [:IO]}, :puts]}, [],
      ["2 + 3 = 5"]}
    ]
 ]
}
~~~

Elixirs macros work differently than for example C/C++ macros, which work with
pure text. Elixir macros on the other hand work on ASTs.



[^phoenix]: http://phoenixframework.org/

[^whatsapp1]: https://www.wired.com/2015/09/whatsapp-serves-900-million-users-50-engineers/

[^whatsapp2]: https://blog.whatsapp.com/196/1-million-is-so-2011

[^whatsapp3]: https://www.fastcompany.com/3026758/inside-erlang-the-rare-programming-language-behind-whatsapps-success

[^whatsapp4]: Presentation of Erlang Solutions at Whatsapp https://www.youtube.com/watch?v=c12cYAUTXXs

[^source-elixir]: Kernel source: <https://github.com/elixir-lang/elixir/blob/master/lib/elixir/lib/kernel.ex>, accessed on 16.08.2017.

[^ast]: Elixir calls Abstract Syntax Trees *"quoted expressions"*. I will
continue to use the term Abstract Syntax Tree, as it is the general term in
academic research.

[^elixir]: In the ongoing text, the term Elixir will be used for
simplification.When *Elixir* is used, this will include Elixir as the
programming language, the Erlang virtual machine as a platform and the Open
Telecom Platform (OTP).

[^elixir-def]: https://elixir-lang.org, accessed on 16.08.2017

[^macros]: transform source code to according code. Making it way more powerful
than textual macros. p56. For example: `if`{.elixir} and `unless`{.elixir} tokens are not part of
the Elixir language construct, but rather implemented with Elixir macros. Macros
are transformed at compile time. 
