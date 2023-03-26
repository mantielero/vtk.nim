## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSSAAPass.h
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
##  @class   vtkSSAAPass
##  @brief   Implement Screen Space Anti Aliasing pass.
##
##  Render to a larger image and then sample down
##
##  This pass expects an initialized depth buffer and color buffer.
##  Initialized buffers means they have been cleared with farest z-value and
##  background color/gradient/transparent color.
##
##  The delegate is used once.
##
##  Its delegate is usually set to a vtkCameraPass or to a post-processing pass.
##
##  @par Implementation:
##  As the filter is separable, it first blurs the image horizontally and then
##  vertically. This reduces the number of texture samples taken.
##
##  @sa
##  vtkRenderPass
##

## !!!Ignored construct:  # vtkSSAAPass_h [NewLine] # vtkSSAAPass_h [NewLine] # vtkRenderPass.h [NewLine] # vtkRenderingOpenGL2Module.h  For export macro [NewLine] class vtkOpenGLFramebufferObject ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkOpenGLHelper"
discard "forward decl of vtkTextureObject"
## !!!Ignored construct:  class VTKRENDERINGOPENGL2_EXPORT vtkSSAAPass : public vtkRenderPass { public : static vtkSSAAPass * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkRenderPass Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkRenderPass :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSSAAPass :: IsTypeOf ( type ) ; } static vtkSSAAPass * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSSAAPass * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSSAAPass * NewInstance ( ) const { return vtkSSAAPass :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkRenderPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSSAAPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSSAAPass :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Perform rendering according to a render state \p s.
##  \pre s_exists: s!=0
##  void Render ( const vtkRenderState * s ) override ; *
##  Release graphics resources and ask components to release their own
##  resources.
##  \pre w_exists: w!=0
##  void ReleaseGraphicsResources ( vtkWindow * w ) override ; /@{ *
##  Delegate for rendering the image to be processed.
##  If it is NULL, nothing will be rendered and a warning will be emitted.
##  It is usually set to a vtkCameraPass or to a post-processing pass.
##  Initial value is a NULL pointer.
##  virtual vtkRenderPass * GetnameDelegatePass ( ) { vtkDebugWithObjectMacro ( this , <<  returning  DelegatePass  address  << static_cast < vtkRenderPass * > ( this -> DelegatePass ) ) ; return this -> DelegatePass ; } ; virtual void SetDelegatePass ( vtkRenderPass * delegatePass ) ; /@} protected : *
##  Default constructor. DelegatePass is set to NULL.
##  vtkSSAAPass ( ) ; *
##  Destructor.
##  ~ vtkSSAAPass ( ) override ; *
##  Graphics resources.
##  vtkOpenGLFramebufferObject * FrameBufferObject ; vtkTextureObject * Pass1 ;  render target for the scene vtkTextureObject * Pass2 ;  render target for the horizontal pass  Structures for the various cell types we render. vtkOpenGLHelper * SSAAProgram ; vtkRenderPass * DelegatePass ; private : vtkSSAAPass ( const vtkSSAAPass & ) = delete ; void operator = ( const vtkSSAAPass & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
