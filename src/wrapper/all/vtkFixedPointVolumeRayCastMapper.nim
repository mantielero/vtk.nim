## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFixedPointVolumeRayCastMapper.h
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
##  @class   vtkFixedPointVolumeRayCastMapper
##  @brief   A fixed point mapper for volumes
##
##  This is a software ray caster for rendering volumes in vtkImageData.
##  It works with all input data types and up to four components. It performs
##  composite or MIP rendering, and can be intermixed with geometric data.
##  Space leaping is used to speed up the rendering process. In addition,
##  calculation are performed in 15 bit fixed point precision. This mapper
##  is threaded, and will interleave scan lines across processors.
##
##  WARNING: This ray caster may not produce consistent results when
##  the number of threads exceeds 1. The class warns if the number of
##  threads > 1. The differences may be subtle. Applications should decide
##  if the trade-off in performance is worth the lack of consistency.
##
##  Other limitations of this ray caster include that:
##    - it does not do isosurface ray casting
##    - it does only interpolate before classify compositing
##    - it does only maximum scalar value MIP
##
##  This mapper handles all data type from unsigned char through double.
##  However, some of the internal calcultions are performed in float and
##  therefore even the full float range may cause problems for this mapper
##  (both in scalar data values and in spacing between samples).
##
##  Space leaping is performed by creating a sub-sampled volume. 4x4x4
##  cells in the original volume are represented by a min, max, and
##  combined gradient and flag value. The min max volume has three
##  unsigned shorts per 4x4x4 group of cells from the original volume -
##  one representing the minimum scalar index (the scalar value adjusted
##  to fit in the 15 bit range), the maximum scalar index, and a
##  third unsigned short which is both the maximum gradient opacity in
##  the neighborhood (an unsigned char) and the flag that is filled
##  in for the current lookup tables to indicate whether this region
##  can be skipped.
##
##  @sa
##  vtkVolumeMapper
##

import
  vtkRenderingVolumeModule, vtkThreads, vtkVolumeMapper

const
  VTKKW_FP_SHIFT* = 15
  VTKKW_FPMM_SHIFT* = 17
  VTKKW_FP_MASK* = 0x7fff
  VTKKW_FP_SCALE* = 32767.0

