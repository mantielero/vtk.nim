## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRectangularButtonSource.h
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
##  @class   vtkRectangularButtonSource
##  @brief   create a rectangular button
##
##  vtkRectangularButtonSource creates a rectangular shaped button with
##  texture coordinates suitable for application of a texture map. This
##  provides a way to make nice looking 3D buttons. The buttons are
##  represented as vtkPolyData that includes texture coordinates and
##  normals. The button lies in the x-y plane.
##
##  To use this class you must define its width, height and length. These
##  measurements are all taken with respect to the shoulder of the button.
##  The shoulder is defined as follows. Imagine a box sitting on the floor.
##  The distance from the floor to the top of the box is the depth; the other
##  directions are the length (x-direction) and height (y-direction). In
##  this particular widget the box can have a smaller bottom than top. The
##  ratio in size between bottom and top is called the box ratio (by
##  default=1.0). The ratio of the texture region to the shoulder region
##  is the texture ratio. And finally the texture region may be out of plane
##  compared to the shoulder. The texture height ratio controls this.
##
##  @sa
##  vtkButtonSource vtkEllipticalButtonSource
##
##  @warning
##  The button is defined in the x-y plane. Use vtkTransformPolyDataFilter
##  or vtkGlyph3D to orient the button in a different direction.
##

import
  vtkButtonSource, vtkFiltersSourcesModule

discard "forward decl of vtkCellArray"
discard "forward decl of vtkFloatArray"
discard "forward decl of vtkPoints"
type
  vtkRectangularButtonSource* {.importcpp: "vtkRectangularButtonSource",
                               header: "vtkRectangularButtonSource.h", bycopy.} = object of vtkButtonSource
    vtkRectangularButtonSource* {.importc: "vtkRectangularButtonSource".}: VTK_NEWINSTANCE


proc PrintSelf*(this: var vtkRectangularButtonSource; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkRectangularButtonSource.h".}
type
  vtkRectangularButtonSourceSuperclass* = vtkButtonSource

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkRectangularButtonSource::IsTypeOf(@)",
    header: "vtkRectangularButtonSource.h".}
