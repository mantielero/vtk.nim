## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkArrayWriter.h
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
##  @class   vtkArrayWriter
##  @brief   Serialize sparse and dense arrays to a file or stream.
##
##
##  vtkArrayWriter serializes sparse and dense array data using a text-based
##  format that is human-readable and easily parsed (default option).  The
##  WriteBinary array option can be used to serialize the sparse and dense array data
##  using a binary format that is optimized for rapid throughput.
##
##  vtkArrayWriter can be used in two distinct ways: first, it can be used as a
##  normal pipeline filter, which writes its inputs to a file.  Alternatively, static
##  methods are provided for writing vtkArray instances to files or arbitrary c++
##  streams.
##
##  Inputs:
##    Input port 0: (required) vtkArrayData object containing a single sparse or dense
##                             array.
##
##  Output Format:
##    See http://www.kitware.com/InfovisWiki/index.php/N-Way_Array_File_Formats for
##    details on how vtkArrayWriter encodes data.
##
##  @sa
##  vtkArrayReader
##
##  @par Thanks:
##  Developed by Timothy M. Shead (tshead@sandia.gov) at Sandia National Laboratories.
##

import
  vtkIOCoreModule, vtkStdString, vtkWriter

discard "forward decl of vtkArray"
type
  vtkArrayWriter* {.importcpp: "vtkArrayWriter", header: "vtkArrayWriter.h", bycopy.} = object of vtkWriter
    vtkArrayWriter* {.importc: "vtkArrayWriter".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH


proc New*(): ptr vtkArrayWriter {.importcpp: "vtkArrayWriter::New(@)",
                              header: "vtkArrayWriter.h".}
type
  vtkArrayWriterSuperclass* = vtkWriter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkArrayWriter::IsTypeOf(@)", header: "vtkArrayWriter.h".}
proc IsA*(this: var vtkArrayWriter; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkArrayWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkArrayWriter {.
    importcpp: "vtkArrayWriter::SafeDownCast(@)", header: "vtkArrayWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkArrayWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkArrayWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkArrayWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkArrayWriter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkArrayWriter.h".}
## !!!Ignored construct:  /@{ *
##  Get / set the filename where data will be stored (when used as a filter).
##  virtual void SetFileNameFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

proc SetBinary*(this: var vtkArrayWriter; _arg: vtkTypeBool) {.importcpp: "SetBinary",
    header: "vtkArrayWriter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetBinary ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Binary  of  << this -> Binary ) ; return this -> Binary ; } ;
## Error: expected ';'!!!

proc BinaryOn*(this: var vtkArrayWriter) {.importcpp: "BinaryOn",
                                       header: "vtkArrayWriter.h".}
proc BinaryOff*(this: var vtkArrayWriter) {.importcpp: "BinaryOff",
                                        header: "vtkArrayWriter.h".}
  ## /@}
  ## *
  ##  The output string. This is only set when WriteToOutputString is set.
  ##
proc GetOutputString*(this: var vtkArrayWriter): vtkStdString {.
    importcpp: "GetOutputString", header: "vtkArrayWriter.h".}
proc SetBinaryWriteToOutputString*(this: var vtkArrayWriter; _arg: bool) {.
    importcpp: "SetBinaryWriteToOutputString", header: "vtkArrayWriter.h".}
## !!!Ignored construct:  virtual bool GetBinaryWriteToOutputString ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WriteToOutputString  of  << this -> WriteToOutputString ) ; return this -> WriteToOutputString ; } ;
## Error: expected ';'!!!

proc WriteToOutputStringOn*(this: var vtkArrayWriter) {.
    importcpp: "WriteToOutputStringOn", header: "vtkArrayWriter.h".}
proc WriteToOutputStringOff*(this: var vtkArrayWriter) {.
    importcpp: "WriteToOutputStringOff", header: "vtkArrayWriter.h".}
  ## /@}
proc Write*(this: var vtkArrayWriter): cint {.importcpp: "Write",
    header: "vtkArrayWriter.h".}
proc Write*(this: var vtkArrayWriter; FileName: vtkStdString;
           WriteBinary: bool = false): bool {.importcpp: "Write",
    header: "vtkArrayWriter.h".}
proc Write*(array: ptr vtkArray; file_name: vtkStdString; WriteBinary: bool = false): bool {.
    importcpp: "vtkArrayWriter::Write(@)", header: "vtkArrayWriter.h".}
proc Write*(this: var vtkArrayWriter; stream: var ostream; WriteBinary: bool = false): bool {.
    importcpp: "Write", header: "vtkArrayWriter.h".}
proc Write*(array: ptr vtkArray; stream: var ostream; WriteBinary: bool = false): bool {.
    importcpp: "vtkArrayWriter::Write(@)", header: "vtkArrayWriter.h".}
proc Write*(this: var vtkArrayWriter; WriteBinary: bool): vtkStdString {.
    importcpp: "Write", header: "vtkArrayWriter.h".}
proc Write*(array: ptr vtkArray; WriteBinary: bool = false): vtkStdString {.
    importcpp: "vtkArrayWriter::Write(@)", header: "vtkArrayWriter.h".}