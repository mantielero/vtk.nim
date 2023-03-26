## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPResampleWithDataSet.h
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
##  @class   vtkPResampleWithDataSet
##  points from another dataset.
##
##  vtkPResampleWithDataSet is the parallel version of vtkResampleWithDataSet
##  filter
##  @sa
##  vtkResampleWithDataSet vtkPResampleToImage
##

## !!!Ignored construct:  # vtkPResampleWithDataSet_h [NewLine] # vtkPResampleWithDataSet_h [NewLine] # vtkFiltersParallelDIY2Module.h  For export macro # vtkResampleWithDataSet.h [NewLine] class vtkMultiProcessController ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSPARALLELDIY2_EXPORT vtkPResampleWithDataSet : public vtkResampleWithDataSet { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkResampleWithDataSet Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkResampleWithDataSet :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPResampleWithDataSet :: IsTypeOf ( type ) ; } static vtkPResampleWithDataSet * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPResampleWithDataSet * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPResampleWithDataSet * NewInstance ( ) const { return vtkPResampleWithDataSet :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkResampleWithDataSet :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPResampleWithDataSet :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPResampleWithDataSet :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkPResampleWithDataSet * New ( ) ; /@{ *
##  By default this filter uses the global controller,
##  but this method can be used to set another instead.
##  virtual void SetController ( vtkMultiProcessController * ) ; virtual vtkMultiProcessController * GetnameController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Controller  address  << static_cast < vtkMultiProcessController * > ( this -> Controller ) ) ; return this -> Controller ; } ; /@} /@{ *
##  Set/Get if the filter should use Balanced Partitioning for fast lookup of
##  the input points. Balanced Partitioning partitions the points into similar
##  sized bins. It takes logarithmic time to search for the candidate bins, but
##  search inside border bins takes constant time.
##  The default is to use Regular Partitioning which partitions the space of the
##  points into regular sized bins. Based on their distribution, the bins may
##  contain widely varying number of points. It takes constant time to search
##  for the candidate bins but search within border bins can vary.
##  For most cases, both techniques perform the same with Regular Partitioning
##  being slightly better. Balanced Partitioning may perform better when the
##  points distribution is highly skewed.
##  virtual void SetUseBalancedPartitionForPointsLookup ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseBalancedPartitionForPointsLookup  to  << _arg ) ; if ( this -> UseBalancedPartitionForPointsLookup != _arg ) { this -> UseBalancedPartitionForPointsLookup = _arg ; this -> Modified ( ) ; } } ; virtual bool GetUseBalancedPartitionForPointsLookup ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseBalancedPartitionForPointsLookup  of  << this -> UseBalancedPartitionForPointsLookup ) ; return this -> UseBalancedPartitionForPointsLookup ; } ; virtual void UseBalancedPartitionForPointsLookupOn ( ) { this -> SetUseBalancedPartitionForPointsLookup ( static_cast < bool > ( 1 ) ) ; } virtual void UseBalancedPartitionForPointsLookupOff ( ) { this -> SetUseBalancedPartitionForPointsLookup ( static_cast < bool > ( 0 ) ) ; } ; /@} protected : vtkPResampleWithDataSet ( ) ; ~ vtkPResampleWithDataSet ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; vtkMultiProcessController * Controller ; bool UseBalancedPartitionForPointsLookup ; private : vtkPResampleWithDataSet ( const vtkPResampleWithDataSet & ) = delete ; void operator = ( const vtkPResampleWithDataSet & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
