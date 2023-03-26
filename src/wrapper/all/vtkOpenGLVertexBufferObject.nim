## =========================================================================
##
##   Program:   Visualization Toolkit
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

import
  vtkOpenGLBufferObject, vtkRenderingOpenGL2Module, vtkWeakPointer

discard "forward decl of vtkOpenGLVertexBufferObjectCache"
type
  vtkFourByteUnion* {.importcpp: "vtkFourByteUnion",
                     header: "vtkOpenGLVertexBufferObject.h", bycopy, union.} = object
    c* {.importc: "c".}: array[4, cuchar]
    s* {.importc: "s".}: array[2, cshort]
    f* {.importc: "f".}: cfloat


discard "forward decl of vtkCamera"
discard "forward decl of vtkProp3D"
type
  vtkOpenGLVertexBufferObject* {.importcpp: "vtkOpenGLVertexBufferObject",
                                header: "vtkOpenGLVertexBufferObject.h", bycopy.} = object of vtkOpenGLBufferObject
    vtkOpenGLVertexBufferObject* {.importc: "vtkOpenGLVertexBufferObject".}: VTK_NEWINSTANCE
    ##  the data
    ##  The size of a complete tuple


proc New*(): ptr vtkOpenGLVertexBufferObject {.
    importcpp: "vtkOpenGLVertexBufferObject::New(@)",
    header: "vtkOpenGLVertexBufferObject.h".}
type
  vtkOpenGLVertexBufferObjectSuperclass* = vtkOpenGLBufferObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOpenGLVertexBufferObject::IsTypeOf(@)",
    header: "vtkOpenGLVertexBufferObject.h".}
