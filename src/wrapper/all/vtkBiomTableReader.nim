## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBiomTableReader.h
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
##  @class   vtkBiomTableReader
##  @brief   read vtkTable from a .biom input file
##
##  vtkBiomTableReader is a source object that reads ASCII biom data files.
##  The output of this reader is a single vtkTable data object.
##  @sa
##  vtkTable vtkTableReader vtkDataReader
##

import
  vtkIOInfovisModule, vtkTableReader

discard "forward decl of vtkTable"
discard "forward decl of vtkVariant"
type
  vtkBiomTableReader* {.importcpp: "vtkBiomTableReader",
                       header: "vtkBiomTableReader.h", bycopy.} = object of vtkTableReader
    vtkBiomTableReader* {.importc: "vtkBiomTableReader".}: VTK_NEWINSTANCE


proc New*(): ptr vtkBiomTableReader {.importcpp: "vtkBiomTableReader::New(@)",
                                  header: "vtkBiomTableReader.h".}
type
  vtkBiomTableReaderSuperclass* = vtkTableReader

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkBiomTableReader::IsTypeOf(@)", header: "vtkBiomTableReader.h".}
proc IsA*(this: var vtkBiomTableReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkBiomTableReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBiomTableReader {.
    importcpp: "vtkBiomTableReader::SafeDownCast(@)",
    header: "vtkBiomTableReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBiomTableReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTableReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBiomTableReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBiomTableReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkBiomTableReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkBiomTableReader.h".}
proc GetOutput*(this: var vtkBiomTableReader): ptr vtkTable {.importcpp: "GetOutput",
    header: "vtkBiomTableReader.h".}
proc GetOutput*(this: var vtkBiomTableReader; idx: cint): ptr vtkTable {.
    importcpp: "GetOutput", header: "vtkBiomTableReader.h".}
proc SetOutput*(this: var vtkBiomTableReader; output: ptr vtkTable) {.
    importcpp: "SetOutput", header: "vtkBiomTableReader.h".}
## !!!Ignored construct:  /@} *
##  Actual reading happens here
##  int ReadMeshSimple ( VTK_FILEPATH const std :: string & fname , vtkDataObject * output ) override ;
## Error: token expected: ) but got: ::!!!
