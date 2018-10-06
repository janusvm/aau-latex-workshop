# LaTeX Workshop

Lecturer's notes for a LaTeX workshop arranged for first year TEK-NAT students at Aalborg University.
Its purpose is to teach the students how to write semester projects with LaTeX.


## Overview

- What *is* LaTeX
- Why use LaTeX (instead of e.g. MS Word)?
- Understanding the purpose of the LaTeX programs
  - `pdflatex`
  - `bibtex`
  - `latexmk`
- Building documents using the programs directly from the command line
- Building documents from a graphical editor
- Words of advice

---

## What is LaTeX?

> LaTeX is a high-quality typesetting system; it includes features designed for the production of technical and scientific documentation. LaTeX is the de facto standard for the communication and publication of scientific documents.

You may think of LaTeX as a programming language specialised for creating documents.
Instead of writing text, which you then highlight and click buttons to format (WYSIWYG), you write commands to instruct the *compiler* how to typeset your text.

Like with many other programming languages, LaTeX is available in several different forms, called *distributions*.
A LaTeX distribution will package the


## Why LaTeX?

Why would you want to use LaTeX instead of something like MS Word?
For several reasons:

- LaTeX easily handles large documents divided into multiple files
- LaTeX gives you a lot of control over the looks of your document
- LaTeX typesets math beautifully and easily
- LaTeX is free
- LaTeX is backwards compatible
- LaTeX handles sectioning, numbering, etc. seamlessly
- LaTeX handles cross references and citations
- LaTeX documents are consistent
- LaTeX is not restricted to a specific editor
- LaTeX documents are easily kept under version control


## The most common LaTeX programs

`pdflatex` is the program that you will be using most often.
It generates a PDF file based on your source code.

`bibtex` is a program for handling citations.
It enables you to have an automatic literature list in your document based on a database of sources.

`latexmk` is a Perl script for automating complex document compilation.
Often, you have to run `pdflatex`, `bibtex`, `pdflatex`, `pdflatex` to correctly parse all your references and links in your document.
Instead of doing this manually (or writing scripts for it), `latexmk` takes care of it all for you.
It also provides an easy way to remove auxiliary files generated as a byproduct of compiling your document.


## Building from the command line

Before I show you how to compile/build documents using a specialised editor, I will first show you how to do it *without* such an editor.
One of the advantages of LaTeX is that you can write your documents in *any* plain text editor, even bare-bones ones such as Notepad, since the programs that interpret your files to build the PDF file are seperate programs.

The "command line" is a text interface for your computer, where you can type commands for your computer to run.
On Windows it's called `cmd`, on MacOS it's called `Terminal`.
Open it now.

### Check installation

First, we will check that everything was installed correctly.
Using the command

- `where` on Windows
- `which` on Mac or Linux

Find the commands `pdflatex` and `bibtex`.
If you installed `latexmk`, look up `perl` and `latexmk` too.

```shell
which pdflatex
which bibtex
which perl
which latexmk
```

If `which`/`where` returns a path, you're good to go.
If you get an error, it means your OS didn't find the specified commands anywhere on your *$PATH*.
PATH is a so-called environment variable, which tells your OS where to look for programs.
If the folder containing the binaries (`.exe` files on Windows) is not on your PATH, then your OS will not be able to find the programs without the full file path to them.

To edit your PATH on Windows:

1. Open Control Panel
2. Go to *System and Security > System*
3. Click *Advanced System Settings > Environment Variables*
4. Highlight *Path* under *User variables* and click *Edit*
5. Click *New* and browse to the folder containing your LaTeX binaries

If you have MikTeX, they will be under `C:\Users\<username>\AppData\Local\Programs\MiKTeX 2.9\miktex\bin\x64`.

To edit your PATH on Mac OS:

1. Edit `/etc/paths`, i.e.
    ```shell
    sudo nano /etc/paths
    ```
2. Add a line containing the path to the folder containing the binaries

If you have MacTeX, they will be under `/Library/TeX/texbin`.

### Compile document

Once the LaTeX binaries are on your PATH, compiling a document from the command line is easy.

```shell
cd path/to/project
pdflatex document.tex
```

This will build `document.pdf` in the folder `path/to/project`.

#### Exercise

Let's try building a document.

1. Download a project template from [here](https://github.com/janusvm/aau-project-template/releases)
2. Unpack in a folder somewhere (e.g. in `Documents/test/`)
3. Delete `master.pdf`
4. Open a command prompt
5. `cd` to the folder
6. Build `master.pdf` with `pdflatex`

    Open the PDF file.
    Notice anything?
    A lot of stuff is missing; there is nothing in the table of contents, and all the cross references show ?? instead of numbers.

7. Run `pdflatex` on `master` again and check the PDF

    Now the cross references work, but the citations are still missing.

8. Run `bibtex` on `master`

    This doesn't change the PDF, but it creates a `.bbl` file based on the `.bib` file specified in `master.tex` and the `.aux` files created by `pdflatex`.
    This file will be used to insert the references in the PDF by `pdflatex`.

9. Run `pdflatex` again twice

    Now, `master.pdf` should be typeset correctly, complete with cross references and citations.
