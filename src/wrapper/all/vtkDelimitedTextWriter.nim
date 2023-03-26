## =========================================================================
##
##   Program:   ParaView
##   Module:    vtkDelimitedTextWriter.h
##
##   Copyright (c) Kitware, Inc.
##   All rights reserved.
##   See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## -------------------------------------------------------------------------
##   Copyright 2009 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkDelimitedTextWriter
##  @brief   Delimited text writer for vtkTable
##  Writes a vtkTable as a delimited text file (such as CSV).
##

import
  vtkIOCoreModule, vtkWriter

discard "forward decl of vtkStdString"
discard "forward decl of vtkTable"
type
  vtkDelimitedTextWriter* {.importcpp: "vtkDelimitedTextWriter",
                           header: "vtkDelimitedTextWriter.h", bycopy.} = object of vtkWriter
    vtkDelimitedTextWriter* {.importc: "vtkDelimitedTextWriter".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH


proc New*(): ptr vtkDelimitedTextWriter {.importcpp: "vtkDelimitedTextWriter::New(@)",
                                      header: "vtkDelimitedTextWriter.h".}
type
  vtkDelimitedTextWriterSuperclass* = vtkWriter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDelimitedTextWriter::IsTypeOf(@)",
    header: "vtkDelimitedTextWriter.h".}
proc IsA*(this: var vtkDelimitedTextWriter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkDelimitedTextWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDelimitedTextWriter {.
    importcpp: "vtkDelimitedTextWriter::SafeDownCast(@)",
    header: "vtkDelimitedTextWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDelimitedTextWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDelimitedTextWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDelimitedTextWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDelimitedTextWriter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkDelimitedTextWriter.h".}
proc SetFieldDelimiter*(this: var vtkDelimitedTextWriter; _arg: cstring) {.
    importcpp: "SetFieldDelimiter", header: "vtkDelimitedTextWriter.h".}
proc GetFieldDelimiter*(this: var vtkDelimitedTextWriter): cstring {.
    importcpp: "GetFieldDelimiter", header: "vtkDelimitedTextWriter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get/Set the delimiter used for string data, if any
  ##  eg. double quotes(").
  ##
proc SetFieldDelimiterStringDelimiter*(this: var vtkDelimitedTextWriter;
                                      _arg: cstring) {.
    importcpp: "SetFieldDelimiterStringDelimiter",
    header: "vtkDelimitedTextWriter.h".}
proc GetFieldDelimiterStringDelimiter*(this: var vtkDelimitedTextWriter): cstring {.
    importcpp: "GetFieldDelimiterStringDelimiter",
    header: "vtkDelimitedTextWriter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get/Set the filename for the file.
  ##
## !!!Ignored construct:  virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

proc SetUseStringDelimiter*(this: var vtkDelimitedTextWriter; _arg: bool) {.
    importcpp: "SetUseStringDelimiter", header: "vtkDelimitedTextWriter.h".}
## !!!Ignored construct:  virtual bool GetUseStringDelimiter ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseStringDelimiter  of  << this -> UseStringDelimiter ) ; return this -> UseStringDelimiter ; } ;
## Error: expected ';'!!!

proc SetUseStringDelimiterWriteToOutputString*(this: var vtkDelimitedTextWriter;
    _arg: bool) {.importcpp: "SetUseStringDelimiterWriteToOutputString",
                header: "vtkDelimitedTextWriter.h".}
## !!!Ignored construct:  virtual bool GetUseStringDelimiterWriteToOutputString ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WriteToOutputString  of  << this -> WriteToOutputString ) ; return this -> WriteToOutputString ; } ;
## Error: expected ';'!!!

proc WriteToOutputStringOn*(this: var vtkDelimitedTextWriter) {.
    importcpp: "WriteToOutputStringOn", header: "vtkDelimitedTextWriter.h".}
proc WriteToOutputStringOff*(this: var vtkDelimitedTextWriter) {.
    importcpp: "WriteToOutputStringOff", header: "vtkDelimitedTextWriter.h".}
  ## /@}
  ## *
  ##  This convenience method returns the string, sets the IVAR to nullptr,
  ##  so that the user is responsible for deleting the string.
  ##
proc RegisterAndGetOutputString*(this: var vtkDelimitedTextWriter): cstring {.
    importcpp: "RegisterAndGetOutputString", header: "vtkDelimitedTextWriter.h".}
proc GetString*(this: var vtkDelimitedTextWriter; string: vtkStdString): vtkStdString {.
    importcpp: "GetString", header: "vtkDelimitedTextWriter.h".}