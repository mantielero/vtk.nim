## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCompositeTransferFunctionItem.h
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

import
  vtkChartsCoreModule, vtkColorTransferFunctionItem

discard "forward decl of vtkPiecewiseFunction"
type
  vtkCompositeTransferFunctionItem* {.importcpp: "vtkCompositeTransferFunctionItem", header: "vtkCompositeTransferFunctionItem.h",
                                     bycopy.} = object of vtkColorTransferFunctionItem
    vtkCompositeTransferFunctionItem* {.importc: "vtkCompositeTransferFunctionItem".}: VTK_NEWINSTANCE


proc New*(): ptr vtkCompositeTransferFunctionItem {.
    importcpp: "vtkCompositeTransferFunctionItem::New(@)",
    header: "vtkCompositeTransferFunctionItem.h".}
type
  vtkCompositeTransferFunctionItemSuperclass* = vtkColorTransferFunctionItem

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCompositeTransferFunctionItem::IsTypeOf(@)",
    header: "vtkCompositeTransferFunctionItem.h".}
proc IsA*(this: var vtkCompositeTransferFunctionItem; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkCompositeTransferFunctionItem.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCompositeTransferFunctionItem {.
    importcpp: "vtkCompositeTransferFunctionItem::SafeDownCast(@)",
    header: "vtkCompositeTransferFunctionItem.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCompositeTransferFunctionItem :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkColorTransferFunctionItem :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCompositeTransferFunctionItem :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCompositeTransferFunctionItem :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCompositeTransferFunctionItem; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkCompositeTransferFunctionItem.h".}
proc SetOpacityFunction*(this: var vtkCompositeTransferFunctionItem;
                        opacity: ptr vtkPiecewiseFunction) {.
    importcpp: "SetOpacityFunction", header: "vtkCompositeTransferFunctionItem.h".}
proc GetnameOpacityFunction*(this: var vtkCompositeTransferFunctionItem): ptr vtkPiecewiseFunction {.
    importcpp: "GetnameOpacityFunction",
    header: "vtkCompositeTransferFunctionItem.h".}