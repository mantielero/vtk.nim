## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtk_verdict.h
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

##  Use the verdict library configured for VTK.

const
  VTK_MODULE_USE_EXTERNAL_VTK_verdict* = 1

when VTK_MODULE_USE_EXTERNAL_VTK_verdict:
  discard
else:
  discard