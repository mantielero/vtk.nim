## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkArrayData.h
##
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
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
##  @class   vtkArrayData
##  @brief   Pipeline data object that contains multiple vtkArray objects.
##
##
##  Because vtkArray cannot be stored as attributes of data objects (yet), a "carrier"
##  object is needed to pass vtkArray through the pipeline.  vtkArrayData acts as a
##  container of zero-to-many vtkArray instances, which can be retrieved via a zero-based
##  index.  Note that a collection of arrays stored in vtkArrayData may-or-may-not have related
##  types, dimensions, or extents.
##
##  @sa
##  vtkArrayDataAlgorithm, vtkArray
##
##  @par Thanks:
##  Developed by Timothy M. Shead (tshead@sandia.gov) at Sandia National Laboratories.
##

import
  vtkCommonDataModelModule, vtkDataObject

discard "forward decl of vtkArray"
type
  vtkArrayData* {.importcpp: "vtkArrayData", header: "vtkArrayData.h", bycopy.} = object of vtkDataObject
    vtkArrayData* {.importc: "vtkArrayData".}: VTK_NEWINSTANCE


proc New*(): ptr vtkArrayData {.importcpp: "vtkArrayData::New(@)",
                            header: "vtkArrayData.h".}
type
  vtkArrayDataSuperclass* = vtkDataObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkArrayData::IsTypeOf(@)", header: "vtkArrayData.h".}
proc IsA*(this: var vtkArrayData; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkArrayData.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkArrayData {.
    importcpp: "vtkArrayData::SafeDownCast(@)", header: "vtkArrayData.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkArrayData :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkArrayData :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkArrayData :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkArrayData; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkArrayData.h".}
proc GetData*(info: ptr vtkInformation): ptr vtkArrayData {.
    importcpp: "vtkArrayData::GetData(@)", header: "vtkArrayData.h".}
proc GetData*(v: ptr vtkInformationVector; i: cint = 0): ptr vtkArrayData {.
    importcpp: "vtkArrayData::GetData(@)", header: "vtkArrayData.h".}
proc AddArray*(this: var vtkArrayData; a2: ptr vtkArray) {.importcpp: "AddArray",
    header: "vtkArrayData.h".}
proc ClearArrays*(this: var vtkArrayData) {.importcpp: "ClearArrays",
                                        header: "vtkArrayData.h".}
proc GetNumberOfArrays*(this: var vtkArrayData): vtkIdType {.
    importcpp: "GetNumberOfArrays", header: "vtkArrayData.h".}
proc GetArray*(this: var vtkArrayData; index: vtkIdType): ptr vtkArray {.
    importcpp: "GetArray", header: "vtkArrayData.h".}
proc GetArrayByName*(this: var vtkArrayData; name: cstring): ptr vtkArray {.
    importcpp: "GetArrayByName", header: "vtkArrayData.h".}
proc GetDataObjectType*(this: var vtkArrayData): cint {.
    importcpp: "GetDataObjectType", header: "vtkArrayData.h".}
proc ShallowCopy*(this: var vtkArrayData; other: ptr vtkDataObject) {.
    importcpp: "ShallowCopy", header: "vtkArrayData.h".}
proc DeepCopy*(this: var vtkArrayData; other: ptr vtkDataObject) {.
    importcpp: "DeepCopy", header: "vtkArrayData.h".}