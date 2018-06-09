A complete ASM model is defined as follows 
: it consists of its rules together
  with a definition of its signature and a list of all assumptions made on the
  environment. The signature is a collection of data types, which defines the
  notion of machine states.
  Also the underlying timing constraints, the data types, the class of exceptions, 
  but also the computing resources, the users, etc.

Events
: Are arbitrary conditions. An event changes the value of at least one guard/condition

Actions
: are sets of *Updates* of arbitrary memory locations, which can be paremeterized.
  The parameters are of arbitrary type.


Memory location in Finite State Machines (FSM) are the *in*, *out* and *ctl_state* variables.
In ASMs they are of arbitrary expressions of arbitrary types.
