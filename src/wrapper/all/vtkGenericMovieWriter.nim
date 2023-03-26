## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGenericMovieWriter.h
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
##  @class   vtkGenericMovieWriter
##  @brief   an abstract movie writer class.
##
##  vtkGenericMovieWriter is the abstract base class for several movie
##  writers. The input type is a vtkImageData. The Start() method will
##  open and create the file, the Write() method will output a frame to
##  the file (i.e. the contents of the vtkImageData), End() will finalize
##  and close the file.
##  @sa
##  vtkAVIWriter
##

import
  vtkIOMovieModule, vtkImageAlgorithm

discard "forward decl of vtkImageData"
type
  vtkGenericMovieWriter* {.importcpp: "vtkGenericMovieWriter",
                          header: "vtkGenericMovieWriter.h", bycopy.} = object of vtkImageAlgorithm
    vtkGenericMovieWriter* {.importc: "vtkGenericMovieWriter".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH

  vtkGenericMovieWriterSuperclass* = vtkImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGenericMovieWriter::IsTypeOf(@)",
    header: "vtkGenericMovieWriter.h".}
proc IsA*(this: var vtkGenericMovieWriter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkGenericMovieWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGenericMovieWriter {.
    importcpp: "vtkGenericMovieWriter::SafeDownCast(@)",
    header: "vtkGenericMovieWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGenericMovieWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGenericMovieWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGenericMovieWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGenericMovieWriter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGenericMovieWriter.h".}
## !!!Ignored construct:  /@{ *
##  Specify file name of avi file.
##  virtual void SetFileNameFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

proc Start*(this: var vtkGenericMovieWriter) {.importcpp: "Start",
    header: "vtkGenericMovieWriter.h".}
proc Write*(this: var vtkGenericMovieWriter) {.importcpp: "Write",
    header: "vtkGenericMovieWriter.h".}
proc End*(this: var vtkGenericMovieWriter) {.importcpp: "End",
    header: "vtkGenericMovieWriter.h".}
## !!!Ignored construct:  /@} /@{ *
##  Was there an error on the last write performed?
##  virtual int GetErrorError ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Error  of  << this -> Error ) ; return this -> Error ; } ;
## Error: expected ';'!!!

proc GetStringFromErrorCode*(error: culong): cstring {.
    importcpp: "vtkGenericMovieWriter::GetStringFromErrorCode(@)",
    header: "vtkGenericMovieWriter.h".}
type
  vtkGenericMovieWriterMovieWriterErrorIds* {.size: sizeof(cint),
      importcpp: "vtkGenericMovieWriter::MovieWriterErrorIds",
      header: "vtkGenericMovieWriter.h".} = enum
    UserError = 40000,          ##  must match vtkErrorCode::UserError
    InitError, NoInputError, CanNotCompress, CanNotFormat, ChangedResolutionError

