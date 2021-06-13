AC_INIT([myprog], [0.01], [x@example.com],
        [myprog], [http://asdfasefeadsf.com])

# safety check - list a source file that wouldnt be in other dirs
AC_CONFIG_SRCDIR([src/myprog.c])

# put configuration results here to easily #include them
AC_CONFIG_HEADERS([config.h])

# autools auxiliary files in a subdir and not in top dir
AC_CONFIG_AUX_DIR([build-aux])

AC_CONFIG_MACRO_DIR([m4])

# enable automake to simplify creating makefiles
# the "subdir-objects" is needed to put src files in subdir
AM_INIT_AUTOMAKE([1.11 subdir-objects -Wall -Werror])
AC_CONFIG_FILES([Makefile])

# probe for C compiler
AC_PROG_CC
AM_PROG_CC_C_O

# Put various checks and such here
AC_PROG_INSTALL
AC_PROG_AWK
AC_PROG_RANLIB
AC_C_CONST
AC_C_INLINE
AC_CHECK_HEADERS([stdlib.h stdio.h string.h])

AC_OUTPUT
