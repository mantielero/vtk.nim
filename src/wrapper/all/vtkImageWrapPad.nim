## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageWrapPad.h
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
##  @class   vtkImageWrapPad
##  @brief   Makes an image larger by wrapping existing data.
##
##  vtkImageWrapPad performs a modulo operation on the output pixel index
##  to determine the source input index.  The new image extent of the
##  output has to be specified.  Input has to be the same scalar type as
##  output.
##

## !!!Ignored construct:  # vtkImageWrapPad_h [NewLine] # vtkImageWrapPad_h [NewLine] # vtkImagePadFilter.h [NewLine] # vtkImagingCoreModule.h  For export macro [NewLine] class vtkInformation ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkInformationVector"
## !!!Ignored construct:  class VTKIMAGINGCORE_EXPORT vtkImageWrapPad : public vtkImagePadFilter { public : static vtkImageWrapPad * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImagePadFilter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImagePadFilter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageWrapPad :: IsTypeOf ( type ) ; } static vtkImageWrapPad * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageWrapPad * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageWrapPad * NewInstance ( ) const { return vtkImageWrapPad :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImagePadFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageWrapPad :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageWrapPad :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : vtkImageWrapPad ( ) = default ; ~ vtkImageWrapPad ( ) override = default ; void ComputeInputUpdateExtent ( int inExt [ 6 ] , int outExt [ 6 ] , int wholeExtent [ 6 ] ) override ; void ThreadedRequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector , vtkImageData * * * inData , vtkImageData * * outData , int ext [ 6 ] , int id ) override ; private : vtkImageWrapPad ( const vtkImageWrapPad & ) = delete ; void operator = ( const vtkImageWrapPad & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
