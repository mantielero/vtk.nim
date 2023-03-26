## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAbstractInterpolatedVelocityField.h
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
##  @class   vtkAbstractInterpolatedVelocityField
##  @brief   An abstract class for
##   obtaining the interpolated velocity values at a point
##
##
##   vtkAbstractInterpolatedVelocityField acts as a continuous velocity field
##   by performing cell interpolation on the underlying vtkDataSet (or in the
##   case of vtkCompositeInterpolatedVelocityField,
##   vtkCompositeDataSets). This is an abstract sub-class of vtkFunctionSet,
##   NumberOfIndependentVariables = 4 (x,y,z,t) and NumberOfFunctions = 3
##   (u,v,w). With a brute-force scheme, every time an evaluation is
##   performed, the target cell containing point (x,y,z) needs to be found by
##   calling FindCell(); however vtkAbstractInterpolatedVelocityField uses
##   locators to accelerate this operation via an instance of
##   vtkFindCellStrategy. Even with the use of locators, the cost of the find
##   cell operation can be large, hence this class performs local caching to
##   reduce the number of invocations of FindCell(). As a result, this class
##   is not thread safe as it contains local state (such as the cache
##   information). Writing a threaded operations requires separate instances of
##   vtkAbstractInterpolatedVelocityField for each thread.
##
##   For vtkCompositeInterpolatedVelocityField with CLOSEST_POINT strategy,
##   level #0 begins with intra-cell caching.
##   Specifically if the previous cell is valid and the next point is still in
##   it ( i.e., vtkCell::EvaluatePosition() returns 1, coupled with newly created
##   parametric coordinates & weights ), the function values can be interpolated
##   and only vtkCell::EvaluatePosition() is invoked. If this fails, then level #1
##   follows by inter-cell search for the target cell that contains the next point.
##   By an inter-cell search, the previous cell provides an important clue or serves
##   as an immediate neighbor to aid in locating the target cell via vtkPointSet::
##   FindCell(). If this still fails, a global cell location / search is invoked via
##   vtkFindCellStrategy. Finally, if this operation fails, the streamline is
##   considered terminated.
##
##   Note the particular find cell strategy employed can affect the behavior
##   of this class. If the strategy involved using a point locator (e.g.,
##   vtkStaticPointLocator or vtkPointLocator via vtkClosestPointStrategy or
##   vtkClosestNPointsStrategy) the performance of the class improves to the
##   detriment of robustness. Using a cell locator (e.g., vtkStaticCellLocator
##   or vtkCellLocator via vtkCellLocatorStrategy) improves robustness at some
##   cost to performance. Originally, these different behaviors (i.e., using
##   different locators) was codified into different subclasses of
##   vtkAbstractInterpolatedVelocityField.
##
##   Note that topologically structured classes such as vtkImageData and
##   vtkRectilinearGrid are able to provide fast robust cell location. Hence
##   the specified find cell strategy is only applicable to subclasses of
##   vtkPointSet (such as vtkUnstructuredGrid).
##
##
##  @warning
##   vtkAbstractInterpolatedVelocityField is not thread safe. A new instance
##   should be created by each thread.
##
##  @sa
##   vtkCompositeInterpolatedVelocityField vtkAMRInterpolatedVelocityField
##   vtkGenericInterpolatedVelocityField vtkCachingInterpolatedVelocityField
##   vtkTemporalInterpolatedVelocityField vtkFunctionSet vtkStreamTracer
##   vtkFindCellStrategy
##

import
  vtkFiltersFlowPathsModule, vtkFunctionSet, vtkNew, vtkSmartPointer

