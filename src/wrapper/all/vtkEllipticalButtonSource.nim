## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkEllipticalButtonSource.h
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
##  @class   vtkEllipticalButtonSource
##  @brief   create a ellipsoidal-shaped button
##
##  vtkEllipticalButtonSource creates a ellipsoidal shaped button with
##  texture coordinates suitable for application of a texture map. This
##  provides a way to make nice looking 3D buttons. The buttons are
##  represented as vtkPolyData that includes texture coordinates and
##  normals. The button lies in the x-y plane.
##
##  To use this class you must define the major and minor axes lengths of an
##  ellipsoid (expressed as width (x), height (y) and depth (z)). The button
##  has a rectangular mesh region in the center with texture coordinates that
##  range smoothly from (0,1). (This flat region is called the texture
##  region.) The outer, curved portion of the button (called the shoulder) has
##  texture coordinates set to a user specified value (by default (0,0).
##  (This results in coloring the button curve the same color as the (s,t)
##  location of the texture map.) The resolution in the radial direction, the
##  texture region, and the shoulder region must also be set. The button can
##  be moved by specifying an origin.
##
##  @sa
##  vtkButtonSource vtkRectangularButtonSource
##

import
  vtkButtonSource, vtkFiltersSourcesModule

discard "forward decl of vtkCellArray"
discard "forward decl of vtkFloatArray"
discard "forward decl of vtkPoints"
type
  vtkEllipticalButtonSource* {.importcpp: "vtkEllipticalButtonSource",
                              header: "vtkEllipticalButtonSource.h", bycopy.} = object of vtkButtonSource ##  internal variable related to axes of ellipsoid
    vtkEllipticalButtonSource* {.importc: "vtkEllipticalButtonSource".}: VTK_NEWINSTANCE


proc PrintSelf*(this: var vtkEllipticalButtonSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkEllipticalButtonSource.h".}
type
  vtkEllipticalButtonSourceSuperclass* = vtkButtonSource

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkEllipticalButtonSource::IsTypeOf(@)",
    header: "vtkEllipticalButtonSource.h".}
