## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRayCastImageDisplayHelper.h
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
##  @class   vtkRayCastImageDisplayHelper
##  @brief   helper class that draws the image to the screen
##
##  This is a helper class for drawing images created from ray casting on the screen.
##  This is the abstract device-independent superclass.
##
##  @sa
##  vtkUnstructuredGridVolumeRayCastMapper
##  vtkOpenGLRayCastImageDisplayHelper
##

## !!!Ignored construct:  # vtkRayCastImageDisplayHelper_h [NewLine] # vtkRayCastImageDisplayHelper_h [NewLine] # vtkObject.h [NewLine] # vtkRenderingVolumeModule.h  For export macro [NewLine] class vtkFixedPointRayCastImage ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkRenderer"
discard "forward decl of vtkVolume"
discard "forward decl of vtkWindow"
## !!!Ignored construct:  class VTKRENDERINGVOLUME_EXPORT vtkRayCastImageDisplayHelper : public vtkObject { public : static vtkRayCastImageDisplayHelper * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkRayCastImageDisplayHelper :: IsTypeOf ( type ) ; } static vtkRayCastImageDisplayHelper * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkRayCastImageDisplayHelper * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkRayCastImageDisplayHelper * NewInstance ( ) const { return vtkRayCastImageDisplayHelper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRayCastImageDisplayHelper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRayCastImageDisplayHelper :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; virtual void RenderTexture ( vtkVolume * vol , vtkRenderer * ren , int imageMemorySize [ 2 ] , int imageViewportSize [ 2 ] , int imageInUseSize [ 2 ] , int imageOrigin [ 2 ] , float requestedDepth , unsigned char * image ) = 0 ; virtual void RenderTexture ( vtkVolume * vol , vtkRenderer * ren , int imageMemorySize [ 2 ] , int imageViewportSize [ 2 ] , int imageInUseSize [ 2 ] , int imageOrigin [ 2 ] , float requestedDepth , unsigned short * image ) = 0 ; virtual void RenderTexture ( vtkVolume * vol , vtkRenderer * ren , vtkFixedPointRayCastImage * image , float requestedDepth ) = 0 ; virtual void SetPreMultipliedColors ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << PreMultipliedColors  to  << _arg ) ; if ( this -> PreMultipliedColors != ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ) { this -> PreMultipliedColors = ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ; this -> Modified ( ) ; } } virtual vtkTypeBool GetPreMultipliedColorsMinValue ( ) { return 0 ; } virtual vtkTypeBool GetPreMultipliedColorsMaxValue ( ) { return 1 ; } ; virtual vtkTypeBool GetPreMultipliedColors ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PreMultipliedColors  of  << this -> PreMultipliedColors ) ; return this -> PreMultipliedColors ; } ; virtual void PreMultipliedColorsOn ( ) { this -> SetPreMultipliedColors ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void PreMultipliedColorsOff ( ) { this -> SetPreMultipliedColors ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@{ *
##  Set / Get the pixel scale to be applied to the image before display.
##  Can be set to scale the incoming pixel values - for example the
##  fixed point mapper uses the unsigned short API but with 15 bit
##  values so needs a scale of 2.0.
##  virtual void SetPixelScale ( float _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PixelScale  to  << _arg ) ; if ( this -> PixelScale != _arg ) { this -> PixelScale = _arg ; this -> Modified ( ) ; } } ; virtual float GetPreMultipliedColorsPixelScale ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PixelScale  of  << this -> PixelScale ) ; return this -> PixelScale ; } ; /@} *
##  Derived class should implement this if needed
##  virtual void ReleaseGraphicsResources ( vtkWindow * ) { } protected : vtkRayCastImageDisplayHelper ( ) ; ~ vtkRayCastImageDisplayHelper ( ) override ; *
##  Have the colors already been multiplied by alpha?
##  vtkTypeBool PreMultipliedColors ; float PixelScale ; private : vtkRayCastImageDisplayHelper ( const vtkRayCastImageDisplayHelper & ) = delete ; void operator = ( const vtkRayCastImageDisplayHelper & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
