## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDataTransferHelper.h
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
##  @class   vtkDataTransferHelper
##  @brief   is a helper class that aids in transferring
##   data between CPU memory and GPU memory.
##
##
##   vtkDataTransferHelper is a helper class that aids in transferring data
##   between the CPU memory and the GPU memory. The data in GPU memory is
##   stored as textures which that in CPU memory is stored as vtkDataArray.
##   vtkDataTransferHelper provides API to transfer only a sub-extent of CPU
##   structured data to/from the GPU.
##
##  @sa
##   vtkPixelBufferObject vtkTextureObject vtkOpenGLExtensionManager
##

## !!!Ignored construct:  # vtkDataTransferHelper_h [NewLine] # vtkDataTransferHelper_h [NewLine] # vtkObject.h [NewLine] # vtkRenderingOpenGL2Module.h  For export macro # vtkSmartPointer.h  needed for vtkSmartPointer. # vtkWeakPointer.h  needed for vtkWeakPointer. [NewLine] class vtkDataArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPixelBufferObject"
discard "forward decl of vtkTextureObject"
discard "forward decl of vtkRenderWindow"
## !!!Ignored construct:  class VTKRENDERINGOPENGL2_EXPORT vtkDataTransferHelper : public vtkObject { public : static vtkDataTransferHelper * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkDataTransferHelper :: IsTypeOf ( type ) ; } static vtkDataTransferHelper * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkDataTransferHelper * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkDataTransferHelper * NewInstance ( ) const { return vtkDataTransferHelper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDataTransferHelper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDataTransferHelper :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get/Set the context. Context must be a vtkOpenGLRenderWindow.
##  This does not increase the reference count of the
##  context to avoid reference loops.
##  SetContext() may raise an error if the OpenGL context does not support the
##  required OpenGL extensions.
##  void SetContext ( vtkRenderWindow * context ) ; vtkRenderWindow * GetContext ( ) ; /@} /@{ *
##  Set the CPU data extent. The extent matches the vtkDataArray size.
##  If the vtkDataArray comes from an vtkImageData and it is part of the
##  point data, it is usually the vtkImageData extent.
##  It can be on cell data too, but in this case it does not match the
##  vtkImageData extent.
##  If the vtkDataArray comes from a vtkDataSet, just
##  set it to a one-dimenstional extent equal to the number of tuples.
##  Initial value is (0,0,0,0,0,0), a valid one tuple array.
##  virtual void SetCPUExtent ( int _arg1 , int _arg2 , int _arg3 , int _arg4 , int _arg5 , int _arg6 ) { vtkDebugWithObjectMacro ( this , <<  setting  << CPUExtent  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; if ( ( this -> CPUExtent [ 0 ] != _arg1 ) || ( this -> CPUExtent [ 1 ] != _arg2 ) || ( this -> CPUExtent [ 2 ] != _arg3 ) || ( this -> CPUExtent [ 3 ] != _arg4 ) || ( this -> CPUExtent [ 4 ] != _arg5 ) || ( this -> CPUExtent [ 5 ] != _arg6 ) ) { this -> CPUExtent [ 0 ] = _arg1 ; this -> CPUExtent [ 1 ] = _arg2 ; this -> CPUExtent [ 2 ] = _arg3 ; this -> CPUExtent [ 3 ] = _arg4 ; this -> CPUExtent [ 4 ] = _arg5 ; this -> CPUExtent [ 5 ] = _arg6 ; this -> Modified ( ) ; } } virtual void SetCPUExtent ( const int _arg [ 6 ] ) { this -> SetCPUExtent ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; virtual int * GetCPUExtent ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << CPUExtent  pointer  << this -> CPUExtent ) ; return this -> CPUExtent ; } VTK_WRAPEXCLUDE virtual void GetCPUExtent ( int & _arg1 , int & _arg2 , int & _arg3 , int & _arg4 , int & _arg5 , int & _arg6 ) { _arg1 = this -> CPUExtent [ 0 ] ; _arg2 = this -> CPUExtent [ 1 ] ; _arg3 = this -> CPUExtent [ 2 ] ; _arg4 = this -> CPUExtent [ 3 ] ; _arg5 = this -> CPUExtent [ 4 ] ; _arg6 = this -> CPUExtent [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << CPUExtent  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCPUExtent ( int _arg [ 6 ] ) { this -> GetCPUExtent ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; /@} /@{ *
##  Set the GPU data extent. This is the sub-extent to copy from or to the GPU.
##  This extent matches the size of the data to transfer.
##  GPUExtent and TextureExtent don't have to match (GPUExtent can be 1D
##  whereas TextureExtent is 2D) but the number of elements have to match.
##  Initial value is (0,0,0,0,0,0), a valid one tuple array.
##  virtual void SetCPUExtentGPUExtent ( int _arg1 , int _arg2 , int _arg3 , int _arg4 , int _arg5 , int _arg6 ) { vtkDebugWithObjectMacro ( this , <<  setting  << GPUExtent  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; if ( ( this -> GPUExtent [ 0 ] != _arg1 ) || ( this -> GPUExtent [ 1 ] != _arg2 ) || ( this -> GPUExtent [ 2 ] != _arg3 ) || ( this -> GPUExtent [ 3 ] != _arg4 ) || ( this -> GPUExtent [ 4 ] != _arg5 ) || ( this -> GPUExtent [ 5 ] != _arg6 ) ) { this -> GPUExtent [ 0 ] = _arg1 ; this -> GPUExtent [ 1 ] = _arg2 ; this -> GPUExtent [ 2 ] = _arg3 ; this -> GPUExtent [ 3 ] = _arg4 ; this -> GPUExtent [ 4 ] = _arg5 ; this -> GPUExtent [ 5 ] = _arg6 ; this -> Modified ( ) ; } } virtual void SetCPUExtentGPUExtent ( const int _arg [ 6 ] ) { this -> SetCPUExtentGPUExtent ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; virtual int * GetCPUExtentGPUExtent ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << GPUExtent  pointer  << this -> GPUExtent ) ; return this -> GPUExtent ; } VTK_WRAPEXCLUDE virtual void GetCPUExtentGPUExtent ( int & _arg1 , int & _arg2 , int & _arg3 , int & _arg4 , int & _arg5 , int & _arg6 ) { _arg1 = this -> GPUExtent [ 0 ] ; _arg2 = this -> GPUExtent [ 1 ] ; _arg3 = this -> GPUExtent [ 2 ] ; _arg4 = this -> GPUExtent [ 3 ] ; _arg5 = this -> GPUExtent [ 4 ] ; _arg6 = this -> GPUExtent [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << GPUExtent  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCPUExtentGPUExtent ( int _arg [ 6 ] ) { this -> GetCPUExtentGPUExtent ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; /@} /@{ *
##  Set the texture data extent. This is the extent of the texture image that
##  will receive the data. This extent matches the size of the data to
##  transfer. If it is set to an invalid extent, GPUExtent is used.
##  See more comment on GPUExtent.
##  Initial value is an invalid extent.
##  virtual void SetCPUExtentGPUExtentTextureExtent ( int _arg1 , int _arg2 , int _arg3 , int _arg4 , int _arg5 , int _arg6 ) { vtkDebugWithObjectMacro ( this , <<  setting  << TextureExtent  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; if ( ( this -> TextureExtent [ 0 ] != _arg1 ) || ( this -> TextureExtent [ 1 ] != _arg2 ) || ( this -> TextureExtent [ 2 ] != _arg3 ) || ( this -> TextureExtent [ 3 ] != _arg4 ) || ( this -> TextureExtent [ 4 ] != _arg5 ) || ( this -> TextureExtent [ 5 ] != _arg6 ) ) { this -> TextureExtent [ 0 ] = _arg1 ; this -> TextureExtent [ 1 ] = _arg2 ; this -> TextureExtent [ 2 ] = _arg3 ; this -> TextureExtent [ 3 ] = _arg4 ; this -> TextureExtent [ 4 ] = _arg5 ; this -> TextureExtent [ 5 ] = _arg6 ; this -> Modified ( ) ; } } virtual void SetCPUExtentGPUExtentTextureExtent ( const int _arg [ 6 ] ) { this -> SetCPUExtentGPUExtentTextureExtent ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; virtual int * GetCPUExtentGPUExtentTextureExtent ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << TextureExtent  pointer  << this -> TextureExtent ) ; return this -> TextureExtent ; } VTK_WRAPEXCLUDE virtual void GetCPUExtentGPUExtentTextureExtent ( int & _arg1 , int & _arg2 , int & _arg3 , int & _arg4 , int & _arg5 , int & _arg6 ) { _arg1 = this -> TextureExtent [ 0 ] ; _arg2 = this -> TextureExtent [ 1 ] ; _arg3 = this -> TextureExtent [ 2 ] ; _arg4 = this -> TextureExtent [ 3 ] ; _arg5 = this -> TextureExtent [ 4 ] ; _arg6 = this -> TextureExtent [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << TextureExtent  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCPUExtentGPUExtentTextureExtent ( int _arg [ 6 ] ) { this -> GetCPUExtentGPUExtentTextureExtent ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; /@} *
##  Tells if the given extent (6 int) is valid. True if min
##  extent<=max extent.
##  \pre extent_exists: extent!=0
##  bool GetExtentIsValid ( int * extent ) ; *
##  Tells if CPUExtent is valid. True if min extent<=max extent.
##  bool GetCPUExtentIsValid ( ) ; *
##  Tells if GPUExtent is valid. True if min extent<=max extent.
##  bool GetGPUExtentIsValid ( ) ; *
##  Tells if TextureExtent is valid. True if min extent<=max extent.
##  bool GetTextureExtentIsValid ( ) ; /@{ *
##  Define the minimal dimension of the texture regardless of the dimensions
##  of the TextureExtent. Initial value is 1.
##  A texture extent can have a given dimension 0D (one value), 1D, 2D or 3D.
##  By default 0D and 1D are translated into a 1D texture, 2D is translated
##  into a 2D texture, 3D is translated into a 3D texture. To make life easier
##  when writing GLSL code and use only one type of sampler (ex: sampler2d),
##  the default behavior can be changed by forcing a type of texture with
##  this ivar.
##  1: default behavior. Initial value.
##  2: force 0D and 1D to be in a 2D texture
##  3: force 0D, 1D and 2D texture to be in a 3D texture.
##  virtual void SetMinTextureDimension ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MinTextureDimension  to  << _arg ) ; if ( this -> MinTextureDimension != _arg ) { this -> MinTextureDimension = _arg ; this -> Modified ( ) ; } } ; virtual int GetMinTextureDimension ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinTextureDimension  of  << this -> MinTextureDimension ) ; return this -> MinTextureDimension ; } ; /@} /@{ *
##  Get/Set the CPU data buffer. Initial value is 0.
##  virtual vtkDataArray * GetnameArray ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Array  address  << static_cast < vtkDataArray * > ( this -> Array ) ) ; return this -> Array ; } ; void SetArray ( vtkDataArray * array ) ; /@} /@{ *
##  Get/Set the GPU data buffer. Initial value is 0.
##  virtual vtkTextureObject * GetnameArrayTexture ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Texture  address  << static_cast < vtkTextureObject * > ( this -> Texture ) ) ; return this -> Texture ; } ; void SetTexture ( vtkTextureObject * texture ) ; /@} *
##  Old comment.
##  Upload Extent from CPU data buffer to GPU.
##  The WholeExtent must match the Array size.
##  New comment.
##  Upload GPUExtent from CPU vtkDataArray to GPU texture.
##  It is possible to send a subset of the components or to specify and
##  order of components or both. If components=0, componentList is ignored
##  and all components are passed, a texture cannot have more than 4
##  components.
##  \pre array_exists: array!=0
##  \pre array_not_empty: array->GetNumberOfTuples()>0
##  \pre valid_cpu_extent: this->GetCPUExtentIsValid()
##  \pre valid_cpu_extent_size:
##  (CPUExtent[1]-CPUExtent[0]+1)*(CPUExtent[3]-CPUExtent[2]+1)*(CPUExtent[5]-CPUExtent[4]+1)==array->GetNumberOfTuples()
##  \pre valid_gpu_extent: this->GetGPUExtentIsValid()
##  \pre gpu_extent_in_cpu_extent: CPUExtent[0]<=GPUExtent[0] && GPUExtent[1]<=CPUExtent[1] &&
##  CPUExtent[2]<=GPUExtent[2] && GPUExtent[3]<=CPUExtent[3] && CPUExtent[4]<=GPUExtent[4] &&
##  GPUExtent[5]<=CPUExtent[5] \pre gpu_texture_size: !this->GetTextureExtentIsValid() ||
##  (GPUExtent[1]-GPUExtent[0]+1)*(GPUExtent[3]-GPUExtent[2]+1)*(GPUExtent[5]-GPUExtent[4]+1)==(TextureExtent[1]-TextureExtent[0]+1)*(TextureExtent[3]-TextureExtent[2]+1)*(TextureExtent[5]-TextureExtent[4]+1)
##  \pre texture_can_exist_or_not: texture==0 || texture!=0
##  \pre valid_components: (components==0 && componentList==0 && array->GetNumberOfComponents()<=4)
##  || (components>=1 && components<=array->GetNumberOfComponents() && components<=4 &&
##  componentList!=0)
##  bool Upload ( int components = 0 , int * componentList = nullptr ) ; *
##  old comment:
##  Download Extent from GPU data buffer to CPU.
##  GPU data size must exactly match Extent.
##  CPU data buffer will be resized to match WholeExtent in which only the
##  Extent will be filled with the GPU data.
##  new comment:
##  Download GPUExtent from GPU texture to CPU vtkDataArray.
##  If Array is not provided, it will be created with the size of CPUExtent.
##  But only the tuples covered by GPUExtent will be download. In this case,
##  if GPUExtent does not cover all GPUExtent, some of the vtkDataArray will
##  be uninitialized.
##  Reminder: A=>B <=> !A||B
##  \pre texture_exists: texture!=0
##  \pre array_not_empty: array==0 || array->GetNumberOfTuples()>0
##  \pre valid_cpu_extent: this->GetCPUExtentIsValid()
##  \pre valid_cpu_extent_size: array==0 ||
##  (CPUExtent[1]-CPUExtent[0]+1)*(CPUExtent[3]-CPUExtent[2]+1)*(CPUExtent[5]-CPUExtent[4]+1)==array->GetNumberOfTuples()
##  \pre valid_gpu_extent: this->GetGPUExtentIsValid()
##  \pre gpu_extent_in_cpu_extent: CPUExtent[0]<=GPUExtent[0] && GPUExtent[1]<=CPUExtent[1] &&
##  CPUExtent[2]<=GPUExtent[2] && GPUExtent[3]<=CPUExtent[3] && CPUExtent[4]<=GPUExtent[4] &&
##  GPUExtent[5]<=CPUExtent[5] \pre gpu_texture_size: !this->GetTextureExtentIsValid() ||
##  (GPUExtent[1]-GPUExtent[0]+1)*(GPUExtent[3]-GPUExtent[2]+1)*(GPUExtent[5]-GPUExtent[4]+1)==(TextureExtent[1]-TextureExtent[0]+1)*(TextureExtent[3]-TextureExtent[2]+1)*(TextureExtent[5]-TextureExtent[4]+1)
##  \pre valid_components: array==0 || array->GetNumberOfComponents()<=4
##  \pre components_match: array==0 || (texture->GetComponents()==array->GetNumberOfComponents())
##  bool Download ( ) ; /@{ *
##  Splits the download in two operations
##  * Asynchronously download from texture memory to PBO (DownloadAsync1()).
##  * Copy from pbo to user array (DownloadAsync2()).
##  bool DownloadAsync1 ( ) ; bool DownloadAsync2 ( ) ; /@} bool GetShaderSupportsTextureInt ( ) ; void SetShaderSupportsTextureInt ( bool value ) ; *
##  Returns if the context supports the required extensions.
##  static bool IsSupported ( vtkRenderWindow * renWin ) ; protected : vtkDataTransferHelper ( ) ; ~ vtkDataTransferHelper ( ) override ; int CPUExtent [ 6 ] ; int GPUExtent [ 6 ] ; int TextureExtent [ 6 ] ; vtkWeakPointer < vtkRenderWindow > Context ; vtkTextureObject * Texture ; vtkDataArray * Array ; bool ShaderSupportsTextureInt ; int MinTextureDimension ; vtkSmartPointer < vtkPixelBufferObject > AsyncDownloadPBO ; vtkPixelBufferObject * GetPBO ( ) ;  We try to reuse the PBO if possible. vtkSmartPointer < vtkPixelBufferObject > PBO ; private : vtkDataTransferHelper ( const vtkDataTransferHelper & ) = delete ; void operator = ( const vtkDataTransferHelper & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
