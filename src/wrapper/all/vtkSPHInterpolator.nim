## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSPHInterpolator.h
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
##  @class   vtkSPHInterpolator
##  @brief   interpolate over point cloud using SPH kernels
##
##
##  This filter uses SPH (smooth particle hydrodynamics) kernels to
##  interpolate a data source onto an input structure. For example, while the
##  data source is a set of particles, the data from these particles can be
##  interpolated onto an input object such as a line, plane or volume. Then
##  the output (which consists of the input structure plus interpolated data)
##  can then be visualized using classical visualization techniques such as
##  isocontouring, slicing, heat maps and so on.
##
##  To use this filter, besides setting the input P and source Pc, specify a
##  point locator (which accelerates queries about points and their neighbors)
##  and an interpolation kernel (a subclass of vtkSPHKernel). In addition, the
##  name of the source's density and mass arrays can optionally be provided;
##  however if not provided then the local volume is computed from the
##  kernel's spatial step. Finally, a cutoff distance array can optionally be
##  provided (as part of the input P point data) when the local neighborhood
##  around each sample point varies. The cutoff distance defines a local
##  neighborhood in which the points in that neighborhood are used to
##  interpolate values. If not provided, then the cutoff distance is computed
##  from the spatial step size times the cutoff factor (see vtkSPHKernel).
##
##  Other options to the filter include specifying which data attributes to
##  interpolate from the source. By default, all data attributes contained in
##  the source are interpolated. However, by adding array names to the
##  exclusion list, these arrays will not be interpolated. Also, it is
##  possible to use a SPH derivative formulation to interpolate from the
##  source data attributes. This requires adding arrays (by name) to the
##  derivative list, in which case the derivative formulation will be applied
##  to create a new output array named "X_deriv" where X is the name of a
##  source point attribute array.
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @warning
##  For widely spaced points in Pc, or when p is located outside the bounding
##  region of Pc, the interpolation may behave badly and the interpolation
##  process will adapt as necessary to produce output. For example, if the N
##  closest points within R are requested to interpolate p, if N=0 then the
##  interpolation will switch to a different strategy (which can be controlled
##  as in the NullPointsStrategy).
##
##  @warning
##  For more information and technical reference, see D.J. Price, Smoothed
##  particle hydrodynamics and magnetohydrodynamics,
##  J. Comput. Phys. 231:759-794, 2012. Especially equation 49.
##
##  @par Acknowledgments:
##  The following work has been generously supported by Altair Engineering
##  and FluiDyna GmbH. Please contact Steve Cosgrove or Milos Stanic for
##  more information.
##
##  @sa
##  vtkPointInterpolator vtkSPHKernel vtkSPHQuinticKernel
##

import
  vtkDataSetAlgorithm, vtkFiltersPointsModule, vtkStdString

discard "forward decl of vtkAbstractPointLocator"
discard "forward decl of vtkIdList"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkSPHKernel"
discard "forward decl of vtkCharArray"
discard "forward decl of vtkFloatArray"
type
  vtkSPHInterpolator* {.importcpp: "vtkSPHInterpolator",
                       header: "vtkSPHInterpolator.h", bycopy.} = object of vtkDataSetAlgorithm ## /@{
                                                                                         ## *
                                                                                         ##  Standard methods for instantiating, obtaining type information, and
                                                                                         ##  printing.
                                                                                         ##
    vtkSPHInterpolator* {.importc: "vtkSPHInterpolator".}: VTK_NEWINSTANCE


proc New*(): ptr vtkSPHInterpolator {.importcpp: "vtkSPHInterpolator::New(@)",
                                  header: "vtkSPHInterpolator.h".}
type
  vtkSPHInterpolatorSuperclass* = vtkDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSPHInterpolator::IsTypeOf(@)", header: "vtkSPHInterpolator.h".}
