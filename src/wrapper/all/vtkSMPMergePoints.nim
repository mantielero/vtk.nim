## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSMPMergePoints.h
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
##  @class   vtkSMPMergePoints
##  @brief   Class designed to help with merging of points in parallel
##
##  vtkSMPMergePoints is a subclass of vtkMergePoints designed to help
##  with merging of points generated by using multiple locators in parallel.
##  Its main functionality is provided by the Merge function. It also
##  has a few additional convenience functions.
##  Merge is thread safe as long as no two threads are merging the same
##  bin. The common way of using vtkSMPMergePoints is:
##   - Initialize with outLocator->InitializeMerge()
##   - Allocate points with outLocator->GetPoints()->Resize(numPts) (numPts should be >= total number
##  of points)
##   - Do bunch of merging with outLocator->Merge(inLocator[i], ...) (this can be done in parallel as
##  long as no two bins are done at the same time)
##   - Fix the size of points with outLocator->FixSizeOfPointArray()
##

## !!!Ignored construct:  # vtkSMPMergePoints_h [NewLine] # vtkSMPMergePoints_h [NewLine] # vtkFiltersSMPModule.h  For export macro # vtkIdList.h  For inline functions # vtkMergePoints.h [NewLine] # vtkType.h  For vtkIdType [NewLine] # < atomic >  for std::atomic [NewLine] class vtkPointData ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSSMP_EXPORT vtkSMPMergePoints : public vtkMergePoints { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkMergePoints Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkMergePoints :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSMPMergePoints :: IsTypeOf ( type ) ; } static vtkSMPMergePoints * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSMPMergePoints * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSMPMergePoints * NewInstance ( ) const { return vtkSMPMergePoints :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMergePoints :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSMPMergePoints :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSMPMergePoints :: New ( ) ; } public : ; static vtkSMPMergePoints * New ( ) ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  This should be called from 1 thread before any call to Merge.
##  void InitializeMerge ( ) ; *
##  Merge the points of one of the bins from the given locator to
##  the same bin of the current locator. Note that this requires that
##  the two locators have identical binning structures. This also
##  merges point data given in the inPD argument to the outPd.
##  Furthermore, it generates a map of the old ids of the input locator
##  to the new ids. This is stored in the idList argument. The map
##  is idList[oldId] = newId.
##  void Merge ( vtkSMPMergePoints * locator , vtkIdType idx , vtkPointData * outPd , vtkPointData * inPd , vtkIdList * idList ) ; *
##  At the of the merge, this can be called to set the MaxId of the
##  points array to the maximum id in the locator. The current design
##  usage is as follows:
##  - Allocate points with points->Resize(numPts). NumPts should be >= total number of points
##  - Do bunch of merging with outLocator->Merge(inLocator[i], ...)
##  - Fix the size of points with outLocator->FixSizeOfPointArray()
##  void FixSizeOfPointArray ( ) ; *
##  Returns the biggest id in the locator.
##  vtkIdType GetMaxId ( ) { return this -> AtomicInsertionId - 1 ; } /@{ *
##  Returns the number of points in a bin.
##  vtkIdType GetNumberOfIdsInBucket ( vtkIdType idx ) { if ( ! this -> HashTable ) { return 0 ; } vtkIdList * bucket = this -> HashTable [ idx ] ; return bucket ? bucket -> GetNumberOfIds ( ) : 0 ; } /@} *
##  Returns the number of bins.
##  vtkIdType GetNumberOfBuckets ( ) VTK_FUTURE_CONST override { return this -> NumberOfBuckets ; } protected : vtkSMPMergePoints ( ) ; ~ vtkSMPMergePoints ( ) override ; std :: atomic < vtkIdType > AtomicInsertionId ; private : vtkSMPMergePoints ( const vtkSMPMergePoints & ) = delete ; void operator = ( const vtkSMPMergePoints & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!