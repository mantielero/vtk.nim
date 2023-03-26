## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRendererCollection.h
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
##  @class   vtkRendererCollection
##  @brief   an ordered list of renderers
##
##  vtkRendererCollection represents and provides methods to manipulate a list
##  of renderers (i.e., vtkRenderer and subclasses). The list is ordered and
##  duplicate entries are not prevented.
##
##  @sa
##  vtkRenderer vtkCollection
##

import
  vtkCollection, vtkRenderer, vtkRenderingCoreModule

type
  vtkRendererCollection* {.importcpp: "vtkRendererCollection",
                          header: "vtkRendererCollection.h", bycopy.} = object of vtkCollection ##  hide the standard AddItem from the user and the compiler.
    vtkRendererCollection* {.importc: "vtkRendererCollection".}: VTK_NEWINSTANCE


proc New*(): ptr vtkRendererCollection {.importcpp: "vtkRendererCollection::New(@)",
                                     header: "vtkRendererCollection.h".}
type
  vtkRendererCollectionSuperclass* = vtkCollection

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkRendererCollection::IsTypeOf(@)",
    header: "vtkRendererCollection.h".}
proc IsA*(this: var vtkRendererCollection; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkRendererCollection.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkRendererCollection {.
    importcpp: "vtkRendererCollection::SafeDownCast(@)",
    header: "vtkRendererCollection.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkRendererCollection :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRendererCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRendererCollection :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkRendererCollection; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkRendererCollection.h".}
proc AddItem*(this: var vtkRendererCollection; a: ptr vtkRenderer) {.
    importcpp: "AddItem", header: "vtkRendererCollection.h".}
proc GetNextItem*(this: var vtkRendererCollection): ptr vtkRenderer {.
    importcpp: "GetNextItem", header: "vtkRendererCollection.h".}
proc Render*(this: var vtkRendererCollection) {.importcpp: "Render",
    header: "vtkRendererCollection.h".}
proc GetFirstRenderer*(this: var vtkRendererCollection): ptr vtkRenderer {.
    importcpp: "GetFirstRenderer", header: "vtkRendererCollection.h".}
proc GetNextRenderer*(this: var vtkRendererCollection;
                     cookie: var vtkCollectionSimpleIterator): ptr vtkRenderer {.
    importcpp: "GetNextRenderer", header: "vtkRendererCollection.h".}