proc IsA*(this: var vtkSPHInterpolator; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkSPHInterpolator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSPHInterpolator {.
    importcpp: "vtkSPHInterpolator::SafeDownCast(@)",
    header: "vtkSPHInterpolator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSPHInterpolator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSPHInterpolator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSPHInterpolator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSPHInterpolator; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSPHInterpolator.h".}
proc SetSourceData*(this: var vtkSPHInterpolator; source: ptr vtkDataObject) {.
    importcpp: "SetSourceData", header: "vtkSPHInterpolator.h".}
proc GetSource*(this: var vtkSPHInterpolator): ptr vtkDataObject {.
    importcpp: "GetSource", header: "vtkSPHInterpolator.h".}
proc SetSourceConnection*(this: var vtkSPHInterpolator;
                         algOutput: ptr vtkAlgorithmOutput) {.
    importcpp: "SetSourceConnection", header: "vtkSPHInterpolator.h".}
proc SetLocator*(this: var vtkSPHInterpolator; locator: ptr vtkAbstractPointLocator) {.
    importcpp: "SetLocator", header: "vtkSPHInterpolator.h".}
proc GetnameLocator*(this: var vtkSPHInterpolator): ptr vtkAbstractPointLocator {.
    importcpp: "GetnameLocator", header: "vtkSPHInterpolator.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify an interpolation kernel. By default a vtkSPHQuinticKernel is used
  ##  (i.e., closest point). The interpolation kernel changes the basis of the
  ##  interpolation.
  ##
proc SetKernel*(this: var vtkSPHInterpolator; kernel: ptr vtkSPHKernel) {.
    importcpp: "SetKernel", header: "vtkSPHInterpolator.h".}
proc GetnameLocatorKernel*(this: var vtkSPHInterpolator): ptr vtkSPHKernel {.
    importcpp: "GetnameLocatorKernel", header: "vtkSPHInterpolator.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify an (optional) cutoff distance for each point in the input P. If
  ##  not specified, then the kernel cutoff is used.
  ##
proc SetCutoffArrayName*(this: var vtkSPHInterpolator; _arg: vtkStdString) {.
    importcpp: "SetCutoffArrayName", header: "vtkSPHInterpolator.h".}
## !!!Ignored construct:  virtual vtkStdString GetCutoffArrayName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CutoffArrayName  of  << this -> CutoffArrayName ) ; return this -> CutoffArrayName ; } ;
## Error: expected ';'!!!

proc SetCutoffArrayNameDensityArrayName*(this: var vtkSPHInterpolator;
                                        _arg: vtkStdString) {.
    importcpp: "SetCutoffArrayNameDensityArrayName",
    header: "vtkSPHInterpolator.h".}
## !!!Ignored construct:  virtual vtkStdString GetCutoffArrayNameDensityArrayName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DensityArrayName  of  << this -> DensityArrayName ) ; return this -> DensityArrayName ; } ;
## Error: expected ';'!!!

proc SetCutoffArrayNameDensityArrayNameMassArrayName*(
    this: var vtkSPHInterpolator; _arg: vtkStdString) {.
    importcpp: "SetCutoffArrayNameDensityArrayNameMassArrayName",
    header: "vtkSPHInterpolator.h".}
## !!!Ignored construct:  virtual vtkStdString GetCutoffArrayNameDensityArrayNameMassArrayName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MassArrayName  of  << this -> MassArrayName ) ; return this -> MassArrayName ; } ;
## Error: expected ';'!!!

proc AddExcludedArray*(this: var vtkSPHInterpolator; excludedArray: vtkStdString) {.
    importcpp: "AddExcludedArray", header: "vtkSPHInterpolator.h".}
proc ClearExcludedArrays*(this: var vtkSPHInterpolator) {.
    importcpp: "ClearExcludedArrays", header: "vtkSPHInterpolator.h".}
proc GetNumberOfExcludedArrays*(this: var vtkSPHInterpolator): cint {.
    importcpp: "GetNumberOfExcludedArrays", header: "vtkSPHInterpolator.h".}
proc GetExcludedArray*(this: var vtkSPHInterpolator; i: cint): cstring {.
    importcpp: "GetExcludedArray", header: "vtkSPHInterpolator.h".}
proc AddDerivativeArray*(this: var vtkSPHInterpolator; derivArray: vtkStdString) {.
    importcpp: "AddDerivativeArray", header: "vtkSPHInterpolator.h".}
proc ClearDerivativeArrays*(this: var vtkSPHInterpolator) {.
    importcpp: "ClearDerivativeArrays", header: "vtkSPHInterpolator.h".}
proc GetNumberOfDerivativeArrays*(this: var vtkSPHInterpolator): cint {.
    importcpp: "GetNumberOfDerivativeArrays", header: "vtkSPHInterpolator.h".}
proc GetDerivativeArray*(this: var vtkSPHInterpolator; i: cint): cstring {.
    importcpp: "GetDerivativeArray", header: "vtkSPHInterpolator.h".}
type
  vtkSPHInterpolatorNullStrategy* {.size: sizeof(cint), importcpp: "vtkSPHInterpolator::NullStrategy",
                                   header: "vtkSPHInterpolator.h".} = enum
    MASK_POINTS = 0, NULL_VALUE = 1


proc SetCutoffArrayNameDensityArrayNameMassArrayNameNullPointsStrategy*(
    this: var vtkSPHInterpolator; _arg: cint) {.importcpp: "SetCutoffArrayNameDensityArrayNameMassArrayNameNullPointsStrategy",
    header: "vtkSPHInterpolator.h".}
## !!!Ignored construct:  virtual int GetCutoffArrayNameDensityArrayNameMassArrayNameNullPointsStrategy ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NullPointsStrategy  of  << this -> NullPointsStrategy ) ; return this -> NullPointsStrategy ; } ;
## Error: expected ';'!!!

proc SetNullPointsStrategyToMaskPoints*(this: var vtkSPHInterpolator) {.
    importcpp: "SetNullPointsStrategyToMaskPoints", header: "vtkSPHInterpolator.h".}
proc SetNullPointsStrategyToNullValue*(this: var vtkSPHInterpolator) {.
    importcpp: "SetNullPointsStrategyToNullValue", header: "vtkSPHInterpolator.h".}
proc SetCutoffArrayNameDensityArrayNameMassArrayNameNullPointsStrategyValidPointsMaskArrayName*(
    this: var vtkSPHInterpolator; _arg: vtkStdString) {.importcpp: "SetCutoffArrayNameDensityArrayNameMassArrayNameNullPointsStrategyValidPointsMaskArrayName",
    header: "vtkSPHInterpolator.h".}
## !!!Ignored construct:  virtual vtkStdString GetCutoffArrayNameDensityArrayNameMassArrayNameNullPointsStrategyValidPointsMaskArrayName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ValidPointsMaskArrayName  of  << this -> ValidPointsMaskArrayName ) ; return this -> ValidPointsMaskArrayName ; } ;
## Error: expected ';'!!!

proc SetCutoffArrayNameDensityArrayNameMassArrayNameNullPointsStrategyValidPointsMaskArrayNameNullValue*(
    this: var vtkSPHInterpolator; _arg: cdouble) {.importcpp: "SetCutoffArrayNameDensityArrayNameMassArrayNameNullPointsStrategyValidPointsMaskArrayNameNullValue",
    header: "vtkSPHInterpolator.h".}
## !!!Ignored construct:  virtual double GetCutoffArrayNameDensityArrayNameMassArrayNameNullPointsStrategyValidPointsMaskArrayNameNullValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NullValue  of  << this -> NullValue ) ; return this -> NullValue ; } ;
## Error: expected ';'!!!

proc SetCutoffArrayNameDensityArrayNameMassArrayNameNullPointsStrategyValidPointsMaskArrayNameNullValueComputeShepardSum*(
    this: var vtkSPHInterpolator; _arg: vtkTypeBool) {.importcpp: "SetCutoffArrayNameDensityArrayNameMassArrayNameNullPointsStrategyValidPointsMaskArrayNameNullValueComputeShepardSum",
    header: "vtkSPHInterpolator.h".}
proc ComputeShepardSumOn*(this: var vtkSPHInterpolator) {.
    importcpp: "ComputeShepardSumOn", header: "vtkSPHInterpolator.h".}
proc ComputeShepardSumOff*(this: var vtkSPHInterpolator) {.
    importcpp: "ComputeShepardSumOff", header: "vtkSPHInterpolator.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetCutoffArrayNameDensityArrayNameMassArrayNameNullPointsStrategyValidPointsMaskArrayNameNullValueComputeShepardSum ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeShepardSum  of  << this -> ComputeShepardSum ) ; return this -> ComputeShepardSum ; } ;
## Error: expected ';'!!!

proc SetCutoffArrayNameDensityArrayNameMassArrayNameNullPointsStrategyValidPointsMaskArrayNameNullValueComputeShepardSumShepardSumArrayName*(
    this: var vtkSPHInterpolator; _arg: vtkStdString) {.importcpp: "SetCutoffArrayNameDensityArrayNameMassArrayNameNullPointsStrategyValidPointsMaskArrayNameNullValueComputeShepardSumShepardSumArrayName",
    header: "vtkSPHInterpolator.h".}
## !!!Ignored construct:  virtual vtkStdString GetCutoffArrayNameDensityArrayNameMassArrayNameNullPointsStrategyValidPointsMaskArrayNameNullValueComputeShepardSumShepardSumArrayName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ShepardSumArrayName  of  << this -> ShepardSumArrayName ) ; return this -> ShepardSumArrayName ; } ;
## Error: expected ';'!!!

proc SetCutoffArrayNameDensityArrayNameMassArrayNameNullPointsStrategyValidPointsMaskArrayNameNullValueComputeShepardSumShepardSumArrayNamePromoteOutputArrays*(
    this: var vtkSPHInterpolator; _arg: vtkTypeBool) {.importcpp: "SetCutoffArrayNameDensityArrayNameMassArrayNameNullPointsStrategyValidPointsMaskArrayNameNullValueComputeShepardSumShepardSumArrayNamePromoteOutputArrays",
    header: "vtkSPHInterpolator.h".}
proc PromoteOutputArraysOn*(this: var vtkSPHInterpolator) {.
    importcpp: "PromoteOutputArraysOn", header: "vtkSPHInterpolator.h".}
proc PromoteOutputArraysOff*(this: var vtkSPHInterpolator) {.
    importcpp: "PromoteOutputArraysOff", header: "vtkSPHInterpolator.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetCutoffArrayNameDensityArrayNameMassArrayNameNullPointsStrategyValidPointsMaskArrayNameNullValueComputeShepardSumShepardSumArrayNamePromoteOutputArrays ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PromoteOutputArrays  of  << this -> PromoteOutputArrays ) ; return this -> PromoteOutputArrays ; } ;
## Error: expected ';'!!!

proc SetCutoffArrayNameDensityArrayNameMassArrayNameNullPointsStrategyValidPointsMaskArrayNameNullValueComputeShepardSumShepardSumArrayNamePromoteOutputArraysPassPointArrays*(
    this: var vtkSPHInterpolator; _arg: vtkTypeBool) {.importcpp: "SetCutoffArrayNameDensityArrayNameMassArrayNameNullPointsStrategyValidPointsMaskArrayNameNullValueComputeShepardSumShepardSumArrayNamePromoteOutputArraysPassPointArrays",
    header: "vtkSPHInterpolator.h".}
proc PassPointArraysOn*(this: var vtkSPHInterpolator) {.
    importcpp: "PassPointArraysOn", header: "vtkSPHInterpolator.h".}
proc PassPointArraysOff*(this: var vtkSPHInterpolator) {.
    importcpp: "PassPointArraysOff", header: "vtkSPHInterpolator.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetCutoffArrayNameDensityArrayNameMassArrayNameNullPointsStrategyValidPointsMaskArrayNameNullValueComputeShepardSumShepardSumArrayNamePromoteOutputArraysPassPointArrays ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassPointArrays  of  << this -> PassPointArrays ) ; return this -> PassPointArrays ; } ;
## Error: expected ';'!!!

proc SetCutoffArrayNameDensityArrayNameMassArrayNameNullPointsStrategyValidPointsMaskArrayNameNullValueComputeShepardSumShepardSumArrayNamePromoteOutputArraysPassPointArraysPassCellArrays*(
    this: var vtkSPHInterpolator; _arg: vtkTypeBool) {.importcpp: "SetCutoffArrayNameDensityArrayNameMassArrayNameNullPointsStrategyValidPointsMaskArrayNameNullValueComputeShepardSumShepardSumArrayNamePromoteOutputArraysPassPointArraysPassCellArrays",
    header: "vtkSPHInterpolator.h".}
proc PassCellArraysOn*(this: var vtkSPHInterpolator) {.
    importcpp: "PassCellArraysOn", header: "vtkSPHInterpolator.h".}
proc PassCellArraysOff*(this: var vtkSPHInterpolator) {.
    importcpp: "PassCellArraysOff", header: "vtkSPHInterpolator.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetCutoffArrayNameDensityArrayNameMassArrayNameNullPointsStrategyValidPointsMaskArrayNameNullValueComputeShepardSumShepardSumArrayNamePromoteOutputArraysPassPointArraysPassCellArrays ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassCellArrays  of  << this -> PassCellArrays ) ; return this -> PassCellArrays ; } ;
## Error: expected ';'!!!

proc SetCutoffArrayNameDensityArrayNameMassArrayNameNullPointsStrategyValidPointsMaskArrayNameNullValueComputeShepardSumShepardSumArrayNamePromoteOutputArraysPassPointArraysPassCellArraysPassFieldArrays*(
    this: var vtkSPHInterpolator; _arg: vtkTypeBool) {.importcpp: "SetCutoffArrayNameDensityArrayNameMassArrayNameNullPointsStrategyValidPointsMaskArrayNameNullValueComputeShepardSumShepardSumArrayNamePromoteOutputArraysPassPointArraysPassCellArraysPassFieldArrays",
    header: "vtkSPHInterpolator.h".}
proc PassFieldArraysOn*(this: var vtkSPHInterpolator) {.
    importcpp: "PassFieldArraysOn", header: "vtkSPHInterpolator.h".}
proc PassFieldArraysOff*(this: var vtkSPHInterpolator) {.
    importcpp: "PassFieldArraysOff", header: "vtkSPHInterpolator.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetCutoffArrayNameDensityArrayNameMassArrayNameNullPointsStrategyValidPointsMaskArrayNameNullValueComputeShepardSumShepardSumArrayNamePromoteOutputArraysPassPointArraysPassCellArraysPassFieldArrays ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassFieldArrays  of  << this -> PassFieldArrays ) ; return this -> PassFieldArrays ; } ;
## Error: expected ';'!!!

proc SetCutoffArrayNameDensityArrayNameMassArrayNameNullPointsStrategyValidPointsMaskArrayNameNullValueComputeShepardSumShepardSumArrayNamePromoteOutputArraysPassPointArraysPassCellArraysPassFieldArraysShepardNormalization*(
    this: var vtkSPHInterpolator; _arg: vtkTypeBool) {.importcpp: "SetCutoffArrayNameDensityArrayNameMassArrayNameNullPointsStrategyValidPointsMaskArrayNameNullValueComputeShepardSumShepardSumArrayNamePromoteOutputArraysPassPointArraysPassCellArraysPassFieldArraysShepardNormalization",
    header: "vtkSPHInterpolator.h".}
proc ShepardNormalizationOn*(this: var vtkSPHInterpolator) {.
    importcpp: "ShepardNormalizationOn", header: "vtkSPHInterpolator.h".}
proc ShepardNormalizationOff*(this: var vtkSPHInterpolator) {.
    importcpp: "ShepardNormalizationOff", header: "vtkSPHInterpolator.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetCutoffArrayNameDensityArrayNameMassArrayNameNullPointsStrategyValidPointsMaskArrayNameNullValueComputeShepardSumShepardSumArrayNamePromoteOutputArraysPassPointArraysPassCellArraysPassFieldArraysShepardNormalization ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ShepardNormalization  of  << this -> ShepardNormalization ) ; return this -> ShepardNormalization ; } ;
## Error: expected ';'!!!

proc GetMTime*(this: var vtkSPHInterpolator): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkSPHInterpolator.h".}