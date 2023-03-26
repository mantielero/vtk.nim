## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBridgeCellIteratorStrategy.h
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
##  @class   vtkBridgeCellIteratorStrategy
##  @brief   Interface used by vtkBridgeCellIterator
##  vtkBridgeCellIterator has different behaviors depending on the way it is
##  initialized. vtkBridgeCellIteratorStrategy is the interface for one of those
##  behaviors. Concrete classes are vtkBridgeCellIteratorOnDataSet,
##  vtkBridgeCellIteratorOnDataSetBoundaries,
##  vtkBridgeCellIteratorOnCellBoundaries,
##  vtkBridgeCellIteratorOnCellNeighbors,
##  @sa
##  vtkGenericCellIterator, vtkBridgeCellIterator, vtkBridgeDataSet, vtkBridgeCellIteratorOnDataSet,
##  vtkBridgeCellIteratorOnDataSetBoundaries, vtkBridgeCellIteratorOnCellBoundaries,
##  vtkBridgeCellIteratorOnCellNeighbors
##

import
  vtkBridgeExport, vtkGenericCellIterator

discard "forward decl of vtkBridgeCell"
discard "forward decl of vtkBridgeDataSet"
discard "forward decl of vtkBridgeCell"
discard "forward decl of vtkIdList"
type
  vtkBridgeCellIteratorStrategy* {.importcpp: "vtkBridgeCellIteratorStrategy",
                                  header: "vtkBridgeCellIteratorStrategy.h",
                                  bycopy.} = object of vtkGenericCellIterator
    vtkBridgeCellIteratorStrategy* {.importc: "vtkBridgeCellIteratorStrategy".}: VTK_NEWINSTANCE

  vtkBridgeCellIteratorStrategySuperclass* = vtkGenericCellIterator

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkBridgeCellIteratorStrategy::IsTypeOf(@)",
    header: "vtkBridgeCellIteratorStrategy.h".}
proc IsA*(this: var vtkBridgeCellIteratorStrategy; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkBridgeCellIteratorStrategy.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBridgeCellIteratorStrategy {.
    importcpp: "vtkBridgeCellIteratorStrategy::SafeDownCast(@)",
    header: "vtkBridgeCellIteratorStrategy.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBridgeCellIteratorStrategy :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGenericCellIterator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBridgeCellIteratorStrategy :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBridgeCellIteratorStrategy :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkBridgeCellIteratorStrategy; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkBridgeCellIteratorStrategy.h".}
proc NewCell*(this: var vtkBridgeCellIteratorStrategy): ptr vtkGenericAdaptorCell {.
    importcpp: "NewCell", header: "vtkBridgeCellIteratorStrategy.h".}