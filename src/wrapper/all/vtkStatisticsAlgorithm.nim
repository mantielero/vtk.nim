## =========================================================================
##
## Program:   Visualization Toolkit
## Module:    vtkStatisticsAlgorithm.h
##
## Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
## All rights reserved.
## See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
## This software is distributed WITHOUT ANY WARRANTY; without even
## the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
## PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## -------------------------------------------------------------------------
##   Copyright 2011 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
##   -------------------------------------------------------------------------
## *
##  @class   vtkStatisticsAlgorithm
##  @brief   Base class for statistics algorithms
##
##
##  All statistics algorithms can conceptually be operated with several operations:
##  * Learn: given an input data set, calculate a minimal statistical model (e.g.,
##    sums, raw moments, joint probabilities).
##  * Derive: given an input minimal statistical model, derive the full model
##    (e.g., descriptive statistics, quantiles, correlations, conditional
##     probabilities).
##    NB: It may be, or not be, a problem that a full model was not derived. For
##    instance, when doing parallel calculations, one only wants to derive the full
##    model after all partial calculations have completed. On the other hand, one
##    can also directly provide a full model, that was previously calculated or
##    guessed, and not derive a new one.
##  * Assess: given an input data set, input statistics, and some form of
##    threshold, assess a subset of the data set.
##  * Test: perform at least one statistical test.
##  Therefore, a vtkStatisticsAlgorithm has the following ports
##  * 3 optional input ports:
##    * Data (vtkTable)
##    * Parameters to the learn operation (vtkTable)
##    * Input model (vtkMultiBlockDataSet)
##  * 3 output ports:
##    * Data (input annotated with assessments when the Assess operation is ON).
##    * Output model (identical to the input model when Learn operation is OFF).
##    * Output of statistical tests. Some engines do not offer such tests yet, in
##      which case this output will always be empty even when the Test operation is ON.
##
##  @par Thanks:
##  Thanks to Philippe Pebay and David Thompson from Sandia National Laboratories
##  for implementing this class.
##  Updated by Philippe Pebay, Kitware SAS 2012
##

import
  vtkFiltersStatisticsModule, vtkTableAlgorithm

discard "forward decl of vtkDataObjectCollection"
discard "forward decl of vtkMultiBlockDataSet"
discard "forward decl of vtkStdString"
discard "forward decl of vtkStringArray"
discard "forward decl of vtkVariant"
discard "forward decl of vtkVariantArray"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkStatisticsAlgorithmPrivate"
type
  vtkStatisticsAlgorithm* {.importcpp: "vtkStatisticsAlgorithm",
                           header: "vtkStatisticsAlgorithm.h", bycopy.} = object of vtkTableAlgorithm
    vtkStatisticsAlgorithm* {.importc: "vtkStatisticsAlgorithm".}: VTK_NEWINSTANCE

  vtkStatisticsAlgorithmSuperclass* = vtkTableAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkStatisticsAlgorithm::IsTypeOf(@)",
    header: "vtkStatisticsAlgorithm.h".}
