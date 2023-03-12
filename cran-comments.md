This is a resubmission:

In response to the comment

"it is an array overrun, not a leak.  And there are lots of usages of 
malloc in rvMF64.cpp with no check that they succeeded (so Calloc or 
R_alloc are preferred: see the manual).  Where is the allocated memory 
freed? (There is no call to free .., and valgrind shows memory leaks).

It should add the formerly failing examples as a test."

We changed all malloc functions to calloc, as suggested.

I had a confusion (misunderstanding) that the allocated arrays would be freed automatically.
However, this would be the only case when it is called in the 'main' function.
Hence, I now free the arrays at the end of the program.
I also have checked with my linux machine and valgrind---no memory errors occur in the revised version 0.0.7. 

I also added the formerly failing example as a test.


## R CMD check results

We tested on four environments:

-   Windows Server 2022, R-devel, 64 bit

-   Fedora Linux, R-devel, clang, gfortran

-   Ubuntu Linux 20.04.1 LTS, R-release, GCC

-   MacOS Ventura 13.2.1, R-release

There were no ERRORs or WARNINGs.

There were some NOTEs found:

    * checking for detritus in the temp directory ... NOTE
    Found the following files/directories:
      'lastMiKTeXException'

As noted in [R-hub issue #503](https://github.com/r-hub/rhub/issues/503), this could be due to a bug/crash in MiKTeX and can likely be ignored.

    Possibly misspelled words in DESCRIPTION:
      Mises (2:31, 8:75, 11:56)
      variates (10:55)
      von (2:27, 8:71, 11:52)

They are not misspelled. 'von Mises' is a (given) name, and 'variates' is a statistical term.

    * checking HTML version of manual ... NOTE
    Skipping checking HTML validation: no command 'tidy' found
    Skipping checking math rendering: package 'V8' unavailable

This is unrelated to our package.

## Downstream dependencies

There are currently no downstream dependencies for this package.
