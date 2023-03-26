## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCategoryLegend.h
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
##  @class   vtkCategoryLegend
##  @brief   Legend item to display categorical data.
##
##  vtkCategoryLegend will display a label and color patch for each value
##  in a categorical data set.  To use this class, you must first populate
##  a vtkScalarsToColors by using the SetAnnotation() method.  The other
##  input to this class is a vtkVariantArray.  This should contain the
##  annotated values from the vtkScalarsToColors that you wish to include
##  within the legend.
##

import
  vtkChartLegend, vtkChartsCoreModule, vtkNew, vtkStdString, vtkVector

discard "forward decl of vtkScalarsToColors"
discard "forward decl of vtkTextProperty"
discard "forward decl of vtkVariantArray"
type
  vtkCategoryLegend* {.importcpp: "vtkCategoryLegend",
                      header: "vtkCategoryLegend.h", bycopy.} = object of vtkChartLegend
    vtkCategoryLegend* {.importc: "vtkCategoryLegend".}: VTK_NEWINSTANCE

  vtkCategoryLegendSuperclass* = vtkChartLegend

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCategoryLegend::IsTypeOf(@)", header: "vtkCategoryLegend.h".}
proc IsA*(this: var vtkCategoryLegend; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkCategoryLegend.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCategoryLegend {.
    importcpp: "vtkCategoryLegend::SafeDownCast(@)", header: "vtkCategoryLegend.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCategoryLegend :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkChartLegend :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCategoryLegend :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCategoryLegend :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCategoryLegend; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCategoryLegend.h".}
proc New*(): ptr vtkCategoryLegend {.importcpp: "vtkCategoryLegend::New(@)",
                                 header: "vtkCategoryLegend.h".}
const
  vtkCategoryLegendVERTICAL* = 0
  vtkCategoryLegendHORIZONTAL* = 1

proc Paint*(this: var vtkCategoryLegend; painter: ptr vtkContext2D): bool {.
    importcpp: "Paint", header: "vtkCategoryLegend.h".}
proc GetBoundingRect*(this: var vtkCategoryLegend; painter: ptr vtkContext2D): vtkRectf {.
    importcpp: "GetBoundingRect", header: "vtkCategoryLegend.h".}
proc SetScalarsToColors*(this: var vtkCategoryLegend; stc: ptr vtkScalarsToColors) {.
    importcpp: "SetScalarsToColors", header: "vtkCategoryLegend.h".}
proc GetScalarsToColors*(this: var vtkCategoryLegend): ptr vtkScalarsToColors {.
    importcpp: "GetScalarsToColors", header: "vtkCategoryLegend.h".}
proc GetnameValues*(this: var vtkCategoryLegend): ptr vtkVariantArray {.
    importcpp: "GetnameValues", header: "vtkCategoryLegend.h".}
proc SetValues*(this: var vtkCategoryLegend; a2: ptr vtkVariantArray) {.
    importcpp: "SetValues", header: "vtkCategoryLegend.h".}
proc SetTitle*(this: var vtkCategoryLegend; title: vtkStdString) {.
    importcpp: "SetTitle", header: "vtkCategoryLegend.h".}
proc GetTitle*(this: var vtkCategoryLegend): vtkStdString {.importcpp: "GetTitle",
    header: "vtkCategoryLegend.h".}
## !!!Ignored construct:  /@} /@{ *
##  Get/set the label to use for outlier data.
##  virtual vtkStdString GetOutlierLabelOutlierLabel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutlierLabel  of  << this -> OutlierLabel ) ; return this -> OutlierLabel ; } ;
## Error: expected ';'!!!

proc SetOutlierLabel*(this: var vtkCategoryLegend; _arg: vtkStdString) {.
    importcpp: "SetOutlierLabel", header: "vtkCategoryLegend.h".}
  ## /@}