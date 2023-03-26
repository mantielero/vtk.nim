## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLPPolyDataWriter.h
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
##  @class   vtkXMLPPolyDataWriter
##  @brief   Write PVTK XML PolyData files.
##
##  vtkXMLPPolyDataWriter writes the PVTK XML PolyData file format.
##  One poly data input can be written into a parallel file format with
##  any number of pieces spread across files.  The standard extension
##  for this writer's file format is "pvtp".  This writer uses
##  vtkXMLPolyDataWriter to write the individual piece files.
##
##  @sa
##  vtkXMLPolyDataWriter
##

import
  vtkIOParallelXMLModule, vtkXMLPUnstructuredDataWriter

discard "forward decl of vtkPolyData"
type
  vtkXMLPPolyDataWriter* {.importcpp: "vtkXMLPPolyDataWriter",
                          header: "vtkXMLPPolyDataWriter.h", bycopy.} = object of vtkXMLPUnstructuredDataWriter
    vtkXMLPPolyDataWriter* {.importc: "vtkXMLPPolyDataWriter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkXMLPPolyDataWriter {.importcpp: "vtkXMLPPolyDataWriter::New(@)",
                                     header: "vtkXMLPPolyDataWriter.h".}
type
  vtkXMLPPolyDataWriterSuperclass* = vtkXMLPUnstructuredDataWriter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkXMLPPolyDataWriter::IsTypeOf(@)",
    header: "vtkXMLPPolyDataWriter.h".}
proc IsA*(this: var vtkXMLPPolyDataWriter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkXMLPPolyDataWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkXMLPPolyDataWriter {.
    importcpp: "vtkXMLPPolyDataWriter::SafeDownCast(@)",
    header: "vtkXMLPPolyDataWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkXMLPPolyDataWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLPUnstructuredDataWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLPPolyDataWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLPPolyDataWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkXMLPPolyDataWriter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkXMLPPolyDataWriter.h".}
proc GetInput*(this: var vtkXMLPPolyDataWriter): ptr vtkPolyData {.
    importcpp: "GetInput", header: "vtkXMLPPolyDataWriter.h".}
proc GetDefaultFileExtension*(this: var vtkXMLPPolyDataWriter): cstring {.
    importcpp: "GetDefaultFileExtension", header: "vtkXMLPPolyDataWriter.h".}