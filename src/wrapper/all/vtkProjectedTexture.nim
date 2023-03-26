## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkProjectedTexture.h
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
##  @class   vtkProjectedTexture
##  @brief   assign texture coordinates for a projected texture
##
##  vtkProjectedTexture assigns texture coordinates to a dataset as if
##  the texture was projected from a slide projected located somewhere in the
##  scene.  Methods are provided to position the projector and aim it at a
##  location, to set the width of the projector's frustum, and to set the
##  range of texture coordinates assigned to the dataset.
##
##  Objects in the scene that appear behind the projector are also assigned
##  texture coordinates; the projected image is left-right and top-bottom
##  flipped, much as a lens' focus flips the rays of light that pass through
##  it.  A warning is issued if a point in the dataset falls at the focus
##  of the projector.
##

import
  vtkDataSetAlgorithm, vtkFiltersModelingModule

const
  VTK_PROJECTED_TEXTURE_USE_PINHOLE* = 0
  VTK_PROJECTED_TEXTURE_USE_TWO_MIRRORS* = 1

type
  vtkProjectedTexture* {.importcpp: "vtkProjectedTexture",
                        header: "vtkProjectedTexture.h", bycopy.} = object of vtkDataSetAlgorithm
    vtkProjectedTexture* {.importc: "vtkProjectedTexture".}: VTK_NEWINSTANCE


proc New*(): ptr vtkProjectedTexture {.importcpp: "vtkProjectedTexture::New(@)",
                                   header: "vtkProjectedTexture.h".}
type
  vtkProjectedTextureSuperclass* = vtkDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkProjectedTexture::IsTypeOf(@)", header: "vtkProjectedTexture.h".}
