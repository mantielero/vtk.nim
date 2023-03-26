## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSelectVisiblePoints.h
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
##  @class   vtkSelectVisiblePoints
##  @brief   extract points that are visible (based on z-buffer calculation)
##
##  vtkSelectVisiblePoints is a filter that selects points based on
##  whether they are visible or not. Visibility is determined by
##  accessing the z-buffer of a rendering window. (The position of each
##  input point is converted into display coordinates, and then the
##  z-value at that point is obtained. If within the user-specified
##  tolerance, the point is considered visible.)
##
##  Points that are visible (or if the ivar SelectInvisible is on,
##  invisible points) are passed to the output. Associated data
##  attributes are passed to the output as well.
##
##  This filter also allows you to specify a rectangular window in display
##  (pixel) coordinates in which the visible points must lie. This can be
##  used as a sort of local "brushing" operation to select just data within
##  a window.
##
##
##  @warning
##  You must carefully synchronize the execution of this filter. The
##  filter refers to a renderer, which is modified every time a render
##  occurs. Therefore, the filter is always out of date, and always
##  executes. You may have to perform two rendering passes, or if you
##  are using this filter in conjunction with vtkLabeledDataMapper,
##  things work out because 2D rendering occurs after the 3D rendering.
##

import
  vtkPolyDataAlgorithm, vtkRenderingCoreModule

discard "forward decl of vtkRenderer"
discard "forward decl of vtkMatrix4x4"
type
  vtkSelectVisiblePoints* {.importcpp: "vtkSelectVisiblePoints",
                           header: "vtkSelectVisiblePoints.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkSelectVisiblePoints* {.importc: "vtkSelectVisiblePoints".}: VTK_NEWINSTANCE

  vtkSelectVisiblePointsSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSelectVisiblePoints::IsTypeOf(@)",
    header: "vtkSelectVisiblePoints.h".}
