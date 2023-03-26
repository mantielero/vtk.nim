## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPolyDataItem.h
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
##  @class   vtkPolyDataItem
##  @brief   Filter that translate a vtkPolyData 2D mesh into vtkContextItems.
##
##  @warning
##  The input vtkPolyData should be a 2D mesh.
##
##

import
  vtkContextItem, vtkRenderingContext2DModule

discard "forward decl of vtkPolyData"
discard "forward decl of vtkUnsignedCharArray"
type
  vtkPolyDataItem* {.importcpp: "vtkPolyDataItem", header: "vtkPolyDataItem.h",
                    bycopy.} = object of vtkContextItem
    vtkPolyDataItem* {.importc: "vtkPolyDataItem".}: VTK_NEWINSTANCE

  vtkPolyDataItemSuperclass* = vtkContextItem

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPolyDataItem::IsTypeOf(@)", header: "vtkPolyDataItem.h".}
proc IsA*(this: var vtkPolyDataItem; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkPolyDataItem.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPolyDataItem {.
    importcpp: "vtkPolyDataItem::SafeDownCast(@)", header: "vtkPolyDataItem.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPolyDataItem :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkContextItem :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPolyDataItem :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPolyDataItem :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPolyDataItem; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPolyDataItem.h".}
proc New*(): ptr vtkPolyDataItem {.importcpp: "vtkPolyDataItem::New(@)",
                               header: "vtkPolyDataItem.h".}
proc Paint*(this: var vtkPolyDataItem; painter: ptr vtkContext2D): bool {.
    importcpp: "Paint", header: "vtkPolyDataItem.h".}
proc SetPolyData*(this: var vtkPolyDataItem; polyData: ptr vtkPolyData) {.
    importcpp: "SetPolyData", header: "vtkPolyDataItem.h".}
proc SetMappedColors*(this: var vtkPolyDataItem; colors: ptr vtkUnsignedCharArray) {.
    importcpp: "SetMappedColors", header: "vtkPolyDataItem.h".}
proc GetnamePolyData*(this: var vtkPolyDataItem): ptr vtkPolyData {.
    importcpp: "GetnamePolyData", header: "vtkPolyDataItem.h".}
  ## *
  ##  Set the position of the bottom corner of the image.
  ##
proc SetPosition*(this: var vtkPolyDataItem; _arg1: cfloat; _arg2: cfloat) {.
    importcpp: "SetPosition", header: "vtkPolyDataItem.h".}
proc SetPosition*(this: var vtkPolyDataItem; _arg: array[2, cfloat]) {.
    importcpp: "SetPosition", header: "vtkPolyDataItem.h".}
  ## *
  ##  Set the data scalar mode.
  ##
proc SetScalarMode*(this: var vtkPolyDataItem; _arg: cint) {.
    importcpp: "SetScalarMode", header: "vtkPolyDataItem.h".}