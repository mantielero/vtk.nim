## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCompiler.h
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

## --------------------------------------------------------------------------
##  Compiler backend
##  Be careful modifying this -- order is important.

when defined(_MSC_VER):
  ##  MSVC 2015+ can use a clang frontend, so we want to label it only as MSVC
  ##  and not MSVC and clang.
elif defined(__INTEL_COMPILER):
  ##  Intel 14+ on OSX uses a clang frontend, so again we want to label them as
  ##  intel only, and not intel and clang.
elif defined(__PGI):
  ##  PGI reports as GNUC as it generates the same ABI, so we need to check for
  ##  it before gcc.
elif defined(__clang__):
  ##  Check for clang before GCC, as clang says it is GNUC since it has ABI
  ##  compliance and supports many of the same extensions.
elif defined(__GNUC__):
  ##  Several compilers pretend to be GCC but have minor differences. To
  ##  compensate for that, we checked for those compilers first above.
  const
    VTK_COMPILER_GCC_VERSION* = (
      __GNUC__ * 10000 + __GNUC_MINOR__ * 100 + __GNUC_PATCHLEVEL__)
## * extern template declarations for C++11.

##  VTK-HeaderTest-Exclude: vtkCompiler.h
