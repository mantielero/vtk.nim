## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageDataToUniformGrid.h
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
##  @class   vtkImageDataToUniformGrid
##  @brief   convert vtkImageData to vtkUniformGrid
##
##  Convert a vtkImageData to vtkUniformGrid and set blanking based on
##  specified by named arrays. By default, values of 0 in the named
##  array will result in the point or cell being blanked. Set Reverse
##  to 1 to indicate that values of 0 will result in the point or
##  cell to not be blanked.
##

## !!!Ignored construct:  # vtkImageDataToUniformGrid_h [NewLine] # vtkImageDataToUniformGrid_h [NewLine] # vtkDataObjectAlgorithm.h [NewLine] # vtkFiltersGeometryModule.h  For export macro [NewLine] class vtkDataArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkFieldData"
discard "forward decl of vtkImageData"
discard "forward decl of vtkUniformGrid"
## !!!Ignored construct:  class VTKFILTERSGEOMETRY_EXPORT vtkImageDataToUniformGrid : public vtkDataObjectAlgorithm { public : static vtkImageDataToUniformGrid * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataObjectAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataObjectAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageDataToUniformGrid :: IsTypeOf ( type ) ; } static vtkImageDataToUniformGrid * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageDataToUniformGrid * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageDataToUniformGrid * NewInstance ( ) const { return vtkImageDataToUniformGrid :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObjectAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageDataToUniformGrid :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageDataToUniformGrid :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  By default, values of 0 (i.e. Reverse = 0) in the array will
##  result in that point or cell to be blanked. Set Reverse to
##  1 to make points or cells to not be blanked for array values
##  of 0.
##  virtual void SetReverse ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Reverse  to  << _arg ) ; if ( this -> Reverse != ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ) { this -> Reverse = ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ; this -> Modified ( ) ; } } virtual vtkTypeBool GetReverseMinValue ( ) { return 0 ; } virtual vtkTypeBool GetReverseMaxValue ( ) { return 1 ; } ; virtual vtkTypeBool GetReverse ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Reverse  of  << this -> Reverse ) ; return this -> Reverse ; } ; virtual void ReverseOn ( ) { this -> SetReverse ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ReverseOff ( ) { this -> SetReverse ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkImageDataToUniformGrid ( ) ; ~ vtkImageDataToUniformGrid ( ) override ; int RequestData ( vtkInformation * req , vtkInformationVector * * inV , vtkInformationVector * outV ) override ; int RequestDataObject ( vtkInformation * req , vtkInformationVector * * inV , vtkInformationVector * outV ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int FillOutputPortInformation ( int port , vtkInformation * info ) override ; virtual int Process ( vtkImageData * input , int association , const char * arrayName , vtkUniformGrid * output ) ; private : vtkImageDataToUniformGrid ( const vtkImageDataToUniformGrid & ) = delete ; void operator = ( const vtkImageDataToUniformGrid & ) = delete ; vtkTypeBool Reverse ; } ;
## Error: token expected: ; but got: [identifier]!!!
