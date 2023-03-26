## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRenderPassCollection.h
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
##  @class   vtkRenderPassCollection
##  @brief   an ordered list of RenderPasses
##
##  vtkRenderPassCollection represents a list of RenderPasses
##  (i.e., vtkRenderPass and subclasses) and provides methods to manipulate the
##  list. The list is ordered and duplicate entries are not prevented.
##
##  @sa
##  vtkRenderPass vtkCollection
##

import
  vtkCollection, vtkRenderingOpenGL2Module

discard "forward decl of vtkRenderPass"
type
  vtkRenderPassCollection* {.importcpp: "vtkRenderPassCollection",
                            header: "vtkRenderPassCollection.h", bycopy.} = object of vtkCollection ##  hide the standard AddItem from the user and the compiler.
    vtkRenderPassCollection* {.importc: "vtkRenderPassCollection".}: VTK_NEWINSTANCE


proc New*(): ptr vtkRenderPassCollection {.importcpp: "vtkRenderPassCollection::New(@)",
                                       header: "vtkRenderPassCollection.h".}
type
  vtkRenderPassCollectionSuperclass* = vtkCollection

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkRenderPassCollection::IsTypeOf(@)",
    header: "vtkRenderPassCollection.h".}
proc IsA*(this: var vtkRenderPassCollection; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkRenderPassCollection.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkRenderPassCollection {.
    importcpp: "vtkRenderPassCollection::SafeDownCast(@)",
    header: "vtkRenderPassCollection.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkRenderPassCollection :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRenderPassCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRenderPassCollection :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkRenderPassCollection; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkRenderPassCollection.h".}
proc AddItem*(this: var vtkRenderPassCollection; pass: ptr vtkRenderPass) {.
    importcpp: "AddItem", header: "vtkRenderPassCollection.h".}
proc GetNextRenderPass*(this: var vtkRenderPassCollection): ptr vtkRenderPass {.
    importcpp: "GetNextRenderPass", header: "vtkRenderPassCollection.h".}
proc GetLastRenderPass*(this: var vtkRenderPassCollection): ptr vtkRenderPass {.
    importcpp: "GetLastRenderPass", header: "vtkRenderPassCollection.h".}
proc GetNextRenderPass*(this: var vtkRenderPassCollection;
                       cookie: var vtkCollectionSimpleIterator): ptr vtkRenderPass {.
    importcpp: "GetNextRenderPass", header: "vtkRenderPassCollection.h".}