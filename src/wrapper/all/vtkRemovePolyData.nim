## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRemovePolyData.h
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
##  @class   vtkRemovePolyData
##  @brief   Removes vtkPolyData cells from an input vtkPolyData
##
##  vtkRemovePolyData is a filter that removes cells from an input vtkPolyData
##  (defined in the first input #0), and produces an output vtkPolyData (which
##  may be empty).  The cells to remove are specified in the following ways:
##  1) a list of cell ids can be provided; 2) a list of point ids can be
##  provided - any cell using one or more of the points indicated is removed;
##  and 3) one or more additional vtkPolyData inputs can be provided -
##  matching cells are deleted. These three methods can be used in combination
##  if desired. Point and cell attribute data associated with the remaining
##  cells are copied to the output.
##
##  @warning
##  The filter vtkAppendPolyData enables appending multiple input
##  vtkPolyData's together. So vtkAppendPolyData functions as an
##  approximate inverse operation to vtkRemovePolyData.
##
##  @warning
##  The output point type is the same as the (first) input point type.
##
##  @sa
##  vtkAppendPolyData
##

import
  vtkFiltersGeneralModule, vtkPolyDataAlgorithm

discard "forward decl of vtkCellArray"
discard "forward decl of vtkDataArray"
discard "forward decl of vtkPoints"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkIdTypeArray"
type
  vtkRemovePolyData* {.importcpp: "vtkRemovePolyData",
                      header: "vtkRemovePolyData.h", bycopy.} = object of vtkPolyDataAlgorithm ## /@{
                                                                                        ## *
                                                                                        ##  Standard methods to instantiate, obtain information, and print information.
                                                                                        ##
                                                                                        ##
    vtkRemovePolyData* {.importc: "vtkRemovePolyData".}: VTK_NEWINSTANCE


proc New*(): ptr vtkRemovePolyData {.importcpp: "vtkRemovePolyData::New(@)",
                                 header: "vtkRemovePolyData.h".}
type
  vtkRemovePolyDataSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkRemovePolyData::IsTypeOf(@)", header: "vtkRemovePolyData.h".}
proc IsA*(this: var vtkRemovePolyData; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkRemovePolyData.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkRemovePolyData {.
    importcpp: "vtkRemovePolyData::SafeDownCast(@)", header: "vtkRemovePolyData.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkRemovePolyData :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRemovePolyData :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRemovePolyData :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkRemovePolyData; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkRemovePolyData.h".}
proc RemoveInputData*(this: var vtkRemovePolyData; a2: ptr vtkPolyData) {.
    importcpp: "RemoveInputData", header: "vtkRemovePolyData.h".}
proc GetInput*(this: var vtkRemovePolyData; idx: cint): ptr vtkPolyData {.
    importcpp: "GetInput", header: "vtkRemovePolyData.h".}
proc GetInput*(this: var vtkRemovePolyData): ptr vtkPolyData {.importcpp: "GetInput",
    header: "vtkRemovePolyData.h".}
proc SetCellIds*(this: var vtkRemovePolyData; a2: ptr vtkIdTypeArray) {.
    importcpp: "SetCellIds", header: "vtkRemovePolyData.h".}
proc GetnameCellIds*(this: var vtkRemovePolyData): ptr vtkIdTypeArray {.
    importcpp: "GetnameCellIds", header: "vtkRemovePolyData.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the list of points ids to delete. Any cells using any of the
  ##  points listed are removed.
  ##
proc SetPointIds*(this: var vtkRemovePolyData; a2: ptr vtkIdTypeArray) {.
    importcpp: "SetPointIds", header: "vtkRemovePolyData.h".}
proc GetnameCellIdsPointIds*(this: var vtkRemovePolyData): ptr vtkIdTypeArray {.
    importcpp: "GetnameCellIdsPointIds", header: "vtkRemovePolyData.h".}
  ## /@}
  ## /@{
  ## *
  ##  ExactMatch controls how the matching of cells when additional input
  ##  vtkPolyDatas are provided. When ExactMatch is enabled, then if any
  ##  input0 cell Ci uses all of the point ids in cells specified in inputs
  ##  [1,N) Cn, and the number of point ids in Ci == Cn, then a match occurs
  ##  and the cell is marked for deletion. Without ExactMatch enabled, if Ci
  ##  uses all of the points in Cn, even though the cell connectivity list
  ##  sizes are not the same size, a match occurs. This can be used to perform
  ##  tricks like marking all of the cells that use a point or edge to be
  ##  deleted. ExactMatch is disabled by default since it takes a extra
  ##  computation time.
  ##
proc SetExactMatch*(this: var vtkRemovePolyData; _arg: bool) {.
    importcpp: "SetExactMatch", header: "vtkRemovePolyData.h".}
## !!!Ignored construct:  virtual bool GetExactMatch ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ExactMatch  of  << this -> ExactMatch ) ; return this -> ExactMatch ; } ;
## Error: expected ';'!!!

proc ExactMatchOn*(this: var vtkRemovePolyData) {.importcpp: "ExactMatchOn",
    header: "vtkRemovePolyData.h".}
proc ExactMatchOff*(this: var vtkRemovePolyData) {.importcpp: "ExactMatchOff",
    header: "vtkRemovePolyData.h".}
  ## /@}