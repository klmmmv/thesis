 ASM Tutorial

ASMs are 

> Technically ASMs can be defined as a natural generalization of Finite4 The
> ASM Method State Machines (FSMs) by extending FSM-states to Tarski
> structures. Tarski structures, also called first-order or simply mathematical
> structures, represent truly abstract data types. Therefore, extending the
> special domains of FSM-computations to these structures turns finite state
> machines into abstract state machines [...].

Instead of the FSMs internal control states, which are unstructured (**TODO** what does unstructured mean?)
, ASMs use arbitrarily complex data in its states.


Basically there are three stumbling blocks for a designer of software and/or
hardware engineers, when they want to develope a system:
- size,
- complexity
- and trustworthiness [@boerger:2003, p.1].

The ASM-method is suited for procedural single-agent and for asynchronous
multiple-agent distributed systems.

The method bridges the gap between a human understannding and formulation of
real-world problems and the deployment of their algorithmic solutions
(implementation as a software and/or hardware machine).

The ASM-method enables engineers to 
- develop a *ground model*. The ground model represents a correct and complete
  human-centric task formulation. This is the result of the requirements
  captuure process. It is basically the binding contract between the
  application domain expert (usually the customer) and the system designer
- refine the ground model. Several intermediate models constitute a *hierarchy
  of refined models*.
- link the most detailed specification to generated code which should show that
  the model of the system is correctly solved according to the ground model
  (the contract with the customer)

The ASM-method lets the developer/engineer decide at any given point, which
layer of abstraction he chooses. As any machine can have a function which is
more or less powerful (which resembles the granularity of abstraction).

The most important practical benefit of the ASM-method is to provide a simple
and precise framework to cimmunicate and docment design ideas and a support for
an accurate and checkable overall understanding of complex systems.

ASM-method makes heavy use of pseudo-code. But what does it add to the long
existing method of pseudo-code development? To read and write ASMs no knowledge
of the underlying theory is needed. Though it is the mathematical underpinning
which makes the method work. The ASM-method "complete(s) the longstanding
structural programming endeavour by lifting it from particular machine or
programming notation to truly abstract programming on arbitrary structures".

## ASM Tutorial

ASM also can be understood as framework which integrates the following activities and techniques:

![ASM-based methods and models](../images/asm_models_methods.png)

ASMs are extended Finite State Machines (FSM)

# Wikipedia

As it is stated in [@wiki:fsm] the formal definition of ASMs is a quintuple $(\Sigma ,S,s_{0},\delta ,F)$, where:

- $\Sigma$ is the input alphabet (a finite non-empty set of symbols).
- $S$ is a finite, non-empty set of states.
- $s_{0}$ is an initial state, an element of $S$.
- $\delta$ is the state-transition function: $\delta : S \times \Sigma \rightarrow S$ 
- $F$ is the set of final states, a (possibly empty) subset of $S$.

# S-BPM vs. ASMs

Ad the similarities of the S-BPM and ASMs method

> The method bridges the gap between the human understanding and for-
> mulation of real-world problems and the deployment of their algorithmic
> solutions by code-executing machines on changing platforms [@boerger:2003].

both methods share three concern:

The ground model concern

: blablabla

The refinement concern

: blablabla

The subject-orientation concern

: This means to make the actions of the subjects explicit. Actions in this context means
  the internal (like seen in the SBD) or the external (like seen in the SID) external.

# ASMs vs. FSMs

# ASM Refinements

ASM refinement is the process of gradually transforming the ground model into 
easily understandable pseudo-code which the software engineer is able to put
into compilable code. Therefore it is the opposite of the process of abstraction.

# ASM Design

The design activities consist of three steps [@boerger:asmchar]:

- The ground model construction is a blueprint which captures the initial requirements.
- The model refinement
- Model change is a combination of the former two. 

# ASM Analysis