proc IsA*(this: var vtkStatisticsAlgorithm; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkStatisticsAlgorithm.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkStatisticsAlgorithm {.
    importcpp: "vtkStatisticsAlgorithm::SafeDownCast(@)",
    header: "vtkStatisticsAlgorithm.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkStatisticsAlgorithm :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTableAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkStatisticsAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkStatisticsAlgorithm :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkStatisticsAlgorithm; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkStatisticsAlgorithm.h".}
type
  vtkStatisticsAlgorithmInputPorts* {.size: sizeof(cint), importcpp: "vtkStatisticsAlgorithm::InputPorts",
                                     header: "vtkStatisticsAlgorithm.h".} = enum
    INPUT_DATA = 0,             ## !< Port 0 is for learn data
    LEARN_PARAMETERS = 1,       ## !< Port 1 is for learn parameters (initial guesses, etc.)
    INPUT_MODEL = 2


type
  vtkStatisticsAlgorithmOutputIndices* {.size: sizeof(cint), importcpp: "vtkStatisticsAlgorithm::OutputIndices",
                                        header: "vtkStatisticsAlgorithm.h".} = enum
    OUTPUT_DATA = 0,            ## !< Output 0 mirrors the input data, plus optional assessment columns
    OUTPUT_MODEL = 1,           ## !< Output 1 contains any generated model
    OUTPUT_TEST = 2


proc SetLearnOptionParameterConnection*(this: var vtkStatisticsAlgorithm;
                                       params: ptr vtkAlgorithmOutput) {.
    importcpp: "SetLearnOptionParameterConnection",
    header: "vtkStatisticsAlgorithm.h".}
proc SetLearnOptionParameters*(this: var vtkStatisticsAlgorithm;
                              params: ptr vtkDataObject) {.
    importcpp: "SetLearnOptionParameters", header: "vtkStatisticsAlgorithm.h".}
proc SetInputModelConnection*(this: var vtkStatisticsAlgorithm;
                             model: ptr vtkAlgorithmOutput) {.
    importcpp: "SetInputModelConnection", header: "vtkStatisticsAlgorithm.h".}
proc SetInputModel*(this: var vtkStatisticsAlgorithm; model: ptr vtkDataObject) {.
    importcpp: "SetInputModel", header: "vtkStatisticsAlgorithm.h".}
proc SetLearnOption*(this: var vtkStatisticsAlgorithm; _arg: bool) {.
    importcpp: "SetLearnOption", header: "vtkStatisticsAlgorithm.h".}
## !!!Ignored construct:  virtual bool GetLearnOption ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LearnOption  of  << this -> LearnOption ) ; return this -> LearnOption ; } ;
## Error: expected ';'!!!

proc SetLearnOptionDeriveOption*(this: var vtkStatisticsAlgorithm; _arg: bool) {.
    importcpp: "SetLearnOptionDeriveOption", header: "vtkStatisticsAlgorithm.h".}
## !!!Ignored construct:  virtual bool GetLearnOptionDeriveOption ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DeriveOption  of  << this -> DeriveOption ) ; return this -> DeriveOption ; } ;
## Error: expected ';'!!!

proc SetLearnOptionDeriveOptionAssessOption*(this: var vtkStatisticsAlgorithm;
    _arg: bool) {.importcpp: "SetLearnOptionDeriveOptionAssessOption",
                header: "vtkStatisticsAlgorithm.h".}
## !!!Ignored construct:  virtual bool GetLearnOptionDeriveOptionAssessOption ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AssessOption  of  << this -> AssessOption ) ; return this -> AssessOption ; } ;
## Error: expected ';'!!!

proc SetLearnOptionDeriveOptionAssessOptionTestOption*(
    this: var vtkStatisticsAlgorithm; _arg: bool) {.
    importcpp: "SetLearnOptionDeriveOptionAssessOptionTestOption",
    header: "vtkStatisticsAlgorithm.h".}
## !!!Ignored construct:  virtual bool GetLearnOptionDeriveOptionAssessOptionTestOption ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TestOption  of  << this -> TestOption ) ; return this -> TestOption ; } ;
## Error: expected ';'!!!

proc SetLearnOptionDeriveOptionAssessOptionTestOptionNumberOfPrimaryTables*(
    this: var vtkStatisticsAlgorithm; _arg: vtkIdType) {.importcpp: "SetLearnOptionDeriveOptionAssessOptionTestOptionNumberOfPrimaryTables",
    header: "vtkStatisticsAlgorithm.h".}
## !!!Ignored construct:  virtual vtkIdType GetLearnOptionDeriveOptionAssessOptionTestOptionNumberOfPrimaryTables ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfPrimaryTables  of  << this -> NumberOfPrimaryTables ) ; return this -> NumberOfPrimaryTables ; } ;
## Error: expected ';'!!!

proc SetAssessNames*(this: var vtkStatisticsAlgorithm; a2: ptr vtkStringArray) {.
    importcpp: "SetAssessNames", header: "vtkStatisticsAlgorithm.h".}
proc GetnameAssessNames*(this: var vtkStatisticsAlgorithm): ptr vtkStringArray {.
    importcpp: "GetnameAssessNames", header: "vtkStatisticsAlgorithm.h".}
  ## /@}
  ## /@{
  ## *
  ##  A base class for a functor that assesses data.
  ##
type
  vtkStatisticsAlgorithmAssessFunctor* {.importcpp: "vtkStatisticsAlgorithm::AssessFunctor",
                                        header: "vtkStatisticsAlgorithm.h", bycopy.} = object


proc `()`*(this: var vtkStatisticsAlgorithmAssessFunctor; a2: ptr vtkDoubleArray;
          a3: vtkIdType) {.importcpp: "#(@)", header: "vtkStatisticsAlgorithm.h".}
proc destroyvtkStatisticsAlgorithmAssessFunctor*(
    this: var vtkStatisticsAlgorithmAssessFunctor) {.
    importcpp: "#.~AssessFunctor()", header: "vtkStatisticsAlgorithm.h".}
proc SetColumnStatus*(this: var vtkStatisticsAlgorithm; namCol: cstring; status: cint) {.
    importcpp: "SetColumnStatus", header: "vtkStatisticsAlgorithm.h".}
proc ResetAllColumnStates*(this: var vtkStatisticsAlgorithm) {.
    importcpp: "ResetAllColumnStates", header: "vtkStatisticsAlgorithm.h".}
proc RequestSelectedColumns*(this: var vtkStatisticsAlgorithm): cint {.
    importcpp: "RequestSelectedColumns", header: "vtkStatisticsAlgorithm.h".}
proc ResetRequests*(this: var vtkStatisticsAlgorithm) {.importcpp: "ResetRequests",
    header: "vtkStatisticsAlgorithm.h".}
proc GetNumberOfRequests*(this: var vtkStatisticsAlgorithm): vtkIdType {.
    importcpp: "GetNumberOfRequests", header: "vtkStatisticsAlgorithm.h".}
proc GetNumberOfColumnsForRequest*(this: var vtkStatisticsAlgorithm;
                                  request: vtkIdType): vtkIdType {.
    importcpp: "GetNumberOfColumnsForRequest", header: "vtkStatisticsAlgorithm.h".}
proc GetColumnForRequest*(this: var vtkStatisticsAlgorithm; r: vtkIdType; c: vtkIdType): cstring {.
    importcpp: "GetColumnForRequest", header: "vtkStatisticsAlgorithm.h".}
proc GetColumnForRequest*(this: var vtkStatisticsAlgorithm; r: vtkIdType;
                         c: vtkIdType; columnName: var vtkStdString): cint {.
    importcpp: "GetColumnForRequest", header: "vtkStatisticsAlgorithm.h".}
proc AddColumn*(this: var vtkStatisticsAlgorithm; namCol: cstring) {.
    importcpp: "AddColumn", header: "vtkStatisticsAlgorithm.h".}
proc AddColumnPair*(this: var vtkStatisticsAlgorithm; namColX: cstring;
                   namColY: cstring) {.importcpp: "AddColumnPair",
                                     header: "vtkStatisticsAlgorithm.h".}
proc SetParameter*(this: var vtkStatisticsAlgorithm; parameter: cstring; index: cint;
                  value: vtkVariant): bool {.importcpp: "SetParameter",
    header: "vtkStatisticsAlgorithm.h".}
proc Aggregate*(this: var vtkStatisticsAlgorithm; a2: ptr vtkDataObjectCollection;
               a3: ptr vtkMultiBlockDataSet) {.importcpp: "Aggregate",
    header: "vtkStatisticsAlgorithm.h".}