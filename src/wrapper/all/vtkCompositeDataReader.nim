## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCompositeDataReader.h
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
##  @class   vtkCompositeDataReader
##  @brief   read vtkCompositeDataSet data file.
##
##  @warning
##  This is an experimental format. Use XML-based formats for writing composite
##  datasets. Saving composite dataset in legacy VTK format is expected to change
##  in future including changes to the file layout.
##

import
  vtkDataReader, vtkIOLegacyModule

discard "forward decl of vtkCompositeDataSet"
discard "forward decl of vtkHierarchicalBoxDataSet"
discard "forward decl of vtkMultiBlockDataSet"
discard "forward decl of vtkMultiPieceDataSet"
discard "forward decl of vtkNonOverlappingAMR"
discard "forward decl of vtkOverlappingAMR"
discard "forward decl of vtkPartitionedDataSet"
discard "forward decl of vtkPartitionedDataSetCollection"
type
  vtkCompositeDataReader* {.importcpp: "vtkCompositeDataReader",
                           header: "vtkCompositeDataReader.h", bycopy.} = object of vtkDataReader
    vtkCompositeDataReader* {.importc: "vtkCompositeDataReader".}: VTK_NEWINSTANCE


proc New*(): ptr vtkCompositeDataReader {.importcpp: "vtkCompositeDataReader::New(@)",
                                      header: "vtkCompositeDataReader.h".}
type
  vtkCompositeDataReaderSuperclass* = vtkDataReader

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCompositeDataReader::IsTypeOf(@)",
    header: "vtkCompositeDataReader.h".}
proc IsA*(this: var vtkCompositeDataReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkCompositeDataReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCompositeDataReader {.
    importcpp: "vtkCompositeDataReader::SafeDownCast(@)",
    header: "vtkCompositeDataReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCompositeDataReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCompositeDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCompositeDataReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCompositeDataReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCompositeDataReader.h".}
proc GetOutput*(this: var vtkCompositeDataReader): ptr vtkCompositeDataSet {.
    importcpp: "GetOutput", header: "vtkCompositeDataReader.h".}
proc GetOutput*(this: var vtkCompositeDataReader; idx: cint): ptr vtkCompositeDataSet {.
    importcpp: "GetOutput", header: "vtkCompositeDataReader.h".}
proc SetOutput*(this: var vtkCompositeDataReader; output: ptr vtkCompositeDataSet) {.
    importcpp: "SetOutput", header: "vtkCompositeDataReader.h".}
## !!!Ignored construct:  /@} *
##  Actual reading happens here
##  int ReadMeshSimple ( VTK_FILEPATH const std :: string & fname , vtkDataObject * output ) override ;
## Error: token expected: ) but got: ::!!!
