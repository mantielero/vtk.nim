## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCullerCollection.h
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
##  @class   vtkCullerCollection
##  @brief   an ordered list of Cullers
##
##  vtkCullerCollection represents and provides methods to manipulate a list
##  of Cullers (i.e., vtkCuller and subclasses). The list is ordered and
##  duplicate entries are not prevented.
##
##  @sa
##  vtkCuller vtkCollection
##

import
  vtkCollection, vtkCuller, vtkRenderingCoreModule

type
  vtkCullerCollection* {.importcpp: "vtkCullerCollection",
                        header: "vtkCullerCollection.h", bycopy.} = object of vtkCollection ##  hide the standard AddItem from the user and the compiler.
    vtkCullerCollection* {.importc: "vtkCullerCollection".}: VTK_NEWINSTANCE


proc New*(): ptr vtkCullerCollection {.importcpp: "vtkCullerCollection::New(@)",
                                   header: "vtkCullerCollection.h".}
type
  vtkCullerCollectionSuperclass* = vtkCollection

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCullerCollection::IsTypeOf(@)", header: "vtkCullerCollection.h".}
proc IsA*(this: var vtkCullerCollection; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkCullerCollection.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCullerCollection {.
    importcpp: "vtkCullerCollection::SafeDownCast(@)",
    header: "vtkCullerCollection.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCullerCollection :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCullerCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCullerCollection :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCullerCollection; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCullerCollection.h".}
proc AddItem*(this: var vtkCullerCollection; a: ptr vtkCuller) {.importcpp: "AddItem",
    header: "vtkCullerCollection.h".}
proc GetNextItem*(this: var vtkCullerCollection): ptr vtkCuller {.
    importcpp: "GetNextItem", header: "vtkCullerCollection.h".}
proc GetLastItem*(this: var vtkCullerCollection): ptr vtkCuller {.
    importcpp: "GetLastItem", header: "vtkCullerCollection.h".}
proc GetNextCuller*(this: var vtkCullerCollection;
                   cookie: var vtkCollectionSimpleIterator): ptr vtkCuller {.
    importcpp: "GetNextCuller", header: "vtkCullerCollection.h".}
proc GetLastItem*(this: var vtkCullerCollection): ptr vtkCuller {.
    importcpp: "GetLastItem", header: "vtkCullerCollection.h".}