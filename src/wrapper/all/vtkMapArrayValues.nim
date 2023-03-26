## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMapArrayValues.h
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
##  @class   vtkMapArrayValues
##  @brief   Map values in an input array to different values in
##    an output array of (possibly) different type.
##
##
##  vtkMapArrayValues allows you to associate certain values of an attribute array
##  (on either a vertex, edge, point, or cell) with different values in a
##  newly created attribute array.
##
##  vtkMapArrayValues manages an internal STL map of vtkVariants that can be added to
##  or cleared. When this filter executes, each "key" is searched for in the
##  input array and the indices of the output array at which there were matches
##  the set to the mapped "value".
##
##  You can control whether the input array values are passed to the output
##  before the mapping occurs (using PassArray) or, if not, what value to set
##  the unmapped indices to (using FillValue).
##
##  One application of this filter is to help address the dirty data problem.
##  For example, using vtkMapArrayValues you could associate the vertex values
##  "Foo, John", "Foo, John.", and "John Foo" with a single entity.
##

import
  vtkPassInputTypeAlgorithm, vtkRenderingCoreModule

discard "forward decl of vtkMapType"
discard "forward decl of vtkVariant"
type
  vtkMapArrayValues* {.importcpp: "vtkMapArrayValues",
                      header: "vtkMapArrayValues.h", bycopy.} = object of vtkPassInputTypeAlgorithm
    vtkMapArrayValues* {.importc: "vtkMapArrayValues".}: VTK_NEWINSTANCE
    ##  PIMPL idiom to hide map implementation.

  vtkMapArrayValuesSuperclass* = vtkPassInputTypeAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMapArrayValues::IsTypeOf(@)", header: "vtkMapArrayValues.h".}
proc IsA*(this: var vtkMapArrayValues; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkMapArrayValues.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMapArrayValues {.
    importcpp: "vtkMapArrayValues::SafeDownCast(@)", header: "vtkMapArrayValues.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMapArrayValues :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPassInputTypeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMapArrayValues :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMapArrayValues :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkMapArrayValues; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkMapArrayValues.h".}
proc New*(): ptr vtkMapArrayValues {.importcpp: "vtkMapArrayValues::New(@)",
                                 header: "vtkMapArrayValues.h".}
proc SetFieldType*(this: var vtkMapArrayValues; _arg: cint) {.
    importcpp: "SetFieldType", header: "vtkMapArrayValues.h".}
## !!!Ignored construct:  virtual int GetFieldType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FieldType  of  << this -> FieldType ) ; return this -> FieldType ; } ;
## Error: expected ';'!!!

proc SetFieldTypePassArray*(this: var vtkMapArrayValues; _arg: vtkTypeBool) {.
    importcpp: "SetFieldTypePassArray", header: "vtkMapArrayValues.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetFieldTypePassArray ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassArray  of  << this -> PassArray ) ; return this -> PassArray ; } ;
## Error: expected ';'!!!

proc PassArrayOn*(this: var vtkMapArrayValues) {.importcpp: "PassArrayOn",
    header: "vtkMapArrayValues.h".}
proc PassArrayOff*(this: var vtkMapArrayValues) {.importcpp: "PassArrayOff",
    header: "vtkMapArrayValues.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get whether to copy the data from the input array to the output array
  ##  before the mapping occurs. If turned off, FillValue is used to initialize
  ##  any unmapped array indices. Default is -1.
  ##
proc SetFieldTypePassArrayFillValue*(this: var vtkMapArrayValues; _arg: cdouble) {.
    importcpp: "SetFieldTypePassArrayFillValue", header: "vtkMapArrayValues.h".}
## !!!Ignored construct:  virtual double GetFieldTypePassArrayFillValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FillValue  of  << this -> FillValue ) ; return this -> FillValue ; } ;
## Error: expected ';'!!!

proc SetInputArrayName*(this: var vtkMapArrayValues; _arg: cstring) {.
    importcpp: "SetInputArrayName", header: "vtkMapArrayValues.h".}
proc GetInputArrayName*(this: var vtkMapArrayValues): cstring {.
    importcpp: "GetInputArrayName", header: "vtkMapArrayValues.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the name of the output array. Default is "ArrayMap".
  ##
proc SetInputArrayNameOutputArrayName*(this: var vtkMapArrayValues; _arg: cstring) {.
    importcpp: "SetInputArrayNameOutputArrayName", header: "vtkMapArrayValues.h".}
proc GetInputArrayNameOutputArrayName*(this: var vtkMapArrayValues): cstring {.
    importcpp: "GetInputArrayNameOutputArrayName", header: "vtkMapArrayValues.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the type of the output array. See vtkSetGet.h for possible values.
  ##  Default is VTK_INT.
  ##
## !!!Ignored construct:  virtual int GetFieldTypePassArrayFillValueOutputArrayType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputArrayType  of  << this -> OutputArrayType ) ; return this -> OutputArrayType ; } ;
## Error: expected ';'!!!

proc SetFieldTypePassArrayFillValueOutputArrayType*(this: var vtkMapArrayValues;
    _arg: cint) {.importcpp: "SetFieldTypePassArrayFillValueOutputArrayType",
                header: "vtkMapArrayValues.h".}
  ## /@}
  ## /@{
  ## *
  ##  Add to the internal STL map. "from" should be a value in the input array and
  ##  "to" should be the new value it gets assigned in the output array.
  ##
proc AddToMap*(this: var vtkMapArrayValues; `from`: vtkVariant; to: vtkVariant) {.
    importcpp: "AddToMap", header: "vtkMapArrayValues.h".}
proc AddToMap*(this: var vtkMapArrayValues; `from`: cint; to: cint) {.
    importcpp: "AddToMap", header: "vtkMapArrayValues.h".}
proc AddToMap*(this: var vtkMapArrayValues; `from`: cint; to: cstring) {.
    importcpp: "AddToMap", header: "vtkMapArrayValues.h".}
proc AddToMap*(this: var vtkMapArrayValues; `from`: cstring; to: cint) {.
    importcpp: "AddToMap", header: "vtkMapArrayValues.h".}
proc AddToMap*(this: var vtkMapArrayValues; `from`: cstring; to: cstring) {.
    importcpp: "AddToMap", header: "vtkMapArrayValues.h".}
proc ClearMap*(this: var vtkMapArrayValues) {.importcpp: "ClearMap",
    header: "vtkMapArrayValues.h".}
proc GetMapSize*(this: var vtkMapArrayValues): cint {.importcpp: "GetMapSize",
    header: "vtkMapArrayValues.h".}
type
  vtkMapArrayValuesFieldType* {.size: sizeof(cint),
                               importcpp: "vtkMapArrayValues::FieldType",
                               header: "vtkMapArrayValues.h".} = enum
    POINT_DATA = 0, CELL_DATA = 1, VERTEX_DATA = 2, EDGE_DATA = 3, ROW_DATA = 4,
    NUM_ATTRIBUTE_LOCS

