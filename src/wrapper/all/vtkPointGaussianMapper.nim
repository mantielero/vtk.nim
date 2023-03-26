## =========================================================================
##
##   Program:   Visualization Toolkit
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
##  @class   vtkPointGaussianMapper
##  @brief   draw PointGaussians using imposters
##
##
##  A mapper that uses imposters to draw gaussian splats or other shapes if
##  custom shader code is set. Supports transparency and picking as well. It
##  draws all the points and does not require cell arrays. If cell arrays are
##  provided it will only draw the points used by the Verts cell array. The shape
##  of the imposter is a triangle.
##

import
  vtkPolyDataMapper, vtkRenderingCoreModule

discard "forward decl of vtkPiecewiseFunction"
type
  vtkPointGaussianMapper* {.importcpp: "vtkPointGaussianMapper",
                           header: "vtkPointGaussianMapper.h", bycopy.} = object of vtkPolyDataMapper
    vtkPointGaussianMapper* {.importc: "vtkPointGaussianMapper".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPointGaussianMapper {.importcpp: "vtkPointGaussianMapper::New(@)",
                                      header: "vtkPointGaussianMapper.h".}
type
  vtkPointGaussianMapperSuperclass* = vtkPolyDataMapper

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPointGaussianMapper::IsTypeOf(@)",
    header: "vtkPointGaussianMapper.h".}
