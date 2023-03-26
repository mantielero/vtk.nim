## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkProp3DCollection.h
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
##  @class   vtkProp3DCollection
##  @brief   an ordered list of 3D props
##
##  vtkProp3DCollection represents and provides methods to manipulate a list of
##  3D props (i.e., vtkProp3D and subclasses). The list is ordered and
##  duplicate entries are not prevented.
##
##  @sa
##  vtkProp3D vtkCollection
##

import
  vtkProp3D, vtkPropCollection, vtkRenderingCoreModule

type
  vtkProp3DCollection* {.importcpp: "vtkProp3DCollection",
                        header: "vtkProp3DCollection.h", bycopy.} = object of vtkPropCollection ##  hide the standard AddItem from the user and the compiler.
    vtkProp3DCollection* {.importc: "vtkProp3DCollection".}: VTK_NEWINSTANCE


proc New*(): ptr vtkProp3DCollection {.importcpp: "vtkProp3DCollection::New(@)",
                                   header: "vtkProp3DCollection.h".}
type
  vtkProp3DCollectionSuperclass* = vtkPropCollection

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkProp3DCollection::IsTypeOf(@)", header: "vtkProp3DCollection.h".}
proc IsA*(this: var vtkProp3DCollection; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkProp3DCollection.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkProp3DCollection {.
    importcpp: "vtkProp3DCollection::SafeDownCast(@)",
    header: "vtkProp3DCollection.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkProp3DCollection :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPropCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkProp3DCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkProp3DCollection :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkProp3DCollection; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkProp3DCollection.h".}
proc AddItem*(this: var vtkProp3DCollection; p: ptr vtkProp3D) {.importcpp: "AddItem",
    header: "vtkProp3DCollection.h".}
proc GetNextProp3D*(this: var vtkProp3DCollection): ptr vtkProp3D {.
    importcpp: "GetNextProp3D", header: "vtkProp3DCollection.h".}
proc GetLastProp3D*(this: var vtkProp3DCollection): ptr vtkProp3D {.
    importcpp: "GetLastProp3D", header: "vtkProp3DCollection.h".}
proc GetNextProp3D*(this: var vtkProp3DCollection;
                   cookie: var vtkCollectionSimpleIterator): ptr vtkProp3D {.
    importcpp: "GetNextProp3D", header: "vtkProp3DCollection.h".}
proc AddItem*(this: var vtkProp3DCollection; a: ptr vtkProp3D) {.importcpp: "AddItem",
    header: "vtkProp3DCollection.h".}
proc GetNextProp3D*(this: var vtkProp3DCollection): ptr vtkProp3D {.
    importcpp: "GetNextProp3D", header: "vtkProp3DCollection.h".}
proc GetLastProp3D*(this: var vtkProp3DCollection): ptr vtkProp3D {.
    importcpp: "GetLastProp3D", header: "vtkProp3DCollection.h".}