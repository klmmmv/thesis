The Virtual Machine Architecture
================================================================================

The idea of a Compiler-Virtual Machine based approach of a Business Process
Execution Platform has first been proposed by Prinz [@prinz:2014 et.al.]. This
approach has been influenced by the idea of a compiler for business processes by
[@koehler:2008]. The basic idea is to close the gap between a business process model
and its digitalized instance of an executable process. Singer [@singer:2016]
enhanced this model by proposing an actor based solution with the philosophy of
S-BPM in mind and also using S-BPM as modeling language. There are several
important reasons which should be mentioned for his decision. 

A way of modeling is needed which enables every participating employee to express his point of view into a
language which can be used to model a process. Furthermore, Singer [@singer:2016] proposes a
general purpose virtual machine for hosting processes without the need of a
heavy weight business process management system (BPMS). For the technical
implementation he chooses the Erlang/Elixir platform, since it has many concepts
concerning concurrency and processes which directly map one to one to S-BPM
modeling techniques and basics of communications between subjects. 

This thesis aims to propose a concept for implementing such a virtual machine for S-BPM processes. Also, 
it especially tries to show how Elixir on top of the Erlang-VM is able to
support this approach, since the implementation depicts a S-BPM process also from a
technically point of view.
How elixirs concepts and features map to S-BPM will be shown in the next [chapter](#technics).

Requirements
--------------------------------------------------------------------------------

Of course, the virtual machine architecture has some prerequisites to fulfill.
Those requirements are - at the same time - the goals and functionalities of business
process management of the architecture. Prinz et al. [@prinz:2015] states the requirements as
it is known in the process life cycle:

1. The process is analyzed, 
2. implemented, 
3. executed, 
4. during its life span it is being monitored and 
5. improved continuously.

Prinz et al. also state, that the biggest lack in today's BPMS is the execution of processes.


From Abstract Syntax Trees to Process Structure Trees
--------------------------------------------------------------------------------

To realize the aforementioned system and guarantee its overall functionality, Prinz et al.
[@prinz:2015] propose an architecture which consists of two main parts: A
compiler and a virtual machine, as it can be seen in +@fig:compiler-engine .

![A compiler engine overview [@prinz:2015]](images/print/architecture.pdf){#fig:compiler-engine}

This figure consists of three main parts:

- A unified intermediate representation (IR),

- a verifying compiler which is able to transform the input (in the form of a
  process model) into the IR,

- a process-engine which represents the virtual machine and is able to
  directly instantiate processes from the IR.

Though Prinz et al. [@prinz:2015] add, that the whole system consists of four subsystems for implementing
a "general overall BPM system". The last subsystem is an error handler,
which detects errors in process models and proposes corrections if possible.

The IR is known from compiler theory and used for several reasons. It acts as an
intermediate source code, a code which is programming language and architecture agnostic.
The purpose will be discussed later on in this chapter. So far, it is important to keep in mind
that the IR is intended to share the correct meaning of a program in a more abstract
and interoperable format.

It can be questioned if the phrases "compiler" and "virtual machine" are well
fitted to describe the system. Let us first look at the compiler side. 

[@prinz:2014] et al. call the two main sides --- the IR is placed at the exact border between both sides ---
the producer and consumer side. In compiler theory those terms equal to frontend and backend.


In Prinz' and Singer's proposal and refinements, there is a compiler-like application which
parses, transforms and semantically analyzes the given process model, which does
not resemble a complete and proper compiler. Though conventionally, a compiler is composed of
two main phases which can be differentiated into several other phases
[see @grundlagen]: The analysis and the synthesis. While the analytical
phase (usually also known as the compiler-frontend) consists of a lexical,
syntactic and semantic analysis, the second phase (compiler-backend) consists of
an intermediate code generator a code optimizer and a final code generator. The
overall structure can be seen in +@fig:compiler 

![One way of a conventional compiler.](images/print/compiler.pdf){#fig:compiler}

This typical design has some major disadvantages though. If you want to support
several source languages on several platforms, you would need $n * m$ ($n$ being the amount of
source languages and $m$ the amount of target architectures) compilers.
Of course, many proprietary developers do not need to apply to that circumstances, if they
choose not to, depending on their business model. But especially in Free and 
Open Source Software (FOSS) a different approach is needed. Not only for
interoperability, but also because of resources. Software developers are 
only experts in one specific programming language and have no expertise in CPU
architecture design and instruction sets. Or the opposite of that.
For this reason, it becomes obvious that another approach should be used. This is done
by introducing an IR of programming languages, just like stated before.

In the case of programming language that is the Abstract Syntax Tree (AST). In [chapter 5](#metaprogramming) 
the concept and the specific representation of the AST will explained, as Elixir is very verbose 
about its implementation. Prinz et al. [@prinz:2014] in contrast, 
calls the analogous form in a BPM environment the Process Structure Tree. So the IR is a 
more abstract term for the correct and complete representation of an algorithm or process.

The LLVM project uses such an architecture for the whole LLVM framework. It consists of many low 
level libraries for compiling from different languages to different architectures [@llvm]. This is
crucial for an open development process, where many developers want to implement new programming languages
on many platforms.
The whole LLVM architecture consists of three main phases (see +@fig:retargetable-compiler). 
Besides the frontend and backend, there is also a middleend which usually implements
an optimization process of the IR. For example, getting rid of redundant computations.

![The three phase compiler concept like used in the llvm project](images/print/retargetable_compiler.pdf){#fig:retargetable-compiler}

## Frontend for the architecture

Within a project developed at the FH Joanneum Graz, a web application has been implemented, which 
makes it possible to build process models with the S-BPM language.[^github-modeler] The end product of
the model is an ontology (owl file, see subsection [Ontologies](#ontology)) which represents the process.

The application enables one to have different accounts, 
each with his own storage of processes, group similar processes and import and export
processes from/to OWL files. The modeler has a SID- (see +@fig:modeler-sid-view) and SBD- (see +@fig:modeler-sbd-view)
view which can be seen in the following figures:

![The SID view of a process in the modeler.](images/modeler_sid_view.png){#fig:modeler-sid-view}

![The SBD view of a process in the modeler.](images/modeler_sbd_view.png){#fig:modeler-sbd-view}


[^github-modeler]: The initial project can be cloned from this repository:
  https://github.com/stefanstaniAIM/IPPR2016 . A newer version has also been
  developed and can be accessed at: https://github.com/mkolodiy/s-bpm-modeler .
  The version used for this thesis was the latter one.

## The Middleend - an intermediate Representation with Ontologies {#ontology}

Since the processes need to be shared over networks and/or organisation
boundaries, a standardized way of representing a process needs to be
established. This is not only a technical, but also a logical necessity, which is why
S-BPM defines that subjects can be internal or external (concerning the context
in the organisation). The semantics of those subjects and therefore the way of
how they integrate in a process need to be expressed precisely. Further
standardized models improve interoperability between different execution
engines or other systems for process execution. 

For the compiler based virtual machine for S-BPM processes there is a need of an intermediate representation (IR)
of processes. As there are many modeling tools for business processes, each using its own format, interoperability
is a necessity.
The IR needs to be able to correctly describe the process model in an application and platform agnostic way. The
subjects, its actions, the communication among the subjects and the message types (along with the business objects),
have to be reflected in process description in such a way that the IR depicts the intentional meaning of the process.
In 2014, Höver et al. [@hoever] first proposed to use ontologies for that matter. 

Ontology is a term lent from philosophy, which describes the classification, relation and arrangement of everything there is.
In computer science it has been used to describe certain things and their relations in knowledge-based systems.
As [@gruber] notes precisely:

> An ontology is a specification of a conceptualization.

Where conceptualization means a simplification of something (which possibly may exist in the real world)
we are interested in. He Further states:

> This set of objects [which we are interested in],
> and the describable relationships among them, are reflected in the representational
> vocabulary with which a knowledge-based program represents knowledge. Thus, we
> can describe the ontology of a program by defining a set of representational terms. In
> such an ontology, definitions associate the names of entities in the universe of discourse
> (e.g., classes, relations, functions, or other objects) with human-readable text describing
> what the names are meant to denote, and formal axioms that constrain the
> interpretation and well-formed use of these terms.

Thus, ontologies make it possible to express facts about things and make logical sentences
about them. Or to phrase it differently "an ontology defines terms with which to 
represent knowledge"[@gruber]. 

Höver et al. [@hoever] used the Web Ontology Language(OWL)[^owl] as an ontology description language for S-BPM processes.
When we look at the methodology of how to create an own ontology, the purpose and understanding of this
knowledge representation becomes more clear.
There are several steps which have to be followed[@ontmethod]:

1. determine the domain and scope of the ontology,
2. consider reusing existing ontologies,
3. enumeration of important terms,
4. define classes and the class hierarchy,
5. define the properties of the classes,
6. define constraints,
7. create instances. 

[^owl]: The recent specification for OWL can be found at: https://www.w3.org/TR/owl2-overview/ .

By asking all those questions, or follow the steps, we can see how the concept of ontologies
are appropriate to describe a business process. The first two steps are more a technical guidance
than an epistemological, in terms of the understanding of a process and if it is described in a correct
and complete way.

In accordance to the above method, [@hoever] et al. define the following terms:

- subject,
- business object,
- message,
- sending (a message),
- receiving (a message),
- (performing) internal actions,
- behaviour,
- exit condition,
- input pool and
- size (of input pools).

The class hierarchy with all its relations can be seen in +@fig:hierarchy. 

![Class hierarchy of the S-BPM ontology [@hoever]](images/print/class_hierarchy.pdf){#fig:hierarchy}

## Combining S-BPM, ASMs and the VM Architecture

After introducing S-BPM, the ASM method and the concept of a compiler based virtual machine for business processes,
we can combine those concepts and illustrate it as a architecture implementation proposal with the Erlang platform in mind. 

![Overview of the Process VM-architecture concerning the technical implementation with Erlang](images/print/virtual-machine-architecture1.pdf){#fig:vmarchitecture}

