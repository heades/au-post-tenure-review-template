# SCCS Post-Tenure Review Template

This is a markdown, using Pandoc, GNU Make, and Bash, template for post-tenure
reviews in the School of Computer and Cyber Sciences at Augusta University.

Simply fill out the files in `markdown` and run `make`. Each markdown file is
compiled using Pandoc into a PDF in the `packet` directory (which will be
created the first time you run `make`).

There is a TODO list to help you manage your packet creation in `TODO.md`. 

The `layouts` directory contains the templates that are used to generate each
PDF. If you would like to create a custom template for a particular part of the
packet then simply make a copy of the `layouts/default.tex` template and modify
it. Make sure to name the template the same name as the markdown file, but with
a LaTeX extension. The compilation process will automatically use the new
layout. 