## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkVolumeCollection.h
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
##  @class   vtkVolumeCollection
##  @brief   an ordered list of volumes
##
##  vtkVolumeCollection represents and provides methods to manipulate a
##  list of volumes (i.e., vtkVolume and subclasses). The list is ordered
##  and duplicate entries are not prevented.
##
##  @sa
##  vtkCollection vtkVolume
##

import
  vtkPropCollection, vtkRenderingCoreModule, vtkVolume

type
  vtkVolumeCollection* {.importcpp: "vtkVolumeCollection",
                        header: "vtkVolumeCollection.h", bycopy.} = object of vtkPropCollection ##  hide the standard AddItem from the user and the compiler.
    vtkVolumeCollection* {.importc: "vtkVolumeCollection".}: VTK_NEWINSTANCE


proc New*(): ptr vtkVolumeCollection {.importcpp: "vtkVolumeCollection::New(@)",
                                   header: "vtkVolumeCollection.h".}
type
  vtkVolumeCollectionSuperclass* = vtkPropCollection

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkVolumeCollection::IsTypeOf(@)", header: "vtkVolumeCollection.h".}
proc IsA*(this: var vtkVolumeCollection; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkVolumeCollection.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkVolumeCollection {.
    importcpp: "vtkVolumeCollection::SafeDownCast(@)",
    header: "vtkVolumeCollection.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkVolumeCollection :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPropCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkVolumeCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkVolumeCollection :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkVolumeCollection; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkVolumeCollection.h".}
proc AddItem*(this: var vtkVolumeCollection; a: ptr vtkVolume) {.importcpp: "AddItem",
    header: "vtkVolumeCollection.h".}
proc GetNextVolume*(this: var vtkVolumeCollection): ptr vtkVolume {.
    importcpp: "GetNextVolume", header: "vtkVolumeCollection.h".}
proc GetNextItem*(this: var vtkVolumeCollection): ptr vtkVolume {.
    importcpp: "GetNextItem", header: "vtkVolumeCollection.h".}
proc GetNextVolume*(this: var vtkVolumeCollection;
                   cookie: var vtkCollectionSimpleIterator): ptr vtkVolume {.
    importcpp: "GetNextVolume", header: "vtkVolumeCollection.h".}