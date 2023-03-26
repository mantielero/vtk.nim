## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTemporalArrayOperatorFilter.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##     This software is distributed WITHOUT ANY WARRANTY; without even
##     the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##     PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkTemporalArrayOperatorFilter
##  @brief   perform simple mathematical operation on a data array at different time
##
##  This filter computes a simple operation between two time steps of one
##  data array.
##
##  @sa
##  vtkArrayCalulator
##

import
  vtkFiltersHybridModule, vtkMultiTimeStepAlgorithm

type
  vtkTemporalArrayOperatorFilter* {.importcpp: "vtkTemporalArrayOperatorFilter",
                                   header: "vtkTemporalArrayOperatorFilter.h",
                                   bycopy.} = object of vtkMultiTimeStepAlgorithm
    vtkTemporalArrayOperatorFilter* {.importc: "vtkTemporalArrayOperatorFilter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkTemporalArrayOperatorFilter {.
    importcpp: "vtkTemporalArrayOperatorFilter::New(@)",
    header: "vtkTemporalArrayOperatorFilter.h".}
type
  vtkTemporalArrayOperatorFilterSuperclass* = vtkMultiTimeStepAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTemporalArrayOperatorFilter::IsTypeOf(@)",
    header: "vtkTemporalArrayOperatorFilter.h".}
proc IsA*(this: var vtkTemporalArrayOperatorFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTemporalArrayOperatorFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTemporalArrayOperatorFilter {.
    importcpp: "vtkTemporalArrayOperatorFilter::SafeDownCast(@)",
    header: "vtkTemporalArrayOperatorFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTemporalArrayOperatorFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMultiTimeStepAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTemporalArrayOperatorFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTemporalArrayOperatorFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTemporalArrayOperatorFilter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkTemporalArrayOperatorFilter.h".}
type
  vtkTemporalArrayOperatorFilterOperatorType* {.size: sizeof(cint),
      importcpp: "vtkTemporalArrayOperatorFilter::OperatorType",
      header: "vtkTemporalArrayOperatorFilter.h".} = enum
    ADD = 0, SUB = 1, MUL = 2, DIV = 3


proc SetOperator*(this: var vtkTemporalArrayOperatorFilter; _arg: cint) {.
    importcpp: "SetOperator", header: "vtkTemporalArrayOperatorFilter.h".}
## !!!Ignored construct:  virtual int GetOperator ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Operator  of  << this -> Operator ) ; return this -> Operator ; } ;
## Error: expected ';'!!!

proc SetOperatorFirstTimeStepIndex*(this: var vtkTemporalArrayOperatorFilter;
                                   _arg: cint) {.
    importcpp: "SetOperatorFirstTimeStepIndex",
    header: "vtkTemporalArrayOperatorFilter.h".}
## !!!Ignored construct:  virtual int GetOperatorFirstTimeStepIndex ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FirstTimeStepIndex  of  << this -> FirstTimeStepIndex ) ; return this -> FirstTimeStepIndex ; } ;
## Error: expected ';'!!!

proc SetOperatorFirstTimeStepIndexSecondTimeStepIndex*(
    this: var vtkTemporalArrayOperatorFilter; _arg: cint) {.
    importcpp: "SetOperatorFirstTimeStepIndexSecondTimeStepIndex",
    header: "vtkTemporalArrayOperatorFilter.h".}
## !!!Ignored construct:  virtual int GetOperatorFirstTimeStepIndexSecondTimeStepIndex ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SecondTimeStepIndex  of  << this -> SecondTimeStepIndex ) ; return this -> SecondTimeStepIndex ; } ;
## Error: expected ';'!!!

proc SetOutputArrayNameSuffix*(this: var vtkTemporalArrayOperatorFilter;
                              _arg: cstring) {.
    importcpp: "SetOutputArrayNameSuffix",
    header: "vtkTemporalArrayOperatorFilter.h".}
proc GetOutputArrayNameSuffix*(this: var vtkTemporalArrayOperatorFilter): cstring {.
    importcpp: "GetOutputArrayNameSuffix",
    header: "vtkTemporalArrayOperatorFilter.h".}
  ## /@}