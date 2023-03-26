## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkArrayReader.h
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
##  @class   vtkArrayReader
##  @brief    Reads sparse and dense vtkArray data written by vtkArrayWriter.
##
##
##  Reads sparse and dense vtkArray data written with vtkArrayWriter.
##
##  Outputs:
##    Output port 0: vtkArrayData containing a dense or sparse array.
##
##  @sa
##  vtkArrayWriter
##
##  @par Thanks:
##  Developed by Timothy M. Shead (tshead@sandia.gov) at Sandia National Laboratories.
##

import
  vtkArrayDataAlgorithm, vtkIOCoreModule, vtkStdString

discard "forward decl of vtkArray"
type
  vtkArrayReader* {.importcpp: "vtkArrayReader", header: "vtkArrayReader.h", bycopy.} = object of vtkArrayDataAlgorithm
    vtkArrayReader* {.importc: "vtkArrayReader".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH


proc New*(): ptr vtkArrayReader {.importcpp: "vtkArrayReader::New(@)",
                              header: "vtkArrayReader.h".}
type
  vtkArrayReaderSuperclass* = vtkArrayDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkArrayReader::IsTypeOf(@)", header: "vtkArrayReader.h".}
proc IsA*(this: var vtkArrayReader; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkArrayReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkArrayReader {.
    importcpp: "vtkArrayReader::SafeDownCast(@)", header: "vtkArrayReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkArrayReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkArrayDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkArrayReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkArrayReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkArrayReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkArrayReader.h".}
## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

proc SetInputString*(this: var vtkArrayReader; string: vtkStdString) {.
    importcpp: "SetInputString", header: "vtkArrayReader.h".}
proc GetInputString*(this: var vtkArrayReader): vtkStdString {.
    importcpp: "GetInputString", header: "vtkArrayReader.h".}
proc SetReadFromInputString*(this: var vtkArrayReader; _arg: bool) {.
    importcpp: "SetReadFromInputString", header: "vtkArrayReader.h".}
## !!!Ignored construct:  virtual bool GetReadFromInputString ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReadFromInputString  of  << this -> ReadFromInputString ) ; return this -> ReadFromInputString ; } ;
## Error: expected ';'!!!

proc ReadFromInputStringOn*(this: var vtkArrayReader) {.
    importcpp: "ReadFromInputStringOn", header: "vtkArrayReader.h".}
proc ReadFromInputStringOff*(this: var vtkArrayReader) {.
    importcpp: "ReadFromInputStringOff", header: "vtkArrayReader.h".}
  ## /@}
  ## *
  ##  Read an arbitrary array from a stream.  Note: you MUST always
  ##  open streams in binary mode to prevent problems reading files
  ##  on Windows.
  ##
proc Read*(stream: var istream): ptr vtkArray {.importcpp: "vtkArrayReader::Read(@)",
    header: "vtkArrayReader.h".}
proc Read*(str: vtkStdString): ptr vtkArray {.importcpp: "vtkArrayReader::Read(@)",
    header: "vtkArrayReader.h".}