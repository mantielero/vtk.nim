## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkClosestPointStrategy.h
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
##  @class   vtkClosestPointStrategy
##  @brief   implement a specific vtkPointSet::FindCell() strategy based
##           on closest point
##
##  vtkClosestPointStrategy is implements a FindCell() strategy based on
##  locating the closest point in a dataset, and then searching the attached
##  cells. While relatively fast, it does not always return the correct result
##  (it may not find a cell, since the closest cell may not be connected to the
##  closest point). vtkCellLocatorStrategy or vtkClosestNPointsStrategy will
##  produce better results at the cost of speed.
##
##  @sa
##  vtkFindCellStrategy vtkPointSet vtkCellLocatorStrategy
##  vtkClosestNPointsStrategy
##

import
  vtkCell, vtkCommonDataModelModule, vtkFindCellStrategy, vtkGenericCell,
  vtkPointSet

discard "forward decl of vtkIdList"
discard "forward decl of vtkAbstractPointLocator"
type
  vtkClosestPointStrategy* {.importcpp: "vtkClosestPointStrategy",
                            header: "vtkClosestPointStrategy.h", bycopy.} = object of vtkFindCellStrategy ## *
                                                                                                   ##  Construct a vtkFindCellStrategy subclass.
                                                                                                   ##
    vtkClosestPointStrategy* {.importc: "vtkClosestPointStrategy".}: VTK_NEWINSTANCE
    ##  boolean array to track visited cells
    ##  list of visited cell ids to reset boolean array


proc New*(): ptr vtkClosestPointStrategy {.importcpp: "vtkClosestPointStrategy::New(@)",
                                       header: "vtkClosestPointStrategy.h".}
type
  vtkClosestPointStrategySuperclass* = vtkFindCellStrategy

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkClosestPointStrategy::IsTypeOf(@)",
    header: "vtkClosestPointStrategy.h".}
proc IsA*(this: var vtkClosestPointStrategy; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkClosestPointStrategy.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkClosestPointStrategy {.
    importcpp: "vtkClosestPointStrategy::SafeDownCast(@)",
    header: "vtkClosestPointStrategy.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkClosestPointStrategy :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkFindCellStrategy :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkClosestPointStrategy :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkClosestPointStrategy :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkClosestPointStrategy; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkClosestPointStrategy.h".}
proc Initialize*(this: var vtkClosestPointStrategy; ps: ptr vtkPointSet): cint {.
    importcpp: "Initialize", header: "vtkClosestPointStrategy.h".}
proc FindCell*(this: var vtkClosestPointStrategy; x: array[3, cdouble];
              cell: ptr vtkCell; gencell: ptr vtkGenericCell; cellId: vtkIdType;
              tol2: cdouble; subId: var cint; pcoords: array[3, cdouble];
              weights: ptr cdouble): vtkIdType {.importcpp: "FindCell",
    header: "vtkClosestPointStrategy.h".}
proc FindClosestPointWithinRadius*(this: var vtkClosestPointStrategy;
                                  x: array[3, cdouble]; radius: cdouble;
                                  closestPoint: array[3, cdouble];
                                  cell: ptr vtkGenericCell; cellId: var vtkIdType;
                                  subId: var cint; dist2: var cdouble;
                                  inside: var cint): vtkIdType {.
    importcpp: "FindClosestPointWithinRadius", header: "vtkClosestPointStrategy.h".}
proc InsideCellBounds*(this: var vtkClosestPointStrategy; x: array[3, cdouble];
                      cellId: vtkIdType): bool {.importcpp: "InsideCellBounds",
    header: "vtkClosestPointStrategy.h".}
proc SetPointLocator*(this: var vtkClosestPointStrategy;
                     a2: ptr vtkAbstractPointLocator) {.
    importcpp: "SetPointLocator", header: "vtkClosestPointStrategy.h".}
proc GetnamePointLocator*(this: var vtkClosestPointStrategy): ptr vtkAbstractPointLocator {.
    importcpp: "GetnamePointLocator", header: "vtkClosestPointStrategy.h".}
  ## /@}
  ## *
  ##  Subclasses use this method to select the current cell.
  ##
proc SelectCell*(this: var vtkClosestPointStrategy; self: ptr vtkPointSet;
                cellId: vtkIdType; cell: ptr vtkCell; gencell: ptr vtkGenericCell): ptr vtkCell {.
    importcpp: "SelectCell", header: "vtkClosestPointStrategy.h".}
proc CopyParameters*(this: var vtkClosestPointStrategy;
                    `from`: ptr vtkFindCellStrategy) {.importcpp: "CopyParameters",
    header: "vtkClosestPointStrategy.h".}
##  Handle cases where starting cell is provided or not

proc SelectCell*(this: var vtkClosestPointStrategy; self: ptr vtkPointSet;
                cellId: vtkIdType; cell: ptr vtkCell; gencell: ptr vtkGenericCell): ptr vtkCell {.
    importcpp: "SelectCell", header: "vtkClosestPointStrategy.h".}