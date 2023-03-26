## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOpenGLFXAAPass.h
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
##  @class   vtkOpenGLFXAAPass
##  @brief   Render pass calling the FXAA filter
##
##  vtkOpenGLFXAAPass is an image post processing render pass. It is a fast anti aliasing
##  filter.
##
##  This pass usually takes the camera pass as its delegate pass.
##
##  @note Currently, this pass wraps the existing FXAA implementation. It copies the pixels
##  from the framebuffer to a texture. A better approach would be to use the usual render pass
##  workflow to create a framebuffer drawing directly on the texture.
##
##  @sa
##  vtkRenderPass vtkDefaultPass
##

## !!!Ignored construct:  # vtkOpenGLFXAAPass_h [NewLine] # vtkOpenGLFXAAPass_h [NewLine] # vtkImageProcessingPass.h [NewLine] # vtkNew.h  For vtkNew # vtkOpenGLFXAAFilter.h  For vtkOpenGLFXAAFilter # vtkRenderingOpenGL2Module.h  For export macro [NewLine] class vtkFXAAOptions ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKRENDERINGOPENGL2_EXPORT vtkOpenGLFXAAPass : public vtkImageProcessingPass { public : static vtkOpenGLFXAAPass * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageProcessingPass Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageProcessingPass :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkOpenGLFXAAPass :: IsTypeOf ( type ) ; } static vtkOpenGLFXAAPass * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkOpenGLFXAAPass * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkOpenGLFXAAPass * NewInstance ( ) const { return vtkOpenGLFXAAPass :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageProcessingPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenGLFXAAPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenGLFXAAPass :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Perform rendering according to a render state.
##  void Render ( const vtkRenderState * s ) override ; virtual vtkFXAAOptions * GetnameFXAAOptions ( ) { vtkDebugWithObjectMacro ( this , <<  returning  FXAAOptions  address  << static_cast < vtkFXAAOptions * > ( this -> FXAAOptions ) ) ; return this -> FXAAOptions ; } ; virtual void SetFXAAOptions ( vtkFXAAOptions * ) ; protected : vtkOpenGLFXAAPass ( ) = default ; ~ vtkOpenGLFXAAPass ( ) override ; *
##  Graphics resources.
##  vtkNew < vtkOpenGLFXAAFilter > FXAAFilter ; vtkFXAAOptions * FXAAOptions = nullptr ; private : vtkOpenGLFXAAPass ( const vtkOpenGLFXAAPass & ) = delete ; void operator = ( const vtkOpenGLFXAAPass & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
