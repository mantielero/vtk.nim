## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSequencePass.h
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
##  @class   vtkSequencePass
##  @brief   Execute render passes sequentially.
##
##  vtkSequencePass executes a list of render passes sequentially.
##  This class allows to define a sequence of render passes at run time.
##  The other solution to write a sequence of render passes is to write an
##  effective subclass of vtkRenderPass.
##
##  As vtkSequencePass is a vtkRenderPass itself, it is possible to have a
##  hierarchy of render passes built at runtime.
##  @sa
##  vtkRenderPass
##

import
  vtkRenderPass, vtkRenderingOpenGL2Module

discard "forward decl of vtkRenderPassCollection"
type
  vtkSequencePass* {.importcpp: "vtkSequencePass", header: "vtkSequencePass.h",
                    bycopy.} = object of vtkRenderPass
    vtkSequencePass* {.importc: "vtkSequencePass".}: VTK_NEWINSTANCE


proc New*(): ptr vtkSequencePass {.importcpp: "vtkSequencePass::New(@)",
                               header: "vtkSequencePass.h".}
type
  vtkSequencePassSuperclass* = vtkRenderPass

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSequencePass::IsTypeOf(@)", header: "vtkSequencePass.h".}
proc IsA*(this: var vtkSequencePass; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkSequencePass.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSequencePass {.
    importcpp: "vtkSequencePass::SafeDownCast(@)", header: "vtkSequencePass.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSequencePass :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkRenderPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSequencePass :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSequencePass :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSequencePass; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSequencePass.h".}
proc Render*(this: var vtkSequencePass; s: ptr vtkRenderState) {.importcpp: "Render",
    header: "vtkSequencePass.h".}
proc ReleaseGraphicsResources*(this: var vtkSequencePass; w: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkSequencePass.h".}
proc GetnamePasses*(this: var vtkSequencePass): ptr vtkRenderPassCollection {.
    importcpp: "GetnamePasses", header: "vtkSequencePass.h".}
proc SetPasses*(this: var vtkSequencePass; passes: ptr vtkRenderPassCollection) {.
    importcpp: "SetPasses", header: "vtkSequencePass.h".}