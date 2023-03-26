## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDataObjectTreeIterator.h
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
##  @class   vtkDataObjectTreeIterator
##  @brief   superclass for composite data iterators
##
##  vtkDataObjectTreeIterator provides an interface for accessing datasets
##  in a collection (vtkDataObjectTreeIterator).
##

## !!!Ignored construct:  # vtkDataObjectTreeIterator_h [NewLine] # vtkDataObjectTreeIterator_h [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkCompositeDataIterator.h [NewLine] # vtkSmartPointer.h to store data sets [NewLine] class vtkDataObjectTree ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDataObjectTreeInternals"
discard "forward decl of vtkDataObjectTreeIndex"
discard "forward decl of vtkDataObject"
discard "forward decl of vtkInformation"
## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkDataObjectTreeIterator : public vtkCompositeDataIterator { public : static vtkDataObjectTreeIterator * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkCompositeDataIterator Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkCompositeDataIterator :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkDataObjectTreeIterator :: IsTypeOf ( type ) ; } static vtkDataObjectTreeIterator * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkDataObjectTreeIterator * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkDataObjectTreeIterator * NewInstance ( ) const { return vtkDataObjectTreeIterator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCompositeDataIterator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDataObjectTreeIterator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDataObjectTreeIterator :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Move the iterator to the beginning of the collection.
##  void GoToFirstItem ( ) override ; *
##  Move the iterator to the next item in the collection.
##  void GoToNextItem ( ) override ; *
##  Test whether the iterator is finished with the traversal.
##  Returns 1 for yes, and 0 for no.
##  It is safe to call any of the GetCurrent...() methods only when
##  IsDoneWithTraversal() returns 0.
##  int IsDoneWithTraversal ( ) override ; *
##  Returns the current item. Valid only when IsDoneWithTraversal() returns 0.
##  vtkDataObject * GetCurrentDataObject ( ) override ; *
##  Returns the meta-data associated with the current item.
##  Note that, depending on iterator implementation, the returned information
##  is not necessarily stored on the current object. So modifying the information
##  is forbidden.
##  vtkInformation * GetCurrentMetaData ( ) override ; *
##  Returns if the a meta-data information object is present for the current
##  item. Return 1 on success, 0 otherwise.
##  int HasCurrentMetaData ( ) override ; *
##  Flat index is an index obtained by traversing the tree in preorder.
##  This can be used to uniquely identify nodes in the tree.
##  Not valid if IsDoneWithTraversal() returns true.
##  unsigned int GetCurrentFlatIndex ( ) override ; /@{ *
##  If VisitOnlyLeaves is true, the iterator will only visit nodes
##  (sub-datasets) that are not composite. If it encounters a composite
##  data set, it will automatically traverse that composite dataset until
##  it finds non-composite datasets. With this options, it is possible to
##  visit all non-composite datasets in tree of composite datasets
##  (composite of composite of composite for example :-) ) If
##  VisitOnlyLeaves is false, GetCurrentDataObject() may return
##  vtkCompositeDataSet. By default, VisitOnlyLeaves is 1.
##  virtual void SetVisitOnlyLeaves ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  VisitOnlyLeaves  to  << _arg ) ; if ( this -> VisitOnlyLeaves != _arg ) { this -> VisitOnlyLeaves = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetVisitOnlyLeaves ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VisitOnlyLeaves  of  << this -> VisitOnlyLeaves ) ; return this -> VisitOnlyLeaves ; } ; virtual void VisitOnlyLeavesOn ( ) { this -> SetVisitOnlyLeaves ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void VisitOnlyLeavesOff ( ) { this -> SetVisitOnlyLeaves ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  If TraverseSubTree is set to true, the iterator will visit the entire tree
##  structure, otherwise it only visits the first level children. Set to 1 by
##  default.
##  virtual void SetVisitOnlyLeavesTraverseSubTree ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  TraverseSubTree  to  << _arg ) ; if ( this -> TraverseSubTree != _arg ) { this -> TraverseSubTree = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetVisitOnlyLeavesTraverseSubTree ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TraverseSubTree  of  << this -> TraverseSubTree ) ; return this -> TraverseSubTree ; } ; virtual void TraverseSubTreeOn ( ) { this -> SetVisitOnlyLeavesTraverseSubTree ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void TraverseSubTreeOff ( ) { this -> SetVisitOnlyLeavesTraverseSubTree ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkDataObjectTreeIterator ( ) ; ~ vtkDataObjectTreeIterator ( ) override ;  Use the macro to ensure MTime is updated: virtual void SetVisitOnlyLeavesTraverseSubTreeCurrentFlatIndex ( unsigned int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CurrentFlatIndex  to  << _arg ) ; if ( this -> CurrentFlatIndex != _arg ) { this -> CurrentFlatIndex = _arg ; this -> Modified ( ) ; } } ;  Takes the current location to the next dataset. This traverses the tree in
##  preorder fashion.
##  If the current location is a composite dataset, next is its 1st child dataset.
##  If the current is not a composite dataset, then next is the next dataset.
##  This method gives no guarantees whether the current dataset will be
##  non-null or leaf. void NextInternal ( ) ; *
##  Returns the index for the current data object.
##  vtkDataObjectTreeIndex GetCurrentIndex ( ) ;  Needs access to GetCurrentIndex(). friend class vtkDataObjectTree ; friend class vtkMultiDataSetInternal ; unsigned int CurrentFlatIndex ; private : vtkDataObjectTreeIterator ( const vtkDataObjectTreeIterator & ) = delete ; void operator = ( const vtkDataObjectTreeIterator & ) = delete ; class vtkInternals ; vtkInternals * Internals ; friend class vtkInternals ; vtkTypeBool TraverseSubTree ; vtkTypeBool VisitOnlyLeaves ; *
##  Helper method used by vtkInternals to get access to the internals of
##  vtkDataObjectTree.
##  vtkDataObjectTreeInternals * GetInternals ( vtkDataObjectTree * ) ;  Cannot be called when this->IsDoneWithTraversal() return 1. void UpdateLocation ( ) ; } ;
## Error: token expected: ; but got: [identifier]!!!
