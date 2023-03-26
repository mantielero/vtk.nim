## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTableToSQLiteWriter.h
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
##  @class   vtkTableToSQLiteWriter
##  @brief   store a vtkTable in an SQLite database
##
##  vtkTableToSQLiteWriter reads a vtkTable and inserts it into an SQLite
##  database.
##

import
  vtkIOSQLModule, vtkTableToDatabaseWriter

discard "forward decl of vtkSQLiteDatabase"
type
  vtkTableToSQLiteWriter* {.importcpp: "vtkTableToSQLiteWriter",
                           header: "vtkTableToSQLiteWriter.h", bycopy.} = object of vtkTableToDatabaseWriter
    vtkTableToSQLiteWriter* {.importc: "vtkTableToSQLiteWriter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkTableToSQLiteWriter {.importcpp: "vtkTableToSQLiteWriter::New(@)",
                                      header: "vtkTableToSQLiteWriter.h".}
type
  vtkTableToSQLiteWriterSuperclass* = vtkTableToDatabaseWriter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTableToSQLiteWriter::IsTypeOf(@)",
    header: "vtkTableToSQLiteWriter.h".}
proc IsA*(this: var vtkTableToSQLiteWriter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTableToSQLiteWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTableToSQLiteWriter {.
    importcpp: "vtkTableToSQLiteWriter::SafeDownCast(@)",
    header: "vtkTableToSQLiteWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTableToSQLiteWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTableToDatabaseWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTableToSQLiteWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTableToSQLiteWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTableToSQLiteWriter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTableToSQLiteWriter.h".}
proc GetInput*(this: var vtkTableToSQLiteWriter): ptr vtkTable {.
    importcpp: "GetInput", header: "vtkTableToSQLiteWriter.h".}
proc GetInput*(this: var vtkTableToSQLiteWriter; port: cint): ptr vtkTable {.
    importcpp: "GetInput", header: "vtkTableToSQLiteWriter.h".}