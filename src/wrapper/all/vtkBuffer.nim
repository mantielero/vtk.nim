## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBuffer.h
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
##  @class   vtkBuffer
##  @brief   internal storage class used by vtkSOADataArrayTemplate,
##  vtkAOSDataArrayTemplate, and others.
##
##  vtkBuffer makes it easier to keep data pointers in vtkDataArray subclasses.
##  This is an internal class and not intended for direct use expect when writing
##  new types of vtkDataArray subclasses.
##

## !!!Ignored construct:  # vtkBuffer_h [NewLine] # vtkBuffer_h [NewLine] # vtkObject.h [NewLine] # vtkObjectFactory.h  New() implementation [NewLine] # < algorithm >  for std::min and std::copy [NewLine] template < class ScalarTypeT > [end of template] class vtkBuffer : public vtkObject { public : protected : const char * GetClassNameInternal ( ) const override { return typeid ( vtkBuffer < ScalarTypeT > ) . name ( ) ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( typeid ( vtkBuffer < ScalarTypeT > ) . name ( ) , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkBuffer < ScalarTypeT > :: IsTypeOf ( type ) ; } static vtkBuffer < ScalarTypeT > * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( typeid ( vtkBuffer < ScalarTypeT > ) . name ( ) ) ) { return static_cast < vtkBuffer < ScalarTypeT > * > [end of template] ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkBuffer < ScalarTypeT > * NewInstance ( ) const { return vtkBuffer < ScalarTypeT > :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( typeid ( vtkBuffer < ScalarTypeT > ) . name ( ) , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBuffer < ScalarTypeT > :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : ; protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBuffer < ScalarTypeT > :: New ( ) ; } public : ; typedef ScalarTypeT ScalarType ; static vtkBuffer < ScalarTypeT > [end of template] * New ( ) ; static vtkBuffer < ScalarTypeT > [end of template] * ExtendedNew ( ) ; *
##  Access the buffer as a scalar pointer.
##  inline ScalarType * GetBuffer ( ) { return this -> Pointer ; } inline const ScalarType * GetBuffer ( ) const { return this -> Pointer ; } *
##  Set the memory buffer that this vtkBuffer object will manage. @a array
##  is a pointer to the buffer data and @a size is the size of the buffer (in
##  number of elements).
##  void SetBuffer ( ScalarType * array , vtkIdType size ) ; *
##  Set the malloc function to be used when allocating space inside this object.
##  void SetMallocFunction ( vtkMallocingFunction mallocFunction = malloc ) ; *
##  Set the realloc function to be used when allocating space inside this object.
##  void SetReallocFunction ( vtkReallocingFunction reallocFunction = realloc ) ; *
##  Set the free function to be used when releasing this object.
##  If @a noFreeFunction is true, the buffer will not be freed when
##  this vtkBuffer object is deleted or resize -- otherwise, @a deleteFunction
##  will be called to free the buffer
##  void SetFreeFunction ( bool noFreeFunction , vtkFreeingFunction deleteFunction = free ) ; *
##  Return the number of elements the current buffer can hold.
##  inline vtkIdType GetSize ( ) const { return this -> Size ; } *
##  Allocate a new buffer that holds @a size elements. Old data is not saved.
##  bool Allocate ( vtkIdType size ) ; *
##  Allocate a new buffer that holds @a newsize elements. Old data is
##  preserved.
##  bool Reallocate ( vtkIdType newsize ) ; protected : vtkBuffer ( ) : Pointer ( nullptr ) , Size ( 0 ) { this -> SetMallocFunction ( vtkObjectBase :: GetCurrentMallocFunction ( ) ) ; this -> SetReallocFunction ( vtkObjectBase :: GetCurrentReallocFunction ( ) ) ; this -> SetFreeFunction ( false , vtkObjectBase :: GetCurrentFreeFunction ( ) ) ; } ~ vtkBuffer ( ) override { this -> SetBuffer ( nullptr , 0 ) ; } ScalarType * Pointer ; vtkIdType Size ; vtkMallocingFunction MallocFunction ; vtkReallocingFunction ReallocFunction ; vtkFreeingFunction DeleteFunction ; private : vtkBuffer ( const vtkBuffer & ) = delete ; void operator = ( const vtkBuffer & ) = delete ; } ;
## Error: token expected: ; but got: <!!!

