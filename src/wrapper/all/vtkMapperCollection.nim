## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMapperCollection.h
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
##  @class   vtkMapperCollection
##  @brief   an ordered list of mappers
##
##  vtkMapperCollection represents and provides methods to manipulate a list of
##  mappers (i.e., vtkMapper and subclasses). The list is ordered and duplicate
##  entries are not prevented.
##
##  @sa
##  vtkMapper vtkCollection
##

import
  vtkCollection, vtkMapper, vtkRenderingCoreModule

type
  vtkMapperCollection* {.importcpp: "vtkMapperCollection",
                        header: "vtkMapperCollection.h", bycopy.} = object of vtkCollection ##  hide the standard AddItem from the user and the compiler.
    vtkMapperCollection* {.importc: "vtkMapperCollection".}: VTK_NEWINSTANCE


proc New*(): ptr vtkMapperCollection {.importcpp: "vtkMapperCollection::New(@)",
                                   header: "vtkMapperCollection.h".}
type
  vtkMapperCollectionSuperclass* = vtkCollection

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMapperCollection::IsTypeOf(@)", header: "vtkMapperCollection.h".}
proc IsA*(this: var vtkMapperCollection; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkMapperCollection.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMapperCollection {.
    importcpp: "vtkMapperCollection::SafeDownCast(@)",
    header: "vtkMapperCollection.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMapperCollection :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMapperCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMapperCollection :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkMapperCollection; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkMapperCollection.h".}
proc AddItem*(this: var vtkMapperCollection; a: ptr vtkMapper) {.importcpp: "AddItem",
    header: "vtkMapperCollection.h".}
proc GetNextItem*(this: var vtkMapperCollection): ptr vtkMapper {.
    importcpp: "GetNextItem", header: "vtkMapperCollection.h".}
proc GetLastItem*(this: var vtkMapperCollection): ptr vtkMapper {.
    importcpp: "GetLastItem", header: "vtkMapperCollection.h".}
proc GetNextMapper*(this: var vtkMapperCollection;
                   cookie: var vtkCollectionSimpleIterator): ptr vtkMapper {.
    importcpp: "GetNextMapper", header: "vtkMapperCollection.h".}