## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPointInterpolator.h
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
##  @class   vtkPointInterpolator
##  @brief   interpolate over point cloud using various kernels
##
##
##  vtkPointInterpolator probes a point cloud Pc (the filter Source) with a
##  set of points P (the filter Input), interpolating the data values from Pc
##  onto P. Note however that the descriptive phrase "point cloud" is a
##  misnomer: Pc can be represented by any vtkDataSet type, with the points of
##  the dataset forming Pc. Similarly, the output P can also be represented by
##  any vtkDataSet type; and the topology/geometry structure of P is passed
##  through to the output along with the newly interpolated arrays.
##
##  A key input to this filter is the specification of the interpolation
##  kernel, and the parameters which control the associated interpolation
##  process. Interpolation kernels include Voronoi, Gaussian, Shepard, and SPH
##  (smoothed particle hydrodynamics), with additional kernels to be added in
##  the future.
##
##  An overview of the algorithm is as follows. For each p from P, Np "close"
##  points to p are found. (The meaning of what is "close" can be specified as
##  either the N closest points, or all points within a given radius Rp. This
##  depends on how the kernel is defined.) Once the Np close points are found,
##  then the interpolation kernel is applied to compute new data values
##  located on p. Note that for reasonable performance, finding the Np closest
##  points requires a point locator. The locator may be specified as input to
##  the algorithm. (By default, a vtkStaticPointLocator is used because
##  generally it is much faster to build, delete, and search with. However,
##  with highly non-uniform point distributions, octree- or kd-tree based
##  locators may perform better.)
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
##  @sa
##  vtkPointInterpolator2D vtkProbeFilter vtkGaussianSplatter
##  vtkCheckerboardSplatter vtkShepardMethod vtkVoronoiKernel vtkShepardKernel
##  vtkGaussianKernel vtkSPHKernel
##

import
  vtkDataSetAlgorithm, vtkFiltersPointsModule, vtkStdString

discard "forward decl of vtkAbstractPointLocator"
discard "forward decl of vtkIdList"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkInterpolationKernel"
discard "forward decl of vtkCharArray"
type
  vtkPointInterpolator* {.importcpp: "vtkPointInterpolator",
                         header: "vtkPointInterpolator.h", bycopy.} = object of vtkDataSetAlgorithm ## /@{
                                                                                             ## *
                                                                                             ##  Standard methods for instantiating, obtaining type information, and
                                                                                             ##  printing.
                                                                                             ##
    vtkPointInterpolator* {.importc: "vtkPointInterpolator".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPointInterpolator {.importcpp: "vtkPointInterpolator::New(@)",
                                    header: "vtkPointInterpolator.h".}
type
  vtkPointInterpolatorSuperclass* = vtkDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPointInterpolator::IsTypeOf(@)",
    header: "vtkPointInterpolator.h".}
