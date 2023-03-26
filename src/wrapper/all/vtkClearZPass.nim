## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkClearZPass.h
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
##  @class   vtkClearZPass
##  @brief   Clear the depth buffer with a given value.
##
##  Clear the depth buffer with a given value.
##
##  @sa
##  vtkRenderPass
##

import
  vtkRenderPass, vtkRenderingOpenGL2Module

discard "forward decl of vtkOpenGLRenderWindow"
type
  vtkClearZPass* {.importcpp: "vtkClearZPass", header: "vtkClearZPass.h", bycopy.} = object of vtkRenderPass ## *
                                                                                                   ##  Default constructor.
                                                                                                   ##
    vtkClearZPass* {.importc: "vtkClearZPass".}: VTK_NEWINSTANCE


proc New*(): ptr vtkClearZPass {.importcpp: "vtkClearZPass::New(@)",
                             header: "vtkClearZPass.h".}
type
  vtkClearZPassSuperclass* = vtkRenderPass

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkClearZPass::IsTypeOf(@)", header: "vtkClearZPass.h".}
proc IsA*(this: var vtkClearZPass; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkClearZPass.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkClearZPass {.
    importcpp: "vtkClearZPass::SafeDownCast(@)", header: "vtkClearZPass.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkClearZPass :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkRenderPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkClearZPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkClearZPass :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkClearZPass; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkClearZPass.h".}
proc Render*(this: var vtkClearZPass; s: ptr vtkRenderState) {.importcpp: "Render",
    header: "vtkClearZPass.h".}
proc SetDepth*(this: var vtkClearZPass; _arg: cdouble) {.importcpp: "SetDepth",
    header: "vtkClearZPass.h".}
proc GetDepthMinValue*(this: var vtkClearZPass): cdouble {.
    importcpp: "GetDepthMinValue", header: "vtkClearZPass.h".}
proc GetDepthMaxValue*(this: var vtkClearZPass): cdouble {.
    importcpp: "GetDepthMaxValue", header: "vtkClearZPass.h".}
## !!!Ignored construct:  virtual double GetDepth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Depth  of  << this -> Depth ) ; return this -> Depth ; } ;
## Error: expected ';'!!!
