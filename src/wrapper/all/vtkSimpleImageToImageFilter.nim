## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSimpleImageToImageFilter.h
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
##  @class   vtkSimpleImageToImageFilter
##  @brief   Generic image filter with one input.
##
##  vtkSimpleImageToImageFilter is a filter which aims to avoid much
##  of the complexity associated with vtkImageAlgorithm (i.e.
##  support for pieces, multi-threaded operation). If you need to write
##  a simple image-image filter which operates on the whole input, use
##  this as the superclass. The subclass has to provide only an execute
##  method which takes input and output as arguments. Memory allocation
##  is handled in vtkSimpleImageToImageFilter. Also, you are guaranteed to
##  have a valid input in the Execute(input, output) method. By default,
##  this filter
##  requests it's input's whole extent and copies the input's information
##  (spacing, whole extent etc...) to the output. If the output's setup
##  is different (for example, if it performs some sort of sub-sampling),
##  ExecuteInformation has to be overwritten. As an example of how this
##  can be done, you can look at vtkImageShrink3D::ExecuteInformation.
##  For a complete example which uses templates to support generic data
##  types, see vtkSimpleImageToImageFilter.
##
##  @sa
##  vtkImageAlgorithm vtkSimpleImageFilterExample
##

import
  vtkCommonExecutionModelModule, vtkImageAlgorithm

type
  vtkSimpleImageToImageFilter* {.importcpp: "vtkSimpleImageToImageFilter",
                                header: "vtkSimpleImageToImageFilter.h", bycopy.} = object of vtkImageAlgorithm
    vtkSimpleImageToImageFilter* {.importc: "vtkSimpleImageToImageFilter".}: VTK_NEWINSTANCE

  vtkSimpleImageToImageFilterSuperclass* = vtkImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSimpleImageToImageFilter::IsTypeOf(@)",
    header: "vtkSimpleImageToImageFilter.h".}
proc IsA*(this: var vtkSimpleImageToImageFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkSimpleImageToImageFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSimpleImageToImageFilter {.
    importcpp: "vtkSimpleImageToImageFilter::SafeDownCast(@)",
    header: "vtkSimpleImageToImageFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSimpleImageToImageFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSimpleImageToImageFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSimpleImageToImageFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSimpleImageToImageFilter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkSimpleImageToImageFilter.h".}