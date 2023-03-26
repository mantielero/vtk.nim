## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLongLongArray.h
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
##  @class   vtkLongLongArray
##  @brief   dynamic, self-adjusting array of long long
##
##  vtkLongLongArray is an array of values of type long long.
##  It provides methods for insertion and retrieval of values and will
##  automatically resize itself to hold new data.
##
##  This class should not be used directly, as it only exists on systems
##  where the long long type is defined.  If you need a 64 bit integer
##  data array, use vtkTypeInt64Array instead.
##

import
  vtkAOSDataArrayTemplate, vtkCommonCoreModule, vtkDataArray

##  Fake the superclass for the wrappers.

when not defined(__VTK_WRAP__):
  const
    vtkDataArray* = vtkAOSDataArrayTemplate[clonglong]
type
  vtkLongLongArray* {.importcpp: "vtkLongLongArray", header: "vtkLongLongArray.h",
                     bycopy.} = object of vtkDataArray
    vtkLongLongArray* {.importc: "vtkLongLongArray".}: VTK_NEWINSTANCE

  vtkLongLongArraySuperclass* = vtkDataArray

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkLongLongArray::IsTypeOf(@)", header: "vtkLongLongArray.h".}
proc IsA*(this: var vtkLongLongArray; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkLongLongArray.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkLongLongArray {.
    importcpp: "vtkLongLongArray::SafeDownCast(@)", header: "vtkLongLongArray.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkLongLongArray :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataArray :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLongLongArray :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLongLongArray :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

## !!!Ignored construct:  # __VTK_WRAP__ [NewLine] # vtkDataArray [NewLine] # [NewLine] static vtkLongLongArray * New ( ) ;
## Error: identifier expected, but got: #!!!

proc ExtendedNew*(): ptr vtkLongLongArray {.importcpp: "vtkLongLongArray::ExtendedNew(@)",
                                        header: "vtkLongLongArray.h".}
proc PrintSelf*(this: var vtkLongLongArray; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkLongLongArray.h".}
## !!!Ignored construct:   This macro expands to the set of method declarations that
##  make up the interface of vtkAOSDataArrayTemplate, which is ignored
##  by the wrappers. # defined ( __VTK_WRAP__ ) || defined ( __WRAP_GCCXML__ ) [NewLine] vtkCreateWrappedArrayInterface ( long long ) ;
## Error: token expected: ) but got: [identifier]!!!

proc FastDownCast*(source: ptr vtkAbstractArray): ptr vtkLongLongArray {.
    importcpp: "vtkLongLongArray::FastDownCast(@)", header: "vtkLongLongArray.h".}
proc GetDataTypeValueMin*(): clonglong {.importcpp: "vtkLongLongArray::GetDataTypeValueMin(@)",
                                      header: "vtkLongLongArray.h".}
proc GetDataTypeValueMax*(): clonglong {.importcpp: "vtkLongLongArray::GetDataTypeValueMax(@)",
                                      header: "vtkLongLongArray.h".}
##  Define vtkArrayDownCast implementation:

vtkArrayDownCast_FastCastMacro(constructvtkLongLongArray)