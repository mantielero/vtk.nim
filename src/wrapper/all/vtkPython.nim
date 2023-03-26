## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPython.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================

import
  vtkABI, vtkPythonConfigure

##
##    Use the real python debugging library if it is provided.
##    Otherwise use the "documented" trick involving checking for _DEBUG
##    and undefined that symbol while we include Python headers.
##    Update: this method does not fool Microsoft Visual C++ 8 anymore; two
##    of its header files (crtdefs.h and use_ansi.h) check if _DEBUG was set
##    or not, and set flags accordingly (_CRT_MANIFEST_RETAIL,
##    _CRT_MANIFEST_DEBUG, _CRT_MANIFEST_INCONSISTENT). The next time the
##    check is performed in the same compilation unit, and the flags are found,
##    and error is triggered. Let's prevent that by setting _CRT_NOFORCE_MANIFEST.
##

when defined(_DEBUG) and not defined(VTK_WINDOWS_PYTHON_DEBUGGABLE):
  ##  Include these low level headers before undefing _DEBUG. Otherwise when doing
  ##  a debug build against a release build of python the compiler will end up
  ##  including these low level headers without DEBUG enabled, causing it to try
  ##  and link release versions of this low level C api.
  when defined(_MSC_VER):
    const
      _CRT_NOFORCE_MANIFEST* = 1
##  We used to try to #undef feature macros that Python.h defines
## to avoid re-definition warnings.  However, such warnings usually
## indicate a violation of Python's documented inclusion policy:
##
##  "Since Python may define some pre-processor definitions which
##   affect the standard headers on some systems, you must include
##   Python.h before any standard headers are included."
##  (http://docs.python.org/c-api/intro.html#include-files)
##
## To avoid re-definitions warnings, ensure "vtkPython.h" is included
## before _any_ headers that define feature macros, whether or not
## they are system headers.  Do NOT add any #undef lines here.

when defined(_MSC_VER):
  discard
when defined(_MSC_VER) and _MSC_VER >= 1800:
  const
    HAVE_ROUND* = 1
when defined(_MSC_VER) and _MSC_VER >= 1800:
  discard
when defined(_MSC_VER):
  discard
const
  _DEBUG* = 1

##  undo some macro defs in pyport.h

##  This logic is borrowed from mpi4py/vtkmpi4py/src/atimport.h

when defined(VTK_NO_PYTHON_THREADS):
  template PyGILState_Ensure*(): untyped =
    (cast[PyGILState_STATE](0))

  template PyGILState_Release*(state: untyped): untyped =
    (state) = (cast[PyGILState_STATE](0))

##  VTK-HeaderTest-Exclude: vtkPython.h
