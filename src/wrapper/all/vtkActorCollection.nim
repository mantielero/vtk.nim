## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkActorCollection.h
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
##  @class   vtkActorCollection
##  @brief   an ordered list of actors
##
##  vtkActorCollection represents and provides methods to manipulate a list of
##  actors (i.e., vtkActor and subclasses). The list is ordered and duplicate
##  entries are not prevented.
##
##  @sa
##  vtkActor vtkCollection
##

import
  vtkActor, vtkPropCollection, vtkRenderingCoreModule

discard "forward decl of vtkProperty"
type
  vtkActorCollection* {.importcpp: "vtkActorCollection",
                       header: "vtkActorCollection.h", bycopy.} = object of vtkPropCollection ##  hide the standard AddItem from the user and the compiler.
    vtkActorCollection* {.importc: "vtkActorCollection".}: VTK_NEWINSTANCE


proc New*(): ptr vtkActorCollection {.importcpp: "vtkActorCollection::New(@)",
                                  header: "vtkActorCollection.h".}
type
  vtkActorCollectionSuperclass* = vtkPropCollection

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkActorCollection::IsTypeOf(@)", header: "vtkActorCollection.h".}
proc IsA*(this: var vtkActorCollection; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkActorCollection.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkActorCollection {.
    importcpp: "vtkActorCollection::SafeDownCast(@)",
    header: "vtkActorCollection.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkActorCollection :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPropCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkActorCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkActorCollection :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkActorCollection; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkActorCollection.h".}
proc AddItem*(this: var vtkActorCollection; a: ptr vtkActor) {.importcpp: "AddItem",
    header: "vtkActorCollection.h".}
proc GetNextActor*(this: var vtkActorCollection): ptr vtkActor {.
    importcpp: "GetNextActor", header: "vtkActorCollection.h".}
proc GetLastActor*(this: var vtkActorCollection): ptr vtkActor {.
    importcpp: "GetLastActor", header: "vtkActorCollection.h".}
proc GetNextItem*(this: var vtkActorCollection): ptr vtkActor {.
    importcpp: "GetNextItem", header: "vtkActorCollection.h".}
proc GetLastItem*(this: var vtkActorCollection): ptr vtkActor {.
    importcpp: "GetLastItem", header: "vtkActorCollection.h".}
proc ApplyProperties*(this: var vtkActorCollection; p: ptr vtkProperty) {.
    importcpp: "ApplyProperties", header: "vtkActorCollection.h".}
proc GetNextActor*(this: var vtkActorCollection;
                  cookie: var vtkCollectionSimpleIterator): ptr vtkActor {.
    importcpp: "GetNextActor", header: "vtkActorCollection.h".}
proc AddItem*(this: var vtkActorCollection; a: ptr vtkActor) {.importcpp: "AddItem",
    header: "vtkActorCollection.h".}
proc GetNextActor*(this: var vtkActorCollection): ptr vtkActor {.
    importcpp: "GetNextActor", header: "vtkActorCollection.h".}
proc GetLastActor*(this: var vtkActorCollection): ptr vtkActor {.
    importcpp: "GetLastActor", header: "vtkActorCollection.h".}
proc GetNextItem*(this: var vtkActorCollection): ptr vtkActor {.
    importcpp: "GetNextItem", header: "vtkActorCollection.h".}
proc GetLastItem*(this: var vtkActorCollection): ptr vtkActor {.
    importcpp: "GetLastItem", header: "vtkActorCollection.h".}