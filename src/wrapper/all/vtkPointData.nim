## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPointData.h
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
##  @class   vtkPointData
##  @brief   represent and manipulate point attribute data
##
##  vtkPointData is a class that is used to represent and manipulate
##  point attribute data (e.g., scalars, vectors, normals, texture
##  coordinates, etc.) Most of the functionality is handled by
##  vtkDataSetAttributes.
##
##  By default, `GhostTypesToSkip` is set to `DUPLICATEPOINT | HIDDENPOINT`.
##  See `vtkDataSetAttributes` for the definition of those constants.
##

import
  vtkCommonDataModelModule, vtkDataSetAttributes, vtkDeprecation

type
  vtkPointData* {.importcpp: "vtkPointData", header: "vtkPointData.h", bycopy.} = object of vtkDataSetAttributes
    vtkPointData* {.importc: "vtkPointData".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPointData {.importcpp: "vtkPointData::New(@)",
                            header: "vtkPointData.h".}
proc ExtendedNew*(): ptr vtkPointData {.importcpp: "vtkPointData::ExtendedNew(@)",
                                    header: "vtkPointData.h".}
type
  vtkPointDataSuperclass* = vtkDataSetAttributes

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPointData::IsTypeOf(@)", header: "vtkPointData.h".}
proc IsA*(this: var vtkPointData; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkPointData.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPointData {.
    importcpp: "vtkPointData::SafeDownCast(@)", header: "vtkPointData.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPointData :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAttributes :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPointData :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPointData :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPointData; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPointData.h".}
## !!!Ignored construct:  VTK_DEPRECATED_IN_9_1_0 ( Use vtkFieldData::NullData ) void NullPoint ( vtkIdType ptId ) ;
## Error: identifier expected, but got: Use vtkFieldData::NullData!!!
