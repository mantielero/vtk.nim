## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageWriter.h
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
##  @class   vtkImageWriter
##  @brief   Writes images to files.
##
##  vtkImageWriter writes images to files with any data type. The data type of
##  the file is the same scalar type as the input.  The dimensionality
##  determines whether the data will be written in one or multiple files.
##  This class is used as the superclass of most image writing classes
##  such as vtkBMPWriter etc. It supports streaming.
##

import
  vtkIOImageModule, vtkImageAlgorithm

type
  vtkImageWriter* {.importcpp: "vtkImageWriter", header: "vtkImageWriter.h", bycopy.} = object of vtkImageAlgorithm
    vtkImageWriter* {.importc: "vtkImageWriter".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    ##  subclasses that do write to memory can override this
    ##  to implement the simple case


proc New*(): ptr vtkImageWriter {.importcpp: "vtkImageWriter::New(@)",
                              header: "vtkImageWriter.h".}
type
  vtkImageWriterSuperclass* = vtkImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageWriter::IsTypeOf(@)", header: "vtkImageWriter.h".}
proc IsA*(this: var vtkImageWriter; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkImageWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageWriter {.
    importcpp: "vtkImageWriter::SafeDownCast(@)", header: "vtkImageWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageWriter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageWriter.h".}
## !!!Ignored construct:  /@{ *
##  Specify file name for the image file. You should specify either
##  a FileName or a FilePrefix. Use FilePrefix if the data is stored
##  in multiple files.
##  virtual void SetFileNameFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Specify file prefix for the image file(s).You should specify either
##  a FileName or FilePrefix. Use FilePrefix if the data is stored
##  in multiple files.
##  virtual void SetFileNameFileNameFilePrefixFilePrefix ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FilePrefix  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FilePrefix == nullptr && _arg == nullptr ) { return ; } if ( this -> FilePrefix && _arg && ( ! strcmp ( this -> FilePrefix , _arg ) ) ) { return ; } delete [ ] this -> FilePrefix ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FilePrefix = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FilePrefix = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileNameFilePrefix ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FilePrefix  of  << ( this -> FilePrefix ? this -> FilePrefix : (null) ) ) ; return this -> FilePrefix ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  The snprintf format used to build filename from FilePrefix and number.
##  virtual void SetFileNameFileNameFilePrefixFilePrefixFilePatternFilePattern ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FilePattern  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FilePattern == nullptr && _arg == nullptr ) { return ; } if ( this -> FilePattern && _arg && ( ! strcmp ( this -> FilePattern , _arg ) ) ) { return ; } delete [ ] this -> FilePattern ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FilePattern = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FilePattern = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileNameFilePrefixFilePattern ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FilePattern  of  << ( this -> FilePattern ? this -> FilePattern : (null) ) ) ; return this -> FilePattern ; } ;
## Error: expected ';'!!!

proc SetFileDimensionality*(this: var vtkImageWriter; _arg: cint) {.
    importcpp: "SetFileDimensionality", header: "vtkImageWriter.h".}
## !!!Ignored construct:  virtual int GetFileDimensionality ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileDimensionality  of  << this -> FileDimensionality ) ; return this -> FileDimensionality ; } ;
## Error: expected ';'!!!

proc GetInput*(this: var vtkImageWriter): ptr vtkImageData {.importcpp: "GetInput",
    header: "vtkImageWriter.h".}
proc Write*(this: var vtkImageWriter) {.importcpp: "Write", header: "vtkImageWriter.h".}
proc DeleteFiles*(this: var vtkImageWriter) {.importcpp: "DeleteFiles",
    header: "vtkImageWriter.h".}