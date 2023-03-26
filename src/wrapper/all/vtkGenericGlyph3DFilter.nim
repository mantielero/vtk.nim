## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGenericGlyph3DFilter.h
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
##  @class   vtkGenericGlyph3DFilter
##  @brief   copy oriented and scaled glyph geometry to every input point
##
##  vtkGenericGlyph3DFilter is a filter that copies a geometric representation (called
##  a glyph) to every point in the input dataset. The glyph is defined with
##  polygonal data from a source filter input. The glyph may be oriented
##  along the input vectors or normals, and it may be scaled according to
##  scalar data or vector magnitude. More than one glyph may be used by
##  creating a table of source objects, each defining a different glyph. If a
##  table of glyphs is defined, then the table can be indexed into by using
##  either scalar value or vector magnitude.
##
##  To use this object you'll have to provide an input dataset and a source
##  to define the glyph. Then decide whether you want to scale the glyph and
##  how to scale the glyph (using scalar value or vector magnitude). Next
##  decide whether you want to orient the glyph, and whether to use the
##  vector data or normal data to orient it. Finally, decide whether to use a
##  table of glyphs, or just a single glyph. If you use a table of glyphs,
##  you'll have to decide whether to index into it with scalar value or with
##  vector magnitude.
##
##  @warning
##  Contrary to vtkGlyph3D, the only way to specify which attributes will be
##  used for scaling, coloring and orienting is through SelectInputScalars(),
##  SelectInputVectors() and SelectInputNormals().
##
##  @warning
##  The scaling of the glyphs is controlled by the ScaleFactor ivar multiplied
##  by the scalar value at each point (if VTK_SCALE_BY_SCALAR is set), or
##  multiplied by the vector magnitude (if VTK_SCALE_BY_VECTOR is set),
##  Alternatively (if VTK_SCALE_BY_VECTORCOMPONENTS is set), the scaling
##  may be specified for x,y,z using the vector components. The
##  scale factor can be further controlled by enabling clamping using the
##  Clamping ivar. If clamping is enabled, the scale is normalized by the
##  Range ivar, and then multiplied by the scale factor. The normalization
##  process includes clamping the scale value between (0,1).
##
##  @warning
##  Typically this object operates on input data with scalar and/or vector
##  data. However, scalar and/or vector aren't necessary, and it can be used
##  to copy data from a single source to each point. In this case the scale
##  factor can be used to uniformly scale the glyphs.
##
##  @warning
##  The object uses "vector" data to scale glyphs, orient glyphs, and/or index
##  into a table of glyphs. You can choose to use either the vector or normal
##  data at each input point. Use the method SetVectorModeToUseVector() to use
##  the vector input data, and SetVectorModeToUseNormal() to use the
##  normal input data.
##
##  @warning
##  If you do use a table of glyphs, make sure to set the Range ivar to make
##  sure the index into the glyph table is computed correctly.
##
##  @warning
##  You can turn off scaling of the glyphs completely by using the Scaling
##  ivar. You can also turn off scaling due to data (either vector or scalar)
##  by using the SetScaleModeToDataScalingOff() method.
##
##  @sa
##  vtkTensorGlyph
##

import
  vtkFiltersGenericModule, vtkPolyDataAlgorithm

const
  VTK_SCALE_BY_SCALAR* = 0
  VTK_SCALE_BY_VECTOR* = 1
  VTK_SCALE_BY_VECTORCOMPONENTS* = 2
  VTK_DATA_SCALING_OFF* = 3
  VTK_COLOR_BY_SCALE* = 0
  VTK_COLOR_BY_SCALAR* = 1
  VTK_COLOR_BY_VECTOR* = 2
  VTK_USE_VECTOR* = 0
  VTK_USE_NORMAL* = 1
  VTK_VECTOR_ROTATION_OFF* = 2
  VTK_INDEXING_OFF* = 0
  VTK_INDEXING_BY_SCALAR* = 1
  VTK_INDEXING_BY_VECTOR* = 2

