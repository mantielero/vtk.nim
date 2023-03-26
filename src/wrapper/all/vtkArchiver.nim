## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkArchiver.h
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
##  @class   vtkArchiver
##  @brief   Writes an archive
##
##  vtkArchiver is a base class for constructing an archive. The default
##  implementation constructs a directory at the location of the ArchiveName
##  and populates it with files and directories as requested by Insert().
##  Classes that derive from vtkArchiver can customize the output using such
##  features as compression, in-memory serialization and third-party archival
##  tools.
##

import
  vtkCommonCoreModule, vtkObject

type
  vtkArchiver* {.importcpp: "vtkArchiver", header: "vtkArchiver.h", bycopy.} = object of vtkObject
    vtkArchiver* {.importc: "vtkArchiver".}: VTK_NEWINSTANCE


proc New*(): ptr vtkArchiver {.importcpp: "vtkArchiver::New(@)",
                           header: "vtkArchiver.h".}
type
  vtkArchiverSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkArchiver::IsTypeOf(@)", header: "vtkArchiver.h".}
proc IsA*(this: var vtkArchiver; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkArchiver.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkArchiver {.
    importcpp: "vtkArchiver::SafeDownCast(@)", header: "vtkArchiver.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkArchiver :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkArchiver :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkArchiver :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkArchiver; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkArchiver.h".}
proc GetArchiveName*(this: var vtkArchiver): cstring {.importcpp: "GetArchiveName",
    header: "vtkArchiver.h".}
proc SetArchiveName*(this: var vtkArchiver; _arg: cstring) {.
    importcpp: "SetArchiveName", header: "vtkArchiver.h".}
  ## /@}
  ## /@{
  ## *
  ##  Open the archive for writing.
  ##
proc OpenArchive*(this: var vtkArchiver) {.importcpp: "OpenArchive",
                                       header: "vtkArchiver.h".}
proc CloseArchive*(this: var vtkArchiver) {.importcpp: "CloseArchive",
                                        header: "vtkArchiver.h".}
proc InsertIntoArchive*(this: var vtkArchiver; relativePath: string; data: cstring;
                       size: size_t) {.importcpp: "InsertIntoArchive",
                                     header: "vtkArchiver.h".}
proc Contains*(this: var vtkArchiver; relativePath: string): bool {.
    importcpp: "Contains", header: "vtkArchiver.h".}