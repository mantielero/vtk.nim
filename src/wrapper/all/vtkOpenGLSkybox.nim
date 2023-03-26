## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOpenGLSkybox.h
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
##  @class   vtkOpenGLSkybox
##  @brief   OpenGL Skybox
##
##  vtkOpenGLSkybox is a concrete implementation of the abstract class vtkSkybox.
##  vtkOpenGLSkybox interfaces to the OpenGL rendering library.
##

## !!!Ignored construct:  # vtkOpenGLSkybox_h [NewLine] # vtkOpenGLSkybox_h [NewLine] # vtkNew.h  for ivars # vtkRenderingOpenGL2Module.h  For export macro # vtkSkybox.h [NewLine] class vtkOpenGLActor ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkOpenGLPolyDataMapper"
## !!!Ignored construct:  class VTKRENDERINGOPENGL2_EXPORT vtkOpenGLSkybox : public vtkSkybox { public : static vtkOpenGLSkybox * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkSkybox Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkSkybox :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkOpenGLSkybox :: IsTypeOf ( type ) ; } static vtkOpenGLSkybox * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkOpenGLSkybox * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkOpenGLSkybox * NewInstance ( ) const { return vtkOpenGLSkybox :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkSkybox :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenGLSkybox :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenGLSkybox :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Actual Skybox render method.
##  void Render ( vtkRenderer * ren , vtkMapper * mapper ) override ; protected : vtkOpenGLSkybox ( ) ; ~ vtkOpenGLSkybox ( ) override ; int LastProjection ; bool LastGammaCorrect ; float LastCameraPosition [ 3 ] ; void UpdateUniforms ( vtkObject * , unsigned long , void * ) ; vtkNew < vtkOpenGLPolyDataMapper > CubeMapper ; vtkNew < vtkOpenGLActor > OpenGLActor ; vtkRenderer * CurrentRenderer ; private : vtkOpenGLSkybox ( const vtkOpenGLSkybox & ) = delete ; void operator = ( const vtkOpenGLSkybox & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
