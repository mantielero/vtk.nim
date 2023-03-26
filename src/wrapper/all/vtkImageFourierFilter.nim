## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageFourierFilter.h
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
##  @class   vtkImageFourierFilter
##  @brief   Superclass that implements complex numbers.
##
##  vtkImageFourierFilter is a class of filters that use complex numbers
##  this superclass is a container for methods that manipulate these structure
##  including fast Fourier transforms.  Complex numbers may become a class.
##  This should really be a helper class.
##

## !!!Ignored construct:  # vtkImageFourierFilter_h [NewLine] # vtkImageFourierFilter_h [NewLine] # vtkImageDecomposeFilter.h [NewLine] # vtkImagingFourierModule.h  For export macro [NewLine] ******************************************************************
##                         COMPLEX number stuff
## ***************************************************************** struct vtkImageComplex_t { double Real ; double Imag ; } ;
## Error: expected ';'!!!

type
  vtkImageComplex* = vtkImageComplex_t

## ignored statement

template vtkImageComplexEuclidSet*(C, R, I: untyped): untyped =
  (C).Real = (R)

## ignored statement

## !!!Ignored construct:  ( C ) . Imag = ( I ) [NewLine] # vtkImageComplexPolarSet ( C , M , P ) ( C ) . Real = ( M ) * cos ( P ) ;
## Error: expected ';'!!!

## !!!Ignored construct:  ( C ) . Imag = ( M ) * sin ( P ) [NewLine] # vtkImageComplexPrint ( C ) printf ( (%.3f, %.3f) , ( C ) . Real , ( C ) . Imag ) [NewLine] # vtkImageComplexScale ( cOut , S , cIn ) ( cOut ) . Real = ( cIn ) . Real * ( S ) ;
## Error: expected ';'!!!

## !!!Ignored construct:  ( cOut ) . Imag = ( cIn ) . Imag * ( S ) [NewLine] # vtkImageComplexConjugate ( cIn , cOut ) ( cOut ) . Imag = ( cIn ) . Imag * - 1.0 ;
## Error: expected ';'!!!

## !!!Ignored construct:  ( cOut ) . Real = ( cIn ) . Real [NewLine] # vtkImageComplexAdd ( C1 , C2 , cOut ) ( cOut ) . Real = ( C1 ) . Real + ( C2 ) . Real ;
## Error: expected ';'!!!

## !!!Ignored construct:  ( cOut ) . Imag = ( C1 ) . Imag + ( C2 ) . Imag [NewLine] # vtkImageComplexSubtract ( C1 , C2 , cOut ) ( cOut ) . Real = ( C1 ) . Real - ( C2 ) . Real ;
## Error: expected ';'!!!

## !!!Ignored construct:  ( cOut ) . Imag = ( C1 ) . Imag - ( C2 ) . Imag [NewLine] # vtkImageComplexMultiply ( C1 , C2 , cOut ) { vtkImageComplex vtkImageComplex_tMultiplyTemp ; vtkImageComplex_tMultiplyTemp . Real = ( C1 ) . Real * ( C2 ) . Real - ( C1 ) . Imag * ( C2 ) . Imag ; vtkImageComplex_tMultiplyTemp . Imag = ( C1 ) . Real * ( C2 ) . Imag + ( C1 ) . Imag * ( C2 ) . Real ; cOut = vtkImageComplex_tMultiplyTemp ; } [NewLine]  This macro calculates exp(cIn) and puts the result in cOut # vtkImageComplexExponential ( cIn , cOut ) { double tmp = exp ( cIn . Real ) ; cOut . Real = tmp * cos ( cIn . Imag ) ; cOut . Imag = tmp * sin ( cIn . Imag ) ; } [NewLine] ****************** End of COMPLEX number stuff ******************* class vtkImageFourierFilter : public vtkImageDecomposeFilter { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageDecomposeFilter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageDecomposeFilter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageFourierFilter :: IsTypeOf ( type ) ; } static vtkImageFourierFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageFourierFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageFourierFilter * NewInstance ( ) const { return vtkImageFourierFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageDecomposeFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageFourierFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageFourierFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ;  public for templated functions of this object *
##  This function calculates the whole fft of an array.
##  The contents of the input array are changed.
##  (It is engineered for no decimation)
##  void ExecuteFft ( vtkImageComplex * in , vtkImageComplex * out , int N ) ; *
##  This function calculates the whole fft of an array.
##  The contents of the input array are changed.
##  (It is engineered for no decimation)
##  void ExecuteRfft ( vtkImageComplex * in , vtkImageComplex * out , int N ) ; protected : vtkImageFourierFilter ( ) = default ; ~ vtkImageFourierFilter ( ) override = default ; void ExecuteFftStep2 ( vtkImageComplex * p_in , vtkImageComplex * p_out , int N , int bsize , int fb ) ; void ExecuteFftStepN ( vtkImageComplex * p_in , vtkImageComplex * p_out , int N , int bsize , int n , int fb ) ; void ExecuteFftForwardBackward ( vtkImageComplex * in , vtkImageComplex * out , int N , int fb ) ; *
##  Override to change extent splitting rules.
##  int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; private : vtkImageFourierFilter ( const vtkImageFourierFilter & ) = delete ; void operator = ( const vtkImageFourierFilter & ) = delete ; } ;
## Error: expected ';'!!!
