## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDataEncoder.h
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
##  @class   vtkDataEncoder
##  @brief   class used to compress/encode images using threads.
##
##  vtkDataEncoder is used to compress and encode images using threads.
##  Multiple images can be pushed into the encoder for compression and encoding.
##  We use a vtkTypeUInt32 as the key to identify different image pipes. The
##  images in each pipe will be processed in parallel threads. The latest
##  compressed and encoded image can be accessed using GetLatestOutput().
##
##  vtkDataEncoder uses a thread-pool to do the compression and encoding in
##  parallel.  Note that images may not come out of the vtkDataEncoder in the
##  same order as they are pushed in, if an image pushed in at N-th location
##  takes longer to compress and encode than that pushed in at N+1-th location or
##  if it was pushed in before the N-th location was even taken up for encoding
##  by the a thread in the thread pool.
##

import
  vtkDeprecation, vtkObject, vtkSmartPointer, vtkWebCoreModule

discard "forward decl of vtkUnsignedCharArray"
discard "forward decl of vtkImageData"
type
  vtkDataEncoder* {.importcpp: "vtkDataEncoder", header: "vtkDataEncoder.h", bycopy.} = object of vtkObject
    vtkDataEncoder* {.importc: "vtkDataEncoder".}: VTK_NEWINSTANCE


proc New*(): ptr vtkDataEncoder {.importcpp: "vtkDataEncoder::New(@)",
                              header: "vtkDataEncoder.h".}
type
  vtkDataEncoderSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDataEncoder::IsTypeOf(@)", header: "vtkDataEncoder.h".}
proc IsA*(this: var vtkDataEncoder; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkDataEncoder.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDataEncoder {.
    importcpp: "vtkDataEncoder::SafeDownCast(@)", header: "vtkDataEncoder.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDataEncoder :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDataEncoder :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDataEncoder :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDataEncoder; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkDataEncoder.h".}
proc SetMaxThreads*(this: var vtkDataEncoder; a2: vtkTypeUInt32) {.
    importcpp: "SetMaxThreads", header: "vtkDataEncoder.h".}
## !!!Ignored construct:  virtual vtkTypeUInt32 GetMaxThreads ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaxThreads  of  << this -> MaxThreads ) ; return this -> MaxThreads ; } ;
## Error: expected ';'!!!

proc Initialize*(this: var vtkDataEncoder) {.importcpp: "Initialize",
    header: "vtkDataEncoder.h".}
## !!!Ignored construct:  *
##  Push an image into the encoder. It is not safe to modify the image
##  after this point, including changing the reference counts for it.
##  You may run into thread safety issues. Typically,
##  the caller code will simply release reference to the data and stop using
##  it. vtkDataEncoder takes over the reference for the image and will call
##  vtkObject::UnRegister() on it when it's done.
##  encoding can be set to 0 to skip encoding.
##  VTK_DEPRECATED_IN_9_1_0 ( replaced by Push ) void PushAndTakeReference ( vtkTypeUInt32 key , vtkImageData * & data , int quality , int encoding = 1 ) ;
## Error: identifier expected, but got: replaced by Push!!!

proc Push*(this: var vtkDataEncoder; key: vtkTypeUInt32; data: ptr vtkImageData;
          quality: cint; encoding: cint = 1) {.importcpp: "Push",
    header: "vtkDataEncoder.h".}
proc GetLatestOutput*(this: var vtkDataEncoder; key: vtkTypeUInt32;
                     data: var vtkSmartPointer[vtkUnsignedCharArray]): bool {.
    importcpp: "GetLatestOutput", header: "vtkDataEncoder.h".}
proc Flush*(this: var vtkDataEncoder; key: vtkTypeUInt32) {.importcpp: "Flush",
    header: "vtkDataEncoder.h".}
proc EncodeAsBase64Png*(this: var vtkDataEncoder; img: ptr vtkImageData;
                       compressionLevel: cint = 5): cstring {.
    importcpp: "EncodeAsBase64Png", header: "vtkDataEncoder.h".}
proc EncodeAsBase64Jpg*(this: var vtkDataEncoder; img: ptr vtkImageData;
                       quality: cint = 50): cstring {.importcpp: "EncodeAsBase64Jpg",
    header: "vtkDataEncoder.h".}
proc Finalize*(this: var vtkDataEncoder) {.importcpp: "Finalize",
                                       header: "vtkDataEncoder.h".}