## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBYUWriter.h
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
##  @class   vtkBYUWriter
##  @brief   write MOVIE.BYU files
##
##  vtkBYUWriter writes MOVIE.BYU polygonal files. These files consist
##  of a geometry file (.g), a scalar file (.s), a displacement or
##  vector file (.d), and a 2D texture coordinate file (.t). These files
##  must be specified to the object, the appropriate boolean
##  variables must be true, and data must be available from the input
##  for the files to be written.
##  WARNING: this writer does not currently write triangle strips. Use
##  vtkTriangleFilter to convert strips to triangles.
##

import
  vtkIOGeometryModule, vtkWriter

discard "forward decl of vtkPolyData"
type
  vtkBYUWriter* {.importcpp: "vtkBYUWriter", header: "vtkBYUWriter.h", bycopy.} = object of vtkWriter
    vtkBYUWriter* {.importc: "vtkBYUWriter".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH


proc New*(): ptr vtkBYUWriter {.importcpp: "vtkBYUWriter::New(@)",
                            header: "vtkBYUWriter.h".}
type
  vtkBYUWriterSuperclass* = vtkWriter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkBYUWriter::IsTypeOf(@)", header: "vtkBYUWriter.h".}
proc IsA*(this: var vtkBYUWriter; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkBYUWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBYUWriter {.
    importcpp: "vtkBYUWriter::SafeDownCast(@)", header: "vtkBYUWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBYUWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBYUWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBYUWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkBYUWriter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkBYUWriter.h".}
## !!!Ignored construct:  /@{ *
##  Specify the name of the geometry file to write.
##  virtual void SetGeometryFileNameGeometryFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << GeometryFileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> GeometryFileName == nullptr && _arg == nullptr ) { return ; } if ( this -> GeometryFileName && _arg && ( ! strcmp ( this -> GeometryFileName , _arg ) ) ) { return ; } delete [ ] this -> GeometryFileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> GeometryFileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> GeometryFileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetGeometryFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GeometryFileName  of  << ( this -> GeometryFileName ? this -> GeometryFileName : (null) ) ) ; return this -> GeometryFileName ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Specify the name of the displacement file to write.
##  virtual void SetGeometryFileNameGeometryFileNameDisplacementFileNameDisplacementFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << DisplacementFileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> DisplacementFileName == nullptr && _arg == nullptr ) { return ; } if ( this -> DisplacementFileName && _arg && ( ! strcmp ( this -> DisplacementFileName , _arg ) ) ) { return ; } delete [ ] this -> DisplacementFileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> DisplacementFileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> DisplacementFileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetGeometryFileNameDisplacementFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DisplacementFileName  of  << ( this -> DisplacementFileName ? this -> DisplacementFileName : (null) ) ) ; return this -> DisplacementFileName ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Specify the name of the scalar file to write.
##  virtual void SetGeometryFileNameGeometryFileNameDisplacementFileNameDisplacementFileNameScalarFileNameScalarFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ScalarFileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> ScalarFileName == nullptr && _arg == nullptr ) { return ; } if ( this -> ScalarFileName && _arg && ( ! strcmp ( this -> ScalarFileName , _arg ) ) ) { return ; } delete [ ] this -> ScalarFileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> ScalarFileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> ScalarFileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetGeometryFileNameDisplacementFileNameScalarFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarFileName  of  << ( this -> ScalarFileName ? this -> ScalarFileName : (null) ) ) ; return this -> ScalarFileName ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Specify the name of the texture file to write.
##  virtual void SetGeometryFileNameGeometryFileNameDisplacementFileNameDisplacementFileNameScalarFileNameScalarFileNameTextureFileNameTextureFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << TextureFileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> TextureFileName == nullptr && _arg == nullptr ) { return ; } if ( this -> TextureFileName && _arg && ( ! strcmp ( this -> TextureFileName , _arg ) ) ) { return ; } delete [ ] this -> TextureFileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> TextureFileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> TextureFileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetGeometryFileNameDisplacementFileNameScalarFileNameTextureFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TextureFileName  of  << ( this -> TextureFileName ? this -> TextureFileName : (null) ) ) ; return this -> TextureFileName ; } ;
## Error: expected ';'!!!

proc SetWriteDisplacement*(this: var vtkBYUWriter; _arg: vtkTypeBool) {.
    importcpp: "SetWriteDisplacement", header: "vtkBYUWriter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetWriteDisplacement ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WriteDisplacement  of  << this -> WriteDisplacement ) ; return this -> WriteDisplacement ; } ;
## Error: expected ';'!!!

proc WriteDisplacementOn*(this: var vtkBYUWriter) {.
    importcpp: "WriteDisplacementOn", header: "vtkBYUWriter.h".}
proc WriteDisplacementOff*(this: var vtkBYUWriter) {.
    importcpp: "WriteDisplacementOff", header: "vtkBYUWriter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off writing the scalar file.
  ##
proc SetWriteDisplacementWriteScalar*(this: var vtkBYUWriter; _arg: vtkTypeBool) {.
    importcpp: "SetWriteDisplacementWriteScalar", header: "vtkBYUWriter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetWriteDisplacementWriteScalar ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WriteScalar  of  << this -> WriteScalar ) ; return this -> WriteScalar ; } ;
## Error: expected ';'!!!

proc WriteScalarOn*(this: var vtkBYUWriter) {.importcpp: "WriteScalarOn",
    header: "vtkBYUWriter.h".}
proc WriteScalarOff*(this: var vtkBYUWriter) {.importcpp: "WriteScalarOff",
    header: "vtkBYUWriter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off writing the texture file.
  ##
proc SetWriteDisplacementWriteScalarWriteTexture*(this: var vtkBYUWriter;
    _arg: vtkTypeBool) {.importcpp: "SetWriteDisplacementWriteScalarWriteTexture",
                       header: "vtkBYUWriter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetWriteDisplacementWriteScalarWriteTexture ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WriteTexture  of  << this -> WriteTexture ) ; return this -> WriteTexture ; } ;
## Error: expected ';'!!!

proc WriteTextureOn*(this: var vtkBYUWriter) {.importcpp: "WriteTextureOn",
    header: "vtkBYUWriter.h".}
proc WriteTextureOff*(this: var vtkBYUWriter) {.importcpp: "WriteTextureOff",
    header: "vtkBYUWriter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the input to this writer.
  ##
proc GetInput*(this: var vtkBYUWriter): ptr vtkPolyData {.importcpp: "GetInput",
    header: "vtkBYUWriter.h".}
proc GetInput*(this: var vtkBYUWriter; port: cint): ptr vtkPolyData {.
    importcpp: "GetInput", header: "vtkBYUWriter.h".}