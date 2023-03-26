## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBridgePointIterator.h
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
##  @class   vtkBridgePointIterator
##  @brief   Implementation of vtkGenericPointIterator.
##
##  It is just an example that show how to implement the Generic API. It is also
##  used for testing and evaluating the Generic framework.
##  @sa
##  vtkGenericPointIterator, vtkBridgeDataSet
##

## !!!Ignored construct:  # vtkBridgePointIterator_h [NewLine] # vtkBridgePointIterator_h [NewLine] # vtkBridgeExport.h for module export macro # vtkGenericPointIterator.h [NewLine] class vtkBridgeDataSet ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkBridgeCell"
discard "forward decl of vtkBridgePointIteratorOnDataSet"
discard "forward decl of vtkBridgePointIteratorOne"
discard "forward decl of vtkBridgePointIteratorOnCell"
## !!!Ignored construct:  class VTKTESTINGGENERICBRIDGE_EXPORT vtkBridgePointIterator : public vtkGenericPointIterator { public : static vtkBridgePointIterator * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkGenericPointIterator Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkGenericPointIterator :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkBridgePointIterator :: IsTypeOf ( type ) ; } static vtkBridgePointIterator * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkBridgePointIterator * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkBridgePointIterator * NewInstance ( ) const { return vtkBridgePointIterator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGenericPointIterator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBridgePointIterator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBridgePointIterator :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
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
##  void InitWithDataSet ( vtkBridgeDataSet * ds ) ; *
##  Used internally by vtkBridgeDataSet.
##  Iterate over one point of identifier `id' on dataset `ds'.
##  \pre ds_can_be_null: ds!=0 || ds==0
##  \pre valid_id: vtkImplies(ds!=0,(id>=0)&&(id<=ds->GetNumberOfCells()))
##  void InitWithOnePoint ( vtkBridgeDataSet * ds , vtkIdType id ) ; *
##  The iterator will iterate over the point of a cell
##  \pre cell_exists: cell!=0
##  void InitWithCell ( vtkBridgeCell * cell ) ; protected : *
##  Default constructor.
##  vtkBridgePointIterator ( ) ; *
##  Destructor.
##  ~ vtkBridgePointIterator ( ) override ; vtkGenericPointIterator * CurrentIterator ; vtkBridgePointIteratorOnDataSet * IteratorOnDataSet ; vtkBridgePointIteratorOne * IteratorOne ; vtkBridgePointIteratorOnCell * IteratorOnCell ; private : vtkBridgePointIterator ( const vtkBridgePointIterator & ) = delete ; void operator = ( const vtkBridgePointIterator & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
