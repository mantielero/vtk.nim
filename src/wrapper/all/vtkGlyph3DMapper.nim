## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGlyph3DMapper.h
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
##  @class   vtkGlyph3DMapper
##  @brief   vtkGlyph3D on the GPU.
##
##  Do the same job than vtkGlyph3D but on the GPU. For this reason, it is
##  a mapper not a vtkPolyDataAlgorithm. Also, some methods of vtkGlyph3D
##  don't make sense in vtkGlyph3DMapper: GeneratePointIds, old-style
##  SetSource, PointIdsName, IsPointVisible.
##
##  @sa
##  vtkGlyph3D
##

import
  vtkGlyph3D, vtkMapper, vtkRenderingCoreModule, vtkWeakPointer

discard "forward decl of vtkCompositeDataDisplayAttributes"
discard "forward decl of vtkDataObjectTree"
type
  vtkGlyph3DMapper* {.importcpp: "vtkGlyph3DMapper", header: "vtkGlyph3DMapper.h",
                     bycopy.} = object of vtkMapper
    vtkGlyph3DMapper* {.importc: "vtkGlyph3DMapper".}: VTK_NEWINSTANCE
    ##  Determine whether scaling of geometry is performed
    ##  Scale factor to use to scale geometry
    ##  Scale by scalar value or vector magnitude
    ##  Range to use to perform scalar scaling
    ##  boolean controls whether to "orient" data
    ##  whether to clamp scale factor
    ##  Enable/disable indexing into the glyph table
    ##  Enable/disable custom pick ids
    ##  Enable/disable masking.
    ##  Map DataObjectTree glyph source into table
    ##  Disable culling


proc New*(): ptr vtkGlyph3DMapper {.importcpp: "vtkGlyph3DMapper::New(@)",
                                header: "vtkGlyph3DMapper.h".}
