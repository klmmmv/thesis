Introduction 
================================================================================

Every organization --- may it be a public institution or a commercial business --- has a certain amount of business processes. Those processes use the
resources of said organization and produce an output which is of interest for
its customers. These processes exist with, or without some form of management. 

Taylor [@taylor] established scientific management and with it the insight,
that business processes need to be monitored and managed. The goal of
scientific management since then has been to evaluate flaws in the workflow of
employees and further increase the overall efficiency of an organization.

The current state of Business Process Management (BPM) shows that companies are
not fully satisfied [@olbrich:2010]. BPM has been a time intensive and costly
process in modern companies since the shift to a post-fordism management era.
This is characterized by the rise of the knowledge worker and new
information technology systems. Therefore, modeling processes can become
a complex topic. 
As a process represents different states common modeling
languages like Business Process Model and Notation (BPMN) encourage
modeling complex processes. But also the general approach of defining every
state in a process, is unlikely to represent real world scenarios. All in all,
there will never be a complete process model which will implement states for every
possible occurrence in real life. So the point of view of common business
process modeling languages are the executed functions (**TODO** explain, function = specific work task). This stimulates
overengineering of processes. While also the use of heavy weight modeling
languages makes process engineers to overcomplicate processes.

The aforementioned problems lead to a need of highly trained business
engineers, who are capable of reading and modeling those complex processes. It
is obvious that this situation increases costs and further complexity to the
organization. In addition, if errors in the model are identified by a worker,
he has to consolidate the business engineer to re-model the process. This again
is time consuming and therefore increases costs for the business.

There seems to be a large gap between theory, academic research and
practice [TODO citation needed]. Therefore a way of modeling is needed which
enables every participating employee to express his point of view into a
language which can be used to model a process.

An ideal Business Process Management System (BPMS) for modeling and maintaining
processes would enable workers to improve, enhance or correct a process by
themselves. Further it should be able to equally execute an improved process by them.

Subject-oriented business process management(S-BPM) takes a different approach
than, for example, BPMN by putting the subjects in the center of modeling.
Subjects are either technological systems or workers, so the actual entities
which produce work and value for the business. This approach emphasizes that
employees usually know best how to execute tasks. They are aware of the
different entities which participate in a process. Further they know how to
communicate with those entities. The exchange of messages between those
subjects, or entities, is another principal in S-BPM.

Prinz [@prinz:2014] proposed a general purpose virtual machine architecture for
hosting processes without the need of heavy weight BPMS. The purpose of this
system is, to be able to automatically execute a business process, where the
only input is the business process model. Singer [@singer:2016] took this
approach and created a concept to use this architecture with S-BPM in mind
specifically and explained how such a software could be realized. The
advantages of this, is to enable the workers to enhance a process and
immediately let them execute the improved process. Ideally without the need of a process engineer.

For the technical implementation Singer chooses the Elixir/Erlang platform, as
it has many concepts concerning concurrency and processes which directly map
one to one to S-BPM modeling techniques and basics of communications between
subjects. 

This thesis aims to implement such a virtual machine for S-BPM processes. It especially tries to show, how Elixir on top of the Erlang-VM is able to
support this approach. 

As Singer also proposed to use metaprogramming--- which Elixir is capable of---
to compile a business process from its model into an executable program, this
thesis will evaluate this method. The goal is to let Elixir write source code based on the model and compile it into a single application. This application would represent a business process on a technical level.

The first chapter sets the theoretical background, by explaining and examining
the parts of S-BPM which are essential to understand the problem. Essential
language constructs, important for modeling and understanding of a S-BPM process
models, will be explained. 

The second chapter explains the complete architecture of the compiler based
virtual machine, which has been proposed in recent academic research. This
chapter will explain the architecture from a logical point of view.

In the third chapter the implementation with Elixir will be explained. As the
concurrency model of Elixir is based on the same mathematical calculi as S-BPM
itself, this approach is very promising. Elixir makes it possible to easily
execute an applications threads on several Elixir nodes, which can be spanned
over different computer networks. This is important, as business processes can
involve not only many different employees and workers, but also more than one
organization with its own network. 

Because of those features of Elixir and the Erlang platform, this technology
seems to be well suited for the implementation of an Internet of Things (IoT)
use case. As IoT can also be seen as a business process which connects several
computers which collectively fulfill a task.


