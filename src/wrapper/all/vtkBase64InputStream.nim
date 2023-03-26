## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBase64InputStream.h
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
##  @class   vtkBase64InputStream
##  @brief   Reads base64-encoded input from a stream.
##
##  vtkBase64InputStream implements base64 decoding with the
##  vtkInputStream interface.
##

import
  vtkIOCoreModule, vtkInputStream

type
  vtkBase64InputStream* {.importcpp: "vtkBase64InputStream",
                         header: "vtkBase64InputStream.h", bycopy.} = object of vtkInputStream
    vtkBase64InputStream* {.importc: "vtkBase64InputStream".}: VTK_NEWINSTANCE
    ##  Reads 4 bytes from the input stream and decodes them into 3 bytes.

  vtkBase64InputStreamSuperclass* = vtkInputStream

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkBase64InputStream::IsTypeOf(@)",
    header: "vtkBase64InputStream.h".}
proc IsA*(this: var vtkBase64InputStream; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkBase64InputStream.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBase64InputStream {.
    importcpp: "vtkBase64InputStream::SafeDownCast(@)",
    header: "vtkBase64InputStream.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBase64InputStream :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInputStream :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBase64InputStream :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBase64InputStream :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc New*(): ptr vtkBase64InputStream {.importcpp: "vtkBase64InputStream::New(@)",
                                    header: "vtkBase64InputStream.h".}
proc PrintSelf*(this: var vtkBase64InputStream; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkBase64InputStream.h".}
proc StartReading*(this: var vtkBase64InputStream) {.importcpp: "StartReading",
    header: "vtkBase64InputStream.h".}
proc Seek*(this: var vtkBase64InputStream; offset: vtkTypeInt64): cint {.
    importcpp: "Seek", header: "vtkBase64InputStream.h".}
proc Read*(this: var vtkBase64InputStream; data: pointer; length: csize_t): csize_t {.
    importcpp: "Read", header: "vtkBase64InputStream.h".}
proc EndReading*(this: var vtkBase64InputStream) {.importcpp: "EndReading",
    header: "vtkBase64InputStream.h".}