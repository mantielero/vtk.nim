## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLPStructuredGridReader.h
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
##  @class   vtkXMLPStructuredGridReader
##  @brief   Read PVTK XML StructuredGrid files.
##
##  vtkXMLPStructuredGridReader reads the PVTK XML StructuredGrid file
##  format.  This reads the parallel format's summary file and then
##  uses vtkXMLStructuredGridReader to read data from the individual
##  StructuredGrid piece files.  Streaming is supported.  The standard
##  extension for this reader's file format is "pvts".
##
##  @sa
##  vtkXMLStructuredGridReader
##

import
  vtkIOXMLModule, vtkXMLPStructuredDataReader

discard "forward decl of vtkStructuredGrid"
type
  vtkXMLPStructuredGridReader* {.importcpp: "vtkXMLPStructuredGridReader",
                                header: "vtkXMLPStructuredGridReader.h", bycopy.} = object of vtkXMLPStructuredDataReader
    vtkXMLPStructuredGridReader* {.importc: "vtkXMLPStructuredGridReader".}: VTK_NEWINSTANCE

  vtkXMLPStructuredGridReaderSuperclass* = vtkXMLPStructuredDataReader

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkXMLPStructuredGridReader::IsTypeOf(@)",
    header: "vtkXMLPStructuredGridReader.h".}
proc IsA*(this: var vtkXMLPStructuredGridReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkXMLPStructuredGridReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkXMLPStructuredGridReader {.
    importcpp: "vtkXMLPStructuredGridReader::SafeDownCast(@)",
    header: "vtkXMLPStructuredGridReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkXMLPStructuredGridReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLPStructuredDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLPStructuredGridReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLPStructuredGridReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkXMLPStructuredGridReader; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkXMLPStructuredGridReader.h".}
proc New*(): ptr vtkXMLPStructuredGridReader {.
    importcpp: "vtkXMLPStructuredGridReader::New(@)",
    header: "vtkXMLPStructuredGridReader.h".}
proc GetOutput*(this: var vtkXMLPStructuredGridReader): ptr vtkStructuredGrid {.
    importcpp: "GetOutput", header: "vtkXMLPStructuredGridReader.h".}
proc GetOutput*(this: var vtkXMLPStructuredGridReader; idx: cint): ptr vtkStructuredGrid {.
    importcpp: "GetOutput", header: "vtkXMLPStructuredGridReader.h".}