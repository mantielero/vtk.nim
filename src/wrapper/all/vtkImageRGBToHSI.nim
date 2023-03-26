## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageRGBToHSI.h
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
##  @class   vtkImageRGBToHSI
##  @brief   Converts RGB components to HSI.
##
##  For each pixel with red, blue, and green components this
##  filter output the color coded as hue, saturation and intensity.
##  Output type must be the same as input type.
##

## !!!Ignored construct:  # vtkImageRGBToHSI_h [NewLine] # vtkImageRGBToHSI_h [NewLine] # vtkImagingColorModule.h  For export macro # vtkThreadedImageAlgorithm.h [NewLine] class VTKIMAGINGCOLOR_EXPORT vtkImageRGBToHSI : public vtkThreadedImageAlgorithm { public : static vtkImageRGBToHSI * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkThreadedImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkThreadedImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageRGBToHSI :: IsTypeOf ( type ) ; } static vtkImageRGBToHSI * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageRGBToHSI * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageRGBToHSI * NewInstance ( ) const { return vtkImageRGBToHSI :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageRGBToHSI :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageRGBToHSI :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Hue is an angle. Maximum specifies when it maps back to 0.  HueMaximum
##  defaults to 255 instead of 2PI, because unsigned char is expected as
##  input.  Maximum also specifies the maximum of the Saturation.
##  virtual void SetMaximum ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Maximum  to  << _arg ) ; if ( this -> Maximum != _arg ) { this -> Maximum = _arg ; this -> Modified ( ) ; } } ; virtual double GetMaximum ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Maximum  of  << this -> Maximum ) ; return this -> Maximum ; } ; /@} protected : vtkImageRGBToHSI ( ) ; ~ vtkImageRGBToHSI ( ) override = default ; double Maximum ; void ThreadedExecute ( vtkImageData * inData , vtkImageData * outData , int ext [ 6 ] , int id ) override ; private : vtkImageRGBToHSI ( const vtkImageRGBToHSI & ) = delete ; void operator = ( const vtkImageRGBToHSI & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
