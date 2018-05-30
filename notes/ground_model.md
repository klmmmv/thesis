Gap between users understanding of BP and their technical run behaviour
advantage: certifiable correct BPMs

The ground model problem 
: BP are designed by Domain experts  in natural
  language, heavily supported by tables, graphics diagrams and so on. Software
  developers need to put that usually ambiduous, incomplete or inconsistent
  specification into *code* "The question is how to link "informal" requirements
  documents to necessarily formalized executable code[...] in a way to guarantee
  that the code does what the requirements describe."

The link between requirements and current implementation (in code) must be kept
up to date, and change upon requirements change.

The ground model needs to be correct, complete and consistent. Therefore the
three typical problems of software development also occur when developing
ground models (also called the CVV-problems):

- the communication problem: a language which software designers and domain
  experts can use to understand each other
- the verification method problem: 
- the validation problem: 

"faithfully reflect changing requirements and to document their provably
correct implementation in a transparent way."

Every ground model has to have three semantical model characteristics:

- Completeness
- Consistency: possibly conflicting objectives need to resolved
- Correctness

A ground model operates on an application model and therefore has nothing to do
with the software implementation. The concentration lies on domain issues
instead of issues of notation. This implies that the ground model has to come
with a general data model, general function model and a genreal interface
definition, along with state based system behaviour including non-determinism
and concurrency.

A ground model has to provide some form of evidence of correctness

A ground model has no purely mathematical definition , its purpose is to
translate a piece of "reality" to a linguistic description. 

Two main parties are involve in system engineering: Domain experts and system
designers.

A complete ASM model is defined as follows 
: it consists of its rules together
  with a definition of its signature and a list of all assumptions made on the
  environment. The signature is a collection of data types, which defines the
  notion of machine states.
  Also the underlying timing constraints, the data types, the class of exceptions, 
  but also the computing resources, the users, etc.

ASMs interpreted intuitively can be seen as a virtual machine executing pseudo-code operating on abstract data structures [asmbook, Sect. 2.4]

Events
: are arbitrary conditions

Actions
: are sets of *Updates* of arbitrary memory locations, which can be paremeterized.
  The parameters are of arbitrary type.

Memore location in Finite State Machines (FSM) are the *in*, *out* and *ctl_state* variables.
In ASMs they are of arbitrary expessions of arbitrary types



The role of a system blueprint (ground model) is to capture changing requirements.
The ground model is represented by documentation which is understandable and checkable
by both, the system designer and the domain expert [@boerger:tutorial]
In this context, understandability means that everyone speaks the same language when 
developing the ground model and reading the formulated output.
Checkability means that the documented ground model reflects the intentional working of the 
designed system. It also includes the possibility for use cases to falsify the ASM ground model

