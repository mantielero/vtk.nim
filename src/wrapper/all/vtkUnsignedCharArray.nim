## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkUnsignedCharArray.h
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
##  @class   vtkUnsignedCharArray
##  @brief   dynamic, self-adjusting array of unsigned char
##
##  vtkUnsignedCharArray is an array of values of type unsigned char.
##  It provides methods for insertion and retrieval of values and will
##  automatically resize itself to hold new data.
##

import
  vtkAOSDataArrayTemplate, vtkCommonCoreModule, vtkDataArray

##  Fake the superclass for the wrappers.

when not defined(__VTK_WRAP__):
  const
    vtkDataArray* = vtkAOSDataArrayTemplate[cuchar]
type
  vtkUnsignedCharArray* {.importcpp: "vtkUnsignedCharArray",
                         header: "vtkUnsignedCharArray.h", bycopy.} = object of vtkDataArray
    vtkUnsignedCharArray* {.importc: "vtkUnsignedCharArray".}: VTK_NEWINSTANCE

  vtkUnsignedCharArraySuperclass* = vtkDataArray

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkUnsignedCharArray::IsTypeOf(@)",
    header: "vtkUnsignedCharArray.h".}
proc IsA*(this: var vtkUnsignedCharArray; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkUnsignedCharArray.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkUnsignedCharArray {.
    importcpp: "vtkUnsignedCharArray::SafeDownCast(@)",
    header: "vtkUnsignedCharArray.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkUnsignedCharArray :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataArray :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkUnsignedCharArray :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkUnsignedCharArray :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

## !!!Ignored construct:  # __VTK_WRAP__ [NewLine] # vtkDataArray [NewLine] # [NewLine] static vtkUnsignedCharArray * New ( ) ;
## Error: identifier expected, but got: #!!!

proc ExtendedNew*(): ptr vtkUnsignedCharArray {.
    importcpp: "vtkUnsignedCharArray::ExtendedNew(@)",
    header: "vtkUnsignedCharArray.h".}
proc PrintSelf*(this: var vtkUnsignedCharArray; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkUnsignedCharArray.h".}
## !!!Ignored construct:   This macro expands to the set of method declarations that
##  make up the interface of vtkAOSDataArrayTemplate, which is ignored
##  by the wrappers. # defined ( __VTK_WRAP__ ) || defined ( __WRAP_GCCXML__ ) [NewLine] vtkCreateWrappedArrayInterface ( unsigned char ) ;
## Error: token expected: ) but got: [identifier]!!!

proc FastDownCast*(source: ptr vtkAbstractArray): ptr vtkUnsignedCharArray {.
    importcpp: "vtkUnsignedCharArray::FastDownCast(@)",
    header: "vtkUnsignedCharArray.h".}
proc GetDataTypeValueMin*(): cuchar {.importcpp: "vtkUnsignedCharArray::GetDataTypeValueMin(@)",
                                   header: "vtkUnsignedCharArray.h".}
proc GetDataTypeValueMax*(): cuchar {.importcpp: "vtkUnsignedCharArray::GetDataTypeValueMax(@)",
                                   header: "vtkUnsignedCharArray.h".}
##  Define vtkArrayDownCast implementation:

vtkArrayDownCast_FastCastMacro(constructvtkUnsignedCharArray)