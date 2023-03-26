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
##  .NAME vtkTypeInt8Array - dynamic, self-adjusting array of vtkTypeInt8
##  .SECTION Description
##  vtkTypeInt8Array is an array of values of type vtkTypeInt8.  It
##  provides methods for insertion and retrieval of values and will
##  automatically resize itself to hold new data.
##
##  This array should be preferred for data of type Int8 as this
##  array will use the correct underlying datatype based on the desired number of bits
##  and the current platform.  The superclass of this type will change depending on the
##  machine and compiler in use so that the data contained always uses the proper type.

import
  vtkCommonCoreModule, vtkType

when VTK_TYPE_INT8 == VTK_CHAR:
  import
    vtkCharArray

  const
    vtkTypeArrayBase* = vtkCharArray
else:
  import
    vtkSignedCharArray

  const
    vtkTypeArrayBase* = vtkSignedCharArray
type
  vtkTypeInt8Array* {.importcpp: "vtkTypeInt8Array", header: "vtkTypeInt8Array.h",
                     bycopy.} = object of vtkTypeArrayBase
    vtkTypeInt8Array* {.importc: "vtkTypeInt8Array".}: VTK_NEWINSTANCE


proc New*(): ptr vtkTypeInt8Array {.importcpp: "vtkTypeInt8Array::New(@)",
                                header: "vtkTypeInt8Array.h".}
type
  vtkTypeInt8ArraySuperclass* = vtkTypeArrayBase

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTypeInt8Array::IsTypeOf(@)", header: "vtkTypeInt8Array.h".}
proc IsA*(this: var vtkTypeInt8Array; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkTypeInt8Array.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTypeInt8Array {.
    importcpp: "vtkTypeInt8Array::SafeDownCast(@)", header: "vtkTypeInt8Array.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTypeInt8Array :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTypeArrayBase :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTypeInt8Array :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTypeInt8Array :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTypeInt8Array; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTypeInt8Array.h".}
proc FastDownCast*(source: ptr vtkAbstractArray): ptr vtkTypeInt8Array {.
    importcpp: "vtkTypeInt8Array::FastDownCast(@)", header: "vtkTypeInt8Array.h".}
##  Define vtkArrayDownCast implementation:

vtkArrayDownCast_FastCastMacro(constructvtkTypeInt8Array)