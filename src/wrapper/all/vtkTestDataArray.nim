## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTestDataArray.h
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
##  @class   vtkTestDataArray
##  @brief   An implementation of vtkGenericDataArray for testing
##  fallback algorithms.
##
##
##  vtkTestDataArray is derived from vtkGenericDataArray, and is deliberately
##  omitted from VTK's whitelist of dispatchable data arrays. It is used to test
##  the fallback mechanisms of algorithms in the case that array dispatch fails.
##
##  @sa
##  vtkGenericDataArray
##

## !!!Ignored construct:  # vtkTestDataArray_h [NewLine] # vtkTestDataArray_h [NewLine] # vtkCommonCoreModule.h  For export macro # vtkGenericDataArray.h [NewLine] # vtkObjectFactory.h  For VTK_STANDARD_NEW_BODY [NewLine] template < class ArrayT > [end of template] class vtkTestDataArray : public vtkGenericDataArray < vtkTestDataArray < ArrayT > [end of template] , typename ArrayT :: ValueType > [end of template] { public : typedef ArrayT ArrayType ; typedef typename ArrayType :: ValueType ValueType ; typedef vtkTestDataArray < ArrayT > SelfType ; typedef vtkGenericDataArray < vtkTestDataArray < ArrayT > , ValueType > GenericDataArrayType ; friend class vtkGenericDataArray < vtkTestDataArray < ArrayT > , ValueType > ; protected : const char * GetClassNameInternal ( ) const override { return typeid ( SelfType ) . name ( ) ; } public : typedef GenericDataArrayType Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( typeid ( SelfType ) . name ( ) , type ) ) { return 1 ; } return GenericDataArrayType :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> SelfType :: IsTypeOf ( type ) ; } static SelfType * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( typeid ( SelfType ) . name ( ) ) ) { return static_cast < SelfType * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE SelfType * NewInstance ( ) const { return SelfType :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( typeid ( SelfType ) . name ( ) , type ) ) { return 0 ; } return 1 + GenericDataArrayType :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> SelfType :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : ; vtkAOSArrayNewInstanceMacro ( SelfType ) ; static vtkTestDataArray < ArrayType > * New ( ) { VTK_STANDARD_NEW_BODY ( vtkTestDataArray < ArrayType > ) ; } void PrintSelf ( ostream & os , vtkIndent indent ) override { GenericDataArrayType :: PrintSelf ( os , indent ) ; } ValueType GetValue ( vtkIdType valueIdx ) const { return this -> Array -> GetValue ( valueIdx ) ; } void SetValue ( vtkIdType valueIdx , ValueType value ) { this -> Array -> SetValue ( valueIdx , value ) ; } void GetTypedTuple ( vtkIdType tupleIdx , ValueType * tuple ) const { this -> Array -> SetTypedTuple ( tupleIdx , tuple ) ; } void SetTypedTuple ( vtkIdType tupleIdx , const ValueType * tuple ) { this -> Array -> SetTypedTuple ( tupleIdx , tuple ) ; } ValueType GetTypedComponent ( vtkIdType tupleIdx , int compIdx ) const { return this -> Array -> GetTypedComponent ( tupleIdx , compIdx ) ; } void SetTypedComponent ( vtkIdType tupleIdx , int compIdx , ValueType value ) { this -> Array -> SetTypedComponent ( tupleIdx , compIdx , value ) ; } void * GetVoidPointer ( vtkIdType valueIdx ) override { return this -> Array -> GetVoidPointer ( valueIdx ) ; } protected : vtkTestDataArray ( ) { this -> Array = ArrayType :: New ( ) ; } ~ vtkTestDataArray ( ) override { this -> Array -> Delete ( ) ; } bool AllocateTuples ( vtkIdType numTuples ) { return this -> Array -> Allocate ( numTuples ) != 0 ; } bool ReallocateTuples ( vtkIdType numTuples ) { return this -> Array -> Allocate ( numTuples ) != 0 ; } private : ArrayType * Array ; vtkTestDataArray ( const vtkTestDataArray & ) = delete ; void operator = ( const vtkTestDataArray & ) = delete ; } ;
## Error: token expected: > [end of template] but got: [identifier]!!!

##  VTK-HeaderTest-Exclude: vtkTestDataArray.h