proc IsA*(this: var vtkRectangularButtonSource; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkRectangularButtonSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkRectangularButtonSource {.
    importcpp: "vtkRectangularButtonSource::SafeDownCast(@)",
    header: "vtkRectangularButtonSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkRectangularButtonSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkButtonSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRectangularButtonSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRectangularButtonSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc New*(): ptr vtkRectangularButtonSource {.
    importcpp: "vtkRectangularButtonSource::New(@)",
    header: "vtkRectangularButtonSource.h".}
proc SetWidth*(this: var vtkRectangularButtonSource; _arg: cdouble) {.
    importcpp: "SetWidth", header: "vtkRectangularButtonSource.h".}
proc GetWidthMinValue*(this: var vtkRectangularButtonSource): cdouble {.
    importcpp: "GetWidthMinValue", header: "vtkRectangularButtonSource.h".}
proc GetWidthMaxValue*(this: var vtkRectangularButtonSource): cdouble {.
    importcpp: "GetWidthMaxValue", header: "vtkRectangularButtonSource.h".}
## !!!Ignored construct:  virtual double GetWidth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Width  of  << this -> Width ) ; return this -> Width ; } ;
## Error: expected ';'!!!

proc SetWidthHeight*(this: var vtkRectangularButtonSource; _arg: cdouble) {.
    importcpp: "SetWidthHeight", header: "vtkRectangularButtonSource.h".}
proc GetWidthMinValueHeightMinValue*(this: var vtkRectangularButtonSource): cdouble {.
    importcpp: "GetWidthMinValueHeightMinValue",
    header: "vtkRectangularButtonSource.h".}
proc GetWidthMaxValueHeightMaxValue*(this: var vtkRectangularButtonSource): cdouble {.
    importcpp: "GetWidthMaxValueHeightMaxValue",
    header: "vtkRectangularButtonSource.h".}
## !!!Ignored construct:  virtual double GetWidthHeight ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Height  of  << this -> Height ) ; return this -> Height ; } ;
## Error: expected ';'!!!

proc SetWidthHeightDepth*(this: var vtkRectangularButtonSource; _arg: cdouble) {.
    importcpp: "SetWidthHeightDepth", header: "vtkRectangularButtonSource.h".}
proc GetWidthMinValueHeightMinValueDepthMinValue*(
    this: var vtkRectangularButtonSource): cdouble {.
    importcpp: "GetWidthMinValueHeightMinValueDepthMinValue",
    header: "vtkRectangularButtonSource.h".}
proc GetWidthMaxValueHeightMaxValueDepthMaxValue*(
    this: var vtkRectangularButtonSource): cdouble {.
    importcpp: "GetWidthMaxValueHeightMaxValueDepthMaxValue",
    header: "vtkRectangularButtonSource.h".}
## !!!Ignored construct:  virtual double GetWidthHeightDepth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Depth  of  << this -> Depth ) ; return this -> Depth ; } ;
## Error: expected ';'!!!

proc SetWidthHeightDepthBoxRatio*(this: var vtkRectangularButtonSource;
                                 _arg: cdouble) {.
    importcpp: "SetWidthHeightDepthBoxRatio",
    header: "vtkRectangularButtonSource.h".}
proc GetWidthMinValueHeightMinValueDepthMinValueBoxRatioMinValue*(
    this: var vtkRectangularButtonSource): cdouble {.
    importcpp: "GetWidthMinValueHeightMinValueDepthMinValueBoxRatioMinValue",
    header: "vtkRectangularButtonSource.h".}
proc GetWidthMaxValueHeightMaxValueDepthMaxValueBoxRatioMaxValue*(
    this: var vtkRectangularButtonSource): cdouble {.
    importcpp: "GetWidthMaxValueHeightMaxValueDepthMaxValueBoxRatioMaxValue",
    header: "vtkRectangularButtonSource.h".}
## !!!Ignored construct:  virtual double GetWidthHeightDepthBoxRatio ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BoxRatio  of  << this -> BoxRatio ) ; return this -> BoxRatio ; } ;
## Error: expected ';'!!!

proc SetWidthHeightDepthBoxRatioTextureRatio*(
    this: var vtkRectangularButtonSource; _arg: cdouble) {.
    importcpp: "SetWidthHeightDepthBoxRatioTextureRatio",
    header: "vtkRectangularButtonSource.h".}
proc GetWidthMinValueHeightMinValueDepthMinValueBoxRatioMinValueTextureRatioMinValue*(
    this: var vtkRectangularButtonSource): cdouble {.importcpp: "GetWidthMinValueHeightMinValueDepthMinValueBoxRatioMinValueTextureRatioMinValue",
    header: "vtkRectangularButtonSource.h".}
proc GetWidthMaxValueHeightMaxValueDepthMaxValueBoxRatioMaxValueTextureRatioMaxValue*(
    this: var vtkRectangularButtonSource): cdouble {.importcpp: "GetWidthMaxValueHeightMaxValueDepthMaxValueBoxRatioMaxValueTextureRatioMaxValue",
    header: "vtkRectangularButtonSource.h".}
## !!!Ignored construct:  virtual double GetWidthHeightDepthBoxRatioTextureRatio ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TextureRatio  of  << this -> TextureRatio ) ; return this -> TextureRatio ; } ;
## Error: expected ';'!!!

proc SetWidthHeightDepthBoxRatioTextureRatioTextureHeightRatio*(
    this: var vtkRectangularButtonSource; _arg: cdouble) {.
    importcpp: "SetWidthHeightDepthBoxRatioTextureRatioTextureHeightRatio",
    header: "vtkRectangularButtonSource.h".}
proc GetWidthMinValueHeightMinValueDepthMinValueBoxRatioMinValueTextureRatioMinValueTextureHeightRatioMinValue*(
    this: var vtkRectangularButtonSource): cdouble {.importcpp: "GetWidthMinValueHeightMinValueDepthMinValueBoxRatioMinValueTextureRatioMinValueTextureHeightRatioMinValue",
    header: "vtkRectangularButtonSource.h".}
proc GetWidthMaxValueHeightMaxValueDepthMaxValueBoxRatioMaxValueTextureRatioMaxValueTextureHeightRatioMaxValue*(
    this: var vtkRectangularButtonSource): cdouble {.importcpp: "GetWidthMaxValueHeightMaxValueDepthMaxValueBoxRatioMaxValueTextureRatioMaxValueTextureHeightRatioMaxValue",
    header: "vtkRectangularButtonSource.h".}
## !!!Ignored construct:  virtual double GetWidthHeightDepthBoxRatioTextureRatioTextureHeightRatio ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TextureHeightRatio  of  << this -> TextureHeightRatio ) ; return this -> TextureHeightRatio ; } ;
## Error: expected ';'!!!

proc SetOutputPointsPrecision*(this: var vtkRectangularButtonSource; _arg: cint) {.
    importcpp: "SetOutputPointsPrecision", header: "vtkRectangularButtonSource.h".}
## !!!Ignored construct:  virtual int GetWidthHeightDepthBoxRatioTextureRatioTextureHeightRatioOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ;
## Error: expected ';'!!!
