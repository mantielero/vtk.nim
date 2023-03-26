## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTypedArray.h.in
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
##  .NAME vtkTypeUInt8Array - dynamic, self-adjusting array of vtkTypeUInt8
##  .SECTION Description
##  vtkTypeUInt8Array is an array of values of type vtkTypeUInt8.  It
##  provides methods for insertion and retrieval of values and will
##  automatically resize itself to hold new data.
##
##  This array should be preferred for data of type UInt8 as this
##  array will use the correct underlying datatype based on the desired number of bits
##  and the current platform.  The superclass of this type will change depending on the
##  machine and compiler in use so that the data contained always uses the proper type.

import
  vtkCommonCoreModule, vtkType

when VTK_TYPE_UINT8 == VTK_UNSIGNED_CHAR:
  import
    vtkUnsignedCharArray

  const
    vtkTypeArrayBase* = vtkUnsignedCharArray
type
  vtkTypeUInt8Array* {.importcpp: "vtkTypeUInt8Array",
                      header: "vtkTypeUInt8Array.h", bycopy.} = object of vtkTypeArrayBase
    vtkTypeUInt8Array* {.importc: "vtkTypeUInt8Array".}: VTK_NEWINSTANCE


proc New*(): ptr vtkTypeUInt8Array {.importcpp: "vtkTypeUInt8Array::New(@)",
                                 header: "vtkTypeUInt8Array.h".}
type
  vtkTypeUInt8ArraySuperclass* = vtkTypeArrayBase

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTypeUInt8Array::IsTypeOf(@)", header: "vtkTypeUInt8Array.h".}
proc IsA*(this: var vtkTypeUInt8Array; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTypeUInt8Array.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTypeUInt8Array {.
    importcpp: "vtkTypeUInt8Array::SafeDownCast(@)", header: "vtkTypeUInt8Array.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTypeUInt8Array :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTypeArrayBase :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTypeUInt8Array :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTypeUInt8Array :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTypeUInt8Array; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTypeUInt8Array.h".}
proc FastDownCast*(source: ptr vtkAbstractArray): ptr vtkTypeUInt8Array {.
    importcpp: "vtkTypeUInt8Array::FastDownCast(@)", header: "vtkTypeUInt8Array.h".}
##  Define vtkArrayDownCast implementation:

vtkArrayDownCast_FastCastMacro(constructvtkTypeUInt8Array)