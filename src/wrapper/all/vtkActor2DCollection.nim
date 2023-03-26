## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkActor2DCollection.h
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
##  @class   vtkActor2DCollection
##  @brief    a list of 2D actors
##
##  vtkActor2DCollection is a subclass of vtkCollection.  vtkActor2DCollection
##  maintains a collection of vtkActor2D objects that is sorted by layer
##  number, with lower layer numbers at the start of the list.  This allows
##  the vtkActor2D objects to be rendered in the correct order.
##
##  @sa
##  vtkActor2D vtkCollection
##

import
  vtkPropCollection, vtkRenderingCoreModule, vtkActor2D

discard "forward decl of vtkViewport"
type
  vtkActor2DCollection* {.importcpp: "vtkActor2DCollection",
                         header: "vtkActor2DCollection.h", bycopy.} = object of vtkPropCollection ## *
                                                                                           ##  Destructor for the vtkActor2DCollection class. This removes all
                                                                                           ##  objects from the collection.
                                                                                           ##
                                                                                           ##  hide the standard AddItem from the user and the compiler.
    vtkActor2DCollection* {.importc: "vtkActor2DCollection".}: VTK_NEWINSTANCE


proc New*(): ptr vtkActor2DCollection {.importcpp: "vtkActor2DCollection::New(@)",
                                    header: "vtkActor2DCollection.h".}
type
  vtkActor2DCollectionSuperclass* = vtkPropCollection

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkActor2DCollection::IsTypeOf(@)",
    header: "vtkActor2DCollection.h".}
proc IsA*(this: var vtkActor2DCollection; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkActor2DCollection.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkActor2DCollection {.
    importcpp: "vtkActor2DCollection::SafeDownCast(@)",
    header: "vtkActor2DCollection.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkActor2DCollection :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPropCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkActor2DCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkActor2DCollection :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkActor2DCollection; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkActor2DCollection.h".}
proc Sort*(this: var vtkActor2DCollection) {.importcpp: "Sort",
    header: "vtkActor2DCollection.h".}
proc AddItem*(this: var vtkActor2DCollection; a: ptr vtkActor2D) {.
    importcpp: "AddItem", header: "vtkActor2DCollection.h".}
proc IsItemPresent*(this: var vtkActor2DCollection; a: ptr vtkActor2D): cint {.
    importcpp: "IsItemPresent", header: "vtkActor2DCollection.h".}
proc GetNextActor2D*(this: var vtkActor2DCollection): ptr vtkActor2D {.
    importcpp: "GetNextActor2D", header: "vtkActor2DCollection.h".}
proc GetLastActor2D*(this: var vtkActor2DCollection): ptr vtkActor2D {.
    importcpp: "GetLastActor2D", header: "vtkActor2DCollection.h".}
proc GetNextItem*(this: var vtkActor2DCollection): ptr vtkActor2D {.
    importcpp: "GetNextItem", header: "vtkActor2DCollection.h".}
proc GetLastItem*(this: var vtkActor2DCollection): ptr vtkActor2D {.
    importcpp: "GetLastItem", header: "vtkActor2DCollection.h".}
proc RenderOverlay*(this: var vtkActor2DCollection; viewport: ptr vtkViewport) {.
    importcpp: "RenderOverlay", header: "vtkActor2DCollection.h".}
proc GetNextActor2D*(this: var vtkActor2DCollection;
                    cookie: var vtkCollectionSimpleIterator): ptr vtkActor2D {.
    importcpp: "GetNextActor2D", header: "vtkActor2DCollection.h".}
proc IsItemPresent*(this: var vtkActor2DCollection; a: ptr vtkActor2D): cint {.
    importcpp: "IsItemPresent", header: "vtkActor2DCollection.h".}
proc GetNextActor2D*(this: var vtkActor2DCollection): ptr vtkActor2D {.
    importcpp: "GetNextActor2D", header: "vtkActor2DCollection.h".}
proc GetLastActor2D*(this: var vtkActor2DCollection): ptr vtkActor2D {.
    importcpp: "GetLastActor2D", header: "vtkActor2DCollection.h".}
proc GetNextItem*(this: var vtkActor2DCollection): ptr vtkActor2D {.
    importcpp: "GetNextItem", header: "vtkActor2DCollection.h".}
proc GetLastItem*(this: var vtkActor2DCollection): ptr vtkActor2D {.
    importcpp: "GetLastItem", header: "vtkActor2DCollection.h".}