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
##  .NAME vtkTypeFloat32Array - dynamic, self-adjusting array of vtkTypeFloat32
##  .SECTION Description
##  vtkTypeFloat32Array is an array of values of type vtkTypeFloat32.  It
##  provides methods for insertion and retrieval of values and will
##  automatically resize itself to hold new data.
##
##  This array should be preferred for data of type Float32 as this
##  array will use the correct underlying datatype based on the desired number of bits
##  and the current platform.  The superclass of this type will change depending on the
##  machine and compiler in use so that the data contained always uses the proper type.

import
  vtkCommonCoreModule, vtkType

when VTK_TYPE_FLOAT32 == VTK_FLOAT:
  import
    vtkFloatArray

  const
    vtkTypeArrayBase* = vtkFloatArray
type
  vtkTypeFloat32Array* {.importcpp: "vtkTypeFloat32Array",
                        header: "vtkTypeFloat32Array.h", bycopy.} = object of vtkTypeArrayBase
    vtkTypeFloat32Array* {.importc: "vtkTypeFloat32Array".}: VTK_NEWINSTANCE


proc New*(): ptr vtkTypeFloat32Array {.importcpp: "vtkTypeFloat32Array::New(@)",
                                   header: "vtkTypeFloat32Array.h".}
type
  vtkTypeFloat32ArraySuperclass* = vtkTypeArrayBase

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTypeFloat32Array::IsTypeOf(@)", header: "vtkTypeFloat32Array.h".}
proc IsA*(this: var vtkTypeFloat32Array; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTypeFloat32Array.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTypeFloat32Array {.
    importcpp: "vtkTypeFloat32Array::SafeDownCast(@)",
    header: "vtkTypeFloat32Array.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTypeFloat32Array :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTypeArrayBase :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTypeFloat32Array :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTypeFloat32Array :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTypeFloat32Array; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTypeFloat32Array.h".}
proc FastDownCast*(source: ptr vtkAbstractArray): ptr vtkTypeFloat32Array {.
    importcpp: "vtkTypeFloat32Array::FastDownCast(@)",
    header: "vtkTypeFloat32Array.h".}
##  Define vtkArrayDownCast implementation:

vtkArrayDownCast_FastCastMacro(constructvtkTypeFloat32Array)