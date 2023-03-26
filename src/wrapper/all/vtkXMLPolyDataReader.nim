## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLPolyDataReader.h
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
##  @class   vtkXMLPolyDataReader
##  @brief   Read VTK XML PolyData files.
##
##  vtkXMLPolyDataReader reads the VTK XML PolyData file format.  One
##  polygonal data file can be read to produce one output.  Streaming
##  is supported.  The standard extension for this reader's file format
##  is "vtp".  This reader is also used to read a single piece of the
##  parallel file format.
##
##  @sa
##  vtkXMLPPolyDataReader
##

import
  vtkIOXMLModule, vtkXMLUnstructuredDataReader

discard "forward decl of vtkPolyData"
type
  vtkXMLPolyDataReader* {.importcpp: "vtkXMLPolyDataReader",
                         header: "vtkXMLPolyDataReader.h", bycopy.} = object of vtkXMLUnstructuredDataReader
    vtkXMLPolyDataReader* {.importc: "vtkXMLPolyDataReader".}: VTK_NEWINSTANCE
    ##  The cell elements for each piece.
    ##  For TimeStep support

  vtkXMLPolyDataReaderSuperclass* = vtkXMLUnstructuredDataReader

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkXMLPolyDataReader::IsTypeOf(@)",
    header: "vtkXMLPolyDataReader.h".}
proc IsA*(this: var vtkXMLPolyDataReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkXMLPolyDataReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkXMLPolyDataReader {.
    importcpp: "vtkXMLPolyDataReader::SafeDownCast(@)",
    header: "vtkXMLPolyDataReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkXMLPolyDataReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLUnstructuredDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLPolyDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLPolyDataReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkXMLPolyDataReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkXMLPolyDataReader.h".}
proc New*(): ptr vtkXMLPolyDataReader {.importcpp: "vtkXMLPolyDataReader::New(@)",
                                    header: "vtkXMLPolyDataReader.h".}
proc GetOutput*(this: var vtkXMLPolyDataReader): ptr vtkPolyData {.
    importcpp: "GetOutput", header: "vtkXMLPolyDataReader.h".}
proc GetOutput*(this: var vtkXMLPolyDataReader; idx: cint): ptr vtkPolyData {.
    importcpp: "GetOutput", header: "vtkXMLPolyDataReader.h".}
proc GetNumberOfVerts*(this: var vtkXMLPolyDataReader): vtkIdType {.
    importcpp: "GetNumberOfVerts", header: "vtkXMLPolyDataReader.h".}
proc GetNumberOfLines*(this: var vtkXMLPolyDataReader): vtkIdType {.
    importcpp: "GetNumberOfLines", header: "vtkXMLPolyDataReader.h".}
proc GetNumberOfStrips*(this: var vtkXMLPolyDataReader): vtkIdType {.
    importcpp: "GetNumberOfStrips", header: "vtkXMLPolyDataReader.h".}
proc GetNumberOfPolys*(this: var vtkXMLPolyDataReader): vtkIdType {.
    importcpp: "GetNumberOfPolys", header: "vtkXMLPolyDataReader.h".}