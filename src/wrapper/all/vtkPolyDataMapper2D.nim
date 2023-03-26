## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPolyDataMapper2D.h
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
##  @class   vtkPolyDataMapper2D
##  @brief   draw vtkPolyData onto the image plane
##
##  vtkPolyDataMapper2D is a mapper that renders 3D polygonal data
##  (vtkPolyData) onto the 2D image plane (i.e., the renderer's viewport).
##  By default, the 3D data is transformed into 2D data by ignoring the
##  z-coordinate of the 3D points in vtkPolyData, and taking the x-y values
##  as local display values (i.e., pixel coordinates). Alternatively, you
##  can provide a vtkCoordinate object that will transform the data into
##  local display coordinates (use the vtkCoordinate::SetCoordinateSystem()
##  methods to indicate which coordinate system you are transforming the
##  data from).
##
##  @sa
##  vtkMapper2D vtkActor2D
##

import
  vtkMapper2D, vtkRenderingCoreModule

discard "forward decl of vtkCoordinate"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkScalarsToColors"
discard "forward decl of vtkUnsignedCharArray"
type
  vtkPolyDataMapper2D* {.importcpp: "vtkPolyDataMapper2D",
                        header: "vtkPolyDataMapper2D.h", bycopy.} = object of vtkMapper2D
    vtkPolyDataMapper2D* {.importc: "vtkPolyDataMapper2D".}: VTK_NEWINSTANCE
    ##  for coloring by a component of a field data array

  vtkPolyDataMapper2DSuperclass* = vtkMapper2D

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPolyDataMapper2D::IsTypeOf(@)", header: "vtkPolyDataMapper2D.h".}
proc IsA*(this: var vtkPolyDataMapper2D; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPolyDataMapper2D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPolyDataMapper2D {.
    importcpp: "vtkPolyDataMapper2D::SafeDownCast(@)",
    header: "vtkPolyDataMapper2D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPolyDataMapper2D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMapper2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPolyDataMapper2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPolyDataMapper2D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc New*(): ptr vtkPolyDataMapper2D {.importcpp: "vtkPolyDataMapper2D::New(@)",
                                   header: "vtkPolyDataMapper2D.h".}
proc PrintSelf*(this: var vtkPolyDataMapper2D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPolyDataMapper2D.h".}
proc SetInputData*(this: var vtkPolyDataMapper2D; `in`: ptr vtkPolyData) {.
    importcpp: "SetInputData", header: "vtkPolyDataMapper2D.h".}
proc GetInput*(this: var vtkPolyDataMapper2D): ptr vtkPolyData {.
    importcpp: "GetInput", header: "vtkPolyDataMapper2D.h".}
proc SetLookupTable*(this: var vtkPolyDataMapper2D; lut: ptr vtkScalarsToColors) {.
    importcpp: "SetLookupTable", header: "vtkPolyDataMapper2D.h".}
proc GetLookupTable*(this: var vtkPolyDataMapper2D): ptr vtkScalarsToColors {.
    importcpp: "GetLookupTable", header: "vtkPolyDataMapper2D.h".}
proc CreateDefaultLookupTable*(this: var vtkPolyDataMapper2D) {.
    importcpp: "CreateDefaultLookupTable", header: "vtkPolyDataMapper2D.h".}
proc SetScalarVisibility*(this: var vtkPolyDataMapper2D; _arg: vtkTypeBool) {.
    importcpp: "SetScalarVisibility", header: "vtkPolyDataMapper2D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetScalarVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarVisibility  of  << this -> ScalarVisibility ) ; return this -> ScalarVisibility ; } ;
## Error: expected ';'!!!

proc ScalarVisibilityOn*(this: var vtkPolyDataMapper2D) {.
    importcpp: "ScalarVisibilityOn", header: "vtkPolyDataMapper2D.h".}
proc ScalarVisibilityOff*(this: var vtkPolyDataMapper2D) {.
    importcpp: "ScalarVisibilityOff", header: "vtkPolyDataMapper2D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Control how the scalar data is mapped to colors.  By default
  ##  (ColorModeToDefault), unsigned char scalars are treated as
  ##  colors, and NOT mapped through the lookup table, while everything
  ##  else is. ColorModeToDirectScalar extends ColorModeToDefault such
  ##  that all integer types are treated as colors with values in the
  ##  range 0-255 and floating types are treated as colors with values
  ##  in the range 0.0-1.0. Setting
  ##  ColorModeToMapScalars means that all scalar data will be mapped through
  ##  the lookup table.  (Note that for multi-component scalars, the
  ##  particular component to use for mapping can be specified using the
  ##  ColorByArrayComponent() method.)
  ##
proc SetScalarVisibilityColorMode*(this: var vtkPolyDataMapper2D; _arg: cint) {.
    importcpp: "SetScalarVisibilityColorMode", header: "vtkPolyDataMapper2D.h".}
## !!!Ignored construct:  virtual int GetScalarVisibilityColorMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ColorMode  of  << this -> ColorMode ) ; return this -> ColorMode ; } ;
## Error: expected ';'!!!

proc SetColorModeToDefault*(this: var vtkPolyDataMapper2D) {.
    importcpp: "SetColorModeToDefault", header: "vtkPolyDataMapper2D.h".}
proc SetColorModeToMapScalars*(this: var vtkPolyDataMapper2D) {.
    importcpp: "SetColorModeToMapScalars", header: "vtkPolyDataMapper2D.h".}
proc SetColorModeToDirectScalars*(this: var vtkPolyDataMapper2D) {.
    importcpp: "SetColorModeToDirectScalars", header: "vtkPolyDataMapper2D.h".}
proc GetColorModeAsString*(this: var vtkPolyDataMapper2D): cstring {.
    importcpp: "GetColorModeAsString", header: "vtkPolyDataMapper2D.h".}
proc SetScalarVisibilityColorModeUseLookupTableScalarRange*(
    this: var vtkPolyDataMapper2D; _arg: vtkTypeBool) {.
    importcpp: "SetScalarVisibilityColorModeUseLookupTableScalarRange",
    header: "vtkPolyDataMapper2D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetScalarVisibilityColorModeUseLookupTableScalarRange ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseLookupTableScalarRange  of  << this -> UseLookupTableScalarRange ) ; return this -> UseLookupTableScalarRange ; } ;
## Error: expected ';'!!!

proc UseLookupTableScalarRangeOn*(this: var vtkPolyDataMapper2D) {.
    importcpp: "UseLookupTableScalarRangeOn", header: "vtkPolyDataMapper2D.h".}
proc UseLookupTableScalarRangeOff*(this: var vtkPolyDataMapper2D) {.
    importcpp: "UseLookupTableScalarRangeOff", header: "vtkPolyDataMapper2D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify range in terms of scalar minimum and maximum (smin,smax). These
  ##  values are used to map scalars into lookup table. Has no effect when
  ##  UseLookupTableScalarRange is true.
  ##
proc SetScalarRange*(this: var vtkPolyDataMapper2D; _arg1: cdouble; _arg2: cdouble) {.
    importcpp: "SetScalarRange", header: "vtkPolyDataMapper2D.h".}
proc SetScalarRange*(this: var vtkPolyDataMapper2D; _arg: array[2, cdouble]) {.
    importcpp: "SetScalarRange", header: "vtkPolyDataMapper2D.h".}
## !!!Ignored construct:  virtual double * GetScalarRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarRange  pointer  << this -> ScalarRange ) ; return this -> ScalarRange ; } VTK_WRAPEXCLUDE virtual void GetScalarRange ( double data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> ScalarRange [ i ] ; } } ;
## Error: expected ';'!!!

proc SetScalarVisibilityColorModeUseLookupTableScalarRangeScalarMode*(
    this: var vtkPolyDataMapper2D; _arg: cint) {.importcpp: "SetScalarVisibilityColorModeUseLookupTableScalarRangeScalarMode",
    header: "vtkPolyDataMapper2D.h".}
## !!!Ignored construct:  virtual int GetScalarVisibilityColorModeUseLookupTableScalarRangeScalarMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarMode  of  << this -> ScalarMode ) ; return this -> ScalarMode ; } ;
## Error: expected ';'!!!

proc SetScalarModeToDefault*(this: var vtkPolyDataMapper2D) {.
    importcpp: "SetScalarModeToDefault", header: "vtkPolyDataMapper2D.h".}
proc SetScalarModeToUsePointData*(this: var vtkPolyDataMapper2D) {.
    importcpp: "SetScalarModeToUsePointData", header: "vtkPolyDataMapper2D.h".}
proc SetScalarModeToUseCellData*(this: var vtkPolyDataMapper2D) {.
    importcpp: "SetScalarModeToUseCellData", header: "vtkPolyDataMapper2D.h".}
proc SetScalarModeToUsePointFieldData*(this: var vtkPolyDataMapper2D) {.
    importcpp: "SetScalarModeToUsePointFieldData", header: "vtkPolyDataMapper2D.h".}
proc SetScalarModeToUseCellFieldData*(this: var vtkPolyDataMapper2D) {.
    importcpp: "SetScalarModeToUseCellFieldData", header: "vtkPolyDataMapper2D.h".}
proc ColorByArrayComponent*(this: var vtkPolyDataMapper2D; arrayNum: cint;
                           component: cint) {.importcpp: "ColorByArrayComponent",
    header: "vtkPolyDataMapper2D.h".}
proc ColorByArrayComponent*(this: var vtkPolyDataMapper2D; arrayName: cstring;
                           component: cint) {.importcpp: "ColorByArrayComponent",
    header: "vtkPolyDataMapper2D.h".}
proc GetArrayName*(this: var vtkPolyDataMapper2D): cstring {.
    importcpp: "GetArrayName", header: "vtkPolyDataMapper2D.h".}
proc GetArrayId*(this: var vtkPolyDataMapper2D): cint {.importcpp: "GetArrayId",
    header: "vtkPolyDataMapper2D.h".}
proc GetArrayAccessMode*(this: var vtkPolyDataMapper2D): cint {.
    importcpp: "GetArrayAccessMode", header: "vtkPolyDataMapper2D.h".}
proc GetArrayComponent*(this: var vtkPolyDataMapper2D): cint {.
    importcpp: "GetArrayComponent", header: "vtkPolyDataMapper2D.h".}
proc GetMTime*(this: var vtkPolyDataMapper2D): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkPolyDataMapper2D.h".}
proc SetTransformCoordinate*(this: var vtkPolyDataMapper2D; a2: ptr vtkCoordinate) {.
    importcpp: "SetTransformCoordinate", header: "vtkPolyDataMapper2D.h".}
proc GetnameTransformCoordinate*(this: var vtkPolyDataMapper2D): ptr vtkCoordinate {.
    importcpp: "GetnameTransformCoordinate", header: "vtkPolyDataMapper2D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify whether or not rounding to integers the transformed points when
  ##  TransformCoordinate is set. By default, it does not use double precision.
  ##
## !!!Ignored construct:  virtual bool GetScalarVisibilityColorModeUseLookupTableScalarRangeScalarModeTransformCoordinateUseDouble ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TransformCoordinateUseDouble  of  << this -> TransformCoordinateUseDouble ) ; return this -> TransformCoordinateUseDouble ; } ;
## Error: expected ';'!!!

proc SetScalarVisibilityColorModeUseLookupTableScalarRangeScalarModeTransformCoordinateUseDouble*(
    this: var vtkPolyDataMapper2D; _arg: bool) {.importcpp: "SetScalarVisibilityColorModeUseLookupTableScalarRangeScalarModeTransformCoordinateUseDouble",
    header: "vtkPolyDataMapper2D.h".}
proc TransformCoordinateUseDoubleOn*(this: var vtkPolyDataMapper2D) {.
    importcpp: "TransformCoordinateUseDoubleOn", header: "vtkPolyDataMapper2D.h".}
proc TransformCoordinateUseDoubleOff*(this: var vtkPolyDataMapper2D) {.
    importcpp: "TransformCoordinateUseDoubleOff", header: "vtkPolyDataMapper2D.h".}
  ## /@}
  ## *
  ##  Map the scalars (if there are any scalars and ScalarVisibility is on)
  ##  through the lookup table, returning an unsigned char RGBA array. This is
  ##  typically done as part of the rendering process. The alpha parameter
  ##  allows the blending of the scalars with an additional alpha (typically
  ##  which comes from a vtkActor, etc.)
  ##
proc MapScalars*(this: var vtkPolyDataMapper2D; alpha: cdouble): ptr vtkUnsignedCharArray {.
    importcpp: "MapScalars", header: "vtkPolyDataMapper2D.h".}
proc ShallowCopy*(this: var vtkPolyDataMapper2D; m: ptr vtkAbstractMapper) {.
    importcpp: "ShallowCopy", header: "vtkPolyDataMapper2D.h".}