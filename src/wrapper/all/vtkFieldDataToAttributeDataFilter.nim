## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFieldDataToAttributeDataFilter.h
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
##  @class   vtkFieldDataToAttributeDataFilter
##  @brief   map field data to dataset attribute data
##
##  vtkFieldDataToAttributeDataFilter is a class that maps field data into
##  dataset attributes. The input to this filter is any type of dataset and
##  the output is the same dataset (geometry/topology) with new attribute data
##  (attribute data is passed through if not replaced during filter
##  execution).
##
##  To use this filter you must specify which field data from the input
##  dataset to use. There are three possibilities: the cell field data, the
##  point field data, or the field data associated with the data object
##  superclass. Then you specify which attribute data to create: either cell
##  attribute data or point attribute data.  Finally, you must define how to
##  construct the various attribute data types (e.g., scalars, vectors,
##  normals, etc.) from the arrays and the components of the arrays from the
##  field data. This is done by associating components in the input field with
##  components making up the attribute data. For example, you would specify a
##  scalar with three components (RGB) by assigning components from the field
##  for the R, then G, then B values of the scalars.  You may also have to
##  specify component ranges (for each R-G-B) to make sure that the number of
##  R, G, and B values is the same. Also, you may want to normalize the
##  components which helps distribute the data uniformly.
##
##  This filter is often used in conjunction with
##  vtkDataObjectToDataSetFilter.  vtkDataObjectToDataSetFilter filter
##  generates dataset topology and geometry and passes its input field data
##  along to its output. Then this filter is used to generate the attribute
##  data to go along with the dataset.
##
##  @warning
##  Make sure that the data you extract is consistent. That is, if you have N
##  points, extract N point attributes (scalars, vectors, etc.).
##
##  @sa
##  vtkFieldData vtkDataSet vtkDataObjectToDataSetFilter
##  vtkDataSetAttributes vtkDataArray
##

import
  vtkDataSetAlgorithm, vtkFiltersCoreModule

const
  VTK_DATA_OBJECT_FIELD* = 0
  VTK_POINT_DATA_FIELD* = 1
  VTK_CELL_DATA_FIELD* = 2
  VTK_CELL_DATA* = 0
  VTK_POINT_DATA* = 1

discard "forward decl of vtkDataArray"
discard "forward decl of vtkDataSetAttributes"
discard "forward decl of vtkFieldData"
type
  vtkFieldDataToAttributeDataFilter* {.importcpp: "vtkFieldDataToAttributeDataFilter", header: "vtkFieldDataToAttributeDataFilter.h",
                                      bycopy.} = object of vtkDataSetAlgorithm
    vtkFieldDataToAttributeDataFilter* {.importc: "vtkFieldDataToAttributeDataFilter".}: VTK_NEWINSTANCE
    ##  the number of components to fill-in
    ##  the name of the arrays used to construct the scalar
    ##  the components of the arrays used to construct
    ##  the range of the components to use
    ##  flags control normalization
    ##  the name of the arrays used to construct the vectors
    ##  the components of the arrays used to construct
    ##  the range of the components to use
    ##  flags control normalization
    ##  the name of the array used to construct the ghost levels
    ##  the component of the array used to construct
    ##  the range of the components to use
    ##  flags control normalization
    ##  the name of the arrays used to construct the normals
    ##  the components of the arrays used to construct
    ##  the range of the components to use
    ##  flags control normalization
    ##  the name of the arrays used to construct the tensors
    ##  the components of the arrays used to construct
    ##  the range of the components to use
    ##  flags control normalization
    ##  the number of components to fill-in
    ##  the name of the arrays used to construct the tcoords
    ##  the components of the arrays used to construct
    ##  the range of the components to use
    ##  flags control normalization


