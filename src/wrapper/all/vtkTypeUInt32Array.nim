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
##  .NAME vtkTypeUInt32Array - dynamic, self-adjusting array of vtkTypeUInt32
##  .SECTION Description
##  vtkTypeUInt32Array is an array of values of type vtkTypeUInt32.  It
##  provides methods for insertion and retrieval of values and will
##  automatically resize itself to hold new data.
##
##  This array should be preferred for data of type UInt32 as this
##  array will use the correct underlying datatype based on the desired number of bits
##  and the current platform.  The superclass of this type will change depending on the
##  machine and compiler in use so that the data contained always uses the proper type.

import
  vtkCommonCoreModule, vtkType

when VTK_TYPE_UINT32 == VTK_UNSIGNED_INT:
  import
    vtkUnsignedIntArray

  const
    vtkTypeArrayBase* = vtkUnsignedIntArray
type
  vtkTypeUInt32Array* {.importcpp: "vtkTypeUInt32Array",
                       header: "vtkTypeUInt32Array.h", bycopy.} = object of vtkTypeArrayBase
    vtkTypeUInt32Array* {.importc: "vtkTypeUInt32Array".}: VTK_NEWINSTANCE


proc New*(): ptr vtkTypeUInt32Array {.importcpp: "vtkTypeUInt32Array::New(@)",
                                  header: "vtkTypeUInt32Array.h".}
type
  vtkTypeUInt32ArraySuperclass* = vtkTypeArrayBase

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTypeUInt32Array::IsTypeOf(@)", header: "vtkTypeUInt32Array.h".}
proc IsA*(this: var vtkTypeUInt32Array; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTypeUInt32Array.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTypeUInt32Array {.
    importcpp: "vtkTypeUInt32Array::SafeDownCast(@)",
    header: "vtkTypeUInt32Array.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTypeUInt32Array :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTypeArrayBase :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTypeUInt32Array :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTypeUInt32Array :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTypeUInt32Array; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTypeUInt32Array.h".}
proc FastDownCast*(source: ptr vtkAbstractArray): ptr vtkTypeUInt32Array {.
    importcpp: "vtkTypeUInt32Array::FastDownCast(@)",
    header: "vtkTypeUInt32Array.h".}
##  Define vtkArrayDownCast implementation:

vtkArrayDownCast_FastCastMacro(constructvtkTypeUInt32Array)