proc IsA*(this: var vtkPointGaussianMapper; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPointGaussianMapper.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPointGaussianMapper {.
    importcpp: "vtkPointGaussianMapper::SafeDownCast(@)",
    header: "vtkPointGaussianMapper.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPointGaussianMapper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPointGaussianMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPointGaussianMapper :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPointGaussianMapper; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPointGaussianMapper.h".}
proc SetScaleFunction*(this: var vtkPointGaussianMapper;
                      a2: ptr vtkPiecewiseFunction) {.
    importcpp: "SetScaleFunction", header: "vtkPointGaussianMapper.h".}
proc GetnameScaleFunction*(this: var vtkPointGaussianMapper): ptr vtkPiecewiseFunction {.
    importcpp: "GetnameScaleFunction", header: "vtkPointGaussianMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  The size of the table used in computing scale, used when
  ##  converting a vtkPiecewiseFunction to a table
  ##
proc SetScaleTableSize*(this: var vtkPointGaussianMapper; _arg: cint) {.
    importcpp: "SetScaleTableSize", header: "vtkPointGaussianMapper.h".}
## !!!Ignored construct:  virtual int GetScaleTableSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScaleTableSize  of  << this -> ScaleTableSize ) ; return this -> ScaleTableSize ; } ;
## Error: expected ';'!!!

proc SetScaleArray*(this: var vtkPointGaussianMapper; _arg: cstring) {.
    importcpp: "SetScaleArray", header: "vtkPointGaussianMapper.h".}
proc GetScaleArray*(this: var vtkPointGaussianMapper): cstring {.
    importcpp: "GetScaleArray", header: "vtkPointGaussianMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  Convenience method to set the component of the array to scale with.
  ##
proc SetScaleTableSizeScaleArrayComponent*(this: var vtkPointGaussianMapper;
    _arg: cint) {.importcpp: "SetScaleTableSizeScaleArrayComponent",
                header: "vtkPointGaussianMapper.h".}
## !!!Ignored construct:  virtual int GetScaleTableSizeScaleArrayComponent ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScaleArrayComponent  of  << this -> ScaleArrayComponent ) ; return this -> ScaleArrayComponent ; } ;
## Error: expected ';'!!!

proc SetScaleTableSizeScaleArrayComponentScaleFactor*(
    this: var vtkPointGaussianMapper; _arg: cdouble) {.
    importcpp: "SetScaleTableSizeScaleArrayComponentScaleFactor",
    header: "vtkPointGaussianMapper.h".}
## !!!Ignored construct:  virtual double GetScaleTableSizeScaleArrayComponentScaleFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScaleFactor  of  << this -> ScaleFactor ) ; return this -> ScaleFactor ; } ;
## Error: expected ';'!!!

proc SetScaleTableSizeScaleArrayComponentScaleFactorEmissive*(
    this: var vtkPointGaussianMapper; _arg: vtkTypeBool) {.
    importcpp: "SetScaleTableSizeScaleArrayComponentScaleFactorEmissive",
    header: "vtkPointGaussianMapper.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetScaleTableSizeScaleArrayComponentScaleFactorEmissive ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Emissive  of  << this -> Emissive ) ; return this -> Emissive ; } ;
## Error: expected ';'!!!

proc EmissiveOn*(this: var vtkPointGaussianMapper) {.importcpp: "EmissiveOn",
    header: "vtkPointGaussianMapper.h".}
proc EmissiveOff*(this: var vtkPointGaussianMapper) {.importcpp: "EmissiveOff",
    header: "vtkPointGaussianMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the optional opacity transfer function. This is only
  ##  used when an OpacityArray is also specified.
  ##
proc SetScalarOpacityFunction*(this: var vtkPointGaussianMapper;
                              a2: ptr vtkPiecewiseFunction) {.
    importcpp: "SetScalarOpacityFunction", header: "vtkPointGaussianMapper.h".}
proc GetnameScaleFunctionScalarOpacityFunction*(this: var vtkPointGaussianMapper): ptr vtkPiecewiseFunction {.
    importcpp: "GetnameScaleFunctionScalarOpacityFunction",
    header: "vtkPointGaussianMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  The size of the table used in computing opacities, used when
  ##  converting a vtkPiecewiseFunction to a table
  ##
proc SetScaleTableSizeScaleArrayComponentScaleFactorEmissiveOpacityTableSize*(
    this: var vtkPointGaussianMapper; _arg: cint) {.importcpp: "SetScaleTableSizeScaleArrayComponentScaleFactorEmissiveOpacityTableSize",
    header: "vtkPointGaussianMapper.h".}
## !!!Ignored construct:  virtual int GetScaleTableSizeScaleArrayComponentScaleFactorEmissiveOpacityTableSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OpacityTableSize  of  << this -> OpacityTableSize ) ; return this -> OpacityTableSize ; } ;
## Error: expected ';'!!!

proc SetScaleArrayOpacityArray*(this: var vtkPointGaussianMapper; _arg: cstring) {.
    importcpp: "SetScaleArrayOpacityArray", header: "vtkPointGaussianMapper.h".}
proc GetScaleArrayOpacityArray*(this: var vtkPointGaussianMapper): cstring {.
    importcpp: "GetScaleArrayOpacityArray", header: "vtkPointGaussianMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  Convenience method to set the component of the array to opacify with.
  ##
proc SetScaleTableSizeScaleArrayComponentScaleFactorEmissiveOpacityTableSizeOpacityArrayComponent*(
    this: var vtkPointGaussianMapper; _arg: cint) {.importcpp: "SetScaleTableSizeScaleArrayComponentScaleFactorEmissiveOpacityTableSizeOpacityArrayComponent",
    header: "vtkPointGaussianMapper.h".}
## !!!Ignored construct:  virtual int GetScaleTableSizeScaleArrayComponentScaleFactorEmissiveOpacityTableSizeOpacityArrayComponent ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OpacityArrayComponent  of  << this -> OpacityArrayComponent ) ; return this -> OpacityArrayComponent ; } ;
## Error: expected ';'!!!

proc SetScaleArrayOpacityArraySplatShaderCode*(this: var vtkPointGaussianMapper;
    _arg: cstring) {.importcpp: "SetScaleArrayOpacityArraySplatShaderCode",
                   header: "vtkPointGaussianMapper.h".}
proc GetScaleArrayOpacityArraySplatShaderCode*(this: var vtkPointGaussianMapper): cstring {.
    importcpp: "GetScaleArrayOpacityArraySplatShaderCode",
    header: "vtkPointGaussianMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  When drawing triangles as opposed too point mode
  ##  (triangles are for splats shaders that are bigger than a pixel)
  ##  this controls how large the triangle will be. By default it
  ##  is large enough to contain a cicle of radius 3.0*scale which works
  ##  well for gaussian splats as after 3.0 standard deviations the
  ##  opacity is near zero. For custom shader codes a different
  ##  value can be used. Generally you should use the lowest value you can
  ##  as it will result in fewer fragments. For example if your custom
  ##  shader only draws a disc of radius 1.0*scale, then set this to 1.0
  ##  to avoid sending many fragments to the shader that will just get
  ##  discarded.
  ##
proc SetScaleTableSizeScaleArrayComponentScaleFactorEmissiveOpacityTableSizeOpacityArrayComponentTriangleScale*(
    this: var vtkPointGaussianMapper; _arg: cfloat) {.importcpp: "SetScaleTableSizeScaleArrayComponentScaleFactorEmissiveOpacityTableSizeOpacityArrayComponentTriangleScale",
    header: "vtkPointGaussianMapper.h".}
## !!!Ignored construct:  virtual float GetScaleTableSizeScaleArrayComponentScaleFactorEmissiveOpacityTableSizeOpacityArrayComponentTriangleScale ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TriangleScale  of  << this -> TriangleScale ) ; return this -> TriangleScale ; } ;
## Error: expected ';'!!!

proc GetSupportsSelection*(this: var vtkPointGaussianMapper): bool {.
    importcpp: "GetSupportsSelection", header: "vtkPointGaussianMapper.h".}