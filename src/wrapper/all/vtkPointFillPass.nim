## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPointFillPass.h
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
##  @class   vtkPointFillPass
##  @brief   Implement a post-processing fillpass
##
##
##  This pass is designed to fill in rendering of sparse point sets/coulds
##  The delegate is used once and is usually set to a vtkCameraPass or
##  to a post-processing pass.
##
##  @sa
##  vtkRenderPass
##

import
  vtkDepthImageProcessingPass, vtkRenderingOpenGL2Module

discard "forward decl of vtkDepthPeelingPassLayerList"
discard "forward decl of vtkOpenGLFramebufferObject"
discard "forward decl of vtkOpenGLQuadHelper"
discard "forward decl of vtkOpenGLRenderWindow"
discard "forward decl of vtkTextureObject"
type
  vtkPointFillPass* {.importcpp: "vtkPointFillPass", header: "vtkPointFillPass.h",
                     bycopy.} = object of vtkDepthImageProcessingPass ## *
                                                                 ##  Default constructor. DelegatePass is set to NULL.
                                                                 ##
    vtkPointFillPass* {.importc: "vtkPointFillPass".}: VTK_NEWINSTANCE
    ##  render target for the scene
    ##  render target for the depth


proc New*(): ptr vtkPointFillPass {.importcpp: "vtkPointFillPass::New(@)",
                                header: "vtkPointFillPass.h".}
type
  vtkPointFillPassSuperclass* = vtkDepthImageProcessingPass

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPointFillPass::IsTypeOf(@)", header: "vtkPointFillPass.h".}
proc IsA*(this: var vtkPointFillPass; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkPointFillPass.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPointFillPass {.
    importcpp: "vtkPointFillPass::SafeDownCast(@)", header: "vtkPointFillPass.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPointFillPass :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDepthImageProcessingPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPointFillPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPointFillPass :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPointFillPass; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPointFillPass.h".}
proc Render*(this: var vtkPointFillPass; s: ptr vtkRenderState) {.importcpp: "Render",
    header: "vtkPointFillPass.h".}
proc ReleaseGraphicsResources*(this: var vtkPointFillPass; w: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkPointFillPass.h".}
proc SetCandidatePointRatio*(this: var vtkPointFillPass; _arg: cfloat) {.
    importcpp: "SetCandidatePointRatio", header: "vtkPointFillPass.h".}
## !!!Ignored construct:  virtual float GetCandidatePointRatio ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CandidatePointRatio  of  << this -> CandidatePointRatio ) ; return this -> CandidatePointRatio ; } ;
## Error: expected ';'!!!

proc SetCandidatePointRatioMinimumCandidateAngle*(this: var vtkPointFillPass;
    _arg: cfloat) {.importcpp: "SetCandidatePointRatioMinimumCandidateAngle",
                  header: "vtkPointFillPass.h".}
## !!!Ignored construct:  virtual float GetCandidatePointRatioMinimumCandidateAngle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinimumCandidateAngle  of  << this -> MinimumCandidateAngle ) ; return this -> MinimumCandidateAngle ; } ;
## Error: expected ';'!!!