proc IsA*(this: var vtkOpenGLVertexBufferObject; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkOpenGLVertexBufferObject.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOpenGLVertexBufferObject {.
    importcpp: "vtkOpenGLVertexBufferObject::SafeDownCast(@)",
    header: "vtkOpenGLVertexBufferObject.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOpenGLVertexBufferObject :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkOpenGLBufferObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenGLVertexBufferObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenGLVertexBufferObject :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOpenGLVertexBufferObject; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkOpenGLVertexBufferObject.h".}
proc UploadDataArray*(this: var vtkOpenGLVertexBufferObject; array: ptr vtkDataArray) {.
    importcpp: "UploadDataArray", header: "vtkOpenGLVertexBufferObject.h".}
proc AppendDataArray*(this: var vtkOpenGLVertexBufferObject; array: ptr vtkDataArray) {.
    importcpp: "AppendDataArray", header: "vtkOpenGLVertexBufferObject.h".}
## !!!Ignored construct:   Get the mtime when this VBO was loaded virtual vtkTimeStamp GetUploadTimeUploadTime ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UploadTime  of  << this -> UploadTime ) ; return this -> UploadTime ; } ;
## Error: expected ';'!!!

type
  vtkOpenGLVertexBufferObjectShiftScaleMethod* {.size: sizeof(cint),
      importcpp: "vtkOpenGLVertexBufferObject::ShiftScaleMethod",
      header: "vtkOpenGLVertexBufferObject.h".} = enum
    DISABLE_SHIFT_SCALE,      ## !< Do not shift/scale point coordinates. Ever!
    AUTO_SHIFT_SCALE,         ## !< The default, automatic computation.
    ALWAYS_AUTO_SHIFT_SCALE,  ## !< Always shift scale using auto computed values
    MANUAL_SHIFT_SCALE,       ## !< Manual shift/scale (for use with AppendVBO)
    AUTO_SHIFT,               ## !< Only Apply the shift
    NEAR_PLANE_SHIFT_SCALE,   ## !< Shift scale based on camera settings
    FOCAL_POINT_SHIFT_SCALE   ## !< Shift scale based on camera settings


proc GetCoordShiftAndScaleEnabled*(this: var vtkOpenGLVertexBufferObject): bool {.
    importcpp: "GetCoordShiftAndScaleEnabled",
    header: "vtkOpenGLVertexBufferObject.h".}
proc GetCoordShiftAndScaleMethod*(this: var vtkOpenGLVertexBufferObject): vtkOpenGLVertexBufferObjectShiftScaleMethod {.
    importcpp: "GetCoordShiftAndScaleMethod",
    header: "vtkOpenGLVertexBufferObject.h".}
proc SetCoordShiftAndScaleMethod*(this: var vtkOpenGLVertexBufferObject; meth: vtkOpenGLVertexBufferObjectShiftScaleMethod) {.
    importcpp: "SetCoordShiftAndScaleMethod",
    header: "vtkOpenGLVertexBufferObject.h".}
proc SetShift*(this: var vtkOpenGLVertexBufferObject; shift: vector[cdouble]) {.
    importcpp: "SetShift", header: "vtkOpenGLVertexBufferObject.h".}
proc SetShift*(this: var vtkOpenGLVertexBufferObject; x: cdouble; y: cdouble; z: cdouble) {.
    importcpp: "SetShift", header: "vtkOpenGLVertexBufferObject.h".}
proc SetScale*(this: var vtkOpenGLVertexBufferObject; scale: vector[cdouble]) {.
    importcpp: "SetScale", header: "vtkOpenGLVertexBufferObject.h".}
proc SetScale*(this: var vtkOpenGLVertexBufferObject; x: cdouble; y: cdouble; z: cdouble) {.
    importcpp: "SetScale", header: "vtkOpenGLVertexBufferObject.h".}
proc GetShift*(this: var vtkOpenGLVertexBufferObject): vector[cdouble] {.
    importcpp: "GetShift", header: "vtkOpenGLVertexBufferObject.h".}
proc GetScale*(this: var vtkOpenGLVertexBufferObject): vector[cdouble] {.
    importcpp: "GetScale", header: "vtkOpenGLVertexBufferObject.h".}
proc UpdateShiftScale*(this: var vtkOpenGLVertexBufferObject; da: ptr vtkDataArray) {.
    importcpp: "UpdateShiftScale", header: "vtkOpenGLVertexBufferObject.h".}
proc SetGlobalCoordShiftAndScaleEnabled*(val: vtkTypeBool) {.importcpp: "vtkOpenGLVertexBufferObject::SetGlobalCoordShiftAndScaleEnabled(@)",
    header: "vtkOpenGLVertexBufferObject.h".}
proc GlobalCoordShiftAndScaleEnabledOn*() {.importcpp: "vtkOpenGLVertexBufferObject::GlobalCoordShiftAndScaleEnabledOn(@)",
    header: "vtkOpenGLVertexBufferObject.h".}
proc GlobalCoordShiftAndScaleEnabledOff*() {.importcpp: "vtkOpenGLVertexBufferObject::GlobalCoordShiftAndScaleEnabledOff(@)",
    header: "vtkOpenGLVertexBufferObject.h".}
proc GetGlobalCoordShiftAndScaleEnabled*(): vtkTypeBool {.importcpp: "vtkOpenGLVertexBufferObject::GetGlobalCoordShiftAndScaleEnabled(@)",
    header: "vtkOpenGLVertexBufferObject.h".}
proc SetDataType*(this: var vtkOpenGLVertexBufferObject; v: cint) {.
    importcpp: "SetDataType", header: "vtkOpenGLVertexBufferObject.h".}
## !!!Ignored construct:  virtual int GetUploadTimeUploadTimeDataType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DataType  of  << this -> DataType ) ; return this -> DataType ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:   Get the size in bytes of the data type virtual unsigned int GetUploadTimeUploadTimeDataTypeDataTypeSizeDataTypeSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DataTypeSize  of  << this -> DataTypeSize ) ; return this -> DataTypeSize ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:   How many tuples in the VBO virtual unsigned int GetUploadTimeUploadTimeDataTypeDataTypeSizeDataTypeSizeNumberOfTuplesNumberOfTuples ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfTuples  of  << this -> NumberOfTuples ) ; return this -> NumberOfTuples ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:   How many components in the VBO virtual unsigned int GetUploadTimeUploadTimeDataTypeDataTypeSizeDataTypeSizeNumberOfTuplesNumberOfTuplesNumberOfComponentsNumberOfComponents ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfComponents  of  << this -> NumberOfComponents ) ; return this -> NumberOfComponents ; } ;
## Error: expected ';'!!!

proc SetStride*(this: var vtkOpenGLVertexBufferObject; _arg: cuint) {.
    importcpp: "SetStride", header: "vtkOpenGLVertexBufferObject.h".}
## !!!Ignored construct:  virtual unsigned int GetUploadTimeUploadTimeDataTypeDataTypeSizeDataTypeSizeNumberOfTuplesNumberOfTuplesNumberOfComponentsNumberOfComponentsStride ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Stride  of  << this -> Stride ) ; return this -> Stride ; } ;
## Error: expected ';'!!!

proc GetPackedVBO*(this: var vtkOpenGLVertexBufferObject): var vector[cfloat] {.
    importcpp: "GetPackedVBO", header: "vtkOpenGLVertexBufferObject.h".}
proc UploadVBO*(this: var vtkOpenGLVertexBufferObject) {.importcpp: "UploadVBO",
    header: "vtkOpenGLVertexBufferObject.h".}
proc SetCache*(this: var vtkOpenGLVertexBufferObject;
              cache: ptr vtkOpenGLVertexBufferObjectCache) {.importcpp: "SetCache",
    header: "vtkOpenGLVertexBufferObject.h".}
proc SetCamera*(this: var vtkOpenGLVertexBufferObject; cam: ptr vtkCamera) {.
    importcpp: "SetCamera", header: "vtkOpenGLVertexBufferObject.h".}
proc SetProp3D*(this: var vtkOpenGLVertexBufferObject; prop3d: ptr vtkProp3D) {.
    importcpp: "SetProp3D", header: "vtkOpenGLVertexBufferObject.h".}