## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCellLocatorStrategy.h
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
##  @class   vtkCellLocatorStrategy
##  @brief   implement a specific vtkPointSet::FindCell() strategy based
##           on using a cell locator
##
##  vtkCellLocatorStrategy is implements a FindCell() strategy based on
##  using the FindCell() method in a cell locator. This is often the
##  slowest strategy, but the most robust.
##
##  @sa
##  vtkFindCellStrategy vtkPointSet
##

## !!!Ignored construct:  # vtkCellLocatorStrategy_h [NewLine] # vtkCellLocatorStrategy_h [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkFindCellStrategy.h [NewLine] class vtkAbstractCellLocator ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkCellLocatorStrategy : public vtkFindCellStrategy { public : *
##  Construct a vtkFindCellStrategy subclass.
##  static vtkCellLocatorStrategy * New ( ) ; /@{ *
##  Standard methods for type information and printing.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkFindCellStrategy Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkFindCellStrategy :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkCellLocatorStrategy :: IsTypeOf ( type ) ; } static vtkCellLocatorStrategy * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkCellLocatorStrategy * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkCellLocatorStrategy * NewInstance ( ) const { return vtkCellLocatorStrategy :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkFindCellStrategy :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCellLocatorStrategy :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCellLocatorStrategy :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  Provide necessary initialization method (see superclass for more
##  information).
##  int Initialize ( vtkPointSet * ps ) override ; *
##  Implement the specific strategy.
##  vtkIdType FindCell ( double x [ 3 ] , vtkCell * cell , vtkGenericCell * gencell , vtkIdType cellId , double tol2 , int & subId , double pcoords [ 3 ] , double * weights ) override ; *
##  Implement the specific strategy.
##  vtkIdType FindClosestPointWithinRadius ( double x [ 3 ] , double radius , double closestPoint [ 3 ] , vtkGenericCell * cell , vtkIdType & cellId , int & subId , double & dist2 , int & inside ) override ; *
##  Implement the specific strategy.
##  bool InsideCellBounds ( double x [ 3 ] , vtkIdType cellId ) override ; /@{ *
##  Set / get an instance of vtkAbstractCellLocator which is used to
##  implement the strategy for FindCell(). The locator is required to
##  already be built and non-NULL.
##  virtual void SetCellLocator ( vtkAbstractCellLocator * ) ; virtual vtkAbstractCellLocator * GetnameCellLocator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  CellLocator  address  << static_cast < vtkAbstractCellLocator * > ( this -> CellLocator ) ) ; return this -> CellLocator ; } ; /@} *
##  Copy essential parameters between instances of this class. This
##  generally is used to copy from instance prototype to another, or to copy
##  strategies between thread instances.  Sub-classes can contribute to
##  the parameter copying process via chaining.
##  void CopyParameters ( vtkFindCellStrategy * from ) override ; protected : vtkCellLocatorStrategy ( ) ; ~ vtkCellLocatorStrategy ( ) override ; vtkAbstractCellLocator * CellLocator ; private : vtkCellLocatorStrategy ( const vtkCellLocatorStrategy & ) = delete ; void operator = ( const vtkCellLocatorStrategy & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