discard "forward decl of vtkCellLocatorStrategy"
discard "forward decl of vtkClosestPointStrategy"
discard "forward decl of vtkClosestNPointsStrategy"
discard "forward decl of vtkCompositeDataSet"
discard "forward decl of vtkDataObject"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkDataArray"
discard "forward decl of vtkIdList"
discard "forward decl of vtkPointData"
discard "forward decl of vtkGenericCell"
discard "forward decl of vtkFindCellStrategy"
type
  vtkAbstractInterpolatedVelocityField* {.
      importcpp: "vtkAbstractInterpolatedVelocityField",
      header: "vtkAbstractInterpolatedVelocityField.h", bycopy.} = object of vtkFunctionSet ## /@{
                                                                                     ## *
                                                                                     ##  Standard methods for obtaining type information and printing the object state.
                                                                                     ##
    vtkAbstractInterpolatedVelocityField*
        {.importc: "vtkAbstractInterpolatedVelocityField".}: VTK_NEWINSTANCE
    ## *
    ##  Make sure the velocity field is initialized: record the
    ##  initialization strategy.
    ##
    ##  This is used to keep track of the find cell strategy and vector array
    ##  associated with each dataset forming the velocity field. Note that the
    ##  find cells strategy can be null, this means the find cell is invoked
    ##  using the dataset's FindCell() method.

  vtkAbstractInterpolatedVelocityFieldSuperclass* = vtkFunctionSet

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAbstractInterpolatedVelocityField::IsTypeOf(@)",
    header: "vtkAbstractInterpolatedVelocityField.h".}
