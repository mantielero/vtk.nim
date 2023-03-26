## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPartitionedArchiver.h
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
##  @class   vtkPartitionedArchiver
##  @brief   Writes an archive to several buffers
##
##  vtkPartitionedArchiver is a specialized archiver for writing datasets into
##  several memory buffers with zip compression. Each insertion into the archiver
##  is assigned to its own buffer.
##
##  @sa
##  vtkArchiver
##

import
  vtkCommonArchiveModule, vtkArchiver

type
  vtkPartitionedArchiver* {.importcpp: "vtkPartitionedArchiver",
                           header: "vtkPartitionedArchiver.h", bycopy.} = object of vtkArchiver
    vtkPartitionedArchiver* {.importc: "vtkPartitionedArchiver".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPartitionedArchiver {.importcpp: "vtkPartitionedArchiver::New(@)",
                                      header: "vtkPartitionedArchiver.h".}
type
  vtkPartitionedArchiverSuperclass* = vtkArchiver

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPartitionedArchiver::IsTypeOf(@)",
    header: "vtkPartitionedArchiver.h".}
proc IsA*(this: var vtkPartitionedArchiver; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPartitionedArchiver.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPartitionedArchiver {.
    importcpp: "vtkPartitionedArchiver::SafeDownCast(@)",
    header: "vtkPartitionedArchiver.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPartitionedArchiver :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkArchiver :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPartitionedArchiver :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPartitionedArchiver :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPartitionedArchiver; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPartitionedArchiver.h".}
proc OpenArchive*(this: var vtkPartitionedArchiver) {.importcpp: "OpenArchive",
    header: "vtkPartitionedArchiver.h".}
proc CloseArchive*(this: var vtkPartitionedArchiver) {.importcpp: "CloseArchive",
    header: "vtkPartitionedArchiver.h".}
proc InsertIntoArchive*(this: var vtkPartitionedArchiver; relativePath: string;
                       data: cstring; size: size_t) {.
    importcpp: "InsertIntoArchive", header: "vtkPartitionedArchiver.h".}
proc Contains*(this: var vtkPartitionedArchiver; relativePath: string): bool {.
    importcpp: "Contains", header: "vtkPartitionedArchiver.h".}
proc GetBuffer*(this: var vtkPartitionedArchiver; relativePath: cstring): cstring {.
    importcpp: "GetBuffer", header: "vtkPartitionedArchiver.h".}
proc GetBufferAddress*(this: var vtkPartitionedArchiver; relativePath: cstring): pointer {.
    importcpp: "GetBufferAddress", header: "vtkPartitionedArchiver.h".}
proc GetBufferSize*(this: var vtkPartitionedArchiver; relativePath: cstring): size_t {.
    importcpp: "GetBufferSize", header: "vtkPartitionedArchiver.h".}
proc GetNumberOfBuffers*(this: var vtkPartitionedArchiver): size_t {.
    importcpp: "GetNumberOfBuffers", header: "vtkPartitionedArchiver.h".}
proc GetBufferName*(this: var vtkPartitionedArchiver; i: size_t): cstring {.
    importcpp: "GetBufferName", header: "vtkPartitionedArchiver.h".}