discard "forward decl of vtkMatrix4x4"
discard "forward decl of vtkMultiThreader"
discard "forward decl of vtkPlaneCollection"
discard "forward decl of vtkRenderer"
discard "forward decl of vtkTimerLog"
discard "forward decl of vtkVolume"
discard "forward decl of vtkTransform"
discard "forward decl of vtkRenderWindow"
discard "forward decl of vtkColorTransferFunction"
discard "forward decl of vtkPiecewiseFunction"
discard "forward decl of vtkFixedPointVolumeRayCastMIPHelper"
discard "forward decl of vtkFixedPointVolumeRayCastCompositeHelper"
discard "forward decl of vtkFixedPointVolumeRayCastCompositeGOHelper"
discard "forward decl of vtkFixedPointVolumeRayCastCompositeGOShadeHelper"
discard "forward decl of vtkFixedPointVolumeRayCastCompositeShadeHelper"
discard "forward decl of vtkVolumeRayCastSpaceLeapingImageFilter"
discard "forward decl of vtkDirectionEncoder"
discard "forward decl of vtkEncodedGradientShader"
discard "forward decl of vtkFiniteDifferenceGradientEstimator"
discard "forward decl of vtkRayCastImageDisplayHelper"
discard "forward decl of vtkFixedPointRayCastImage"
discard "forward decl of vtkDataArray"
proc FixedPointVolumeRayCastMapper_CastRays*(arg: pointer): VTK_THREAD_RETURN_TYPE {.
    importcpp: "FixedPointVolumeRayCastMapper_CastRays(@)",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc vtkFPVRCMSwitchOnDataType*(arg: pointer): VTK_THREAD_RETURN_TYPE {.
    importcpp: "vtkFPVRCMSwitchOnDataType(@)",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
type
  vtkFixedPointVolumeRayCastMapper* {.importcpp: "vtkFixedPointVolumeRayCastMapper", header: "vtkFixedPointVolumeRayCastMapper.h",
                                     bycopy.} = object of vtkVolumeMapper
    vtkFixedPointVolumeRayCastMapper* {.importc: "vtkFixedPointVolumeRayCastMapper".}: VTK_NEWINSTANCE
    ##  The distance between sample points along the ray
    ##  The distance between rays in the image
    ##  Saved values used to restore
    ##  Internal method for computing matrices needed during
    ##  ray casting
    ##  This object encapsulated the image and all related information
    ##  Get the ZBuffer value corresponding to location (x,y) where (x,y)
    ##  are indexing into the ImageInUse image. This must be converted to
    ##  the zbuffer image coordinates. Nearest neighbor value is returned.
    ##  Some variables used for ray computation
    ##  Min Max structure used to do space leaping


proc New*(): ptr vtkFixedPointVolumeRayCastMapper {.
    importcpp: "vtkFixedPointVolumeRayCastMapper::New(@)",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
type
  vtkFixedPointVolumeRayCastMapperSuperclass* = vtkVolumeMapper

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkFixedPointVolumeRayCastMapper::IsTypeOf(@)",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc IsA*(this: var vtkFixedPointVolumeRayCastMapper; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkFixedPointVolumeRayCastMapper.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkFixedPointVolumeRayCastMapper {.
    importcpp: "vtkFixedPointVolumeRayCastMapper::SafeDownCast(@)",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkFixedPointVolumeRayCastMapper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkVolumeMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFixedPointVolumeRayCastMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFixedPointVolumeRayCastMapper :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkFixedPointVolumeRayCastMapper; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkFixedPointVolumeRayCastMapper.h".}
proc SetSampleDistance*(this: var vtkFixedPointVolumeRayCastMapper; _arg: cfloat) {.
    importcpp: "SetSampleDistance", header: "vtkFixedPointVolumeRayCastMapper.h".}
## !!!Ignored construct:  virtual float GetSampleDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SampleDistance  of  << this -> SampleDistance ) ; return this -> SampleDistance ; } ;
## Error: expected ';'!!!

proc SetSampleDistanceInteractiveSampleDistance*(
    this: var vtkFixedPointVolumeRayCastMapper; _arg: cfloat) {.
    importcpp: "SetSampleDistanceInteractiveSampleDistance",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
## !!!Ignored construct:  virtual float GetSampleDistanceInteractiveSampleDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InteractiveSampleDistance  of  << this -> InteractiveSampleDistance ) ; return this -> InteractiveSampleDistance ; } ;
## Error: expected ';'!!!

proc SetImageSampleDistance*(this: var vtkFixedPointVolumeRayCastMapper;
                            _arg: cfloat) {.importcpp: "SetImageSampleDistance",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc GetImageSampleDistanceMinValue*(this: var vtkFixedPointVolumeRayCastMapper): cfloat {.
    importcpp: "GetImageSampleDistanceMinValue",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc GetImageSampleDistanceMaxValue*(this: var vtkFixedPointVolumeRayCastMapper): cfloat {.
    importcpp: "GetImageSampleDistanceMaxValue",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
## !!!Ignored construct:  virtual float GetSampleDistanceInteractiveSampleDistanceImageSampleDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ImageSampleDistance  of  << this -> ImageSampleDistance ) ; return this -> ImageSampleDistance ; } ;
## Error: expected ';'!!!

proc SetImageSampleDistanceMinimumImageSampleDistance*(
    this: var vtkFixedPointVolumeRayCastMapper; _arg: cfloat) {.
    importcpp: "SetImageSampleDistanceMinimumImageSampleDistance",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc GetImageSampleDistanceMinValueMinimumImageSampleDistanceMinValue*(
    this: var vtkFixedPointVolumeRayCastMapper): cfloat {.importcpp: "GetImageSampleDistanceMinValueMinimumImageSampleDistanceMinValue",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc GetImageSampleDistanceMaxValueMinimumImageSampleDistanceMaxValue*(
    this: var vtkFixedPointVolumeRayCastMapper): cfloat {.importcpp: "GetImageSampleDistanceMaxValueMinimumImageSampleDistanceMaxValue",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
## !!!Ignored construct:  virtual float GetSampleDistanceInteractiveSampleDistanceImageSampleDistanceMinimumImageSampleDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinimumImageSampleDistance  of  << this -> MinimumImageSampleDistance ) ; return this -> MinimumImageSampleDistance ; } ;
## Error: expected ';'!!!

proc SetImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistance*(
    this: var vtkFixedPointVolumeRayCastMapper; _arg: cfloat) {.importcpp: "SetImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistance",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc GetImageSampleDistanceMinValueMinimumImageSampleDistanceMinValueMaximumImageSampleDistanceMinValue*(
    this: var vtkFixedPointVolumeRayCastMapper): cfloat {.importcpp: "GetImageSampleDistanceMinValueMinimumImageSampleDistanceMinValueMaximumImageSampleDistanceMinValue",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc GetImageSampleDistanceMaxValueMinimumImageSampleDistanceMaxValueMaximumImageSampleDistanceMaxValue*(
    this: var vtkFixedPointVolumeRayCastMapper): cfloat {.importcpp: "GetImageSampleDistanceMaxValueMinimumImageSampleDistanceMaxValueMaximumImageSampleDistanceMaxValue",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
## !!!Ignored construct:  virtual float GetSampleDistanceInteractiveSampleDistanceImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumImageSampleDistance  of  << this -> MaximumImageSampleDistance ) ; return this -> MaximumImageSampleDistance ; } ;
## Error: expected ';'!!!

proc SetImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceAutoAdjustSampleDistances*(
    this: var vtkFixedPointVolumeRayCastMapper; _arg: vtkTypeBool) {.importcpp: "SetImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceAutoAdjustSampleDistances",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc GetImageSampleDistanceMinValueMinimumImageSampleDistanceMinValueMaximumImageSampleDistanceMinValueAutoAdjustSampleDistancesMinValue*(
    this: var vtkFixedPointVolumeRayCastMapper): vtkTypeBool {.importcpp: "GetImageSampleDistanceMinValueMinimumImageSampleDistanceMinValueMaximumImageSampleDistanceMinValueAutoAdjustSampleDistancesMinValue",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc GetImageSampleDistanceMaxValueMinimumImageSampleDistanceMaxValueMaximumImageSampleDistanceMaxValueAutoAdjustSampleDistancesMaxValue*(
    this: var vtkFixedPointVolumeRayCastMapper): vtkTypeBool {.importcpp: "GetImageSampleDistanceMaxValueMinimumImageSampleDistanceMaxValueMaximumImageSampleDistanceMaxValueAutoAdjustSampleDistancesMaxValue",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetSampleDistanceInteractiveSampleDistanceImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceAutoAdjustSampleDistances ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AutoAdjustSampleDistances  of  << this -> AutoAdjustSampleDistances ) ; return this -> AutoAdjustSampleDistances ; } ;
## Error: expected ';'!!!

proc AutoAdjustSampleDistancesOn*(this: var vtkFixedPointVolumeRayCastMapper) {.
    importcpp: "AutoAdjustSampleDistancesOn",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc AutoAdjustSampleDistancesOff*(this: var vtkFixedPointVolumeRayCastMapper) {.
    importcpp: "AutoAdjustSampleDistancesOff",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  Automatically compute the sample distance from the data spacing.  When
  ##  the number of voxels is 8, the sample distance will be roughly 1/200
  ##  the average voxel size. The distance will grow proportionally to
  ##  numVoxels^(1/3) until it reaches 1/2 average voxel size when number of
  ##  voxels is 1E6. Note that ScalarOpacityUnitDistance is still taken into
  ##  account and if different than 1, will effect the sample distance.
  ##
proc SetImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceAutoAdjustSampleDistancesLockSampleDistanceToInputSpacing*(
    this: var vtkFixedPointVolumeRayCastMapper; _arg: vtkTypeBool) {.importcpp: "SetImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceAutoAdjustSampleDistancesLockSampleDistanceToInputSpacing",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc GetImageSampleDistanceMinValueMinimumImageSampleDistanceMinValueMaximumImageSampleDistanceMinValueAutoAdjustSampleDistancesMinValueLockSampleDistanceToInputSpacingMinValue*(
    this: var vtkFixedPointVolumeRayCastMapper): vtkTypeBool {.importcpp: "GetImageSampleDistanceMinValueMinimumImageSampleDistanceMinValueMaximumImageSampleDistanceMinValueAutoAdjustSampleDistancesMinValueLockSampleDistanceToInputSpacingMinValue",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc GetImageSampleDistanceMaxValueMinimumImageSampleDistanceMaxValueMaximumImageSampleDistanceMaxValueAutoAdjustSampleDistancesMaxValueLockSampleDistanceToInputSpacingMaxValue*(
    this: var vtkFixedPointVolumeRayCastMapper): vtkTypeBool {.importcpp: "GetImageSampleDistanceMaxValueMinimumImageSampleDistanceMaxValueMaximumImageSampleDistanceMaxValueAutoAdjustSampleDistancesMaxValueLockSampleDistanceToInputSpacingMaxValue",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetSampleDistanceInteractiveSampleDistanceImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceAutoAdjustSampleDistancesLockSampleDistanceToInputSpacing ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LockSampleDistanceToInputSpacing  of  << this -> LockSampleDistanceToInputSpacing ) ; return this -> LockSampleDistanceToInputSpacing ; } ;
## Error: expected ';'!!!

proc LockSampleDistanceToInputSpacingOn*(this: var vtkFixedPointVolumeRayCastMapper) {.
    importcpp: "LockSampleDistanceToInputSpacingOn",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc LockSampleDistanceToInputSpacingOff*(
    this: var vtkFixedPointVolumeRayCastMapper) {.
    importcpp: "LockSampleDistanceToInputSpacingOff",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the number of threads to use. This by default is equal to
  ##  the number of available processors detected.
  ##  WARNING: If number of threads > 1, results may not be consistent.
  ##
proc SetNumberOfThreads*(this: var vtkFixedPointVolumeRayCastMapper; num: cint) {.
    importcpp: "SetNumberOfThreads", header: "vtkFixedPointVolumeRayCastMapper.h".}
proc GetNumberOfThreads*(this: var vtkFixedPointVolumeRayCastMapper): cint {.
    importcpp: "GetNumberOfThreads", header: "vtkFixedPointVolumeRayCastMapper.h".}
proc SetImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingIntermixIntersectingGeometry*(
    this: var vtkFixedPointVolumeRayCastMapper; _arg: vtkTypeBool) {.importcpp: "SetImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingIntermixIntersectingGeometry",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc GetImageSampleDistanceMinValueMinimumImageSampleDistanceMinValueMaximumImageSampleDistanceMinValueAutoAdjustSampleDistancesMinValueLockSampleDistanceToInputSpacingMinValueIntermixIntersectingGeometryMinValue*(
    this: var vtkFixedPointVolumeRayCastMapper): vtkTypeBool {.importcpp: "GetImageSampleDistanceMinValueMinimumImageSampleDistanceMinValueMaximumImageSampleDistanceMinValueAutoAdjustSampleDistancesMinValueLockSampleDistanceToInputSpacingMinValueIntermixIntersectingGeometryMinValue",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc GetImageSampleDistanceMaxValueMinimumImageSampleDistanceMaxValueMaximumImageSampleDistanceMaxValueAutoAdjustSampleDistancesMaxValueLockSampleDistanceToInputSpacingMaxValueIntermixIntersectingGeometryMaxValue*(
    this: var vtkFixedPointVolumeRayCastMapper): vtkTypeBool {.importcpp: "GetImageSampleDistanceMaxValueMinimumImageSampleDistanceMaxValueMaximumImageSampleDistanceMaxValueAutoAdjustSampleDistancesMaxValueLockSampleDistanceToInputSpacingMaxValueIntermixIntersectingGeometryMaxValue",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetSampleDistanceInteractiveSampleDistanceImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingIntermixIntersectingGeometry ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IntermixIntersectingGeometry  of  << this -> IntermixIntersectingGeometry ) ; return this -> IntermixIntersectingGeometry ; } ;
## Error: expected ';'!!!

proc IntermixIntersectingGeometryOn*(this: var vtkFixedPointVolumeRayCastMapper) {.
    importcpp: "IntermixIntersectingGeometryOn",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc IntermixIntersectingGeometryOff*(this: var vtkFixedPointVolumeRayCastMapper) {.
    importcpp: "IntermixIntersectingGeometryOff",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  What is the image sample distance required to achieve the desired time?
  ##  A version of this method is provided that does not require the volume
  ##  argument since if you are using an LODProp3D you may not know this information.
  ##  If you use this version you must be certain that the ray cast mapper is
  ##  only used for one volume (and not shared among multiple volumes)
  ##
proc ComputeRequiredImageSampleDistance*(this: var vtkFixedPointVolumeRayCastMapper;
                                        desiredTime: cfloat; ren: ptr vtkRenderer): cfloat {.
    importcpp: "ComputeRequiredImageSampleDistance",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc ComputeRequiredImageSampleDistance*(this: var vtkFixedPointVolumeRayCastMapper;
                                        desiredTime: cfloat; ren: ptr vtkRenderer;
                                        vol: ptr vtkVolume): cfloat {.
    importcpp: "ComputeRequiredImageSampleDistance",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc Render*(this: var vtkFixedPointVolumeRayCastMapper; a2: ptr vtkRenderer;
            a3: ptr vtkVolume) {.importcpp: "Render",
                              header: "vtkFixedPointVolumeRayCastMapper.h".}
proc ToFixedPointPosition*(this: var vtkFixedPointVolumeRayCastMapper; val: cfloat): cuint {.
    importcpp: "ToFixedPointPosition",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc ToFixedPointPosition*(this: var vtkFixedPointVolumeRayCastMapper;
                          `in`: array[3, cfloat]; `out`: array[3, cuint]) {.
    importcpp: "ToFixedPointPosition",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc ToFixedPointDirection*(this: var vtkFixedPointVolumeRayCastMapper; dir: cfloat): cuint {.
    importcpp: "ToFixedPointDirection",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc ToFixedPointDirection*(this: var vtkFixedPointVolumeRayCastMapper;
                           `in`: array[3, cfloat]; `out`: array[3, cuint]) {.
    importcpp: "ToFixedPointDirection",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc FixedPointIncrement*(this: var vtkFixedPointVolumeRayCastMapper;
                         position: array[3, cuint]; increment: array[3, cuint]) {.
    importcpp: "FixedPointIncrement", header: "vtkFixedPointVolumeRayCastMapper.h".}
proc GetFloatTripleFromPointer*(this: var vtkFixedPointVolumeRayCastMapper;
                               v: array[3, cfloat]; `ptr`: ptr cfloat) {.
    importcpp: "GetFloatTripleFromPointer",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc GetUIntTripleFromPointer*(this: var vtkFixedPointVolumeRayCastMapper;
                              v: array[3, cuint]; `ptr`: ptr cuint) {.
    importcpp: "GetUIntTripleFromPointer",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc ShiftVectorDown*(this: var vtkFixedPointVolumeRayCastMapper;
                     `in`: array[3, cuint]; `out`: array[3, cuint]) {.
    importcpp: "ShiftVectorDown", header: "vtkFixedPointVolumeRayCastMapper.h".}
proc CheckMinMaxVolumeFlag*(this: var vtkFixedPointVolumeRayCastMapper;
                           pos: array[3, cuint]; c: cint): cint {.
    importcpp: "CheckMinMaxVolumeFlag",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc CheckMIPMinMaxVolumeFlag*(this: var vtkFixedPointVolumeRayCastMapper;
                              pos: array[3, cuint]; c: cint; maxIdx: cushort;
                              flip: cint): cint {.
    importcpp: "CheckMIPMinMaxVolumeFlag",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc LookupColorUC*(this: var vtkFixedPointVolumeRayCastMapper;
                   colorTable: ptr cushort; scalarOpacityTable: ptr cushort;
                   index: cushort; color: array[4, cuchar]) {.
    importcpp: "LookupColorUC", header: "vtkFixedPointVolumeRayCastMapper.h".}
proc LookupDependentColorUC*(this: var vtkFixedPointVolumeRayCastMapper;
                            colorTable: ptr cushort;
                            scalarOpacityTable: ptr cushort;
                            index: array[4, cushort]; components: cint;
                            color: array[4, cuchar]) {.
    importcpp: "LookupDependentColorUC",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc LookupAndCombineIndependentColorsUC*(
    this: var vtkFixedPointVolumeRayCastMapper; colorTable: array[4, ptr cushort];
    scalarOpacityTable: array[4, ptr cushort]; index: array[4, cushort];
    weights: array[4, cfloat]; components: cint; color: array[4, cuchar]) {.
    importcpp: "LookupAndCombineIndependentColorsUC",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc CheckIfCropped*(this: var vtkFixedPointVolumeRayCastMapper;
                    pos: array[3, cuint]): cint {.importcpp: "CheckIfCropped",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc GetnameRenderWindow*(this: var vtkFixedPointVolumeRayCastMapper): ptr vtkRenderWindow {.
    importcpp: "GetnameRenderWindow", header: "vtkFixedPointVolumeRayCastMapper.h".}
proc GetnameRenderWindowMIPHelper*(this: var vtkFixedPointVolumeRayCastMapper): ptr vtkFixedPointVolumeRayCastMIPHelper {.
    importcpp: "GetnameRenderWindowMIPHelper",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc GetnameRenderWindowMIPHelperCompositeHelper*(
    this: var vtkFixedPointVolumeRayCastMapper): ptr vtkFixedPointVolumeRayCastCompositeHelper {.
    importcpp: "GetnameRenderWindowMIPHelperCompositeHelper",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc GetnameRenderWindowMIPHelperCompositeHelperCompositeGOHelper*(
    this: var vtkFixedPointVolumeRayCastMapper): ptr vtkFixedPointVolumeRayCastCompositeGOHelper {.
    importcpp: "GetnameRenderWindowMIPHelperCompositeHelperCompositeGOHelper",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc GetnameRenderWindowMIPHelperCompositeHelperCompositeGOHelperCompositeGOShadeHelper*(
    this: var vtkFixedPointVolumeRayCastMapper): ptr vtkFixedPointVolumeRayCastCompositeGOShadeHelper {.importcpp: "GetnameRenderWindowMIPHelperCompositeHelperCompositeGOHelperCompositeGOShadeHelper",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc GetnameRenderWindowMIPHelperCompositeHelperCompositeGOHelperCompositeGOShadeHelperCompositeShadeHelper*(
    this: var vtkFixedPointVolumeRayCastMapper): ptr vtkFixedPointVolumeRayCastCompositeShadeHelper {.importcpp: "GetnameRenderWindowMIPHelperCompositeHelperCompositeGOHelperCompositeGOShadeHelperCompositeShadeHelper",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
## !!!Ignored construct:  virtual float * GetTableShift ( ) VTK_SIZEHINT ( 4 ) { vtkDebugWithObjectMacro ( this , <<  returning  << TableShift  pointer  << this -> TableShift ) ; return this -> TableShift ; } VTK_WRAPEXCLUDE virtual void GetTableShift ( float data [ 4 ] ) { for ( int i = 0 ; i < 4 ; i ++ ) { data [ i ] = this -> TableShift [ i ] ; } } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual float * GetTableShiftTableScale ( ) VTK_SIZEHINT ( 4 ) { vtkDebugWithObjectMacro ( this , <<  returning  << TableScale  pointer  << this -> TableScale ) ; return this -> TableScale ; } VTK_WRAPEXCLUDE virtual void GetTableShiftTableScale ( float data [ 4 ] ) { for ( int i = 0 ; i < 4 ; i ++ ) { data [ i ] = this -> TableScale [ i ] ; } } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual int GetSampleDistanceInteractiveSampleDistanceImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingIntermixIntersectingGeometryShadingRequired ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ShadingRequired  of  << this -> ShadingRequired ) ; return this -> ShadingRequired ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual int GetSampleDistanceInteractiveSampleDistanceImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingIntermixIntersectingGeometryShadingRequiredGradientOpacityRequired ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GradientOpacityRequired  of  << this -> GradientOpacityRequired ) ; return this -> GradientOpacityRequired ; } ;
## Error: expected ';'!!!

proc GetnameRenderWindowMIPHelperCompositeHelperCompositeGOHelperCompositeGOShadeHelperCompositeShadeHelperCurrentScalars*(
    this: var vtkFixedPointVolumeRayCastMapper): ptr vtkDataArray {.importcpp: "GetnameRenderWindowMIPHelperCompositeHelperCompositeGOHelperCompositeGOShadeHelperCompositeShadeHelperCurrentScalars",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc GetnameRenderWindowMIPHelperCompositeHelperCompositeGOHelperCompositeGOShadeHelperCompositeShadeHelperCurrentScalarsPreviousScalars*(
    this: var vtkFixedPointVolumeRayCastMapper): ptr vtkDataArray {.importcpp: "GetnameRenderWindowMIPHelperCompositeHelperCompositeGOHelperCompositeGOShadeHelperCompositeShadeHelperCurrentScalarsPreviousScalars",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc GetRowBounds*(this: var vtkFixedPointVolumeRayCastMapper): ptr cint {.
    importcpp: "GetRowBounds", header: "vtkFixedPointVolumeRayCastMapper.h".}
proc GetColorTable*(this: var vtkFixedPointVolumeRayCastMapper; c: cint): ptr cushort {.
    importcpp: "GetColorTable", header: "vtkFixedPointVolumeRayCastMapper.h".}
proc GetScalarOpacityTable*(this: var vtkFixedPointVolumeRayCastMapper; c: cint): ptr cushort {.
    importcpp: "GetScalarOpacityTable",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc GetGradientOpacityTable*(this: var vtkFixedPointVolumeRayCastMapper; c: cint): ptr cushort {.
    importcpp: "GetGradientOpacityTable",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc GetVolume*(this: var vtkFixedPointVolumeRayCastMapper): ptr vtkVolume {.
    importcpp: "GetVolume", header: "vtkFixedPointVolumeRayCastMapper.h".}
proc GetGradientNormal*(this: var vtkFixedPointVolumeRayCastMapper): ptr ptr cushort {.
    importcpp: "GetGradientNormal", header: "vtkFixedPointVolumeRayCastMapper.h".}
proc GetGradientMagnitude*(this: var vtkFixedPointVolumeRayCastMapper): ptr ptr cuchar {.
    importcpp: "GetGradientMagnitude",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc GetDiffuseShadingTable*(this: var vtkFixedPointVolumeRayCastMapper; c: cint): ptr cushort {.
    importcpp: "GetDiffuseShadingTable",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc GetSpecularShadingTable*(this: var vtkFixedPointVolumeRayCastMapper; c: cint): ptr cushort {.
    importcpp: "GetSpecularShadingTable",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc ComputeRayInfo*(this: var vtkFixedPointVolumeRayCastMapper; x: cint; y: cint;
                    pos: array[3, cuint]; dir: array[3, cuint]; numSteps: ptr cuint) {.
    importcpp: "ComputeRayInfo", header: "vtkFixedPointVolumeRayCastMapper.h".}
proc InitializeRayInfo*(this: var vtkFixedPointVolumeRayCastMapper;
                       vol: ptr vtkVolume) {.importcpp: "InitializeRayInfo",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc ShouldUseNearestNeighborInterpolation*(
    this: var vtkFixedPointVolumeRayCastMapper; vol: ptr vtkVolume): cint {.
    importcpp: "ShouldUseNearestNeighborInterpolation",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc SetRayCastImage*(this: var vtkFixedPointVolumeRayCastMapper;
                     a2: ptr vtkFixedPointRayCastImage) {.
    importcpp: "SetRayCastImage", header: "vtkFixedPointVolumeRayCastMapper.h".}
proc GetnameRenderWindowMIPHelperCompositeHelperCompositeGOHelperCompositeGOShadeHelperCompositeShadeHelperCurrentScalarsPreviousScalarsRayCastImage*(
    this: var vtkFixedPointVolumeRayCastMapper): ptr vtkFixedPointRayCastImage {.importcpp: "GetnameRenderWindowMIPHelperCompositeHelperCompositeGOHelperCompositeGOShadeHelperCompositeShadeHelperCurrentScalarsPreviousScalarsRayCastImage",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
  ## /@}
proc PerImageInitialization*(this: var vtkFixedPointVolumeRayCastMapper;
                            a2: ptr vtkRenderer; a3: ptr vtkVolume; a4: cint;
                            a5: ptr cdouble; a6: ptr cdouble; a7: ptr cint): cint {.
    importcpp: "PerImageInitialization",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc PerVolumeInitialization*(this: var vtkFixedPointVolumeRayCastMapper;
                             a2: ptr vtkRenderer; a3: ptr vtkVolume) {.
    importcpp: "PerVolumeInitialization",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc PerSubVolumeInitialization*(this: var vtkFixedPointVolumeRayCastMapper;
                                a2: ptr vtkRenderer; a3: ptr vtkVolume; a4: cint) {.
    importcpp: "PerSubVolumeInitialization",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc RenderSubVolume*(this: var vtkFixedPointVolumeRayCastMapper) {.
    importcpp: "RenderSubVolume", header: "vtkFixedPointVolumeRayCastMapper.h".}
proc DisplayRenderedImage*(this: var vtkFixedPointVolumeRayCastMapper;
                          a2: ptr vtkRenderer; a3: ptr vtkVolume) {.
    importcpp: "DisplayRenderedImage",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc AbortRender*(this: var vtkFixedPointVolumeRayCastMapper) {.
    importcpp: "AbortRender", header: "vtkFixedPointVolumeRayCastMapper.h".}
proc CreateCanonicalView*(this: var vtkFixedPointVolumeRayCastMapper;
                         volume: ptr vtkVolume; image: ptr vtkImageData;
                         blend_mode: cint; viewDirection: array[3, cdouble];
                         viewUp: array[3, cdouble]) {.
    importcpp: "CreateCanonicalView", header: "vtkFixedPointVolumeRayCastMapper.h".}
proc GetEstimatedRenderTime*(this: var vtkFixedPointVolumeRayCastMapper;
                            ren: ptr vtkRenderer; vol: ptr vtkVolume): cfloat {.
    importcpp: "GetEstimatedRenderTime",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc GetEstimatedRenderTime*(this: var vtkFixedPointVolumeRayCastMapper;
                            ren: ptr vtkRenderer): cfloat {.
    importcpp: "GetEstimatedRenderTime",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc SetSampleDistanceInteractiveSampleDistanceFinalColorWindow*(
    this: var vtkFixedPointVolumeRayCastMapper; _arg: cfloat) {.
    importcpp: "SetSampleDistanceInteractiveSampleDistanceFinalColorWindow",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
## !!!Ignored construct:  virtual float GetSampleDistanceInteractiveSampleDistanceImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingIntermixIntersectingGeometryShadingRequiredGradientOpacityRequiredFinalColorWindow ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FinalColorWindow  of  << this -> FinalColorWindow ) ; return this -> FinalColorWindow ; } ;
## Error: expected ';'!!!

proc SetSampleDistanceInteractiveSampleDistanceFinalColorWindowFinalColorLevel*(
    this: var vtkFixedPointVolumeRayCastMapper; _arg: cfloat) {.importcpp: "SetSampleDistanceInteractiveSampleDistanceFinalColorWindowFinalColorLevel",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
## !!!Ignored construct:  virtual float GetSampleDistanceInteractiveSampleDistanceImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingIntermixIntersectingGeometryShadingRequiredGradientOpacityRequiredFinalColorWindowFinalColorLevel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FinalColorLevel  of  << this -> FinalColorLevel ) ; return this -> FinalColorLevel ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@}  Here to be used by the mapper to tell the helper
##  to flip the MIP comparison in order to support
##  minimum intensity blending virtual int GetSampleDistanceInteractiveSampleDistanceImageSampleDistanceMinimumImageSampleDistanceMaximumImageSampleDistanceAutoAdjustSampleDistancesLockSampleDistanceToInputSpacingIntermixIntersectingGeometryShadingRequiredGradientOpacityRequiredFinalColorWindowFinalColorLevelFlipMIPComparisonFlipMIPComparison ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FlipMIPComparison  of  << this -> FlipMIPComparison ) ; return this -> FlipMIPComparison ; } ;
## Error: expected ';'!!!

proc ReleaseGraphicsResources*(this: var vtkFixedPointVolumeRayCastMapper;
                              a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc ToFixedPointPosition*(this: var vtkFixedPointVolumeRayCastMapper; val: cfloat): cuint {.
    importcpp: "ToFixedPointPosition",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc ToFixedPointPosition*(this: var vtkFixedPointVolumeRayCastMapper;
                          `in`: array[3, cfloat]; `out`: array[3, cuint]) {.
    importcpp: "ToFixedPointPosition",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc ToFixedPointDirection*(this: var vtkFixedPointVolumeRayCastMapper; dir: cfloat): cuint {.
    importcpp: "ToFixedPointDirection",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc ToFixedPointDirection*(this: var vtkFixedPointVolumeRayCastMapper;
                           `in`: array[3, cfloat]; `out`: array[3, cuint]) {.
    importcpp: "ToFixedPointDirection",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc FixedPointIncrement*(this: var vtkFixedPointVolumeRayCastMapper;
                         position: array[3, cuint]; increment: array[3, cuint]) {.
    importcpp: "FixedPointIncrement", header: "vtkFixedPointVolumeRayCastMapper.h".}
proc GetFloatTripleFromPointer*(this: var vtkFixedPointVolumeRayCastMapper;
                               v: array[3, cfloat]; `ptr`: ptr cfloat) {.
    importcpp: "GetFloatTripleFromPointer",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc GetUIntTripleFromPointer*(this: var vtkFixedPointVolumeRayCastMapper;
                              v: array[3, cuint]; `ptr`: ptr cuint) {.
    importcpp: "GetUIntTripleFromPointer",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc ShiftVectorDown*(this: var vtkFixedPointVolumeRayCastMapper;
                     `in`: array[3, cuint]; `out`: array[3, cuint]) {.
    importcpp: "ShiftVectorDown", header: "vtkFixedPointVolumeRayCastMapper.h".}
proc CheckMinMaxVolumeFlag*(this: var vtkFixedPointVolumeRayCastMapper;
                           mmpos: array[3, cuint]; c: cint): cint {.
    importcpp: "CheckMinMaxVolumeFlag",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc CheckMIPMinMaxVolumeFlag*(this: var vtkFixedPointVolumeRayCastMapper;
                              mmpos: array[3, cuint]; c: cint; maxIdx: cushort;
                              flip: cint): cint {.
    importcpp: "CheckMIPMinMaxVolumeFlag",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc LookupColorUC*(this: var vtkFixedPointVolumeRayCastMapper;
                   colorTable: ptr cushort; scalarOpacityTable: ptr cushort;
                   index: cushort; color: array[4, cuchar]) {.
    importcpp: "LookupColorUC", header: "vtkFixedPointVolumeRayCastMapper.h".}
proc LookupDependentColorUC*(this: var vtkFixedPointVolumeRayCastMapper;
                            colorTable: ptr cushort;
                            scalarOpacityTable: ptr cushort;
                            index: array[4, cushort]; components: cint;
                            color: array[4, cuchar]) {.
    importcpp: "LookupDependentColorUC",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc LookupAndCombineIndependentColorsUC*(
    this: var vtkFixedPointVolumeRayCastMapper; colorTable: array[4, ptr cushort];
    scalarOpacityTable: array[4, ptr cushort]; index: array[4, cushort];
    weights: array[4, cfloat]; components: cint; color: array[4, cuchar]) {.
    importcpp: "LookupAndCombineIndependentColorsUC",
    header: "vtkFixedPointVolumeRayCastMapper.h".}
proc CheckIfCropped*(this: var vtkFixedPointVolumeRayCastMapper;
                    pos: array[3, cuint]): cint {.importcpp: "CheckIfCropped",
    header: "vtkFixedPointVolumeRayCastMapper.h".}