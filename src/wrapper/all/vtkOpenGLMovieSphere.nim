## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOpenGLMovieSphere.h
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
##  @class   vtkOpenGLMovieSphere
##  @brief   OpenGL MovieSphere, an optimized VR sphere for movies
##
##  This class is designed to more efficiently convert ffmpeg output to a
##  movie sphere. The vtkSkybox will work, but it does an expensive
##  conversion of the data from YUV to RGB, does an extra copy of the RGB
##  data and the RGB data is twice as large when pushing to the GPU. This
##  class also uses double buffering of textures to help prevent pipeline
##  stalls. In a quick test between the two classes playing a 4K30p video
##  sphere along with VR rendering, decoding etc just switching out the
##  vtkSkybox for this class resulting in CPU usage going from 124 seconds
##  down to 81 seconds. Likewise the frame timings in VR became noticeably
##  better which could partially be due to pushing half as much data to the
##  GPU. (YUV420 is half the size of RGB)
##

## !!!Ignored construct:  # vtkOpenGLMovieSphere_h [NewLine] # vtkOpenGLMovieSphere_h [NewLine] # vtkNew.h  for ivars # vtkOpenGLSkybox.h [NewLine] # vtkRenderingFFMPEGOpenGL2Module.h  For export macro # vtkSmartPointer.h  for ivars # < atomic >  for ivars # < mutex >  for ivars [NewLine] class vtkFFMPEGVideoSource ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkFFMPEGVideoSourceVideoCallbackData"
discard "forward decl of vtkMutexLock"
discard "forward decl of vtkOpenGLActor"
discard "forward decl of vtkOpenGLPolyDataMapper"
discard "forward decl of vtkTextureObject"
## !!!Ignored construct:  class VTKRENDERINGFFMPEGOPENGL2_EXPORT vtkOpenGLMovieSphere : public vtkOpenGLSkybox { public : static vtkOpenGLMovieSphere * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkOpenGLSkybox Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkOpenGLSkybox :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkOpenGLMovieSphere :: IsTypeOf ( type ) ; } static vtkOpenGLMovieSphere * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkOpenGLMovieSphere * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkOpenGLMovieSphere * NewInstance ( ) const { return vtkOpenGLMovieSphere :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkOpenGLSkybox :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenGLMovieSphere :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenGLMovieSphere :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Actual MovieSphere render method.
##  void Render ( vtkRenderer * ren , vtkMapper * mapper ) override ; void SetVideoSource ( vtkFFMPEGVideoSource * val ) ; vtkFFMPEGVideoSource * GetVideoSource ( ) ; protected : vtkOpenGLMovieSphere ( ) ; ~ vtkOpenGLMovieSphere ( ) override ; void UpdateUniforms ( vtkObject * , unsigned long , void * ) ; vtkNew < vtkTextureObject > Textures [ 6 ] ; int BuildIndex ; int DrawIndex ; int YTexture ; int UTexture ; int VTexture ; void VideoCallback ( vtkFFMPEGVideoSourceVideoCallbackData const & cbd ) ; std :: mutex TextureUpdateMutex ; unsigned char * TextureData [ 6 ] ; int ReadIndex ;  access only within mutex int WriteIndex ; std :: atomic < int > NewData ; std :: atomic < int > HaveData ; int Height ; int Width ; int UVHeight ; int UVWidth ; vtkSmartPointer < vtkFFMPEGVideoSource > VideoSource ; private : vtkOpenGLMovieSphere ( const vtkOpenGLMovieSphere & ) = delete ; void operator = ( const vtkOpenGLMovieSphere & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
