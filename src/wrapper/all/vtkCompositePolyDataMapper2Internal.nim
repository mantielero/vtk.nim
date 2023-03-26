## =========================================================================
##
##   Program:   Visualization Toolkit
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
  vtkDeprecation

when VTK_DEPRECATION_LEVEL >= VTK_VERSION_CHECK(9, 1, 0):
  when defined(_MSC_VER):
    discard
  else:
    discard
import
  vtkCompositeMapperHelper2

##  VTK-HeaderTest-Exclude: vtkCompositePolyDataMapper2Internal.h
