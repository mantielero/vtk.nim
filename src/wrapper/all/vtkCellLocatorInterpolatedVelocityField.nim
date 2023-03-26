## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCellLocatorInterpolatedVelocityField.h
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
##  @class   vtkCellLocatorInterpolatedVelocityField
##  @brief   A concrete class for
##   obtaining the interpolated velocity values at a point.
##
##
##   vtkCellLocatorInterpolatedVelocityField acts as a continuous velocity
##   field via cell interpolation on a vtkDataSet, NumberOfIndependentVariables
##   = 4 (x,y,z,t) and NumberOfFunctions = 3 (u,v,w). As a concrete sub-class
##   of vtkCompositeInterpolatedVelocityField, it adopts vtkAbstractCellLocator's
##   sub-classes, e.g., vtkCellLocator and vtkModifiedBSPTree, without the use
##   of vtkPointLocator ( employed by vtkDataSet::FindCell() and
##   vtkPointSet::FindCell() in vtkInterpolatedVelocityField ).
##   vtkCellLocatorInterpolatedVelocityField adopts one level of cell caching.
##   Specifically, if the next point is still within the previous cell, cell
##   location is then simply skipped and vtkCell:: EvaluatePosition() is called
##   to obtain the new parametric coordinates and weights that are used to
##   interpolate the velocity function values across the vertices of this cell.
##   Otherwise a global cell (the target containing the next point) location is
##   instead directly invoked, without exploiting the clue that
##   vtkInterpolatedVelocityField makes use of from the previous cell (an
##   immediate neighbor). Although ignoring the neighbor cell may incur a
##   relatively high computational cost, vtkCellLocatorInterpolatedVelocityField
##   is more robust in locating the target cell than its sibling class
##   vtkInterpolatedVelocityField.
##
##  @warning
##   vtkCellLocatorInterpolatedVelocityField is not thread safe. A new instance
##   should be created by each thread.
##
##  @sa
##   vtkCompositeInterpolatedVelocityField vtkInterpolatedVelocityField
##   vtkGenericInterpolatedVelocityField vtkCachingInterpolatedVelocityField
##   vtkTemporalInterpolatedVelocityField vtkFunctionSet vtkStreamTracer
##

## !!!Ignored construct:  # vtkCellLocatorInterpolatedVelocityField_h [NewLine] # vtkCellLocatorInterpolatedVelocityField_h [NewLine] # vtkCompositeInterpolatedVelocityField.h [NewLine] # vtkDeprecation.h  For VTK_DEPRECATED_IN_9_2_0 # vtkFiltersFlowPathsModule.h  For export macro [NewLine] class vtkAbstractCellLocator ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTK_DEPRECATED_IN_9_2_0 ( Use vtkCompositeInterpolatedVelocityField instead of vtkCellLocatorInterpolatedVelocityField  and set the desired strategy. ) vtkCellLocatorInterpolatedVelocityField : public vtkCompositeInterpolatedVelocityField { public : *
##  Construct a vtkCompositeInterpolatedVelocityField subclass.
##  static vtkCellLocatorInterpolatedVelocityField * New ( ) ; /@{ *
##  Standard methods for type information and printing.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkCompositeInterpolatedVelocityField Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkCompositeInterpolatedVelocityField :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkCellLocatorInterpolatedVelocityField :: IsTypeOf ( type ) ; } static vtkCellLocatorInterpolatedVelocityField * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkCellLocatorInterpolatedVelocityField * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkCellLocatorInterpolatedVelocityField * NewInstance ( ) const { return vtkCellLocatorInterpolatedVelocityField :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCompositeInterpolatedVelocityField :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCellLocatorInterpolatedVelocityField :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCellLocatorInterpolatedVelocityField :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} protected : vtkCellLocatorInterpolatedVelocityField ( ) ; ~ vtkCellLocatorInterpolatedVelocityField ( ) override ; private : vtkCellLocatorInterpolatedVelocityField ( const vtkCellLocatorInterpolatedVelocityField & ) = delete ; void operator = ( const vtkCellLocatorInterpolatedVelocityField & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  VTK-HeaderTest-Exclude: vtkCellLocatorInterpolatedVelocityField.h
