## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGlyph3D.h
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
##  @class   vtkGlyph3D
##  @brief   copy oriented and scaled glyph geometry to every input point
##
##  vtkGlyph3D is a filter that copies a geometric representation (called
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
##  @warning
##  You can set what arrays to use for the scalars, vectors, normals, and
##  color scalars by using the SetInputArrayToProcess methods in
##  vtkAlgorithm. The first array is scalars, the next vectors, the next
##  normals and finally color scalars.
##
##  @sa
##  vtkTensorGlyph
##

import
  vtkFiltersCoreModule, vtkPolyDataAlgorithm

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
  VTK_FOLLOW_CAMERA_DIRECTION* = 3
  VTK_INDEXING_OFF* = 0
  VTK_INDEXING_BY_SCALAR* = 1
  VTK_INDEXING_BY_VECTOR* = 2

discard "forward decl of vtkTransform"
type
  vtkGlyph3D* {.importcpp: "vtkGlyph3D", header: "vtkGlyph3D.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkGlyph3D* {.importc: "vtkGlyph3D".}: VTK_NEWINSTANCE
    ##  Geometry to copy to each point
    ##  Determine whether scaling of geometry is performed
    ##  Scale by scalar value or vector magnitude
    ##  new scalars based on scale, scalar or vector
    ##  Scale factor to use to scale geometry
    ##  Range to use to perform scalar scaling
    ##  boolean controls whether to "orient" data
    ##  Orient/scale via normal or via vector data
    ##  glyphs face towards this point in VTK_FOLLOW_CAMERA_DIRECTION mode
    ##  glyph up direction in VTK_FOLLOW_CAMERA_DIRECTION mode
    ##  whether to clamp scale factor
    ##  what to use to index into glyph table
    ##  produce input points ids for each output point
    ##  whether to fill output cell data

  vtkGlyph3DSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkGlyph3D::IsTypeOf(@)",
    header: "vtkGlyph3D.h".}
