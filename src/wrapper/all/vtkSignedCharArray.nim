## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSignedCharArray.h
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
##  @class   vtkSignedCharArray
##  @brief   dynamic, self-adjusting array of signed char
##
##  vtkSignedCharArray is an array of values of type signed char.
##  It provides methods for insertion and retrieval of values and will
##  automatically resize itself to hold new data.
##

import
  vtkAOSDataArrayTemplate, vtkCommonCoreModule, vtkDataArray

##  Fake the superclass for the wrappers.

when not defined(__VTK_WRAP__):
  const
    vtkDataArray* = vtkAOSDataArrayTemplate[cchar]
type
  vtkSignedCharArray* {.importcpp: "vtkSignedCharArray",
                       header: "vtkSignedCharArray.h", bycopy.} = object of vtkDataArray
    vtkSignedCharArray* {.importc: "vtkSignedCharArray".}: VTK_NEWINSTANCE

  vtkSignedCharArraySuperclass* = vtkDataArray

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSignedCharArray::IsTypeOf(@)", header: "vtkSignedCharArray.h".}
proc IsA*(this: var vtkSignedCharArray; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkSignedCharArray.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSignedCharArray {.
    importcpp: "vtkSignedCharArray::SafeDownCast(@)",
    header: "vtkSignedCharArray.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSignedCharArray :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataArray :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSignedCharArray :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSignedCharArray :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

## !!!Ignored construct:  # __VTK_WRAP__ [NewLine] # vtkDataArray [NewLine] # [NewLine] static vtkSignedCharArray * New ( ) ;
## Error: identifier expected, but got: #!!!

proc ExtendedNew*(): ptr vtkSignedCharArray {.
    importcpp: "vtkSignedCharArray::ExtendedNew(@)",
    header: "vtkSignedCharArray.h".}
proc PrintSelf*(this: var vtkSignedCharArray; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSignedCharArray.h".}
## !!!Ignored construct:   This macro expands to the set of method declarations that
##  make up the interface of vtkAOSDataArrayTemplate, which is ignored
##  by the wrappers. # defined ( __VTK_WRAP__ ) || defined ( __WRAP_GCCXML__ ) [NewLine] vtkCreateWrappedArrayInterface ( signed char ) ;
## Error: token expected: ) but got: [identifier]!!!

proc FastDownCast*(source: ptr vtkAbstractArray): ptr vtkSignedCharArray {.
    importcpp: "vtkSignedCharArray::FastDownCast(@)",
    header: "vtkSignedCharArray.h".}
proc GetDataTypeValueMin*(): cchar {.importcpp: "vtkSignedCharArray::GetDataTypeValueMin(@)",
                                  header: "vtkSignedCharArray.h".}
proc GetDataTypeValueMax*(): cchar {.importcpp: "vtkSignedCharArray::GetDataTypeValueMax(@)",
                                  header: "vtkSignedCharArray.h".}
##  Define vtkArrayDownCast implementation:

vtkArrayDownCast_FastCastMacro(constructvtkSignedCharArray)