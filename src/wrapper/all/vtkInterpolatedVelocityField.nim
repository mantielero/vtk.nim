## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInterpolatedVelocityField.h
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
##  @class   vtkInterpolatedVelocityField
##  @brief   A concrete class for obtaining
##   the interpolated velocity values at a point.
##
##
##  vtkInterpolatedVelocityField acts as a continuous velocity field via
##  cell interpolation on a vtkDataSet, NumberOfIndependentVariables = 4
##  (x,y,z,t) and NumberOfFunctions = 3 (u,v,w). As a concrete sub-class
##  of vtkCompositeInterpolatedVelocityField, this class adopts two levels
##  of cell caching for faster though less robust cell location than its
##  sibling class vtkCellLocatorInterpolatedVelocityField. Level #0 begins
##  with intra-cell caching. Specifically, if the previous cell is valid
##  and the next point is still within it, ( vtkCell::EvaluatePosition()
##  returns 1, coupled with the new parametric coordinates and weights ),
##  the function values are interpolated and vtkCell::EvaluatePosition()
##  is invoked only. If it fails, level #1 follows by inter-cell location
##  of the target cell (that contains the next point). By inter-cell, the
##  previous cell gives an important clue / guess or serves as an immediate
##  neighbor to aid in the location of the target cell (as is typically the
##  case with integrating a streamline across cells) by means of vtkDataSet::
##  FindCell(). If this still fails, a global cell search is invoked via
##  vtkDataSet::FindCell().
##
##  Regardless of inter-cell or global search, a point locator is employed as
##  a crucial tool underlying the interpolation process. The use of a point
##  locator, while faster than a cell locator, is not optimal and may cause
##  vtkInterpolatedVelocityField to return incorrect results (i.e., premature
##  streamline termination) for datasets defined on complex grids (especially
##  those this discontinuous/incompatible cells). In these cases, try
##  vtkCellLocatorInterpolatedVelocityField which produces the best results at
##  the cost of speed.
##
##  @warning
##  vtkInterpolatedVelocityField is not thread safe. A new instance should be
##  created by each thread.
##
##  @sa
##   vtkCompositeInterpolatedVelocityField vtkCellLocatorInterpolatedVelocityField
##   vtkGenericInterpolatedVelocityField vtkCachingInterpolatedVelocityField
##   vtkTemporalInterpolatedVelocityField vtkFunctionSet vtkStreamTracer
##

## !!!Ignored construct:  # vtkInterpolatedVelocityField_h [NewLine] # vtkInterpolatedVelocityField_h [NewLine] # vtkCompositeInterpolatedVelocityField.h [NewLine] # vtkDeprecation.h  For VTK_DEPRECATED_IN_9_2_0 # vtkFiltersFlowPathsModule.h  For export macro [NewLine] class VTK_DEPRECATED_IN_9_2_0 ( Use vtkCompositeInterpolatedVelocityField instead of vtkCellLocatorInterpolatedVelocityField  and set the desired strategy. ) vtkInterpolatedVelocityField : public vtkCompositeInterpolatedVelocityField { public : *
##  Construct a vtkCompositeInterpolatedVelocityField subclass.
##  static vtkInterpolatedVelocityField * New ( ) ; /@{ *
##  Standard methods for type information and printing.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkCompositeInterpolatedVelocityField Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkCompositeInterpolatedVelocityField :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkInterpolatedVelocityField :: IsTypeOf ( type ) ; } static vtkInterpolatedVelocityField * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkInterpolatedVelocityField * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkInterpolatedVelocityField * NewInstance ( ) const { return vtkInterpolatedVelocityField :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCompositeInterpolatedVelocityField :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInterpolatedVelocityField :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInterpolatedVelocityField :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} protected : vtkInterpolatedVelocityField ( ) ; ~ vtkInterpolatedVelocityField ( ) override = default ; private : vtkInterpolatedVelocityField ( const vtkInterpolatedVelocityField & ) = delete ; void operator = ( const vtkInterpolatedVelocityField & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  VTK-HeaderTest-Exclude: vtkInterpolatedVelocityField.h
