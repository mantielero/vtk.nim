## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkX3DExporter.h
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
##  @class   vtkX3DExporter
##  @brief   create an x3d file
##
##  vtkX3DExporter is a render window exporter which writes out the renderered
##  scene into an X3D file. X3D is an XML-based format for representation
##  3D scenes (similar to VRML). Check out http://www.web3d.org/x3d/ for more
##  details.
##  @par Thanks:
##  X3DExporter is contributed by Christophe Mouton at EDF.
##

import
  vtkExporter, vtkIOExportModule

discard "forward decl of vtkActor"
discard "forward decl of vtkActor2D"
discard "forward decl of vtkDataArray"
discard "forward decl of vtkLight"
discard "forward decl of vtkPoints"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkRenderer"
discard "forward decl of vtkUnsignedCharArray"
discard "forward decl of vtkX3DExporterWriter"
type
  vtkX3DExporter* {.importcpp: "vtkX3DExporter", header: "vtkX3DExporter.h", bycopy.} = object of vtkExporter
    vtkX3DExporter* {.importc: "vtkX3DExporter".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    ## *
    ##  Write data to output.
    ##


proc New*(): ptr vtkX3DExporter {.importcpp: "vtkX3DExporter::New(@)",
                              header: "vtkX3DExporter.h".}
type
  vtkX3DExporterSuperclass* = vtkExporter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkX3DExporter::IsTypeOf(@)", header: "vtkX3DExporter.h".}
proc IsA*(this: var vtkX3DExporter; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkX3DExporter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkX3DExporter {.
    importcpp: "vtkX3DExporter::SafeDownCast(@)", header: "vtkX3DExporter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkX3DExporter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkExporter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkX3DExporter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkX3DExporter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkX3DExporter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkX3DExporter.h".}
## !!!Ignored construct:  /@{ *
##  Set/Get the output file name.
##  virtual void SetFileNameFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

proc SetSpeed*(this: var vtkX3DExporter; _arg: cdouble) {.importcpp: "SetSpeed",
    header: "vtkX3DExporter.h".}
## !!!Ignored construct:  virtual double GetSpeed ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Speed  of  << this -> Speed ) ; return this -> Speed ; } ;
## Error: expected ';'!!!

proc SetBinary*(this: var vtkX3DExporter; _arg: vtkTypeBool) {.importcpp: "SetBinary",
    header: "vtkX3DExporter.h".}
proc GetBinaryMinValue*(this: var vtkX3DExporter): vtkTypeBool {.
    importcpp: "GetBinaryMinValue", header: "vtkX3DExporter.h".}
proc GetBinaryMaxValue*(this: var vtkX3DExporter): vtkTypeBool {.
    importcpp: "GetBinaryMaxValue", header: "vtkX3DExporter.h".}
proc BinaryOn*(this: var vtkX3DExporter) {.importcpp: "BinaryOn",
                                       header: "vtkX3DExporter.h".}
proc BinaryOff*(this: var vtkX3DExporter) {.importcpp: "BinaryOff",
                                        header: "vtkX3DExporter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetSpeedBinary ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Binary  of  << this -> Binary ) ; return this -> Binary ; } ;
## Error: expected ';'!!!

proc SetBinaryFastest*(this: var vtkX3DExporter; _arg: vtkTypeBool) {.
    importcpp: "SetBinaryFastest", header: "vtkX3DExporter.h".}
proc GetBinaryMinValueFastestMinValue*(this: var vtkX3DExporter): vtkTypeBool {.
    importcpp: "GetBinaryMinValueFastestMinValue", header: "vtkX3DExporter.h".}
proc GetBinaryMaxValueFastestMaxValue*(this: var vtkX3DExporter): vtkTypeBool {.
    importcpp: "GetBinaryMaxValueFastestMaxValue", header: "vtkX3DExporter.h".}
proc FastestOn*(this: var vtkX3DExporter) {.importcpp: "FastestOn",
                                        header: "vtkX3DExporter.h".}
proc FastestOff*(this: var vtkX3DExporter) {.importcpp: "FastestOff",
    header: "vtkX3DExporter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetSpeedBinaryFastest ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Fastest  of  << this -> Fastest ) ; return this -> Fastest ; } ;
## Error: expected ';'!!!

proc SetSpeedWriteToOutputString*(this: var vtkX3DExporter; _arg: vtkTypeBool) {.
    importcpp: "SetSpeedWriteToOutputString", header: "vtkX3DExporter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetSpeedBinaryFastestWriteToOutputString ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WriteToOutputString  of  << this -> WriteToOutputString ) ; return this -> WriteToOutputString ; } ;
## Error: expected ';'!!!

proc WriteToOutputStringOn*(this: var vtkX3DExporter) {.
    importcpp: "WriteToOutputStringOn", header: "vtkX3DExporter.h".}
proc WriteToOutputStringOff*(this: var vtkX3DExporter) {.
    importcpp: "WriteToOutputStringOff", header: "vtkX3DExporter.h".}
  ## /@}
  ## /@{
  ## *
  ##  When WriteToOutputString in on, then a string is allocated, written to,
  ##  and can be retrieved with these methods.  The string is deleted during
  ##  the next call to write ...
  ##
## !!!Ignored construct:  virtual vtkIdType GetSpeedBinaryFastestWriteToOutputStringOutputStringLength ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputStringLength  of  << this -> OutputStringLength ) ; return this -> OutputStringLength ; } ;
## Error: expected ';'!!!

proc GetOutputString*(this: var vtkX3DExporter): cstring {.
    importcpp: "GetOutputString", header: "vtkX3DExporter.h".}
proc GetBinaryOutputString*(this: var vtkX3DExporter): ptr cuchar {.
    importcpp: "GetBinaryOutputString", header: "vtkX3DExporter.h".}
proc RegisterAndGetOutputString*(this: var vtkX3DExporter): cstring {.
    importcpp: "RegisterAndGetOutputString", header: "vtkX3DExporter.h".}