proc PrintSelf*(this: var vtkFieldDataToAttributeDataFilter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkFieldDataToAttributeDataFilter.h".}
type
  vtkFieldDataToAttributeDataFilterSuperclass* = vtkDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkFieldDataToAttributeDataFilter::IsTypeOf(@)",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc IsA*(this: var vtkFieldDataToAttributeDataFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkFieldDataToAttributeDataFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkFieldDataToAttributeDataFilter {.
    importcpp: "vtkFieldDataToAttributeDataFilter::SafeDownCast(@)",
    header: "vtkFieldDataToAttributeDataFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkFieldDataToAttributeDataFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFieldDataToAttributeDataFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFieldDataToAttributeDataFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc New*(): ptr vtkFieldDataToAttributeDataFilter {.
    importcpp: "vtkFieldDataToAttributeDataFilter::New(@)",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc SetInputField*(this: var vtkFieldDataToAttributeDataFilter; _arg: cint) {.
    importcpp: "SetInputField", header: "vtkFieldDataToAttributeDataFilter.h".}
## !!!Ignored construct:  virtual int GetInputField ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InputField  of  << this -> InputField ) ; return this -> InputField ; } ;
## Error: expected ';'!!!

proc SetInputFieldToDataObjectField*(this: var vtkFieldDataToAttributeDataFilter) {.
    importcpp: "SetInputFieldToDataObjectField",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc SetInputFieldToPointDataField*(this: var vtkFieldDataToAttributeDataFilter) {.
    importcpp: "SetInputFieldToPointDataField",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc SetInputFieldToCellDataField*(this: var vtkFieldDataToAttributeDataFilter) {.
    importcpp: "SetInputFieldToCellDataField",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc SetInputFieldOutputAttributeData*(this: var vtkFieldDataToAttributeDataFilter;
                                      _arg: cint) {.
    importcpp: "SetInputFieldOutputAttributeData",
    header: "vtkFieldDataToAttributeDataFilter.h".}
## !!!Ignored construct:  virtual int GetInputFieldOutputAttributeData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputAttributeData  of  << this -> OutputAttributeData ) ; return this -> OutputAttributeData ; } ;
## Error: expected ';'!!!

proc SetOutputAttributeDataToCellData*(this: var vtkFieldDataToAttributeDataFilter) {.
    importcpp: "SetOutputAttributeDataToCellData",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc SetOutputAttributeDataToPointData*(this: var vtkFieldDataToAttributeDataFilter) {.
    importcpp: "SetOutputAttributeDataToPointData",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc SetScalarComponent*(this: var vtkFieldDataToAttributeDataFilter; comp: cint;
                        arrayName: cstring; arrayComp: cint; min: cint; max: cint;
                        normalize: cint) {.importcpp: "SetScalarComponent",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc SetScalarComponent*(this: var vtkFieldDataToAttributeDataFilter; comp: cint;
                        arrayName: cstring; arrayComp: cint) {.
    importcpp: "SetScalarComponent", header: "vtkFieldDataToAttributeDataFilter.h".}
proc GetScalarComponentArrayName*(this: var vtkFieldDataToAttributeDataFilter;
                                 comp: cint): cstring {.
    importcpp: "GetScalarComponentArrayName",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc GetScalarComponentArrayComponent*(this: var vtkFieldDataToAttributeDataFilter;
                                      comp: cint): cint {.
    importcpp: "GetScalarComponentArrayComponent",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc GetScalarComponentMinRange*(this: var vtkFieldDataToAttributeDataFilter;
                                comp: cint): cint {.
    importcpp: "GetScalarComponentMinRange",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc GetScalarComponentMaxRange*(this: var vtkFieldDataToAttributeDataFilter;
                                comp: cint): cint {.
    importcpp: "GetScalarComponentMaxRange",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc GetScalarComponentNormalizeFlag*(this: var vtkFieldDataToAttributeDataFilter;
                                     comp: cint): cint {.
    importcpp: "GetScalarComponentNormalizeFlag",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc SetVectorComponent*(this: var vtkFieldDataToAttributeDataFilter; comp: cint;
                        arrayName: cstring; arrayComp: cint; min: cint; max: cint;
                        normalize: cint) {.importcpp: "SetVectorComponent",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc SetVectorComponent*(this: var vtkFieldDataToAttributeDataFilter; comp: cint;
                        arrayName: cstring; arrayComp: cint) {.
    importcpp: "SetVectorComponent", header: "vtkFieldDataToAttributeDataFilter.h".}
proc GetVectorComponentArrayName*(this: var vtkFieldDataToAttributeDataFilter;
                                 comp: cint): cstring {.
    importcpp: "GetVectorComponentArrayName",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc GetVectorComponentArrayComponent*(this: var vtkFieldDataToAttributeDataFilter;
                                      comp: cint): cint {.
    importcpp: "GetVectorComponentArrayComponent",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc GetVectorComponentMinRange*(this: var vtkFieldDataToAttributeDataFilter;
                                comp: cint): cint {.
    importcpp: "GetVectorComponentMinRange",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc GetVectorComponentMaxRange*(this: var vtkFieldDataToAttributeDataFilter;
                                comp: cint): cint {.
    importcpp: "GetVectorComponentMaxRange",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc GetVectorComponentNormalizeFlag*(this: var vtkFieldDataToAttributeDataFilter;
                                     comp: cint): cint {.
    importcpp: "GetVectorComponentNormalizeFlag",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc SetNormalComponent*(this: var vtkFieldDataToAttributeDataFilter; comp: cint;
                        arrayName: cstring; arrayComp: cint; min: cint; max: cint;
                        normalize: cint) {.importcpp: "SetNormalComponent",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc SetNormalComponent*(this: var vtkFieldDataToAttributeDataFilter; comp: cint;
                        arrayName: cstring; arrayComp: cint) {.
    importcpp: "SetNormalComponent", header: "vtkFieldDataToAttributeDataFilter.h".}
proc GetNormalComponentArrayName*(this: var vtkFieldDataToAttributeDataFilter;
                                 comp: cint): cstring {.
    importcpp: "GetNormalComponentArrayName",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc GetNormalComponentArrayComponent*(this: var vtkFieldDataToAttributeDataFilter;
                                      comp: cint): cint {.
    importcpp: "GetNormalComponentArrayComponent",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc GetNormalComponentMinRange*(this: var vtkFieldDataToAttributeDataFilter;
                                comp: cint): cint {.
    importcpp: "GetNormalComponentMinRange",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc GetNormalComponentMaxRange*(this: var vtkFieldDataToAttributeDataFilter;
                                comp: cint): cint {.
    importcpp: "GetNormalComponentMaxRange",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc GetNormalComponentNormalizeFlag*(this: var vtkFieldDataToAttributeDataFilter;
                                     comp: cint): cint {.
    importcpp: "GetNormalComponentNormalizeFlag",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc SetTensorComponent*(this: var vtkFieldDataToAttributeDataFilter; comp: cint;
                        arrayName: cstring; arrayComp: cint; min: cint; max: cint;
                        normalize: cint) {.importcpp: "SetTensorComponent",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc SetTensorComponent*(this: var vtkFieldDataToAttributeDataFilter; comp: cint;
                        arrayName: cstring; arrayComp: cint) {.
    importcpp: "SetTensorComponent", header: "vtkFieldDataToAttributeDataFilter.h".}
proc GetTensorComponentArrayName*(this: var vtkFieldDataToAttributeDataFilter;
                                 comp: cint): cstring {.
    importcpp: "GetTensorComponentArrayName",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc GetTensorComponentArrayComponent*(this: var vtkFieldDataToAttributeDataFilter;
                                      comp: cint): cint {.
    importcpp: "GetTensorComponentArrayComponent",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc GetTensorComponentMinRange*(this: var vtkFieldDataToAttributeDataFilter;
                                comp: cint): cint {.
    importcpp: "GetTensorComponentMinRange",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc GetTensorComponentMaxRange*(this: var vtkFieldDataToAttributeDataFilter;
                                comp: cint): cint {.
    importcpp: "GetTensorComponentMaxRange",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc GetTensorComponentNormalizeFlag*(this: var vtkFieldDataToAttributeDataFilter;
                                     comp: cint): cint {.
    importcpp: "GetTensorComponentNormalizeFlag",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc SetTCoordComponent*(this: var vtkFieldDataToAttributeDataFilter; comp: cint;
                        arrayName: cstring; arrayComp: cint; min: cint; max: cint;
                        normalize: cint) {.importcpp: "SetTCoordComponent",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc SetTCoordComponent*(this: var vtkFieldDataToAttributeDataFilter; comp: cint;
                        arrayName: cstring; arrayComp: cint) {.
    importcpp: "SetTCoordComponent", header: "vtkFieldDataToAttributeDataFilter.h".}
proc GetTCoordComponentArrayName*(this: var vtkFieldDataToAttributeDataFilter;
                                 comp: cint): cstring {.
    importcpp: "GetTCoordComponentArrayName",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc GetTCoordComponentArrayComponent*(this: var vtkFieldDataToAttributeDataFilter;
                                      comp: cint): cint {.
    importcpp: "GetTCoordComponentArrayComponent",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc GetTCoordComponentMinRange*(this: var vtkFieldDataToAttributeDataFilter;
                                comp: cint): cint {.
    importcpp: "GetTCoordComponentMinRange",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc GetTCoordComponentMaxRange*(this: var vtkFieldDataToAttributeDataFilter;
                                comp: cint): cint {.
    importcpp: "GetTCoordComponentMaxRange",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc GetTCoordComponentNormalizeFlag*(this: var vtkFieldDataToAttributeDataFilter;
                                     comp: cint): cint {.
    importcpp: "GetTCoordComponentNormalizeFlag",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc SetInputFieldOutputAttributeDataDefaultNormalize*(
    this: var vtkFieldDataToAttributeDataFilter; _arg: vtkTypeBool) {.
    importcpp: "SetInputFieldOutputAttributeDataDefaultNormalize",
    header: "vtkFieldDataToAttributeDataFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetInputFieldOutputAttributeDataDefaultNormalize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DefaultNormalize  of  << this -> DefaultNormalize ) ; return this -> DefaultNormalize ; } ;
## Error: expected ';'!!!

proc DefaultNormalizeOn*(this: var vtkFieldDataToAttributeDataFilter) {.
    importcpp: "DefaultNormalizeOn", header: "vtkFieldDataToAttributeDataFilter.h".}
proc DefaultNormalizeOff*(this: var vtkFieldDataToAttributeDataFilter) {.
    importcpp: "DefaultNormalizeOff",
    header: "vtkFieldDataToAttributeDataFilter.h".}
  ## /@}
  ##  Helper functions, made public to support other classes
  ## *
  ##  Given an array of names of arrays in field data, return the common type
  ##  for these arrays. For example, if a vector is constructed of the three
  ##  type (char,int,float), the return type is float.
  ##
proc GetComponentsType*(numComp: cint; arrays: ptr ptr vtkDataArray): cint {.
    importcpp: "vtkFieldDataToAttributeDataFilter::GetComponentsType(@)",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc ConstructArray*(da: ptr vtkDataArray; comp: cint; fieldArray: ptr vtkDataArray;
                    fieldComp: cint; min: vtkIdType; max: vtkIdType; normalize: cint): cint {.
    importcpp: "vtkFieldDataToAttributeDataFilter::ConstructArray(@)",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc GetFieldArray*(fd: ptr vtkFieldData; name: cstring; comp: cint): ptr vtkDataArray {.
    importcpp: "vtkFieldDataToAttributeDataFilter::GetFieldArray(@)",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc SetArrayName*(self: ptr vtkObject; name: cstring; newName: cstring) {.
    importcpp: "vtkFieldDataToAttributeDataFilter::SetArrayName(@)",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc UpdateComponentRange*(da: ptr vtkDataArray; compRange: array[2, vtkIdType]): cint {.
    importcpp: "vtkFieldDataToAttributeDataFilter::UpdateComponentRange(@)",
    header: "vtkFieldDataToAttributeDataFilter.h".}
proc RequestUpdateExtent*(this: var vtkFieldDataToAttributeDataFilter;
                         a2: ptr vtkInformation; a3: ptr ptr vtkInformationVector;
                         a4: ptr vtkInformationVector): cint {.
    importcpp: "RequestUpdateExtent",
    header: "vtkFieldDataToAttributeDataFilter.h".}