## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageShiftScale.h
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
##  @class   vtkImageShiftScale
##  @brief   shift and scale an input image
##
##  With vtkImageShiftScale Pixels are shifted (a constant value added)
##  and then scaled (multiplied by a scalar. As a convenience, this class
##  allows you to set the output scalar type similar to vtkImageCast.
##  This is because shift scale operations frequently convert data types.
##

## !!!Ignored construct:  # vtkImageShiftScale_h [NewLine] # vtkImageShiftScale_h [NewLine] # vtkImagingCoreModule.h  For export macro # vtkThreadedImageAlgorithm.h [NewLine] class VTKIMAGINGCORE_EXPORT vtkImageShiftScale : public vtkThreadedImageAlgorithm { public : static vtkImageShiftScale * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkThreadedImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkThreadedImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageShiftScale :: IsTypeOf ( type ) ; } static vtkImageShiftScale * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageShiftScale * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageShiftScale * NewInstance ( ) const { return vtkImageShiftScale :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageShiftScale :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageShiftScale :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set/Get the shift value. This value is added to each pixel
##  virtual void SetShift ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Shift  to  << _arg ) ; if ( this -> Shift != _arg ) { this -> Shift = _arg ; this -> Modified ( ) ; } } ; virtual double GetShift ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Shift  of  << this -> Shift ) ; return this -> Shift ; } ; /@} /@{ *
##  Set/Get the scale value. Each pixel is multiplied by this value.
##  virtual void SetShiftScale ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Scale  to  << _arg ) ; if ( this -> Scale != _arg ) { this -> Scale = _arg ; this -> Modified ( ) ; } } ; virtual double GetShiftScale ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Scale  of  << this -> Scale ) ; return this -> Scale ; } ; /@} /@{ *
##  Set the desired output scalar type. The result of the shift
##  and scale operations is cast to the type specified.
##  virtual void SetShiftScaleOutputScalarType ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputScalarType  to  << _arg ) ; if ( this -> OutputScalarType != _arg ) { this -> OutputScalarType = _arg ; this -> Modified ( ) ; } } ; virtual int GetShiftScaleOutputScalarType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputScalarType  of  << this -> OutputScalarType ) ; return this -> OutputScalarType ; } ; void SetOutputScalarTypeToDouble ( ) { this -> SetOutputScalarType ( VTK_DOUBLE ) ; } void SetOutputScalarTypeToFloat ( ) { this -> SetOutputScalarType ( VTK_FLOAT ) ; } void SetOutputScalarTypeToLong ( ) { this -> SetOutputScalarType ( VTK_LONG ) ; } void SetOutputScalarTypeToUnsignedLong ( ) { this -> SetOutputScalarType ( VTK_UNSIGNED_LONG ) ; } void SetOutputScalarTypeToInt ( ) { this -> SetOutputScalarType ( VTK_INT ) ; } void SetOutputScalarTypeToUnsignedInt ( ) { this -> SetOutputScalarType ( VTK_UNSIGNED_INT ) ; } void SetOutputScalarTypeToShort ( ) { this -> SetOutputScalarType ( VTK_SHORT ) ; } void SetOutputScalarTypeToUnsignedShort ( ) { this -> SetOutputScalarType ( VTK_UNSIGNED_SHORT ) ; } void SetOutputScalarTypeToChar ( ) { this -> SetOutputScalarType ( VTK_CHAR ) ; } void SetOutputScalarTypeToUnsignedChar ( ) { this -> SetOutputScalarType ( VTK_UNSIGNED_CHAR ) ; } /@} /@{ *
##  When the ClampOverflow flag is on, the data is thresholded so that
##  the output value does not exceed the max or min of the data type.
##  Clamping is safer because otherwise you might invoke undefined
##  behavior (and may crash) if the type conversion is out of range
##  of the data type.  On the other hand, clamping is slower.
##  By default, ClampOverflow is off.
##  virtual void SetShiftScaleOutputScalarTypeClampOverflow ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ClampOverflow  to  << _arg ) ; if ( this -> ClampOverflow != _arg ) { this -> ClampOverflow = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetShiftScaleOutputScalarTypeClampOverflow ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ClampOverflow  of  << this -> ClampOverflow ) ; return this -> ClampOverflow ; } ; virtual void ClampOverflowOn ( ) { this -> SetClampOverflow ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ClampOverflowOff ( ) { this -> SetClampOverflow ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkImageShiftScale ( ) ; ~ vtkImageShiftScale ( ) override ; double Shift ; double Scale ; int OutputScalarType ; vtkTypeBool ClampOverflow ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; void ThreadedRequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * , vtkImageData * * * inData , vtkImageData * * outData , int outExt [ 6 ] , int threadId ) override ; private : vtkImageShiftScale ( const vtkImageShiftScale & ) = delete ; void operator = ( const vtkImageShiftScale & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
