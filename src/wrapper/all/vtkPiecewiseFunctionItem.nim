## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPiecewiseFunctionItem.h
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

## !!!Ignored construct:  # vtkPiecewiseFunctionItem_h [NewLine] # vtkPiecewiseFunctionItem_h [NewLine] # vtkChartsCoreModule.h  For export macro # vtkScalarsToColorsItem.h [NewLine] class vtkPiecewiseFunction ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkImageData"
## !!!Ignored construct:  class VTKCHARTSCORE_EXPORT vtkPiecewiseFunctionItem : public vtkScalarsToColorsItem { public : static vtkPiecewiseFunctionItem * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkScalarsToColorsItem Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkScalarsToColorsItem :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPiecewiseFunctionItem :: IsTypeOf ( type ) ; } static vtkPiecewiseFunctionItem * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPiecewiseFunctionItem * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPiecewiseFunctionItem * NewInstance ( ) const { return vtkPiecewiseFunctionItem :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkScalarsToColorsItem :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPiecewiseFunctionItem :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPiecewiseFunctionItem :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; void SetPiecewiseFunction ( vtkPiecewiseFunction * t ) ; virtual vtkPiecewiseFunction * GetnamePiecewiseFunction ( ) { vtkDebugWithObjectMacro ( this , <<  returning  PiecewiseFunction  address  << static_cast < vtkPiecewiseFunction * > ( this -> PiecewiseFunction ) ) ; return this -> PiecewiseFunction ; } ; protected : vtkPiecewiseFunctionItem ( ) ; ~ vtkPiecewiseFunctionItem ( ) override ;  Description:
##  Reimplemented to return the range of the piecewise function void ComputeBounds ( double bounds [ 4 ] ) override ;  Description
##  Compute the texture from the PiecewiseFunction void ComputeTexture ( ) override ; vtkPiecewiseFunction * PiecewiseFunction ; private : vtkPiecewiseFunctionItem ( const vtkPiecewiseFunctionItem & ) = delete ; void operator = ( const vtkPiecewiseFunctionItem & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
