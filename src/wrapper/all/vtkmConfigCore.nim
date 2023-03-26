## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    ObjectFactory.cxx
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
##  Other Configuration Options

import
  vtkAcceleratorsVTKmCoreModule

## --------------------------------------------------------------------------
##  Make sure we use the same id's in VTK and VTK-m

import
  vtkType

when defined(VTK_USE_64BIT_IDS):
  when not defined(VTKM_USE_64BIT_IDS):
    discard
else:
  when defined(VTKM_USE_64BIT_IDS):
    discard
when not defined(VTKACCELERATORSVTKMCORE_TEMPLATE_EXPORT):
  when not defined(VTKACCELERATORSVTKMCORE_STATIC_DEFINE) and defined(_MSC_VER):
    ##  Warning C4910 on windows state that extern explicit template can't be
    ##      labeled with __declspec(dllexport). So that is why we use a new custom
    ##      define. But when other modules ( e.g. rendering ) include this header
    ##      we need them to see that the extern template is actually being imported.
    ##
    ##  We are building this library with MSVC
  else:
    ##  Defer to the config module