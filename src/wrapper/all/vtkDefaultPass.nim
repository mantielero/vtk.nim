## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDefaultPass.h
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
##  @class   vtkDefaultPass
##  @brief   Implement the basic render passes.
##
##  vtkDefaultPass implements the basic standard render passes of VTK.
##  Subclasses can easily be implemented by reusing some parts of the basic
##  implementation.
##
##  It implements classic Render operations as well as versions with property
##  key checking.
##
##  This pass expects an initialized depth buffer and color buffer.
##  Initialized buffers means they have been cleared with farest z-value and
##  background color/gradient/transparent color.
##
##  @sa
##  vtkRenderPass
##

## !!!Ignored construct:  # vtkDefaultPass_h [NewLine] # vtkDefaultPass_h [NewLine] # vtkRenderPass.h [NewLine] # vtkRenderingOpenGL2Module.h  For export macro [NewLine] class vtkOpenGLRenderWindow ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDefaultPassLayerList"
## !!!Ignored construct:  class VTKRENDERINGOPENGL2_EXPORT vtkDefaultPass : public vtkRenderPass { public : static vtkDefaultPass * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkRenderPass Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkRenderPass :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkDefaultPass :: IsTypeOf ( type ) ; } static vtkDefaultPass * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkDefaultPass * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkDefaultPass * NewInstance ( ) const { return vtkDefaultPass :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkRenderPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDefaultPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDefaultPass :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Perform rendering according to a render state \p s.
##  Call RenderOpaqueGeometry(), RenderTranslucentPolygonalGeometry(),
##  RenderVolumetricGeometry(), RenderOverlay()
##  \pre s_exists: s!=0
##  void Render ( const vtkRenderState * s ) override ; protected : *
##  Default constructor.
##  vtkDefaultPass ( ) ; *
##  Destructor.
##  ~ vtkDefaultPass ( ) override ; *
##  Opaque pass without key checking.
##  \pre s_exists: s!=0
##  virtual void RenderOpaqueGeometry ( const vtkRenderState * s ) ; *
##  Opaque pass with key checking.
##  \pre s_exists: s!=0
##  virtual void RenderFilteredOpaqueGeometry ( const vtkRenderState * s ) ; *
##  Translucent pass without key checking.
##  \pre s_exists: s!=0
##  virtual void RenderTranslucentPolygonalGeometry ( const vtkRenderState * s ) ; *
##  Translucent pass with key checking.
##  \pre s_exists: s!=0
##  virtual void RenderFilteredTranslucentPolygonalGeometry ( const vtkRenderState * s ) ; *
##  Volume pass without key checking.
##  \pre s_exists: s!=0
##  virtual void RenderVolumetricGeometry ( const vtkRenderState * s ) ; *
##  Translucent pass with key checking.
##  \pre s_exists: s!=0
##  virtual void RenderFilteredVolumetricGeometry ( const vtkRenderState * s ) ; *
##  Overlay pass without key checking.
##  \pre s_exists: s!=0
##  virtual void RenderOverlay ( const vtkRenderState * s ) ; *
##  Overlay pass with key checking.
##  \pre s_exists: s!=0
##  virtual void RenderFilteredOverlay ( const vtkRenderState * s ) ; private : vtkDefaultPass ( const vtkDefaultPass & ) = delete ; void operator = ( const vtkDefaultPass & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