proc IsA*(this: var vtkSelectVisiblePoints; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkSelectVisiblePoints.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSelectVisiblePoints {.
    importcpp: "vtkSelectVisiblePoints::SafeDownCast(@)",
    header: "vtkSelectVisiblePoints.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSelectVisiblePoints :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSelectVisiblePoints :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSelectVisiblePoints :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSelectVisiblePoints; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSelectVisiblePoints.h".}
proc New*(): ptr vtkSelectVisiblePoints {.importcpp: "vtkSelectVisiblePoints::New(@)",
                                      header: "vtkSelectVisiblePoints.h".}
proc SetRenderer*(this: var vtkSelectVisiblePoints; ren: ptr vtkRenderer) {.
    importcpp: "SetRenderer", header: "vtkSelectVisiblePoints.h".}
proc GetRenderer*(this: var vtkSelectVisiblePoints): ptr vtkRenderer {.
    importcpp: "GetRenderer", header: "vtkSelectVisiblePoints.h".}
proc SetSelectionWindow*(this: var vtkSelectVisiblePoints; _arg: vtkTypeBool) {.
    importcpp: "SetSelectionWindow", header: "vtkSelectVisiblePoints.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetSelectionWindow ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SelectionWindow  of  << this -> SelectionWindow ) ; return this -> SelectionWindow ; } ;
## Error: expected ';'!!!

proc SelectionWindowOn*(this: var vtkSelectVisiblePoints) {.
    importcpp: "SelectionWindowOn", header: "vtkSelectVisiblePoints.h".}
proc SelectionWindowOff*(this: var vtkSelectVisiblePoints) {.
    importcpp: "SelectionWindowOff", header: "vtkSelectVisiblePoints.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify the selection window in display coordinates. You must specify
  ##  a rectangular region using (xmin,xmax,ymin,ymax).
  ##
proc SetSelection*(this: var vtkSelectVisiblePoints; _arg1: cint; _arg2: cint;
                  _arg3: cint; _arg4: cint) {.importcpp: "SetSelection",
    header: "vtkSelectVisiblePoints.h".}
proc SetSelection*(this: var vtkSelectVisiblePoints; _arg: array[4, cint]) {.
    importcpp: "SetSelection", header: "vtkSelectVisiblePoints.h".}
## !!!Ignored construct:  virtual int * GetSelection ( ) VTK_SIZEHINT ( 4 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Selection  pointer  << this -> Selection ) ; return this -> Selection ; } VTK_WRAPEXCLUDE virtual void GetSelection ( int data [ 4 ] ) { for ( int i = 0 ; i < 4 ; i ++ ) { data [ i ] = this -> Selection [ i ] ; } } ;
## Error: expected ';'!!!

proc SetSelectionWindowSelectInvisible*(this: var vtkSelectVisiblePoints;
                                       _arg: vtkTypeBool) {.
    importcpp: "SetSelectionWindowSelectInvisible",
    header: "vtkSelectVisiblePoints.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetSelectionWindowSelectInvisible ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SelectInvisible  of  << this -> SelectInvisible ) ; return this -> SelectInvisible ; } ;
## Error: expected ';'!!!

proc SelectInvisibleOn*(this: var vtkSelectVisiblePoints) {.
    importcpp: "SelectInvisibleOn", header: "vtkSelectVisiblePoints.h".}
proc SelectInvisibleOff*(this: var vtkSelectVisiblePoints) {.
    importcpp: "SelectInvisibleOff", header: "vtkSelectVisiblePoints.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get a tolerance in normalized display coordinate system
  ##  to use to determine whether a point is visible. A
  ##  tolerance is usually required because the conversion from world space
  ##  to display space during rendering introduces numerical round-off.
  ##
proc SetTolerance*(this: var vtkSelectVisiblePoints; _arg: cdouble) {.
    importcpp: "SetTolerance", header: "vtkSelectVisiblePoints.h".}
proc GetToleranceMinValue*(this: var vtkSelectVisiblePoints): cdouble {.
    importcpp: "GetToleranceMinValue", header: "vtkSelectVisiblePoints.h".}
proc GetToleranceMaxValue*(this: var vtkSelectVisiblePoints): cdouble {.
    importcpp: "GetToleranceMaxValue", header: "vtkSelectVisiblePoints.h".}
## !!!Ignored construct:  virtual double GetSelectionWindowSelectInvisibleTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tolerance  of  << this -> Tolerance ) ; return this -> Tolerance ; } ;
## Error: expected ';'!!!

proc SetToleranceToleranceWorld*(this: var vtkSelectVisiblePoints; _arg: cdouble) {.
    importcpp: "SetToleranceToleranceWorld", header: "vtkSelectVisiblePoints.h".}
proc GetToleranceMinValueToleranceWorldMinValue*(this: var vtkSelectVisiblePoints): cdouble {.
    importcpp: "GetToleranceMinValueToleranceWorldMinValue",
    header: "vtkSelectVisiblePoints.h".}
proc GetToleranceMaxValueToleranceWorldMaxValue*(this: var vtkSelectVisiblePoints): cdouble {.
    importcpp: "GetToleranceMaxValueToleranceWorldMaxValue",
    header: "vtkSelectVisiblePoints.h".}
## !!!Ignored construct:  virtual double GetSelectionWindowSelectInvisibleToleranceToleranceWorld ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ToleranceWorld  of  << this -> ToleranceWorld ) ; return this -> ToleranceWorld ; } ;
## Error: expected ';'!!!

proc Initialize*(this: var vtkSelectVisiblePoints; getZbuff: bool): ptr cfloat {.
    importcpp: "Initialize", header: "vtkSelectVisiblePoints.h".}
proc IsPointOccluded*(this: var vtkSelectVisiblePoints; x: array[3, cdouble];
                     zPtr: ptr cfloat): bool {.importcpp: "IsPointOccluded",
    header: "vtkSelectVisiblePoints.h".}
proc GetMTime*(this: var vtkSelectVisiblePoints): vtkMTimeType {.
    importcpp: "GetMTime", header: "vtkSelectVisiblePoints.h".}