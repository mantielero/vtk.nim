## =========================================================================
##
##    Program: ParaView
##    Module:    vtkDepthImageProcessingPass.h
##
##   Copyright (c) Sandia Corporation, Kitware Inc.
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## ----------------------------------------------------------------------
## Acknowledgement:
## This algorithm is the result of joint work by Electricité de France,
## CNRS, Collège de France and Université J. Fourier as part of the
## Ph.D. thesis of Christian BOUCHENY.
## ------------------------------------------------------------------------
## *
##  @class   vtkDepthImageProcessingPass
##  @brief   Convenient class for post-processing
##  passes. Based on vtkImageProcessingPass, but writes depth as well
##  in a texture
##
##  Abstract class with some convenient methods frequently used in subclasses.
##
##
##  @sa
##  vtkRenderPass vtkDepthImageProcessingPass vtkEDLShading
##

import
  vtkImageProcessingPass, vtkRenderingOpenGL2Module

discard "forward decl of vtkOpenGLRenderWindow"
discard "forward decl of vtkDepthPeelingPassLayerList"
discard "forward decl of vtkOpenGLFramebufferObject"
discard "forward decl of vtkTextureObject"
type
  vtkDepthImageProcessingPass* {.importcpp: "vtkDepthImageProcessingPass",
                                header: "vtkDepthImageProcessingPass.h", bycopy.} = object of vtkImageProcessingPass ## *
                                                                                                              ##  Default constructor. DelegatePass is set to NULL.
                                                                                                              ##
    vtkDepthImageProcessingPass* {.importc: "vtkDepthImageProcessingPass".}: VTK_NEWINSTANCE
    ##  Viewport origin
    ##  parent window width
    ##  parent window height
    ##  this width
    ##  this height
    ##  w(h) = width(height) + 2*extrapixels

  vtkDepthImageProcessingPassSuperclass* = vtkImageProcessingPass

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDepthImageProcessingPass::IsTypeOf(@)",
    header: "vtkDepthImageProcessingPass.h".}
proc IsA*(this: var vtkDepthImageProcessingPass; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkDepthImageProcessingPass.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDepthImageProcessingPass {.
    importcpp: "vtkDepthImageProcessingPass::SafeDownCast(@)",
    header: "vtkDepthImageProcessingPass.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDepthImageProcessingPass :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageProcessingPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDepthImageProcessingPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDepthImageProcessingPass :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDepthImageProcessingPass; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkDepthImageProcessingPass.h".}