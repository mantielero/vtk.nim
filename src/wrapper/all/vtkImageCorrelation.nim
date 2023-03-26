## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageCorrelation.h
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
##  @class   vtkImageCorrelation
##  @brief   Correlation imageof the two inputs.
##
##  vtkImageCorrelation finds the correlation between two data sets.
##  SetDimensionality determines
##  whether the Correlation will be 3D, 2D or 1D.
##  The default is a 2D Correlation.  The Output type will be double.
##  The output size will match the size of the first input.
##  The second input is considered the correlation kernel.
##

## !!!Ignored construct:  # vtkImageCorrelation_h [NewLine] # vtkImageCorrelation_h [NewLine] # vtkImagingGeneralModule.h  For export macro # vtkThreadedImageAlgorithm.h [NewLine] class VTKIMAGINGGENERAL_EXPORT vtkImageCorrelation : public vtkThreadedImageAlgorithm { public : static vtkImageCorrelation * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkThreadedImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkThreadedImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageCorrelation :: IsTypeOf ( type ) ; } static vtkImageCorrelation * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageCorrelation * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageCorrelation * NewInstance ( ) const { return vtkImageCorrelation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageCorrelation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageCorrelation :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Determines how the input is interpreted (set of 2d slices ...).
##  The default is 2.
##  virtual void SetDimensionality ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Dimensionality  to  << _arg ) ; if ( this -> Dimensionality != ( _arg < 2 ? 2 : ( _arg > 3 ? 3 : _arg ) ) ) { this -> Dimensionality = ( _arg < 2 ? 2 : ( _arg > 3 ? 3 : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetDimensionalityMinValue ( ) { return 2 ; } virtual int GetDimensionalityMaxValue ( ) { return 3 ; } ; virtual int GetDimensionality ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Dimensionality  of  << this -> Dimensionality ) ; return this -> Dimensionality ; } ; /@} *
##  Set the input image.
##  virtual void SetInput1Data ( vtkDataObject * in ) { this -> SetInputData ( 0 , in ) ; } *
##  Set the correlation kernel.
##  virtual void SetInput2Data ( vtkDataObject * in ) { this -> SetInputData ( 1 , in ) ; } protected : vtkImageCorrelation ( ) ; ~ vtkImageCorrelation ( ) override = default ; int Dimensionality ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; void ThreadedRequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector , vtkImageData * * * inData , vtkImageData * * outData , int outExt [ 6 ] , int threadId ) override ; private : vtkImageCorrelation ( const vtkImageCorrelation & ) = delete ; void operator = ( const vtkImageCorrelation & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
