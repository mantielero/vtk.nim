## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLightCollection.h
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
##  @class   vtkLightCollection
##  @brief   an ordered list of lights
##
##  vtkLightCollection represents and provides methods to manipulate a list of
##  lights (i.e., vtkLight and subclasses). The list is ordered and duplicate
##  entries are not prevented.
##
##  @sa
##  vtkCollection vtkLight
##

import
  vtkCollection, vtkRenderingCoreModule

discard "forward decl of vtkLight"
type
  vtkLightCollection* {.importcpp: "vtkLightCollection",
                       header: "vtkLightCollection.h", bycopy.} = object of vtkCollection ##  hide the standard AddItem from the user and the compiler.
    vtkLightCollection* {.importc: "vtkLightCollection".}: VTK_NEWINSTANCE


proc New*(): ptr vtkLightCollection {.importcpp: "vtkLightCollection::New(@)",
                                  header: "vtkLightCollection.h".}
type
  vtkLightCollectionSuperclass* = vtkCollection

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkLightCollection::IsTypeOf(@)", header: "vtkLightCollection.h".}
proc IsA*(this: var vtkLightCollection; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkLightCollection.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkLightCollection {.
    importcpp: "vtkLightCollection::SafeDownCast(@)",
    header: "vtkLightCollection.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkLightCollection :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLightCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLightCollection :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkLightCollection; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkLightCollection.h".}
proc AddItem*(this: var vtkLightCollection; a: ptr vtkLight) {.importcpp: "AddItem",
    header: "vtkLightCollection.h".}
proc GetNextItem*(this: var vtkLightCollection): ptr vtkLight {.
    importcpp: "GetNextItem", header: "vtkLightCollection.h".}
proc GetNextLight*(this: var vtkLightCollection;
                  cookie: var vtkCollectionSimpleIterator): ptr vtkLight {.
    importcpp: "GetNextLight", header: "vtkLightCollection.h".}