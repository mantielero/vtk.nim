## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkUnsignedLongLongArray.h
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
##  @class   vtkUnsignedLongLongArray
##  @brief   dynamic, self-adjusting array of unsigned long long
##
##  vtkUnsignedLongLongArray is an array of values of type unsigned long long.
##  It provides methods for insertion and retrieval of values and will
##  automatically resize itself to hold new data.
##
##  This class should not be used directly, as it only exists on systems
##  where the unsigned long long type is defined.  If you need an unsigned
##  64 bit integer data array, use vtkTypeUInt64Array instead.
##

import
  vtkAOSDataArrayTemplate, vtkCommonCoreModule, vtkDataArray

##  Fake the superclass for the wrappers.

when not defined(__VTK_WRAP__):
  const
    vtkDataArray* = vtkAOSDataArrayTemplate[culonglong]
type
  vtkUnsignedLongLongArray* {.importcpp: "vtkUnsignedLongLongArray",
                             header: "vtkUnsignedLongLongArray.h", bycopy.} = object of vtkDataArray
    vtkUnsignedLongLongArray* {.importc: "vtkUnsignedLongLongArray".}: VTK_NEWINSTANCE

  vtkUnsignedLongLongArraySuperclass* = vtkDataArray

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkUnsignedLongLongArray::IsTypeOf(@)",
    header: "vtkUnsignedLongLongArray.h".}
proc IsA*(this: var vtkUnsignedLongLongArray; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkUnsignedLongLongArray.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkUnsignedLongLongArray {.
    importcpp: "vtkUnsignedLongLongArray::SafeDownCast(@)",
    header: "vtkUnsignedLongLongArray.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkUnsignedLongLongArray :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataArray :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkUnsignedLongLongArray :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkUnsignedLongLongArray :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

## !!!Ignored construct:  # __VTK_WRAP__ [NewLine] # vtkDataArray [NewLine] # [NewLine] static vtkUnsignedLongLongArray * New ( ) ;
## Error: identifier expected, but got: #!!!

proc ExtendedNew*(): ptr vtkUnsignedLongLongArray {.
    importcpp: "vtkUnsignedLongLongArray::ExtendedNew(@)",
    header: "vtkUnsignedLongLongArray.h".}
proc PrintSelf*(this: var vtkUnsignedLongLongArray; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkUnsignedLongLongArray.h".}
## !!!Ignored construct:   This macro expands to the set of method declarations that
##  make up the interface of vtkAOSDataArrayTemplate, which is ignored
##  by the wrappers. # defined ( __VTK_WRAP__ ) || defined ( __WRAP_GCCXML__ ) [NewLine] vtkCreateWrappedArrayInterface ( unsigned long long ) ;
## Error: token expected: ) but got: [identifier]!!!

proc FastDownCast*(source: ptr vtkAbstractArray): ptr vtkUnsignedLongLongArray {.
    importcpp: "vtkUnsignedLongLongArray::FastDownCast(@)",
    header: "vtkUnsignedLongLongArray.h".}
proc GetDataTypeValueMin*(): culonglong {.importcpp: "vtkUnsignedLongLongArray::GetDataTypeValueMin(@)",
                                       header: "vtkUnsignedLongLongArray.h".}
proc GetDataTypeValueMax*(): culonglong {.importcpp: "vtkUnsignedLongLongArray::GetDataTypeValueMax(@)",
                                       header: "vtkUnsignedLongLongArray.h".}
##  Define vtkArrayDownCast implementation:

vtkArrayDownCast_FastCastMacro(constructvtkUnsignedLongLongArray)