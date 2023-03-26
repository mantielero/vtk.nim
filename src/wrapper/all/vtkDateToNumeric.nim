## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDateToNumeric.h
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
##  @class   vtkDateToNumeric
##  @brief   Converts string dates to numeric values
##
##
##  This filter preserves all the topology of the input. All string arrays are
##  examined to see if their value is a date. If so an array is added with the
##  numeric value of that date. The new array is of type double and its name
##  is the source arrays name with _numeric appended.
##
##  default date formats parsed include
##
##    "%Y-%m-%d %H:%M:%S"
##    "%d/%m/%Y %H:%M:%S"
##

import
  vtkDataObject, vtkFiltersGeneralModule, vtkPassInputTypeAlgorithm,
  vtkSmartPointer

type
  vtkDateToNumeric* {.importcpp: "vtkDateToNumeric", header: "vtkDateToNumeric.h",
                     bycopy.} = object of vtkPassInputTypeAlgorithm
    vtkDateToNumeric* {.importc: "vtkDateToNumeric".}: VTK_NEWINSTANCE


proc New*(): ptr vtkDateToNumeric {.importcpp: "vtkDateToNumeric::New(@)",
                                header: "vtkDateToNumeric.h".}
type
  vtkDateToNumericSuperclass* = vtkPassInputTypeAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDateToNumeric::IsTypeOf(@)", header: "vtkDateToNumeric.h".}
proc IsA*(this: var vtkDateToNumeric; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkDateToNumeric.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDateToNumeric {.
    importcpp: "vtkDateToNumeric::SafeDownCast(@)", header: "vtkDateToNumeric.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDateToNumeric :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPassInputTypeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDateToNumeric :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDateToNumeric :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDateToNumeric; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkDateToNumeric.h".}
proc GetDateFormat*(this: var vtkDateToNumeric): cstring {.
    importcpp: "GetDateFormat", header: "vtkDateToNumeric.h".}
proc SetDateFormat*(this: var vtkDateToNumeric; _arg: cstring) {.
    importcpp: "SetDateFormat", header: "vtkDateToNumeric.h".}
  ## /@}