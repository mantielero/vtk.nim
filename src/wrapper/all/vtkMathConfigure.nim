##  -*- c++ -*-
## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMathConfigure.h.in
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
## ----------------------------------------------------------------------------
##  Copyright (c) Sandia Corporation
##  See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
## ----------------------------------------------------------------------------

##  #undef VTK_HAS__ISNAN

##  #undef VTK_HAS__FINITE
##  Check for undetected macro versions of isnan(), isinf(), isfinite()

##  Make macros from _isnan(), _finite() if they exist (there is no _isinf)

##  The CUDA compiler(nvcc) is a secondary compiler that is used beside
##  your host compiler. While your host compiler can support std::isnan and
##  other functions, the CUDA compiler doesn't. Because the CUDA compiler is
##  given both host and device code to parse it will then fail when it sees
##  std::isnan because it is in the vtkMath header and not the
##  implementation file. To get around this issue we check __CUDACC__ which
##  is only set when we are compiling with the CUDA compiler

when defined(__CUDACC__):