## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFrameBufferObjectBase.h
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
##  @class   vtkFrameBufferObjectBase
##  @brief   abstract interface to OpenGL FBOs
##
##  API for classes that encapsulate an OpenGL Frame Buffer Object.
##

import
  vtkObject, vtkRenderingCoreModule

discard "forward decl of vtkRenderer"
discard "forward decl of vtkProp"
discard "forward decl of vtkInformation"
type
  vtkFrameBufferObjectBase* {.importcpp: "vtkFrameBufferObjectBase",
                             header: "vtkFrameBufferObjectBase.h", bycopy.} = object of vtkObject
    vtkFrameBufferObjectBase* {.importc: "vtkFrameBufferObjectBase".}: VTK_NEWINSTANCE

  vtkFrameBufferObjectBaseSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkFrameBufferObjectBase::IsTypeOf(@)",
    header: "vtkFrameBufferObjectBase.h".}
proc IsA*(this: var vtkFrameBufferObjectBase; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkFrameBufferObjectBase.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkFrameBufferObjectBase {.
    importcpp: "vtkFrameBufferObjectBase::SafeDownCast(@)",
    header: "vtkFrameBufferObjectBase.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkFrameBufferObjectBase :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFrameBufferObjectBase :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFrameBufferObjectBase :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkFrameBufferObjectBase; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkFrameBufferObjectBase.h".}
proc GetLastSize*(this: var vtkFrameBufferObjectBase): ptr cint {.
    importcpp: "GetLastSize", header: "vtkFrameBufferObjectBase.h".}
proc GetLastSize*(this: var vtkFrameBufferObjectBase; _arg1: var cint; _arg2: var cint) {.
    importcpp: "GetLastSize", header: "vtkFrameBufferObjectBase.h".}
proc GetLastSize*(this: var vtkFrameBufferObjectBase; _arg: array[2, cint]) {.
    importcpp: "GetLastSize", header: "vtkFrameBufferObjectBase.h".}