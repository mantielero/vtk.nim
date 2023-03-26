## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOpenGLVolumeLookupTable.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##   This software is distributed WITHOUT ANY WARRANTY; without even
##   the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##   PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## =============================================================================
## Copyright and License information
## =============================================================================
## *
##  @class vtkOpenGLVolumeLookupTable
##  @brief Base class for OpenGL texture management of scalar color,
##  opacity and gradient opacity lookup tables.
##

## !!!Ignored construct:  # vtkOpenGLVolumeLookupTable_h [NewLine] # vtkOpenGLVolumeLookupTable_h [NewLine] # vtkObject.h [NewLine] # vtkRenderingVolumeOpenGL2Module.h  For export macro [NewLine]  Forward declarations class vtkOpenGLRenderWindow ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkTextureObject"
discard "forward decl of vtkWindow"
## !!!Ignored construct:  class VTKRENDERINGVOLUMEOPENGL2_EXPORT vtkOpenGLVolumeLookupTable : public vtkObject { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkOpenGLVolumeLookupTable :: IsTypeOf ( type ) ; } static vtkOpenGLVolumeLookupTable * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkOpenGLVolumeLookupTable * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkOpenGLVolumeLookupTable * NewInstance ( ) const { return vtkOpenGLVolumeLookupTable :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenGLVolumeLookupTable :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenGLVolumeLookupTable :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ;  static vtkOpenGLVolumeLookupTable* New(); *
##  Get the texture unit associated with the managed texture object
##  int GetTextureUnit ( ) ; *
##  Activate / deactivate the internal texture object
##  /@{ void Activate ( ) ; void Deactivate ( ) ; /@} *
##  Get the maximum supported texture width for the target OpenGL environment.
##  int GetMaximumSupportedTextureWidth ( vtkOpenGLRenderWindow * renWin , int idealWidth ) ; *
##  Release graphics resources
##  void ReleaseGraphicsResources ( vtkWindow * window ) ; *
##  Update the internal texture object using the transfer function provided.
##  virtual void Update ( vtkObject * func , double scalarRange [ 2 ] , int blendMode , double sampleDistance , double unitDistance , int filterValue , vtkOpenGLRenderWindow * renWin ) ; *
##  Get access to the texture height used by this object
##  virtual int GetTextureHeight ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TextureHeight  of  << this -> TextureHeight ) ; return this -> TextureHeight ; } ; *
##  Get access to the texture width used by this object
##  virtual int GetTextureHeightTextureWidth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TextureWidth  of  << this -> TextureWidth ) ; return this -> TextureWidth ; } ; protected : vtkOpenGLVolumeLookupTable ( ) = default ; ~ vtkOpenGLVolumeLookupTable ( ) override ; double LastRange [ 2 ] = { 0.0 , 0.0 } ; float * Table = nullptr ; int LastInterpolation = - 1 ; int NumberOfColorComponents = 1 ; int TextureWidth = 1024 ; int TextureHeight = 1 ; vtkTextureObject * TextureObject = nullptr ; vtkTimeStamp BuildTime ; *
##  Test whether the internal function needs to be updated.
##  virtual bool NeedsUpdate ( vtkObject * func , double scalarRange [ 2 ] , int blendMode , double sampleDistance ) ; *
##  Internal method to actually update the texture object
##  virtual void InternalUpdate ( vtkObject * func , int blendMode , double sampleDistance , double unitDistance , int filterValue ) ; *
##  Compute ideal width and height for the texture based on function provided
##  virtual void ComputeIdealTextureSize ( vtkObject * func , int & width , int & height , vtkOpenGLRenderWindow * renWin ) ; *
##  Allocate internal data table
##  virtual void AllocateTable ( ) ; private : vtkOpenGLVolumeLookupTable ( const vtkOpenGLVolumeLookupTable & ) = delete ; void operator = ( const vtkOpenGLVolumeLookupTable & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
