## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCompositeRGBAPass.h
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
##  @class   vtkCompositeRGBAPass
##  @brief   Blend RGBA buffers of processes.
##
##  Blend the RGBA buffers of satellite processes over the root process RGBA
##  buffer.
##  The RGBA buffer of the satellite processes are not changed.
##
##  This pass requires a OpenGL context that supports texture objects (TO),
##  and pixel buffer objects (PBO). If not, it will emit an error message
##  and will render its delegate and return.
##
##  @sa
##  vtkRenderPass
##

## !!!Ignored construct:  # vtkCompositeRGBAPass_h [NewLine] # vtkCompositeRGBAPass_h [NewLine] # vtkRenderPass.h [NewLine] # vtkRenderingParallelModule.h  For export macro [NewLine] class vtkMultiProcessController ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPixelBufferObject"
discard "forward decl of vtkTextureObject"
discard "forward decl of vtkOpenGLRenderWindow"
discard "forward decl of vtkPKdTree"
## !!!Ignored construct:  class VTKRENDERINGPARALLEL_EXPORT vtkCompositeRGBAPass : public vtkRenderPass { public : static vtkCompositeRGBAPass * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkRenderPass Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkRenderPass :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkCompositeRGBAPass :: IsTypeOf ( type ) ; } static vtkCompositeRGBAPass * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkCompositeRGBAPass * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkCompositeRGBAPass * NewInstance ( ) const { return vtkCompositeRGBAPass :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkRenderPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCompositeRGBAPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCompositeRGBAPass :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Perform rendering according to a render state \p s.
##  \pre s_exists: s!=0
##  void Render ( const vtkRenderState * s ) override ; *
##  Release graphics resources and ask components to release their own
##  resources.
##  \pre w_exists: w!=0
##  void ReleaseGraphicsResources ( vtkWindow * w ) override ; /@{ *
##  Controller
##  If it is NULL, nothing will be rendered and a warning will be emitted.
##  Initial value is a NULL pointer.
##  virtual vtkMultiProcessController * GetnameController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Controller  address  << static_cast < vtkMultiProcessController * > ( this -> Controller ) ) ; return this -> Controller ; } ; virtual void SetController ( vtkMultiProcessController * controller ) ; /@} /@{ *
##  kd tree that gives processes ordering. Initial value is a NULL pointer.
##  virtual vtkPKdTree * GetnameControllerKdtree ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Kdtree  address  << static_cast < vtkPKdTree * > ( this -> Kdtree ) ) ; return this -> Kdtree ; } ; virtual void SetKdtree ( vtkPKdTree * kdtree ) ; /@} *
##  Is the pass supported by the OpenGL context?
##  bool IsSupported ( vtkOpenGLRenderWindow * context ) ; protected : *
##  Default constructor. Controller is set to NULL.
##  vtkCompositeRGBAPass ( ) ; *
##  Destructor.
##  ~ vtkCompositeRGBAPass ( ) override ; vtkMultiProcessController * Controller ; vtkPKdTree * Kdtree ; vtkPixelBufferObject * PBO ; vtkTextureObject * RGBATexture ; vtkTextureObject * RootTexture ; float * RawRGBABuffer ; size_t RawRGBABufferSize ; private : vtkCompositeRGBAPass ( const vtkCompositeRGBAPass & ) = delete ; void operator = ( const vtkCompositeRGBAPass & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
