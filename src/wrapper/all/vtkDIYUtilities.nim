## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDIYUtilities.h
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
##  @class vtkDIYUtilities
##  @brief collection of helper functions for working with DIY
##
##  vtkDIYUtilities provides a set of utility functions when using DIY in a VTK
##  filters.
##

import
  vtkDeprecation, vtkObject, vtkParallelDIYModule, vtkSmartPointer

##  clang-format off

import
  vtk_diy2

##  clang-format on

discard "forward decl of vtkDataArray"
discard "forward decl of vtkBoundingBox"
discard "forward decl of vtkDataObject"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkFieldData"
discard "forward decl of vtkMultiProcessController"
discard "forward decl of vtkPoints"
discard "forward decl of vtkStringArray"
type
  vtkDIYUtilities* {.importcpp: "vtkDIYUtilities", header: "vtkDIYUtilities.h",
                    bycopy.} = object of vtkObject
    vtkDIYUtilities* {.importc: "vtkDIYUtilities".}: VTK_NEWINSTANCE

  vtkDIYUtilitiesSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDIYUtilities::IsTypeOf(@)", header: "vtkDIYUtilities.h".}
proc IsA*(this: var vtkDIYUtilities; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkDIYUtilities.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDIYUtilities {.
    importcpp: "vtkDIYUtilities::SafeDownCast(@)", header: "vtkDIYUtilities.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDIYUtilities :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDIYUtilities :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDIYUtilities :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDIYUtilities; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkDIYUtilities.h".}
proc InitializeEnvironmentForDIY*() {.importcpp: "vtkDIYUtilities::InitializeEnvironmentForDIY(@)",
                                    header: "vtkDIYUtilities.h".}
proc GetCommunicator*(controller: ptr vtkMultiProcessController): communicator {.
    importcpp: "vtkDIYUtilities::GetCommunicator(@)", header: "vtkDIYUtilities.h".}
proc Save*(bb: var BinaryBuffer; a2: ptr vtkDataSet) {.
    importcpp: "vtkDIYUtilities::Save(@)", header: "vtkDIYUtilities.h".}
proc Load*(bb: var BinaryBuffer; a2: ptr vtkDataSet) {.
    importcpp: "vtkDIYUtilities::Load(@)", header: "vtkDIYUtilities.h".}
proc Save*(bb: var BinaryBuffer; a2: ptr vtkFieldData) {.
    importcpp: "vtkDIYUtilities::Save(@)", header: "vtkDIYUtilities.h".}
proc Load*(bb: var BinaryBuffer; a2: ptr vtkFieldData) {.
    importcpp: "vtkDIYUtilities::Load(@)", header: "vtkDIYUtilities.h".}
proc Save*(bb: var BinaryBuffer; a2: ptr vtkStringArray) {.
    importcpp: "vtkDIYUtilities::Save(@)", header: "vtkDIYUtilities.h".}
proc Load*(bb: var BinaryBuffer; a2: ptr vtkStringArray) {.
    importcpp: "vtkDIYUtilities::Load(@)", header: "vtkDIYUtilities.h".}
proc Save*(bb: var BinaryBuffer; a2: ptr vtkDataArray) {.
    importcpp: "vtkDIYUtilities::Save(@)", header: "vtkDIYUtilities.h".}
proc Load*(bb: var BinaryBuffer; a2: ptr vtkDataArray) {.
    importcpp: "vtkDIYUtilities::Load(@)", header: "vtkDIYUtilities.h".}
proc AllReduce*(comm: var communicator; bbox: var vtkBoundingBox) {.
    importcpp: "vtkDIYUtilities::AllReduce(@)", header: "vtkDIYUtilities.h".}
proc Convert*(bbox: vtkBoundingBox): ContinuousBounds {.
    importcpp: "vtkDIYUtilities::Convert(@)", header: "vtkDIYUtilities.h".}
proc Convert*(bds: ContinuousBounds): vtkBoundingBox {.
    importcpp: "vtkDIYUtilities::Convert(@)", header: "vtkDIYUtilities.h".}
proc Broadcast*(comm: var communicator; boxes: var vector[vtkBoundingBox]; source: cint) {.
    importcpp: "vtkDIYUtilities::Broadcast(@)", header: "vtkDIYUtilities.h".}
## !!!Ignored construct:  *
##  Extract datasets from the given data object. This method returns a vector
##  of DataSetT* from the `dobj`. If dobj is a DataSetT, the returned
##  vector will have just 1 DataSetT. If dobj is a vtkCompositeDataSet, then
##  we iterate over it and add all non-null leaf nodes to the returned vector.
##  template < class DataSetT = vtkDataSet > [end of template] VTK_DEPRECATED_IN_9_1_0 ( Use vtkCompositeDataSet::GetDataSets instead ) static std :: vector < DataSetT * > GetDataSets ( vtkDataObject * dobj ) ;
## Error: token expected: > [end of template] but got: =!!!

proc ExtractPoints*(datasets: vector[ptr vtkDataSet]; use_cell_centers: bool): vector[
    vtkSmartPointer[vtkPoints]] {.importcpp: "vtkDIYUtilities::ExtractPoints(@)",
                                 header: "vtkDIYUtilities.h".}
proc GetLocalBounds*(dobj: ptr vtkDataObject): vtkBoundingBox {.
    importcpp: "vtkDIYUtilities::GetLocalBounds(@)", header: "vtkDIYUtilities.h".}
proc Link*[DummyT](master: var Master; assigner: Assigner;
                  linksMap: vector[map[cint, DummyT]]) {.
    importcpp: "vtkDIYUtilities::Link(@)", header: "vtkDIYUtilities.h".}
proc Link*(master: var Master; assigner: Assigner; linksMap: vector[set[cint]]) {.
    importcpp: "vtkDIYUtilities::Link(@)", header: "vtkDIYUtilities.h".}
## !!!Ignored construct:  template < > [end of template] struct Serialization < vtkDataSet * > { static void save ( BinaryBuffer & bb , vtkDataSet * const & p ) { vtkDIYUtilities :: Save ( bb , p ) ; } static void load ( BinaryBuffer & bb , vtkDataSet * & p ) { vtkDIYUtilities :: Load ( bb , p ) ; } } ;
## Error: identifier expected, but got: <!!!

## !!!Ignored construct:  template < > [end of template] struct Serialization < vtkDataArray * > { static void save ( BinaryBuffer & bb , vtkDataArray * const & da ) { vtkDIYUtilities :: Save ( bb , da ) ; } static void load ( BinaryBuffer & bb , vtkDataArray * & da ) { vtkDIYUtilities :: Load ( bb , da ) ; } } ;
## Error: identifier expected, but got: <!!!

## !!!Ignored construct:  template < > [end of template] struct Serialization < vtkFieldData * > { static void save ( BinaryBuffer & bb , vtkFieldData * const & fd ) { vtkDIYUtilities :: Save ( bb , fd ) ; } static void load ( BinaryBuffer & bb , vtkFieldData * & fd ) { vtkDIYUtilities :: Load ( bb , fd ) ; } } ;
## Error: identifier expected, but got: <!!!

##  Implementation detail for Schwarz counter idiom.

type
  SerializationSerializationSerializationvtkDIYUtilitiesCleanup* {.importcpp: "Serialization<\'0>::Serialization<\'1>::Serialization<\'2>::vtkDIYUtilitiesCleanup",
      header: "vtkDIYUtilities.h", bycopy.} = object


proc constructSerializationSerializationSerializationvtkDIYUtilitiesCleanup*(): SerializationSerializationSerializationvtkDIYUtilitiesCleanup {.
    constructor, importcpp: "Serialization<\'*0>::Serialization<\'*1>::Serialization<\'*2>::vtkDIYUtilitiesCleanup(@)",
    header: "vtkDIYUtilities.h".}
proc destroySerializationSerializationSerializationvtkDIYUtilitiesCleanup*(
    this: var SerializationSerializationSerializationvtkDIYUtilitiesCleanup) {.
    importcpp: "#.~vtkDIYUtilitiesCleanup()", header: "vtkDIYUtilities.h".}
var vtkDIYUtilitiesCleanupInstance* {.importcpp: "vtkDIYUtilitiesCleanupInstance",
                                    header: "vtkDIYUtilities.h".}: SerializationSerializationSerializationvtkDIYUtilitiesCleanup

import
  vtkDIYUtilities
