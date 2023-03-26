## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCellDataToPointData.h
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
##  @class   vtkCellDataToPointData
##  @brief   map cell data to point data
##
##  vtkCellDataToPointData is a filter that transforms cell data (i.e., data
##  specified per cell) into point data (i.e., data specified at cell
##  points). The method of transformation is based on averaging the data
##  values of all cells using each point. For large datasets with
##  several cell data arrays, the filter optionally supports selective
##  processing to speed up processing. Optionally, the input cell data can
##  be passed through to the output as well.
##
##  Options exist to control which cells are used to perform the averaging
##  operation. Since unstructured grids and polydata can contain cells of
##  different dimensions, in some cases it is desirable to perform cell
##  averaging using cells of a specified dimension. The available options to
##  control this functionality are All (default), Patch and DataSetMax. Patch
##  uses only the highest dimension cells attached to a point. DataSetMax uses
##  the highest cell dimension in the entire data set.
##
##  @warning
##  This filter is an abstract filter, that is, the output is an abstract type
##  (i.e., vtkDataSet). Use the convenience methods (e.g.,
##  GetPolyDataOutput(), GetStructuredPointsOutput(), etc.) to get the type
##  of output you want.
##
##  @warning
##  For maximum performance, use the ContributingCellOption=All. Other options
##  significantly, negatively impact performance (on the order of >10x).
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential execution type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @sa
##  vtkPointData vtkCellData vtkPointDataToCellData
##

import
  vtkDataSetAlgorithm, vtkFiltersCoreModule

discard "forward decl of vtkDataSet"
type
  vtkCellDataToPointData* {.importcpp: "vtkCellDataToPointData",
                           header: "vtkCellDataToPointData.h", bycopy.} = object of vtkDataSetAlgorithm ## /@{
                                                                                                 ## *
                                                                                                 ##  Standard methods for instantiation, type information, and printing.
                                                                                                 ##
    vtkCellDataToPointData* {.importc: "vtkCellDataToPointData".}: VTK_NEWINSTANCE
    ## /@}
    ## /@{
    ## *
    ##  Option to specify what cells to include in the computation.
    ##  Options are all cells (All, Patch and DataSet). The default is All.
    ##
    ## /@}
    ## *
    ##  Option to activate selective processing of arrays.
    ##


proc New*(): ptr vtkCellDataToPointData {.importcpp: "vtkCellDataToPointData::New(@)",
                                      header: "vtkCellDataToPointData.h".}
type
  vtkCellDataToPointDataSuperclass* = vtkDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCellDataToPointData::IsTypeOf(@)",
    header: "vtkCellDataToPointData.h".}
proc IsA*(this: var vtkCellDataToPointData; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkCellDataToPointData.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCellDataToPointData {.
    importcpp: "vtkCellDataToPointData::SafeDownCast(@)",
    header: "vtkCellDataToPointData.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCellDataToPointData :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCellDataToPointData :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCellDataToPointData :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCellDataToPointData; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCellDataToPointData.h".}
type
  vtkCellDataToPointDataContributingCellEnum* {.size: sizeof(cint),
      importcpp: "vtkCellDataToPointData::ContributingCellEnum",
      header: "vtkCellDataToPointData.h".} = enum
    All = 0,                    ## !< All cells
    Patch = 1,                  ## !< Highest dimension cells in the patch of cells contributing to the calculation
    DataSetMax = 2


proc SetPassCellData*(this: var vtkCellDataToPointData; _arg: bool) {.
    importcpp: "SetPassCellData", header: "vtkCellDataToPointData.h".}
## !!!Ignored construct:  virtual bool GetPassCellData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassCellData  of  << this -> PassCellData ) ; return this -> PassCellData ; } ;
## Error: expected ';'!!!

proc PassCellDataOn*(this: var vtkCellDataToPointData) {.
    importcpp: "PassCellDataOn", header: "vtkCellDataToPointData.h".}
proc PassCellDataOff*(this: var vtkCellDataToPointData) {.
    importcpp: "PassCellDataOff", header: "vtkCellDataToPointData.h".}
  ## /@}
  ## /@{
  ## *
  ##  Option to specify what cells to include in the cell-averaging computation.
  ##  Options are all cells (All, Patch and DataSetMax). The default is All.
  ##
proc SetContributingCellOption*(this: var vtkCellDataToPointData; _arg: cint) {.
    importcpp: "SetContributingCellOption", header: "vtkCellDataToPointData.h".}
proc GetContributingCellOptionMinValue*(this: var vtkCellDataToPointData): cint {.
    importcpp: "GetContributingCellOptionMinValue",
    header: "vtkCellDataToPointData.h".}
proc GetContributingCellOptionMaxValue*(this: var vtkCellDataToPointData): cint {.
    importcpp: "GetContributingCellOptionMaxValue",
    header: "vtkCellDataToPointData.h".}
## !!!Ignored construct:  virtual int GetPassCellDataContributingCellOption ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ContributingCellOption  of  << this -> ContributingCellOption ) ; return this -> ContributingCellOption ; } ;
## Error: expected ';'!!!

proc SetPassCellDataProcessAllArrays*(this: var vtkCellDataToPointData; _arg: bool) {.
    importcpp: "SetPassCellDataProcessAllArrays",
    header: "vtkCellDataToPointData.h".}
## !!!Ignored construct:  virtual bool GetPassCellDataContributingCellOptionProcessAllArrays ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProcessAllArrays  of  << this -> ProcessAllArrays ) ; return this -> ProcessAllArrays ; } ;
## Error: expected ';'!!!

proc ProcessAllArraysOn*(this: var vtkCellDataToPointData) {.
    importcpp: "ProcessAllArraysOn", header: "vtkCellDataToPointData.h".}
proc ProcessAllArraysOff*(this: var vtkCellDataToPointData) {.
    importcpp: "ProcessAllArraysOff", header: "vtkCellDataToPointData.h".}
  ## /@}
  ## *
  ##  Adds an array to be processed. This only has an effect if the
  ##  ProcessAllArrays option is turned off. If a name is already present,
  ##  nothing happens.
  ##
proc AddCellDataArray*(this: var vtkCellDataToPointData; name: cstring) {.
    importcpp: "AddCellDataArray", header: "vtkCellDataToPointData.h".}
proc RemoveCellDataArray*(this: var vtkCellDataToPointData; name: cstring) {.
    importcpp: "RemoveCellDataArray", header: "vtkCellDataToPointData.h".}
proc ClearCellDataArrays*(this: var vtkCellDataToPointData) {.
    importcpp: "ClearCellDataArrays", header: "vtkCellDataToPointData.h".}