proc IsA*(this: var vtkProjectedTexture; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkProjectedTexture.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkProjectedTexture {.
    importcpp: "vtkProjectedTexture::SafeDownCast(@)",
    header: "vtkProjectedTexture.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkProjectedTexture :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkProjectedTexture :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkProjectedTexture :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkProjectedTexture; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkProjectedTexture.h".}
proc SetPosition*(this: var vtkProjectedTexture; _arg1: cdouble; _arg2: cdouble;
                 _arg3: cdouble) {.importcpp: "SetPosition",
                                 header: "vtkProjectedTexture.h".}
proc SetPosition*(this: var vtkProjectedTexture; _arg: array[3, cdouble]) {.
    importcpp: "SetPosition", header: "vtkProjectedTexture.h".}
## !!!Ignored construct:  virtual double * GetPosition ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Position  pointer  << this -> Position ) ; return this -> Position ; } VTK_WRAPEXCLUDE virtual void GetPosition ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Position [ i ] ; } } ;
## Error: expected ';'!!!

proc SetFocalPoint*(this: var vtkProjectedTexture; focalPoint: array[3, cdouble]) {.
    importcpp: "SetFocalPoint", header: "vtkProjectedTexture.h".}
proc SetFocalPoint*(this: var vtkProjectedTexture; x: cdouble; y: cdouble; z: cdouble) {.
    importcpp: "SetFocalPoint", header: "vtkProjectedTexture.h".}
## !!!Ignored construct:  virtual double * GetPositionFocalPoint ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << FocalPoint  pointer  << this -> FocalPoint ) ; return this -> FocalPoint ; } VTK_WRAPEXCLUDE virtual void GetPositionFocalPoint ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> FocalPoint [ i ] ; } } ;
## Error: expected ';'!!!

proc SetCameraMode*(this: var vtkProjectedTexture; _arg: cint) {.
    importcpp: "SetCameraMode", header: "vtkProjectedTexture.h".}
## !!!Ignored construct:  virtual int GetCameraMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CameraMode  of  << this -> CameraMode ) ; return this -> CameraMode ; } ;
## Error: expected ';'!!!

proc SetCameraModeToPinhole*(this: var vtkProjectedTexture) {.
    importcpp: "SetCameraModeToPinhole", header: "vtkProjectedTexture.h".}
proc SetCameraModeToTwoMirror*(this: var vtkProjectedTexture) {.
    importcpp: "SetCameraModeToTwoMirror", header: "vtkProjectedTexture.h".}
proc SetCameraModeMirrorSeparation*(this: var vtkProjectedTexture; _arg: cdouble) {.
    importcpp: "SetCameraModeMirrorSeparation", header: "vtkProjectedTexture.h".}
## !!!Ignored construct:  virtual double GetCameraModeMirrorSeparation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MirrorSeparation  of  << this -> MirrorSeparation ) ; return this -> MirrorSeparation ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get the normalized orientation vector of the projector.
##  virtual double * GetPositionFocalPointOrientationOrientation ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Orientation  pointer  << this -> Orientation ) ; return this -> Orientation ; } VTK_WRAPEXCLUDE virtual void GetPositionFocalPointOrientationOrientation ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Orientation [ i ] ; } } ;
## Error: expected ';'!!!

proc SetPositionUp*(this: var vtkProjectedTexture; _arg1: cdouble; _arg2: cdouble;
                   _arg3: cdouble) {.importcpp: "SetPositionUp",
                                   header: "vtkProjectedTexture.h".}
proc SetPositionUp*(this: var vtkProjectedTexture; _arg: array[3, cdouble]) {.
    importcpp: "SetPositionUp", header: "vtkProjectedTexture.h".}
## !!!Ignored construct:  virtual double * GetPositionFocalPointOrientationOrientationUp ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Up  pointer  << this -> Up ) ; return this -> Up ; } VTK_WRAPEXCLUDE virtual void GetPositionFocalPointOrientationOrientationUp ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Up [ i ] ; } } ;
## Error: expected ';'!!!

proc SetPositionUpAspectRatio*(this: var vtkProjectedTexture; _arg1: cdouble;
                              _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetPositionUpAspectRatio", header: "vtkProjectedTexture.h".}
proc SetPositionUpAspectRatio*(this: var vtkProjectedTexture;
                              _arg: array[3, cdouble]) {.
    importcpp: "SetPositionUpAspectRatio", header: "vtkProjectedTexture.h".}
## !!!Ignored construct:  virtual double * GetPositionFocalPointOrientationOrientationUpAspectRatio ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << AspectRatio  pointer  << this -> AspectRatio ) ; return this -> AspectRatio ; } VTK_WRAPEXCLUDE virtual void GetPositionFocalPointOrientationOrientationUpAspectRatio ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> AspectRatio [ i ] ; } } ;
## Error: expected ';'!!!

proc SetSRange*(this: var vtkProjectedTexture; _arg1: cdouble; _arg2: cdouble) {.
    importcpp: "SetSRange", header: "vtkProjectedTexture.h".}
proc SetSRange*(this: var vtkProjectedTexture; _arg: array[2, cdouble]) {.
    importcpp: "SetSRange", header: "vtkProjectedTexture.h".}
## !!!Ignored construct:  virtual double * GetPositionFocalPointOrientationOrientationUpAspectRatioSRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << SRange  pointer  << this -> SRange ) ; return this -> SRange ; } VTK_WRAPEXCLUDE virtual void GetPositionFocalPointOrientationOrientationUpAspectRatioSRange ( double data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> SRange [ i ] ; } } ;
## Error: expected ';'!!!

proc SetSRangeTRange*(this: var vtkProjectedTexture; _arg1: cdouble; _arg2: cdouble) {.
    importcpp: "SetSRangeTRange", header: "vtkProjectedTexture.h".}
proc SetSRangeTRange*(this: var vtkProjectedTexture; _arg: array[2, cdouble]) {.
    importcpp: "SetSRangeTRange", header: "vtkProjectedTexture.h".}
## !!!Ignored construct:  virtual double * GetPositionFocalPointOrientationOrientationUpAspectRatioSRangeTRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << TRange  pointer  << this -> TRange ) ; return this -> TRange ; } VTK_WRAPEXCLUDE virtual void GetPositionFocalPointOrientationOrientationUpAspectRatioSRangeTRange ( double data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> TRange [ i ] ; } } ;
## Error: expected ';'!!!
