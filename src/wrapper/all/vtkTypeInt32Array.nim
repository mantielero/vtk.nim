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
##  .NAME vtkTypeInt32Array - dynamic, self-adjusting array of vtkTypeInt32
##  .SECTION Description
##  vtkTypeInt32Array is an array of values of type vtkTypeInt32.  It
##  provides methods for insertion and retrieval of values and will
##  automatically resize itself to hold new data.
##
##  This array should be preferred for data of type Int32 as this
##  array will use the correct underlying datatype based on the desired number of bits
##  and the current platform.  The superclass of this type will change depending on the
##  machine and compiler in use so that the data contained always uses the proper type.

import
  vtkCommonCoreModule, vtkType

when VTK_TYPE_INT32 == VTK_INT:
  import
    vtkIntArray

  const
    vtkTypeArrayBase* = vtkIntArray
type
  vtkTypeInt32Array* {.importcpp: "vtkTypeInt32Array",
                      header: "vtkTypeInt32Array.h", bycopy.} = object of vtkTypeArrayBase
    vtkTypeInt32Array* {.importc: "vtkTypeInt32Array".}: VTK_NEWINSTANCE


proc New*(): ptr vtkTypeInt32Array {.importcpp: "vtkTypeInt32Array::New(@)",
                                 header: "vtkTypeInt32Array.h".}
type
  vtkTypeInt32ArraySuperclass* = vtkTypeArrayBase

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTypeInt32Array::IsTypeOf(@)", header: "vtkTypeInt32Array.h".}
proc IsA*(this: var vtkTypeInt32Array; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTypeInt32Array.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTypeInt32Array {.
    importcpp: "vtkTypeInt32Array::SafeDownCast(@)", header: "vtkTypeInt32Array.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTypeInt32Array :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTypeArrayBase :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTypeInt32Array :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTypeInt32Array :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTypeInt32Array; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTypeInt32Array.h".}
proc FastDownCast*(source: ptr vtkAbstractArray): ptr vtkTypeInt32Array {.
    importcpp: "vtkTypeInt32Array::FastDownCast(@)", header: "vtkTypeInt32Array.h".}
##  Define vtkArrayDownCast implementation:

vtkArrayDownCast_FastCastMacro(constructvtkTypeInt32Array)