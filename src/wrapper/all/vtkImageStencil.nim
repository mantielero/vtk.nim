## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageStencil.h
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
##  @class   vtkImageStencil
##  @brief   combine images via a cookie-cutter operation
##
##  vtkImageStencil will combine two images together using a stencil.
##  The stencil should be provided in the form of a vtkImageStencilData,
##

## !!!Ignored construct:  # vtkImageStencil_h [NewLine] # vtkImageStencil_h [NewLine] # vtkImagingStencilModule.h  For export macro # vtkThreadedImageAlgorithm.h [NewLine] class vtkImageStencilData ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIMAGINGSTENCIL_EXPORT vtkImageStencil : public vtkThreadedImageAlgorithm { public : static vtkImageStencil * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkThreadedImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkThreadedImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageStencil :: IsTypeOf ( type ) ; } static vtkImageStencil * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageStencil * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageStencil * NewInstance ( ) const { return vtkImageStencil :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageStencil :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageStencil :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Specify the stencil to use.  The stencil can be created
##  from a vtkImplicitFunction or a vtkPolyData. This
##  function does not setup a pipeline connection.
##  virtual void SetStencilData ( vtkImageStencilData * stencil ) ; vtkImageStencilData * GetStencil ( ) ; /@} *
##  Specify the stencil to use. This sets up a pipeline connection.
##  void SetStencilConnection ( vtkAlgorithmOutput * outputPort ) { this -> SetInputConnection ( 2 , outputPort ) ; } /@{ *
##  Reverse the stencil.
##  virtual void SetReverseStencil ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ReverseStencil  to  << _arg ) ; if ( this -> ReverseStencil != _arg ) { this -> ReverseStencil = _arg ; this -> Modified ( ) ; } } ; virtual void ReverseStencilOn ( ) { this -> SetReverseStencil ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ReverseStencilOff ( ) { this -> SetReverseStencil ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual vtkTypeBool GetReverseStencil ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReverseStencil  of  << this -> ReverseStencil ) ; return this -> ReverseStencil ; } ; /@} /@{ *
##  Set the second input.  This image will be used for the 'outside' of the
##  stencil.  If not set, the output voxels will be filled with
##  BackgroundValue instead.
##  virtual void SetBackgroundInputData ( vtkImageData * input ) ; vtkImageData * GetBackgroundInput ( ) ; /@} /@{ *
##  Set the default output value to use when the second input is not set.
##  void SetBackgroundValue ( double val ) { this -> SetBackgroundColor ( val , val , val , val ) ; } double GetBackgroundValue ( ) { return this -> BackgroundColor [ 0 ] ; } /@} /@{ *
##  Set the default color to use when the second input is not set.
##  This is like SetBackgroundValue, but for multi-component images.
##  virtual void SetBackgroundColor ( double _arg1 , double _arg2 , double _arg3 , double _arg4 ) { vtkDebugWithObjectMacro ( this , <<  setting  << BackgroundColor  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; if ( ( this -> BackgroundColor [ 0 ] != _arg1 ) || ( this -> BackgroundColor [ 1 ] != _arg2 ) || ( this -> BackgroundColor [ 2 ] != _arg3 ) || ( this -> BackgroundColor [ 3 ] != _arg4 ) ) { this -> BackgroundColor [ 0 ] = _arg1 ; this -> BackgroundColor [ 1 ] = _arg2 ; this -> BackgroundColor [ 2 ] = _arg3 ; this -> BackgroundColor [ 3 ] = _arg4 ; this -> Modified ( ) ; } } virtual void SetBackgroundColor ( const double _arg [ 4 ] ) { this -> SetBackgroundColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ; virtual double * GetBackgroundColor ( ) VTK_SIZEHINT ( 4 ) { vtkDebugWithObjectMacro ( this , <<  returning  << BackgroundColor  pointer  << this -> BackgroundColor ) ; return this -> BackgroundColor ; } VTK_WRAPEXCLUDE virtual void GetBackgroundColor ( double & _arg1 , double & _arg2 , double & _arg3 , double & _arg4 ) { _arg1 = this -> BackgroundColor [ 0 ] ; _arg2 = this -> BackgroundColor [ 1 ] ; _arg3 = this -> BackgroundColor [ 2 ] ; _arg4 = this -> BackgroundColor [ 3 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << BackgroundColor  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetBackgroundColor ( double _arg [ 4 ] ) { this -> GetBackgroundColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ; /@} protected : vtkImageStencil ( ) ; ~ vtkImageStencil ( ) override ; void ThreadedRequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector , vtkImageData * * * inData , vtkImageData * * outData , int extent [ 6 ] , int id ) override ; vtkTypeBool ReverseStencil ; double BackgroundColor [ 4 ] ; int FillInputPortInformation ( int , vtkInformation * ) override ; private : vtkImageStencil ( const vtkImageStencil & ) = delete ; void operator = ( const vtkImageStencil & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
