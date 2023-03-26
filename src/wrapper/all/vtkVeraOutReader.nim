## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkVeraOutReader.h
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
##  .NAME vtkVeraOutReader - File reader for VERA OUT HDF5 format.

import
  vtkIOVeraOutModule

##  vtkCommonExecutionModel

import
  vtkRectilinearGridAlgorithm

discard "forward decl of vtkDataArraySelection"
type
  vtkVeraOutReader* {.importcpp: "vtkVeraOutReader", header: "vtkVeraOutReader.h",
                     bycopy.} = object of vtkRectilinearGridAlgorithm
    vtkVeraOutReader* {.importc: "vtkVeraOutReader".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH


proc New*(): ptr vtkVeraOutReader {.importcpp: "vtkVeraOutReader::New(@)",
                                header: "vtkVeraOutReader.h".}
type
  vtkVeraOutReaderSuperclass* = vtkRectilinearGridAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkVeraOutReader::IsTypeOf(@)", header: "vtkVeraOutReader.h".}
proc IsA*(this: var vtkVeraOutReader; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkVeraOutReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkVeraOutReader {.
    importcpp: "vtkVeraOutReader::SafeDownCast(@)", header: "vtkVeraOutReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkVeraOutReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkRectilinearGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkVeraOutReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkVeraOutReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkVeraOutReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkVeraOutReader.h".}
## !!!Ignored construct:  virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

proc GetCellDataArraySelection*(this: vtkVeraOutReader): ptr vtkDataArraySelection {.
    noSideEffect, importcpp: "GetCellDataArraySelection",
    header: "vtkVeraOutReader.h".}
proc GetFieldDataArraySelection*(this: vtkVeraOutReader): ptr vtkDataArraySelection {.
    noSideEffect, importcpp: "GetFieldDataArraySelection",
    header: "vtkVeraOutReader.h".}
proc GetMTime*(this: var vtkVeraOutReader): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkVeraOutReader.h".}