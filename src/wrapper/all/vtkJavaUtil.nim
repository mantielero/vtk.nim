## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkJavaUtil.h
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

import
  vtkCommand, vtkJavaModule, vtkSystemIncludes

proc vtkJavaGetPointerFromObject*(env: ptr JNIEnv; obj: jobject): pointer {.
    importcpp: "vtkJavaGetPointerFromObject(@)", header: "vtkJavaUtil.h".}
proc vtkJavaUTF8ToChars*(env: ptr JNIEnv; bytes: jbyteArray; length: jint): cstring {.
    importcpp: "vtkJavaUTF8ToChars(@)", header: "vtkJavaUtil.h".}
proc vtkJavaUTF8ToString*(env: ptr JNIEnv; bytes: jbyteArray; length: jint): string {.
    importcpp: "vtkJavaUTF8ToString(@)", header: "vtkJavaUtil.h".}
proc vtkJavaCharsToUTF8*(env: ptr JNIEnv; chars: cstring; length: csize_t): jbyteArray {.
    importcpp: "vtkJavaCharsToUTF8(@)", header: "vtkJavaUtil.h".}
proc vtkJavaStringToUTF8*(env: ptr JNIEnv; text: string): jbyteArray {.
    importcpp: "vtkJavaStringToUTF8(@)", header: "vtkJavaUtil.h".}
proc vtkJavaMakeJArrayOfBoolean*(env: ptr JNIEnv; `ptr`: ptr jboolean; size: cint): jbooleanArray {.
    importcpp: "vtkJavaMakeJArrayOfBoolean(@)", header: "vtkJavaUtil.h".}
proc vtkJavaMakeJArrayOfDouble*(env: ptr JNIEnv; `ptr`: ptr jdouble; size: cint): jdoubleArray {.
    importcpp: "vtkJavaMakeJArrayOfDouble(@)", header: "vtkJavaUtil.h".}
proc vtkJavaMakeJArrayOfFloat*(env: ptr JNIEnv; `ptr`: ptr jfloat; size: cint): jfloatArray {.
    importcpp: "vtkJavaMakeJArrayOfFloat(@)", header: "vtkJavaUtil.h".}
proc vtkJavaMakeJArrayOfByte*(env: ptr JNIEnv; `ptr`: ptr jbyte; size: cint): jbyteArray {.
    importcpp: "vtkJavaMakeJArrayOfByte(@)", header: "vtkJavaUtil.h".}
proc vtkJavaMakeJArrayOfShort*(env: ptr JNIEnv; `ptr`: ptr jshort; size: cint): jshortArray {.
    importcpp: "vtkJavaMakeJArrayOfShort(@)", header: "vtkJavaUtil.h".}
proc vtkJavaMakeJArrayOfInt*(env: ptr JNIEnv; `ptr`: ptr jint; size: cint): jintArray {.
    importcpp: "vtkJavaMakeJArrayOfInt(@)", header: "vtkJavaUtil.h".}
proc vtkJavaMakeJArrayOfLong*(env: ptr JNIEnv; `ptr`: ptr jlong; size: cint): jlongArray {.
    importcpp: "vtkJavaMakeJArrayOfLong(@)", header: "vtkJavaUtil.h".}
##  this is the void pointer parameter passed to the vtk callback routines on
##  behalf of the Java interface for callbacks.

type
  vtkJavaVoidFuncArg* {.importcpp: "vtkJavaVoidFuncArg", header: "vtkJavaUtil.h",
                       bycopy.} = object
    vm* {.importc: "vm".}: ptr JavaVM
    uobj* {.importc: "uobj".}: jobject
    mid* {.importc: "mid".}: jmethodID


proc vtkJavaVoidFunc*(a1: pointer) {.importcpp: "vtkJavaVoidFunc(@)",
                                  header: "vtkJavaUtil.h".}
proc vtkJavaVoidFuncArgDelete*(a1: pointer) {.
    importcpp: "vtkJavaVoidFuncArgDelete(@)", header: "vtkJavaUtil.h".}
type
  vtkJavaCommand* {.importcpp: "vtkJavaCommand", header: "vtkJavaUtil.h", bycopy.} = object of vtkCommand
    vm* {.importc: "vm".}: ptr JavaVM
    uobj* {.importc: "uobj".}: jobject
    mid* {.importc: "mid".}: jmethodID


proc New*(): ptr vtkJavaCommand {.importcpp: "vtkJavaCommand::New(@)",
                              header: "vtkJavaUtil.h".}
proc SetGlobalRef*(this: var vtkJavaCommand; obj: jobject) {.
    importcpp: "SetGlobalRef", header: "vtkJavaUtil.h".}
proc SetMethodID*(this: var vtkJavaCommand; id: jmethodID) {.importcpp: "SetMethodID",
    header: "vtkJavaUtil.h".}
proc AssignJavaVM*(this: var vtkJavaCommand; env: ptr JNIEnv) {.
    importcpp: "AssignJavaVM", header: "vtkJavaUtil.h".}
proc Execute*(this: var vtkJavaCommand; a2: ptr vtkObject; a3: culong; a4: pointer) {.
    importcpp: "Execute", header: "vtkJavaUtil.h".}
##  VTK-HeaderTest-Exclude: vtkJavaUtil.h
