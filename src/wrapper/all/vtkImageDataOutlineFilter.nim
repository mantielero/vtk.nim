## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageDataOutlineFilter.h
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
##  @class   vtkImageDataOutlineFilter
##  @brief   create wireframe outline for a possibly oriented vtkImageData
##
##  vtkImageDataOutlineFilter is a filter that generates a wireframe outline
##  of vtkImageData. It takes into account the orientation / DirectionMatrix
##  of the image, so the output outline may not be axes aligned.  The outline
##  consists of the twelve edges of the vtkImageData. Optionally, the six
##  bounding faces of the vtkImageData can be produced as well.
##
##  @sa
##  vtkOutlineFilter
##

## !!!Ignored construct:  # vtkImageDataOutlineFilter_h [NewLine] # vtkImageDataOutlineFilter_h [NewLine] # vtkFiltersModelingModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class VTKFILTERSMODELING_EXPORT vtkImageDataOutlineFilter : public vtkPolyDataAlgorithm { public : /@{ *
##  Standard methods for instantiation. type information, and printing.
##  static vtkImageDataOutlineFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageDataOutlineFilter :: IsTypeOf ( type ) ; } static vtkImageDataOutlineFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageDataOutlineFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageDataOutlineFilter * NewInstance ( ) const { return vtkImageDataOutlineFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageDataOutlineFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageDataOutlineFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Generate the six boundary faces of the image data. This is off by default.
##  virtual void SetGenerateFaces ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateFaces  to  << _arg ) ; if ( this -> GenerateFaces != _arg ) { this -> GenerateFaces = _arg ; this -> Modified ( ) ; } } ; virtual void GenerateFacesOn ( ) { this -> SetGenerateFaces ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GenerateFacesOff ( ) { this -> SetGenerateFaces ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual vtkTypeBool GetGenerateFaces ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateFaces  of  << this -> GenerateFaces ) ; return this -> GenerateFaces ; } ; /@} /@{ *
##  Set/get the desired precision for the output points.
##  vtkAlgorithm::SINGLE_PRECISION - Output single-precision floating point.
##  vtkAlgorithm::DOUBLE_PRECISION - Output double-precision floating point.
##  virtual void SetGenerateFacesOutputPointsPrecision ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputPointsPrecision  to  << _arg ) ; if ( this -> OutputPointsPrecision != _arg ) { this -> OutputPointsPrecision = _arg ; this -> Modified ( ) ; } } ; virtual int GetGenerateFacesOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ; /@} protected : vtkImageDataOutlineFilter ( ) ; ~ vtkImageDataOutlineFilter ( ) override ; vtkTypeBool GenerateFaces ; int OutputPointsPrecision ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; private : vtkImageDataOutlineFilter ( const vtkImageDataOutlineFilter & ) = delete ; void operator = ( const vtkImageDataOutlineFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
