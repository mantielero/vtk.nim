## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkX3DExporterWriter.h
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
##  @class   vtkX3DExporterWriter
##  @brief   X3D Exporter Writer
##
##  vtkX3DExporterWriter is the definition for
##  classes that implement a encoding for the
##  X3D exporter
##

import
  vtkIOExportModule, vtkObject

##  Forward declarations

discard "forward decl of vtkDataArray"
discard "forward decl of vtkUnsignedCharArray"
discard "forward decl of vtkCellArray"
type
  vtkX3DExporterWriter* {.importcpp: "vtkX3DExporterWriter",
                         header: "vtkX3DExporterWriter.h", bycopy.} = object of vtkObject
    vtkX3DExporterWriter* {.importc: "vtkX3DExporterWriter".}: VTK_NEWINSTANCE

  vtkX3DExporterWriterSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkX3DExporterWriter::IsTypeOf(@)",
    header: "vtkX3DExporterWriter.h".}
proc IsA*(this: var vtkX3DExporterWriter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkX3DExporterWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkX3DExporterWriter {.
    importcpp: "vtkX3DExporterWriter::SafeDownCast(@)",
    header: "vtkX3DExporterWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkX3DExporterWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkX3DExporterWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkX3DExporterWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkX3DExporterWriter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkX3DExporterWriter.h".}
proc OpenFile*(this: var vtkX3DExporterWriter; file: cstring): cint {.
    importcpp: "OpenFile", header: "vtkX3DExporterWriter.h".}
proc OpenStream*(this: var vtkX3DExporterWriter): cint {.importcpp: "OpenStream",
    header: "vtkX3DExporterWriter.h".}
proc SetWriteToOutputString*(this: var vtkX3DExporterWriter; _arg: vtkTypeBool) {.
    importcpp: "SetWriteToOutputString", header: "vtkX3DExporterWriter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetWriteToOutputString ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WriteToOutputString  of  << this -> WriteToOutputString ) ; return this -> WriteToOutputString ; } ;
## Error: expected ';'!!!

proc WriteToOutputStringOn*(this: var vtkX3DExporterWriter) {.
    importcpp: "WriteToOutputStringOn", header: "vtkX3DExporterWriter.h".}
proc WriteToOutputStringOff*(this: var vtkX3DExporterWriter) {.
    importcpp: "WriteToOutputStringOff", header: "vtkX3DExporterWriter.h".}
  ## /@}
  ## /@{
  ## *
  ##  When WriteToOutputString in on, then a string is allocated, written to,
  ##  and can be retrieved with these methods.  The string is deleted during
  ##  the next call to write ...
  ##
## !!!Ignored construct:  virtual vtkIdType GetWriteToOutputStringOutputStringLength ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputStringLength  of  << this -> OutputStringLength ) ; return this -> OutputStringLength ; } ;
## Error: expected ';'!!!

proc GetOutputString*(this: var vtkX3DExporterWriter): cstring {.
    importcpp: "GetOutputString", header: "vtkX3DExporterWriter.h".}
proc GetBinaryOutputString*(this: var vtkX3DExporterWriter): ptr cuchar {.
    importcpp: "GetBinaryOutputString", header: "vtkX3DExporterWriter.h".}
proc RegisterAndGetOutputString*(this: var vtkX3DExporterWriter): cstring {.
    importcpp: "RegisterAndGetOutputString", header: "vtkX3DExporterWriter.h".}
proc CloseFile*(this: var vtkX3DExporterWriter) {.importcpp: "CloseFile",
    header: "vtkX3DExporterWriter.h".}
proc Flush*(this: var vtkX3DExporterWriter) {.importcpp: "Flush",
    header: "vtkX3DExporterWriter.h".}
proc StartDocument*(this: var vtkX3DExporterWriter) {.importcpp: "StartDocument",
    header: "vtkX3DExporterWriter.h".}
proc EndDocument*(this: var vtkX3DExporterWriter) {.importcpp: "EndDocument",
    header: "vtkX3DExporterWriter.h".}
proc StartNode*(this: var vtkX3DExporterWriter; nodeID: cint) {.
    importcpp: "StartNode", header: "vtkX3DExporterWriter.h".}
proc EndNode*(this: var vtkX3DExporterWriter) {.importcpp: "EndNode",
    header: "vtkX3DExporterWriter.h".}
proc SetField*(this: var vtkX3DExporterWriter; attributeID: cint; value: cstring;
              mfstring: bool = false) {.importcpp: "SetField",
                                    header: "vtkX3DExporterWriter.h".}
proc SetField*(this: var vtkX3DExporterWriter; attributeID: cint; a3: cint) {.
    importcpp: "SetField", header: "vtkX3DExporterWriter.h".}
proc SetField*(this: var vtkX3DExporterWriter; attributeID: cint; a3: cfloat) {.
    importcpp: "SetField", header: "vtkX3DExporterWriter.h".}
proc SetField*(this: var vtkX3DExporterWriter; attributeID: cint; a3: cdouble) {.
    importcpp: "SetField", header: "vtkX3DExporterWriter.h".}
proc SetField*(this: var vtkX3DExporterWriter; attributeID: cint; a3: bool) {.
    importcpp: "SetField", header: "vtkX3DExporterWriter.h".}
proc SetField*(this: var vtkX3DExporterWriter; attributeID: cint; `type`: cint;
              a: ptr cdouble) {.importcpp: "SetField",
                             header: "vtkX3DExporterWriter.h".}
proc SetField*(this: var vtkX3DExporterWriter; attributeID: cint; `type`: cint;
              a: ptr vtkDataArray) {.importcpp: "SetField",
                                  header: "vtkX3DExporterWriter.h".}
proc SetField*(this: var vtkX3DExporterWriter; attributeID: cint; values: ptr cdouble;
              size: csize_t) {.importcpp: "SetField",
                             header: "vtkX3DExporterWriter.h".}
proc SetField*(this: var vtkX3DExporterWriter; attributeID: cint; values: ptr cint;
              size: csize_t; image: bool = false) {.importcpp: "SetField",
    header: "vtkX3DExporterWriter.h".}