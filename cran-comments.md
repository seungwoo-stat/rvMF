This is a resubmission:

In response to the comment

"it is an array overrun, not a leak.  And there are lots of usages of 
malloc in rvMF64.cpp with no check that they succeeded (so Calloc or 
R_alloc are preferred: see the manual).  Where is the allocated memory 
freed? (There is no call to free .., and valgrind shows memory leaks).

It should add the formerly failing examples as a test."

We changed all malloc functions to calloc, as suggested.

There is no need to free the allocated memory because all of them are statically allocated.
They are automatically freed.
Trying to free them may crash the program: <https://stackoverflow.com/questions/10716013/can-i-free-static-and-automatic-variables-in-c>
In the previous version 0.0.3, some examples passes the test, whereas one failed.
If missing the 'free' function was the source of the memory error, all examples should have failed.

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
