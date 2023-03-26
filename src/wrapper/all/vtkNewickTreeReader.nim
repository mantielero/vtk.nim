## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkNewickTreeReader.h
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
##  @class   vtkNewickTreeReader
##  @brief   read vtkTree from Newick formatted file
##
##  vtkNewickTreeReader is a source object that reads Newick tree format
##  files.
##  The output of this reader is a single vtkTree data object.
##  The superclass of this class, vtkDataReader, provides many methods for
##  controlling the reading of the data file, see vtkDataReader for more
##  information.
##  @par Thanks:
##  This class is adapted from code originally written by Yu-Wei Wu.
##  @sa
##  vtkTree vtkDataReader
##

import
  vtkDataReader, vtkIOInfovisModule

discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkMutableDirectedGraph"
discard "forward decl of vtkStringArray"
discard "forward decl of vtkTree"
type
  vtkNewickTreeReader* {.importcpp: "vtkNewickTreeReader",
                        header: "vtkNewickTreeReader.h", bycopy.} = object of vtkDataReader
    vtkNewickTreeReader* {.importc: "vtkNewickTreeReader".}: VTK_NEWINSTANCE


proc New*(): ptr vtkNewickTreeReader {.importcpp: "vtkNewickTreeReader::New(@)",
                                   header: "vtkNewickTreeReader.h".}
type
  vtkNewickTreeReaderSuperclass* = vtkDataReader

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkNewickTreeReader::IsTypeOf(@)", header: "vtkNewickTreeReader.h".}
proc IsA*(this: var vtkNewickTreeReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkNewickTreeReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkNewickTreeReader {.
    importcpp: "vtkNewickTreeReader::SafeDownCast(@)",
    header: "vtkNewickTreeReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkNewickTreeReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkNewickTreeReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkNewickTreeReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkNewickTreeReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkNewickTreeReader.h".}
proc GetOutput*(this: var vtkNewickTreeReader): ptr vtkTree {.importcpp: "GetOutput",
    header: "vtkNewickTreeReader.h".}
proc GetOutput*(this: var vtkNewickTreeReader; idx: cint): ptr vtkTree {.
    importcpp: "GetOutput", header: "vtkNewickTreeReader.h".}
proc SetOutput*(this: var vtkNewickTreeReader; output: ptr vtkTree) {.
    importcpp: "SetOutput", header: "vtkNewickTreeReader.h".}
proc ReadNewickTree*(this: var vtkNewickTreeReader; buffer: cstring; tree: var vtkTree): cint {.
    importcpp: "ReadNewickTree", header: "vtkNewickTreeReader.h".}
## !!!Ignored construct:  /@} *
##  Actual reading happens here
##  int ReadMeshSimple ( VTK_FILEPATH const std :: string & fname , vtkDataObject * output ) override ;
## Error: token expected: ) but got: ::!!!