type
  vtkGlyph3DMapperSuperclass* = vtkMapper

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGlyph3DMapper::IsTypeOf(@)", header: "vtkGlyph3DMapper.h".}
proc IsA*(this: var vtkGlyph3DMapper; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkGlyph3DMapper.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGlyph3DMapper {.
    importcpp: "vtkGlyph3DMapper::SafeDownCast(@)", header: "vtkGlyph3DMapper.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGlyph3DMapper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGlyph3DMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGlyph3DMapper :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGlyph3DMapper; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGlyph3DMapper.h".}
type
  vtkGlyph3DMapperArrayIndexes* {.size: sizeof(cint),
                                 importcpp: "vtkGlyph3DMapper::ArrayIndexes",
                                 header: "vtkGlyph3DMapper.h".} = enum
    SCALE = 0, SOURCE_INDEX = 1, MASK = 2, ORIENTATION = 3, SELECTIONID = 4


proc SetSourceConnection*(this: var vtkGlyph3DMapper; idx: cint;
                         algOutput: ptr vtkAlgorithmOutput) {.
    importcpp: "SetSourceConnection", header: "vtkGlyph3DMapper.h".}
proc SetSourceConnection*(this: var vtkGlyph3DMapper;
                         algOutput: ptr vtkAlgorithmOutput) {.
    importcpp: "SetSourceConnection", header: "vtkGlyph3DMapper.h".}
proc SetInputData*(this: var vtkGlyph3DMapper; a2: ptr vtkDataObject) {.
    importcpp: "SetInputData", header: "vtkGlyph3DMapper.h".}
proc SetSourceData*(this: var vtkGlyph3DMapper; idx: cint; pd: ptr vtkPolyData) {.
    importcpp: "SetSourceData", header: "vtkGlyph3DMapper.h".}
proc SetSourceTableTree*(this: var vtkGlyph3DMapper; tree: ptr vtkDataObjectTree) {.
    importcpp: "SetSourceTableTree", header: "vtkGlyph3DMapper.h".}
proc SetSourceData*(this: var vtkGlyph3DMapper; pd: ptr vtkPolyData) {.
    importcpp: "SetSourceData", header: "vtkGlyph3DMapper.h".}
proc GetSource*(this: var vtkGlyph3DMapper; idx: cint = 0): ptr vtkPolyData {.
    importcpp: "GetSource", header: "vtkGlyph3DMapper.h".}
proc GetSourceTableTree*(this: var vtkGlyph3DMapper): ptr vtkDataObjectTree {.
    importcpp: "GetSourceTableTree", header: "vtkGlyph3DMapper.h".}
proc SetScaling*(this: var vtkGlyph3DMapper; _arg: bool) {.importcpp: "SetScaling",
    header: "vtkGlyph3DMapper.h".}
proc ScalingOn*(this: var vtkGlyph3DMapper) {.importcpp: "ScalingOn",
    header: "vtkGlyph3DMapper.h".}
proc ScalingOff*(this: var vtkGlyph3DMapper) {.importcpp: "ScalingOff",
    header: "vtkGlyph3DMapper.h".}
## !!!Ignored construct:  virtual bool GetScaling ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Scaling  of  << this -> Scaling ) ; return this -> Scaling ; } ;
## Error: expected ';'!!!

proc SetScalingScaleMode*(this: var vtkGlyph3DMapper; _arg: cint) {.
    importcpp: "SetScalingScaleMode", header: "vtkGlyph3DMapper.h".}
## !!!Ignored construct:  virtual int GetScalingScaleMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScaleMode  of  << this -> ScaleMode ) ; return this -> ScaleMode ; } ;
## Error: expected ';'!!!

proc SetScalingScaleModeScaleFactor*(this: var vtkGlyph3DMapper; _arg: cdouble) {.
    importcpp: "SetScalingScaleModeScaleFactor", header: "vtkGlyph3DMapper.h".}
## !!!Ignored construct:  virtual double GetScalingScaleModeScaleFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScaleFactor  of  << this -> ScaleFactor ) ; return this -> ScaleFactor ; } ;
## Error: expected ';'!!!

type
  vtkGlyph3DMapperScaleModes* {.size: sizeof(cint),
                               importcpp: "vtkGlyph3DMapper::ScaleModes",
                               header: "vtkGlyph3DMapper.h".} = enum
    NO_DATA_SCALING = 0, SCALE_BY_MAGNITUDE = 1, SCALE_BY_COMPONENTS = 2


proc SetScaleModeToScaleByMagnitude*(this: var vtkGlyph3DMapper) {.
    importcpp: "SetScaleModeToScaleByMagnitude", header: "vtkGlyph3DMapper.h".}
proc SetScaleModeToScaleByVectorComponents*(this: var vtkGlyph3DMapper) {.
    importcpp: "SetScaleModeToScaleByVectorComponents",
    header: "vtkGlyph3DMapper.h".}
proc SetScaleModeToNoDataScaling*(this: var vtkGlyph3DMapper) {.
    importcpp: "SetScaleModeToNoDataScaling", header: "vtkGlyph3DMapper.h".}
proc GetScaleModeAsString*(this: var vtkGlyph3DMapper): cstring {.
    importcpp: "GetScaleModeAsString", header: "vtkGlyph3DMapper.h".}
proc SetRange*(this: var vtkGlyph3DMapper; _arg1: cdouble; _arg2: cdouble) {.
    importcpp: "SetRange", header: "vtkGlyph3DMapper.h".}
proc SetRange*(this: var vtkGlyph3DMapper; _arg: array[2, cdouble]) {.
    importcpp: "SetRange", header: "vtkGlyph3DMapper.h".}
## !!!Ignored construct:  virtual double * GetRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Range  pointer  << this -> Range ) ; return this -> Range ; } VTK_WRAPEXCLUDE virtual void GetRange ( double data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> Range [ i ] ; } } ;
## Error: expected ';'!!!

proc SetScalingScaleModeScaleFactorOrient*(this: var vtkGlyph3DMapper; _arg: bool) {.
    importcpp: "SetScalingScaleModeScaleFactorOrient",
    header: "vtkGlyph3DMapper.h".}
## !!!Ignored construct:  virtual bool GetScalingScaleModeScaleFactorOrient ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Orient  of  << this -> Orient ) ; return this -> Orient ; } ;
## Error: expected ';'!!!

proc OrientOn*(this: var vtkGlyph3DMapper) {.importcpp: "OrientOn",
    header: "vtkGlyph3DMapper.h".}
proc OrientOff*(this: var vtkGlyph3DMapper) {.importcpp: "OrientOff",
    header: "vtkGlyph3DMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  Orientation mode indicates if the OrientationArray provides the direction
  ##  vector for the orientation or the rotations around each axes. Default is
  ##  DIRECTION
  ##
proc SetOrientationMode*(this: var vtkGlyph3DMapper; _arg: cint) {.
    importcpp: "SetOrientationMode", header: "vtkGlyph3DMapper.h".}
proc GetOrientationModeMinValue*(this: var vtkGlyph3DMapper): cint {.
    importcpp: "GetOrientationModeMinValue", header: "vtkGlyph3DMapper.h".}
proc GetOrientationModeMaxValue*(this: var vtkGlyph3DMapper): cint {.
    importcpp: "GetOrientationModeMaxValue", header: "vtkGlyph3DMapper.h".}
## !!!Ignored construct:  virtual int GetScalingScaleModeScaleFactorOrientOrientationMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OrientationMode  of  << this -> OrientationMode ) ; return this -> OrientationMode ; } ;
## Error: expected ';'!!!

proc SetOrientationModeToDirection*(this: var vtkGlyph3DMapper) {.
    importcpp: "SetOrientationModeToDirection", header: "vtkGlyph3DMapper.h".}
proc SetOrientationModeToRotation*(this: var vtkGlyph3DMapper) {.
    importcpp: "SetOrientationModeToRotation", header: "vtkGlyph3DMapper.h".}
proc SetOrientationModeToQuaternion*(this: var vtkGlyph3DMapper) {.
    importcpp: "SetOrientationModeToQuaternion", header: "vtkGlyph3DMapper.h".}
proc GetOrientationModeAsString*(this: var vtkGlyph3DMapper): cstring {.
    importcpp: "GetOrientationModeAsString", header: "vtkGlyph3DMapper.h".}
type
  vtkGlyph3DMapperOrientationModes* {.size: sizeof(cint), importcpp: "vtkGlyph3DMapper::OrientationModes",
                                     header: "vtkGlyph3DMapper.h".} = enum
    DIRECTION = 0, ROTATION = 1, QUATERNION = 2


proc SetScalingScaleModeScaleFactorOrientClamping*(this: var vtkGlyph3DMapper;
    _arg: bool) {.importcpp: "SetScalingScaleModeScaleFactorOrientClamping",
                header: "vtkGlyph3DMapper.h".}
## !!!Ignored construct:  virtual bool GetScalingScaleModeScaleFactorOrientOrientationModeClamping ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Clamping  of  << this -> Clamping ) ; return this -> Clamping ; } ;
## Error: expected ';'!!!

proc ClampingOn*(this: var vtkGlyph3DMapper) {.importcpp: "ClampingOn",
    header: "vtkGlyph3DMapper.h".}
proc ClampingOff*(this: var vtkGlyph3DMapper) {.importcpp: "ClampingOff",
    header: "vtkGlyph3DMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  Enable/disable indexing into table of the glyph sources. When disabled,
  ##  only the 1st source input will be used to generate the glyph. Otherwise the
  ##  source index array will be used to select the glyph source. The source
  ##  index array can be specified using SetSourceIndexArray().
  ##
proc SetScalingScaleModeScaleFactorOrientClampingSourceIndexing*(
    this: var vtkGlyph3DMapper; _arg: bool) {.
    importcpp: "SetScalingScaleModeScaleFactorOrientClampingSourceIndexing",
    header: "vtkGlyph3DMapper.h".}
## !!!Ignored construct:  virtual bool GetScalingScaleModeScaleFactorOrientOrientationModeClampingSourceIndexing ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SourceIndexing  of  << this -> SourceIndexing ) ; return this -> SourceIndexing ; } ;
## Error: expected ';'!!!

proc SourceIndexingOn*(this: var vtkGlyph3DMapper) {.importcpp: "SourceIndexingOn",
    header: "vtkGlyph3DMapper.h".}
proc SourceIndexingOff*(this: var vtkGlyph3DMapper) {.
    importcpp: "SourceIndexingOff", header: "vtkGlyph3DMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  If true, and the glyph source dataset is a subclass of vtkDataObjectTree,
  ##  the top-level members of the tree will be mapped to the glyph source table
  ##  used for SourceIndexing.
  ##
proc SetScalingScaleModeScaleFactorOrientClampingSourceIndexingUseSourceTableTree*(
    this: var vtkGlyph3DMapper; _arg: bool) {.importcpp: "SetScalingScaleModeScaleFactorOrientClampingSourceIndexingUseSourceTableTree",
    header: "vtkGlyph3DMapper.h".}
## !!!Ignored construct:  virtual bool GetScalingScaleModeScaleFactorOrientOrientationModeClampingSourceIndexingUseSourceTableTree ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseSourceTableTree  of  << this -> UseSourceTableTree ) ; return this -> UseSourceTableTree ; } ;
## Error: expected ';'!!!

proc UseSourceTableTreeOn*(this: var vtkGlyph3DMapper) {.
    importcpp: "UseSourceTableTreeOn", header: "vtkGlyph3DMapper.h".}
proc UseSourceTableTreeOff*(this: var vtkGlyph3DMapper) {.
    importcpp: "UseSourceTableTreeOff", header: "vtkGlyph3DMapper.h".}
  ## /@{
  ## *
  ##  Turn on/off custom selection ids. If enabled, the id values set with
  ##  SetSelectionIdArray are returned from pick events.
  ##
proc SetScalingScaleModeScaleFactorOrientClampingSourceIndexingUseSourceTableTreeUseSelectionIds*(
    this: var vtkGlyph3DMapper; _arg: bool) {.importcpp: "SetScalingScaleModeScaleFactorOrientClampingSourceIndexingUseSourceTableTreeUseSelectionIds",
    header: "vtkGlyph3DMapper.h".}
proc UseSelectionIdsOn*(this: var vtkGlyph3DMapper) {.
    importcpp: "UseSelectionIdsOn", header: "vtkGlyph3DMapper.h".}
proc UseSelectionIdsOff*(this: var vtkGlyph3DMapper) {.
    importcpp: "UseSelectionIdsOff", header: "vtkGlyph3DMapper.h".}
## !!!Ignored construct:  virtual bool GetScalingScaleModeScaleFactorOrientOrientationModeClampingSourceIndexingUseSourceTableTreeUseSelectionIds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseSelectionIds  of  << this -> UseSelectionIds ) ; return this -> UseSelectionIds ; } ;
## Error: expected ';'!!!

proc GetBounds*(this: var vtkGlyph3DMapper): ptr cdouble {.importcpp: "GetBounds",
    header: "vtkGlyph3DMapper.h".}
proc GetBounds*(this: var vtkGlyph3DMapper; bounds: array[6, cdouble]) {.
    importcpp: "GetBounds", header: "vtkGlyph3DMapper.h".}
proc Render*(this: var vtkGlyph3DMapper; ren: ptr vtkRenderer; act: ptr vtkActor) {.
    importcpp: "Render", header: "vtkGlyph3DMapper.h".}
proc SetScalingScaleModeScaleFactorOrientClampingSourceIndexingUseSourceTableTreeUseSelectionIdsMasking*(
    this: var vtkGlyph3DMapper; _arg: bool) {.importcpp: "SetScalingScaleModeScaleFactorOrientClampingSourceIndexingUseSourceTableTreeUseSelectionIdsMasking",
    header: "vtkGlyph3DMapper.h".}
## !!!Ignored construct:  virtual bool GetScalingScaleModeScaleFactorOrientOrientationModeClampingSourceIndexingUseSourceTableTreeUseSelectionIdsMasking ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Masking  of  << this -> Masking ) ; return this -> Masking ; } ;
## Error: expected ';'!!!

proc MaskingOn*(this: var vtkGlyph3DMapper) {.importcpp: "MaskingOn",
    header: "vtkGlyph3DMapper.h".}
proc MaskingOff*(this: var vtkGlyph3DMapper) {.importcpp: "MaskingOff",
    header: "vtkGlyph3DMapper.h".}
  ## /@}
  ## *
  ##  Set the name of the point array to use as a mask for generating the glyphs.
  ##  This is a convenience method. The same effect can be achieved by using
  ##  SetInputArrayToProcess(vtkGlyph3DMapper::MASK, 0, 0,
  ##  vtkDataObject::FIELD_ASSOCIATION_POINTS, maskarrayname)
  ##
proc SetMaskArray*(this: var vtkGlyph3DMapper; maskarrayname: cstring) {.
    importcpp: "SetMaskArray", header: "vtkGlyph3DMapper.h".}
proc SetMaskArray*(this: var vtkGlyph3DMapper; fieldAttributeType: cint) {.
    importcpp: "SetMaskArray", header: "vtkGlyph3DMapper.h".}
proc SetOrientationArray*(this: var vtkGlyph3DMapper; orientationarrayname: cstring) {.
    importcpp: "SetOrientationArray", header: "vtkGlyph3DMapper.h".}
proc SetOrientationArray*(this: var vtkGlyph3DMapper; fieldAttributeType: cint) {.
    importcpp: "SetOrientationArray", header: "vtkGlyph3DMapper.h".}
proc SetScaleArray*(this: var vtkGlyph3DMapper; scalarsarrayname: cstring) {.
    importcpp: "SetScaleArray", header: "vtkGlyph3DMapper.h".}
proc SetScaleArray*(this: var vtkGlyph3DMapper; fieldAttributeType: cint) {.
    importcpp: "SetScaleArray", header: "vtkGlyph3DMapper.h".}
proc SetSourceIndexArray*(this: var vtkGlyph3DMapper; arrayname: cstring) {.
    importcpp: "SetSourceIndexArray", header: "vtkGlyph3DMapper.h".}
proc SetSourceIndexArray*(this: var vtkGlyph3DMapper; fieldAttributeType: cint) {.
    importcpp: "SetSourceIndexArray", header: "vtkGlyph3DMapper.h".}
proc SetSelectionIdArray*(this: var vtkGlyph3DMapper; selectionIdArrayName: cstring) {.
    importcpp: "SetSelectionIdArray", header: "vtkGlyph3DMapper.h".}
proc SetSelectionIdArray*(this: var vtkGlyph3DMapper; fieldAttributeType: cint) {.
    importcpp: "SetSelectionIdArray", header: "vtkGlyph3DMapper.h".}
proc SetScalingScaleModeScaleFactorOrientClampingSourceIndexingUseSourceTableTreeUseSelectionIdsMaskingSelectionColorId*(
    this: var vtkGlyph3DMapper; _arg: cuint) {.importcpp: "SetScalingScaleModeScaleFactorOrientClampingSourceIndexingUseSourceTableTreeUseSelectionIdsMaskingSelectionColorId",
    header: "vtkGlyph3DMapper.h".}
## !!!Ignored construct:  virtual unsigned int GetScalingScaleModeScaleFactorOrientOrientationModeClampingSourceIndexingUseSourceTableTreeUseSelectionIdsMaskingSelectionColorId ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SelectionColorId  of  << this -> SelectionColorId ) ; return this -> SelectionColorId ; } ;
## Error: expected ';'!!!

proc SetBlockAttributes*(this: var vtkGlyph3DMapper;
                        attr: ptr vtkCompositeDataDisplayAttributes) {.
    importcpp: "SetBlockAttributes", header: "vtkGlyph3DMapper.h".}
proc GetnameBlockAttributes*(this: var vtkGlyph3DMapper): ptr vtkCompositeDataDisplayAttributes {.
    importcpp: "GetnameBlockAttributes", header: "vtkGlyph3DMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  Enable or disable frustum culling and LOD of the instances.
  ##  When enabled, an OpenGL driver supporting GL_ARB_gpu_shader5 extension is mandatory.
  ##
proc SetScalingScaleModeScaleFactorOrientClampingSourceIndexingUseSourceTableTreeUseSelectionIdsMaskingSelectionColorIdCullingAndLOD*(
    this: var vtkGlyph3DMapper; _arg: bool) {.importcpp: "SetScalingScaleModeScaleFactorOrientClampingSourceIndexingUseSourceTableTreeUseSelectionIdsMaskingSelectionColorIdCullingAndLOD",
    header: "vtkGlyph3DMapper.h".}
## !!!Ignored construct:  virtual bool GetScalingScaleModeScaleFactorOrientOrientationModeClampingSourceIndexingUseSourceTableTreeUseSelectionIdsMaskingSelectionColorIdCullingAndLOD ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CullingAndLOD  of  << this -> CullingAndLOD ) ; return this -> CullingAndLOD ; } ;
## Error: expected ';'!!!

proc GetMaxNumberOfLOD*(this: var vtkGlyph3DMapper): vtkIdType {.
    importcpp: "GetMaxNumberOfLOD", header: "vtkGlyph3DMapper.h".}
proc SetNumberOfLOD*(this: var vtkGlyph3DMapper;
                    vtkNotUsed: proc (a1: nb): vtkIdType) {.
    importcpp: "SetNumberOfLOD", header: "vtkGlyph3DMapper.h".}
proc SetLODDistanceAndTargetReduction*(this: var vtkGlyph3DMapper;
                                      vtkNotUsed: proc (a1: index): vtkIdType;
                                      vtkNotUsed: proc (a1: distance): cfloat;
    vtkNotUsed: proc (a1: targetReduction): cfloat) {.
    importcpp: "SetLODDistanceAndTargetReduction", header: "vtkGlyph3DMapper.h".}
proc SetScalingScaleModeScaleFactorOrientClampingSourceIndexingUseSourceTableTreeUseSelectionIdsMaskingSelectionColorIdCullingAndLODLODColoring*(
    this: var vtkGlyph3DMapper; _arg: bool) {.importcpp: "SetScalingScaleModeScaleFactorOrientClampingSourceIndexingUseSourceTableTreeUseSelectionIdsMaskingSelectionColorIdCullingAndLODLODColoring",
    header: "vtkGlyph3DMapper.h".}
## !!!Ignored construct:  virtual bool GetScalingScaleModeScaleFactorOrientOrientationModeClampingSourceIndexingUseSourceTableTreeUseSelectionIdsMaskingSelectionColorIdCullingAndLODLODColoring ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LODColoring  of  << this -> LODColoring ) ; return this -> LODColoring ; } ;
## Error: expected ';'!!!

proc GetSupportsSelection*(this: var vtkGlyph3DMapper): bool {.
    importcpp: "GetSupportsSelection", header: "vtkGlyph3DMapper.h".}