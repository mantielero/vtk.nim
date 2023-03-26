## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSortFieldData.h
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
##  @class   vtkSortFieldData
##  @brief   provides a method for sorting field data
##
##
##  vtkSortFieldData is used to sort data, based on its value, or with an
##  associated key, into either ascending or descending order. This is useful
##  for operations like selection, or analysis, when evaluating and processing
##  data.
##
##  This class, which extends the base functionality of vtkSortDataArray,
##  is used to sort field data and its various subclasses (vtkFieldData,
##  vtkDataSetAttributes, vtkPointData, vtkCellData, etc.)
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly on
##  multi-core machines.
##
##  @warning
##  The sort methods below are static, hence the sorting methods can be
##  used without instantiating the class. All methods are thread safe.
##
##  @sa
##  vtkSortDataArray
##

## !!!Ignored construct:  # vtkSortFieldData_h [NewLine] # vtkSortFieldData_h [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkSortDataArray.h [NewLine] class vtkFieldData ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkSortFieldData : public vtkSortDataArray { public : /@{ *
##  Standard VTK methods for instantiating, managing type, and printing
##  information about this class.
##  static vtkSortFieldData * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkSortDataArray Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkSortDataArray :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSortFieldData :: IsTypeOf ( type ) ; } static vtkSortFieldData * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSortFieldData * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSortFieldData * NewInstance ( ) const { return vtkSortFieldData :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkSortDataArray :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSortFieldData :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSortFieldData :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  Given field data (and derived classes such as point data and cell data),
##  sort all the arrays in the field data given an array and a component
##  number k from that array. In other words, if an array has n components,
##  the kth component is used to sort the array and all of the other arrays
##  in the field data.  Also note that the user can indicate whether the
##  function returns the sort indices (returnIndices=1). If the indices are
##  returned, then the user takes ownership of the data and must delete
##  it. Note that the indices are in sorted (ascending) order, and indicate
##  the final sorted position of the sort. So for example indices[0]=10
##  indicates that the original data in position 10 in the field, was moved
##  to position 0 after the sort. By default, returnIndices=0. (Other notes:
##  if any array is not the same length as the sorting array, then it will
##  be skipped and not sorted.)
##  static vtkIdType * Sort ( vtkFieldData * fd , const char * arrayName , int k , int returnIndices ) { return vtkSortFieldData :: Sort ( fd , arrayName , k , returnIndices , 0 ) ; } *
##  Given field data (and derived classes such as point data and cell data),
##  sort all the arrays in the field data given an array and a component
##  number k from that array. In other words, if an array has n components,
##  the kth component is used to sort the array and all of the other arrays
##  in the field data.  The order of the sorted data is goven by dir: dir=0
##  means sort in ascending order; dir=1 means sort in descending
##  order. Also note that the user can indicate whether the function returns
##  the sort indices (returnIndices=1). If the indices are returned, then
##  the user takes ownership of the data and must delete it. Note that the
##  indices are always in sorted (ascending) order, and indicate the final
##  sorted position of the sort. So for example indices[0]=10 indicates that
##  the original data in position 10 in the field, was moved to position 0
##  after the sort (i.e., position 0 is the smallest value). However, if
##  sort direction dir=1, the indices do not change but the final shuffle of
##  the data is in reverse order (note idx[n-1] for n keys is the largest
##  value). By default, returnIndices=0. (Other notes: if any array is not
##  the same length as the sorting array, then it will be skipped and not
##  sorted.)
##  static vtkIdType * Sort ( vtkFieldData * fd , const char * arrayName , int k , int returnIndices , int dir ) ; protected : vtkSortFieldData ( ) ; ~ vtkSortFieldData ( ) override ; private : vtkSortFieldData ( const vtkSortFieldData & ) = delete ; void operator = ( const vtkSortFieldData & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
