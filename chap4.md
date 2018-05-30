The Virtual Machine Architecture
================================================================================

The idea of a Compiler-Virtual Machine based approach of a Business Process
Execution Platform has been first proposed by Prinz [@prinz:2014 et.al.]. This
approach has been influenced by the idea of a compiler for business processes by
[@koehler:2008].The basic idea is to close the gap between a business process model
and its digitalized instance of an executable process. But [@singer:2016]
enhanced this model by proposing an actor based solution with the philosophy of
S-BPM in mind and also using S-BPM as modeling language. There are several
important reasons which should be mentioned for his decision. 

First there seems to be a large gap between theory, academic research and
practice [TODO citation needed]. Therefore a way of modeling is needed which
enables every participating employee to express his point of view into a
language which can be used to model a process. Furthermore [@singer:2016] proposes a
general purpose virtual machine for hosting processes without the need of a
heavy weight business process management system (BPMS). For the technical
implementation he chooses the Erlang/Elixir platform, as it has many concepts
concerning concurrency and processes which directly map one to one to S-BPM
modeling techniques and basics of communications between subjects. 

This thesis aims to implement such a virtual machine for S-BPM processes. Also
it especially tries to show, how Elixir on top of the Erlang-VM is able to
support this approach. As the implementation depicts a S-BPM process also from a
technically point of view.

Requirements
--------------------------------------------------------------------------------

Of course the virtual machine architecture has some prerequisites to fulfill.
Those requirements are- at the same time- the goals and functionalities of business
process management of the architecture. [@prinz:2015] states the Requirements as
it is know typically in the process life cycle:

1. The process is analyzed, 
2. implemented, 
3. executed, 
4. during its life span it is being monitored and 
5. improved continuously.

A general approach
--------------------------------------------------------------------------------

To realize the aforementioned system and guarantee its overall functionality,
[@prinz:2014] proposes an architecture which consists of two main parts. A
compiler and a virtual machine, as it can be seen in +@fig:compiler-engine .

![A compiler engine overview [@prinz:2015]](images/compiler-engine.png){#fig:compiler-engine}

This figure consists of three main parts:

- An unified intermediate representation (IR),

- a verifying compiler which is able to transform the input (in the form of a
  process model) into the IR,

- a process-engine which represents the virtual machine, and is able to
  directly instantiate processes from the IR.

It can questioned if the phrases "compiler" and "virtual machine" are well
fitted to describe the system. Lets first look at the compiler side. In Prinz'
and Singers proposal and refinements, there is a compiler-like application which
parses, transforms and semantically analyzes the given process model. Which does
not resemble a complete and proper compiler. Though, a compiler is composed of
two main phases which can be differentiated into several other phases
[see @grundlagen]: The analysis and the synthesis. While the analytical
phase(usually also known as the compiler-frontend) consists of a lexical,
syntactic and semantic analysis. The second phase (compiler-backend) consists of
an intermediate code generator an code optimizer and a final code generator. The
overall structure can be seen in +@fig:compiler 

![compiler](images/compiler.png){#fig:compiler #id .class width=462px height=345px}

Specifics for a S-BPM virtual machine
--------------------------------------------------------------------------------

***TODO:*** add a node repository

![Overview of the Process VM-architecture concerning the technical implementation with Erlang](images/vmarchitektur.png){#fig:vmarchitecture}

Interfaces for human workers and IT systems
--------------------------------------------------------------------------------

What are humans possible to do with it

How can IT systems interact with it

How can this represent IoT

## The intermediate representation with ontologies

As the processes need to be shared over networks and/or organisation
boundaries, a standardized way of representing a process needs to be
established. This is not only a technical, but also a logical necessity. As
S-BPM defines that subjects can be internal or external (concerning the context
in the organisation), the semantics of those subjects and therefore the way of
how the integrate in a process, need to be expressed precisely. Further
standardized models improve interoperability between different execution
engines or other systems for process execution. 

For the compiler based virtual machine for S-BPM processes there is a need of an intermediate representation (IR)
of processes. As there are many modeling tools for business processes, each using its own format, interoperability
must is the goal of such an IR.
The IR needs to be able to correctly describe the process model in an application and platform agnostic way. The
subjects, its actions, the communication among the subjects and the message types (along with the business objects),
have to be reflected in process description in such a way, that the IR depicts the intentional meaning of the process.
In 2014 [@hoever] et alii first proposed to use ontologies for that matter. 

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

So ontologies make it possible, to express facts about things and make logical sentences
about them. Or to put it in different words "an ontology defines terms with which to 
represent knowledge"[@gruber]. 

[@hoever] et alii used the Web Ontology Language(OWL)[^owl] as an ontology description language for S-BPM processes.
When we look at the methodology of how to create an own ontology, the purpose and understanding of this
knowledge representation becomes more clear.
There are several steps which have to be followed:

1. determine the domain and scope of the ontology,
2. consider reusing existing ontologies,
3. enumeration important terms,
4. define classes and the class hierarchy,
5. define the properties of the classes,
6. define constraints,
7. create instances [@ontmethod]

[^owl]: The recent specification for OWL can be found at: https://www.w3.org/TR/owl2-overview/ .

In accordance to the above method, [@hoever] et alii define the following terms:

- subject,
- business object,
- message,
- sending (a message),
- receiving (a mesage),
- (performing) internal actions,
- behaviour,
- exit condition,
- input pool and
- size (of input pools).


