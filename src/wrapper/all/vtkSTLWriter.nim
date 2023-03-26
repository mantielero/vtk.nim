## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSTLWriter.h
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
##  @class   vtkSTLWriter
##  @brief   write stereo lithography files
##
##  vtkSTLWriter writes stereo lithography (.stl) files in either ASCII or
##  binary form. Stereo lithography files contain only triangles. Since VTK 8.1,
##  this writer converts non-triangle polygons into triangles, so there is no
##  longer a need to use vtkTriangleFilter prior to using this writer if the
##  input contains polygons with more than three vertices.
##
##  @warning
##  Binary files written on one system may not be readable on other systems.
##  vtkSTLWriter uses VAX or PC byte ordering and swaps bytes on other systems.
##

import
  vtkIOGeometryModule, vtkWriter

discard "forward decl of vtkCellArray"
discard "forward decl of vtkPoints"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkUnsignedCharArray"
type
  vtkSTLWriter* {.importcpp: "vtkSTLWriter", header: "vtkSTLWriter.h", bycopy.} = object of vtkWriter
    vtkSTLWriter* {.importc: "vtkSTLWriter".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH


proc New*(): ptr vtkSTLWriter {.importcpp: "vtkSTLWriter::New(@)",
                            header: "vtkSTLWriter.h".}
type
  vtkSTLWriterSuperclass* = vtkWriter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSTLWriter::IsTypeOf(@)", header: "vtkSTLWriter.h".}
proc IsA*(this: var vtkSTLWriter; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkSTLWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSTLWriter {.
    importcpp: "vtkSTLWriter::SafeDownCast(@)", header: "vtkSTLWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSTLWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSTLWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSTLWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSTLWriter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSTLWriter.h".}
proc GetInput*(this: var vtkSTLWriter): ptr vtkPolyData {.importcpp: "GetInput",
    header: "vtkSTLWriter.h".}
proc GetInput*(this: var vtkSTLWriter; port: cint): ptr vtkPolyData {.
    importcpp: "GetInput", header: "vtkSTLWriter.h".}
## !!!Ignored construct:  /@} /@{ *
##  Specify file name of vtk polygon data file to write.
##  virtual void SetFileNameFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

proc SetHeader*(this: var vtkSTLWriter; _arg: cstring) {.importcpp: "SetHeader",
    header: "vtkSTLWriter.h".}
proc GetHeader*(this: var vtkSTLWriter): cstring {.importcpp: "GetHeader",
    header: "vtkSTLWriter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set binary header for the file.
  ##  Binary header is only used when writing binary type files.
  ##  If both Header and BinaryHeader are specified then BinaryHeader is used.
  ##  Maximum length of binary header is 80 bytes, any content over this limit is ignored.
  ##
proc SetBinaryHeader*(this: var vtkSTLWriter; binaryHeader: ptr vtkUnsignedCharArray) {.
    importcpp: "SetBinaryHeader", header: "vtkSTLWriter.h".}
proc GetnameBinaryHeader*(this: var vtkSTLWriter): ptr vtkUnsignedCharArray {.
    importcpp: "GetnameBinaryHeader", header: "vtkSTLWriter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify file type (ASCII or BINARY) for vtk data file.
  ##
proc SetFileType*(this: var vtkSTLWriter; _arg: cint) {.importcpp: "SetFileType",
    header: "vtkSTLWriter.h".}
proc GetFileTypeMinValue*(this: var vtkSTLWriter): cint {.
    importcpp: "GetFileTypeMinValue", header: "vtkSTLWriter.h".}
proc GetFileTypeMaxValue*(this: var vtkSTLWriter): cint {.
    importcpp: "GetFileTypeMaxValue", header: "vtkSTLWriter.h".}
## !!!Ignored construct:  virtual int GetFileType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileType  of  << this -> FileType ) ; return this -> FileType ; } ;
## Error: expected ';'!!!

proc SetFileTypeToASCII*(this: var vtkSTLWriter) {.importcpp: "SetFileTypeToASCII",
    header: "vtkSTLWriter.h".}
proc SetFileTypeToBinary*(this: var vtkSTLWriter) {.
    importcpp: "SetFileTypeToBinary", header: "vtkSTLWriter.h".}