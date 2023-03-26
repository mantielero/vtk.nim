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

## !!!Ignored construct:  # vtkmFilterOverrides_h [NewLine] # vtkmFilterOverrides_h [NewLine] # vtkAcceleratorsVTKmFiltersModule.h required for correct implementation [NewLine] / A class with static methods to turn vtkm filter overrides on/off at runtime
## / class VTKACCELERATORSVTKMFILTERS_EXPORT vtkmFilterOverrides { public : /@{ *
##  Runtime enable/disable for VTK-m filter overrides using the object factory.
##  This only has effect if the cmake option `VTK_ENABLE_VTKM_OVERRIDES` is set.
##  This also only affects filters that have a VTK-m override.
##  Disabled by default.
##  static void SetEnabled ( bool value ) ; static bool GetEnabled ( ) ; static void EnabledOn ( ) { vtkmFilterOverrides :: SetEnabled ( true ) ; } static void EnabledOff ( ) { vtkmFilterOverrides :: SetEnabled ( false ) ; } /@} } ;
## Error: token expected: ; but got: [identifier]!!!
