## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLPPolyDataReader.h
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
##  @class   vtkXMLPPolyDataReader
##  @brief   Read PVTK XML PolyData files.
##
##  vtkXMLPPolyDataReader reads the PVTK XML PolyData file format.
##  This reads the parallel format's summary file and then uses
##  vtkXMLPolyDataReader to read data from the individual PolyData
##  piece files.  Streaming is supported.  The standard extension for
##  this reader's file format is "pvtp".
##
##  @sa
##  vtkXMLPolyDataReader
##

import
  vtkIOXMLModule, vtkXMLPUnstructuredDataReader

discard "forward decl of vtkAbstractArray"
discard "forward decl of vtkPolyData"
type
  vtkXMLPPolyDataReader* {.importcpp: "vtkXMLPPolyDataReader",
                          header: "vtkXMLPPolyDataReader.h", bycopy.} = object of vtkXMLPUnstructuredDataReader
    vtkXMLPPolyDataReader* {.importc: "vtkXMLPPolyDataReader".}: VTK_NEWINSTANCE

  vtkXMLPPolyDataReaderSuperclass* = vtkXMLPUnstructuredDataReader

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkXMLPPolyDataReader::IsTypeOf(@)",
    header: "vtkXMLPPolyDataReader.h".}
proc IsA*(this: var vtkXMLPPolyDataReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkXMLPPolyDataReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkXMLPPolyDataReader {.
    importcpp: "vtkXMLPPolyDataReader::SafeDownCast(@)",
    header: "vtkXMLPPolyDataReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkXMLPPolyDataReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLPUnstructuredDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLPPolyDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLPPolyDataReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkXMLPPolyDataReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkXMLPPolyDataReader.h".}
proc New*(): ptr vtkXMLPPolyDataReader {.importcpp: "vtkXMLPPolyDataReader::New(@)",
                                     header: "vtkXMLPPolyDataReader.h".}
proc GetOutput*(this: var vtkXMLPPolyDataReader): ptr vtkPolyData {.
    importcpp: "GetOutput", header: "vtkXMLPPolyDataReader.h".}
proc GetOutput*(this: var vtkXMLPPolyDataReader; idx: cint): ptr vtkPolyData {.
    importcpp: "GetOutput", header: "vtkXMLPPolyDataReader.h".}