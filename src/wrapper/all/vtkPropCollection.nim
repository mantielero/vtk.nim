## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPropCollection.h
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
##  @class   vtkPropCollection
##  @brief   an ordered list of Props
##
##  vtkPropCollection represents and provides methods to manipulate a list of
##  Props (i.e., vtkProp and subclasses). The list is ordered and duplicate
##  entries are not prevented.
##
##  @sa
##  vtkProp vtkCollection
##

import
  vtkCollection, vtkRenderingCoreModule, vtkProp

type
  vtkPropCollection* {.importcpp: "vtkPropCollection",
                      header: "vtkPropCollection.h", bycopy.} = object of vtkCollection ##  hide the standard AddItem from the user and the compiler.
    vtkPropCollection* {.importc: "vtkPropCollection".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPropCollection {.importcpp: "vtkPropCollection::New(@)",
                                 header: "vtkPropCollection.h".}
type
  vtkPropCollectionSuperclass* = vtkCollection

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPropCollection::IsTypeOf(@)", header: "vtkPropCollection.h".}
proc IsA*(this: var vtkPropCollection; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPropCollection.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPropCollection {.
    importcpp: "vtkPropCollection::SafeDownCast(@)", header: "vtkPropCollection.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPropCollection :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPropCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPropCollection :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPropCollection; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPropCollection.h".}
proc AddItem*(this: var vtkPropCollection; a: ptr vtkProp) {.importcpp: "AddItem",
    header: "vtkPropCollection.h".}
proc GetNextProp*(this: var vtkPropCollection): ptr vtkProp {.
    importcpp: "GetNextProp", header: "vtkPropCollection.h".}
proc GetLastProp*(this: var vtkPropCollection): ptr vtkProp {.
    importcpp: "GetLastProp", header: "vtkPropCollection.h".}
proc GetNumberOfPaths*(this: var vtkPropCollection): cint {.
    importcpp: "GetNumberOfPaths", header: "vtkPropCollection.h".}
proc GetNextProp*(this: var vtkPropCollection;
                 cookie: var vtkCollectionSimpleIterator): ptr vtkProp {.
    importcpp: "GetNextProp", header: "vtkPropCollection.h".}
proc AddItem*(this: var vtkPropCollection; a: ptr vtkProp) {.importcpp: "AddItem",
    header: "vtkPropCollection.h".}
proc GetNextProp*(this: var vtkPropCollection): ptr vtkProp {.
    importcpp: "GetNextProp", header: "vtkPropCollection.h".}
proc GetLastProp*(this: var vtkPropCollection): ptr vtkProp {.
    importcpp: "GetLastProp", header: "vtkPropCollection.h".}