proc IsA*(this: var vtkAbstractInterpolatedVelocityField; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkAbstractInterpolatedVelocityField.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAbstractInterpolatedVelocityField {.
    importcpp: "vtkAbstractInterpolatedVelocityField::SafeDownCast(@)",
    header: "vtkAbstractInterpolatedVelocityField.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAbstractInterpolatedVelocityField :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkFunctionSet :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAbstractInterpolatedVelocityField :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAbstractInterpolatedVelocityField :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAbstractInterpolatedVelocityField; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkAbstractInterpolatedVelocityField.h".}
type
  vtkAbstractInterpolatedVelocityFieldVelocityFieldInitializationState* {.
      size: sizeof(cint), importcpp: "vtkAbstractInterpolatedVelocityField::VelocityFieldInitializationState",
      header: "vtkAbstractInterpolatedVelocityField.h".} = enum
    NOT_INITIALIZED = 0, INITIALIZE_ALL_DATASETS = 1, SELF_INITIALIZE = 2


proc Initialize*(this: var vtkAbstractInterpolatedVelocityField;
                compDS: ptr vtkCompositeDataSet;
                initStrategy: cint = INITIALIZE_ALL_DATASETS) {.
    importcpp: "Initialize", header: "vtkAbstractInterpolatedVelocityField.h".}
## !!!Ignored construct:  virtual int GetInitializationState ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InitializationState  of  << this -> InitializationState ) ; return this -> InitializationState ; } ;
## Error: expected ';'!!!

proc SetCaching*(this: var vtkAbstractInterpolatedVelocityField; _arg: bool) {.
    importcpp: "SetCaching", header: "vtkAbstractInterpolatedVelocityField.h".}
## !!!Ignored construct:  virtual bool GetInitializationStateCaching ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Caching  of  << this -> Caching ) ; return this -> Caching ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get the caching statistics. CacheHit refers to the number of level #0 cache
##  hits while CacheMiss is the number of level #0 cache misses.
##  virtual int GetInitializationStateCachingCacheHitCacheHit ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CacheHit  of  << this -> CacheHit ) ; return this -> CacheHit ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual int GetInitializationStateCachingCacheHitCacheHitCacheMiss ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CacheMiss  of  << this -> CacheMiss ) ; return this -> CacheMiss ; } ;
## Error: expected ';'!!!

proc GetnameLastDataSet*(this: var vtkAbstractInterpolatedVelocityField): ptr vtkDataSet {.
    importcpp: "GetnameLastDataSet",
    header: "vtkAbstractInterpolatedVelocityField.h".}
  ## /@{
  ## *
  ##  Get/Set the id of the cell cached from last evaluation.
  ##
## !!!Ignored construct:  virtual vtkIdType GetInitializationStateCachingCacheHitCacheHitCacheMissLastCellId ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LastCellId  of  << this -> LastCellId ) ; return this -> LastCellId ; } ;
## Error: expected ';'!!!

proc SetLastCellId*(this: var vtkAbstractInterpolatedVelocityField; c: vtkIdType) {.
    importcpp: "SetLastCellId", header: "vtkAbstractInterpolatedVelocityField.h".}
proc SetLastCellId*(this: var vtkAbstractInterpolatedVelocityField; c: vtkIdType;
                   dataindex: cint) {.importcpp: "SetLastCellId", header: "vtkAbstractInterpolatedVelocityField.h".}
proc GetVectorsSelection*(this: var vtkAbstractInterpolatedVelocityField): cstring {.
    importcpp: "GetVectorsSelection",
    header: "vtkAbstractInterpolatedVelocityField.h".}
## !!!Ignored construct:  virtual int GetInitializationStateCachingCacheHitCacheHitCacheMissLastCellIdVectorsType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VectorsType  of  << this -> VectorsType ) ; return this -> VectorsType ; } ;
## Error: expected ';'!!!

proc SelectVectors*(this: var vtkAbstractInterpolatedVelocityField;
                   fieldAssociation: cint; fieldName: cstring) {.
    importcpp: "SelectVectors", header: "vtkAbstractInterpolatedVelocityField.h".}
proc SetCachingNormalizeVector*(this: var vtkAbstractInterpolatedVelocityField;
                               _arg: bool) {.
    importcpp: "SetCachingNormalizeVector",
    header: "vtkAbstractInterpolatedVelocityField.h".}
## !!!Ignored construct:  virtual bool GetInitializationStateCachingCacheHitCacheHitCacheMissLastCellIdVectorsTypeNormalizeVector ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NormalizeVector  of  << this -> NormalizeVector ) ; return this -> NormalizeVector ; } ;
## Error: expected ';'!!!

proc SetCachingNormalizeVectorForceSurfaceTangentVector*(
    this: var vtkAbstractInterpolatedVelocityField; _arg: bool) {.
    importcpp: "SetCachingNormalizeVectorForceSurfaceTangentVector",
    header: "vtkAbstractInterpolatedVelocityField.h".}
## !!!Ignored construct:  virtual bool GetInitializationStateCachingCacheHitCacheHitCacheMissLastCellIdVectorsTypeNormalizeVectorForceSurfaceTangentVector ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ForceSurfaceTangentVector  of  << this -> ForceSurfaceTangentVector ) ; return this -> ForceSurfaceTangentVector ; } ;
## Error: expected ';'!!!

proc SetCachingNormalizeVectorForceSurfaceTangentVectorSurfaceDataset*(
    this: var vtkAbstractInterpolatedVelocityField; _arg: bool) {.importcpp: "SetCachingNormalizeVectorForceSurfaceTangentVectorSurfaceDataset",
    header: "vtkAbstractInterpolatedVelocityField.h".}
## !!!Ignored construct:  virtual bool GetInitializationStateCachingCacheHitCacheHitCacheMissLastCellIdVectorsTypeNormalizeVectorForceSurfaceTangentVectorSurfaceDataset ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SurfaceDataset  of  << this -> SurfaceDataset ) ; return this -> SurfaceDataset ; } ;
## Error: expected ';'!!!

proc CopyParameters*(this: var vtkAbstractInterpolatedVelocityField;
                    `from`: ptr vtkAbstractInterpolatedVelocityField) {.
    importcpp: "CopyParameters", header: "vtkAbstractInterpolatedVelocityField.h".}
## using statement

proc FunctionValues*(this: var vtkAbstractInterpolatedVelocityField; x: ptr cdouble;
                    f: ptr cdouble): cint {.importcpp: "FunctionValues", header: "vtkAbstractInterpolatedVelocityField.h".}
proc ClearLastCellId*(this: var vtkAbstractInterpolatedVelocityField) {.
    importcpp: "ClearLastCellId", header: "vtkAbstractInterpolatedVelocityField.h".}
proc GetLastWeights*(this: var vtkAbstractInterpolatedVelocityField; w: ptr cdouble): cint {.
    importcpp: "GetLastWeights", header: "vtkAbstractInterpolatedVelocityField.h".}
proc GetLastLocalCoordinates*(this: var vtkAbstractInterpolatedVelocityField;
                             pcoords: array[3, cdouble]): cint {.
    importcpp: "GetLastLocalCoordinates",
    header: "vtkAbstractInterpolatedVelocityField.h".}
proc SetFindCellStrategy*(this: var vtkAbstractInterpolatedVelocityField;
                         a2: ptr vtkFindCellStrategy) {.
    importcpp: "SetFindCellStrategy",
    header: "vtkAbstractInterpolatedVelocityField.h".}
proc GetnameLastDataSetFindCellStrategy*(this: var vtkAbstractInterpolatedVelocityField): ptr vtkFindCellStrategy {.
    importcpp: "GetnameLastDataSetFindCellStrategy",
    header: "vtkAbstractInterpolatedVelocityField.h".}
  ## /@}