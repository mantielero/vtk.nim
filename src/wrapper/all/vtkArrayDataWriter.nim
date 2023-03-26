## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkArrayDataWriter.h
##
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
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
##  @class   vtkArrayDataWriter
##  @brief   Serialize vtkArrayData to a file or stream.
##
##
##  vtkArrayDataWriter serializes vtkArrayData using a text-based
##  format that is human-readable and easily parsed (default option).  The
##  WriteBinary array option can be used to serialize the vtkArrayData
##  using a binary format that is optimized for rapid throughput.
##
##  vtkArrayDataWriter can be used in two distinct ways: first, it can be used as a
##  normal pipeline filter, which writes its inputs to a file.  Alternatively, static
##  methods are provided for writing vtkArrayData instances to files or arbitrary c++
##  streams.
##
##  Inputs:
##    Input port 0: (required) vtkArrayData object.
##
##  Output Format:
##    See http://www.kitware.com/InfovisWiki/index.php/N-Way_Array_File_Formats for
##    details on how vtkArrayDataWriter encodes data.
##
##  @sa
##  vtkArrayDataReader
##
##  @par Thanks:
##  Developed by Timothy M. Shead (tshead@sandia.gov) at Sandia National Laboratories.
##

import
  vtkIOCoreModule, vtkStdString, vtkWriter

discard "forward decl of vtkArrayData"
type
  vtkArrayDataWriter* {.importcpp: "vtkArrayDataWriter",
                       header: "vtkArrayDataWriter.h", bycopy.} = object of vtkWriter
    vtkArrayDataWriter* {.importc: "vtkArrayDataWriter".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH


proc New*(): ptr vtkArrayDataWriter {.importcpp: "vtkArrayDataWriter::New(@)",
                                  header: "vtkArrayDataWriter.h".}
type
  vtkArrayDataWriterSuperclass* = vtkWriter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkArrayDataWriter::IsTypeOf(@)", header: "vtkArrayDataWriter.h".}
proc IsA*(this: var vtkArrayDataWriter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkArrayDataWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkArrayDataWriter {.
    importcpp: "vtkArrayDataWriter::SafeDownCast(@)",
    header: "vtkArrayDataWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkArrayDataWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkArrayDataWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkArrayDataWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkArrayDataWriter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkArrayDataWriter.h".}
## !!!Ignored construct:  /@{ *
##  Get / set the filename where data will be stored (when used as a filter).
##  virtual void SetFileNameFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

proc SetBinary*(this: var vtkArrayDataWriter; _arg: vtkTypeBool) {.
    importcpp: "SetBinary", header: "vtkArrayDataWriter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetBinary ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Binary  of  << this -> Binary ) ; return this -> Binary ; } ;
## Error: expected ';'!!!

proc BinaryOn*(this: var vtkArrayDataWriter) {.importcpp: "BinaryOn",
    header: "vtkArrayDataWriter.h".}
proc BinaryOff*(this: var vtkArrayDataWriter) {.importcpp: "BinaryOff",
    header: "vtkArrayDataWriter.h".}
  ## /@}
  ## *
  ##  The output string. This is only set when WriteToOutputString is set.
  ##
proc GetOutputString*(this: var vtkArrayDataWriter): vtkStdString {.
    importcpp: "GetOutputString", header: "vtkArrayDataWriter.h".}
proc SetBinaryWriteToOutputString*(this: var vtkArrayDataWriter; _arg: bool) {.
    importcpp: "SetBinaryWriteToOutputString", header: "vtkArrayDataWriter.h".}
## !!!Ignored construct:  virtual bool GetBinaryWriteToOutputString ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WriteToOutputString  of  << this -> WriteToOutputString ) ; return this -> WriteToOutputString ; } ;
## Error: expected ';'!!!

proc WriteToOutputStringOn*(this: var vtkArrayDataWriter) {.
    importcpp: "WriteToOutputStringOn", header: "vtkArrayDataWriter.h".}
proc WriteToOutputStringOff*(this: var vtkArrayDataWriter) {.
    importcpp: "WriteToOutputStringOff", header: "vtkArrayDataWriter.h".}
  ## /@}
proc Write*(this: var vtkArrayDataWriter): cint {.importcpp: "Write",
    header: "vtkArrayDataWriter.h".}
proc Write*(this: var vtkArrayDataWriter; FileName: vtkStdString;
           WriteBinary: bool = false): bool {.importcpp: "Write",
    header: "vtkArrayDataWriter.h".}
proc Write*(array: ptr vtkArrayData; file_name: vtkStdString;
           WriteBinary: bool = false): bool {.
    importcpp: "vtkArrayDataWriter::Write(@)", header: "vtkArrayDataWriter.h".}
proc Write*(this: var vtkArrayDataWriter; stream: var ostream;
           WriteBinary: bool = false): bool {.importcpp: "Write",
    header: "vtkArrayDataWriter.h".}
proc Write*(array: ptr vtkArrayData; stream: var ostream; WriteBinary: bool = false): bool {.
    importcpp: "vtkArrayDataWriter::Write(@)", header: "vtkArrayDataWriter.h".}
proc Write*(this: var vtkArrayDataWriter; WriteBinary: bool): vtkStdString {.
    importcpp: "Write", header: "vtkArrayDataWriter.h".}
proc Write*(array: ptr vtkArrayData; WriteBinary: bool = false): vtkStdString {.
    importcpp: "vtkArrayDataWriter::Write(@)", header: "vtkArrayDataWriter.h".}