proc IsA*(this: var vtkPointInterpolator; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPointInterpolator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPointInterpolator {.
    importcpp: "vtkPointInterpolator::SafeDownCast(@)",
    header: "vtkPointInterpolator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPointInterpolator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPointInterpolator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPointInterpolator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPointInterpolator; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPointInterpolator.h".}
proc SetSourceData*(this: var vtkPointInterpolator; source: ptr vtkDataObject) {.
    importcpp: "SetSourceData", header: "vtkPointInterpolator.h".}
proc GetSource*(this: var vtkPointInterpolator): ptr vtkDataObject {.
    importcpp: "GetSource", header: "vtkPointInterpolator.h".}
proc SetSourceConnection*(this: var vtkPointInterpolator;
                         algOutput: ptr vtkAlgorithmOutput) {.
    importcpp: "SetSourceConnection", header: "vtkPointInterpolator.h".}
proc SetLocator*(this: var vtkPointInterpolator;
                locator: ptr vtkAbstractPointLocator) {.importcpp: "SetLocator",
    header: "vtkPointInterpolator.h".}
proc GetnameLocator*(this: var vtkPointInterpolator): ptr vtkAbstractPointLocator {.
    importcpp: "GetnameLocator", header: "vtkPointInterpolator.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify an interpolation kernel. By default a vtkLinearKernel is used
  ##  (i.e., linear combination of closest points). The interpolation kernel
  ##  changes the basis of the interpolation.
  ##
proc SetKernel*(this: var vtkPointInterpolator; kernel: ptr vtkInterpolationKernel) {.
    importcpp: "SetKernel", header: "vtkPointInterpolator.h".}
proc GetnameLocatorKernel*(this: var vtkPointInterpolator): ptr vtkInterpolationKernel {.
    importcpp: "GetnameLocatorKernel", header: "vtkPointInterpolator.h".}
  ## /@}
type
  vtkPointInterpolatorStrategy* {.size: sizeof(cint),
                                 importcpp: "vtkPointInterpolator::Strategy",
                                 header: "vtkPointInterpolator.h".} = enum
    MASK_POINTS = 0, NULL_VALUE = 1, CLOSEST_POINT = 2


proc SetNullPointsStrategy*(this: var vtkPointInterpolator; _arg: cint) {.
    importcpp: "SetNullPointsStrategy", header: "vtkPointInterpolator.h".}
## !!!Ignored construct:  virtual int GetNullPointsStrategy ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NullPointsStrategy  of  << this -> NullPointsStrategy ) ; return this -> NullPointsStrategy ; } ;
## Error: expected ';'!!!

proc SetNullPointsStrategyToMaskPoints*(this: var vtkPointInterpolator) {.
    importcpp: "SetNullPointsStrategyToMaskPoints",
    header: "vtkPointInterpolator.h".}
proc SetNullPointsStrategyToNullValue*(this: var vtkPointInterpolator) {.
    importcpp: "SetNullPointsStrategyToNullValue",
    header: "vtkPointInterpolator.h".}
proc SetNullPointsStrategyToClosestPoint*(this: var vtkPointInterpolator) {.
    importcpp: "SetNullPointsStrategyToClosestPoint",
    header: "vtkPointInterpolator.h".}
proc SetNullPointsStrategyValidPointsMaskArrayName*(
    this: var vtkPointInterpolator; _arg: vtkStdString) {.
    importcpp: "SetNullPointsStrategyValidPointsMaskArrayName",
    header: "vtkPointInterpolator.h".}
## !!!Ignored construct:  virtual vtkStdString GetNullPointsStrategyValidPointsMaskArrayName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ValidPointsMaskArrayName  of  << this -> ValidPointsMaskArrayName ) ; return this -> ValidPointsMaskArrayName ; } ;
## Error: expected ';'!!!

proc SetNullPointsStrategyValidPointsMaskArrayNameNullValue*(
    this: var vtkPointInterpolator; _arg: cdouble) {.
    importcpp: "SetNullPointsStrategyValidPointsMaskArrayNameNullValue",
    header: "vtkPointInterpolator.h".}
## !!!Ignored construct:  virtual double GetNullPointsStrategyValidPointsMaskArrayNameNullValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NullValue  of  << this -> NullValue ) ; return this -> NullValue ; } ;
## Error: expected ';'!!!

proc AddExcludedArray*(this: var vtkPointInterpolator; excludedArray: vtkStdString) {.
    importcpp: "AddExcludedArray", header: "vtkPointInterpolator.h".}
proc ClearExcludedArrays*(this: var vtkPointInterpolator) {.
    importcpp: "ClearExcludedArrays", header: "vtkPointInterpolator.h".}
proc GetNumberOfExcludedArrays*(this: var vtkPointInterpolator): cint {.
    importcpp: "GetNumberOfExcludedArrays", header: "vtkPointInterpolator.h".}
proc GetExcludedArray*(this: var vtkPointInterpolator; i: cint): cstring {.
    importcpp: "GetExcludedArray", header: "vtkPointInterpolator.h".}
proc SetNullPointsStrategyValidPointsMaskArrayNameNullValuePromoteOutputArrays*(
    this: var vtkPointInterpolator; _arg: bool) {.importcpp: "SetNullPointsStrategyValidPointsMaskArrayNameNullValuePromoteOutputArrays",
    header: "vtkPointInterpolator.h".}
proc PromoteOutputArraysOn*(this: var vtkPointInterpolator) {.
    importcpp: "PromoteOutputArraysOn", header: "vtkPointInterpolator.h".}
proc PromoteOutputArraysOff*(this: var vtkPointInterpolator) {.
    importcpp: "PromoteOutputArraysOff", header: "vtkPointInterpolator.h".}
## !!!Ignored construct:  virtual bool GetNullPointsStrategyValidPointsMaskArrayNameNullValuePromoteOutputArrays ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PromoteOutputArrays  of  << this -> PromoteOutputArrays ) ; return this -> PromoteOutputArrays ; } ;
## Error: expected ';'!!!

proc SetNullPointsStrategyValidPointsMaskArrayNameNullValuePromoteOutputArraysPassPointArrays*(
    this: var vtkPointInterpolator; _arg: bool) {.importcpp: "SetNullPointsStrategyValidPointsMaskArrayNameNullValuePromoteOutputArraysPassPointArrays",
    header: "vtkPointInterpolator.h".}
proc PassPointArraysOn*(this: var vtkPointInterpolator) {.
    importcpp: "PassPointArraysOn", header: "vtkPointInterpolator.h".}
proc PassPointArraysOff*(this: var vtkPointInterpolator) {.
    importcpp: "PassPointArraysOff", header: "vtkPointInterpolator.h".}
## !!!Ignored construct:  virtual bool GetNullPointsStrategyValidPointsMaskArrayNameNullValuePromoteOutputArraysPassPointArrays ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassPointArrays  of  << this -> PassPointArrays ) ; return this -> PassPointArrays ; } ;
## Error: expected ';'!!!

proc SetNullPointsStrategyValidPointsMaskArrayNameNullValuePromoteOutputArraysPassPointArraysPassCellArrays*(
    this: var vtkPointInterpolator; _arg: bool) {.importcpp: "SetNullPointsStrategyValidPointsMaskArrayNameNullValuePromoteOutputArraysPassPointArraysPassCellArrays",
    header: "vtkPointInterpolator.h".}
proc PassCellArraysOn*(this: var vtkPointInterpolator) {.
    importcpp: "PassCellArraysOn", header: "vtkPointInterpolator.h".}
proc PassCellArraysOff*(this: var vtkPointInterpolator) {.
    importcpp: "PassCellArraysOff", header: "vtkPointInterpolator.h".}
## !!!Ignored construct:  virtual bool GetNullPointsStrategyValidPointsMaskArrayNameNullValuePromoteOutputArraysPassPointArraysPassCellArrays ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassCellArrays  of  << this -> PassCellArrays ) ; return this -> PassCellArrays ; } ;
## Error: expected ';'!!!

proc SetNullPointsStrategyValidPointsMaskArrayNameNullValuePromoteOutputArraysPassPointArraysPassCellArraysPassFieldArrays*(
    this: var vtkPointInterpolator; _arg: bool) {.importcpp: "SetNullPointsStrategyValidPointsMaskArrayNameNullValuePromoteOutputArraysPassPointArraysPassCellArraysPassFieldArrays",
    header: "vtkPointInterpolator.h".}
proc PassFieldArraysOn*(this: var vtkPointInterpolator) {.
    importcpp: "PassFieldArraysOn", header: "vtkPointInterpolator.h".}
proc PassFieldArraysOff*(this: var vtkPointInterpolator) {.
    importcpp: "PassFieldArraysOff", header: "vtkPointInterpolator.h".}
## !!!Ignored construct:  virtual bool GetNullPointsStrategyValidPointsMaskArrayNameNullValuePromoteOutputArraysPassPointArraysPassCellArraysPassFieldArrays ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassFieldArrays  of  << this -> PassFieldArrays ) ; return this -> PassFieldArrays ; } ;
## Error: expected ';'!!!

proc GetMTime*(this: var vtkPointInterpolator): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkPointInterpolator.h".}