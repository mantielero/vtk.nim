## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtk_lzma.h
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

const
  LZMA_BUILT_AS_DYNAMIC_LIB* = 1

when not LZMA_BUILT_AS_DYNAMIC_LIB:
  discard
##  Use the lzma library configured for VTK.

const
  VTK_MODULE_USE_EXTERNAL_vtklzma* = 1

when VTK_MODULE_USE_EXTERNAL_vtklzma:
  discard
else:
  discard