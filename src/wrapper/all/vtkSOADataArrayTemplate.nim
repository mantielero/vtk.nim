## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSOADataArrayTemplate.h
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
##  @class   vtkSOADataArrayTemplate
##  @brief   Struct-Of-Arrays implementation of
##  vtkGenericDataArray.
##
##
##  vtkSOADataArrayTemplate is the counterpart of vtkAOSDataArrayTemplate. Each
##  component is stored in a separate array.
##
##  @sa
##  vtkGenericDataArray vtkAOSDataArrayTemplate
##

import
  vtkBuffer, vtkCommonCoreModule, vtkCompiler, vtkGenericDataArray

##  The export macro below makes no sense, but is necessary for older compilers
##  when we export instantiations of this class from vtkCommonCore.

type
  vtkSOADataArrayTemplate*[ValueTypeT] {.importcpp: "vtkSOADataArrayTemplate<\'0>",
                                        header: "vtkSOADataArrayTemplate.h",
                                        bycopy.} = object of vtkGenericDataArray[
      vtkSOADataArrayTemplate[ValueTypeT], ValueTypeT]
    vtkSOADataArrayTemplateSelfType* {.importc: "SelfType".}: VTK_NEWINSTANCE
    vtkArrayIterator* {.importc: "vtkArrayIterator".}: VTK_NEWINSTANCE

  vtkSOADataArrayTemplateSelfType* = vtkSOADataArrayTemplate[ValueTypeT]
  vtkSOADataArrayTemplateSuperclass* = vtkSOADataArrayTemplateGenericDataArrayType

