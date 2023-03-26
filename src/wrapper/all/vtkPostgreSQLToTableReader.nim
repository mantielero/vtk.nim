## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPostgreSQLToTableReader.h
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
##  @class   vtkPostgreSQLToTableReader
##  @brief   Read a PostgreSQL table as a vtkTable
##
##  vtkPostgreSQLToTableReader reads a table from a PostgreSQL database and
##  outputs it as a vtkTable.
##

import
  vtkDatabaseToTableReader, vtkIOPostgreSQLModule

discard "forward decl of vtkPostgreSQLDatabase"
type
  vtkPostgreSQLToTableReader* {.importcpp: "vtkPostgreSQLToTableReader",
                               header: "vtkPostgreSQLToTableReader.h", bycopy.} = object of vtkDatabaseToTableReader
    vtkPostgreSQLToTableReader* {.importc: "vtkPostgreSQLToTableReader".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPostgreSQLToTableReader {.
    importcpp: "vtkPostgreSQLToTableReader::New(@)",
    header: "vtkPostgreSQLToTableReader.h".}
type
  vtkPostgreSQLToTableReaderSuperclass* = vtkDatabaseToTableReader

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPostgreSQLToTableReader::IsTypeOf(@)",
    header: "vtkPostgreSQLToTableReader.h".}
proc IsA*(this: var vtkPostgreSQLToTableReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPostgreSQLToTableReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPostgreSQLToTableReader {.
    importcpp: "vtkPostgreSQLToTableReader::SafeDownCast(@)",
    header: "vtkPostgreSQLToTableReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPostgreSQLToTableReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDatabaseToTableReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPostgreSQLToTableReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPostgreSQLToTableReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPostgreSQLToTableReader; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkPostgreSQLToTableReader.h".}