## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageCacheFilter.h
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
##  @class   vtkImageCacheFilter
##  @brief   Caches multiple vtkImageData objects.
##
##
##  vtkImageCacheFilter keep a number of vtkImageDataObjects from previous
##  updates to satisfy future updates without needing to update the input.  It
##  does not change the data at all.  It just makes the pipeline more
##  efficient at the expense of using extra memory.
##

import
  vtkImageAlgorithm, vtkImagingCoreModule

discard "forward decl of vtkExecutive"
type
  vtkImageCacheFilter* {.importcpp: "vtkImageCacheFilter",
                        header: "vtkImageCacheFilter.h", bycopy.} = object of vtkImageAlgorithm
    vtkImageCacheFilter* {.importc: "vtkImageCacheFilter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageCacheFilter {.importcpp: "vtkImageCacheFilter::New(@)",
                                   header: "vtkImageCacheFilter.h".}
type
  vtkImageCacheFilterSuperclass* = vtkImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageCacheFilter::IsTypeOf(@)", header: "vtkImageCacheFilter.h".}
proc IsA*(this: var vtkImageCacheFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageCacheFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageCacheFilter {.
    importcpp: "vtkImageCacheFilter::SafeDownCast(@)",
    header: "vtkImageCacheFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageCacheFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageCacheFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageCacheFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageCacheFilter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageCacheFilter.h".}
proc SetCacheSize*(this: var vtkImageCacheFilter; size: cint) {.
    importcpp: "SetCacheSize", header: "vtkImageCacheFilter.h".}
proc GetCacheSize*(this: var vtkImageCacheFilter): cint {.importcpp: "GetCacheSize",
    header: "vtkImageCacheFilter.h".}