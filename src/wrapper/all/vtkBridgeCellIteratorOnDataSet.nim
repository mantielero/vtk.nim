## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBridgeCellIteratorOnDataSet.h
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
##  @class   vtkBridgeCellIteratorOnDataSet
##  @brief   Iterate over cells of a dataset.
##  @sa
##  vtkBridgeCellIterator, vtkBridgeDataSet, vtkBridgeCellIteratorStrategy
##

## !!!Ignored construct:  # vtkBridgeCellIteratorOnDataSet_h [NewLine] # vtkBridgeCellIteratorOnDataSet_h [NewLine] # vtkBridgeCellIteratorStrategy.h [NewLine] class vtkBridgeCell ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkBridgeDataSet"
discard "forward decl of vtkBridgeCell"
discard "forward decl of vtkIdList"
## !!!Ignored construct:  class VTKTESTINGGENERICBRIDGE_EXPORT vtkBridgeCellIteratorOnDataSet : public vtkBridgeCellIteratorStrategy { public : static vtkBridgeCellIteratorOnDataSet * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkBridgeCellIteratorStrategy Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkBridgeCellIteratorStrategy :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkBridgeCellIteratorOnDataSet :: IsTypeOf ( type ) ; } static vtkBridgeCellIteratorOnDataSet * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkBridgeCellIteratorOnDataSet * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkBridgeCellIteratorOnDataSet * NewInstance ( ) const { return vtkBridgeCellIteratorOnDataSet :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkBridgeCellIteratorStrategy :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBridgeCellIteratorOnDataSet :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBridgeCellIteratorOnDataSet :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Move iterator to first position if any (loop initialization).
##  void Begin ( ) override ; *
##  Is there no cell at iterator position? (exit condition).
##  vtkTypeBool IsAtEnd ( ) override ; *
##  Cell at current position
##  \pre not_at_end: !IsAtEnd()
##  \pre c_exists: c!=0
##  THREAD SAFE
##  void GetCell ( vtkGenericAdaptorCell * c ) override ; *
##  Cell at current position.
##  NOT THREAD SAFE
##  \pre not_at_end: !IsAtEnd()
##  \post result_exits: result!=0
##  vtkGenericAdaptorCell * GetCell ( ) override ; *
##  Move iterator to next position. (loop progression).
##  \pre not_at_end: !IsAtEnd()
##  void Next ( ) override ; *
##  Used internally by vtkBridgeDataSet.
##  Iterate over cells of `ds' of some dimension `dim'.
##  \pre ds_exists: ds!=0
##  \pre valid_dim_range: (dim>=-1) && (dim<=3)
##  void InitWithDataSet ( vtkBridgeDataSet * ds , int dim ) ; protected : vtkBridgeCellIteratorOnDataSet ( ) ; ~ vtkBridgeCellIteratorOnDataSet ( ) override ; int Dim ;  Dimension of cells over which to iterate (-1 to 3) vtkBridgeDataSet * DataSet ;  the structure on which the object iterates. vtkIdType Id ;  the id at current position. vtkIdType Size ;  size of the structure. vtkBridgeCell * Cell ;  cell at current position. private : vtkBridgeCellIteratorOnDataSet ( const vtkBridgeCellIteratorOnDataSet & ) = delete ; void operator = ( const vtkBridgeCellIteratorOnDataSet & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
