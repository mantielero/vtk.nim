## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageClip.h
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
##  @class   vtkImageClip
##  @brief   Reduces the image extent of the input.
##
##  vtkImageClip  will make an image smaller.  The output must have
##  an image extent which is the subset of the input.  The filter has two
##  modes of operation:
##  1: By default, the data is not copied in this filter.
##  Only the whole extent is modified.
##  2: If ClipDataOn is set, then you will get no more that the clipped
##  extent.
##

##  I did not make this a subclass of in place filter because
##  the references on the data do not matter. I make no modifications
##  to the data.

import
  vtkImageAlgorithm, vtkImagingCoreModule

type
  vtkImageClip* {.importcpp: "vtkImageClip", header: "vtkImageClip.h", bycopy.} = object of vtkImageAlgorithm
    vtkImageClip* {.importc: "vtkImageClip".}: VTK_NEWINSTANCE
    ##  Set the OutputImageExtent for the first time.


proc New*(): ptr vtkImageClip {.importcpp: "vtkImageClip::New(@)",
                            header: "vtkImageClip.h".}
type
  vtkImageClipSuperclass* = vtkImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageClip::IsTypeOf(@)", header: "vtkImageClip.h".}
proc IsA*(this: var vtkImageClip; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkImageClip.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageClip {.
    importcpp: "vtkImageClip::SafeDownCast(@)", header: "vtkImageClip.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageClip :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageClip :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageClip :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageClip; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageClip.h".}
proc SetOutputWholeExtent*(this: var vtkImageClip; extent: array[6, cint];
                          outInfo: ptr vtkInformation = nil) {.
    importcpp: "SetOutputWholeExtent", header: "vtkImageClip.h".}
proc SetOutputWholeExtent*(this: var vtkImageClip; minX: cint; maxX: cint; minY: cint;
                          maxY: cint; minZ: cint; maxZ: cint) {.
    importcpp: "SetOutputWholeExtent", header: "vtkImageClip.h".}
proc GetOutputWholeExtent*(this: var vtkImageClip; extent: array[6, cint]) {.
    importcpp: "GetOutputWholeExtent", header: "vtkImageClip.h".}
## !!!Ignored construct:  int * GetOutputWholeExtent ( ) VTK_SIZEHINT ( 6 ) { return this -> OutputWholeExtent ; } /@} void ResetOutputWholeExtent ( ) ;
## Error: expected ';'!!!

proc SetClipData*(this: var vtkImageClip; _arg: vtkTypeBool) {.
    importcpp: "SetClipData", header: "vtkImageClip.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetClipData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ClipData  of  << this -> ClipData ) ; return this -> ClipData ; } ;
## Error: expected ';'!!!

proc ClipDataOn*(this: var vtkImageClip) {.importcpp: "ClipDataOn",
                                       header: "vtkImageClip.h".}
proc ClipDataOff*(this: var vtkImageClip) {.importcpp: "ClipDataOff",
                                        header: "vtkImageClip.h".}
  ## /@}