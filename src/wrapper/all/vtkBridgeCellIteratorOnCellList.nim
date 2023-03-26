## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBridgeCellIteratorOnCellList.h
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
##  @class   vtkBridgeCellIteratorOnCellList
##  @brief   Iterate over a list of cells defined
##  on a dataset.
##  See InitWithCells().
##  @sa
##  vtkBridgeCellIterator, vtkBridgeDataSet, vtkBridgeCellIteratorStrategy
##

import
  vtkBridgeCellIteratorStrategy

discard "forward decl of vtkBridgeCell"
discard "forward decl of vtkIdList"
discard "forward decl of vtkBridgeDataSet"
type
  vtkBridgeCellIteratorOnCellList* {.importcpp: "vtkBridgeCellIteratorOnCellList", header: "vtkBridgeCellIteratorOnCellList.h",
                                    bycopy.} = object of vtkBridgeCellIteratorStrategy
    vtkBridgeCellIteratorOnCellList* {.importc: "vtkBridgeCellIteratorOnCellList".}: VTK_NEWINSTANCE
    ##  cells traversed by the iterator.
    ##  the id at current position.
    ##  cell at current position.


proc New*(): ptr vtkBridgeCellIteratorOnCellList {.
    importcpp: "vtkBridgeCellIteratorOnCellList::New(@)",
    header: "vtkBridgeCellIteratorOnCellList.h".}
type
  vtkBridgeCellIteratorOnCellListSuperclass* = vtkBridgeCellIteratorStrategy

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkBridgeCellIteratorOnCellList::IsTypeOf(@)",
    header: "vtkBridgeCellIteratorOnCellList.h".}
proc IsA*(this: var vtkBridgeCellIteratorOnCellList; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkBridgeCellIteratorOnCellList.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBridgeCellIteratorOnCellList {.
    importcpp: "vtkBridgeCellIteratorOnCellList::SafeDownCast(@)",
    header: "vtkBridgeCellIteratorOnCellList.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBridgeCellIteratorOnCellList :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkBridgeCellIteratorStrategy :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBridgeCellIteratorOnCellList :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBridgeCellIteratorOnCellList :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkBridgeCellIteratorOnCellList; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkBridgeCellIteratorOnCellList.h".}
proc Begin*(this: var vtkBridgeCellIteratorOnCellList) {.importcpp: "Begin",
    header: "vtkBridgeCellIteratorOnCellList.h".}
proc IsAtEnd*(this: var vtkBridgeCellIteratorOnCellList): vtkTypeBool {.
    importcpp: "IsAtEnd", header: "vtkBridgeCellIteratorOnCellList.h".}
proc GetCell*(this: var vtkBridgeCellIteratorOnCellList;
             c: ptr vtkGenericAdaptorCell) {.importcpp: "GetCell",
    header: "vtkBridgeCellIteratorOnCellList.h".}
proc GetCell*(this: var vtkBridgeCellIteratorOnCellList): ptr vtkGenericAdaptorCell {.
    importcpp: "GetCell", header: "vtkBridgeCellIteratorOnCellList.h".}
proc Next*(this: var vtkBridgeCellIteratorOnCellList) {.importcpp: "Next",
    header: "vtkBridgeCellIteratorOnCellList.h".}
proc InitWithCells*(this: var vtkBridgeCellIteratorOnCellList; cells: ptr vtkIdList;
                   ds: ptr vtkBridgeDataSet) {.importcpp: "InitWithCells",
    header: "vtkBridgeCellIteratorOnCellList.h".}