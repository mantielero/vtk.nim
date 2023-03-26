## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkProperty2D.h
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
##  @class   vtkProperty2D
##  @brief   represent surface properties of a 2D image
##
##  vtkProperty2D contains properties used to render two dimensional images
##  and annotations.
##
##  @sa
##  vtkActor2D
##

import
  vtkObject, vtkRenderingCoreModule

discard "forward decl of vtkViewport"
const
  VTK_BACKGROUND_LOCATION* = 0
  VTK_FOREGROUND_LOCATION* = 1

type
  vtkProperty2D* {.importcpp: "vtkProperty2D", header: "vtkProperty2D.h", bycopy.} = object of vtkObject
    vtkProperty2D* {.importc: "vtkProperty2D".}: VTK_NEWINSTANCE

  vtkProperty2DSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkProperty2D::IsTypeOf(@)", header: "vtkProperty2D.h".}
proc IsA*(this: var vtkProperty2D; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkProperty2D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkProperty2D {.
    importcpp: "vtkProperty2D::SafeDownCast(@)", header: "vtkProperty2D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkProperty2D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkProperty2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkProperty2D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkProperty2D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkProperty2D.h".}
proc New*(): ptr vtkProperty2D {.importcpp: "vtkProperty2D::New(@)",
                             header: "vtkProperty2D.h".}
proc DeepCopy*(this: var vtkProperty2D; p: ptr vtkProperty2D) {.importcpp: "DeepCopy",
    header: "vtkProperty2D.h".}
proc SetColor*(this: var vtkProperty2D; _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetColor", header: "vtkProperty2D.h".}
proc SetColor*(this: var vtkProperty2D; _arg: array[3, cdouble]) {.
    importcpp: "SetColor", header: "vtkProperty2D.h".}
## !!!Ignored construct:  virtual double * GetColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Color  pointer  << this -> Color ) ; return this -> Color ; } VTK_WRAPEXCLUDE virtual void GetColor ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Color [ 0 ] ; _arg2 = this -> Color [ 1 ] ; _arg3 = this -> Color [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Color  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetColor ( double _arg [ 3 ] ) { this -> GetColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Set/Get the Opacity of this property.
##  virtual double GetOpacityOpacity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Opacity  of  << this -> Opacity ) ; return this -> Opacity ; } ;
## Error: expected ';'!!!

proc SetOpacity*(this: var vtkProperty2D; _arg: cdouble) {.importcpp: "SetOpacity",
    header: "vtkProperty2D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the diameter of a Point. The size is expressed in screen units.
  ##  This is only implemented for OpenGL. The default is 1.0.
  ##
proc SetPointSize*(this: var vtkProperty2D; _arg: cfloat) {.importcpp: "SetPointSize",
    header: "vtkProperty2D.h".}
proc GetPointSizeMinValue*(this: var vtkProperty2D): cfloat {.
    importcpp: "GetPointSizeMinValue", header: "vtkProperty2D.h".}
proc GetPointSizeMaxValue*(this: var vtkProperty2D): cfloat {.
    importcpp: "GetPointSizeMaxValue", header: "vtkProperty2D.h".}
## !!!Ignored construct:  virtual float GetOpacityOpacityPointSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PointSize  of  << this -> PointSize ) ; return this -> PointSize ; } ;
## Error: expected ';'!!!

proc SetPointSizeLineWidth*(this: var vtkProperty2D; _arg: cfloat) {.
    importcpp: "SetPointSizeLineWidth", header: "vtkProperty2D.h".}
proc GetPointSizeMinValueLineWidthMinValue*(this: var vtkProperty2D): cfloat {.
    importcpp: "GetPointSizeMinValueLineWidthMinValue", header: "vtkProperty2D.h".}
proc GetPointSizeMaxValueLineWidthMaxValue*(this: var vtkProperty2D): cfloat {.
    importcpp: "GetPointSizeMaxValueLineWidthMaxValue", header: "vtkProperty2D.h".}
## !!!Ignored construct:  virtual float GetOpacityOpacityPointSizeLineWidth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LineWidth  of  << this -> LineWidth ) ; return this -> LineWidth ; } ;
## Error: expected ';'!!!

proc SetOpacityLineStipplePattern*(this: var vtkProperty2D; _arg: cint) {.
    importcpp: "SetOpacityLineStipplePattern", header: "vtkProperty2D.h".}
## !!!Ignored construct:  virtual int GetOpacityOpacityPointSizeLineWidthLineStipplePattern ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LineStipplePattern  of  << this -> LineStipplePattern ) ; return this -> LineStipplePattern ; } ;
## Error: expected ';'!!!

proc SetPointSizeLineWidthLineStippleRepeatFactor*(this: var vtkProperty2D;
    _arg: cint) {.importcpp: "SetPointSizeLineWidthLineStippleRepeatFactor",
                header: "vtkProperty2D.h".}
proc GetPointSizeMinValueLineWidthMinValueLineStippleRepeatFactorMinValue*(
    this: var vtkProperty2D): cint {.importcpp: "GetPointSizeMinValueLineWidthMinValueLineStippleRepeatFactorMinValue",
                                 header: "vtkProperty2D.h".}
proc GetPointSizeMaxValueLineWidthMaxValueLineStippleRepeatFactorMaxValue*(
    this: var vtkProperty2D): cint {.importcpp: "GetPointSizeMaxValueLineWidthMaxValueLineStippleRepeatFactorMaxValue",
                                 header: "vtkProperty2D.h".}
## !!!Ignored construct:  virtual int GetOpacityOpacityPointSizeLineWidthLineStipplePatternLineStippleRepeatFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LineStippleRepeatFactor  of  << this -> LineStippleRepeatFactor ) ; return this -> LineStippleRepeatFactor ; } ;
## Error: expected ';'!!!

proc SetPointSizeLineWidthLineStippleRepeatFactorDisplayLocation*(
    this: var vtkProperty2D; _arg: cint) {.importcpp: "SetPointSizeLineWidthLineStippleRepeatFactorDisplayLocation",
                                      header: "vtkProperty2D.h".}
proc GetPointSizeMinValueLineWidthMinValueLineStippleRepeatFactorMinValueDisplayLocationMinValue*(
    this: var vtkProperty2D): cint {.importcpp: "GetPointSizeMinValueLineWidthMinValueLineStippleRepeatFactorMinValueDisplayLocationMinValue",
                                 header: "vtkProperty2D.h".}
proc GetPointSizeMaxValueLineWidthMaxValueLineStippleRepeatFactorMaxValueDisplayLocationMaxValue*(
    this: var vtkProperty2D): cint {.importcpp: "GetPointSizeMaxValueLineWidthMaxValueLineStippleRepeatFactorMaxValueDisplayLocationMaxValue",
                                 header: "vtkProperty2D.h".}
## !!!Ignored construct:  virtual int GetOpacityOpacityPointSizeLineWidthLineStipplePatternLineStippleRepeatFactorDisplayLocation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DisplayLocation  of  << this -> DisplayLocation ) ; return this -> DisplayLocation ; } ;
## Error: expected ';'!!!

proc SetDisplayLocationToBackground*(this: var vtkProperty2D) {.
    importcpp: "SetDisplayLocationToBackground", header: "vtkProperty2D.h".}
proc SetDisplayLocationToForeground*(this: var vtkProperty2D) {.
    importcpp: "SetDisplayLocationToForeground", header: "vtkProperty2D.h".}
proc Render*(this: var vtkProperty2D;
            vtkNotUsed: proc (a1: viewport): ptr vtkViewport) {.importcpp: "Render",
    header: "vtkProperty2D.h".}