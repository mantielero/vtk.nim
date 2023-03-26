## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDeprecation.h
##
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
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

## !!!Ignored construct:  # vtkDeprecation_h [NewLine] # vtkDeprecation_h [NewLine] # vtkVersionMacros.h [NewLine] ----------------------------------------------------------------------------
##  These macros may be used to deprecate APIs in VTK. They act as attributes on
##  method declarations and do not remove methods from a build based on build
##  configuration.
##
##  To use:
##
##  In the declaration:
##
##  ```cxx
##  VTK_DEPRECATED_IN_9_1_0("reason for the deprecation")
##  void oldApi();
##  ```
##
##  When selecting which version to deprecate an API in, use the newest macro
##  available in this header.
##
##  In the implementation:
##
##  ```cxx
##  // Hide VTK_DEPRECATED_IN_9_1_0() warnings for this class.
##  #define VTK_DEPRECATION_LEVEL 0
##
##  #include "vtkLegacy.h"
##
##  void oldApi()
##  {
##    // One of:
##    VTK_LEGACY_BODY(oldApi, "VTK 9.1");
##    VTK_LEGACY_REPLACED_BODY(oldApi, "VTK 9.1", newApi);
##
##    // Remaining implementation.
##  }
##  ```
##
##  Please note the `VTK_DEPRECATED_IN_` version in the `VTK_DEPRECATION_LEVEL`
##  comment so that it can be removed when that version is finally removed.
## ----------------------------------------------------------------------------  The level at which warnings should be made. # VTK_DEPRECATION_LEVEL [NewLine]  VTK defaults to deprecation of its current version. # VTK_DEPRECATION_LEVEL VTK_VERSION_NUMBER [NewLine] # [NewLine]  API deprecated before 9.0.0 have already been removed. # VTK_MINIMUM_DEPRECATION_LEVEL VTK_VERSION_CHECK ( 9 , 0 , 0 ) [NewLine]  Force the deprecation level to be at least that of VTK's build
##  configuration. # VTK_DEPRECATION_LEVEL < VTK_MINIMUM_DEPRECATION_LEVEL [NewLine] # VTK_DEPRECATION_LEVEL [NewLine] # VTK_DEPRECATION_LEVEL VTK_MINIMUM_DEPRECATION_LEVEL [NewLine] # [NewLine]  Deprecation macro support for various compilers. # 0 && __cplusplus >= 201402L [NewLine]  This is currently hard-disabled because compilers do not mix C++ attributes
##  and `__attribute__` extensions together well. # VTK_DEPRECATION ( reason ) deprecated(reason) [NewLine] # defined ( VTK_WRAPPING_CXX ) [NewLine]  Ignore deprecation in wrapper code. # VTK_DEPRECATION ( reason ) [NewLine] # defined ( __VTK_WRAP__ ) [NewLine] # VTK_DEPRECATION ( reason ) vtk::deprecated(reason) [NewLine] # [NewLine] # defined ( _WIN32 ) || defined ( _WIN64 ) [NewLine] # VTK_DEPRECATION ( reason ) __declspec ( deprecated ( reason ) ) [NewLine] # defined ( __clang__ ) [NewLine] # __has_extension ( attribute_deprecated_with_message ) [NewLine] # VTK_DEPRECATION ( reason ) __attribute__ ( ( __deprecated__ ( reason ) ) ) [NewLine] # [NewLine] # VTK_DEPRECATION ( reason ) __attribute__ ( ( __deprecated__ ) ) [NewLine] # [NewLine] # defined ( __GNUC__ ) [NewLine] # ( __GNUC__ >= 5 ) || ( ( __GNUC__ == 4 ) && ( __GNUC_MINOR__ >= 5 ) ) [NewLine] # VTK_DEPRECATION ( reason ) __attribute__ ( ( __deprecated__ ( reason ) ) ) [NewLine] # [NewLine] # VTK_DEPRECATION ( reason ) __attribute__ ( ( __deprecated__ ) ) [NewLine] # [NewLine] # [NewLine] # VTK_DEPRECATION ( reason ) [NewLine] # [NewLine] # [NewLine]  APIs deprecated in the next release. # defined ( __VTK_WRAP__ ) [NewLine] # VTK_DEPRECATED_IN_9_2_0 ( reason ) vtk::deprecated(reason, "9.2.0") [NewLine] # VTK_DEPRECATION_LEVEL >= VTK_VERSION_CHECK ( 9 , 1 , 20211001 ) [NewLine] # VTK_DEPRECATED_IN_9_2_0 ( reason ) VTK_DEPRECATION ( reason ) [NewLine] # [NewLine] # VTK_DEPRECATED_IN_9_2_0 ( reason ) [NewLine] # [NewLine]  APIs deprecated in 9.1.0. # defined ( __VTK_WRAP__ ) [NewLine] # VTK_DEPRECATED_IN_9_1_0 ( reason ) vtk::deprecated(reason, "9.1.0") [NewLine] # VTK_DEPRECATION_LEVEL >= VTK_VERSION_CHECK ( 9 , 1 , 0 ) [NewLine] # VTK_DEPRECATED_IN_9_1_0 ( reason ) VTK_DEPRECATION ( reason ) [NewLine] # [NewLine] # VTK_DEPRECATED_IN_9_1_0 ( reason ) [NewLine] # [NewLine]  APIs deprecated in the older release always warn. # defined ( __VTK_WRAP__ ) [NewLine] # VTK_DEPRECATED_IN_9_0_0 ( reason ) vtk::deprecated(reason, "9.0.0") [NewLine] # [NewLine] # VTK_DEPRECATED_IN_9_0_0 ( reason ) VTK_DEPRECATION ( reason ) [NewLine] # [NewLine] # defined ( __VTK_WRAP__ ) [NewLine] # VTK_DEPRECATED_IN_8_2_0 ( reason ) vtk::deprecated(reason, "8.2.0") [NewLine] # [NewLine] # VTK_DEPRECATED_IN_8_2_0 ( reason ) VTK_DEPRECATION ( reason ) [NewLine] # [NewLine] # [NewLine]  VTK-HeaderTest-Exclude: vtkDeprecation.h
## Error: did not expect deprecated(reason)!!!
