## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTableToMySQLWriter.h
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
##  @class   vtkTableToMySQLWriter
##  @brief   store a vtkTable in a MySQL database
##
##  vtkTableToMySQLWriter reads a vtkTable and inserts it into a MySQL
##  database.
##

import
  vtkIOMySQLModule, vtkTableToDatabaseWriter

discard "forward decl of vtkMySQLDatabase"
type
  vtkTableToMySQLWriter* {.importcpp: "vtkTableToMySQLWriter",
                          header: "vtkTableToMySQLWriter.h", bycopy.} = object of vtkTableToDatabaseWriter
    vtkTableToMySQLWriter* {.importc: "vtkTableToMySQLWriter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkTableToMySQLWriter {.importcpp: "vtkTableToMySQLWriter::New(@)",
                                     header: "vtkTableToMySQLWriter.h".}
type
  vtkTableToMySQLWriterSuperclass* = vtkTableToDatabaseWriter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTableToMySQLWriter::IsTypeOf(@)",
    header: "vtkTableToMySQLWriter.h".}
proc IsA*(this: var vtkTableToMySQLWriter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTableToMySQLWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTableToMySQLWriter {.
    importcpp: "vtkTableToMySQLWriter::SafeDownCast(@)",
    header: "vtkTableToMySQLWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTableToMySQLWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTableToDatabaseWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTableToMySQLWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTableToMySQLWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTableToMySQLWriter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTableToMySQLWriter.h".}
proc GetInput*(this: var vtkTableToMySQLWriter): ptr vtkTable {.importcpp: "GetInput",
    header: "vtkTableToMySQLWriter.h".}
proc GetInput*(this: var vtkTableToMySQLWriter; port: cint): ptr vtkTable {.
    importcpp: "GetInput", header: "vtkTableToMySQLWriter.h".}