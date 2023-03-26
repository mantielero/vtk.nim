## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCellData.h
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
##  @class   vtkCellData
##  @brief   represent and manipulate cell attribute data
##
##  vtkCellData is a class that is used to represent and manipulate
##  cell attribute data (e.g., scalars, vectors, normals, texture
##  coordinates, etc.) Special methods are provided to work with filter
##  objects, such as passing data through filter, copying data from one
##  cell to another, and interpolating data given cell interpolation weights.
##
##  By default, `GhostTypesToSkip` is set to `DUPLICATECELL | HIDDENCELL | REFINEDCELL`.
##  See `vtkDataSetAttributes` for the definition of those constants.
##

import
  vtkCommonDataModelModule, vtkDataSetAttributes

type
  vtkCellData* {.importcpp: "vtkCellData", header: "vtkCellData.h", bycopy.} = object of vtkDataSetAttributes
    vtkCellData* {.importc: "vtkCellData".}: VTK_NEWINSTANCE


proc New*(): ptr vtkCellData {.importcpp: "vtkCellData::New(@)",
                           header: "vtkCellData.h".}
proc ExtendedNew*(): ptr vtkCellData {.importcpp: "vtkCellData::ExtendedNew(@)",
                                   header: "vtkCellData.h".}
type
  vtkCellDataSuperclass* = vtkDataSetAttributes

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCellData::IsTypeOf(@)", header: "vtkCellData.h".}
proc IsA*(this: var vtkCellData; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkCellData.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCellData {.
    importcpp: "vtkCellData::SafeDownCast(@)", header: "vtkCellData.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCellData :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAttributes :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCellData :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCellData :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCellData; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCellData.h".}