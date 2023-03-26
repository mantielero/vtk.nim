## =========================================================================
##
## Program:   Visualization Toolkit
## Module:    vtkBivariateLinearTableThreshold.h
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
##   Copyright 2009 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkBivariateLinearTableThreshold
##  @brief   performs line-based thresholding
##  for vtkTable data.
##
##
##  Class for filtering the rows of a two numeric columns of a vtkTable.  The
##  columns are treated as the two variables of a line.  This filter will
##  then iterate through the rows of the table determining if X,Y values pairs
##  are above/below/between/near one or more lines.
##
##  The "between" mode checks to see if a row is contained within the convex
##  hull of all of the specified lines.  The "near" mode checks if a row is
##  within a distance threshold two one of the specified lines.  This class
##  is used in conjunction with various plotting classes, so it is useful
##  to rescale the X,Y axes to a particular range of values.  Distance
##  comparisons can be performed in the scaled space by setting the CustomRanges
##  ivar and enabling UseNormalizedDistance.
##

import
  vtkFiltersStatisticsModule, vtkSmartPointer, vtkTableAlgorithm

discard "forward decl of vtkDataArrayCollection"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkTable"
type
  vtkBivariateLinearTableThreshold* {.importcpp: "vtkBivariateLinearTableThreshold", header: "vtkBivariateLinearTableThreshold.h",
                                     bycopy.} = object of vtkTableAlgorithm
    vtkBivariateLinearTableThreshold* {.importc: "vtkBivariateLinearTableThreshold".}: VTK_NEWINSTANCE


proc New*(): ptr vtkBivariateLinearTableThreshold {.
    importcpp: "vtkBivariateLinearTableThreshold::New(@)",
    header: "vtkBivariateLinearTableThreshold.h".}
type
  vtkBivariateLinearTableThresholdSuperclass* = vtkTableAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkBivariateLinearTableThreshold::IsTypeOf(@)",
    header: "vtkBivariateLinearTableThreshold.h".}
proc IsA*(this: var vtkBivariateLinearTableThreshold; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkBivariateLinearTableThreshold.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBivariateLinearTableThreshold {.
    importcpp: "vtkBivariateLinearTableThreshold::SafeDownCast(@)",
    header: "vtkBivariateLinearTableThreshold.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBivariateLinearTableThreshold :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTableAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBivariateLinearTableThreshold :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBivariateLinearTableThreshold :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkBivariateLinearTableThreshold; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkBivariateLinearTableThreshold.h".}
proc SetInclusive*(this: var vtkBivariateLinearTableThreshold; _arg: cint) {.
    importcpp: "SetInclusive", header: "vtkBivariateLinearTableThreshold.h".}
## !!!Ignored construct:  virtual int GetInclusive ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Inclusive  of  << this -> Inclusive ) ; return this -> Inclusive ; } ;
## Error: expected ';'!!!

proc AddColumnToThreshold*(this: var vtkBivariateLinearTableThreshold;
                          column: vtkIdType; component: vtkIdType) {.
    importcpp: "AddColumnToThreshold",
    header: "vtkBivariateLinearTableThreshold.h".}
proc GetNumberOfColumnsToThreshold*(this: var vtkBivariateLinearTableThreshold): cint {.
    importcpp: "GetNumberOfColumnsToThreshold",
    header: "vtkBivariateLinearTableThreshold.h".}
proc GetColumnToThreshold*(this: var vtkBivariateLinearTableThreshold;
                          idx: vtkIdType; column: var vtkIdType;
                          component: var vtkIdType) {.
    importcpp: "GetColumnToThreshold",
    header: "vtkBivariateLinearTableThreshold.h".}
proc ClearColumnsToThreshold*(this: var vtkBivariateLinearTableThreshold) {.
    importcpp: "ClearColumnsToThreshold",
    header: "vtkBivariateLinearTableThreshold.h".}
proc GetSelectedRowIds*(this: var vtkBivariateLinearTableThreshold;
                       selection: cint = 0): ptr vtkIdTypeArray {.
    importcpp: "GetSelectedRowIds", header: "vtkBivariateLinearTableThreshold.h".}
type
  vtkBivariateLinearTableThresholdOutputPorts* {.size: sizeof(cint),
      importcpp: "vtkBivariateLinearTableThreshold::OutputPorts",
      header: "vtkBivariateLinearTableThreshold.h".} = enum
    OUTPUT_ROW_IDS = 0, OUTPUT_ROW_DATA


type
  vtkBivariateLinearTableThresholdLinearThresholdType* {.size: sizeof(cint),
      importcpp: "vtkBivariateLinearTableThreshold::LinearThresholdType",
      header: "vtkBivariateLinearTableThreshold.h".} = enum
    BLT_ABOVE = 0, BLT_BELOW, BLT_NEAR, BLT_BETWEEN


proc Initialize*(this: var vtkBivariateLinearTableThreshold) {.
    importcpp: "Initialize", header: "vtkBivariateLinearTableThreshold.h".}
proc AddLineEquation*(this: var vtkBivariateLinearTableThreshold; p1: ptr cdouble;
                     p2: ptr cdouble) {.importcpp: "AddLineEquation", header: "vtkBivariateLinearTableThreshold.h".}
proc AddLineEquation*(this: var vtkBivariateLinearTableThreshold; p: ptr cdouble;
                     slope: cdouble) {.importcpp: "AddLineEquation", header: "vtkBivariateLinearTableThreshold.h".}
proc AddLineEquation*(this: var vtkBivariateLinearTableThreshold; a: cdouble;
                     b: cdouble; c: cdouble) {.importcpp: "AddLineEquation",
    header: "vtkBivariateLinearTableThreshold.h".}
proc ClearLineEquations*(this: var vtkBivariateLinearTableThreshold) {.
    importcpp: "ClearLineEquations", header: "vtkBivariateLinearTableThreshold.h".}
## !!!Ignored construct:  /@{ *
##  Set the threshold type.  Above: find all rows that are above the specified
##  lines.  Below: find all rows that are below the specified lines.  Near:
##  find all rows that are near the specified lines.  Between: find all rows
##  that are between the specified lines.
##  virtual int GetInclusiveLinearThresholdTypeLinearThresholdType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LinearThresholdType  of  << this -> LinearThresholdType ) ; return this -> LinearThresholdType ; } ;
## Error: expected ';'!!!

proc SetInclusiveLinearThresholdType*(this: var vtkBivariateLinearTableThreshold;
                                     _arg: cint) {.
    importcpp: "SetInclusiveLinearThresholdType",
    header: "vtkBivariateLinearTableThreshold.h".}
proc SetLinearThresholdTypeToAbove*(this: var vtkBivariateLinearTableThreshold) {.
    importcpp: "SetLinearThresholdTypeToAbove",
    header: "vtkBivariateLinearTableThreshold.h".}
proc SetLinearThresholdTypeToBelow*(this: var vtkBivariateLinearTableThreshold) {.
    importcpp: "SetLinearThresholdTypeToBelow",
    header: "vtkBivariateLinearTableThreshold.h".}
proc SetLinearThresholdTypeToNear*(this: var vtkBivariateLinearTableThreshold) {.
    importcpp: "SetLinearThresholdTypeToNear",
    header: "vtkBivariateLinearTableThreshold.h".}
proc SetLinearThresholdTypeToBetween*(this: var vtkBivariateLinearTableThreshold) {.
    importcpp: "SetLinearThresholdTypeToBetween",
    header: "vtkBivariateLinearTableThreshold.h".}
proc SetColumnRanges*(this: var vtkBivariateLinearTableThreshold; _arg1: cdouble;
                     _arg2: cdouble) {.importcpp: "SetColumnRanges", header: "vtkBivariateLinearTableThreshold.h".}
proc SetColumnRanges*(this: var vtkBivariateLinearTableThreshold;
                     _arg: array[2, cdouble]) {.importcpp: "SetColumnRanges",
    header: "vtkBivariateLinearTableThreshold.h".}
## !!!Ignored construct:  virtual double * GetColumnRanges ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ColumnRanges  pointer  << this -> ColumnRanges ) ; return this -> ColumnRanges ; } VTK_WRAPEXCLUDE virtual void GetColumnRanges ( double & _arg1 , double & _arg2 ) { _arg1 = this -> ColumnRanges [ 0 ] ; _arg2 = this -> ColumnRanges [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ColumnRanges  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetColumnRanges ( double _arg [ 2 ] ) { this -> GetColumnRanges ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetInclusiveLinearThresholdTypeDistanceThreshold*(
    this: var vtkBivariateLinearTableThreshold; _arg: cdouble) {.
    importcpp: "SetInclusiveLinearThresholdTypeDistanceThreshold",
    header: "vtkBivariateLinearTableThreshold.h".}
