## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGPUInfo.h
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
##  @class   vtkGPUInfo
##  @brief   Stores GPU VRAM information.
##
##  vtkGPUInfo stores information about GPU Video RAM. An host can have
##  several GPUs. The values are set by vtkGPUInfoList.
##  @sa
##  vtkGPUInfoList vtkDirectXGPUInfoList vtkCoreGraphicsGPUInfoList
##

import
  vtkObject, vtkRenderingCoreModule

type
  vtkGPUInfo* {.importcpp: "vtkGPUInfo", header: "vtkGPUInfo.h", bycopy.} = object of vtkObject
    vtkGPUInfo* {.importc: "vtkGPUInfo".}: VTK_NEWINSTANCE


proc New*(): ptr vtkGPUInfo {.importcpp: "vtkGPUInfo::New(@)", header: "vtkGPUInfo.h".}
type
  vtkGPUInfoSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkGPUInfo::IsTypeOf(@)",
    header: "vtkGPUInfo.h".}
proc IsA*(this: var vtkGPUInfo; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkGPUInfo.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGPUInfo {.
    importcpp: "vtkGPUInfo::SafeDownCast(@)", header: "vtkGPUInfo.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGPUInfo :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGPUInfo :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGPUInfo :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGPUInfo; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGPUInfo.h".}
proc SetDedicatedVideoMemory*(this: var vtkGPUInfo; _arg: vtkTypeUInt64) {.
    importcpp: "SetDedicatedVideoMemory", header: "vtkGPUInfo.h".}
## !!!Ignored construct:  virtual vtkTypeUInt64 GetDedicatedVideoMemory ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DedicatedVideoMemory  of  << this -> DedicatedVideoMemory ) ; return this -> DedicatedVideoMemory ; } ;
## Error: expected ';'!!!

proc SetDedicatedVideoMemoryDedicatedSystemMemory*(this: var vtkGPUInfo;
    _arg: vtkTypeUInt64) {.importcpp: "SetDedicatedVideoMemoryDedicatedSystemMemory",
                         header: "vtkGPUInfo.h".}
## !!!Ignored construct:  virtual vtkTypeUInt64 GetDedicatedVideoMemoryDedicatedSystemMemory ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DedicatedSystemMemory  of  << this -> DedicatedSystemMemory ) ; return this -> DedicatedSystemMemory ; } ;
## Error: expected ';'!!!

proc SetDedicatedVideoMemoryDedicatedSystemMemorySharedSystemMemory*(
    this: var vtkGPUInfo; _arg: vtkTypeUInt64) {.importcpp: "SetDedicatedVideoMemoryDedicatedSystemMemorySharedSystemMemory",
    header: "vtkGPUInfo.h".}
## !!!Ignored construct:  virtual vtkTypeUInt64 GetDedicatedVideoMemoryDedicatedSystemMemorySharedSystemMemory ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SharedSystemMemory  of  << this -> SharedSystemMemory ) ; return this -> SharedSystemMemory ; } ;
## Error: expected ';'!!!
