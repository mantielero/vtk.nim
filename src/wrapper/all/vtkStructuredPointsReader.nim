## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkStructuredPointsReader.h
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
##  @class   vtkStructuredPointsReader
##  @brief   read vtk structured points data file
##
##  vtkStructuredPointsReader is a source object that reads ASCII or binary
##  structured points data files in vtk format (see text for format details).
##  The output of this reader is a single vtkStructuredPoints data object.
##  The superclass of this class, vtkDataReader, provides many methods for
##  controlling the reading of the data file, see vtkDataReader for more
##  information.
##  @warning
##  Binary files written on one system may not be readable on other systems.
##  @sa
##  vtkStructuredPoints vtkDataReader
##

import
  vtkDataReader, vtkIOLegacyModule

discard "forward decl of vtkStructuredPoints"
type
  vtkStructuredPointsReader* {.importcpp: "vtkStructuredPointsReader",
                              header: "vtkStructuredPointsReader.h", bycopy.} = object of vtkDataReader
    vtkStructuredPointsReader* {.importc: "vtkStructuredPointsReader".}: VTK_NEWINSTANCE


proc New*(): ptr vtkStructuredPointsReader {.
    importcpp: "vtkStructuredPointsReader::New(@)",
    header: "vtkStructuredPointsReader.h".}
type
  vtkStructuredPointsReaderSuperclass* = vtkDataReader

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkStructuredPointsReader::IsTypeOf(@)",
    header: "vtkStructuredPointsReader.h".}
proc IsA*(this: var vtkStructuredPointsReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkStructuredPointsReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkStructuredPointsReader {.
    importcpp: "vtkStructuredPointsReader::SafeDownCast(@)",
    header: "vtkStructuredPointsReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkStructuredPointsReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkStructuredPointsReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkStructuredPointsReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkStructuredPointsReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkStructuredPointsReader.h".}
proc SetOutput*(this: var vtkStructuredPointsReader; output: ptr vtkStructuredPoints) {.
    importcpp: "SetOutput", header: "vtkStructuredPointsReader.h".}
proc GetOutput*(this: var vtkStructuredPointsReader; idx: cint): ptr vtkStructuredPoints {.
    importcpp: "GetOutput", header: "vtkStructuredPointsReader.h".}
proc GetOutput*(this: var vtkStructuredPointsReader): ptr vtkStructuredPoints {.
    importcpp: "GetOutput", header: "vtkStructuredPointsReader.h".}
## !!!Ignored construct:  /@} *
##  Read the meta information from the file (WHOLE_EXTENT).
##  int ReadMetaDataSimple ( VTK_FILEPATH const std :: string & fname , vtkInformation * metadata ) override ;
## Error: token expected: ) but got: ::!!!

## !!!Ignored construct:  *
##  Actual reading happens here
##  int ReadMeshSimple ( VTK_FILEPATH const std :: string & fname , vtkDataObject * output ) override ;
## Error: token expected: ) but got: ::!!!
