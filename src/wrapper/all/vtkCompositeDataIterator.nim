## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCompositeDataIterator.h
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
##  @class   vtkCompositeDataIterator
##  @brief   superclass for composite data iterators
##
##  vtkCompositeDataIterator provides an interface for accessing datasets
##  in a collection (vtkCompositeDataIterator).
##

## !!!Ignored construct:  # vtkCompositeDataIterator_h [NewLine] # vtkCompositeDataIterator_h [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkObject.h [NewLine] class vtkCompositeDataSet ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkCompositeDataSetInternals"
discard "forward decl of vtkCompositeDataSetIndex"
discard "forward decl of vtkDataObject"
discard "forward decl of vtkInformation"
## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkCompositeDataIterator : public vtkObject { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkCompositeDataIterator :: IsTypeOf ( type ) ; } static vtkCompositeDataIterator * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkCompositeDataIterator * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkCompositeDataIterator * NewInstance ( ) const { return vtkCompositeDataIterator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCompositeDataIterator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCompositeDataIterator :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set the composite dataset this iterator is iterating over.
##  Must be set before traversal begins.
##  virtual void SetDataSet ( vtkCompositeDataSet * ds ) ; virtual vtkCompositeDataSet * GetnameDataSet ( ) { vtkDebugWithObjectMacro ( this , <<  returning  DataSet  address  << static_cast < vtkCompositeDataSet * > ( this -> DataSet ) ) ; return this -> DataSet ; } ; /@} *
##  Begin iterating over the composite dataset structure.
##  virtual void InitTraversal ( ) ; *
##  Begin iterating over the composite dataset structure in reverse order.
##  virtual void InitReverseTraversal ( ) ; *
##  Move the iterator to the beginning of the collection.
##  virtual void GoToFirstItem ( ) = 0 ; *
##  Move the iterator to the next item in the collection.
##  virtual void GoToNextItem ( ) = 0 ; *
##  Test whether the iterator is finished with the traversal.
##  Returns 1 for yes, and 0 for no.
##  It is safe to call any of the GetCurrent...() methods only when
##  IsDoneWithTraversal() returns 0.
##  virtual int IsDoneWithTraversal ( ) = 0 ; *
##  Returns the current item. Valid only when IsDoneWithTraversal() returns 0.
##  virtual vtkDataObject * GetCurrentDataObject ( ) = 0 ; *
##  Returns the meta-data associated with the current item. This will allocate
##  a new vtkInformation object is none is already present. Use
##  HasCurrentMetaData to avoid unnecessary creation of vtkInformation objects.
##  virtual vtkInformation * GetCurrentMetaData ( ) = 0 ; *
##  Returns if the a meta-data information object is present for the current
##  item. Return 1 on success, 0 otherwise.
##  virtual int HasCurrentMetaData ( ) = 0 ; /@{ *
##  If SkipEmptyNodes is true, then nullptr datasets will be skipped. Default is
##  true.
##  virtual void SetSkipEmptyNodes ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SkipEmptyNodes  to  << _arg ) ; if ( this -> SkipEmptyNodes != _arg ) { this -> SkipEmptyNodes = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetSkipEmptyNodes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SkipEmptyNodes  of  << this -> SkipEmptyNodes ) ; return this -> SkipEmptyNodes ; } ; virtual void SkipEmptyNodesOn ( ) { this -> SetSkipEmptyNodes ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void SkipEmptyNodesOff ( ) { this -> SetSkipEmptyNodes ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} *
##  Flat index is an index to identify the data in a composite data structure
##  virtual unsigned int GetCurrentFlatIndex ( ) = 0 ; /@{ *
##  Returns if the iteration is in reverse order.
##  virtual int GetSkipEmptyNodesReverse ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Reverse  of  << this -> Reverse ) ; return this -> Reverse ; } ; /@} protected : vtkCompositeDataIterator ( ) ; ~ vtkCompositeDataIterator ( ) override ;  Use macro to ensure MTime is updated: virtual void SetSkipEmptyNodesReverse ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Reverse  to  << _arg ) ; if ( this -> Reverse != _arg ) { this -> Reverse = _arg ; this -> Modified ( ) ; } } ; vtkTypeBool SkipEmptyNodes ; int Reverse ; vtkCompositeDataSet * DataSet ; private : vtkCompositeDataIterator ( const vtkCompositeDataIterator & ) = delete ; void operator = ( const vtkCompositeDataIterator & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
