## ============================================================================
##   Copyright (c) Kitware, Inc.
##   All rights reserved.
##   See LICENSE.txt for details.
##   This software is distributed WITHOUT ANY WARRANTY; without even
##   the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##   PURPOSE.  See the above copyright notice for more information.
##
##   Copyright 2019 Sandia Corporation.
##   Copyright 2019 UT-Battelle, LLC.
##   Copyright 2019 Los Alamos National Security.
##
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
##
##   Under the terms of Contract DE-AC52-06NA25396 with Los Alamos National
##   Laboratory (LANL), the U.S. Government retains certain rights in
##   this software.
## ============================================================================

## !!!Ignored construct:  # vtkmDataArray_h [NewLine] # vtkmDataArray_h [NewLine] # vtkAcceleratorsVTKmCoreModule.h  For export macro # vtkGenericDataArray.h [NewLine] # vtkmConfigCore.h  For template export [NewLine] # < vtkm / List . h >  For vtkm::List # < vtkm / VecFromPortal . h >  For vtkm::VecFromPortal # < vtkm / VecTraits . h >  For vtkm::VecTraits # < vtkm / cont / ArrayHandle . h >  For vtkm::cont::ArrayHandle # < vtkm / cont / UnknownArrayHandle . h >  For vtkm::cont::UnknownArrayHandle [NewLine] # < memory >  For unique_ptr [NewLine] namespace internal { template < typename T > [end of template] class ArrayHandleWrapperBase ; }  internal template < typename T > [end of template] class vtkmDataArray : public vtkGenericDataArray < vtkmDataArray < T > [end of template] , T > [end of template] { static_assert ( std :: is_arithmetic < T > :: value , T must be an integral or floating-point type ) ; using GenericDataArrayType = vtkGenericDataArray < vtkmDataArray < T > [end of template] , T > [end of template] ; public : using SelfType = vtkmDataArray < T > [end of template] ; protected : const char * GetClassNameInternal ( ) const override { return typeid ( SelfType ) . name ( ) ; } public : typedef GenericDataArrayType Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( typeid ( SelfType ) . name ( ) , type ) ) { return 1 ; } return GenericDataArrayType :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> SelfType :: IsTypeOf ( type ) ; } static SelfType * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( typeid ( SelfType ) . name ( ) ) ) { return static_cast < SelfType * > [end of template] ( o ) ; } return nullptr ; } VTK_NEWINSTANCE SelfType * NewInstance ( ) const { return SelfType :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( typeid ( SelfType ) . name ( ) , type ) ) { return 0 ; } return 1 + GenericDataArrayType :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> SelfType :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : ; protected : vtkObjectBase * NewInstanceInternal ( ) const override { return SelfType :: New ( ) ; } public : ; using typename Superclass :: ValueType ; using VtkmTypesList = vtkm :: List < T , vtkm :: Vec < T , 2 > [end of template] , vtkm :: Vec < T , 3 > [end of template] , vtkm :: Vec < T , 4 > [end of template] , vtkm :: VecFromPortal < typename vtkm :: cont :: ArrayHandle < T > :: WritePortalType > [end of template] > [end of template] ; static vtkmDataArray * New ( ) ; template < typename V , typename S > [end of template] void SetVtkmArrayHandle ( const vtkm :: cont :: ArrayHandle < V , S > [end of template] & ah ) ; vtkm :: cont :: UnknownArrayHandle GetVtkmUnknownArrayHandle ( ) const ; / concept methods for \c vtkGenericDataArray ValueType GetValue ( vtkIdType valueIdx ) const ; void SetValue ( vtkIdType valueIdx , ValueType value ) ; void GetTypedTuple ( vtkIdType tupleIdx , ValueType * tuple ) const ; void SetTypedTuple ( vtkIdType tupleIdx , const ValueType * tuple ) ; ValueType GetTypedComponent ( vtkIdType tupleIdx , int compIdx ) const ; void SetTypedComponent ( vtkIdType tupleIdx , int compIdx , ValueType value ) ; protected : vtkmDataArray ( ) ; ~ vtkmDataArray ( ) override ; / concept methods for \c vtkGenericDataArray bool AllocateTuples ( vtkIdType numTuples ) ; bool ReallocateTuples ( vtkIdType numTuples ) ; private : vtkmDataArray ( const vtkmDataArray & ) = delete ; void operator = ( const vtkmDataArray & ) = delete ;  To access AllocateTuples and ReallocateTuples friend Superclass ; std :: unique_ptr < internal :: ArrayHandleWrapperBase < T > [end of template] > [end of template] VtkmArray ; } ;
## Error: token expected: > [end of template] but got: [identifier]!!!

## =============================================================================

## !!!Ignored construct:  template < typename T , typename S > [end of template] inline vtkmDataArray < typename vtkm :: VecTraits < T > :: BaseComponentType > [end of template] * make_vtkmDataArray ( const vtkm :: cont :: ArrayHandle < T , S > & ah ) { auto ret = vtkmDataArray < typename vtkm :: VecTraits < T > :: BaseComponentType > :: New ( ) ; ret -> SetVtkmArrayHandle ( ah ) ; return ret ; } ============================================================================= # vtkmDataArray_cxx [NewLine] extern template class VTKACCELERATORSVTKMCORE_TEMPLATE_EXPORT vtkmDataArray < char > ;
## Error: token expected: > [end of template] but got: [identifier]!!!

## !!!Ignored construct:  extern template class VTKACCELERATORSVTKMCORE_TEMPLATE_EXPORT vtkmDataArray < double > ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  extern template class VTKACCELERATORSVTKMCORE_TEMPLATE_EXPORT vtkmDataArray < float > ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  extern template class VTKACCELERATORSVTKMCORE_TEMPLATE_EXPORT vtkmDataArray < int > ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  extern template class VTKACCELERATORSVTKMCORE_TEMPLATE_EXPORT vtkmDataArray < long > ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  extern template class VTKACCELERATORSVTKMCORE_TEMPLATE_EXPORT vtkmDataArray < long long > ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  extern template class VTKACCELERATORSVTKMCORE_TEMPLATE_EXPORT vtkmDataArray < short > ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  extern template class VTKACCELERATORSVTKMCORE_TEMPLATE_EXPORT vtkmDataArray < signed char > ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  extern template class VTKACCELERATORSVTKMCORE_TEMPLATE_EXPORT vtkmDataArray < unsigned char > ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  extern template class VTKACCELERATORSVTKMCORE_TEMPLATE_EXPORT vtkmDataArray < unsigned int > ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  extern template class VTKACCELERATORSVTKMCORE_TEMPLATE_EXPORT vtkmDataArray < unsigned long > ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  extern template class VTKACCELERATORSVTKMCORE_TEMPLATE_EXPORT vtkmDataArray < unsigned long long > ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  extern template class VTKACCELERATORSVTKMCORE_TEMPLATE_EXPORT vtkmDataArray < unsigned short > ;
## Error: token expected: ; but got: [identifier]!!!

import
  vtkmlib/vtkmDataArray

##  VTK-HeaderTest-Exclude: vtkmDataArray.h
