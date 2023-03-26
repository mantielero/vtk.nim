## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCompositeInterpolatedVelocityField.h
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
##  @class   vtkCompositeInterpolatedVelocityField
##  @brief   An abstract class for
##   obtaining the interpolated velocity values at a point
##
##   vtkCompositeInterpolatedVelocityField acts as a continuous velocity field
##   by performing cell interpolation on one or more underlying vtkDataSets. That is,
##   composite datasets are combined to create a continuous velocity field. The default
##   strategy is to use the closest point strategy.
##
##  @warning
##   vtkCompositeInterpolatedVelocityField is not thread safe. A new instance
##   should be created by each thread.
##
##  @sa
##   vtkAbstractInterpolatedVelocityField vtkAMRInterpolatedVelocityField
##   vtkGenericInterpolatedVelocityField vtkCachingInterpolatedVelocityField
##   vtkTemporalInterpolatedVelocityField vtkFunctionSet vtkStreamTracer
##

import
  vtkAbstractInterpolatedVelocityField, vtkFiltersFlowPathsModule

discard "forward decl of vtkDataSet"
type
  vtkCompositeInterpolatedVelocityField* {.
      importcpp: "vtkCompositeInterpolatedVelocityField",
      header: "vtkCompositeInterpolatedVelocityField.h", bycopy.} = object of vtkAbstractInterpolatedVelocityField ## /@{
                                                                                                            ## *
                                                                                                            ##  Standard methods for type information and printing.
                                                                                                            ##
    vtkCompositeInterpolatedVelocityField*
        {.importc: "vtkCompositeInterpolatedVelocityField".}: VTK_NEWINSTANCE

  vtkCompositeInterpolatedVelocityFieldSuperclass* = vtkAbstractInterpolatedVelocityField

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCompositeInterpolatedVelocityField::IsTypeOf(@)",
    header: "vtkCompositeInterpolatedVelocityField.h".}
proc IsA*(this: var vtkCompositeInterpolatedVelocityField; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkCompositeInterpolatedVelocityField.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCompositeInterpolatedVelocityField {.
    importcpp: "vtkCompositeInterpolatedVelocityField::SafeDownCast(@)",
    header: "vtkCompositeInterpolatedVelocityField.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCompositeInterpolatedVelocityField :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractInterpolatedVelocityField :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCompositeInterpolatedVelocityField :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCompositeInterpolatedVelocityField :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCompositeInterpolatedVelocityField; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkCompositeInterpolatedVelocityField.h".}
proc New*(): ptr vtkCompositeInterpolatedVelocityField {.
    importcpp: "vtkCompositeInterpolatedVelocityField::New(@)",
    header: "vtkCompositeInterpolatedVelocityField.h".}
proc AddDataSet*(this: var vtkCompositeInterpolatedVelocityField;
                dataset: ptr vtkDataSet; maxCellSize: csize_t = 0) {.
    importcpp: "AddDataSet", header: "vtkCompositeInterpolatedVelocityField.h".}
## using statement

proc FunctionValues*(this: var vtkCompositeInterpolatedVelocityField;
                    x: ptr cdouble; f: ptr cdouble): cint {.
    importcpp: "FunctionValues", header: "vtkCompositeInterpolatedVelocityField.h".}
proc InsideTest*(this: var vtkCompositeInterpolatedVelocityField; x: ptr cdouble): cint {.
    importcpp: "InsideTest", header: "vtkCompositeInterpolatedVelocityField.h".}
proc SnapPointOnCell*(this: var vtkCompositeInterpolatedVelocityField;
                     pOrigin: ptr cdouble; pProj: ptr cdouble): cint {.
    importcpp: "SnapPointOnCell",
    header: "vtkCompositeInterpolatedVelocityField.h".}
proc SetLastCellId*(this: var vtkCompositeInterpolatedVelocityField; c: vtkIdType;
                   dataindex: cint) {.importcpp: "SetLastCellId", header: "vtkCompositeInterpolatedVelocityField.h".}
proc SetLastCellId*(this: var vtkCompositeInterpolatedVelocityField; c: vtkIdType) {.
    importcpp: "SetLastCellId", header: "vtkCompositeInterpolatedVelocityField.h".}
## !!!Ignored construct:  /@{ *
##  Get the most recently visited dataset and its id. The dataset is used
##  for a guess regarding where the next point will be, without searching
##  through all datasets. When setting the last dataset, care is needed as
##  no reference counting or checks are performed. This feature is intended
##  for custom interpolators only that cache datasets independently.
##  virtual int GetLastDataSetIndexLastDataSetIndex ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LastDataSetIndex  of  << this -> LastDataSetIndex ) ; return this -> LastDataSetIndex ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get Cache DataSet hits and misses.
##  virtual int GetLastDataSetIndexLastDataSetIndexCacheDataSetHitCacheDataSetHit ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CacheDataSetHit  of  << this -> CacheDataSetHit ) ; return this -> CacheDataSetHit ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual int GetLastDataSetIndexLastDataSetIndexCacheDataSetHitCacheDataSetHitCacheDataSetMiss ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CacheDataSetMiss  of  << this -> CacheDataSetMiss ) ; return this -> CacheDataSetMiss ; } ;
## Error: expected ';'!!!

proc CopyParameters*(this: var vtkCompositeInterpolatedVelocityField;
                    `from`: ptr vtkAbstractInterpolatedVelocityField) {.
    importcpp: "CopyParameters", header: "vtkCompositeInterpolatedVelocityField.h".}