proc IsTypeOf*[ValueTypeT](`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSOADataArrayTemplate::IsTypeOf(@)",
    header: "vtkSOADataArrayTemplate.h".}
proc IsA*[ValueTypeT](this: var vtkSOADataArrayTemplate[ValueTypeT]; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkSOADataArrayTemplate.h".}
proc SafeDownCast*[ValueTypeT](o: ptr vtkObjectBase): ptr vtkSOADataArrayTemplateSelfType {.
    importcpp: "vtkSOADataArrayTemplate::SafeDownCast(@)",
    header: "vtkSOADataArrayTemplate.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return SelfType :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( typeid ( SelfType ) . name ( ) , type ) ) { return 0 ; } return 1 + GenericDataArrayType :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> SelfType :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : ;
## Error: identifier expected, but got: *!!!

type
  vtkSOADataArrayTemplateValueType* = ValueType
  vtkSOADataArrayTemplateDeleteMethod* {.size: sizeof(cint).} = enum
    VTK_DATA_ARRAY_FREE = VTK_DATA_ARRAY_FREE,
    VTK_DATA_ARRAY_DELETE = VTK_DATA_ARRAY_DELETE,
    VTK_DATA_ARRAY_ALIGNED_FREE = VTK_DATA_ARRAY_ALIGNED_FREE,
    VTK_DATA_ARRAY_USER_DEFINED = VTK_DATA_ARRAY_USER_DEFINED


proc New*[ValueTypeT](): ptr vtkSOADataArrayTemplate {.
    importcpp: "vtkSOADataArrayTemplate::New(@)",
    header: "vtkSOADataArrayTemplate.h".}
proc GetValue*[ValueTypeT](this: vtkSOADataArrayTemplate[ValueTypeT];
                          valueIdx: vtkIdType): vtkSOADataArrayTemplateValueType {.
    noSideEffect, importcpp: "GetValue", header: "vtkSOADataArrayTemplate.h".}
proc SetValue*[ValueTypeT](this: var vtkSOADataArrayTemplate[ValueTypeT];
                          valueIdx: vtkIdType;
                          value: vtkSOADataArrayTemplateValueType) {.
    importcpp: "SetValue", header: "vtkSOADataArrayTemplate.h".}
proc GetTypedTuple*[ValueTypeT](this: vtkSOADataArrayTemplate[ValueTypeT];
                               tupleIdx: vtkIdType;
                               `tuple`: ptr vtkSOADataArrayTemplateValueType) {.
    noSideEffect, importcpp: "GetTypedTuple", header: "vtkSOADataArrayTemplate.h".}
proc SetTypedTuple*[ValueTypeT](this: var vtkSOADataArrayTemplate[ValueTypeT];
                               tupleIdx: vtkIdType;
                               `tuple`: ptr vtkSOADataArrayTemplateValueType) {.
    importcpp: "SetTypedTuple", header: "vtkSOADataArrayTemplate.h".}
proc GetTypedComponent*[ValueTypeT](this: vtkSOADataArrayTemplate[ValueTypeT];
                                   tupleIdx: vtkIdType; comp: cint): vtkSOADataArrayTemplateValueType {.
    noSideEffect, importcpp: "GetTypedComponent",
    header: "vtkSOADataArrayTemplate.h".}
proc SetTypedComponent*[ValueTypeT](this: var vtkSOADataArrayTemplate[ValueTypeT];
                                   tupleIdx: vtkIdType; comp: cint;
                                   value: vtkSOADataArrayTemplateValueType) {.
    importcpp: "SetTypedComponent", header: "vtkSOADataArrayTemplate.h".}
proc FillTypedComponent*[ValueTypeT](this: var vtkSOADataArrayTemplate[ValueTypeT];
                                    compIdx: cint;
                                    value: vtkSOADataArrayTemplateValueType) {.
    importcpp: "FillTypedComponent", header: "vtkSOADataArrayTemplate.h".}
## !!!Ignored construct:  *
##  Use this API to pass externally allocated memory to this instance. Since
##  vtkSOADataArrayTemplate uses separate contiguous regions for each
##  component, use this API to add arrays for each of the component.
##  \c save: When set to true, vtkSOADataArrayTemplate will not release or
##  realloc the memory even when the AllocatorType is set to RESIZABLE. If
##  needed it will simply allow new memory buffers and "forget" the supplied
##  pointers. When save is set to false, this will be the \c deleteMethod
##  specified to release the array.
##  If updateMaxId is true, the array's MaxId will be updated, and assumes
##  that size is the number of tuples in the array.
##  \c size is specified in number of elements of ScalarType.
##  void SetArray ( int comp , VTK_ZEROCOPY ValueType * array , vtkIdType size , bool updateMaxId = false , bool save = false , int deleteMethod = VTK_DATA_ARRAY_FREE ) ;
## Error: token expected: ) but got: *!!!

proc SetArrayFreeFunction*[ValueTypeT](this: var vtkSOADataArrayTemplate[ValueTypeT];
                                      callback: proc (a1: pointer)) {.
    importcpp: "SetArrayFreeFunction", header: "vtkSOADataArrayTemplate.h".}
proc SetArrayFreeFunction*[ValueTypeT](this: var vtkSOADataArrayTemplate[ValueTypeT];
                                      comp: cint; callback: proc (a1: pointer)) {.
    importcpp: "SetArrayFreeFunction", header: "vtkSOADataArrayTemplate.h".}
proc GetComponentArrayPointer*[ValueTypeT](
    this: var vtkSOADataArrayTemplate[ValueTypeT]; comp: cint): ptr vtkSOADataArrayTemplateValueType {.
    importcpp: "GetComponentArrayPointer", header: "vtkSOADataArrayTemplate.h".}
proc GetVoidPointer*[ValueTypeT](this: var vtkSOADataArrayTemplate[ValueTypeT];
                                valueIdx: vtkIdType): pointer {.
    importcpp: "GetVoidPointer", header: "vtkSOADataArrayTemplate.h".}
proc ExportToVoidPointer*[ValueTypeT](this: var vtkSOADataArrayTemplate[ValueTypeT];
                                     `ptr`: pointer) {.
    importcpp: "ExportToVoidPointer", header: "vtkSOADataArrayTemplate.h".}
## !!!Ignored construct:  # __VTK_WRAP__ [NewLine] /@{ *
##  Perform a fast, safe cast from a vtkAbstractArray to a vtkDataArray.
##  This method checks if source->GetArrayType() returns DataArray
##  or a more derived type, and performs a static_cast to return
##  source as a vtkDataArray pointer. Otherwise, nullptr is returned.
##  static vtkSOADataArrayTemplate < ValueType > * FastDownCast ( vtkAbstractArray * source ) ;
## Error: identifier expected, but got: /@{!!!

proc GetArrayType*[ValueTypeT](this: vtkSOADataArrayTemplate[ValueTypeT]): cint {.
    noSideEffect, importcpp: "GetArrayType", header: "vtkSOADataArrayTemplate.h".}
## !!!Ignored construct:  * NewIterator ( ) override ;
## Error: identifier expected, but got: *!!!

proc SetNumberOfComponents*[ValueTypeT](this: var vtkSOADataArrayTemplate[
    ValueTypeT]; numComps: cint) {.importcpp: "SetNumberOfComponents",
                                header: "vtkSOADataArrayTemplate.h".}
proc ShallowCopy*[ValueTypeT](this: var vtkSOADataArrayTemplate[ValueTypeT];
                             other: ptr vtkDataArray) {.importcpp: "ShallowCopy",
    header: "vtkSOADataArrayTemplate.h".}
proc InsertTuples*[ValueTypeT](this: var vtkSOADataArrayTemplate[ValueTypeT];
                              dstStart: vtkIdType; n: vtkIdType;
                              srcStart: vtkIdType; source: ptr vtkAbstractArray) {.
    importcpp: "InsertTuples", header: "vtkSOADataArrayTemplate.h".}
proc InsertTuples*[ValueTypeT](this: var vtkSOADataArrayTemplate[ValueTypeT];
                              dstIds: ptr vtkIdList; srcIds: ptr vtkIdList;
                              source: ptr vtkAbstractArray) {.
    importcpp: "InsertTuples", header: "vtkSOADataArrayTemplate.h".}
proc InsertTuplesStartingAt*[ValueTypeT](this: var vtkSOADataArrayTemplate[
    ValueTypeT]; dstStart: vtkIdType; srcIds: ptr vtkIdList;
                                        source: ptr vtkAbstractArray) {.
    importcpp: "InsertTuplesStartingAt", header: "vtkSOADataArrayTemplate.h".}
##  Declare vtkArrayDownCast implementations for SoA containers:

vtkArrayDownCast_TemplateFastCastMacro(constructvtkSOADataArrayTemplate)
##  This portion must be OUTSIDE the include blockers. This is used to tell
##  libraries other than vtkCommonCore that instantiations of
##  vtkSOADataArrayTemplate can be found externally. This prevents each library
##  from instantiating these on their own.

## !!!Ignored construct:  # VTK_SOA_DATA_ARRAY_TEMPLATE_INSTANTIATING [NewLine] # VTK_SOA_DATA_ARRAY_TEMPLATE_INSTANTIATE ( T ) namespace vtkDataArrayPrivate { VTK_INSTANTIATE_VALUERANGE_ARRAYTYPE ( vtkSOADataArrayTemplate < T > [end of template] , double ) ; } template class vtkSOADataArrayTemplate < T > [NewLine] # defined ( VTK_USE_EXTERN_TEMPLATE ) [NewLine] # VTK_SOA_DATA_ARRAY_TEMPLATE_EXTERN [NewLine] # VTK_SOA_DATA_ARRAY_TEMPLATE_EXTERN [NewLine] # _MSC_VER [NewLine] # warning ( push ) [NewLine]  The following is needed when the vtkSOADataArrayTemplate is declared
##  dllexport and is used from another class in vtkCommonCore # warning ( disable : 4910 )  extern and dllexport incompatible # [NewLine] vtkExternTemplateMacro ( extern template class vtkSOADataArrayTemplate ) ;
## Error: did not expect ;!!!

when defined(_MSC_VER):
  discard
##  The following clause is only for MSVC 2008 and 2010

##  C4091: 'extern ' : ignored on left of 'int' when no variable is declared

##  Compiler-specific extension warning.

##  We need to disable warning 4910 and do an extern dllexport
##  anyway.  When deriving new arrays from an
##  instantiation of this template the compiler does an explicit
##  instantiation of the base class.  From outside the vtkCommon
##  library we block this using an extern dllimport instantiation.
##  For classes inside vtkCommon we should be able to just do an
##  extern instantiation, but VS 2008 complains about missing
##  definitions.  We cannot do an extern dllimport inside vtkCommon
##  since the symbols are local to the dll.  An extern dllexport
##  seems to be the only way to convince VS 2008 to do the right
##  thing, so we just disable the warning.

##  Use an "extern explicit instantiation" to give the class a DLL
##  interface.  This is a compiler-specific extension.

vtkInstantiateTemplateMacro(extern, `template`, class,
                            constructvtkSOADataArrayTemplate)
##  VTK-HeaderTest-Exclude: vtkSOADataArrayTemplate.h
