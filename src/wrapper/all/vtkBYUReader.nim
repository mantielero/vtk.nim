## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBYUReader.h
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
##  @class   vtkBYUReader
##  @brief   read MOVIE.BYU polygon files
##
##  vtkBYUReader is a source object that reads MOVIE.BYU polygon files.
##  These files consist of a geometry file (.g), a scalar file (.s), a
##  displacement or vector file (.d), and a 2D texture coordinate file
##  (.t).
##

import
  vtkIOGeometryModule, vtkPolyDataAlgorithm

type
  vtkBYUReader* {.importcpp: "vtkBYUReader", header: "vtkBYUReader.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkBYUReader* {.importc: "vtkBYUReader".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH


proc New*(): ptr vtkBYUReader {.importcpp: "vtkBYUReader::New(@)",
                            header: "vtkBYUReader.h".}
type
  vtkBYUReaderSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkBYUReader::IsTypeOf(@)", header: "vtkBYUReader.h".}
proc IsA*(this: var vtkBYUReader; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkBYUReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBYUReader {.
    importcpp: "vtkBYUReader::SafeDownCast(@)", header: "vtkBYUReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBYUReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBYUReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBYUReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkBYUReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkBYUReader.h".}
## !!!Ignored construct:  /@{ *
##  Specify name of geometry FileName.
##  virtual void SetGeometryFileNameGeometryFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << GeometryFileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> GeometryFileName == nullptr && _arg == nullptr ) { return ; } if ( this -> GeometryFileName && _arg && ( ! strcmp ( this -> GeometryFileName , _arg ) ) ) { return ; } delete [ ] this -> GeometryFileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> GeometryFileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> GeometryFileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetGeometryFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GeometryFileName  of  << ( this -> GeometryFileName ? this -> GeometryFileName : (null) ) ) ; return this -> GeometryFileName ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} *
##  Specify name of geometry FileName (alias).
##  virtual void SetFileName ( VTK_FILEPATH const char * f ) { this -> SetGeometryFileName ( f ) ; } virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFileName ( ) VTK_FUTURE_CONST { return this -> GetGeometryFileName ( ) ; } /@{ *
##  Specify name of displacement FileName.
##  virtual void SetGeometryFileNameGeometryFileNameDisplacementFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << DisplacementFileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> DisplacementFileName == nullptr && _arg == nullptr ) { return ; } if ( this -> DisplacementFileName && _arg && ( ! strcmp ( this -> DisplacementFileName , _arg ) ) ) { return ; } delete [ ] this -> DisplacementFileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> DisplacementFileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> DisplacementFileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetGeometryFileNameDisplacementFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DisplacementFileName  of  << ( this -> DisplacementFileName ? this -> DisplacementFileName : (null) ) ) ; return this -> DisplacementFileName ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Specify name of scalar FileName.
##  virtual void SetGeometryFileNameGeometryFileNameDisplacementFileNameScalarFileNameScalarFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ScalarFileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> ScalarFileName == nullptr && _arg == nullptr ) { return ; } if ( this -> ScalarFileName && _arg && ( ! strcmp ( this -> ScalarFileName , _arg ) ) ) { return ; } delete [ ] this -> ScalarFileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> ScalarFileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> ScalarFileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetGeometryFileNameDisplacementFileNameScalarFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarFileName  of  << ( this -> ScalarFileName ? this -> ScalarFileName : (null) ) ) ; return this -> ScalarFileName ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Specify name of texture coordinates FileName.
##  virtual void SetGeometryFileNameGeometryFileNameDisplacementFileNameScalarFileNameScalarFileNameTextureFileNameTextureFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << TextureFileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> TextureFileName == nullptr && _arg == nullptr ) { return ; } if ( this -> TextureFileName && _arg && ( ! strcmp ( this -> TextureFileName , _arg ) ) ) { return ; } delete [ ] this -> TextureFileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> TextureFileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> TextureFileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetGeometryFileNameDisplacementFileNameScalarFileNameTextureFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TextureFileName  of  << ( this -> TextureFileName ? this -> TextureFileName : (null) ) ) ; return this -> TextureFileName ; } ;
## Error: expected ';'!!!

proc SetReadDisplacement*(this: var vtkBYUReader; _arg: vtkTypeBool) {.
    importcpp: "SetReadDisplacement", header: "vtkBYUReader.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetReadDisplacement ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReadDisplacement  of  << this -> ReadDisplacement ) ; return this -> ReadDisplacement ; } ;
## Error: expected ';'!!!

proc ReadDisplacementOn*(this: var vtkBYUReader) {.importcpp: "ReadDisplacementOn",
    header: "vtkBYUReader.h".}
proc ReadDisplacementOff*(this: var vtkBYUReader) {.
    importcpp: "ReadDisplacementOff", header: "vtkBYUReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off the reading of the scalar file.
  ##
proc SetReadDisplacementReadScalar*(this: var vtkBYUReader; _arg: vtkTypeBool) {.
    importcpp: "SetReadDisplacementReadScalar", header: "vtkBYUReader.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetReadDisplacementReadScalar ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReadScalar  of  << this -> ReadScalar ) ; return this -> ReadScalar ; } ;
## Error: expected ';'!!!

proc ReadScalarOn*(this: var vtkBYUReader) {.importcpp: "ReadScalarOn",
    header: "vtkBYUReader.h".}
proc ReadScalarOff*(this: var vtkBYUReader) {.importcpp: "ReadScalarOff",
    header: "vtkBYUReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off the reading of the texture coordinate file.
  ##  Specify name of geometry FileName.
  ##
proc SetReadDisplacementReadScalarReadTexture*(this: var vtkBYUReader;
    _arg: vtkTypeBool) {.importcpp: "SetReadDisplacementReadScalarReadTexture",
                       header: "vtkBYUReader.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetReadDisplacementReadScalarReadTexture ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReadTexture  of  << this -> ReadTexture ) ; return this -> ReadTexture ; } ;
## Error: expected ';'!!!

proc ReadTextureOn*(this: var vtkBYUReader) {.importcpp: "ReadTextureOn",
    header: "vtkBYUReader.h".}
proc ReadTextureOff*(this: var vtkBYUReader) {.importcpp: "ReadTextureOff",
    header: "vtkBYUReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the part number to be read.
  ##
proc SetPartNumber*(this: var vtkBYUReader; _arg: cint) {.importcpp: "SetPartNumber",
    header: "vtkBYUReader.h".}
proc GetPartNumberMinValue*(this: var vtkBYUReader): cint {.
    importcpp: "GetPartNumberMinValue", header: "vtkBYUReader.h".}
proc GetPartNumberMaxValue*(this: var vtkBYUReader): cint {.
    importcpp: "GetPartNumberMaxValue", header: "vtkBYUReader.h".}
## !!!Ignored construct:  virtual int GetReadDisplacementReadScalarReadTexturePartNumber ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PartNumber  of  << this -> PartNumber ) ; return this -> PartNumber ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} *
##  Returns 1 if this file can be read and 0 if the file cannot be read.
##  Because BYU files do not have anything in the header specifying the file
##  type, the result is not definitive.  Invalid files may still return 1
##  although a valid file will never return 0.
##  static int CanReadFile ( VTK_FILEPATH const char * filename ) ;
## Error: token expected: ) but got: *!!!
