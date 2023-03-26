## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    DatabaseSchemaWith2Tables.h
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

import
  vtkTestingIOSQLModule

discard "forward decl of vtkSQLDatabaseSchema"
type
  DatabaseSchemaWith2Tables* {.importcpp: "DatabaseSchemaWith2Tables",
                              header: "DatabaseSchemaWith2Tables.h", bycopy.} = object


proc constructDatabaseSchemaWith2Tables*(): DatabaseSchemaWith2Tables {.
    constructor, importcpp: "DatabaseSchemaWith2Tables(@)",
    header: "DatabaseSchemaWith2Tables.h".}
proc destroyDatabaseSchemaWith2Tables*(this: var DatabaseSchemaWith2Tables) {.
    importcpp: "#.~DatabaseSchemaWith2Tables()",
    header: "DatabaseSchemaWith2Tables.h".}
proc GetSchema*(this: var DatabaseSchemaWith2Tables): ptr vtkSQLDatabaseSchema {.
    importcpp: "GetSchema", header: "DatabaseSchemaWith2Tables.h".}
proc GetTableAHandle*(this: var DatabaseSchemaWith2Tables): cint {.
    importcpp: "GetTableAHandle", header: "DatabaseSchemaWith2Tables.h".}
proc GetTableBHandle*(this: var DatabaseSchemaWith2Tables): cint {.
    importcpp: "GetTableBHandle", header: "DatabaseSchemaWith2Tables.h".}
proc `->`*(this: DatabaseSchemaWith2Tables): ptr vtkSQLDatabaseSchema {.noSideEffect,
    importcpp: "(# -> #)", header: "DatabaseSchemaWith2Tables.h".}
##  VTK-HeaderTest-Exclude: DatabaseSchemaWith2Tables.h
