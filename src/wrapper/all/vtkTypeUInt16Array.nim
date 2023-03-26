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
##  .NAME vtkTypeUInt16Array - dynamic, self-adjusting array of vtkTypeUInt16
##  .SECTION Description
##  vtkTypeUInt16Array is an array of values of type vtkTypeUInt16.  It
##  provides methods for insertion and retrieval of values and will
##  automatically resize itself to hold new data.
##
##  This array should be preferred for data of type UInt16 as this
##  array will use the correct underlying datatype based on the desired number of bits
##  and the current platform.  The superclass of this type will change depending on the
##  machine and compiler in use so that the data contained always uses the proper type.

import
  vtkCommonCoreModule, vtkType

when VTK_TYPE_UINT16 == VTK_UNSIGNED_SHORT:
  import
    vtkUnsignedShortArray

  const
    vtkTypeArrayBase* = vtkUnsignedShortArray
type
  vtkTypeUInt16Array* {.importcpp: "vtkTypeUInt16Array",
                       header: "vtkTypeUInt16Array.h", bycopy.} = object of vtkTypeArrayBase
    vtkTypeUInt16Array* {.importc: "vtkTypeUInt16Array".}: VTK_NEWINSTANCE


proc New*(): ptr vtkTypeUInt16Array {.importcpp: "vtkTypeUInt16Array::New(@)",
                                  header: "vtkTypeUInt16Array.h".}
type
  vtkTypeUInt16ArraySuperclass* = vtkTypeArrayBase

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTypeUInt16Array::IsTypeOf(@)", header: "vtkTypeUInt16Array.h".}
proc IsA*(this: var vtkTypeUInt16Array; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTypeUInt16Array.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTypeUInt16Array {.
    importcpp: "vtkTypeUInt16Array::SafeDownCast(@)",
    header: "vtkTypeUInt16Array.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTypeUInt16Array :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTypeArrayBase :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTypeUInt16Array :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTypeUInt16Array :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTypeUInt16Array; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTypeUInt16Array.h".}
proc FastDownCast*(source: ptr vtkAbstractArray): ptr vtkTypeUInt16Array {.
    importcpp: "vtkTypeUInt16Array::FastDownCast(@)",
    header: "vtkTypeUInt16Array.h".}
##  Define vtkArrayDownCast implementation:

vtkArrayDownCast_FastCastMacro(constructvtkTypeUInt16Array)