## !!!Ignored construct:  template < class ScalarT > [end of template] inline vtkBuffer < ScalarT > [end of template] * vtkBuffer < ScalarT > :: New ( ) { VTK_STANDARD_NEW_BODY ( vtkBuffer < ScalarT > ) ; } template < class ScalarT > inline vtkBuffer < ScalarT > * vtkBuffer < ScalarT > :: ExtendedNew ( ) { auto mkhold = vtkMemkindRAII ( true ) ; return vtkBuffer < ScalarT > :: New ( ) ; } ------------------------------------------------------------------------------ template < typename ScalarT > void vtkBuffer < ScalarT > :: SetBuffer ( typename vtkBuffer < ScalarT > :: ScalarType * array , vtkIdType size ) { if ( this -> Pointer != array ) { if ( this -> DeleteFunction ) { this -> DeleteFunction ( this -> Pointer ) ; } this -> Pointer = array ; } this -> Size = size ; } ------------------------------------------------------------------------------ template < typename ScalarT > void vtkBuffer < ScalarT > :: SetMallocFunction ( vtkMallocingFunction mallocFunction ) { this -> MallocFunction = mallocFunction ; } ------------------------------------------------------------------------------ template < typename ScalarT > void vtkBuffer < ScalarT > :: SetReallocFunction ( vtkReallocingFunction reallocFunction ) { this -> ReallocFunction = reallocFunction ; } ------------------------------------------------------------------------------ template < typename ScalarT > void vtkBuffer < ScalarT > :: SetFreeFunction ( bool noFreeFunction , vtkFreeingFunction deleteFunction ) { if ( noFreeFunction ) { this -> DeleteFunction = nullptr ; } else { this -> DeleteFunction = deleteFunction ; } } ------------------------------------------------------------------------------ template < typename ScalarT > bool vtkBuffer < ScalarT > :: Allocate ( vtkIdType size ) {  release old memory. this -> SetBuffer ( nullptr , 0 ) ; if ( size > 0 ) { ScalarType * newArray ; if ( this -> MallocFunction ) { newArray = static_cast < ScalarType * > ( this -> MallocFunction ( size * sizeof ( ScalarType ) ) ) ; } else { newArray = static_cast < ScalarType * > ( malloc ( size * sizeof ( ScalarType ) ) ) ; } if ( newArray ) { this -> SetBuffer ( newArray , size ) ; if ( ! this -> MallocFunction ) { this -> DeleteFunction = free ; } return true ; } return false ; } return true ;  size == 0 } ------------------------------------------------------------------------------ template < typename ScalarT > bool vtkBuffer < ScalarT > :: Reallocate ( vtkIdType newsize ) { if ( newsize == 0 ) { return this -> Allocate ( 0 ) ; } if ( this -> Pointer && this -> DeleteFunction != free ) { ScalarType * newArray ; bool forceFreeFunction = false ; if ( this -> MallocFunction ) { newArray = static_cast < ScalarType * > ( this -> MallocFunction ( newsize * sizeof ( ScalarType ) ) ) ; if ( this -> MallocFunction == malloc ) {  This must be done because the array passed in may have been
##  allocated outside of the memory management of `vtkBuffer` and
##  therefore have been registered with a `DeleteFunction` such as
##  `delete` or `delete[]`. Since the memory is now allocated with
##  `malloc` here, we must also reset `DeleteFunction` to something
##  which matches. forceFreeFunction = true ; } } else { newArray = static_cast < ScalarType * > ( malloc ( newsize * sizeof ( ScalarType ) ) ) ; } if ( ! newArray ) { return false ; } std :: copy ( this -> Pointer , this -> Pointer + std :: min ( this -> Size , newsize ) , newArray ) ;  now save the new array and release the old one too. this -> SetBuffer ( newArray , newsize ) ; if ( ! this -> MallocFunction || forceFreeFunction ) { this -> DeleteFunction = free ; } } else {  Try to reallocate with minimal memory usage and possibly avoid
##  copying. ScalarType * newArray = nullptr ; if ( this -> ReallocFunction ) { newArray = static_cast < ScalarType * > ( this -> ReallocFunction ( this -> Pointer , newsize * sizeof ( ScalarType ) ) ) ; } else { newArray = static_cast < ScalarType * > ( realloc ( this -> Pointer , newsize * sizeof ( ScalarType ) ) ) ; } if ( ! newArray ) { return false ; } this -> Pointer = newArray ; this -> Size = newsize ; } return true ; } # [NewLine]  VTK-HeaderTest-Exclude: vtkBuffer.h
## Error: token expected: ; but got: <!!!
