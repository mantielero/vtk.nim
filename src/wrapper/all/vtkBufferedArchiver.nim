## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBufferedArchiver.h
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
##  @class   vtkBufferedArchiver
##  @brief   Writes an archive to a buffer for vtk-js datasets
##
##  vtkvtkJSBufferedArchiver is a specialized archiver for writing datasets into
##  a memory buffer with zip compression.
##
##  @sa
##  vtkArchiver
##

import
  vtkCommonArchiveModule, vtkArchiver

type
  vtkBufferedArchiver* {.importcpp: "vtkBufferedArchiver",
                        header: "vtkBufferedArchiver.h", bycopy.} = object of vtkArchiver
    vtkBufferedArchiver* {.importc: "vtkBufferedArchiver".}: VTK_NEWINSTANCE


proc New*(): ptr vtkBufferedArchiver {.importcpp: "vtkBufferedArchiver::New(@)",
                                   header: "vtkBufferedArchiver.h".}
type
  vtkBufferedArchiverSuperclass* = vtkArchiver

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkBufferedArchiver::IsTypeOf(@)", header: "vtkBufferedArchiver.h".}
proc IsA*(this: var vtkBufferedArchiver; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkBufferedArchiver.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBufferedArchiver {.
    importcpp: "vtkBufferedArchiver::SafeDownCast(@)",
    header: "vtkBufferedArchiver.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBufferedArchiver :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkArchiver :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBufferedArchiver :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBufferedArchiver :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkBufferedArchiver; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkBufferedArchiver.h".}
proc OpenArchive*(this: var vtkBufferedArchiver) {.importcpp: "OpenArchive",
    header: "vtkBufferedArchiver.h".}
proc CloseArchive*(this: var vtkBufferedArchiver) {.importcpp: "CloseArchive",
    header: "vtkBufferedArchiver.h".}
proc InsertIntoArchive*(this: var vtkBufferedArchiver; relativePath: string;
                       data: cstring; size: size_t) {.
    importcpp: "InsertIntoArchive", header: "vtkBufferedArchiver.h".}
proc Contains*(this: var vtkBufferedArchiver; relativePath: string): bool {.
    importcpp: "Contains", header: "vtkBufferedArchiver.h".}
proc GetBuffer*(this: var vtkBufferedArchiver): cstring {.importcpp: "GetBuffer",
    header: "vtkBufferedArchiver.h".}
proc GetBufferAddress*(this: var vtkBufferedArchiver): pointer {.
    importcpp: "GetBufferAddress", header: "vtkBufferedArchiver.h".}
proc SetAllocatedSize*(this: var vtkBufferedArchiver; a2: size_t) {.
    importcpp: "SetAllocatedSize", header: "vtkBufferedArchiver.h".}
proc GetAllocatedSize*(this: var vtkBufferedArchiver): size_t {.
    importcpp: "GetAllocatedSize", header: "vtkBufferedArchiver.h".}
proc GetBufferSize*(this: var vtkBufferedArchiver): size_t {.
    importcpp: "GetBufferSize", header: "vtkBufferedArchiver.h".}