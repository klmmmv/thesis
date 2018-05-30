# Metaprogramming
Metaprogramming can be simply described as code which writes code [@smith2010].
This can be best described with a short Unix shell script as an example: 

~~~bash
#!/bin/bash
echo I in $(seq 1337) > program
do
  echo "echo $I" >> program
done
~~~

Definately this program is not very useful nor does it have a real purpose. But
it is well suited to explain what code writing code means. In this example we
write a bash script, which produces an additional bash script, which represents
the program we want to implement. In this caste the metaprogram therefore writes
a script, which will print the numbers from 1 to 1337. It consists exactly of
1337 lines. The result looks like follows:

~~~bash 
echo 1 
echo 2 
echo 3 
... 
echo 1337 
~~~

Most programming languages represent the source code internally with an Abstract Syntax Tree (AST)[^ast].
Jones[-@jones2003] gives a precise defintion of the AST :

> An abstract syntax tree (AST) captures the essential structure of the input in
> a tree form, while omitting unnecessary syntactic details. ASTs can be
> distinguished from concrete syntax trees by their omission of tree nodes to
> represent punctuation marks such as semi-colons to terminate statements or
> commas to separate function arguments. ASTs also omit tree nodes that represent
> unary productions in the grammar. Such information is directly represented in
> ASTs by the structure of the tree. ASTs can be created with hand-written parsers
> or by code produced by parser generators. ASTs are generally created
bottom-up.

An Elixir program can be represented in Elixir's own data structures (e.g. maps,
list, tuples etc.). Therefore it's rather simple to directly manipulate the
program directly. 

Elixirs macros work differently than for example C/C++ macros, which work with
pure text. Elixir macros on the other hand work on ASTs.

[^ast]: Elixir calls Abstract Syntax Trees *"quoted expressions"*. I will
continue to use the term Abstract Syntax Tree, as it is the general term in
academic research.

[^macros]: transform source code to according code. Making it way more powerful
than textual macros. p56. For example: `if` and `unless` tokens are not part of
the Elixir language construct, but rather implemented with Elixir macros. Macros
are transformed at compile time. 
