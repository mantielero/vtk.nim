## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDataSetCellIterator.h
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
##  @class   vtkDataSetCellIterator
##  @brief   Implementation of vtkCellIterator using
##  vtkDataSet API.
##

import
  vtkCellIterator, vtkCommonDataModelModule, vtkSmartPointer

discard "forward decl of vtkDataSet"
type
  vtkDataSetCellIterator* {.importcpp: "vtkDataSetCellIterator",
                           header: "vtkDataSetCellIterator.h", bycopy.} = object of vtkCellIterator
    vtkDataSetCellIterator* {.importc: "vtkDataSetCellIterator".}: VTK_NEWINSTANCE


proc New*(): ptr vtkDataSetCellIterator {.importcpp: "vtkDataSetCellIterator::New(@)",
                                      header: "vtkDataSetCellIterator.h".}
type
  vtkDataSetCellIteratorSuperclass* = vtkCellIterator

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDataSetCellIterator::IsTypeOf(@)",
    header: "vtkDataSetCellIterator.h".}
proc IsA*(this: var vtkDataSetCellIterator; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkDataSetCellIterator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDataSetCellIterator {.
    importcpp: "vtkDataSetCellIterator::SafeDownCast(@)",
    header: "vtkDataSetCellIterator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDataSetCellIterator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCellIterator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDataSetCellIterator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDataSetCellIterator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDataSetCellIterator; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkDataSetCellIterator.h".}
proc IsDoneWithTraversal*(this: var vtkDataSetCellIterator): bool {.
    importcpp: "IsDoneWithTraversal", header: "vtkDataSetCellIterator.h".}
proc GetCellId*(this: var vtkDataSetCellIterator): vtkIdType {.
    importcpp: "GetCellId", header: "vtkDataSetCellIterator.h".}