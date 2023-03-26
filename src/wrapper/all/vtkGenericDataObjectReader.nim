## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGenericDataObjectReader.h
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
##  @class   vtkGenericDataObjectReader
##  @brief   class to read any type of vtk data object
##
##  vtkGenericDataObjectReader is a class that provides instance variables and methods
##  to read any type of data object in Visualization Toolkit (vtk) format.  The
##  output type of this class will vary depending upon the type of data
##  file. Convenience methods are provided to return the data as a particular
##  type. (See text for format description details).
##  The superclass of this class, vtkDataReader, provides many methods for
##  controlling the reading of the data file, see vtkDataReader for more
##  information.
##  @warning
##  Binary files written on one system may not be readable on other systems.
##  @sa
##  vtkDataReader vtkGraphReader vtkPolyDataReader vtkRectilinearGridReader
##  vtkStructuredPointsReader vtkStructuredGridReader vtkTableReader
##  vtkTreeReader vtkUnstructuredGridReader
##

import
  vtkDataReader, vtkIOLegacyModule

discard "forward decl of vtkDataObject"
discard "forward decl of vtkGraph"
discard "forward decl of vtkMolecule"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkRectilinearGrid"
discard "forward decl of vtkStructuredGrid"
discard "forward decl of vtkStructuredPoints"
discard "forward decl of vtkTable"
discard "forward decl of vtkTree"
discard "forward decl of vtkUnstructuredGrid"
type
  vtkGenericDataObjectReader* {.importcpp: "vtkGenericDataObjectReader",
                               header: "vtkGenericDataObjectReader.h", bycopy.} = object of vtkDataReader
    vtkGenericDataObjectReader* {.importc: "vtkGenericDataObjectReader".}: VTK_NEWINSTANCE


proc New*(): ptr vtkGenericDataObjectReader {.
    importcpp: "vtkGenericDataObjectReader::New(@)",
    header: "vtkGenericDataObjectReader.h".}
type
  vtkGenericDataObjectReaderSuperclass* = vtkDataReader

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGenericDataObjectReader::IsTypeOf(@)",
    header: "vtkGenericDataObjectReader.h".}
proc IsA*(this: var vtkGenericDataObjectReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkGenericDataObjectReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGenericDataObjectReader {.
    importcpp: "vtkGenericDataObjectReader::SafeDownCast(@)",
    header: "vtkGenericDataObjectReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGenericDataObjectReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGenericDataObjectReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGenericDataObjectReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGenericDataObjectReader; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkGenericDataObjectReader.h".}
proc GetOutput*(this: var vtkGenericDataObjectReader): ptr vtkDataObject {.
    importcpp: "GetOutput", header: "vtkGenericDataObjectReader.h".}
proc GetOutput*(this: var vtkGenericDataObjectReader; idx: cint): ptr vtkDataObject {.
    importcpp: "GetOutput", header: "vtkGenericDataObjectReader.h".}
proc GetGraphOutput*(this: var vtkGenericDataObjectReader): ptr vtkGraph {.
    importcpp: "GetGraphOutput", header: "vtkGenericDataObjectReader.h".}
proc GetMoleculeOutput*(this: var vtkGenericDataObjectReader): ptr vtkMolecule {.
    importcpp: "GetMoleculeOutput", header: "vtkGenericDataObjectReader.h".}
proc GetPolyDataOutput*(this: var vtkGenericDataObjectReader): ptr vtkPolyData {.
    importcpp: "GetPolyDataOutput", header: "vtkGenericDataObjectReader.h".}
proc GetRectilinearGridOutput*(this: var vtkGenericDataObjectReader): ptr vtkRectilinearGrid {.
    importcpp: "GetRectilinearGridOutput", header: "vtkGenericDataObjectReader.h".}
proc GetStructuredGridOutput*(this: var vtkGenericDataObjectReader): ptr vtkStructuredGrid {.
    importcpp: "GetStructuredGridOutput", header: "vtkGenericDataObjectReader.h".}
proc GetStructuredPointsOutput*(this: var vtkGenericDataObjectReader): ptr vtkStructuredPoints {.
    importcpp: "GetStructuredPointsOutput", header: "vtkGenericDataObjectReader.h".}
proc GetTableOutput*(this: var vtkGenericDataObjectReader): ptr vtkTable {.
    importcpp: "GetTableOutput", header: "vtkGenericDataObjectReader.h".}
proc GetTreeOutput*(this: var vtkGenericDataObjectReader): ptr vtkTree {.
    importcpp: "GetTreeOutput", header: "vtkGenericDataObjectReader.h".}
proc GetUnstructuredGridOutput*(this: var vtkGenericDataObjectReader): ptr vtkUnstructuredGrid {.
    importcpp: "GetUnstructuredGridOutput", header: "vtkGenericDataObjectReader.h".}
proc ReadOutputType*(this: var vtkGenericDataObjectReader): cint {.
    importcpp: "ReadOutputType", header: "vtkGenericDataObjectReader.h".}
## !!!Ignored construct:  *
##  Read metadata from file.
##  int ReadMetaDataSimple ( VTK_FILEPATH const std :: string & fname , vtkInformation * metadata ) override ;
## Error: token expected: ) but got: ::!!!

## !!!Ignored construct:  *
##  Actual reading happens here
##  int ReadMeshSimple ( VTK_FILEPATH const std :: string & fname , vtkDataObject * output ) override ;
## Error: token expected: ) but got: ::!!!
