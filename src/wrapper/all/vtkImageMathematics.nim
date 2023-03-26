## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageMathematics.h
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
##  @class   vtkImageMathematics
##  @brief   Add, subtract, multiply, divide, invert, sin,
##  cos, exp, log.
##
##  vtkImageMathematics implements basic mathematic operations SetOperation is
##  used to select the filters behavior.  The filter can take two or one
##  input.
##

## !!!Ignored construct:  # vtkImageMathematics_h [NewLine] # vtkImageMathematics_h [NewLine]  Operation options. # VTK_ADD 0 [NewLine] # VTK_SUBTRACT 1 [NewLine] # VTK_MULTIPLY 2 [NewLine] # VTK_DIVIDE 3 [NewLine] # VTK_INVERT 4 [NewLine] # VTK_SIN 5 [NewLine] # VTK_COS 6 [NewLine] # VTK_EXP 7 [NewLine] # VTK_LOG 8 [NewLine] # VTK_ABS 9 [NewLine] # VTK_SQR 10 [NewLine] # VTK_SQRT 11 [NewLine] # VTK_MIN 12 [NewLine] # VTK_MAX 13 [NewLine] # VTK_ATAN 14 [NewLine] # VTK_ATAN2 15 [NewLine] # VTK_MULTIPLYBYK 16 [NewLine] # VTK_ADDC 17 [NewLine] # VTK_CONJUGATE 18 [NewLine] # VTK_COMPLEX_MULTIPLY 19 [NewLine] # VTK_REPLACECBYK 20 [NewLine] # vtkImagingMathModule.h  For export macro # vtkThreadedImageAlgorithm.h [NewLine] class VTKIMAGINGMATH_EXPORT vtkImageMathematics : public vtkThreadedImageAlgorithm { public : static vtkImageMathematics * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkThreadedImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkThreadedImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageMathematics :: IsTypeOf ( type ) ; } static vtkImageMathematics * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageMathematics * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageMathematics * NewInstance ( ) const { return vtkImageMathematics :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageMathematics :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageMathematics :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set/Get the Operation to perform.
##  virtual void SetOperation ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Operation  to  << _arg ) ; if ( this -> Operation != _arg ) { this -> Operation = _arg ; this -> Modified ( ) ; } } ; virtual int GetOperation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Operation  of  << this -> Operation ) ; return this -> Operation ; } ; /@} *
##  Set each pixel in the output image to the sum of the corresponding pixels
##  in Input1 and Input2.
##  void SetOperationToAdd ( ) { this -> SetOperation ( VTK_ADD ) ; } *
##  Set each pixel in the output image to the difference of the corresponding pixels
##  in Input1 and Input2 (output = Input1 - Input2).
##  void SetOperationToSubtract ( ) { this -> SetOperation ( VTK_SUBTRACT ) ; } *
##  Set each pixel in the output image to the product of the corresponding pixels
##  in Input1 and Input2.
##  void SetOperationToMultiply ( ) { this -> SetOperation ( VTK_MULTIPLY ) ; } *
##  Set each pixel in the output image to the quotient of the corresponding pixels
##  in Input1 and Input2 (Output = Input1 / Input2).
##  void SetOperationToDivide ( ) { this -> SetOperation ( VTK_DIVIDE ) ; } void SetOperationToConjugate ( ) { this -> SetOperation ( VTK_CONJUGATE ) ; } void SetOperationToComplexMultiply ( ) { this -> SetOperation ( VTK_COMPLEX_MULTIPLY ) ; } *
##  Set each pixel in the output image to 1 over the corresponding pixel
##  in Input1 and Input2 (output = 1 / Input1). Input2 is not used.
##  void SetOperationToInvert ( ) { this -> SetOperation ( VTK_INVERT ) ; } *
##  Set each pixel in the output image to the sine of the corresponding pixel
##  in Input1. Input2 is not used.
##  void SetOperationToSin ( ) { this -> SetOperation ( VTK_SIN ) ; } *
##  Set each pixel in the output image to the cosine of the corresponding pixel
##  in Input1. Input2 is not used.
##  void SetOperationToCos ( ) { this -> SetOperation ( VTK_COS ) ; } *
##  Set each pixel in the output image to the exponential of the corresponding pixel
##  in Input1. Input2 is not used.
##  void SetOperationToExp ( ) { this -> SetOperation ( VTK_EXP ) ; } *
##  Set each pixel in the output image to the log of the corresponding pixel
##  in Input1. Input2 is not used.
##  void SetOperationToLog ( ) { this -> SetOperation ( VTK_LOG ) ; } *
##  Set each pixel in the output image to the absolute value of the corresponding pixel
##  in Input1. Input2 is not used.
##  void SetOperationToAbsoluteValue ( ) { this -> SetOperation ( VTK_ABS ) ; } *
##  Set each pixel in the output image to the square of the corresponding pixel
##  in Input1. Input2 is not used.
##  void SetOperationToSquare ( ) { this -> SetOperation ( VTK_SQR ) ; } *
##  Set each pixel in the output image to the square root of the corresponding pixel
##  in Input1. Input2 is not used.
##  void SetOperationToSquareRoot ( ) { this -> SetOperation ( VTK_SQRT ) ; } *
##  Set each pixel in the output image to the minimum of the corresponding pixels
##  in Input1 and Input2. (Output = min(Input1, Input2))
##  void SetOperationToMin ( ) { this -> SetOperation ( VTK_MIN ) ; } *
##  Set each pixel in the output image to the maximum of the corresponding pixels
##  in Input1 and Input2. (Output = max(Input1, Input2))
##  void SetOperationToMax ( ) { this -> SetOperation ( VTK_MAX ) ; } *
##  Set each pixel in the output image to the arctangent of the corresponding pixel
##  in Input1. Input2 is not used.
##  void SetOperationToATAN ( ) { this -> SetOperation ( VTK_ATAN ) ; } void SetOperationToATAN2 ( ) { this -> SetOperation ( VTK_ATAN2 ) ; } *
##  Set each pixel in the output image to the product of ConstantK with the
##  corresponding pixel in Input1. Input2 is not used.
##  void SetOperationToMultiplyByK ( ) { this -> SetOperation ( VTK_MULTIPLYBYK ) ; } *
##  Set each pixel in the output image to the product of ConstantC with the
##  corresponding pixel in Input1. Input2 is not used.
##  void SetOperationToAddConstant ( ) { this -> SetOperation ( VTK_ADDC ) ; } *
##  Find every pixel in Input1 that equals ConstantC and set the corresponding pixels
##  in the Output to ConstantK. Input2 is not used.
##  void SetOperationToReplaceCByK ( ) { this -> SetOperation ( VTK_REPLACECBYK ) ; } /@{ *
##  A constant used by some operations (typically multiplicative). Default is 1.
##  virtual void SetOperationConstantK ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ConstantK  to  << _arg ) ; if ( this -> ConstantK != _arg ) { this -> ConstantK = _arg ; this -> Modified ( ) ; } } ; virtual double GetOperationConstantK ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ConstantK  of  << this -> ConstantK ) ; return this -> ConstantK ; } ; /@} /@{ *
##  A constant used by some operations (typically additive). Default is 0.
##  virtual void SetOperationConstantKConstantC ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ConstantC  to  << _arg ) ; if ( this -> ConstantC != _arg ) { this -> ConstantC = _arg ; this -> Modified ( ) ; } } ; virtual double GetOperationConstantKConstantC ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ConstantC  of  << this -> ConstantC ) ; return this -> ConstantC ; } ; /@} /@{ *
##  How to handle divide by zero. Default is 0.
##  virtual void SetOperationConstantKConstantCDivideByZeroToC ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  DivideByZeroToC  to  << _arg ) ; if ( this -> DivideByZeroToC != _arg ) { this -> DivideByZeroToC = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetOperationConstantKConstantCDivideByZeroToC ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DivideByZeroToC  of  << this -> DivideByZeroToC ) ; return this -> DivideByZeroToC ; } ; virtual void DivideByZeroToCOn ( ) { this -> SetDivideByZeroToC ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void DivideByZeroToCOff ( ) { this -> SetDivideByZeroToC ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set the inputs to this filter. For some operations, the second input
##  is not used.
##  virtual void SetInput1Data ( vtkDataObject * in ) { this -> SetInputData ( 0 , in ) ; } virtual void SetInput2Data ( vtkDataObject * in ) { this -> AddInputData ( 0 , in ) ; } virtual void SetInputConnection ( int idx , vtkAlgorithmOutput * input ) override ; virtual void SetInputConnection ( vtkAlgorithmOutput * input ) override { this -> SetInputConnection ( 0 , input ) ; } /@} *
##  Replace one of the input connections with a new input.  You can
##  only replace input connections that you previously created with
##  AddInputConnection() or, in the case of the first input,
##  with SetInputConnection().
##  virtual void ReplaceNthInputConnection ( int idx , vtkAlgorithmOutput * input ) ; /@{ *
##  Assign a data object as input. Note that this method does not
##  establish a pipeline connection. Use SetInputConnection() to
##  setup a pipeline connection.
##  void SetInputData ( int idx , vtkDataObject * input ) ; void SetInputData ( vtkDataObject * input ) { this -> SetInputData ( 0 , input ) ; } /@} /@{ *
##  Get one input to this filter. This method is only for support of
##  old-style pipeline connections.  When writing new code you should
##  use vtkAlgorithm::GetInputConnection(0, num).
##  vtkDataObject * GetInput ( int idx ) ; vtkDataObject * GetInput ( ) { return this -> GetInput ( 0 ) ; } /@} *
##  Get the number of inputs to this filter. This method is only for
##  support of old-style pipeline connections.  When writing new code
##  you should use vtkAlgorithm::GetNumberOfInputConnections(0).
##  int GetNumberOfInputs ( ) { return this -> GetNumberOfInputConnections ( 0 ) ; } protected : vtkImageMathematics ( ) ; ~ vtkImageMathematics ( ) override = default ; int Operation ; double ConstantK ; double ConstantC ; vtkTypeBool DivideByZeroToC ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; void ThreadedRequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector , vtkImageData * * * inData , vtkImageData * * outData , int outExt [ 6 ] , int threadId ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; private : vtkImageMathematics ( const vtkImageMathematics & ) = delete ; void operator = ( const vtkImageMathematics & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
