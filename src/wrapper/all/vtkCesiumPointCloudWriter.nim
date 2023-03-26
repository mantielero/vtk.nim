## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCesiumPointCloudWriter.h
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
##  @class   vtkCesiumPointCloudWriter
##  @brief   export a vtkPointSet into a Cesium Point Cloud tile format
##
##

import
  vtkIOCesium3DTilesModule, vtkIdList, vtkWriter

type
  vtkCesiumPointCloudWriter* {.importcpp: "vtkCesiumPointCloudWriter",
                              header: "vtkCesiumPointCloudWriter.h", bycopy.} = object of vtkWriter
    vtkCesiumPointCloudWriter* {.importc: "vtkCesiumPointCloudWriter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkCesiumPointCloudWriter {.
    importcpp: "vtkCesiumPointCloudWriter::New(@)",
    header: "vtkCesiumPointCloudWriter.h".}
type
  vtkCesiumPointCloudWriterSuperclass* = vtkWriter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCesiumPointCloudWriter::IsTypeOf(@)",
    header: "vtkCesiumPointCloudWriter.h".}
proc IsA*(this: var vtkCesiumPointCloudWriter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkCesiumPointCloudWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCesiumPointCloudWriter {.
    importcpp: "vtkCesiumPointCloudWriter::SafeDownCast(@)",
    header: "vtkCesiumPointCloudWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCesiumPointCloudWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCesiumPointCloudWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCesiumPointCloudWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCesiumPointCloudWriter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCesiumPointCloudWriter.h".}
proc SetFileName*(this: var vtkCesiumPointCloudWriter; _arg: cstring) {.
    importcpp: "SetFileName", header: "vtkCesiumPointCloudWriter.h".}
proc GetFileName*(this: var vtkCesiumPointCloudWriter): cstring {.
    importcpp: "GetFileName", header: "vtkCesiumPointCloudWriter.h".}
  ## /@}
  ## /@{
  ## *
  ##  List of points to be saved.
  ##
proc SetPointIds*(this: var vtkCesiumPointCloudWriter; _arg: ptr vtkIdList) {.
    importcpp: "SetPointIds", header: "vtkCesiumPointCloudWriter.h".}
proc GetnamePointIds*(this: var vtkCesiumPointCloudWriter): ptr vtkIdList {.
    importcpp: "GetnamePointIds", header: "vtkCesiumPointCloudWriter.h".}
  ## /@}
##  VTK-HeaderTest-Exclude: vtkCesiumPointCloudWriter.h
