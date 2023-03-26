## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageInPlaceFilter.h
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
## *
##  @class   vtkImageInPlaceFilter
##  @brief   Filter that operates in place.
##
##  vtkImageInPlaceFilter is a filter super class that
##  operates directly on the input region.  The data is copied
##  if the requested region has different extent than the input region
##  or some other object is referencing the input region.
##

import
  vtkCommonExecutionModelModule, vtkImageAlgorithm

type
  vtkImageInPlaceFilter* {.importcpp: "vtkImageInPlaceFilter",
                          header: "vtkImageInPlaceFilter.h", bycopy.} = object of vtkImageAlgorithm
    vtkImageInPlaceFilter* {.importc: "vtkImageInPlaceFilter".}: VTK_NEWINSTANCE

  vtkImageInPlaceFilterSuperclass* = vtkImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageInPlaceFilter::IsTypeOf(@)",
    header: "vtkImageInPlaceFilter.h".}
proc IsA*(this: var vtkImageInPlaceFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageInPlaceFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageInPlaceFilter {.
    importcpp: "vtkImageInPlaceFilter::SafeDownCast(@)",
    header: "vtkImageInPlaceFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageInPlaceFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageInPlaceFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageInPlaceFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageInPlaceFilter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageInPlaceFilter.h".}