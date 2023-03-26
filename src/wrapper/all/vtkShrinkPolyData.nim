## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkShrinkPolyData.h
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
##  @class   vtkShrinkPolyData
##  @brief   shrink cells composing PolyData
##
##  vtkShrinkPolyData shrinks cells composing a polygonal dataset (e.g.,
##  vertices, lines, polygons, and triangle strips) towards their centroid.
##  The centroid of a cell is computed as the average position of the
##  cell points. Shrinking results in disconnecting the cells from
##  one another. The output dataset type of this filter is polygonal data.
##
##  During execution the filter passes its input cell data to its
##  output. Point data attributes are copied to the points created during the
##  shrinking process.
##
##  @warning
##  It is possible to turn cells inside out or cause self intersection
##  in special cases.
##  Users should use the vtkTriangleFilter to triangulate meshes that
##  contain triangle strips.
##
##  @sa
##  vtkShrinkFilter
##

## !!!Ignored construct:  # vtkShrinkPolyData_h [NewLine] # vtkShrinkPolyData_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class VTKFILTERSGENERAL_EXPORT vtkShrinkPolyData : public vtkPolyDataAlgorithm { public : static vtkShrinkPolyData * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkShrinkPolyData :: IsTypeOf ( type ) ; } static vtkShrinkPolyData * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkShrinkPolyData * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkShrinkPolyData * NewInstance ( ) const { return vtkShrinkPolyData :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkShrinkPolyData :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkShrinkPolyData :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set the fraction of shrink for each cell.
##  virtual void SetShrinkFactor ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ShrinkFactor  to  << _arg ) ; if ( this -> ShrinkFactor != ( _arg < 0.0 ? 0.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ) { this -> ShrinkFactor = ( _arg < 0.0 ? 0.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetShrinkFactorMinValue ( ) { return 0.0 ; } virtual double GetShrinkFactorMaxValue ( ) { return 1.0 ; } ; /@} /@{ *
##  Get the fraction of shrink for each cell.
##  virtual double GetShrinkFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ShrinkFactor  of  << this -> ShrinkFactor ) ; return this -> ShrinkFactor ; } ; /@} protected : vtkShrinkPolyData ( double sf = 0.5 ) ; ~ vtkShrinkPolyData ( ) override = default ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; double ShrinkFactor ; private : vtkShrinkPolyData ( const vtkShrinkPolyData & ) = delete ; void operator = ( const vtkShrinkPolyData & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