proc IsA*(this: var vtkGlyph3D; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkGlyph3D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGlyph3D {.
    importcpp: "vtkGlyph3D::SafeDownCast(@)", header: "vtkGlyph3D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGlyph3D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGlyph3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGlyph3D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGlyph3D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGlyph3D.h".}
proc New*(): ptr vtkGlyph3D {.importcpp: "vtkGlyph3D::New(@)", header: "vtkGlyph3D.h".}
proc SetSourceData*(this: var vtkGlyph3D; pd: ptr vtkPolyData) {.
    importcpp: "SetSourceData", header: "vtkGlyph3D.h".}
proc SetSourceData*(this: var vtkGlyph3D; id: cint; pd: ptr vtkPolyData) {.
    importcpp: "SetSourceData", header: "vtkGlyph3D.h".}
proc SetSourceConnection*(this: var vtkGlyph3D; id: cint;
                         algOutput: ptr vtkAlgorithmOutput) {.
    importcpp: "SetSourceConnection", header: "vtkGlyph3D.h".}
proc SetSourceConnection*(this: var vtkGlyph3D; algOutput: ptr vtkAlgorithmOutput) {.
    importcpp: "SetSourceConnection", header: "vtkGlyph3D.h".}
proc GetSource*(this: var vtkGlyph3D; id: cint = 0): ptr vtkPolyData {.
    importcpp: "GetSource", header: "vtkGlyph3D.h".}
proc SetScaling*(this: var vtkGlyph3D; _arg: vtkTypeBool) {.importcpp: "SetScaling",
    header: "vtkGlyph3D.h".}
proc ScalingOn*(this: var vtkGlyph3D) {.importcpp: "ScalingOn", header: "vtkGlyph3D.h".}
proc ScalingOff*(this: var vtkGlyph3D) {.importcpp: "ScalingOff",
                                     header: "vtkGlyph3D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetScaling ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Scaling  of  << this -> Scaling ) ; return this -> Scaling ; } ;
## Error: expected ';'!!!

proc SetScalingScaleMode*(this: var vtkGlyph3D; _arg: cint) {.
    importcpp: "SetScalingScaleMode", header: "vtkGlyph3D.h".}
## !!!Ignored construct:  virtual int GetScalingScaleMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScaleMode  of  << this -> ScaleMode ) ; return this -> ScaleMode ; } ;
## Error: expected ';'!!!

proc SetScaleModeToScaleByScalar*(this: var vtkGlyph3D) {.
    importcpp: "SetScaleModeToScaleByScalar", header: "vtkGlyph3D.h".}
proc SetScaleModeToScaleByVector*(this: var vtkGlyph3D) {.
    importcpp: "SetScaleModeToScaleByVector", header: "vtkGlyph3D.h".}
proc SetScaleModeToScaleByVectorComponents*(this: var vtkGlyph3D) {.
    importcpp: "SetScaleModeToScaleByVectorComponents", header: "vtkGlyph3D.h".}
proc SetScaleModeToDataScalingOff*(this: var vtkGlyph3D) {.
    importcpp: "SetScaleModeToDataScalingOff", header: "vtkGlyph3D.h".}
proc GetScaleModeAsString*(this: var vtkGlyph3D): cstring {.
    importcpp: "GetScaleModeAsString", header: "vtkGlyph3D.h".}
proc SetScalingScaleModeColorMode*(this: var vtkGlyph3D; _arg: cint) {.
    importcpp: "SetScalingScaleModeColorMode", header: "vtkGlyph3D.h".}
## !!!Ignored construct:  virtual int GetScalingScaleModeColorMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ColorMode  of  << this -> ColorMode ) ; return this -> ColorMode ; } ;
## Error: expected ';'!!!

proc SetColorModeToColorByScale*(this: var vtkGlyph3D) {.
    importcpp: "SetColorModeToColorByScale", header: "vtkGlyph3D.h".}
proc SetColorModeToColorByScalar*(this: var vtkGlyph3D) {.
    importcpp: "SetColorModeToColorByScalar", header: "vtkGlyph3D.h".}
proc SetColorModeToColorByVector*(this: var vtkGlyph3D) {.
    importcpp: "SetColorModeToColorByVector", header: "vtkGlyph3D.h".}
proc GetColorModeAsString*(this: var vtkGlyph3D): cstring {.
    importcpp: "GetColorModeAsString", header: "vtkGlyph3D.h".}
proc SetScalingScaleModeColorModeScaleFactor*(this: var vtkGlyph3D; _arg: cdouble) {.
    importcpp: "SetScalingScaleModeColorModeScaleFactor", header: "vtkGlyph3D.h".}
## !!!Ignored construct:  virtual double GetScalingScaleModeColorModeScaleFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScaleFactor  of  << this -> ScaleFactor ) ; return this -> ScaleFactor ; } ;
## Error: expected ';'!!!

proc SetRange*(this: var vtkGlyph3D; _arg1: cdouble; _arg2: cdouble) {.
    importcpp: "SetRange", header: "vtkGlyph3D.h".}
proc SetRange*(this: var vtkGlyph3D; _arg: array[2, cdouble]) {.importcpp: "SetRange",
    header: "vtkGlyph3D.h".}
## !!!Ignored construct:  virtual double * GetRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Range  pointer  << this -> Range ) ; return this -> Range ; } VTK_WRAPEXCLUDE virtual void GetRange ( double data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> Range [ i ] ; } } ;
## Error: expected ';'!!!

proc SetScalingScaleModeColorModeScaleFactorOrient*(this: var vtkGlyph3D;
    _arg: vtkTypeBool) {.importcpp: "SetScalingScaleModeColorModeScaleFactorOrient",
                       header: "vtkGlyph3D.h".}
proc OrientOn*(this: var vtkGlyph3D) {.importcpp: "OrientOn", header: "vtkGlyph3D.h".}
proc OrientOff*(this: var vtkGlyph3D) {.importcpp: "OrientOff", header: "vtkGlyph3D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetScalingScaleModeColorModeScaleFactorOrient ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Orient  of  << this -> Orient ) ; return this -> Orient ; } ;
## Error: expected ';'!!!

proc SetScalingScaleModeColorModeScaleFactorOrientClamping*(this: var vtkGlyph3D;
    _arg: vtkTypeBool) {.importcpp: "SetScalingScaleModeColorModeScaleFactorOrientClamping",
                       header: "vtkGlyph3D.h".}
proc ClampingOn*(this: var vtkGlyph3D) {.importcpp: "ClampingOn",
                                     header: "vtkGlyph3D.h".}
proc ClampingOff*(this: var vtkGlyph3D) {.importcpp: "ClampingOff",
                                      header: "vtkGlyph3D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetScalingScaleModeColorModeScaleFactorOrientClamping ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Clamping  of  << this -> Clamping ) ; return this -> Clamping ; } ;
## Error: expected ';'!!!

proc SetScalingScaleModeColorModeScaleFactorOrientClampingVectorMode*(
    this: var vtkGlyph3D; _arg: cint) {.importcpp: "SetScalingScaleModeColorModeScaleFactorOrientClampingVectorMode",
                                   header: "vtkGlyph3D.h".}
## !!!Ignored construct:  virtual int GetScalingScaleModeColorModeScaleFactorOrientClampingVectorMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VectorMode  of  << this -> VectorMode ) ; return this -> VectorMode ; } ;
## Error: expected ';'!!!

proc SetVectorModeToUseVector*(this: var vtkGlyph3D) {.
    importcpp: "SetVectorModeToUseVector", header: "vtkGlyph3D.h".}
proc SetVectorModeToUseNormal*(this: var vtkGlyph3D) {.
    importcpp: "SetVectorModeToUseNormal", header: "vtkGlyph3D.h".}
proc SetVectorModeToVectorRotationOff*(this: var vtkGlyph3D) {.
    importcpp: "SetVectorModeToVectorRotationOff", header: "vtkGlyph3D.h".}
proc SetVectorModeToFollowCameraDirection*(this: var vtkGlyph3D) {.
    importcpp: "SetVectorModeToFollowCameraDirection", header: "vtkGlyph3D.h".}
proc GetVectorModeAsString*(this: var vtkGlyph3D): cstring {.
    importcpp: "GetVectorModeAsString", header: "vtkGlyph3D.h".}
proc SetFollowedCameraPosition*(this: var vtkGlyph3D; data: ptr cdouble) {.
    importcpp: "SetFollowedCameraPosition", header: "vtkGlyph3D.h".}
## !!!Ignored construct:  virtual double * GetRangeFollowedCameraPosition ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << FollowedCameraPosition  pointer  << this -> FollowedCameraPosition ) ; return this -> FollowedCameraPosition ; } VTK_WRAPEXCLUDE virtual void GetRangeFollowedCameraPosition ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> FollowedCameraPosition [ i ] ; } } ;
## Error: expected ';'!!!

proc SetFollowedCameraPositionFollowedCameraViewUp*(this: var vtkGlyph3D;
    data: ptr cdouble) {.importcpp: "SetFollowedCameraPositionFollowedCameraViewUp",
                      header: "vtkGlyph3D.h".}
## !!!Ignored construct:  virtual double * GetRangeFollowedCameraPositionFollowedCameraViewUp ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << FollowedCameraViewUp  pointer  << this -> FollowedCameraViewUp ) ; return this -> FollowedCameraViewUp ; } VTK_WRAPEXCLUDE virtual void GetRangeFollowedCameraPositionFollowedCameraViewUp ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> FollowedCameraViewUp [ i ] ; } } ;
## Error: expected ';'!!!

proc SetScalingScaleModeColorModeScaleFactorOrientClampingVectorModeIndexMode*(
    this: var vtkGlyph3D; _arg: cint) {.importcpp: "SetScalingScaleModeColorModeScaleFactorOrientClampingVectorModeIndexMode",
                                   header: "vtkGlyph3D.h".}
## !!!Ignored construct:  virtual int GetScalingScaleModeColorModeScaleFactorOrientClampingVectorModeIndexMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IndexMode  of  << this -> IndexMode ) ; return this -> IndexMode ; } ;
## Error: expected ';'!!!

proc SetIndexModeToScalar*(this: var vtkGlyph3D) {.
    importcpp: "SetIndexModeToScalar", header: "vtkGlyph3D.h".}
proc SetIndexModeToVector*(this: var vtkGlyph3D) {.
    importcpp: "SetIndexModeToVector", header: "vtkGlyph3D.h".}
proc SetIndexModeToOff*(this: var vtkGlyph3D) {.importcpp: "SetIndexModeToOff",
    header: "vtkGlyph3D.h".}
proc GetIndexModeAsString*(this: var vtkGlyph3D): cstring {.
    importcpp: "GetIndexModeAsString", header: "vtkGlyph3D.h".}
proc SetScalingScaleModeColorModeScaleFactorOrientClampingVectorModeIndexModeGeneratePointIds*(
    this: var vtkGlyph3D; _arg: vtkTypeBool) {.importcpp: "SetScalingScaleModeColorModeScaleFactorOrientClampingVectorModeIndexModeGeneratePointIds",
    header: "vtkGlyph3D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetScalingScaleModeColorModeScaleFactorOrientClampingVectorModeIndexModeGeneratePointIds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GeneratePointIds  of  << this -> GeneratePointIds ) ; return this -> GeneratePointIds ; } ;
## Error: expected ';'!!!

proc GeneratePointIdsOn*(this: var vtkGlyph3D) {.importcpp: "GeneratePointIdsOn",
    header: "vtkGlyph3D.h".}
proc GeneratePointIdsOff*(this: var vtkGlyph3D) {.importcpp: "GeneratePointIdsOff",
    header: "vtkGlyph3D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the name of the PointIds array if generated. By default the Ids
  ##  are named "InputPointIds", but this can be changed with this function.
  ##
proc SetPointIdsName*(this: var vtkGlyph3D; _arg: cstring) {.
    importcpp: "SetPointIdsName", header: "vtkGlyph3D.h".}
proc GetPointIdsName*(this: var vtkGlyph3D): cstring {.importcpp: "GetPointIdsName",
    header: "vtkGlyph3D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Enable/disable the generation of cell data as part of the output.
  ##  The cell data at each cell will match the point data of the input
  ##  at the glyphed point.
  ##
proc SetScalingScaleModeColorModeScaleFactorOrientClampingVectorModeIndexModeGeneratePointIdsFillCellData*(
    this: var vtkGlyph3D; _arg: vtkTypeBool) {.importcpp: "SetScalingScaleModeColorModeScaleFactorOrientClampingVectorModeIndexModeGeneratePointIdsFillCellData",
    header: "vtkGlyph3D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetScalingScaleModeColorModeScaleFactorOrientClampingVectorModeIndexModeGeneratePointIdsFillCellData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FillCellData  of  << this -> FillCellData ) ; return this -> FillCellData ; } ;
## Error: expected ';'!!!

proc FillCellDataOn*(this: var vtkGlyph3D) {.importcpp: "FillCellDataOn",
    header: "vtkGlyph3D.h".}
proc FillCellDataOff*(this: var vtkGlyph3D) {.importcpp: "FillCellDataOff",
    header: "vtkGlyph3D.h".}
  ## /@}
  ## *
  ##  This can be overwritten by subclass to return 0 when a point is
  ##  blanked. Default implementation is to always return 1;
  ##
proc IsPointVisible*(this: var vtkGlyph3D; a2: ptr vtkDataSet; a3: vtkIdType): cint {.
    importcpp: "IsPointVisible", header: "vtkGlyph3D.h".}
proc SetSourceTransform*(this: var vtkGlyph3D; a2: ptr vtkTransform) {.
    importcpp: "SetSourceTransform", header: "vtkGlyph3D.h".}
proc GetnameSourceTransform*(this: var vtkGlyph3D): ptr vtkTransform {.
    importcpp: "GetnameSourceTransform", header: "vtkGlyph3D.h".}
  ## /@}
  ## *
  ##  Overridden to include SourceTransform's MTime.
  ##
proc GetMTime*(this: var vtkGlyph3D): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkGlyph3D.h".}
proc SetScalingScaleModeColorModeScaleFactorOrientClampingVectorModeIndexModeGeneratePointIdsFillCellDataOutputPointsPrecision*(
    this: var vtkGlyph3D; _arg: cint) {.importcpp: "SetScalingScaleModeColorModeScaleFactorOrientClampingVectorModeIndexModeGeneratePointIdsFillCellDataOutputPointsPrecision",
                                   header: "vtkGlyph3D.h".}
## !!!Ignored construct:  virtual int GetScalingScaleModeColorModeScaleFactorOrientClampingVectorModeIndexModeGeneratePointIdsFillCellDataOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ;
## Error: expected ';'!!!

## *
##  Return the method of scaling as a descriptive character string.
##

proc GetScaleModeAsString*(this: var vtkGlyph3D): cstring {.
    importcpp: "GetScaleModeAsString", header: "vtkGlyph3D.h".}
## *
##  Return the method of coloring as a descriptive character string.
##

proc GetColorModeAsString*(this: var vtkGlyph3D): cstring {.
    importcpp: "GetColorModeAsString", header: "vtkGlyph3D.h".}
## *
##  Return the vector mode as a character string.
##

proc GetVectorModeAsString*(this: var vtkGlyph3D): cstring {.
    importcpp: "GetVectorModeAsString", header: "vtkGlyph3D.h".}
## *
##  Return the index mode as a character string.
##

proc GetIndexModeAsString*(this: var vtkGlyph3D): cstring {.
    importcpp: "GetIndexModeAsString", header: "vtkGlyph3D.h".}