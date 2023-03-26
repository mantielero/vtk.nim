## =========================================================================
##
##   Program:   Visualization Toolkit
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
##  @class   vtkOpenGLQuadHelper
##  @brief   Class to make rendering a full screen quad easier
##
##  vtkOpenGLQuadHelper is designed to be used by classes in VTK that
##  need to render a quad to the screen with a shader program. This happens
##  often with render passes or other advanced rendering techniques.
##
##  Note that when releasing graphics resources instances of this
##  class should be destroyed. A common use pattern is to conditionally
##  create the instance where used and delete it in ReleaseGraphicsResources
##  and the destructor.
##
##  It is possible to flip the Y direction of the quad texture coordinate by
##  turning on the flipY option in the constructor. This can be useful when
##  rendering in an external context having a different convention than OpenGL
##  e.g. OpenGL-D3D shared textures. Off by default if unspecified.
##
##  Example usage:
##  @code
##  if (!this->QuadHelper)
##  {
##    this->QuadHelper = vtkOpenGLQualHelper(renWin, vs, fs, gs);
##  }
##  renWin->GetShaderCache()->ReadyShaderProgram(this->QuadHelper->Program);
##  aTexture->Activate();
##  this->QuadHelper->Program->SetUniformi("aTexture", aTexture->GetTextureUnit());
##  this->QuadHelper->Render();
##  aTexture->Deactivate();
##  @endcode
##
##  @sa vtkOpenGLRenderUtilities
##

## !!!Ignored construct:  # vtkOpenGLQuadHelper_h [NewLine] # vtkOpenGLQuadHelper_h [NewLine] # vtkRenderingOpenGL2Module.h  for export macro # vtkTimeStamp.h [NewLine] # < memory >  for std::unique_ptr [NewLine] class vtkOpenGLRenderWindow ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkOpenGLVertexArrayObject"
discard "forward decl of vtkShaderProgram"
discard "forward decl of vtkGenericOpenGLResourceFreeCallback"
discard "forward decl of vtkWindow"
## !!!Ignored construct:  class VTKRENDERINGOPENGL2_EXPORT vtkOpenGLQuadHelper { public : vtkShaderProgram * Program ; vtkTimeStamp ShaderSourceTime ; vtkOpenGLVertexArrayObject * VAO ; unsigned int ShaderChangeValue ; *
##  Create a quadhelper with the provided shaders.
##  If the vertex is nullptr then the default is used.
##  Turning on the flipY option reverts the y component of the quad texture coordinates in
##  order to flip the rendered texture.
##  Note that this class should be destroyed upon ReleaseGraphicsResources.
##  vtkOpenGLQuadHelper ( vtkOpenGLRenderWindow * , const char * vs , const char * fs , const char * gs , bool flipY = false ) ; ~ vtkOpenGLQuadHelper ( ) ;  Draw the Quad, will bind the VAO for you void Render ( ) ; *
##  Release graphics resources. In general, there's no need to call this
##  explicitly, since vtkOpenGLQuadHelper will invoke it appropriately when
##  needed.
##  void ReleaseGraphicsResources ( vtkWindow * ) ; private : vtkOpenGLQuadHelper ( const vtkOpenGLQuadHelper & ) = delete ; vtkOpenGLQuadHelper & operator = ( const vtkOpenGLQuadHelper & ) = delete ; std :: unique_ptr < vtkGenericOpenGLResourceFreeCallback > ResourceCallback ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  VTK-HeaderTest-Exclude: vtkOpenGLQuadHelper.h
