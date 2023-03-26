## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkReferenceCount.h
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
##  @class   vtkReferenceCount
##  @brief   Obsolete / empty subclass of object.
##
##  vtkReferenceCount functionality has now been moved into vtkObject
##  @sa
##  vtkObject
##

import
  vtkCommonCoreModule, vtkObject

type
  vtkReferenceCount* {.importcpp: "vtkReferenceCount",
                      header: "vtkReferenceCount.h", bycopy.} = object of vtkObject
    vtkReferenceCount* {.importc: "vtkReferenceCount".}: VTK_NEWINSTANCE


proc New*(): ptr vtkReferenceCount {.importcpp: "vtkReferenceCount::New(@)",
                                 header: "vtkReferenceCount.h".}
type
  vtkReferenceCountSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkReferenceCount::IsTypeOf(@)", header: "vtkReferenceCount.h".}
proc IsA*(this: var vtkReferenceCount; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkReferenceCount.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkReferenceCount {.
    importcpp: "vtkReferenceCount::SafeDownCast(@)", header: "vtkReferenceCount.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkReferenceCount :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkReferenceCount :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkReferenceCount :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkReferenceCount; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkReferenceCount.h".}