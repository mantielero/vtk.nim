## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLongArray.h
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
##  @class   vtkLongArray
##  @brief   dynamic, self-adjusting array of long
##
##  vtkLongArray is an array of values of type long.  It provides
##  methods for insertion and retrieval of values and will
##  automatically resize itself to hold new data.
##
##  The C++ standard does not define the exact size of the long type, so use
##  of this type directly is discouraged.  If an array of 32 bit integers is
##  needed, prefer vtkTypeInt32Array to this class.  If an array of 64 bit
##  integers is needed, prefer vtkTypeInt64Array to this class.
##

import
  vtkAOSDataArrayTemplate, vtkCommonCoreModule, vtkDataArray

##  Fake the superclass for the wrappers.

when not defined(__VTK_WRAP__):
  const
    vtkDataArray* = vtkAOSDataArrayTemplate[clong]
type
  vtkLongArray* {.importcpp: "vtkLongArray", header: "vtkLongArray.h", bycopy.} = object of vtkDataArray
    vtkLongArray* {.importc: "vtkLongArray".}: VTK_NEWINSTANCE
    when defined(__VTK_WRAP__) or defined(__WRAP_GCCXML__):
      long* {.importc: "long".}: vtkCreateWrappedArrayInterface

  vtkLongArraySuperclass* = vtkDataArray

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkLongArray::IsTypeOf(@)", header: "vtkLongArray.h".}
proc IsA*(this: var vtkLongArray; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkLongArray.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkLongArray {.
    importcpp: "vtkLongArray::SafeDownCast(@)", header: "vtkLongArray.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkLongArray :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataArray :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLongArray :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLongArray :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

## !!!Ignored construct:  # __VTK_WRAP__ [NewLine] # vtkDataArray [NewLine] # [NewLine] static vtkLongArray * New ( ) ;
## Error: identifier expected, but got: #!!!

proc ExtendedNew*(): ptr vtkLongArray {.importcpp: "vtkLongArray::ExtendedNew(@)",
                                    header: "vtkLongArray.h".}
proc PrintSelf*(this: var vtkLongArray; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkLongArray.h".}
proc FastDownCast*(source: ptr vtkAbstractArray): ptr vtkLongArray {.
    importcpp: "vtkLongArray::FastDownCast(@)", header: "vtkLongArray.h".}
proc GetDataTypeValueMin*(): clong {.importcpp: "vtkLongArray::GetDataTypeValueMin(@)",
                                  header: "vtkLongArray.h".}
proc GetDataTypeValueMax*(): clong {.importcpp: "vtkLongArray::GetDataTypeValueMax(@)",
                                  header: "vtkLongArray.h".}
##  Define vtkArrayDownCast implementation:

vtkArrayDownCast_FastCastMacro(constructvtkLongArray)