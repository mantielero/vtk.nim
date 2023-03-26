## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkColorTransferFunctionItem.h
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
  vtkChartsCoreModule, vtkScalarsToColorsItem

discard "forward decl of vtkColorTransferFunction"
discard "forward decl of vtkImageData"
type
  vtkColorTransferFunctionItem* {.importcpp: "vtkColorTransferFunctionItem",
                                 header: "vtkColorTransferFunctionItem.h", bycopy.} = object of vtkScalarsToColorsItem
    vtkColorTransferFunctionItem* {.importc: "vtkColorTransferFunctionItem".}: VTK_NEWINSTANCE
    ## *
    ##  Override the histogram plotbar configuration
    ##  in order to set the color transfer function on it
    ##


proc New*(): ptr vtkColorTransferFunctionItem {.
    importcpp: "vtkColorTransferFunctionItem::New(@)",
    header: "vtkColorTransferFunctionItem.h".}
type
  vtkColorTransferFunctionItemSuperclass* = vtkScalarsToColorsItem

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkColorTransferFunctionItem::IsTypeOf(@)",
    header: "vtkColorTransferFunctionItem.h".}
proc IsA*(this: var vtkColorTransferFunctionItem; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkColorTransferFunctionItem.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkColorTransferFunctionItem {.
    importcpp: "vtkColorTransferFunctionItem::SafeDownCast(@)",
    header: "vtkColorTransferFunctionItem.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkColorTransferFunctionItem :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkScalarsToColorsItem :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkColorTransferFunctionItem :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkColorTransferFunctionItem :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkColorTransferFunctionItem; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkColorTransferFunctionItem.h".}
proc SetColorTransferFunction*(this: var vtkColorTransferFunctionItem;
                              t: ptr vtkColorTransferFunction) {.
    importcpp: "SetColorTransferFunction",
    header: "vtkColorTransferFunctionItem.h".}
proc GetnameColorTransferFunction*(this: var vtkColorTransferFunctionItem): ptr vtkColorTransferFunction {.
    importcpp: "GetnameColorTransferFunction",
    header: "vtkColorTransferFunctionItem.h".}