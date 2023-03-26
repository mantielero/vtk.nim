## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLPTableWriter.h
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
##  @class   vtkXMLPTableWriter
##  @brief   Write PVTK XML UnstructuredGrid files.
##
##  vtkXMLPTableWriter writes the PVTK XML Table
##  file format.  One table input can be written into a
##  parallel file format with any number of pieces spread across files.
##  The standard extension for this writer's file format is "pvtt".
##  This writer uses vtkXMLTableWriter to write the
##  individual piece files.
##
##  @sa
##  vtkXMLTableWriter
##

import
  vtkIOParallelXMLModule, vtkXMLPDataObjectWriter

discard "forward decl of vtkCallbackCommand"
discard "forward decl of vtkMultiProcessController"
discard "forward decl of vtkTable"
discard "forward decl of vtkXMLTableWriter"
discard "forward decl of vtkXMLPDataObjectWriter"
type
  vtkXMLPTableWriter* {.importcpp: "vtkXMLPTableWriter",
                       header: "vtkXMLPTableWriter.h", bycopy.} = object of vtkXMLPDataObjectWriter
    vtkXMLPTableWriter* {.importc: "vtkXMLPTableWriter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkXMLPTableWriter {.importcpp: "vtkXMLPTableWriter::New(@)",
                                  header: "vtkXMLPTableWriter.h".}
type
  vtkXMLPTableWriterSuperclass* = vtkXMLPDataObjectWriter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkXMLPTableWriter::IsTypeOf(@)", header: "vtkXMLPTableWriter.h".}
proc IsA*(this: var vtkXMLPTableWriter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkXMLPTableWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkXMLPTableWriter {.
    importcpp: "vtkXMLPTableWriter::SafeDownCast(@)",
    header: "vtkXMLPTableWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkXMLPTableWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLPDataObjectWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLPTableWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLPTableWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkXMLPTableWriter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkXMLPTableWriter.h".}
proc GetInput*(this: var vtkXMLPTableWriter): ptr vtkTable {.importcpp: "GetInput",
    header: "vtkXMLPTableWriter.h".}
proc GetDefaultFileExtension*(this: var vtkXMLPTableWriter): cstring {.
    importcpp: "GetDefaultFileExtension", header: "vtkXMLPTableWriter.h".}