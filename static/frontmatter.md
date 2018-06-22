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

------   -----------------------------------------------------------------------
ASM      Abstract State Machine
BPM      Business Process Management                                         
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
------   -----------------------------------------------------------------------





Abstract
================================================================================

Business process management still faces a lot of problems, like the automatized
execution of already modeled processes.
In recent research a call for research towards a compiler based virtual machine
architecture for business processes was made. A general concept has already been developed
and is being inspected in this work. Further an interdisciplinary research of the crucial
foundations for this architecture is presented.
For the automatized execution the Abstract State Machine (ASM) method is being exhibited
thoroughly, as it is a way to execute algorithms and therefore business processes
in a formal way. ASMs also enable distributed execution of processes, by using multi-agent
ASMs.

The thesis also provides a concept on how to implement such a distributed process
across IT infrastructure and therefore business boundaries. For the execution
a quite new programming language, called Elixir, is being used which runs
on the Erlang platform. The platform is very promising for being used at the
VM backend.

Though ASMs can be used at the frontend, middleend and backend of the VM architecture,
this thesis proposes to only use it in the backend. Empirical studies have to be
made on the usage of ASMs.


Kurzfassung
================================================================================

Occaecati neque nostrum ratione aperiam ea quia culpa. Est blanditiis aut nostrum rerum expedita voluptatibus explicabo. Possimus et ea rem impedit mollitia. Rerum quo totam aut porro pariatur. Est eveniet et suscipit est perferendis quia. Et maiores beatae occaecati nulla est quo sequi.
Quas deserunt sint assumenda est et quo voluptatum. Doloremque a cumque consequatur a labore. Eos quae aut praesentium iusto accusantium.
A doloremque dolor eum aspernatur sunt nobis. Quibusdam perferendis dolorum laudantium odio expedita aliquid. Voluptas expedita ullam itaque nesciunt nisi itaque architecto. Dolore expedita vero sit porro aut.
Quae accusantium est laborum laborum animi. Natus atque quas cum incidunt est praesentium possimus. Rerum laborum non fuga deleniti voluptas eius quo. Voluptas qui sunt ex et. Totam expedita quo ab ut aut iure odio. Dicta est sit itaque sunt distinctio dignissimos eligendi velit.
Facilis ipsa voluptatem earum cumque. Rem libero maxime praesentium quam et. Magnam provident consequatur nulla est sapiente voluptatem autem molestias. Quibusdam impedit explicabo nemo soluta voluptas. Quis et eos saepe ea dolorem beatae. Animi consectetur nihil sunt.

\mainmatter
