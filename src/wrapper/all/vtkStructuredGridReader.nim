## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkStructuredGridReader.h
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
##  @class   vtkStructuredGridReader
##  @brief   read vtk structured grid data file
##
##  vtkStructuredGridReader is a source object that reads ASCII or binary
##  structured grid data files in vtk format. (see text for format details).
##  The output of this reader is a single vtkStructuredGrid data object.
##  The superclass of this class, vtkDataReader, provides many methods for
##  controlling the reading of the data file, see vtkDataReader for more
##  information.
##  @warning
##  Binary files written on one system may not be readable on other systems.
##  @sa
##  vtkStructuredGrid vtkDataReader
##

import
  vtkDataReader, vtkIOLegacyModule

discard "forward decl of vtkStructuredGrid"
type
  vtkStructuredGridReader* {.importcpp: "vtkStructuredGridReader",
                            header: "vtkStructuredGridReader.h", bycopy.} = object of vtkDataReader
    vtkStructuredGridReader* {.importc: "vtkStructuredGridReader".}: VTK_NEWINSTANCE


proc New*(): ptr vtkStructuredGridReader {.importcpp: "vtkStructuredGridReader::New(@)",
                                       header: "vtkStructuredGridReader.h".}
type
  vtkStructuredGridReaderSuperclass* = vtkDataReader

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkStructuredGridReader::IsTypeOf(@)",
    header: "vtkStructuredGridReader.h".}
proc IsA*(this: var vtkStructuredGridReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkStructuredGridReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkStructuredGridReader {.
    importcpp: "vtkStructuredGridReader::SafeDownCast(@)",
    header: "vtkStructuredGridReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkStructuredGridReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkStructuredGridReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkStructuredGridReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkStructuredGridReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkStructuredGridReader.h".}
proc GetOutput*(this: var vtkStructuredGridReader): ptr vtkStructuredGrid {.
    importcpp: "GetOutput", header: "vtkStructuredGridReader.h".}
proc GetOutput*(this: var vtkStructuredGridReader; idx: cint): ptr vtkStructuredGrid {.
    importcpp: "GetOutput", header: "vtkStructuredGridReader.h".}
proc SetOutput*(this: var vtkStructuredGridReader; output: ptr vtkStructuredGrid) {.
    importcpp: "SetOutput", header: "vtkStructuredGridReader.h".}
## !!!Ignored construct:  /@} *
##  Read the meta information from the file (WHOLE_EXTENT).
##  int ReadMetaDataSimple ( VTK_FILEPATH const std :: string & fname , vtkInformation * metadata ) override ;
## Error: token expected: ) but got: ::!!!

## !!!Ignored construct:  *
##  Actual reading happens here
##  int ReadMeshSimple ( VTK_FILEPATH const std :: string & fname , vtkDataObject * output ) override ;
## Error: token expected: ) but got: ::!!!
