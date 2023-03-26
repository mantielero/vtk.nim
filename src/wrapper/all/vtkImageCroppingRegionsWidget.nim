## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageCroppingRegionsWidget.h
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
##  @class   vtkImageCroppingRegionsWidget
##  @brief   widget for cropping an image
##
##  This widget displays a set of axis aligned lines that can be interactively
##  manipulated to crop a volume. The region to be cropped away is displayed
##  in a different highlight. Much like the vtkVolumeMapper, this widget
##  supports 27 possible configurations of cropping planes. (See
##  CroppingRegionFlags). If a volume mapper is set, the cropping planes
##  are directly propagated to the volume mapper. The widget invokes a
##  CroppingPlanesPositionChangedEvent when the position of any of the
##  cropping planes is changed. The widget also invokes an InteractionEvent
##  in response to user interaction.
##

import
  vtk3DWidget, vtkInteractionWidgetsModule

discard "forward decl of vtkActor2D"
discard "forward decl of vtkImageData"
discard "forward decl of vtkLineSource"
discard "forward decl of vtkVolumeMapper"
discard "forward decl of vtkPolyData"
type
  vtkImageCroppingRegionsWidget* {.importcpp: "vtkImageCroppingRegionsWidget",
                                  header: "vtkImageCroppingRegionsWidget.h",
                                  bycopy.} = object of vtk3DWidget ## /@{
                                                              ## *
                                                              ##  Standard VTK methods.
                                                              ##
    vtkImageCroppingRegionsWidget* {.importc: "vtkImageCroppingRegionsWidget".}: VTK_NEWINSTANCE
    ##  Handles the events


proc New*(): ptr vtkImageCroppingRegionsWidget {.
    importcpp: "vtkImageCroppingRegionsWidget::New(@)",
    header: "vtkImageCroppingRegionsWidget.h".}
type
  vtkImageCroppingRegionsWidgetSuperclass* = vtk3DWidget

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageCroppingRegionsWidget::IsTypeOf(@)",
    header: "vtkImageCroppingRegionsWidget.h".}
