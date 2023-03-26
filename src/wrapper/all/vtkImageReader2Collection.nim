## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageReader2Collection.h
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
##  @class   vtkImageReader2Collection
##  @brief   maintain a list of image readers
##
##  vtkImageReader2Collection is an object that creates and manipulates
##  lists of objects of type vtkImageReader2 and its subclasses.
##  @sa
##  vtkCollection vtkPlaneCollection
##

import
  vtkCollection, vtkIOImageModule

discard "forward decl of vtkImageReader2"
type
  vtkImageReader2Collection* {.importcpp: "vtkImageReader2Collection",
                              header: "vtkImageReader2Collection.h", bycopy.} = object of vtkCollection ##  hide the standard AddItem from the user and the compiler.
    vtkImageReader2Collection* {.importc: "vtkImageReader2Collection".}: VTK_NEWINSTANCE

  vtkImageReader2CollectionSuperclass* = vtkCollection

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageReader2Collection::IsTypeOf(@)",
    header: "vtkImageReader2Collection.h".}
proc IsA*(this: var vtkImageReader2Collection; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageReader2Collection.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageReader2Collection {.
    importcpp: "vtkImageReader2Collection::SafeDownCast(@)",
    header: "vtkImageReader2Collection.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageReader2Collection :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageReader2Collection :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageReader2Collection :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc New*(): ptr vtkImageReader2Collection {.
    importcpp: "vtkImageReader2Collection::New(@)",
    header: "vtkImageReader2Collection.h".}
proc PrintSelf*(this: var vtkImageReader2Collection; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageReader2Collection.h".}
proc AddItem*(this: var vtkImageReader2Collection; a2: ptr vtkImageReader2) {.
    importcpp: "AddItem", header: "vtkImageReader2Collection.h".}
proc GetNextItem*(this: var vtkImageReader2Collection): ptr vtkImageReader2 {.
    importcpp: "GetNextItem", header: "vtkImageReader2Collection.h".}
proc GetNextImageReader2*(this: var vtkImageReader2Collection;
                         cookie: var vtkCollectionSimpleIterator): ptr vtkImageReader2 {.
    importcpp: "GetNextImageReader2", header: "vtkImageReader2Collection.h".}