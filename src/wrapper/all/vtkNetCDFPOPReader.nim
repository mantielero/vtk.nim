## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkNetCDFPOPReader.h
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
##  @class   vtkNetCDFPOPReader
##  @brief   read NetCDF files
##  .Author Joshua Wu 09.15.2009
##
##  vtkNetCDFPOPReader is a source object that reads NetCDF files.
##  It should be able to read most any NetCDF file that wants to output a
##  rectilinear grid.  The ordering of the variables is changed such that
##  the NetCDF x, y, z directions correspond to the vtkRectilinearGrid
##  z, y, x directions, respectively.  The striding is done with
##  respect to the vtkRectilinearGrid ordering.  Additionally, the
##  z coordinates of the vtkRectilinearGrid are negated so that the
##  first slice/plane has the highest z-value and the last slice/plane
##  has the lowest z-value.
##

import
  vtkIONetCDFModule, vtkRectilinearGridAlgorithm

discard "forward decl of vtkDataArraySelection"
discard "forward decl of vtkCallbackCommand"
discard "forward decl of vtkNetCDFPOPReaderInternal"
type
  vtkNetCDFPOPReader* {.importcpp: "vtkNetCDFPOPReader",
                       header: "vtkNetCDFPOPReader.h", bycopy.} = object of vtkRectilinearGridAlgorithm
    vtkNetCDFPOPReader* {.importc: "vtkNetCDFPOPReader".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    ## *
    ##  The NetCDF file descriptor.
    ##
    ## *
    ##  The file name of the opened file.
    ##

  vtkNetCDFPOPReaderSuperclass* = vtkRectilinearGridAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkNetCDFPOPReader::IsTypeOf(@)", header: "vtkNetCDFPOPReader.h".}
proc IsA*(this: var vtkNetCDFPOPReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkNetCDFPOPReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkNetCDFPOPReader {.
    importcpp: "vtkNetCDFPOPReader::SafeDownCast(@)",
    header: "vtkNetCDFPOPReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkNetCDFPOPReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkRectilinearGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkNetCDFPOPReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkNetCDFPOPReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc New*(): ptr vtkNetCDFPOPReader {.importcpp: "vtkNetCDFPOPReader::New(@)",
                                  header: "vtkNetCDFPOPReader.h".}
proc PrintSelf*(this: var vtkNetCDFPOPReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkNetCDFPOPReader.h".}
## !!!Ignored construct:  /@{ *
##  The file to open
##  virtual void SetFileNameFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

proc SetStride*(this: var vtkNetCDFPOPReader; _arg1: cint; _arg2: cint; _arg3: cint) {.
    importcpp: "SetStride", header: "vtkNetCDFPOPReader.h".}
proc SetStride*(this: var vtkNetCDFPOPReader; _arg: array[3, cint]) {.
    importcpp: "SetStride", header: "vtkNetCDFPOPReader.h".}
## !!!Ignored construct:  virtual int * GetStride ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Stride  pointer  << this -> Stride ) ; return this -> Stride ; } VTK_WRAPEXCLUDE virtual void GetStride ( int & _arg1 , int & _arg2 , int & _arg3 ) { _arg1 = this -> Stride [ 0 ] ; _arg2 = this -> Stride [ 1 ] ; _arg3 = this -> Stride [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Stride  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetStride ( int _arg [ 3 ] ) { this -> GetStride ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc GetNumberOfVariableArrays*(this: var vtkNetCDFPOPReader): cint {.
    importcpp: "GetNumberOfVariableArrays", header: "vtkNetCDFPOPReader.h".}
proc GetVariableArrayName*(this: var vtkNetCDFPOPReader; index: cint): cstring {.
    importcpp: "GetVariableArrayName", header: "vtkNetCDFPOPReader.h".}
proc GetVariableArrayStatus*(this: var vtkNetCDFPOPReader; name: cstring): cint {.
    importcpp: "GetVariableArrayStatus", header: "vtkNetCDFPOPReader.h".}
proc SetVariableArrayStatus*(this: var vtkNetCDFPOPReader; name: cstring; status: cint) {.
    importcpp: "SetVariableArrayStatus", header: "vtkNetCDFPOPReader.h".}
## !!!Ignored construct:  virtual void SetFileNameFileNameOpenedFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << OpenedFileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> OpenedFileName == nullptr && _arg == nullptr ) { return ; } if ( this -> OpenedFileName && _arg && ( ! strcmp ( this -> OpenedFileName , _arg ) ) ) { return ; } delete [ ] this -> OpenedFileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> OpenedFileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> OpenedFileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!
