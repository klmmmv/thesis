# Discussion and Future Work

Prinz et al. [@prinz:2014] call business process management "an unfinished
patchwork" when looking at the business process lifecycle. Therefore a unified system is crucial for supporting BPM.
This has lead to the idea of a compiler based virtual machine architecture for
business IT systems. Where the compiler is responsible for detecting the
syntactical and semantic errors and the virtual machine provides an environment for
executing business processes.

Compiler theory and virtual machines are complex concepts and the terms should
not be used light hearted. This thesis showed that the virtual machine part
can actually be called a virtual machine. This was proven by examining the concept
of ASMs. The part of the compiler --- as a whole --- is still open for discussion
and more in depth research.

ASMs are not only a way to develop hard- and software systems
but as we have seen also business processes. They have the capability
to be used as a graphical tool to model processes, but also describe them
in a textual format which is interchangeable across different platforms.
Further, as they are a mathematically formalized automaton, like known from
automata theory, they represent a virtual machine for any abstract algorithm.
Because of that, they are a good way to also execute the processes.

As business processes are of distributed, parallel and concurrent nature 
a way of handling this behaviour has been introduced by enhancing basic 
ASMs to multi-agent ASMs. By using them for the execution also a mapping
of the understanding of S-BPM processes to the multi-agent ASMs can be made
and understanding the one concept, means to also understand the other one.

Though the capabilities of ASMs of being used in the frontend, the middleend (or the IR)
and the backend have been shown, there is also some criticism if ASMs
are a good tool for every employee with different scientific background
and skills. As Reisig [@reisig] has experienced a lot of difficulties with his
students understanding and learning ASMs correctly.
Additionally the frontend and middleend already have a good foundation in research
in contrast to the execution.

To implement the virtual machine part of the compiler based architecture
the Elixir programming language on top of the Erlang platform has been inspected.
The advantage of using Elixir is to translate a subject (in S-BPM terms) to 
agents (concerning ASMs) and eventually to an Elixir process. 
The process and therefore the subject is able to run on any Erlang node which
may span over different companies and networks. Enabling a truly distributed
process execution.
The way how Elixir handles its processes is also its key factor to scaling
an application horizontally and vertically. So an application is able to 
profit from additional CPU cores and also from additional machines
without any further development costs.

Though a first look on the metaprogramming capabilities of Elixir looked promising
to be used in the architecture, the fact that the translation of makros happens
at compile time negates the advantages. The virtual machine should be able
to compile a business process into an executable process during run time.

When José Valim developed Elixir, metaprogramming
was intended to be used to make the programming language extendable to insure
a long life of the platform and to enable developers to easily implement
domain specific languages.

## Future Work

The idea of the compiler based virtual machine architecture is a interdisciplinary
concept and there are many question yet to be answered. When we look at the phases
of compiler theory, the phase of optimization of business processes in their compiled
format is still unexplored. Research has to tackle the question if and how the
optimization of computer programs can be translated to business processes.

Another phase which hasn't been handled so far is the linking phase. Again, 
we do not know yet if and how linking in the realms of BPM may look.

Concerning ASMs, the next step would be to develop a multi-agent ASM which is able to
execute business processes according to the IR which is used as input. This is a 
necessity for making business processes distributed. This ASM could then be used as
a specification to implement the VM architecture on other platforms than Elixir.

With the feature of Erlang nodes, it is theoretically possible to run a process
on any instance of Erlang. The nerves project, which provides linux images with
elixir for embedded systems, makes it also interesting to be used in many
different industry areas. It could be interesting to examine those capabilities
and test if this features withstands real world scenarios.

