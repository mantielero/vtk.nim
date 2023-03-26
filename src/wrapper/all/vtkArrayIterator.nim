## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkArrayIterator.h
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
##  @class   vtkArrayIterator
##  @brief   Abstract superclass to iterate over elements
##  in an vtkAbstractArray.
##
##
##  vtkArrayIterator is used to iterate over elements in any
##  vtkAbstractArray subclass.  The vtkArrayIteratorTemplateMacro is used
##  to centralize the set of types supported by Execute methods.  It also
##  avoids duplication of long switch statement case lists.
##
##  Note that in this macro VTK_TT is defined to be the type of the
##  iterator for the given type of array. One must include the
##  vtkArrayIteratorIncludes.h header file to provide for extending of
##  this macro by addition of new iterators.
##
##  Example usage:
##  \code
##  vtkArrayIter* iter = array->NewIterator();
##  switch(array->GetDataType())
##    {
##    vtkArrayIteratorTemplateMacro(myFunc(static_cast<VTK_TT*>(iter), arg2));
##    }
##  iter->Delete();
##  \endcode
##

## !!!Ignored construct:  # vtkArrayIterator_h [NewLine] # vtkArrayIterator_h [NewLine] # vtkCommonCoreModule.h  For export macro # vtkObject.h [NewLine] class vtkAbstractArray ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKCOMMONCORE_EXPORT vtkArrayIterator : public vtkObject { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkArrayIterator :: IsTypeOf ( type ) ; } static vtkArrayIterator * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkArrayIterator * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkArrayIterator * NewInstance ( ) const { return vtkArrayIterator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkArrayIterator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkArrayIterator :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Set the array this iterator will iterate over.
##  After Initialize() has been called, the iterator is valid
##  so long as the Array has not been modified
##  (except using the iterator itself).
##  If the array is modified, the iterator must be re-initialized.
##  virtual void Initialize ( vtkAbstractArray * array ) = 0 ; *
##  Get the data type from the underlying array. Returns 0 if
##  no underlying array is present.
##  virtual int GetDataType ( ) const = 0 ; protected : vtkArrayIterator ( ) ; ~ vtkArrayIterator ( ) override ; private : vtkArrayIterator ( const vtkArrayIterator & ) = delete ; void operator = ( const vtkArrayIterator & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
