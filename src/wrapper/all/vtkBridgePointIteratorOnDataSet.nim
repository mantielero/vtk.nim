## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBridgePointIteratorOnDataSet.h
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
##  @class   vtkBridgePointIteratorOnDataSet
##  @brief   Implementation of vtkGenericPointIterator.
##
##  It iterates over the points of a dataset (can be corner points of cells or
##  isolated points)
##  @sa
##  vtkGenericPointIterator, vtkBridgeDataSet
##

## !!!Ignored construct:  # vtkBridgePointIteratorOnDataSet_h [NewLine] # vtkBridgePointIteratorOnDataSet_h [NewLine] # vtkBridgeExport.h for module export macro # vtkGenericPointIterator.h [NewLine] class vtkBridgeDataSet ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKTESTINGGENERICBRIDGE_EXPORT vtkBridgePointIteratorOnDataSet : public vtkGenericPointIterator { public : static vtkBridgePointIteratorOnDataSet * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkGenericPointIterator Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkGenericPointIterator :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkBridgePointIteratorOnDataSet :: IsTypeOf ( type ) ; } static vtkBridgePointIteratorOnDataSet * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkBridgePointIteratorOnDataSet * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkBridgePointIteratorOnDataSet * NewInstance ( ) const { return vtkBridgePointIteratorOnDataSet :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGenericPointIterator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBridgePointIteratorOnDataSet :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBridgePointIteratorOnDataSet :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Move iterator to first position if any (loop initialization).
##  void Begin ( ) override ; *
##  Is there no point at iterator position? (exit condition).
##  vtkTypeBool IsAtEnd ( ) override ; *
##  Move iterator to next position. (loop progression).
##  \pre not_off: !IsAtEnd()
##  void Next ( ) override ; *
##  Point at iterator position.
##  \pre not_off: !IsAtEnd()
##  \post result_exists: result!=0
##  double * GetPosition ( ) override ; *
##  Point at iterator position.
##  \pre not_off: !IsAtEnd()
##  \pre x_exists: x!=0
##  void GetPosition ( double x [ 3 ] ) override ; *
##  Unique identifier for the point, could be non-contiguous
##  \pre not_off: !IsAtEnd()
##  vtkIdType GetId ( ) override ; *
##  Used internally by vtkBridgeDataSet.
##  Iterate over points of `ds'.
##  \pre ds_exists: ds!=0
##  void InitWithDataSet ( vtkBridgeDataSet * ds ) ; protected : *
##  Default constructor.
##  vtkBridgePointIteratorOnDataSet ( ) ; *
##  Destructor.
##  ~ vtkBridgePointIteratorOnDataSet ( ) override ; vtkBridgeDataSet * DataSet ;  the structure on which the object iterates. vtkIdType Id ;  the id at current position. int Size ;  size of the structure. private : vtkBridgePointIteratorOnDataSet ( const vtkBridgePointIteratorOnDataSet & ) = delete ; void operator = ( const vtkBridgePointIteratorOnDataSet & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
