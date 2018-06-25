\frontmatter

Ehrenwörtliche Erklärung
================================================================================

Ich erkläre ehrenwörtlich, dass ich die vorliegende Masterarbeit selbstständig angefertigt
und die mit ihr verbundenen Tätigkeiten selbst erbracht habe. Ich erkläre weiters, dass ich keine
anderen als die angegebenen Hilfsmittel benutzt habe. Alle ausgedruckten, ungedruckten
oder dem Internet im Wortlaut oder im wesentlichen Inhalt übernommenen Formulierungen
und Konzepte sind gemäß den Regeln für gutes wissenschaftliches Arbeiten
zitiert und durch Fußnoten bzw. durch andere genaue Quellenangaben gekennzeichnet.

Die vorliegene Originalarbeit ist in dieser Form zur Erreichung eines akademischen Grades noch keiner
anderen Hochschule vorgelegt worden. Diese Arbeit wurde in gedruckter und elektronischer Form
abgegeben. Ich bestätige, dass der Inhalt der digitalen Version vollständig mit dem der gedruckten
Version übereinstimmt.

Ich bin mir bewusst, dass eine falsche Erkärung rechtliche Folgen haben kann.

\vspace{3cm}

\begin{tabular*}{14.5cm}{@{\extracolsep{\fill}}>{\raggedright}p{5cm}>{\centering}p{4.4cm}>{\centering}p{5cm}}
Graz, 22.06.2018 &  & \tabularnewline \cline{3-3} &  & Michael Valentin Klammer \tabularnewline \end{tabular*}

\listoffigures
\listoftables
\lstlistoflistings


Abbreviations
================================================================================

-------- -----------------------------------------------------------------------
ASM      Abstract State Machine
BPEL     Busines Process Execution Language
BPM      Business Process Management                                         
BPM CBOK Busines Process Management Common Body of Knowledge
BPMN     Business Process Model and Notation                                 
BPMS     Business Process Management System                                  
DBMS     Database Management Systems
FOSS     Free and Open Source Software
IR       Intermediate Representation                                         
IoT      Internet of Things
JVM      Java Virtual Machine
OTP      Open Telecom Platform                                               
PASS     Parallel Activity Specification Schema
PST      Process Structure Tree
S-BPM    Subject-oriented Business Process Management                        
SBD      Subject Behaviour Diagram                                           
SID      Subject Interaction Diagram                                         
VHDL     VHSIC Hardware Description Language
-------- -----------------------------------------------------------------------







Abstract
================================================================================

Business process management still faces a lot of problems, such as the automatized
execution of already modeled processes.
In recent literature a call for research towards a compiler based virtual machine
architecture for business processes was made. A general concept has already been developed
and is being inspected in this work. Furthermore, an interdisciplinary research of the crucial
foundations for this architecture is presented.
For the automatized execution the Abstract State Machine (ASM) method is being exhibited
thoroughly, as it is a way to execute algorithms and therefore business processes
in a formal way. ASMs also enable distributed execution of processes by using multi-agent
ASMs.

The thesis provides a concept on how to implement such a distributed process
across IT infrastructure and thus business boundaries. For the execution,
a quite new programming language, called Elixir, is being used which runs
on the Erlang platform. The platform is very promising for being used at the
VM backend.

Concerning the use of ASM, which is applicable for the frontend as well as the middle end and backend, this thesis, however, proposes to only use it in the backend. 

Kurzfassung
================================================================================

Geschäftsprozessmanagement hat noch einige offene Baustellen, besonders bei der Ausführung
von Prozessen, wenn man den Prozesslebenszyklus betrachtet. Deshalb wurde in wissenschaftlichen
Arbeiten nach einem einheitlichen System für das Management gesucht. Es wurde die Idee
einer Compiler basierten virtuellen Maschine für Geschäftsprozesse entwickelt. Da dies eine
interdisziplinäre Aufgabe darstellt und die Idee recht neu is, gibt es noch keine fertigen Softwarelösungen.

Diese Diplomarbeit zeigt wie man anhand von abstrakten Automaten Geschäftsprozesse ausführen kann.
Die Methode ermöglicht es einem Algorithmen auf eine formale Art auszuführen. Zusätzlich gibt
es erweitere abstrakte Automaten mit denen man verteilte Systeme entwickeln kann.

Weiters wurde recherchiert wie die Elixir-Plattform, eine recht neue Programmiersprache, für diesen
Zweck geeignet ist. 

\mainmatter

