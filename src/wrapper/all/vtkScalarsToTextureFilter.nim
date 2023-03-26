## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkScalarsToTextureFilter.h
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
##  @class   vtkScalarsToTextureFilter
##  @brief   generate texture coordinates and a texture image based on a scalar field
##
##  This filter computes texture coordinates and a 2D texture image based on a polydata,
##  a color transfer function and an array.
##  The output port 0 will contain the input polydata with computed texture coordinates.
##  The output port 1 will contain the texture.
##  The computed texture coordinates is based on vtkTextureMapToPlane which computes them using
##  3D positions projected on the best fitting plane.
##  @sa vtkTextureMapToPlane vtkResampleToImage
##

## !!!Ignored construct:  # vtkScalarsToTextureFilter_h [NewLine] # vtkScalarsToTextureFilter_h [NewLine] # vtkFiltersTextureModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] # vtkSmartPointer.h  For smart pointer [NewLine] class vtkImageData ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPolyData"
discard "forward decl of vtkScalarsToColors"
## !!!Ignored construct:  class VTKFILTERSTEXTURE_EXPORT vtkScalarsToTextureFilter : public vtkPolyDataAlgorithm { public : static vtkScalarsToTextureFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkScalarsToTextureFilter :: IsTypeOf ( type ) ; } static vtkScalarsToTextureFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkScalarsToTextureFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkScalarsToTextureFilter * NewInstance ( ) const { return vtkScalarsToTextureFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkScalarsToTextureFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkScalarsToTextureFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set/Get a color transfer function.
##  This transfer function will be used to determine the pixel colors of the texture.
##  If not specified, the filter use a default one (blue/white/red) based on the range of the
##  input array.
##  void SetTransferFunction ( vtkScalarsToColors * stc ) ; vtkScalarsToColors * GetTransferFunction ( ) ; /@} /@{ *
##  Specify if a new point array containing RGBA values have to be computed by the specified
##  color transfer function.
##  virtual bool GetUseTransferFunction ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseTransferFunction  of  << this -> UseTransferFunction ) ; return this -> UseTransferFunction ; } ; virtual void SetUseTransferFunction ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseTransferFunction  to  << _arg ) ; if ( this -> UseTransferFunction != _arg ) { this -> UseTransferFunction = _arg ; this -> Modified ( ) ; } } ; virtual void UseTransferFunctionOn ( ) { this -> SetUseTransferFunction ( static_cast < bool > ( 1 ) ) ; } virtual void UseTransferFunctionOff ( ) { this -> SetUseTransferFunction ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Get/Set the width and height of the generated texture.
##  Default is 128x128. The width and height must be greater than 1.
##  virtual void SetTextureDimensions ( int _arg1 , int _arg2 ) { vtkDebugWithObjectMacro ( this , <<  setting  << TextureDimensions  to ( << _arg1 << , << _arg2 << ) ) ; if ( ( this -> TextureDimensions [ 0 ] != _arg1 ) || ( this -> TextureDimensions [ 1 ] != _arg2 ) ) { this -> TextureDimensions [ 0 ] = _arg1 ; this -> TextureDimensions [ 1 ] = _arg2 ; this -> Modified ( ) ; } } void SetTextureDimensions ( const int _arg [ 2 ] ) { this -> SetTextureDimensions ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; virtual int * GetTextureDimensions ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << TextureDimensions  pointer  << this -> TextureDimensions ) ; return this -> TextureDimensions ; } VTK_WRAPEXCLUDE virtual void GetTextureDimensions ( int & _arg1 , int & _arg2 ) { _arg1 = this -> TextureDimensions [ 0 ] ; _arg2 = this -> TextureDimensions [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << TextureDimensions  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetTextureDimensions ( int _arg [ 2 ] ) { this -> GetTextureDimensions ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; /@} protected : vtkScalarsToTextureFilter ( ) ; ~ vtkScalarsToTextureFilter ( ) override = default ; int FillOutputPortInformation ( int port , vtkInformation * info ) override ; int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int RequestInformation ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; private : void operator = ( const vtkScalarsToTextureFilter & ) = delete ; vtkScalarsToTextureFilter ( const vtkScalarsToTextureFilter & ) = delete ; vtkSmartPointer < vtkScalarsToColors > TransferFunction ; int TextureDimensions [ 2 ] ; bool UseTransferFunction = true ; } ;
## Error: token expected: ; but got: [identifier]!!!
