## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkButtonSource.h
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
##  @class   vtkButtonSource
##  @brief   abstract class for creating various button types
##
##  vtkButtonSource is an abstract class that defines an API for creating
##  "button-like" objects in VTK. A button is a geometry with a rectangular
##  region that can be textured. The button is divided into two regions: the
##  texture region and the shoulder region. The points in both regions are
##  assigned texture coordinates. The texture region has texture coordinates
##  consistent with the image to be placed on it.  All points in the shoulder
##  regions are assigned a texture coordinate specified by the user.  In this
##  way the shoulder region can be colored by the texture.
##
##  Creating a vtkButtonSource requires specifying its center point.
##  (Subclasses have other attributes that must be set to control
##  the shape of the button.) You must also specify how to control
##  the shape of the texture region; i.e., whether to size the
##  texture region proportional to the texture dimensions or whether
##  to size the texture region proportional to the button. Also, buttons
##  can be created single sided are mirrored to create two-sided buttons.
##
##  @sa
##  vtkEllipticalButtonSource vtkRectangularButtonSource
##
##  @warning
##  The button is defined in the x-y plane. Use vtkTransformPolyDataFilter
##  or vtkGlyph3D to orient the button in a different direction.
##

import
  vtkFiltersSourcesModule, vtkPolyDataAlgorithm

const
  VTK_TEXTURE_STYLE_FIT_IMAGE* = 0
  VTK_TEXTURE_STYLE_PROPORTIONAL* = 1

type
  vtkButtonSource* {.importcpp: "vtkButtonSource", header: "vtkButtonSource.h",
                    bycopy.} = object of vtkPolyDataAlgorithm
    vtkButtonSource* {.importc: "vtkButtonSource".}: VTK_NEWINSTANCE


proc PrintSelf*(this: var vtkButtonSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkButtonSource.h".}
type
  vtkButtonSourceSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkButtonSource::IsTypeOf(@)", header: "vtkButtonSource.h".}
proc IsA*(this: var vtkButtonSource; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkButtonSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkButtonSource {.
    importcpp: "vtkButtonSource::SafeDownCast(@)", header: "vtkButtonSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkButtonSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkButtonSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkButtonSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc SetCenter*(this: var vtkButtonSource; _arg1: cdouble; _arg2: cdouble;
               _arg3: cdouble) {.importcpp: "SetCenter", header: "vtkButtonSource.h".}
proc SetCenter*(this: var vtkButtonSource; _arg: array[3, cdouble]) {.
    importcpp: "SetCenter", header: "vtkButtonSource.h".}
## !!!Ignored construct:  virtual double * GetCenter ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Center  pointer  << this -> Center ) ; return this -> Center ; } VTK_WRAPEXCLUDE virtual void GetCenter ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Center [ i ] ; } } ;
## Error: expected ';'!!!

proc SetTextureStyle*(this: var vtkButtonSource; _arg: cint) {.
    importcpp: "SetTextureStyle", header: "vtkButtonSource.h".}
proc GetTextureStyleMinValue*(this: var vtkButtonSource): cint {.
    importcpp: "GetTextureStyleMinValue", header: "vtkButtonSource.h".}
proc GetTextureStyleMaxValue*(this: var vtkButtonSource): cint {.
    importcpp: "GetTextureStyleMaxValue", header: "vtkButtonSource.h".}
## !!!Ignored construct:  virtual int GetTextureStyle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TextureStyle  of  << this -> TextureStyle ) ; return this -> TextureStyle ; } ;
## Error: expected ';'!!!

proc SetTextureStyleToFitImage*(this: var vtkButtonSource) {.
    importcpp: "SetTextureStyleToFitImage", header: "vtkButtonSource.h".}
proc SetTextureStyleToProportional*(this: var vtkButtonSource) {.
    importcpp: "SetTextureStyleToProportional", header: "vtkButtonSource.h".}
proc SetTextureDimensions*(this: var vtkButtonSource; _arg1: cint; _arg2: cint) {.
    importcpp: "SetTextureDimensions", header: "vtkButtonSource.h".}
proc SetTextureDimensions*(this: var vtkButtonSource; _arg: array[2, cint]) {.
    importcpp: "SetTextureDimensions", header: "vtkButtonSource.h".}
## !!!Ignored construct:  virtual int * GetTextureDimensions ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << TextureDimensions  pointer  << this -> TextureDimensions ) ; return this -> TextureDimensions ; } VTK_WRAPEXCLUDE virtual void GetTextureDimensions ( int & _arg1 , int & _arg2 ) { _arg1 = this -> TextureDimensions [ 0 ] ; _arg2 = this -> TextureDimensions [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << TextureDimensions  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetTextureDimensions ( int _arg [ 2 ] ) { this -> GetTextureDimensions ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetTextureDimensionsShoulderTextureCoordinate*(this: var vtkButtonSource;
    _arg1: cdouble; _arg2: cdouble) {.importcpp: "SetTextureDimensionsShoulderTextureCoordinate",
                                  header: "vtkButtonSource.h".}
proc SetTextureDimensionsShoulderTextureCoordinate*(this: var vtkButtonSource;
    _arg: array[2, cdouble]) {.importcpp: "SetTextureDimensionsShoulderTextureCoordinate",
                            header: "vtkButtonSource.h".}
## !!!Ignored construct:  virtual double * GetTextureDimensionsShoulderTextureCoordinate ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ShoulderTextureCoordinate  pointer  << this -> ShoulderTextureCoordinate ) ; return this -> ShoulderTextureCoordinate ; } VTK_WRAPEXCLUDE virtual void GetTextureDimensionsShoulderTextureCoordinate ( double & _arg1 , double & _arg2 ) { _arg1 = this -> ShoulderTextureCoordinate [ 0 ] ; _arg2 = this -> ShoulderTextureCoordinate [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ShoulderTextureCoordinate  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetTextureDimensionsShoulderTextureCoordinate ( double _arg [ 2 ] ) { this -> GetTextureDimensionsShoulderTextureCoordinate ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetTwoSided*(this: var vtkButtonSource; _arg: vtkTypeBool) {.
    importcpp: "SetTwoSided", header: "vtkButtonSource.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetTextureStyleTwoSided ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TwoSided  of  << this -> TwoSided ) ; return this -> TwoSided ; } ;
## Error: expected ';'!!!

proc TwoSidedOn*(this: var vtkButtonSource) {.importcpp: "TwoSidedOn",
    header: "vtkButtonSource.h".}
proc TwoSidedOff*(this: var vtkButtonSource) {.importcpp: "TwoSidedOff",
    header: "vtkButtonSource.h".}
  ## /@}