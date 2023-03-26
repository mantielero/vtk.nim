## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFixedWidthTextReader.h
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
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkFixedWidthTextReader
##  @brief   reader for pulling in text files with fixed-width fields
##
##
##
##  vtkFixedWidthTextReader reads in a table from a text file where
##  each column occupies a certain number of characters.
##
##  This class emits ProgressEvent for every 100 lines it reads.
##
##
##  @warning
##  This first version of the reader will assume that all fields have
##  the same width.  It also assumes that the first line in the file
##  has at least as many fields (i.e. at least as many characters) as
##  any other line in the file.
##
##  @par Thanks:
##  Thanks to Andy Wilson from Sandia National Laboratories for
##  implementing this class.
##

import
  vtkIOInfovisModule, vtkTableAlgorithm

discard "forward decl of vtkCommand"
discard "forward decl of vtkTable"
type
  vtkFixedWidthTextReader* {.importcpp: "vtkFixedWidthTextReader",
                            header: "vtkFixedWidthTextReader.h", bycopy.} = object of vtkTableAlgorithm
    vtkFixedWidthTextReader* {.importc: "vtkFixedWidthTextReader".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH


proc New*(): ptr vtkFixedWidthTextReader {.importcpp: "vtkFixedWidthTextReader::New(@)",
                                       header: "vtkFixedWidthTextReader.h".}
type
  vtkFixedWidthTextReaderSuperclass* = vtkTableAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkFixedWidthTextReader::IsTypeOf(@)",
    header: "vtkFixedWidthTextReader.h".}
proc IsA*(this: var vtkFixedWidthTextReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkFixedWidthTextReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkFixedWidthTextReader {.
    importcpp: "vtkFixedWidthTextReader::SafeDownCast(@)",
    header: "vtkFixedWidthTextReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkFixedWidthTextReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTableAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFixedWidthTextReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFixedWidthTextReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkFixedWidthTextReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkFixedWidthTextReader.h".}
## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

proc SetFieldWidth*(this: var vtkFixedWidthTextReader; _arg: cint) {.
    importcpp: "SetFieldWidth", header: "vtkFixedWidthTextReader.h".}
## !!!Ignored construct:  virtual int GetFieldWidth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FieldWidth  of  << this -> FieldWidth ) ; return this -> FieldWidth ; } ;
## Error: expected ';'!!!

proc SetFieldWidthStripWhiteSpace*(this: var vtkFixedWidthTextReader; _arg: bool) {.
    importcpp: "SetFieldWidthStripWhiteSpace", header: "vtkFixedWidthTextReader.h".}
## !!!Ignored construct:  virtual bool GetFieldWidthStripWhiteSpace ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << StripWhiteSpace  of  << this -> StripWhiteSpace ) ; return this -> StripWhiteSpace ; } ;
## Error: expected ';'!!!

proc StripWhiteSpaceOn*(this: var vtkFixedWidthTextReader) {.
    importcpp: "StripWhiteSpaceOn", header: "vtkFixedWidthTextReader.h".}
proc StripWhiteSpaceOff*(this: var vtkFixedWidthTextReader) {.
    importcpp: "StripWhiteSpaceOff", header: "vtkFixedWidthTextReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get whether to treat the first line of the file as headers.
  ##
## !!!Ignored construct:  virtual bool GetFieldWidthStripWhiteSpaceHaveHeaders ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HaveHeaders  of  << this -> HaveHeaders ) ; return this -> HaveHeaders ; } ;
## Error: expected ';'!!!

proc SetFieldWidthStripWhiteSpaceHaveHeaders*(this: var vtkFixedWidthTextReader;
    _arg: bool) {.importcpp: "SetFieldWidthStripWhiteSpaceHaveHeaders",
                header: "vtkFixedWidthTextReader.h".}
proc HaveHeadersOn*(this: var vtkFixedWidthTextReader) {.importcpp: "HaveHeadersOn",
    header: "vtkFixedWidthTextReader.h".}
proc HaveHeadersOff*(this: var vtkFixedWidthTextReader) {.
    importcpp: "HaveHeadersOff", header: "vtkFixedWidthTextReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get the ErrorObserver for the internal vtkTable
  ##  This is useful for applications that want to catch error messages.
  ##
proc SetTableErrorObserver*(this: var vtkFixedWidthTextReader; a2: ptr vtkCommand) {.
    importcpp: "SetTableErrorObserver", header: "vtkFixedWidthTextReader.h".}
proc GetnameTableErrorObserver*(this: var vtkFixedWidthTextReader): ptr vtkCommand {.
    importcpp: "GetnameTableErrorObserver", header: "vtkFixedWidthTextReader.h".}
  ## /@}