## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGPUInfoList.h
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
##  @class   vtkGPUInfoList
##  @brief   Stores the list of GPUs VRAM information.
##
##  vtkGPUInfoList stores a list of vtkGPUInfo. An host can have
##  several GPUs. It creates and sets the list by probing the host with system
##  calls. This an abstract class. Concrete classes are OS specific.
##  @sa
##  vtkGPUInfo vtkDirectXGPUInfoList vtkCoreGraphicsGPUInfoList
##

import
  vtkObject, vtkRenderingCoreModule

discard "forward decl of vtkGPUInfoListArray"
discard "forward decl of vtkGPUInfo"
type
  vtkGPUInfoList* {.importcpp: "vtkGPUInfoList", header: "vtkGPUInfoList.h", bycopy.} = object of vtkObject ## /@{
                                                                                                  ## *
                                                                                                  ##  Default constructor. Set Probed to false. Set Array to NULL.
                                                                                                  ##
    vtkGPUInfoList* {.importc: "vtkGPUInfoList".}: VTK_NEWINSTANCE


proc New*(): ptr vtkGPUInfoList {.importcpp: "vtkGPUInfoList::New(@)",
                              header: "vtkGPUInfoList.h".}
type
  vtkGPUInfoListSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGPUInfoList::IsTypeOf(@)", header: "vtkGPUInfoList.h".}
proc IsA*(this: var vtkGPUInfoList; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkGPUInfoList.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGPUInfoList {.
    importcpp: "vtkGPUInfoList::SafeDownCast(@)", header: "vtkGPUInfoList.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGPUInfoList :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGPUInfoList :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGPUInfoList :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGPUInfoList; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGPUInfoList.h".}
proc Probe*(this: var vtkGPUInfoList) {.importcpp: "Probe", header: "vtkGPUInfoList.h".}
proc IsProbed*(this: var vtkGPUInfoList): bool {.importcpp: "IsProbed",
    header: "vtkGPUInfoList.h".}
proc GetNumberOfGPUs*(this: var vtkGPUInfoList): cint {.importcpp: "GetNumberOfGPUs",
    header: "vtkGPUInfoList.h".}
proc GetGPUInfo*(this: var vtkGPUInfoList; i: cint): ptr vtkGPUInfo {.
    importcpp: "GetGPUInfo", header: "vtkGPUInfoList.h".}