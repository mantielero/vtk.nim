## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDoubleArray.h
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
##  @class   vtkDoubleArray
##  @brief   dynamic, self-adjusting array of double
##
##  vtkDoubleArray is an array of values of type double.  It provides
##  methods for insertion and retrieval of values and will
##  automatically resize itself to hold new data.
##

import
  vtkAOSDataArrayTemplate, vtkCommonCoreModule, vtkDataArray

##  Fake the superclass for the wrappers.

when not defined(__VTK_WRAP__):
  const
    vtkDataArray* = vtkAOSDataArrayTemplate[cdouble]
type
  vtkDoubleArray* {.importcpp: "vtkDoubleArray", header: "vtkDoubleArray.h", bycopy.} = object of vtkDataArray
    vtkDoubleArray* {.importc: "vtkDoubleArray".}: VTK_NEWINSTANCE
    when defined(__VTK_WRAP__) or defined(__WRAP_GCCXML__):
      double* {.importc: "double".}: vtkCreateWrappedArrayInterface

  vtkDoubleArraySuperclass* = vtkDataArray

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDoubleArray::IsTypeOf(@)", header: "vtkDoubleArray.h".}
proc IsA*(this: var vtkDoubleArray; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkDoubleArray.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDoubleArray {.
    importcpp: "vtkDoubleArray::SafeDownCast(@)", header: "vtkDoubleArray.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDoubleArray :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataArray :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDoubleArray :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDoubleArray :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

## !!!Ignored construct:  # __VTK_WRAP__ [NewLine] # vtkDataArray [NewLine] # [NewLine] static vtkDoubleArray * New ( ) ;
## Error: identifier expected, but got: #!!!

proc ExtendedNew*(): ptr vtkDoubleArray {.importcpp: "vtkDoubleArray::ExtendedNew(@)",
                                      header: "vtkDoubleArray.h".}
proc PrintSelf*(this: var vtkDoubleArray; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkDoubleArray.h".}
proc FastDownCast*(source: ptr vtkAbstractArray): ptr vtkDoubleArray {.
    importcpp: "vtkDoubleArray::FastDownCast(@)", header: "vtkDoubleArray.h".}
proc GetDataTypeValueMin*(): cdouble {.importcpp: "vtkDoubleArray::GetDataTypeValueMin(@)",
                                    header: "vtkDoubleArray.h".}
proc GetDataTypeValueMax*(): cdouble {.importcpp: "vtkDoubleArray::GetDataTypeValueMax(@)",
                                    header: "vtkDoubleArray.h".}
##  Define vtkArrayDownCast implementation:

vtkArrayDownCast_FastCastMacro(constructvtkDoubleArray)