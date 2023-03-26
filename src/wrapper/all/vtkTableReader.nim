## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTableReader.h
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
##  @class   vtkTableReader
##  @brief   read vtkTable data file
##
##  vtkTableReader is a source object that reads ASCII or binary
##  vtkTable data files in vtk format. (see text for format details).
##  The output of this reader is a single vtkTable data object.
##  The superclass of this class, vtkDataReader, provides many methods for
##  controlling the reading of the data file, see vtkDataReader for more
##  information.
##  @warning
##  Binary files written on one system may not be readable on other systems.
##  @sa
##  vtkTable vtkDataReader vtkTableWriter
##

import
  vtkDataReader, vtkIOLegacyModule

discard "forward decl of vtkTable"
type
  vtkTableReader* {.importcpp: "vtkTableReader", header: "vtkTableReader.h", bycopy.} = object of vtkDataReader
    vtkTableReader* {.importc: "vtkTableReader".}: VTK_NEWINSTANCE


proc New*(): ptr vtkTableReader {.importcpp: "vtkTableReader::New(@)",
                              header: "vtkTableReader.h".}
type
  vtkTableReaderSuperclass* = vtkDataReader

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTableReader::IsTypeOf(@)", header: "vtkTableReader.h".}
proc IsA*(this: var vtkTableReader; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkTableReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTableReader {.
    importcpp: "vtkTableReader::SafeDownCast(@)", header: "vtkTableReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTableReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTableReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTableReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTableReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTableReader.h".}
proc GetOutput*(this: var vtkTableReader): ptr vtkTable {.importcpp: "GetOutput",
    header: "vtkTableReader.h".}
proc GetOutput*(this: var vtkTableReader; idx: cint): ptr vtkTable {.
    importcpp: "GetOutput", header: "vtkTableReader.h".}
proc SetOutput*(this: var vtkTableReader; output: ptr vtkTable) {.
    importcpp: "SetOutput", header: "vtkTableReader.h".}
## !!!Ignored construct:  /@} *
##  Actual reading happens here
##  int ReadMeshSimple ( VTK_FILEPATH const std :: string & fname , vtkDataObject * output ) override ;
## Error: token expected: ) but got: ::!!!