proc IsA*(this: var vtkImageCroppingRegionsWidget; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageCroppingRegionsWidget.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageCroppingRegionsWidget {.
    importcpp: "vtkImageCroppingRegionsWidget::SafeDownCast(@)",
    header: "vtkImageCroppingRegionsWidget.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageCroppingRegionsWidget :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtk3DWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageCroppingRegionsWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageCroppingRegionsWidget :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageCroppingRegionsWidget; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkImageCroppingRegionsWidget.h".}
## using statement

proc PlaceWidget*(this: var vtkImageCroppingRegionsWidget; bounds: array[6, cdouble]) {.
    importcpp: "PlaceWidget", header: "vtkImageCroppingRegionsWidget.h".}
proc SetEnabled*(this: var vtkImageCroppingRegionsWidget; enabling: cint) {.
    importcpp: "SetEnabled", header: "vtkImageCroppingRegionsWidget.h".}
## !!!Ignored construct:  /@{ *
##  Set/Get the plane positions that represent the cropped region.
##  virtual double * GetPlanePositionsPlanePositions ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << PlanePositions  pointer  << this -> PlanePositions ) ; return this -> PlanePositions ; } VTK_WRAPEXCLUDE virtual void GetPlanePositionsPlanePositions ( double & _arg1 , double & _arg2 , double & _arg3 , double & _arg4 , double & _arg5 , double & _arg6 ) { _arg1 = this -> PlanePositions [ 0 ] ; _arg2 = this -> PlanePositions [ 1 ] ; _arg3 = this -> PlanePositions [ 2 ] ; _arg4 = this -> PlanePositions [ 3 ] ; _arg5 = this -> PlanePositions [ 4 ] ; _arg6 = this -> PlanePositions [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << PlanePositions  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetPlanePositionsPlanePositions ( double _arg [ 6 ] ) { this -> GetPlanePositionsPlanePositions ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ;
## Error: expected ';'!!!

proc SetPlanePositions*(this: var vtkImageCroppingRegionsWidget;
                       pos: array[6, cdouble]) {.importcpp: "SetPlanePositions",
    header: "vtkImageCroppingRegionsWidget.h".}
proc SetPlanePositions*(this: var vtkImageCroppingRegionsWidget;
                       pos: array[6, cfloat]) {.importcpp: "SetPlanePositions",
    header: "vtkImageCroppingRegionsWidget.h".}
proc SetPlanePositions*(this: var vtkImageCroppingRegionsWidget; xMin: cdouble;
                       xMax: cdouble; yMin: cdouble; yMax: cdouble; zMin: cdouble;
                       zMax: cdouble) {.importcpp: "SetPlanePositions",
                                      header: "vtkImageCroppingRegionsWidget.h".}
proc SetCroppingRegionFlags*(this: var vtkImageCroppingRegionsWidget; flags: cint) {.
    importcpp: "SetCroppingRegionFlags", header: "vtkImageCroppingRegionsWidget.h".}
## !!!Ignored construct:  virtual int GetCroppingRegionFlags ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CroppingRegionFlags  of  << this -> CroppingRegionFlags ) ; return this -> CroppingRegionFlags ; } ;
## Error: expected ';'!!!

const
  vtkImageCroppingRegionsWidgetSLICE_ORIENTATION_YZ* = 0
  vtkImageCroppingRegionsWidgetSLICE_ORIENTATION_XZ* = 1
  vtkImageCroppingRegionsWidgetSLICE_ORIENTATION_XY* = 2

## !!!Ignored construct:  virtual int GetCroppingRegionFlagsSliceOrientation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SliceOrientation  of  << this -> SliceOrientation ) ; return this -> SliceOrientation ; } ;
## Error: expected ';'!!!

proc SetSliceOrientation*(this: var vtkImageCroppingRegionsWidget; orientation: cint) {.
    importcpp: "SetSliceOrientation", header: "vtkImageCroppingRegionsWidget.h".}
proc SetSliceOrientationToXY*(this: var vtkImageCroppingRegionsWidget) {.
    importcpp: "SetSliceOrientationToXY",
    header: "vtkImageCroppingRegionsWidget.h".}
proc SetSliceOrientationToYZ*(this: var vtkImageCroppingRegionsWidget) {.
    importcpp: "SetSliceOrientationToYZ",
    header: "vtkImageCroppingRegionsWidget.h".}
proc SetSliceOrientationToXZ*(this: var vtkImageCroppingRegionsWidget) {.
    importcpp: "SetSliceOrientationToXZ",
    header: "vtkImageCroppingRegionsWidget.h".}
proc SetSlice*(this: var vtkImageCroppingRegionsWidget; num: cint) {.
    importcpp: "SetSlice", header: "vtkImageCroppingRegionsWidget.h".}
## !!!Ignored construct:  virtual int GetCroppingRegionFlagsSliceOrientationSlice ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Slice  of  << this -> Slice ) ; return this -> Slice ; } ;
## Error: expected ';'!!!

proc SetLine1Color*(this: var vtkImageCroppingRegionsWidget; r: cdouble; g: cdouble;
                   b: cdouble) {.importcpp: "SetLine1Color",
                               header: "vtkImageCroppingRegionsWidget.h".}
proc SetLine1Color*(this: var vtkImageCroppingRegionsWidget; rgb: array[3, cdouble]) {.
    importcpp: "SetLine1Color", header: "vtkImageCroppingRegionsWidget.h".}
proc GetLine1Color*(this: var vtkImageCroppingRegionsWidget): ptr cdouble {.
    importcpp: "GetLine1Color", header: "vtkImageCroppingRegionsWidget.h".}
proc GetLine1Color*(this: var vtkImageCroppingRegionsWidget; rgb: array[3, cdouble]) {.
    importcpp: "GetLine1Color", header: "vtkImageCroppingRegionsWidget.h".}
proc SetLine2Color*(this: var vtkImageCroppingRegionsWidget; r: cdouble; g: cdouble;
                   b: cdouble) {.importcpp: "SetLine2Color",
                               header: "vtkImageCroppingRegionsWidget.h".}
proc SetLine2Color*(this: var vtkImageCroppingRegionsWidget; rgb: array[3, cdouble]) {.
    importcpp: "SetLine2Color", header: "vtkImageCroppingRegionsWidget.h".}
proc GetLine2Color*(this: var vtkImageCroppingRegionsWidget): ptr cdouble {.
    importcpp: "GetLine2Color", header: "vtkImageCroppingRegionsWidget.h".}
proc GetLine2Color*(this: var vtkImageCroppingRegionsWidget; rgb: array[3, cdouble]) {.
    importcpp: "GetLine2Color", header: "vtkImageCroppingRegionsWidget.h".}
proc SetLine3Color*(this: var vtkImageCroppingRegionsWidget; r: cdouble; g: cdouble;
                   b: cdouble) {.importcpp: "SetLine3Color",
                               header: "vtkImageCroppingRegionsWidget.h".}
proc SetLine3Color*(this: var vtkImageCroppingRegionsWidget; rgb: array[3, cdouble]) {.
    importcpp: "SetLine3Color", header: "vtkImageCroppingRegionsWidget.h".}
proc GetLine3Color*(this: var vtkImageCroppingRegionsWidget): ptr cdouble {.
    importcpp: "GetLine3Color", header: "vtkImageCroppingRegionsWidget.h".}
proc GetLine3Color*(this: var vtkImageCroppingRegionsWidget; rgb: array[3, cdouble]) {.
    importcpp: "GetLine3Color", header: "vtkImageCroppingRegionsWidget.h".}
proc SetLine4Color*(this: var vtkImageCroppingRegionsWidget; r: cdouble; g: cdouble;
                   b: cdouble) {.importcpp: "SetLine4Color",
                               header: "vtkImageCroppingRegionsWidget.h".}
proc SetLine4Color*(this: var vtkImageCroppingRegionsWidget; rgb: array[3, cdouble]) {.
    importcpp: "SetLine4Color", header: "vtkImageCroppingRegionsWidget.h".}
proc GetLine4Color*(this: var vtkImageCroppingRegionsWidget): ptr cdouble {.
    importcpp: "GetLine4Color", header: "vtkImageCroppingRegionsWidget.h".}
proc GetLine4Color*(this: var vtkImageCroppingRegionsWidget; rgb: array[3, cdouble]) {.
    importcpp: "GetLine4Color", header: "vtkImageCroppingRegionsWidget.h".}
proc SetVolumeMapper*(this: var vtkImageCroppingRegionsWidget;
                     mapper: ptr vtkVolumeMapper) {.importcpp: "SetVolumeMapper",
    header: "vtkImageCroppingRegionsWidget.h".}
proc GetnameVolumeMapper*(this: var vtkImageCroppingRegionsWidget): ptr vtkVolumeMapper {.
    importcpp: "GetnameVolumeMapper", header: "vtkImageCroppingRegionsWidget.h".}
proc UpdateAccordingToInput*(this: var vtkImageCroppingRegionsWidget) {.
    importcpp: "UpdateAccordingToInput", header: "vtkImageCroppingRegionsWidget.h".}
proc MoveHorizontalLine*(this: var vtkImageCroppingRegionsWidget) {.
    importcpp: "MoveHorizontalLine", header: "vtkImageCroppingRegionsWidget.h".}
proc MoveVerticalLine*(this: var vtkImageCroppingRegionsWidget) {.
    importcpp: "MoveVerticalLine", header: "vtkImageCroppingRegionsWidget.h".}
proc MoveIntersectingLines*(this: var vtkImageCroppingRegionsWidget) {.
    importcpp: "MoveIntersectingLines", header: "vtkImageCroppingRegionsWidget.h".}
proc UpdateCursorIcon*(this: var vtkImageCroppingRegionsWidget) {.
    importcpp: "UpdateCursorIcon", header: "vtkImageCroppingRegionsWidget.h".}
proc OnButtonPress*(this: var vtkImageCroppingRegionsWidget) {.
    importcpp: "OnButtonPress", header: "vtkImageCroppingRegionsWidget.h".}
proc OnButtonRelease*(this: var vtkImageCroppingRegionsWidget) {.
    importcpp: "OnButtonRelease", header: "vtkImageCroppingRegionsWidget.h".}
proc OnMouseMove*(this: var vtkImageCroppingRegionsWidget) {.
    importcpp: "OnMouseMove", header: "vtkImageCroppingRegionsWidget.h".}
type
  vtkImageCroppingRegionsWidgetWidgetEventIds* {.size: sizeof(cint),
      importcpp: "vtkImageCroppingRegionsWidget::WidgetEventIds",
      header: "vtkImageCroppingRegionsWidget.h".} = enum
    CroppingPlanesPositionChangedEvent = 10050