proc IsA*(this: var vtkEllipticalButtonSource; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkEllipticalButtonSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkEllipticalButtonSource {.
    importcpp: "vtkEllipticalButtonSource::SafeDownCast(@)",
    header: "vtkEllipticalButtonSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkEllipticalButtonSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkButtonSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkEllipticalButtonSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkEllipticalButtonSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc New*(): ptr vtkEllipticalButtonSource {.
    importcpp: "vtkEllipticalButtonSource::New(@)",
    header: "vtkEllipticalButtonSource.h".}
proc SetWidth*(this: var vtkEllipticalButtonSource; _arg: cdouble) {.
    importcpp: "SetWidth", header: "vtkEllipticalButtonSource.h".}
proc GetWidthMinValue*(this: var vtkEllipticalButtonSource): cdouble {.
    importcpp: "GetWidthMinValue", header: "vtkEllipticalButtonSource.h".}
proc GetWidthMaxValue*(this: var vtkEllipticalButtonSource): cdouble {.
    importcpp: "GetWidthMaxValue", header: "vtkEllipticalButtonSource.h".}
## !!!Ignored construct:  virtual double GetWidth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Width  of  << this -> Width ) ; return this -> Width ; } ;
## Error: expected ';'!!!

proc SetWidthHeight*(this: var vtkEllipticalButtonSource; _arg: cdouble) {.
    importcpp: "SetWidthHeight", header: "vtkEllipticalButtonSource.h".}
proc GetWidthMinValueHeightMinValue*(this: var vtkEllipticalButtonSource): cdouble {.
    importcpp: "GetWidthMinValueHeightMinValue",
    header: "vtkEllipticalButtonSource.h".}
proc GetWidthMaxValueHeightMaxValue*(this: var vtkEllipticalButtonSource): cdouble {.
    importcpp: "GetWidthMaxValueHeightMaxValue",
    header: "vtkEllipticalButtonSource.h".}
## !!!Ignored construct:  virtual double GetWidthHeight ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Height  of  << this -> Height ) ; return this -> Height ; } ;
## Error: expected ';'!!!

proc SetWidthHeightDepth*(this: var vtkEllipticalButtonSource; _arg: cdouble) {.
    importcpp: "SetWidthHeightDepth", header: "vtkEllipticalButtonSource.h".}
proc GetWidthMinValueHeightMinValueDepthMinValue*(
    this: var vtkEllipticalButtonSource): cdouble {.
    importcpp: "GetWidthMinValueHeightMinValueDepthMinValue",
    header: "vtkEllipticalButtonSource.h".}
proc GetWidthMaxValueHeightMaxValueDepthMaxValue*(
    this: var vtkEllipticalButtonSource): cdouble {.
    importcpp: "GetWidthMaxValueHeightMaxValueDepthMaxValue",
    header: "vtkEllipticalButtonSource.h".}
## !!!Ignored construct:  virtual double GetWidthHeightDepth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Depth  of  << this -> Depth ) ; return this -> Depth ; } ;
## Error: expected ';'!!!

proc SetWidthHeightDepthCircumferentialResolution*(
    this: var vtkEllipticalButtonSource; _arg: cint) {.
    importcpp: "SetWidthHeightDepthCircumferentialResolution",
    header: "vtkEllipticalButtonSource.h".}
proc GetWidthMinValueHeightMinValueDepthMinValueCircumferentialResolutionMinValue*(
    this: var vtkEllipticalButtonSource): cint {.importcpp: "GetWidthMinValueHeightMinValueDepthMinValueCircumferentialResolutionMinValue",
    header: "vtkEllipticalButtonSource.h".}
proc GetWidthMaxValueHeightMaxValueDepthMaxValueCircumferentialResolutionMaxValue*(
    this: var vtkEllipticalButtonSource): cint {.importcpp: "GetWidthMaxValueHeightMaxValueDepthMaxValueCircumferentialResolutionMaxValue",
    header: "vtkEllipticalButtonSource.h".}
## !!!Ignored construct:  virtual int GetWidthHeightDepthCircumferentialResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CircumferentialResolution  of  << this -> CircumferentialResolution ) ; return this -> CircumferentialResolution ; } ;
## Error: expected ';'!!!

proc SetWidthHeightDepthCircumferentialResolutionTextureResolution*(
    this: var vtkEllipticalButtonSource; _arg: cint) {.
    importcpp: "SetWidthHeightDepthCircumferentialResolutionTextureResolution",
    header: "vtkEllipticalButtonSource.h".}
proc GetWidthMinValueHeightMinValueDepthMinValueCircumferentialResolutionMinValueTextureResolutionMinValue*(
    this: var vtkEllipticalButtonSource): cint {.importcpp: "GetWidthMinValueHeightMinValueDepthMinValueCircumferentialResolutionMinValueTextureResolutionMinValue",
    header: "vtkEllipticalButtonSource.h".}
proc GetWidthMaxValueHeightMaxValueDepthMaxValueCircumferentialResolutionMaxValueTextureResolutionMaxValue*(
    this: var vtkEllipticalButtonSource): cint {.importcpp: "GetWidthMaxValueHeightMaxValueDepthMaxValueCircumferentialResolutionMaxValueTextureResolutionMaxValue",
    header: "vtkEllipticalButtonSource.h".}
## !!!Ignored construct:  virtual int GetWidthHeightDepthCircumferentialResolutionTextureResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TextureResolution  of  << this -> TextureResolution ) ; return this -> TextureResolution ; } ;
## Error: expected ';'!!!

proc SetWidthHeightDepthCircumferentialResolutionTextureResolutionShoulderResolution*(
    this: var vtkEllipticalButtonSource; _arg: cint) {.importcpp: "SetWidthHeightDepthCircumferentialResolutionTextureResolutionShoulderResolution",
    header: "vtkEllipticalButtonSource.h".}
proc GetWidthMinValueHeightMinValueDepthMinValueCircumferentialResolutionMinValueTextureResolutionMinValueShoulderResolutionMinValue*(
    this: var vtkEllipticalButtonSource): cint {.importcpp: "GetWidthMinValueHeightMinValueDepthMinValueCircumferentialResolutionMinValueTextureResolutionMinValueShoulderResolutionMinValue",
    header: "vtkEllipticalButtonSource.h".}
proc GetWidthMaxValueHeightMaxValueDepthMaxValueCircumferentialResolutionMaxValueTextureResolutionMaxValueShoulderResolutionMaxValue*(
    this: var vtkEllipticalButtonSource): cint {.importcpp: "GetWidthMaxValueHeightMaxValueDepthMaxValueCircumferentialResolutionMaxValueTextureResolutionMaxValueShoulderResolutionMaxValue",
    header: "vtkEllipticalButtonSource.h".}
## !!!Ignored construct:  virtual int GetWidthHeightDepthCircumferentialResolutionTextureResolutionShoulderResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ShoulderResolution  of  << this -> ShoulderResolution ) ; return this -> ShoulderResolution ; } ;
## Error: expected ';'!!!

proc SetWidthHeightDepthCircumferentialResolutionTextureResolutionShoulderResolutionRadialRatio*(
    this: var vtkEllipticalButtonSource; _arg: cdouble) {.importcpp: "SetWidthHeightDepthCircumferentialResolutionTextureResolutionShoulderResolutionRadialRatio",
    header: "vtkEllipticalButtonSource.h".}
proc GetWidthMinValueHeightMinValueDepthMinValueCircumferentialResolutionMinValueTextureResolutionMinValueShoulderResolutionMinValueRadialRatioMinValue*(
    this: var vtkEllipticalButtonSource): cdouble {.importcpp: "GetWidthMinValueHeightMinValueDepthMinValueCircumferentialResolutionMinValueTextureResolutionMinValueShoulderResolutionMinValueRadialRatioMinValue",
    header: "vtkEllipticalButtonSource.h".}
proc GetWidthMaxValueHeightMaxValueDepthMaxValueCircumferentialResolutionMaxValueTextureResolutionMaxValueShoulderResolutionMaxValueRadialRatioMaxValue*(
    this: var vtkEllipticalButtonSource): cdouble {.importcpp: "GetWidthMaxValueHeightMaxValueDepthMaxValueCircumferentialResolutionMaxValueTextureResolutionMaxValueShoulderResolutionMaxValueRadialRatioMaxValue",
    header: "vtkEllipticalButtonSource.h".}
## !!!Ignored construct:  virtual double GetWidthHeightDepthCircumferentialResolutionTextureResolutionShoulderResolutionRadialRatio ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RadialRatio  of  << this -> RadialRatio ) ; return this -> RadialRatio ; } ;
## Error: expected ';'!!!

proc SetOutputPointsPrecision*(this: var vtkEllipticalButtonSource; _arg: cint) {.
    importcpp: "SetOutputPointsPrecision", header: "vtkEllipticalButtonSource.h".}
## !!!Ignored construct:  virtual int GetWidthHeightDepthCircumferentialResolutionTextureResolutionShoulderResolutionRadialRatioOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ;
## Error: expected ';'!!!
