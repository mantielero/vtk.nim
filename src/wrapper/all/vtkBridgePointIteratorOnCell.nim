## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBridgePointIteratorOnCell.h
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
##  @class   vtkBridgePointIteratorOnCell
##  @brief   Implementation of vtkGenericPointIterator.
##
##  It iterates over the corner points of a cell.
##  @sa
##  vtkGenericPointIterator, vtkBridgeDataSet
##

import
  vtkBridgeExport, vtkGenericPointIterator

discard "forward decl of vtkBridgeDataSet"
discard "forward decl of vtkBridgeCell"
discard "forward decl of vtkIdList"
type
  vtkBridgePointIteratorOnCell* {.importcpp: "vtkBridgePointIteratorOnCell",
                                 header: "vtkBridgePointIteratorOnCell.h", bycopy.} = object of vtkGenericPointIterator ## *
                                                                                                                 ##  Default constructor.
                                                                                                                 ##
    vtkBridgePointIteratorOnCell* {.importc: "vtkBridgePointIteratorOnCell".}: VTK_NEWINSTANCE
    ##  the structure on which the object iterates.
    ##  current position
    ##  list of points of the cell


proc New*(): ptr vtkBridgePointIteratorOnCell {.
    importcpp: "vtkBridgePointIteratorOnCell::New(@)",
    header: "vtkBridgePointIteratorOnCell.h".}
type
  vtkBridgePointIteratorOnCellSuperclass* = vtkGenericPointIterator

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkBridgePointIteratorOnCell::IsTypeOf(@)",
    header: "vtkBridgePointIteratorOnCell.h".}
proc IsA*(this: var vtkBridgePointIteratorOnCell; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkBridgePointIteratorOnCell.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBridgePointIteratorOnCell {.
    importcpp: "vtkBridgePointIteratorOnCell::SafeDownCast(@)",
    header: "vtkBridgePointIteratorOnCell.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBridgePointIteratorOnCell :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGenericPointIterator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBridgePointIteratorOnCell :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBridgePointIteratorOnCell :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkBridgePointIteratorOnCell; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkBridgePointIteratorOnCell.h".}
proc Begin*(this: var vtkBridgePointIteratorOnCell) {.importcpp: "Begin",
    header: "vtkBridgePointIteratorOnCell.h".}
proc IsAtEnd*(this: var vtkBridgePointIteratorOnCell): vtkTypeBool {.
    importcpp: "IsAtEnd", header: "vtkBridgePointIteratorOnCell.h".}
proc Next*(this: var vtkBridgePointIteratorOnCell) {.importcpp: "Next",
    header: "vtkBridgePointIteratorOnCell.h".}
proc GetPosition*(this: var vtkBridgePointIteratorOnCell): ptr cdouble {.
    importcpp: "GetPosition", header: "vtkBridgePointIteratorOnCell.h".}
proc GetPosition*(this: var vtkBridgePointIteratorOnCell; x: array[3, cdouble]) {.
    importcpp: "GetPosition", header: "vtkBridgePointIteratorOnCell.h".}
proc GetId*(this: var vtkBridgePointIteratorOnCell): vtkIdType {.importcpp: "GetId",
    header: "vtkBridgePointIteratorOnCell.h".}
proc InitWithCell*(this: var vtkBridgePointIteratorOnCell; cell: ptr vtkBridgeCell) {.
    importcpp: "InitWithCell", header: "vtkBridgePointIteratorOnCell.h".}