## !!!Ignored construct:  virtual double GetInclusiveLinearThresholdTypeLinearThresholdTypeDistanceThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DistanceThreshold  of  << this -> DistanceThreshold ) ; return this -> DistanceThreshold ; } ;
## Error: expected ';'!!!

proc SetInclusiveLinearThresholdTypeDistanceThresholdUseNormalizedDistance*(
    this: var vtkBivariateLinearTableThreshold; _arg: vtkTypeBool) {.importcpp: "SetInclusiveLinearThresholdTypeDistanceThresholdUseNormalizedDistance",
    header: "vtkBivariateLinearTableThreshold.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetInclusiveLinearThresholdTypeLinearThresholdTypeDistanceThresholdUseNormalizedDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseNormalizedDistance  of  << this -> UseNormalizedDistance ) ; return this -> UseNormalizedDistance ; } ;
## Error: expected ';'!!!

proc UseNormalizedDistanceOn*(this: var vtkBivariateLinearTableThreshold) {.
    importcpp: "UseNormalizedDistanceOn",
    header: "vtkBivariateLinearTableThreshold.h".}
proc UseNormalizedDistanceOff*(this: var vtkBivariateLinearTableThreshold) {.
    importcpp: "UseNormalizedDistanceOff",
    header: "vtkBivariateLinearTableThreshold.h".}
  ## /@}
  ## *
  ##  Convert the two-point line formula to implicit form.
  ##
proc ComputeImplicitLineFunction*(p1: ptr cdouble; p2: ptr cdouble; abc: ptr cdouble) {.importcpp: "vtkBivariateLinearTableThreshold::ComputeImplicitLineFunction(@)",
    header: "vtkBivariateLinearTableThreshold.h".}
proc ComputeImplicitLineFunction*(p: ptr cdouble; slope: cdouble; abc: ptr cdouble) {.importcpp: "vtkBivariateLinearTableThreshold::ComputeImplicitLineFunction(@)",
    header: "vtkBivariateLinearTableThreshold.h".}