## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMultiThreader.h
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
##  @class   vtkMultiThreader
##  @brief   A class for performing multithreaded execution
##
##  vtkMultithreader is a class that provides support for multithreaded
##  execution using pthreads on POSIX systems, or Win32 threads on
##  Windows.  This class can be used to execute a single
##  method on multiple threads, or to specify a method per thread.
##

import
  vtkCommonCoreModule, vtkObject, vtkThreads

when defined(VTK_USE_PTHREADS):
  discard
##  If VTK_USE_PTHREADS is defined, then pthread_create() will be
##  used to create multiple threads
##  If VTK_USE_PTHREADS is defined, then the multithreaded
##  function is of type void *, and returns nullptr
##  Otherwise the type is void which is correct for WIN32
##  Defined in vtkThreads.h:
##    VTK_MAX_THREADS
##    VTK_THREAD_RETURN_VALUE
##    VTK_THREAD_RETURN_TYPE

when defined(VTK_USE_PTHREADS):
  type
    vtkThreadFunctionType* = proc (a1: pointer): pointer
    vtkThreadProcessIDType* = pthread_t
  ##  #define VTK_THREAD_RETURN_VALUE  nullptr
  ##  #define VTK_THREAD_RETURN_TYPE   void *
  type
    vtkMultiThreaderIDType* = pthread_t
when defined(VTK_USE_WIN32_THREADS):
  type
    vtkThreadFunctionType* = vtkWindowsLPTHREAD_START_ROUTINE
    vtkThreadProcessIDType* = vtkWindowsHANDLE
  ##  #define VTK_THREAD_RETURN_VALUE 0
  ##  #define VTK_THREAD_RETURN_TYPE DWORD __stdcall
  type
    vtkMultiThreaderIDType* = vtkWindowsDWORD
when not defined(VTK_USE_PTHREADS) and not defined(VTK_USE_WIN32_THREADS):
  type
    vtkThreadFunctionType* = proc (a1: pointer)
    vtkThreadProcessIDType* = cint
  ##  #define VTK_THREAD_RETURN_VALUE
  ##  #define VTK_THREAD_RETURN_TYPE void
  type
    vtkMultiThreaderIDType* = cint
type
  vtkMultiThreader* {.importcpp: "vtkMultiThreader", header: "vtkMultiThreader.h",
                     bycopy.} = object of vtkObject
    vtkMultiThreader* {.importc: "vtkMultiThreader".}: VTK_NEWINSTANCE
    ##  An array of thread info containing a thread id
    ##  (0, 1, 2, .. VTK_MAX_THREADS-1), the thread count, and a pointer
    ##  to void so that user data can be passed to each thread
    ##  The methods
    ##  Storage of MutexFunctions and ints used to control spawned
    ##  threads and the spawned thread ids
    ##  Internal storage of the data


proc New*(): ptr vtkMultiThreader {.importcpp: "vtkMultiThreader::New(@)",
                                header: "vtkMultiThreader.h".}
type
  vtkMultiThreaderSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMultiThreader::IsTypeOf(@)", header: "vtkMultiThreader.h".}
proc IsA*(this: var vtkMultiThreader; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkMultiThreader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMultiThreader {.
    importcpp: "vtkMultiThreader::SafeDownCast(@)", header: "vtkMultiThreader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMultiThreader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMultiThreader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMultiThreader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkMultiThreader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkMultiThreader.h".}
type
  vtkMultiThreaderThreadInfo* {.importcpp: "vtkMultiThreader::ThreadInfo",
                               header: "vtkMultiThreader.h", bycopy.} = object
    ThreadID* {.importc: "ThreadID".}: cint
    NumberOfThreads* {.importc: "NumberOfThreads".}: cint
    ActiveFlag* {.importc: "ActiveFlag".}: ptr cint
    ActiveFlagLock* {.importc: "ActiveFlagLock".}: ptr mutex
    UserData* {.importc: "UserData".}: pointer


proc SetNumberOfThreads*(this: var vtkMultiThreader; _arg: cint) {.
    importcpp: "SetNumberOfThreads", header: "vtkMultiThreader.h".}
proc GetNumberOfThreadsMinValue*(this: var vtkMultiThreader): cint {.
    importcpp: "GetNumberOfThreadsMinValue", header: "vtkMultiThreader.h".}
proc GetNumberOfThreadsMaxValue*(this: var vtkMultiThreader): cint {.
    importcpp: "GetNumberOfThreadsMaxValue", header: "vtkMultiThreader.h".}
proc GetNumberOfThreads*(this: var vtkMultiThreader): cint {.
    importcpp: "GetNumberOfThreads", header: "vtkMultiThreader.h".}
proc GetGlobalStaticMaximumNumberOfThreads*(): cint {.
    importcpp: "vtkMultiThreader::GetGlobalStaticMaximumNumberOfThreads(@)",
    header: "vtkMultiThreader.h".}
proc SetGlobalMaximumNumberOfThreads*(val: cint) {.
    importcpp: "vtkMultiThreader::SetGlobalMaximumNumberOfThreads(@)",
    header: "vtkMultiThreader.h".}
proc GetGlobalMaximumNumberOfThreads*(): cint {.
    importcpp: "vtkMultiThreader::GetGlobalMaximumNumberOfThreads(@)",
    header: "vtkMultiThreader.h".}
proc SetGlobalDefaultNumberOfThreads*(val: cint) {.
    importcpp: "vtkMultiThreader::SetGlobalDefaultNumberOfThreads(@)",
    header: "vtkMultiThreader.h".}
proc GetGlobalDefaultNumberOfThreads*(): cint {.
    importcpp: "vtkMultiThreader::GetGlobalDefaultNumberOfThreads(@)",
    header: "vtkMultiThreader.h".}
proc SingleMethodExecute*(this: var vtkMultiThreader) {.
    importcpp: "SingleMethodExecute", header: "vtkMultiThreader.h".}
proc MultipleMethodExecute*(this: var vtkMultiThreader) {.
    importcpp: "MultipleMethodExecute", header: "vtkMultiThreader.h".}
proc SetSingleMethod*(this: var vtkMultiThreader; a2: vtkThreadFunctionType;
                     data: pointer) {.importcpp: "SetSingleMethod",
                                    header: "vtkMultiThreader.h".}
proc SetMultipleMethod*(this: var vtkMultiThreader; index: cint;
                       a3: vtkThreadFunctionType; data: pointer) {.
    importcpp: "SetMultipleMethod", header: "vtkMultiThreader.h".}
proc SpawnThread*(this: var vtkMultiThreader; a2: vtkThreadFunctionType; data: pointer): cint {.
    importcpp: "SpawnThread", header: "vtkMultiThreader.h".}
proc TerminateThread*(this: var vtkMultiThreader; threadId: cint) {.
    importcpp: "TerminateThread", header: "vtkMultiThreader.h".}
proc IsThreadActive*(this: var vtkMultiThreader; threadId: cint): vtkTypeBool {.
    importcpp: "IsThreadActive", header: "vtkMultiThreader.h".}
proc GetCurrentThreadID*(): vtkMultiThreaderIDType {.
    importcpp: "vtkMultiThreader::GetCurrentThreadID(@)",
    header: "vtkMultiThreader.h".}
proc ThreadsEqual*(t1: vtkMultiThreaderIDType; t2: vtkMultiThreaderIDType): vtkTypeBool {.
    importcpp: "vtkMultiThreader::ThreadsEqual(@)", header: "vtkMultiThreader.h".}
type
  ThreadInfoStruct* = vtkMultiThreaderThreadInfo

## ignored statement
