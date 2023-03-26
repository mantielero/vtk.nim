## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImagePadFilter.h
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
##  @class   vtkImagePadFilter
##  @brief   Super class for filters that fill in extra pixels.
##
##  vtkImagePadFilter Changes the image extent of an image.  If the image
##  extent is larger than the input image extent, the extra pixels are
##  filled by an algorithm determined by the subclass.
##  The image extent of the output has to be specified.
##

import
  vtkImagingCoreModule, vtkThreadedImageAlgorithm

type
  vtkImagePadFilter* {.importcpp: "vtkImagePadFilter",
                      header: "vtkImagePadFilter.h", bycopy.} = object of vtkThreadedImageAlgorithm
    vtkImagePadFilter* {.importc: "vtkImagePadFilter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImagePadFilter {.importcpp: "vtkImagePadFilter::New(@)",
                                 header: "vtkImagePadFilter.h".}
type
  vtkImagePadFilterSuperclass* = vtkThreadedImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImagePadFilter::IsTypeOf(@)", header: "vtkImagePadFilter.h".}
proc IsA*(this: var vtkImagePadFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImagePadFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImagePadFilter {.
    importcpp: "vtkImagePadFilter::SafeDownCast(@)", header: "vtkImagePadFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImagePadFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImagePadFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImagePadFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImagePadFilter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImagePadFilter.h".}
proc SetOutputWholeExtent*(this: var vtkImagePadFilter; extent: array[6, cint]) {.
    importcpp: "SetOutputWholeExtent", header: "vtkImagePadFilter.h".}
proc SetOutputWholeExtent*(this: var vtkImagePadFilter; minX: cint; maxX: cint;
                          minY: cint; maxY: cint; minZ: cint; maxZ: cint) {.
    importcpp: "SetOutputWholeExtent", header: "vtkImagePadFilter.h".}
proc GetOutputWholeExtent*(this: var vtkImagePadFilter; extent: array[6, cint]) {.
    importcpp: "GetOutputWholeExtent", header: "vtkImagePadFilter.h".}
## !!!Ignored construct:  int * GetOutputWholeExtent ( ) VTK_SIZEHINT ( 6 ) { return this -> OutputWholeExtent ; } /@} /@{ *
##  Set/Get the number of output scalar components.
##  virtual void SetOutputNumberOfScalarComponents ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputNumberOfScalarComponents  to  << _arg ) ; if ( this -> OutputNumberOfScalarComponents != _arg ) { this -> OutputNumberOfScalarComponents = _arg ; this -> Modified ( ) ; } } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual int GetOutputNumberOfScalarComponents ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputNumberOfScalarComponents  of  << this -> OutputNumberOfScalarComponents ) ; return this -> OutputNumberOfScalarComponents ; } ;
## Error: expected ';'!!!
