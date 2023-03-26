## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDataArrayCollectionIterator.h
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
##  @class   vtkDataArrayCollectionIterator
##  @brief   iterator through a vtkDataArrayCollection.
##
##  vtkDataArrayCollectionIterator provides an implementation of
##  vtkCollectionIterator which allows the items to be retrieved with
##  the proper subclass pointer type for vtkDataArrayCollection.
##

import
  vtkCollectionIterator, vtkCommonCoreModule

discard "forward decl of vtkDataArray"
discard "forward decl of vtkDataArrayCollection"
type
  vtkDataArrayCollectionIterator* {.importcpp: "vtkDataArrayCollectionIterator",
                                   header: "vtkDataArrayCollectionIterator.h",
                                   bycopy.} = object of vtkCollectionIterator
    vtkDataArrayCollectionIterator* {.importc: "vtkDataArrayCollectionIterator".}: VTK_NEWINSTANCE

  vtkDataArrayCollectionIteratorSuperclass* = vtkCollectionIterator

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDataArrayCollectionIterator::IsTypeOf(@)",
    header: "vtkDataArrayCollectionIterator.h".}
proc IsA*(this: var vtkDataArrayCollectionIterator; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkDataArrayCollectionIterator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDataArrayCollectionIterator {.
    importcpp: "vtkDataArrayCollectionIterator::SafeDownCast(@)",
    header: "vtkDataArrayCollectionIterator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDataArrayCollectionIterator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCollectionIterator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDataArrayCollectionIterator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDataArrayCollectionIterator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDataArrayCollectionIterator; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkDataArrayCollectionIterator.h".}
proc New*(): ptr vtkDataArrayCollectionIterator {.
    importcpp: "vtkDataArrayCollectionIterator::New(@)",
    header: "vtkDataArrayCollectionIterator.h".}
proc SetCollection*(this: var vtkDataArrayCollectionIterator; a2: ptr vtkCollection) {.
    importcpp: "SetCollection", header: "vtkDataArrayCollectionIterator.h".}
proc SetCollection*(this: var vtkDataArrayCollectionIterator;
                   a2: ptr vtkDataArrayCollection) {.importcpp: "SetCollection",
    header: "vtkDataArrayCollectionIterator.h".}
proc GetDataArray*(this: var vtkDataArrayCollectionIterator): ptr vtkDataArray {.
    importcpp: "GetDataArray", header: "vtkDataArrayCollectionIterator.h".}