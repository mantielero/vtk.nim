## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOpenGLImageAlgorithmHelper.h
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
##  @class   vtkOpenGLImageAlgorithmHelper
##  @brief   Help image algorithms use the GPU
##
##  Designed to make it easier to accelerate an image algorithm on the GPU
##

## !!!Ignored construct:  # vtkOpenGLImageAlgorithmHelper_h [NewLine] # vtkOpenGLImageAlgorithmHelper_h [NewLine] # vtkObject.h [NewLine] # vtkRenderingOpenGL2Module.h  For export macro [NewLine] # vtkOpenGLHelper.h  used for ivars # vtkSmartPointer.h  for ivar [NewLine] class vtkOpenGLRenderWindow ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkRenderWindow"
discard "forward decl of vtkImageData"
discard "forward decl of vtkDataArray"
type
  VTKRENDERINGOPENGL2_EXPORTvtkOpenGLImageAlgorithmCallback* {.
      importcpp: "VTKRENDERINGOPENGL2_EXPORT::vtkOpenGLImageAlgorithmCallback",
      header: "vtkOpenGLImageAlgorithmHelper.h", bycopy.} = object


proc InitializeShaderUniforms*(this: var VTKRENDERINGOPENGL2_EXPORTvtkOpenGLImageAlgorithmCallback;
    a2: ptr vtkShaderProgram) {.importcpp: "InitializeShaderUniforms",
                             header: "vtkOpenGLImageAlgorithmHelper.h".}
  ##  program
proc UpdateShaderUniforms*(this: var VTKRENDERINGOPENGL2_EXPORTvtkOpenGLImageAlgorithmCallback;
    a2: ptr vtkShaderProgram;   ##  program
                          a3: cint) {.importcpp: "UpdateShaderUniforms",
                                    header: "vtkOpenGLImageAlgorithmHelper.h".}
proc destroyVTKRENDERINGOPENGL2_EXPORTvtkOpenGLImageAlgorithmCallback*(
    this: var VTKRENDERINGOPENGL2_EXPORTvtkOpenGLImageAlgorithmCallback) {.
    importcpp: "#.~vtkOpenGLImageAlgorithmCallback()",
    header: "vtkOpenGLImageAlgorithmHelper.h".}
proc constructVTKRENDERINGOPENGL2_EXPORTvtkOpenGLImageAlgorithmCallback*(): VTKRENDERINGOPENGL2_EXPORTvtkOpenGLImageAlgorithmCallback {.
    constructor, importcpp: "VTKRENDERINGOPENGL2_EXPORT::vtkOpenGLImageAlgorithmCallback(@)",
    header: "vtkOpenGLImageAlgorithmHelper.h".}
## !!!Ignored construct:  class VTKRENDERINGOPENGL2_EXPORT vtkOpenGLImageAlgorithmHelper : public vtkObject { public : static vtkOpenGLImageAlgorithmHelper * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkOpenGLImageAlgorithmHelper :: IsTypeOf ( type ) ; } static vtkOpenGLImageAlgorithmHelper * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkOpenGLImageAlgorithmHelper * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkOpenGLImageAlgorithmHelper * NewInstance ( ) const { return vtkOpenGLImageAlgorithmHelper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenGLImageAlgorithmHelper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenGLImageAlgorithmHelper :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; void Execute ( vtkOpenGLImageAlgorithmCallback * cb , vtkImageData * inImage , vtkDataArray * inData , vtkImageData * outData , int outExt [ 6 ] , const char * vertexCode , const char * fragmentCode , const char * geometryCode ) ; *
##  Set the render window to get the OpenGL resources from
##  void SetRenderWindow ( vtkRenderWindow * renWin ) ; protected : vtkOpenGLImageAlgorithmHelper ( ) ; ~ vtkOpenGLImageAlgorithmHelper ( ) override ; vtkSmartPointer < vtkOpenGLRenderWindow > RenderWindow ; vtkOpenGLHelper Quad ; private : vtkOpenGLImageAlgorithmHelper ( const vtkOpenGLImageAlgorithmHelper & ) = delete ; void operator = ( const vtkOpenGLImageAlgorithmHelper & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
