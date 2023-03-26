## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAggregateDataSetFilter.h
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
##  @class   vtkAggregateDataSetFilter
##  @brief   Aggregates data sets to a reduced number of processes.
##
##  This class allows polydata and unstructured grids to be aggregated
##  over a smaller set of processes. The derived vtkDIYAggregateDataSetFilter
##  will operate on image data, rectilinear grids and structured grids.
##

import
  vtkFiltersParallelModule, vtkPassInputTypeAlgorithm

discard "forward decl of vtkDataSet"
discard "forward decl of vtkMultiProcessController"
type
  vtkAggregateDataSetFilter* {.importcpp: "vtkAggregateDataSetFilter",
                              header: "vtkAggregateDataSetFilter.h", bycopy.} = object of vtkPassInputTypeAlgorithm
    vtkAggregateDataSetFilter* {.importc: "vtkAggregateDataSetFilter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkAggregateDataSetFilter {.
    importcpp: "vtkAggregateDataSetFilter::New(@)",
    header: "vtkAggregateDataSetFilter.h".}
type
  vtkAggregateDataSetFilterSuperclass* = vtkPassInputTypeAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAggregateDataSetFilter::IsTypeOf(@)",
    header: "vtkAggregateDataSetFilter.h".}
proc IsA*(this: var vtkAggregateDataSetFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkAggregateDataSetFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAggregateDataSetFilter {.
    importcpp: "vtkAggregateDataSetFilter::SafeDownCast(@)",
    header: "vtkAggregateDataSetFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAggregateDataSetFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPassInputTypeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAggregateDataSetFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAggregateDataSetFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAggregateDataSetFilter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkAggregateDataSetFilter.h".}
proc SetNumberOfTargetProcesses*(this: var vtkAggregateDataSetFilter; a2: cint) {.
    importcpp: "SetNumberOfTargetProcesses", header: "vtkAggregateDataSetFilter.h".}
## !!!Ignored construct:  virtual int GetNumberOfTargetProcesses ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfTargetProcesses  of  << this -> NumberOfTargetProcesses ) ; return this -> NumberOfTargetProcesses ; } ;
## Error: expected ';'!!!

proc SetMergePoints*(this: var vtkAggregateDataSetFilter; _arg: bool) {.
    importcpp: "SetMergePoints", header: "vtkAggregateDataSetFilter.h".}
## !!!Ignored construct:  virtual bool GetNumberOfTargetProcessesMergePoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MergePoints  of  << this -> MergePoints ) ; return this -> MergePoints ; } ;
## Error: expected ';'!!!

proc MergePointsOn*(this: var vtkAggregateDataSetFilter) {.
    importcpp: "MergePointsOn", header: "vtkAggregateDataSetFilter.h".}
proc MergePointsOff*(this: var vtkAggregateDataSetFilter) {.
    importcpp: "MergePointsOff", header: "vtkAggregateDataSetFilter.h".}
  ## /@}