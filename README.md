README
================================================================================

Prerequisites:
- install [pandoc](http://pandoc.org)
- install latex with lualatex engine
- install pandoc filter:
  ~~~.bash
  pip install pandoc-fignos pandoc-tablenos
  ~~~
- download this repository and execute topdf
  ~~~.bash
  chmod +x topdf
  ./topdf
  ~~~

Understanding this repository
--------------------------------------------------------------------------------

This repository is my master thesis at the FH Joanneum for getting a master of science.
It should be used as a reference for writing scientific papers with only using the
markdown standard ([pandocs own markdown](http://pandoc.org/MANUAL.html#pandocs-markdown)
and pandoc (a conversion tool for a lot of input and output formats).

### Crucial parts

The most important parts of this repository are used for compiling a pdf to make a printable
document. For this the following files and directories must be used:

- **header.tex**: If you need additional latex packages, that is the file to setup your paper.
  For example, I used it to setup the formatting of my elixir listings.
- **frontmatter.md**: As the name suggests, this file is used to write your frontmatter.
  Abstract, Legal information and so on. Each section will be displayed in the list of contents.
  The pages of the frontmatter will be enumerated with roman numerals.
- **chapX.md** files: Those are the individual files for each chapter of the paper.
  Put your content in them.
- **bib.bib**: For referencing your sources. For different citation formats, have a look at the 
  pandoc documentation.
- **topdf**: This is the little bash script, which executes pandoc and compiles the markdown files
  to a pdf file. The commands should be analogous to windows command and macosx command prompts.

Those are the mandatory files to use. If you want to also publish your paper in html and/or
epub format, have a look at the **topdf** script and uncomment the according commands.
The rest of the repository should be understandable. the **epub/** directory is used for 
configuring your metadata for an epub publication. The **html/** directory only contains a
conservative stylesheet.

When you execute the **topdf** script, an **output/** directory is being created with all the 
necessary files for publishing your paper. The pdf, the epub and all the files for a 
complete html site.

Citation
--------------------------------------------------------------------------------

If you want to use a different citation style, alter the `--csl` option in the
`topdf` script. You can download all different kinds of csls from
[here](https://github.com/citation-style-language/styles)
