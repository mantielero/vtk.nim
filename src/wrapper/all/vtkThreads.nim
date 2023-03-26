## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkThreads.h.in
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

## !!!Ignored construct:  # vtkThreads_h [NewLine] # vtkThreads_h [NewLine]  Threading system. # [NewLine]  #undef VTK_USE_WIN32_THREADS # VTK_MAX_THREADS 64 [NewLine]  If VTK_USE_PTHREADS is defined, then the multithreaded
##  function is of type void *, and returns nullptr
##  Otherwise the type is void which is correct for WIN32 # [NewLine] # VTK_THREAD_RETURN_VALUE nullptr [NewLine] # VTK_THREAD_RETURN_TYPE void * [NewLine] # [NewLine] # VTK_USE_WIN32_THREADS [NewLine] # VTK_THREAD_RETURN_VALUE 0 [NewLine] # VTK_THREAD_RETURN_TYPE vtkWindowsDWORD __stdcall [NewLine] # [NewLine] # ! defined ( ) && ! defined ( VTK_USE_WIN32_THREADS ) [NewLine] # VTK_THREAD_RETURN_VALUE [NewLine] # VTK_THREAD_RETURN_TYPE void [NewLine] # [NewLine] # [NewLine]
## Error: did not expect [NewLine]!!!
