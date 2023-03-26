## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOpenGLRayCastImageDisplayHelper.h
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
##  @class   vtkOpenGLRayCastImageDisplayHelper
##  @brief   OpenGL subclass that draws the image to the screen
##
##  This is the concrete implementation of a ray cast image display helper -
##  a helper class responsible for drawing the image to the screen.
##
##  @sa
##  vtkRayCastImageDisplayHelper
##

## !!!Ignored construct:  # vtkOpenGLRayCastImageDisplayHelper_h [NewLine] # vtkOpenGLRayCastImageDisplayHelper_h [NewLine] # vtkRayCastImageDisplayHelper.h [NewLine] # vtkRenderingVolumeOpenGL2Module.h  For export macro [NewLine] class vtkFixedPointRayCastImage ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkOpenGLHelper"
discard "forward decl of vtkRenderer"
discard "forward decl of vtkTextureObject"
discard "forward decl of vtkVolume"
discard "forward decl of vtkWindow"
## !!!Ignored construct:  class VTKRENDERINGVOLUMEOPENGL2_EXPORT vtkOpenGLRayCastImageDisplayHelper : public vtkRayCastImageDisplayHelper { public : static vtkOpenGLRayCastImageDisplayHelper * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkRayCastImageDisplayHelper Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkRayCastImageDisplayHelper :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkOpenGLRayCastImageDisplayHelper :: IsTypeOf ( type ) ; } static vtkOpenGLRayCastImageDisplayHelper * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkOpenGLRayCastImageDisplayHelper * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkOpenGLRayCastImageDisplayHelper * NewInstance ( ) const { return vtkOpenGLRayCastImageDisplayHelper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkRayCastImageDisplayHelper :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenGLRayCastImageDisplayHelper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenGLRayCastImageDisplayHelper :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; void RenderTexture ( vtkVolume * vol , vtkRenderer * ren , int imageMemorySize [ 2 ] , int imageViewportSize [ 2 ] , int imageInUseSize [ 2 ] , int imageOrigin [ 2 ] , float requestedDepth , unsigned char * image ) override ; void RenderTexture ( vtkVolume * vol , vtkRenderer * ren , int imageMemorySize [ 2 ] , int imageViewportSize [ 2 ] , int imageInUseSize [ 2 ] , int imageOrigin [ 2 ] , float requestedDepth , unsigned short * image ) override ; void RenderTexture ( vtkVolume * vol , vtkRenderer * ren , vtkFixedPointRayCastImage * image , float requestedDepth ) override ; void ReleaseGraphicsResources ( vtkWindow * win ) override ; protected : vtkOpenGLRayCastImageDisplayHelper ( ) ; ~ vtkOpenGLRayCastImageDisplayHelper ( ) override ; void RenderTextureInternal ( vtkVolume * vol , vtkRenderer * ren , int imageMemorySize [ 2 ] , int imageViewportSize [ 2 ] , int imageInUseSize [ 2 ] , int imageOrigin [ 2 ] , float requestedDepth , int imageScalarType , void * image ) ;  used for copying to framebuffer vtkTextureObject * TextureObject ; vtkOpenGLHelper * ShaderProgram ; private : vtkOpenGLRayCastImageDisplayHelper ( const vtkOpenGLRayCastImageDisplayHelper & ) = delete ; void operator = ( const vtkOpenGLRayCastImageDisplayHelper & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
