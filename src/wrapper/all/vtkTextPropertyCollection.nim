## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTextPropertyCollection.h
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
##  @class   vtkTextPropertyCollection
##  @brief   an ordered list of vtkTextProperty objects.
##
##  vtkTextPropertyCollection represents and provides methods to manipulate a
##  list of TextProperty objects. The list is ordered and
##  duplicate entries are not prevented.
##  @sa
##  vtkTextProperty vtkCollection
##

import
  vtkCollection, vtkRenderingCoreModule, vtkTextProperty

type
  vtkTextPropertyCollection* {.importcpp: "vtkTextPropertyCollection",
                              header: "vtkTextPropertyCollection.h", bycopy.} = object of vtkCollection ##  hide the standard AddItem from the user and the compiler.
    vtkTextPropertyCollection* {.importc: "vtkTextPropertyCollection".}: VTK_NEWINSTANCE


proc New*(): ptr vtkTextPropertyCollection {.
    importcpp: "vtkTextPropertyCollection::New(@)",
    header: "vtkTextPropertyCollection.h".}
type
  vtkTextPropertyCollectionSuperclass* = vtkCollection

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTextPropertyCollection::IsTypeOf(@)",
    header: "vtkTextPropertyCollection.h".}
proc IsA*(this: var vtkTextPropertyCollection; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTextPropertyCollection.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTextPropertyCollection {.
    importcpp: "vtkTextPropertyCollection::SafeDownCast(@)",
    header: "vtkTextPropertyCollection.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTextPropertyCollection :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTextPropertyCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTextPropertyCollection :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTextPropertyCollection; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTextPropertyCollection.h".}
proc AddItem*(this: var vtkTextPropertyCollection; a: ptr vtkTextProperty) {.
    importcpp: "AddItem", header: "vtkTextPropertyCollection.h".}
proc GetNextItem*(this: var vtkTextPropertyCollection): ptr vtkTextProperty {.
    importcpp: "GetNextItem", header: "vtkTextPropertyCollection.h".}
proc GetItem*(this: var vtkTextPropertyCollection; idx: cint): ptr vtkTextProperty {.
    importcpp: "GetItem", header: "vtkTextPropertyCollection.h".}
proc GetLastItem*(this: var vtkTextPropertyCollection): ptr vtkTextProperty {.
    importcpp: "GetLastItem", header: "vtkTextPropertyCollection.h".}
proc GetNextTextProperty*(this: var vtkTextPropertyCollection;
                         cookie: var vtkCollectionSimpleIterator): ptr vtkTextProperty {.
    importcpp: "GetNextTextProperty", header: "vtkTextPropertyCollection.h".}
proc AddItem*(this: var vtkTextPropertyCollection; a: ptr vtkTextProperty) {.
    importcpp: "AddItem", header: "vtkTextPropertyCollection.h".}
proc GetNextItem*(this: var vtkTextPropertyCollection): ptr vtkTextProperty {.
    importcpp: "GetNextItem", header: "vtkTextPropertyCollection.h".}
proc GetItem*(this: var vtkTextPropertyCollection; idx: cint): ptr vtkTextProperty {.
    importcpp: "GetItem", header: "vtkTextPropertyCollection.h".}
proc GetLastItem*(this: var vtkTextPropertyCollection): ptr vtkTextProperty {.
    importcpp: "GetLastItem", header: "vtkTextPropertyCollection.h".}
proc GetNextTextProperty*(this: var vtkTextPropertyCollection;
                         it: var vtkCollectionSimpleIterator): ptr vtkTextProperty {.
    importcpp: "GetNextTextProperty", header: "vtkTextPropertyCollection.h".}
proc AddItem*(this: var vtkTextPropertyCollection; o: ptr vtkObject) {.
    importcpp: "AddItem", header: "vtkTextPropertyCollection.h".}