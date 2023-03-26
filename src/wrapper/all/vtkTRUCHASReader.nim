## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTRUCHASReader.h
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
##  @class   vtkTRUCHASReader
##  @brief   read GE TRUCHAS format HDF5 files
##
##  vtkTRUCHASReader is a source object that reads TRUCHAS simulation
##  data from HDF5 files.
##

import
  vtkIOTRUCHASModule, vtkMultiBlockDataSetAlgorithm

discard "forward decl of vtkDataArraySelection"
type
  vtkTRUCHASReader* {.importcpp: "vtkTRUCHASReader", header: "vtkTRUCHASReader.h",
                     bycopy.} = object of vtkMultiBlockDataSetAlgorithm
    vtkTRUCHASReader* {.importc: "vtkTRUCHASReader".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH


proc New*(): ptr vtkTRUCHASReader {.importcpp: "vtkTRUCHASReader::New(@)",
                                header: "vtkTRUCHASReader.h".}
type
  vtkTRUCHASReaderSuperclass* = vtkMultiBlockDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTRUCHASReader::IsTypeOf(@)", header: "vtkTRUCHASReader.h".}
proc IsA*(this: var vtkTRUCHASReader; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkTRUCHASReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTRUCHASReader {.
    importcpp: "vtkTRUCHASReader::SafeDownCast(@)", header: "vtkTRUCHASReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTRUCHASReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMultiBlockDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTRUCHASReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTRUCHASReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTRUCHASReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTRUCHASReader.h".}
## !!!Ignored construct:  /@{ *
##  Specify file name of vtk data file to read.
##  virtual void SetFileNameFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} *
##  A simple, non-exhaustive check to see if a file is a valid truchas file.
##  static int CanReadFile ( VTK_FILEPATH const char * filename ) ;
## Error: token expected: ) but got: *!!!

proc GetNumberOfBlockArrays*(this: var vtkTRUCHASReader): cint {.
    importcpp: "GetNumberOfBlockArrays", header: "vtkTRUCHASReader.h".}
proc GetBlockArrayName*(this: var vtkTRUCHASReader; index: cint): cstring {.
    importcpp: "GetBlockArrayName", header: "vtkTRUCHASReader.h".}
proc SetBlockArrayStatus*(this: var vtkTRUCHASReader; gridname: cstring; status: cint) {.
    importcpp: "SetBlockArrayStatus", header: "vtkTRUCHASReader.h".}
proc GetBlockArrayStatus*(this: var vtkTRUCHASReader; gridname: cstring): cint {.
    importcpp: "GetBlockArrayStatus", header: "vtkTRUCHASReader.h".}
proc GetNumberOfPointArrays*(this: var vtkTRUCHASReader): cint {.
    importcpp: "GetNumberOfPointArrays", header: "vtkTRUCHASReader.h".}
proc GetPointArrayName*(this: var vtkTRUCHASReader; index: cint): cstring {.
    importcpp: "GetPointArrayName", header: "vtkTRUCHASReader.h".}
proc GetPointArrayStatus*(this: var vtkTRUCHASReader; name: cstring): cint {.
    importcpp: "GetPointArrayStatus", header: "vtkTRUCHASReader.h".}
proc SetPointArrayStatus*(this: var vtkTRUCHASReader; name: cstring; status: cint) {.
    importcpp: "SetPointArrayStatus", header: "vtkTRUCHASReader.h".}
proc GetNumberOfCellArrays*(this: var vtkTRUCHASReader): cint {.
    importcpp: "GetNumberOfCellArrays", header: "vtkTRUCHASReader.h".}
proc GetCellArrayName*(this: var vtkTRUCHASReader; index: cint): cstring {.
    importcpp: "GetCellArrayName", header: "vtkTRUCHASReader.h".}
proc GetCellArrayStatus*(this: var vtkTRUCHASReader; name: cstring): cint {.
    importcpp: "GetCellArrayStatus", header: "vtkTRUCHASReader.h".}
proc SetCellArrayStatus*(this: var vtkTRUCHASReader; name: cstring; status: cint) {.
    importcpp: "SetCellArrayStatus", header: "vtkTRUCHASReader.h".}