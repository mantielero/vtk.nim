## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLPUnstructuredGridReader.h
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
##  @class   vtkXMLPUnstructuredGridReader
##  @brief   Read PVTK XML UnstructuredGrid files.
##
##  vtkXMLPUnstructuredGridReader reads the PVTK XML UnstructuredGrid
##  file format.  This reads the parallel format's summary file and
##  then uses vtkXMLUnstructuredGridReader to read data from the
##  individual UnstructuredGrid piece files.  Streaming is supported.
##  The standard extension for this reader's file format is "pvtu".
##
##  @sa
##  vtkXMLUnstructuredGridReader
##

import
  vtkIOXMLModule, vtkXMLPUnstructuredDataReader

discard "forward decl of vtkAbstractArray"
discard "forward decl of vtkUnstructuredGrid"
type
  vtkXMLPUnstructuredGridReader* {.importcpp: "vtkXMLPUnstructuredGridReader",
                                  header: "vtkXMLPUnstructuredGridReader.h",
                                  bycopy.} = object of vtkXMLPUnstructuredDataReader
    vtkXMLPUnstructuredGridReader* {.importc: "vtkXMLPUnstructuredGridReader".}: VTK_NEWINSTANCE

  vtkXMLPUnstructuredGridReaderSuperclass* = vtkXMLPUnstructuredDataReader

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkXMLPUnstructuredGridReader::IsTypeOf(@)",
    header: "vtkXMLPUnstructuredGridReader.h".}
proc IsA*(this: var vtkXMLPUnstructuredGridReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkXMLPUnstructuredGridReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkXMLPUnstructuredGridReader {.
    importcpp: "vtkXMLPUnstructuredGridReader::SafeDownCast(@)",
    header: "vtkXMLPUnstructuredGridReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkXMLPUnstructuredGridReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLPUnstructuredDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLPUnstructuredGridReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLPUnstructuredGridReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkXMLPUnstructuredGridReader; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkXMLPUnstructuredGridReader.h".}
proc New*(): ptr vtkXMLPUnstructuredGridReader {.
    importcpp: "vtkXMLPUnstructuredGridReader::New(@)",
    header: "vtkXMLPUnstructuredGridReader.h".}
proc GetOutput*(this: var vtkXMLPUnstructuredGridReader): ptr vtkUnstructuredGrid {.
    importcpp: "GetOutput", header: "vtkXMLPUnstructuredGridReader.h".}
proc GetOutput*(this: var vtkXMLPUnstructuredGridReader; idx: cint): ptr vtkUnstructuredGrid {.
    importcpp: "GetOutput", header: "vtkXMLPUnstructuredGridReader.h".}