## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRenderWindowCollection.h
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
##  @class   vtkRenderWindowCollection
##  @brief   an ordered list of RenderWindows
##
##  vtkRenderWindowCollection represents and provides methods to manipulate a
##  list of RenderWindows. The list is ordered and duplicate entries are
##  not prevented.
##
##  @sa
##  vtkRenderWindow vtkCollection
##

import
  vtkCollection, vtkRenderWindow, vtkRenderingCoreModule

type
  vtkRenderWindowCollection* {.importcpp: "vtkRenderWindowCollection",
                              header: "vtkRenderWindowCollection.h", bycopy.} = object of vtkCollection ##  hide the standard AddItem from the user and the compiler.
    vtkRenderWindowCollection* {.importc: "vtkRenderWindowCollection".}: VTK_NEWINSTANCE


proc New*(): ptr vtkRenderWindowCollection {.
    importcpp: "vtkRenderWindowCollection::New(@)",
    header: "vtkRenderWindowCollection.h".}
type
  vtkRenderWindowCollectionSuperclass* = vtkCollection

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkRenderWindowCollection::IsTypeOf(@)",
    header: "vtkRenderWindowCollection.h".}
proc IsA*(this: var vtkRenderWindowCollection; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkRenderWindowCollection.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkRenderWindowCollection {.
    importcpp: "vtkRenderWindowCollection::SafeDownCast(@)",
    header: "vtkRenderWindowCollection.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkRenderWindowCollection :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRenderWindowCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRenderWindowCollection :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkRenderWindowCollection; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkRenderWindowCollection.h".}
proc AddItem*(this: var vtkRenderWindowCollection; a: ptr vtkRenderWindow) {.
    importcpp: "AddItem", header: "vtkRenderWindowCollection.h".}
proc GetNextItem*(this: var vtkRenderWindowCollection): ptr vtkRenderWindow {.
    importcpp: "GetNextItem", header: "vtkRenderWindowCollection.h".}
proc GetNextRenderWindow*(this: var vtkRenderWindowCollection;
                         cookie: var vtkCollectionSimpleIterator): ptr vtkRenderWindow {.
    importcpp: "GetNextRenderWindow", header: "vtkRenderWindowCollection.h".}