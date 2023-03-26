## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageStencilToImage.h
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
##  @class   vtkImageStencilToImage
##  @brief   Convert an image stencil into an image
##
##  vtkImageStencilToImage will convert an image stencil into a binary
##  image.  The default output will be an 8-bit image with a value of 1
##  inside the stencil and 0 outside.  When used in combination with
##  vtkPolyDataToImageStencil or vtkImplicitFunctionToImageStencil, this
##  can be used to create a binary image from a mesh or a function.
##  @sa
##  vtkImplicitModeller
##

## !!!Ignored construct:  # vtkImageStencilToImage_h [NewLine] # vtkImageStencilToImage_h [NewLine] # vtkImageAlgorithm.h [NewLine] # vtkImagingStencilModule.h  For export macro [NewLine] class VTKIMAGINGSTENCIL_EXPORT vtkImageStencilToImage : public vtkImageAlgorithm { public : static vtkImageStencilToImage * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageStencilToImage :: IsTypeOf ( type ) ; } static vtkImageStencilToImage * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageStencilToImage * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageStencilToImage * NewInstance ( ) const { return vtkImageStencilToImage :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageStencilToImage :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageStencilToImage :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  The value to use outside the stencil.  The default is 0.
##  virtual void SetOutsideValue ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutsideValue  to  << _arg ) ; if ( this -> OutsideValue != _arg ) { this -> OutsideValue = _arg ; this -> Modified ( ) ; } } ; virtual double GetOutsideValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutsideValue  of  << this -> OutsideValue ) ; return this -> OutsideValue ; } ; /@} /@{ *
##  The value to use inside the stencil.  The default is 1.
##  virtual void SetOutsideValueInsideValue ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  InsideValue  to  << _arg ) ; if ( this -> InsideValue != _arg ) { this -> InsideValue = _arg ; this -> Modified ( ) ; } } ; virtual double GetOutsideValueInsideValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InsideValue  of  << this -> InsideValue ) ; return this -> InsideValue ; } ; /@} /@{ *
##  The desired output scalar type.  The default is unsigned char.
##  virtual void SetOutsideValueInsideValueOutputScalarType ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputScalarType  to  << _arg ) ; if ( this -> OutputScalarType != _arg ) { this -> OutputScalarType = _arg ; this -> Modified ( ) ; } } ; virtual int GetOutsideValueInsideValueOutputScalarType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputScalarType  of  << this -> OutputScalarType ) ; return this -> OutputScalarType ; } ; void SetOutputScalarTypeToFloat ( ) { this -> SetOutputScalarType ( VTK_FLOAT ) ; } void SetOutputScalarTypeToDouble ( ) { this -> SetOutputScalarType ( VTK_DOUBLE ) ; } void SetOutputScalarTypeToInt ( ) { this -> SetOutputScalarType ( VTK_INT ) ; } void SetOutputScalarTypeToUnsignedInt ( ) { this -> SetOutputScalarType ( VTK_UNSIGNED_INT ) ; } void SetOutputScalarTypeToLong ( ) { this -> SetOutputScalarType ( VTK_LONG ) ; } void SetOutputScalarTypeToUnsignedLong ( ) { this -> SetOutputScalarType ( VTK_UNSIGNED_LONG ) ; } void SetOutputScalarTypeToShort ( ) { this -> SetOutputScalarType ( VTK_SHORT ) ; } void SetOutputScalarTypeToUnsignedShort ( ) { this -> SetOutputScalarType ( VTK_UNSIGNED_SHORT ) ; } void SetOutputScalarTypeToUnsignedChar ( ) { this -> SetOutputScalarType ( VTK_UNSIGNED_CHAR ) ; } void SetOutputScalarTypeToChar ( ) { this -> SetOutputScalarType ( VTK_CHAR ) ; } /@} protected : vtkImageStencilToImage ( ) ; ~ vtkImageStencilToImage ( ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; double OutsideValue ; double InsideValue ; int OutputScalarType ; int FillInputPortInformation ( int , vtkInformation * ) override ; private : vtkImageStencilToImage ( const vtkImageStencilToImage & ) = delete ; void operator = ( const vtkImageStencilToImage & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
