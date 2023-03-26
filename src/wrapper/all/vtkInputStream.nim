## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInputStream.h
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
##  @class   vtkInputStream
##  @brief   Wraps a binary input stream with a VTK interface.
##
##  vtkInputStream provides a VTK-style interface wrapping around a
##  standard input stream.  The access methods are virtual so that
##  subclasses can transparently provide decoding of an encoded stream.
##  Data lengths for Seek and Read calls refer to the length of the
##  input data.  The actual length in the stream may differ for
##  subclasses that implement an encoding scheme.
##

import
  vtkIOCoreModule, vtkObject

type
  vtkInputStream* {.importcpp: "vtkInputStream", header: "vtkInputStream.h", bycopy.} = object of vtkObject
    vtkInputStream* {.importc: "vtkInputStream".}: VTK_NEWINSTANCE

  vtkInputStreamSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkInputStream::IsTypeOf(@)", header: "vtkInputStream.h".}
proc IsA*(this: var vtkInputStream; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkInputStream.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkInputStream {.
    importcpp: "vtkInputStream::SafeDownCast(@)", header: "vtkInputStream.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkInputStream :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInputStream :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInputStream :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc New*(): ptr vtkInputStream {.importcpp: "vtkInputStream::New(@)",
                              header: "vtkInputStream.h".}
proc PrintSelf*(this: var vtkInputStream; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkInputStream.h".}
proc SetStream*(this: var vtkInputStream; _arg: ptr istream) {.importcpp: "SetStream",
    header: "vtkInputStream.h".}
## !!!Ignored construct:  virtual istream * GetStream ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Stream  of  << this -> Stream ) ; return this -> Stream ; } ;
## Error: expected ';'!!!

proc StartReading*(this: var vtkInputStream) {.importcpp: "StartReading",
    header: "vtkInputStream.h".}
proc Seek*(this: var vtkInputStream; offset: vtkTypeInt64): cint {.importcpp: "Seek",
    header: "vtkInputStream.h".}
proc Read*(this: var vtkInputStream; data: pointer; length: csize_t): csize_t {.
    importcpp: "Read", header: "vtkInputStream.h".}
proc EndReading*(this: var vtkInputStream) {.importcpp: "EndReading",
    header: "vtkInputStream.h".}