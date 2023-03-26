## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRISReader.h
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
##  @class   vtkRISReader
##  @brief   reader for RIS files
##
##
##  RIS is a tagged format for expressing bibliographic citations.  Data is
##  structured as a collection of records with each record composed of
##  one-to-many fields.  See
##
##  http://en.wikipedia.org/wiki/RIS_(file_format)
##  http://www.refman.com/support/risformat_intro.asp
##  http://www.adeptscience.co.uk/kb/article/A626
##
##  for details.  vtkRISReader will convert an RIS file into a vtkTable, with
##  the set of table columns determined dynamically from the contents of the
##  file.
##

import
  vtkIOInfovisModule, vtkTableAlgorithm

discard "forward decl of vtkTable"
type
  vtkRISReader* {.importcpp: "vtkRISReader", header: "vtkRISReader.h", bycopy.} = object of vtkTableAlgorithm
    vtkRISReader* {.importc: "vtkRISReader".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH


proc New*(): ptr vtkRISReader {.importcpp: "vtkRISReader::New(@)",
                            header: "vtkRISReader.h".}
type
  vtkRISReaderSuperclass* = vtkTableAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkRISReader::IsTypeOf(@)", header: "vtkRISReader.h".}
proc IsA*(this: var vtkRISReader; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkRISReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkRISReader {.
    importcpp: "vtkRISReader::SafeDownCast(@)", header: "vtkRISReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkRISReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTableAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRISReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRISReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkRISReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkRISReader.h".}
## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

proc GetDelimiter*(this: var vtkRISReader): cstring {.importcpp: "GetDelimiter",
    header: "vtkRISReader.h".}
proc SetDelimiter*(this: var vtkRISReader; _arg: cstring) {.importcpp: "SetDelimiter",
    header: "vtkRISReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get the maximum number of records to read from the file (zero = unlimited)
  ##
## !!!Ignored construct:  virtual int GetMaxRecords ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaxRecords  of  << this -> MaxRecords ) ; return this -> MaxRecords ; } ;
## Error: expected ';'!!!

proc SetMaxRecords*(this: var vtkRISReader; _arg: cint) {.importcpp: "SetMaxRecords",
    header: "vtkRISReader.h".}
  ## /@}