type
  vtkGenericGlyph3DFilter* {.importcpp: "vtkGenericGlyph3DFilter",
                            header: "vtkGenericGlyph3DFilter.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkGenericGlyph3DFilter* {.importc: "vtkGenericGlyph3DFilter".}: VTK_NEWINSTANCE
    ##  Geometry to copy to each point
    ##  Determine whether scaling of geometry is performed
    ##  Scale by scalar value or vector magnitude
    ##  new scalars based on scale, scalar or vector
    ##  Scale factor to use to scale geometry
    ##  Range to use to perform scalar scaling
    ##  boolean controls whether to "orient" data
    ##  Orient/scale via normal or via vector data
    ##  whether to clamp scale factor
    ##  what to use to index into glyph table
    ##  produce input points ids for each output point

  vtkGenericGlyph3DFilterSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGenericGlyph3DFilter::IsTypeOf(@)",
    header: "vtkGenericGlyph3DFilter.h".}
proc IsA*(this: var vtkGenericGlyph3DFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkGenericGlyph3DFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGenericGlyph3DFilter {.
    importcpp: "vtkGenericGlyph3DFilter::SafeDownCast(@)",
    header: "vtkGenericGlyph3DFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGenericGlyph3DFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGenericGlyph3DFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGenericGlyph3DFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGenericGlyph3DFilter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGenericGlyph3DFilter.h".}
proc New*(): ptr vtkGenericGlyph3DFilter {.importcpp: "vtkGenericGlyph3DFilter::New(@)",
                                       header: "vtkGenericGlyph3DFilter.h".}
proc SetSourceData*(this: var vtkGenericGlyph3DFilter; pd: ptr vtkPolyData) {.
    importcpp: "SetSourceData", header: "vtkGenericGlyph3DFilter.h".}
proc SetSourceData*(this: var vtkGenericGlyph3DFilter; id: cint; pd: ptr vtkPolyData) {.
    importcpp: "SetSourceData", header: "vtkGenericGlyph3DFilter.h".}
proc GetSource*(this: var vtkGenericGlyph3DFilter; id: cint = 0): ptr vtkPolyData {.
    importcpp: "GetSource", header: "vtkGenericGlyph3DFilter.h".}
proc SetScaling*(this: var vtkGenericGlyph3DFilter; _arg: vtkTypeBool) {.
    importcpp: "SetScaling", header: "vtkGenericGlyph3DFilter.h".}
proc ScalingOn*(this: var vtkGenericGlyph3DFilter) {.importcpp: "ScalingOn",
    header: "vtkGenericGlyph3DFilter.h".}
proc ScalingOff*(this: var vtkGenericGlyph3DFilter) {.importcpp: "ScalingOff",
    header: "vtkGenericGlyph3DFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetScaling ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Scaling  of  << this -> Scaling ) ; return this -> Scaling ; } ;
## Error: expected ';'!!!

proc SetScalingScaleMode*(this: var vtkGenericGlyph3DFilter; _arg: cint) {.
    importcpp: "SetScalingScaleMode", header: "vtkGenericGlyph3DFilter.h".}
## !!!Ignored construct:  virtual int GetScalingScaleMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScaleMode  of  << this -> ScaleMode ) ; return this -> ScaleMode ; } ;
## Error: expected ';'!!!

proc SetScaleModeToScaleByScalar*(this: var vtkGenericGlyph3DFilter) {.
    importcpp: "SetScaleModeToScaleByScalar", header: "vtkGenericGlyph3DFilter.h".}
proc SetScaleModeToScaleByVector*(this: var vtkGenericGlyph3DFilter) {.
    importcpp: "SetScaleModeToScaleByVector", header: "vtkGenericGlyph3DFilter.h".}
proc SetScaleModeToScaleByVectorComponents*(this: var vtkGenericGlyph3DFilter) {.
    importcpp: "SetScaleModeToScaleByVectorComponents",
    header: "vtkGenericGlyph3DFilter.h".}
proc SetScaleModeToDataScalingOff*(this: var vtkGenericGlyph3DFilter) {.
    importcpp: "SetScaleModeToDataScalingOff", header: "vtkGenericGlyph3DFilter.h".}
proc GetScaleModeAsString*(this: var vtkGenericGlyph3DFilter): cstring {.
    importcpp: "GetScaleModeAsString", header: "vtkGenericGlyph3DFilter.h".}
proc SetScalingScaleModeColorMode*(this: var vtkGenericGlyph3DFilter; _arg: cint) {.
    importcpp: "SetScalingScaleModeColorMode", header: "vtkGenericGlyph3DFilter.h".}
## !!!Ignored construct:  virtual int GetScalingScaleModeColorMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ColorMode  of  << this -> ColorMode ) ; return this -> ColorMode ; } ;
## Error: expected ';'!!!

proc SetColorModeToColorByScale*(this: var vtkGenericGlyph3DFilter) {.
    importcpp: "SetColorModeToColorByScale", header: "vtkGenericGlyph3DFilter.h".}
proc SetColorModeToColorByScalar*(this: var vtkGenericGlyph3DFilter) {.
    importcpp: "SetColorModeToColorByScalar", header: "vtkGenericGlyph3DFilter.h".}
proc SetColorModeToColorByVector*(this: var vtkGenericGlyph3DFilter) {.
    importcpp: "SetColorModeToColorByVector", header: "vtkGenericGlyph3DFilter.h".}
proc GetColorModeAsString*(this: var vtkGenericGlyph3DFilter): cstring {.
    importcpp: "GetColorModeAsString", header: "vtkGenericGlyph3DFilter.h".}
proc SetScalingScaleModeColorModeScaleFactor*(this: var vtkGenericGlyph3DFilter;
    _arg: cdouble) {.importcpp: "SetScalingScaleModeColorModeScaleFactor",
                   header: "vtkGenericGlyph3DFilter.h".}
## !!!Ignored construct:  virtual double GetScalingScaleModeColorModeScaleFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScaleFactor  of  << this -> ScaleFactor ) ; return this -> ScaleFactor ; } ;
## Error: expected ';'!!!

proc SetRange*(this: var vtkGenericGlyph3DFilter; _arg1: cdouble; _arg2: cdouble) {.
    importcpp: "SetRange", header: "vtkGenericGlyph3DFilter.h".}
proc SetRange*(this: var vtkGenericGlyph3DFilter; _arg: array[2, cdouble]) {.
    importcpp: "SetRange", header: "vtkGenericGlyph3DFilter.h".}
## !!!Ignored construct:  virtual double * GetRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Range  pointer  << this -> Range ) ; return this -> Range ; } VTK_WRAPEXCLUDE virtual void GetRange ( double data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> Range [ i ] ; } } ;
## Error: expected ';'!!!

proc SetScalingScaleModeColorModeScaleFactorOrient*(
    this: var vtkGenericGlyph3DFilter; _arg: vtkTypeBool) {.
    importcpp: "SetScalingScaleModeColorModeScaleFactorOrient",
    header: "vtkGenericGlyph3DFilter.h".}
proc OrientOn*(this: var vtkGenericGlyph3DFilter) {.importcpp: "OrientOn",
    header: "vtkGenericGlyph3DFilter.h".}
proc OrientOff*(this: var vtkGenericGlyph3DFilter) {.importcpp: "OrientOff",
    header: "vtkGenericGlyph3DFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetScalingScaleModeColorModeScaleFactorOrient ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Orient  of  << this -> Orient ) ; return this -> Orient ; } ;
## Error: expected ';'!!!

proc SetScalingScaleModeColorModeScaleFactorOrientClamping*(
    this: var vtkGenericGlyph3DFilter; _arg: vtkTypeBool) {.
    importcpp: "SetScalingScaleModeColorModeScaleFactorOrientClamping",
    header: "vtkGenericGlyph3DFilter.h".}
proc ClampingOn*(this: var vtkGenericGlyph3DFilter) {.importcpp: "ClampingOn",
    header: "vtkGenericGlyph3DFilter.h".}
proc ClampingOff*(this: var vtkGenericGlyph3DFilter) {.importcpp: "ClampingOff",
    header: "vtkGenericGlyph3DFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetScalingScaleModeColorModeScaleFactorOrientClamping ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Clamping  of  << this -> Clamping ) ; return this -> Clamping ; } ;
## Error: expected ';'!!!

proc SetScalingScaleModeColorModeScaleFactorOrientClampingVectorMode*(
    this: var vtkGenericGlyph3DFilter; _arg: cint) {.importcpp: "SetScalingScaleModeColorModeScaleFactorOrientClampingVectorMode",
    header: "vtkGenericGlyph3DFilter.h".}
## !!!Ignored construct:  virtual int GetScalingScaleModeColorModeScaleFactorOrientClampingVectorMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VectorMode  of  << this -> VectorMode ) ; return this -> VectorMode ; } ;
## Error: expected ';'!!!

proc SetVectorModeToUseVector*(this: var vtkGenericGlyph3DFilter) {.
    importcpp: "SetVectorModeToUseVector", header: "vtkGenericGlyph3DFilter.h".}
proc SetVectorModeToUseNormal*(this: var vtkGenericGlyph3DFilter) {.
    importcpp: "SetVectorModeToUseNormal", header: "vtkGenericGlyph3DFilter.h".}
proc SetVectorModeToVectorRotationOff*(this: var vtkGenericGlyph3DFilter) {.
    importcpp: "SetVectorModeToVectorRotationOff",
    header: "vtkGenericGlyph3DFilter.h".}
proc GetVectorModeAsString*(this: var vtkGenericGlyph3DFilter): cstring {.
    importcpp: "GetVectorModeAsString", header: "vtkGenericGlyph3DFilter.h".}
proc SetScalingScaleModeColorModeScaleFactorOrientClampingVectorModeIndexMode*(
    this: var vtkGenericGlyph3DFilter; _arg: cint) {.importcpp: "SetScalingScaleModeColorModeScaleFactorOrientClampingVectorModeIndexMode",
    header: "vtkGenericGlyph3DFilter.h".}
## !!!Ignored construct:  virtual int GetScalingScaleModeColorModeScaleFactorOrientClampingVectorModeIndexMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IndexMode  of  << this -> IndexMode ) ; return this -> IndexMode ; } ;
## Error: expected ';'!!!

proc SetIndexModeToScalar*(this: var vtkGenericGlyph3DFilter) {.
    importcpp: "SetIndexModeToScalar", header: "vtkGenericGlyph3DFilter.h".}
proc SetIndexModeToVector*(this: var vtkGenericGlyph3DFilter) {.
    importcpp: "SetIndexModeToVector", header: "vtkGenericGlyph3DFilter.h".}
proc SetIndexModeToOff*(this: var vtkGenericGlyph3DFilter) {.
    importcpp: "SetIndexModeToOff", header: "vtkGenericGlyph3DFilter.h".}
proc GetIndexModeAsString*(this: var vtkGenericGlyph3DFilter): cstring {.
    importcpp: "GetIndexModeAsString", header: "vtkGenericGlyph3DFilter.h".}
proc SetScalingScaleModeColorModeScaleFactorOrientClampingVectorModeIndexModeGeneratePointIds*(
    this: var vtkGenericGlyph3DFilter; _arg: vtkTypeBool) {.importcpp: "SetScalingScaleModeColorModeScaleFactorOrientClampingVectorModeIndexModeGeneratePointIds",
    header: "vtkGenericGlyph3DFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetScalingScaleModeColorModeScaleFactorOrientClampingVectorModeIndexModeGeneratePointIds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GeneratePointIds  of  << this -> GeneratePointIds ) ; return this -> GeneratePointIds ; } ;
## Error: expected ';'!!!

proc GeneratePointIdsOn*(this: var vtkGenericGlyph3DFilter) {.
    importcpp: "GeneratePointIdsOn", header: "vtkGenericGlyph3DFilter.h".}
proc GeneratePointIdsOff*(this: var vtkGenericGlyph3DFilter) {.
    importcpp: "GeneratePointIdsOff", header: "vtkGenericGlyph3DFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the name of the PointIds array if generated. By default the Ids
  ##  are named "InputPointIds", but this can be changed with this function.
  ##
proc SetPointIdsName*(this: var vtkGenericGlyph3DFilter; _arg: cstring) {.
    importcpp: "SetPointIdsName", header: "vtkGenericGlyph3DFilter.h".}
proc GetPointIdsName*(this: var vtkGenericGlyph3DFilter): cstring {.
    importcpp: "GetPointIdsName", header: "vtkGenericGlyph3DFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  If you want to use an arbitrary scalars array, then set its name here.
  ##  By default this in nullptr and the filter will use the active scalar array.
  ##
proc GetPointIdsNameInputScalarsSelection*(this: var vtkGenericGlyph3DFilter): cstring {.
    importcpp: "GetPointIdsNameInputScalarsSelection",
    header: "vtkGenericGlyph3DFilter.h".}
proc SelectInputScalars*(this: var vtkGenericGlyph3DFilter; fieldName: cstring) {.
    importcpp: "SelectInputScalars", header: "vtkGenericGlyph3DFilter.h".}
proc GetPointIdsNameInputScalarsSelectionInputVectorsSelection*(
    this: var vtkGenericGlyph3DFilter): cstring {.
    importcpp: "GetPointIdsNameInputScalarsSelectionInputVectorsSelection",
    header: "vtkGenericGlyph3DFilter.h".}
proc SelectInputVectors*(this: var vtkGenericGlyph3DFilter; fieldName: cstring) {.
    importcpp: "SelectInputVectors", header: "vtkGenericGlyph3DFilter.h".}
proc GetPointIdsNameInputScalarsSelectionInputVectorsSelectionInputNormalsSelection*(
    this: var vtkGenericGlyph3DFilter): cstring {.importcpp: "GetPointIdsNameInputScalarsSelectionInputVectorsSelectionInputNormalsSelection",
    header: "vtkGenericGlyph3DFilter.h".}
proc SelectInputNormals*(this: var vtkGenericGlyph3DFilter; fieldName: cstring) {.
    importcpp: "SelectInputNormals", header: "vtkGenericGlyph3DFilter.h".}
## *
##  Return the method of scaling as a descriptive character string.
##

proc GetScaleModeAsString*(this: var vtkGenericGlyph3DFilter): cstring {.
    importcpp: "GetScaleModeAsString", header: "vtkGenericGlyph3DFilter.h".}
## *
##  Return the method of coloring as a descriptive character string.
##

proc GetColorModeAsString*(this: var vtkGenericGlyph3DFilter): cstring {.
    importcpp: "GetColorModeAsString", header: "vtkGenericGlyph3DFilter.h".}
## *
##  Return the vector mode as a character string.
##

proc GetVectorModeAsString*(this: var vtkGenericGlyph3DFilter): cstring {.
    importcpp: "GetVectorModeAsString", header: "vtkGenericGlyph3DFilter.h".}
## *
##  Return the index mode as a character string.
##

proc GetIndexModeAsString*(this: var vtkGenericGlyph3DFilter): cstring {.
    importcpp: "GetIndexModeAsString", header: "vtkGenericGlyph3DFilter.h".}