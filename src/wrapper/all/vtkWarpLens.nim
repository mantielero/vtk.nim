## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkWarpLens.h
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
##  @class   vtkWarpLens
##  @brief   deform geometry by applying lens distortion
##
##  vtkWarpLens is a filter that modifies point coordinates by moving
##  in accord with a lens distortion model.
##

## !!!Ignored construct:  # vtkWarpLens_h [NewLine] # vtkWarpLens_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkPointSetAlgorithm.h [NewLine] class VTKFILTERSGENERAL_EXPORT vtkWarpLens : public vtkPointSetAlgorithm { public : static vtkWarpLens * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPointSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPointSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkWarpLens :: IsTypeOf ( type ) ; } static vtkWarpLens * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkWarpLens * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkWarpLens * NewInstance ( ) const { return vtkWarpLens :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPointSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkWarpLens :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkWarpLens :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Specify second order symmetric radial lens distortion parameter.
##  This is obsoleted by newer instance variables.
##  void SetKappa ( double kappa ) ; double GetKappa ( ) ; /@} /@{ *
##  Specify the center of radial distortion in pixels.
##  This is obsoleted by newer instance variables.
##  void SetCenter ( double centerX , double centerY ) ; double * GetCenter ( ) VTK_SIZEHINT ( 2 ) ; /@} /@{ *
##  Specify the calibrated principal point of the camera/lens
##  virtual void SetPrincipalPoint ( double _arg1 , double _arg2 ) { vtkDebugWithObjectMacro ( this , <<  setting  << PrincipalPoint  to ( << _arg1 << , << _arg2 << ) ) ; if ( ( this -> PrincipalPoint [ 0 ] != _arg1 ) || ( this -> PrincipalPoint [ 1 ] != _arg2 ) ) { this -> PrincipalPoint [ 0 ] = _arg1 ; this -> PrincipalPoint [ 1 ] = _arg2 ; this -> Modified ( ) ; } } void SetPrincipalPoint ( const double _arg [ 2 ] ) { this -> SetPrincipalPoint ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; virtual double * GetPrincipalPoint ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << PrincipalPoint  pointer  << this -> PrincipalPoint ) ; return this -> PrincipalPoint ; } VTK_WRAPEXCLUDE virtual void GetPrincipalPoint ( double data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> PrincipalPoint [ i ] ; } } ; /@} /@{ *
##  Specify the symmetric radial distortion parameters for the lens
##  virtual void SetK1 ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  K1  to  << _arg ) ; if ( this -> K1 != _arg ) { this -> K1 = _arg ; this -> Modified ( ) ; } } ; virtual double GetK1 ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << K1  of  << this -> K1 ) ; return this -> K1 ; } ; virtual void SetK1K2 ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  K2  to  << _arg ) ; if ( this -> K2 != _arg ) { this -> K2 = _arg ; this -> Modified ( ) ; } } ; virtual double GetK1K2 ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << K2  of  << this -> K2 ) ; return this -> K2 ; } ; /@} /@{ *
##  Specify the decentering distortion parameters for the lens
##  virtual void SetK1K2P1 ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  P1  to  << _arg ) ; if ( this -> P1 != _arg ) { this -> P1 = _arg ; this -> Modified ( ) ; } } ; virtual double GetK1K2P1 ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << P1  of  << this -> P1 ) ; return this -> P1 ; } ; virtual void SetK1K2P1P2 ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  P2  to  << _arg ) ; if ( this -> P2 != _arg ) { this -> P2 = _arg ; this -> Modified ( ) ; } } ; virtual double GetK1K2P1P2 ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << P2  of  << this -> P2 ) ; return this -> P2 ; } ; /@} /@{ *
##  Specify the imager format width / height in mm
##  virtual void SetK1K2P1P2FormatWidth ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  FormatWidth  to  << _arg ) ; if ( this -> FormatWidth != _arg ) { this -> FormatWidth = _arg ; this -> Modified ( ) ; } } ; virtual double GetK1K2P1P2FormatWidth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FormatWidth  of  << this -> FormatWidth ) ; return this -> FormatWidth ; } ; virtual void SetK1K2P1P2FormatWidthFormatHeight ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  FormatHeight  to  << _arg ) ; if ( this -> FormatHeight != _arg ) { this -> FormatHeight = _arg ; this -> Modified ( ) ; } } ; virtual double GetK1K2P1P2FormatWidthFormatHeight ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FormatHeight  of  << this -> FormatHeight ) ; return this -> FormatHeight ; } ; /@} /@{ *
##  Specify the image width / height in pixels
##  virtual void SetK1K2P1P2FormatWidthFormatHeightImageWidth ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ImageWidth  to  << _arg ) ; if ( this -> ImageWidth != _arg ) { this -> ImageWidth = _arg ; this -> Modified ( ) ; } } ; virtual int GetK1K2P1P2FormatWidthFormatHeightImageWidth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ImageWidth  of  << this -> ImageWidth ) ; return this -> ImageWidth ; } ; virtual void SetK1K2P1P2FormatWidthFormatHeightImageWidthImageHeight ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ImageHeight  to  << _arg ) ; if ( this -> ImageHeight != _arg ) { this -> ImageHeight = _arg ; this -> Modified ( ) ; } } ; virtual int GetK1K2P1P2FormatWidthFormatHeightImageWidthImageHeight ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ImageHeight  of  << this -> ImageHeight ) ; return this -> ImageHeight ; } ; /@} int FillInputPortInformation ( int port , vtkInformation * info ) override ; protected : vtkWarpLens ( ) ; ~ vtkWarpLens ( ) override = default ; int RequestDataObject ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; double PrincipalPoint [ 2 ] ;  The calibrated principal point of camera/lens in mm double K1 ;  Symmetric radial distortion parameters double K2 ; double P1 ;  Decentering distortion parameters double P2 ; double FormatWidth ;  imager format width in mm double FormatHeight ;  imager format height in mm int ImageWidth ;  image width in pixels int ImageHeight ;  image height in pixels private : vtkWarpLens ( const vtkWarpLens & ) = delete ; void operator = ( const vtkWarpLens & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
