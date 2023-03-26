## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageRGBToHSV.h
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
##  @class   vtkImageRGBToHSV
##  @brief   Converts RGB components to HSV.
##
##  For each pixel with red, blue, and green components this
##  filter output the color coded as hue, saturation and value.
##  Output type must be the same as input type.
##

## !!!Ignored construct:  # vtkImageRGBToHSV_h [NewLine] # vtkImageRGBToHSV_h [NewLine] # vtkImagingColorModule.h  For export macro # vtkThreadedImageAlgorithm.h [NewLine] class VTKIMAGINGCOLOR_EXPORT vtkImageRGBToHSV : public vtkThreadedImageAlgorithm { public : static vtkImageRGBToHSV * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkThreadedImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkThreadedImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageRGBToHSV :: IsTypeOf ( type ) ; } static vtkImageRGBToHSV * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageRGBToHSV * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageRGBToHSV * NewInstance ( ) const { return vtkImageRGBToHSV :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageRGBToHSV :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageRGBToHSV :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ;  Hue is an angle. Maximum specifies when it maps back to 0.  HueMaximum
##  defaults to 255 instead of 2PI, because unsigned char is expected as
##  input.  Maximum also specifies the maximum of the Saturation. virtual void SetMaximum ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Maximum  to  << _arg ) ; if ( this -> Maximum != _arg ) { this -> Maximum = _arg ; this -> Modified ( ) ; } } ; virtual double GetMaximum ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Maximum  of  << this -> Maximum ) ; return this -> Maximum ; } ; protected : vtkImageRGBToHSV ( ) ; ~ vtkImageRGBToHSV ( ) override = default ; double Maximum ; void ThreadedExecute ( vtkImageData * inData , vtkImageData * outData , int ext [ 6 ] , int id ) override ; private : vtkImageRGBToHSV ( const vtkImageRGBToHSV & ) = delete ; void operator = ( const vtkImageRGBToHSV & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
