## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageLogarithmicScale.h
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
##  @class   vtkImageLogarithmicScale
##  @brief   Passes each pixel through log function.
##
##  vtkImageLogarithmicScale passes each pixel through the function
##  c*log(1+x).  It also handles negative values with the function
##  -c*log(1-x).
##

## !!!Ignored construct:  # vtkImageLogarithmicScale_h [NewLine] # vtkImageLogarithmicScale_h [NewLine] # vtkImagingMathModule.h  For export macro # vtkThreadedImageAlgorithm.h [NewLine] class VTKIMAGINGMATH_EXPORT vtkImageLogarithmicScale : public vtkThreadedImageAlgorithm { public : static vtkImageLogarithmicScale * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkThreadedImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkThreadedImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageLogarithmicScale :: IsTypeOf ( type ) ; } static vtkImageLogarithmicScale * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageLogarithmicScale * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageLogarithmicScale * NewInstance ( ) const { return vtkImageLogarithmicScale :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageLogarithmicScale :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageLogarithmicScale :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set/Get the scale factor for the logarithmic function.
##  virtual void SetConstant ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Constant  to  << _arg ) ; if ( this -> Constant != _arg ) { this -> Constant = _arg ; this -> Modified ( ) ; } } ; virtual double GetConstant ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Constant  of  << this -> Constant ) ; return this -> Constant ; } ; /@} protected : vtkImageLogarithmicScale ( ) ; ~ vtkImageLogarithmicScale ( ) override = default ; double Constant ; void ThreadedExecute ( vtkImageData * inData , vtkImageData * outData , int outExt [ 6 ] , int id ) override ; private : vtkImageLogarithmicScale ( const vtkImageLogarithmicScale & ) = delete ; void operator = ( const vtkImageLogarithmicScale & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
