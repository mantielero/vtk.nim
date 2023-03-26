## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCompositeDataSet.h
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
##  @class   vtkCompositeDataSet
##  @brief   abstract superclass for composite
##  (multi-block or AMR) datasets
##
##  vtkCompositeDataSet is an abstract class that represents a collection
##  of datasets (including other composite datasets). It
##  provides an interface to access the datasets through iterators.
##  vtkCompositeDataSet provides methods that are used by subclasses to store the
##  datasets.
##  vtkCompositeDataSet provides the datastructure for a full tree
##  representation. Subclasses provide the semantics for it and control how
##  this tree is built.
##
##  @sa
##  vtkCompositeDataIterator
##

import
  vtkCommonDataModelModule, vtkDataObject

discard "forward decl of vtkCompositeDataIterator"
discard "forward decl of vtkCompositeDataSetInternals"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkInformation"
discard "forward decl of vtkInformationStringKey"
discard "forward decl of vtkInformationIntegerKey"
type
  vtkCompositeDataSet* {.importcpp: "vtkCompositeDataSet",
                        header: "vtkCompositeDataSet.h", bycopy.} = object of vtkDataObject
    vtkCompositeDataSet* {.importc: "vtkCompositeDataSet".}: VTK_NEWINSTANCE
    vtkCompositeDataIterator* {.importc: "vtkCompositeDataIterator".}: VTK_NEWINSTANCE

  vtkCompositeDataSetSuperclass* = vtkDataObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCompositeDataSet::IsTypeOf(@)", header: "vtkCompositeDataSet.h".}
proc IsA*(this: var vtkCompositeDataSet; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkCompositeDataSet.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCompositeDataSet {.
    importcpp: "vtkCompositeDataSet::SafeDownCast(@)",
    header: "vtkCompositeDataSet.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCompositeDataSet :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCompositeDataSet :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCompositeDataSet :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCompositeDataSet; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCompositeDataSet.h".}
## !!!Ignored construct:  * NewIterator ( ) = 0 ;
## Error: identifier expected, but got: *!!!

proc GetDataObjectType*(this: var vtkCompositeDataSet): cint {.
    importcpp: "GetDataObjectType", header: "vtkCompositeDataSet.h".}
proc CopyStructure*(this: var vtkCompositeDataSet; input: ptr vtkCompositeDataSet) {.
    importcpp: "CopyStructure", header: "vtkCompositeDataSet.h".}
proc SetDataSet*(this: var vtkCompositeDataSet; iter: ptr vtkCompositeDataIterator;
                dataObj: ptr vtkDataObject) {.importcpp: "SetDataSet",
    header: "vtkCompositeDataSet.h".}
proc GetDataSet*(this: var vtkCompositeDataSet; iter: ptr vtkCompositeDataIterator): ptr vtkDataObject {.
    importcpp: "GetDataSet", header: "vtkCompositeDataSet.h".}
proc GetDataSet*(this: var vtkCompositeDataSet; flatIndex: cuint): ptr vtkDataObject {.
    importcpp: "GetDataSet", header: "vtkCompositeDataSet.h".}
proc GetActualMemorySize*(this: var vtkCompositeDataSet): culong {.
    importcpp: "GetActualMemorySize", header: "vtkCompositeDataSet.h".}
proc GetData*(info: ptr vtkInformation): ptr vtkCompositeDataSet {.
    importcpp: "vtkCompositeDataSet::GetData(@)", header: "vtkCompositeDataSet.h".}
proc GetData*(v: ptr vtkInformationVector; i: cint = 0): ptr vtkCompositeDataSet {.
    importcpp: "vtkCompositeDataSet::GetData(@)", header: "vtkCompositeDataSet.h".}
proc Initialize*(this: var vtkCompositeDataSet) {.importcpp: "Initialize",
    header: "vtkCompositeDataSet.h".}
proc ShallowCopy*(this: var vtkCompositeDataSet; src: ptr vtkDataObject) {.
    importcpp: "ShallowCopy", header: "vtkCompositeDataSet.h".}
proc DeepCopy*(this: var vtkCompositeDataSet; src: ptr vtkDataObject) {.
    importcpp: "DeepCopy", header: "vtkCompositeDataSet.h".}
proc RecursiveShallowCopy*(this: var vtkCompositeDataSet; src: ptr vtkDataObject) {.
    importcpp: "RecursiveShallowCopy", header: "vtkCompositeDataSet.h".}
proc GetNumberOfPoints*(this: var vtkCompositeDataSet): vtkIdType {.
    importcpp: "GetNumberOfPoints", header: "vtkCompositeDataSet.h".}
proc GetNumberOfCells*(this: var vtkCompositeDataSet): vtkIdType {.
    importcpp: "GetNumberOfCells", header: "vtkCompositeDataSet.h".}
proc GetNumberOfElements*(this: var vtkCompositeDataSet; `type`: cint): vtkIdType {.
    importcpp: "GetNumberOfElements", header: "vtkCompositeDataSet.h".}
proc GetBounds*(this: var vtkCompositeDataSet; bounds: array[6, cdouble]) {.
    importcpp: "GetBounds", header: "vtkCompositeDataSet.h".}
proc NAME*(): ptr vtkInformationStringKey {.importcpp: "vtkCompositeDataSet::NAME(@)",
                                        header: "vtkCompositeDataSet.h".}
proc CURRENT_PROCESS_CAN_LOAD_BLOCK*(): ptr vtkInformationIntegerKey {.
    importcpp: "vtkCompositeDataSet::CURRENT_PROCESS_CAN_LOAD_BLOCK(@)",
    header: "vtkCompositeDataSet.h".}
## !!!Ignored construct:  *
##  Extract datasets from the given data object. This method returns a vector
##  of DataSetT* from the `dobj`. If dobj is a DataSetT, the returned
##  vector will have just 1 DataSetT. If dobj is a vtkCompositeDataSet, then
##  we iterate over it and add all non-null leaf nodes to the returned vector.
##
##  If `preserveNull` is true (defaults to false), then `nullptr` place holders
##  are added as placeholders when leaf node dataset type does not match the
##  requested or is nullptr to begin with.
##  template < class DataSetT = vtkDataSet > [end of template] static std :: vector < DataSetT * > GetDataSets ( vtkDataObject * dobj , bool preserveNull = false ) ;
## Error: token expected: > [end of template] but got: =!!!

import
  vtkCompositeDataSet
