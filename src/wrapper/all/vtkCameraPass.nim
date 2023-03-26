## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCameraPass.h
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
##  @class   vtkCameraPass
##  @brief   Implement the camera render pass.
##
##  Render the camera.
##
##  It setups the projection and modelview matrices and can clear the background
##  It calls its delegate once.
##  After its delegate returns, it restore the modelview matrix stack.
##
##  Its delegate is usually set to a vtkSequencePass with a vtkLightsPass and
##  a list of passes for the geometry.
##
##  @sa
##  vtkRenderPass
##

import
  vtkRenderPass, vtkRenderingOpenGL2Module

type
  vtkCameraPass* {.importcpp: "vtkCameraPass", header: "vtkCameraPass.h", bycopy.} = object of vtkRenderPass ## /@}
                                                                                                   ## *
                                                                                                   ##  Default constructor. DelegatePass is set to NULL.
                                                                                                   ##
    vtkCameraPass* {.importc: "vtkCameraPass".}: VTK_NEWINSTANCE


proc New*(): ptr vtkCameraPass {.importcpp: "vtkCameraPass::New(@)",
                             header: "vtkCameraPass.h".}
type
  vtkCameraPassSuperclass* = vtkRenderPass

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCameraPass::IsTypeOf(@)", header: "vtkCameraPass.h".}
proc IsA*(this: var vtkCameraPass; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkCameraPass.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCameraPass {.
    importcpp: "vtkCameraPass::SafeDownCast(@)", header: "vtkCameraPass.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCameraPass :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkRenderPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCameraPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCameraPass :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCameraPass; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCameraPass.h".}
proc Render*(this: var vtkCameraPass; s: ptr vtkRenderState) {.importcpp: "Render",
    header: "vtkCameraPass.h".}
proc ReleaseGraphicsResources*(this: var vtkCameraPass; w: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkCameraPass.h".}
proc GetnameDelegatePass*(this: var vtkCameraPass): ptr vtkRenderPass {.
    importcpp: "GetnameDelegatePass", header: "vtkCameraPass.h".}
proc SetDelegatePass*(this: var vtkCameraPass; delegatePass: ptr vtkRenderPass) {.
    importcpp: "SetDelegatePass", header: "vtkCameraPass.h".}
proc SetAspectRatioOverride*(this: var vtkCameraPass; _arg: cdouble) {.
    importcpp: "SetAspectRatioOverride", header: "vtkCameraPass.h".}
## !!!Ignored construct:  virtual double GetAspectRatioOverride ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AspectRatioOverride  of  << this -> AspectRatioOverride ) ; return this -> AspectRatioOverride ; } ;
## Error: expected ';'!!!
