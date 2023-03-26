## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLGenericDataObjectReader.h
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
##  @class   vtkXMLGenericDataObjectReader
##  @brief   Read any type of vtk data object
##
##  vtkXMLGenericDataObjectReader reads any type of vtk data object encoded
##  in XML format.
##
##  @sa
##  vtkGenericDataObjectReader
##

import
  vtkIOXMLModule, vtkSmartPointer, vtkXMLDataReader

discard "forward decl of vtkHierarchicalBoxDataSet"
discard "forward decl of vtkMultiBlockDataSet"
discard "forward decl of vtkImageData"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkRectilinearGrid"
discard "forward decl of vtkStructuredGrid"
discard "forward decl of vtkUnstructuredGrid"
type
  vtkXMLGenericDataObjectReader* {.importcpp: "vtkXMLGenericDataObjectReader",
                                  header: "vtkXMLGenericDataObjectReader.h",
                                  bycopy.} = object of vtkXMLDataReader
    vtkXMLGenericDataObjectReader* {.importc: "vtkXMLGenericDataObjectReader".}: VTK_NEWINSTANCE
    ##  actual reader

  vtkXMLGenericDataObjectReaderSuperclass* = vtkXMLDataReader

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkXMLGenericDataObjectReader::IsTypeOf(@)",
    header: "vtkXMLGenericDataObjectReader.h".}
proc IsA*(this: var vtkXMLGenericDataObjectReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkXMLGenericDataObjectReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkXMLGenericDataObjectReader {.
    importcpp: "vtkXMLGenericDataObjectReader::SafeDownCast(@)",
    header: "vtkXMLGenericDataObjectReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkXMLGenericDataObjectReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLGenericDataObjectReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLGenericDataObjectReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkXMLGenericDataObjectReader; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkXMLGenericDataObjectReader.h".}
proc New*(): ptr vtkXMLGenericDataObjectReader {.
    importcpp: "vtkXMLGenericDataObjectReader::New(@)",
    header: "vtkXMLGenericDataObjectReader.h".}
proc GetOutput*(this: var vtkXMLGenericDataObjectReader): ptr vtkDataObject {.
    importcpp: "GetOutput", header: "vtkXMLGenericDataObjectReader.h".}
proc GetOutput*(this: var vtkXMLGenericDataObjectReader; idx: cint): ptr vtkDataObject {.
    importcpp: "GetOutput", header: "vtkXMLGenericDataObjectReader.h".}
proc GetHierarchicalBoxDataSetOutput*(this: var vtkXMLGenericDataObjectReader): ptr vtkHierarchicalBoxDataSet {.
    importcpp: "GetHierarchicalBoxDataSetOutput",
    header: "vtkXMLGenericDataObjectReader.h".}
proc GetImageDataOutput*(this: var vtkXMLGenericDataObjectReader): ptr vtkImageData {.
    importcpp: "GetImageDataOutput", header: "vtkXMLGenericDataObjectReader.h".}
proc GetMultiBlockDataSetOutput*(this: var vtkXMLGenericDataObjectReader): ptr vtkMultiBlockDataSet {.
    importcpp: "GetMultiBlockDataSetOutput",
    header: "vtkXMLGenericDataObjectReader.h".}
proc GetPolyDataOutput*(this: var vtkXMLGenericDataObjectReader): ptr vtkPolyData {.
    importcpp: "GetPolyDataOutput", header: "vtkXMLGenericDataObjectReader.h".}
proc GetRectilinearGridOutput*(this: var vtkXMLGenericDataObjectReader): ptr vtkRectilinearGrid {.
    importcpp: "GetRectilinearGridOutput",
    header: "vtkXMLGenericDataObjectReader.h".}
proc GetStructuredGridOutput*(this: var vtkXMLGenericDataObjectReader): ptr vtkStructuredGrid {.
    importcpp: "GetStructuredGridOutput",
    header: "vtkXMLGenericDataObjectReader.h".}
proc GetUnstructuredGridOutput*(this: var vtkXMLGenericDataObjectReader): ptr vtkUnstructuredGrid {.
    importcpp: "GetUnstructuredGridOutput",
    header: "vtkXMLGenericDataObjectReader.h".}
proc GetNumberOfPoints*(this: var vtkXMLGenericDataObjectReader): vtkIdType {.
    importcpp: "GetNumberOfPoints", header: "vtkXMLGenericDataObjectReader.h".}
proc GetNumberOfCells*(this: var vtkXMLGenericDataObjectReader): vtkIdType {.
    importcpp: "GetNumberOfCells", header: "vtkXMLGenericDataObjectReader.h".}
proc SetupEmptyOutput*(this: var vtkXMLGenericDataObjectReader) {.
    importcpp: "SetupEmptyOutput", header: "vtkXMLGenericDataObjectReader.h".}
proc ReadOutputType*(this: var vtkXMLGenericDataObjectReader; name: cstring;
                    parallel: var bool): cint {.importcpp: "ReadOutputType",
    header: "vtkXMLGenericDataObjectReader.h".}
proc CreateReader*(data_object_type: cint; parallel: bool): vtkSmartPointer[
    vtkXMLReader] {.importcpp: "vtkXMLGenericDataObjectReader::CreateReader(@)",
                   header: "vtkXMLGenericDataObjectReader.h".}