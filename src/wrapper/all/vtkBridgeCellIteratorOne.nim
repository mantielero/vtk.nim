## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBridgeCellIteratorOne.h
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
##  @class   vtkBridgeCellIteratorOne
##  @brief   Iterate over one cell only of a dataset.
##  @sa
##  vtkBridgeCellIterator, vtkBridgeDataSet, vtkBridgeCellIteratorStrategy
##

import
  vtkBridgeCellIteratorStrategy

discard "forward decl of vtkBridgeCell"
discard "forward decl of vtkBridgeDataSet"
discard "forward decl of vtkBridgeCell"
discard "forward decl of vtkIdList"
discard "forward decl of vtkPoints"
discard "forward decl of vtkCell"
type
  vtkBridgeCellIteratorOne* {.importcpp: "vtkBridgeCellIteratorOne",
                             header: "vtkBridgeCellIteratorOne.h", bycopy.} = object of vtkBridgeCellIteratorStrategy
    vtkBridgeCellIteratorOne* {.importc: "vtkBridgeCellIteratorOne".}: VTK_NEWINSTANCE
    ##  the structure on which the object iterates.
    ##  the id at current position.
    ##  cell at current position.


proc New*(): ptr vtkBridgeCellIteratorOne {.importcpp: "vtkBridgeCellIteratorOne::New(@)",
                                        header: "vtkBridgeCellIteratorOne.h".}
type
  vtkBridgeCellIteratorOneSuperclass* = vtkBridgeCellIteratorStrategy

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkBridgeCellIteratorOne::IsTypeOf(@)",
    header: "vtkBridgeCellIteratorOne.h".}
proc IsA*(this: var vtkBridgeCellIteratorOne; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkBridgeCellIteratorOne.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBridgeCellIteratorOne {.
    importcpp: "vtkBridgeCellIteratorOne::SafeDownCast(@)",
    header: "vtkBridgeCellIteratorOne.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBridgeCellIteratorOne :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkBridgeCellIteratorStrategy :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBridgeCellIteratorOne :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBridgeCellIteratorOne :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkBridgeCellIteratorOne; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkBridgeCellIteratorOne.h".}
proc Begin*(this: var vtkBridgeCellIteratorOne) {.importcpp: "Begin",
    header: "vtkBridgeCellIteratorOne.h".}
proc IsAtEnd*(this: var vtkBridgeCellIteratorOne): vtkTypeBool {.
    importcpp: "IsAtEnd", header: "vtkBridgeCellIteratorOne.h".}
proc GetCell*(this: var vtkBridgeCellIteratorOne; c: ptr vtkGenericAdaptorCell) {.
    importcpp: "GetCell", header: "vtkBridgeCellIteratorOne.h".}
proc GetCell*(this: var vtkBridgeCellIteratorOne): ptr vtkGenericAdaptorCell {.
    importcpp: "GetCell", header: "vtkBridgeCellIteratorOne.h".}
proc Next*(this: var vtkBridgeCellIteratorOne) {.importcpp: "Next",
    header: "vtkBridgeCellIteratorOne.h".}
proc InitWithOneCell*(this: var vtkBridgeCellIteratorOne; ds: ptr vtkBridgeDataSet;
                     cellid: vtkIdType) {.importcpp: "InitWithOneCell",
                                        header: "vtkBridgeCellIteratorOne.h".}
proc InitWithOneCell*(this: var vtkBridgeCellIteratorOne; c: ptr vtkBridgeCell) {.
    importcpp: "InitWithOneCell", header: "vtkBridgeCellIteratorOne.h".}
proc InitWithPoints*(this: var vtkBridgeCellIteratorOne; coords: ptr vtkPoints;
                    pts: ptr vtkIdList; dim: cint; cellid: vtkIdType) {.
    importcpp: "InitWithPoints", header: "vtkBridgeCellIteratorOne.h".}