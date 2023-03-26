## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFlagpoleLabel.h
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
##  @class vtkFlagpoleLabel
##  @brief Renders a flagpole (line) with a label at the top that faces the camera
##
##  This class draws a line from the base to the top of the flagpole. It then
##  places a text annotation at the top, centered horizontally. The text is
##  always oriented with the flagpole but will rotate aroundthe flagpole to
##  face the camera.
##

import
  vtkActor, vtkNew, vtkRenderingCoreModule, vtkSmartPointer

discard "forward decl of vtkActor"
discard "forward decl of vtkImageData"
discard "forward decl of vtkLineSource"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkPolyDataMapper"
discard "forward decl of vtkRenderer"
discard "forward decl of vtkTextProperty"
discard "forward decl of vtkTextRenderer"
type
  vtkFlagpoleLabel* {.importcpp: "vtkFlagpoleLabel", header: "vtkFlagpoleLabel.h",
                     bycopy.} = object of vtkActor
    vtkFlagpoleLabel* {.importc: "vtkFlagpoleLabel".}: VTK_NEWINSTANCE
    ##  Cached metadata to determine if things need rebuildin'
    ##  We cache this so we can recompute the bounds between renders, if needed.
    ##  Rendering stuffies


proc New*(): ptr vtkFlagpoleLabel {.importcpp: "vtkFlagpoleLabel::New(@)",
                                header: "vtkFlagpoleLabel.h".}
type
  vtkFlagpoleLabelSuperclass* = vtkActor

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkFlagpoleLabel::IsTypeOf(@)", header: "vtkFlagpoleLabel.h".}
proc IsA*(this: var vtkFlagpoleLabel; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkFlagpoleLabel.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkFlagpoleLabel {.
    importcpp: "vtkFlagpoleLabel::SafeDownCast(@)", header: "vtkFlagpoleLabel.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkFlagpoleLabel :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkActor :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFlagpoleLabel :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFlagpoleLabel :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkFlagpoleLabel; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkFlagpoleLabel.h".}
proc SetInput*(this: var vtkFlagpoleLabel; `in`: cstring) {.importcpp: "SetInput",
    header: "vtkFlagpoleLabel.h".}
proc GetInput*(this: var vtkFlagpoleLabel): cstring {.importcpp: "GetInput",
    header: "vtkFlagpoleLabel.h".}
  ## * @}
  ## *
  ##  The vtkTextProperty object that controls the rendered text.
  ##  @{
  ##
proc SetTextProperty*(this: var vtkFlagpoleLabel; tprop: ptr vtkTextProperty) {.
    importcpp: "SetTextProperty", header: "vtkFlagpoleLabel.h".}
proc GetnameTextProperty*(this: var vtkFlagpoleLabel): ptr vtkTextProperty {.
    importcpp: "GetnameTextProperty", header: "vtkFlagpoleLabel.h".}
  ## * @}
  ## *
  ##  Force the actor to render during the opaque or translucent pass.
  ##  @{
  ##
proc SetForceOpaque*(this: var vtkFlagpoleLabel; opaque: bool) {.
    importcpp: "SetForceOpaque", header: "vtkFlagpoleLabel.h".}
## !!!Ignored construct:  bool GetForceOpaque ( ) VTK_FUTURE_CONST override ;
## Error: expected ';'!!!

proc ForceOpaqueOn*(this: var vtkFlagpoleLabel) {.importcpp: "ForceOpaqueOn",
    header: "vtkFlagpoleLabel.h".}
proc ForceOpaqueOff*(this: var vtkFlagpoleLabel) {.importcpp: "ForceOpaqueOff",
    header: "vtkFlagpoleLabel.h".}
proc SetForceTranslucent*(this: var vtkFlagpoleLabel; trans: bool) {.
    importcpp: "SetForceTranslucent", header: "vtkFlagpoleLabel.h".}
## !!!Ignored construct:  bool GetForceTranslucent ( ) VTK_FUTURE_CONST override ;
## Error: expected ';'!!!

proc ForceTranslucentOn*(this: var vtkFlagpoleLabel) {.
    importcpp: "ForceTranslucentOn", header: "vtkFlagpoleLabel.h".}
proc ForceTranslucentOff*(this: var vtkFlagpoleLabel) {.
    importcpp: "ForceTranslucentOff", header: "vtkFlagpoleLabel.h".}
proc HasTranslucentPolygonalGeometry*(this: var vtkFlagpoleLabel): vtkTypeBool {.
    importcpp: "HasTranslucentPolygonalGeometry", header: "vtkFlagpoleLabel.h".}
proc RenderOpaqueGeometry*(this: var vtkFlagpoleLabel; vp: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkFlagpoleLabel.h".}
proc RenderTranslucentPolygonalGeometry*(this: var vtkFlagpoleLabel;
                                        vp: ptr vtkViewport): cint {.
    importcpp: "RenderTranslucentPolygonalGeometry", header: "vtkFlagpoleLabel.h".}
proc ReleaseGraphicsResources*(this: var vtkFlagpoleLabel; win: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkFlagpoleLabel.h".}
proc GetBounds*(this: var vtkFlagpoleLabel): ptr cdouble {.importcpp: "GetBounds",
    header: "vtkFlagpoleLabel.h".}
## using statement

## !!!Ignored construct:  *
##  Set/Get the world coordinate position of the base
##  virtual double * GetBasePositionBasePosition ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << BasePosition  pointer  << this -> BasePosition ) ; return this -> BasePosition ; } VTK_WRAPEXCLUDE virtual void GetBasePositionBasePosition ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> BasePosition [ 0 ] ; _arg2 = this -> BasePosition [ 1 ] ; _arg3 = this -> BasePosition [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << BasePosition  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetBasePositionBasePosition ( double _arg [ 3 ] ) { this -> GetBasePositionBasePosition ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetBasePosition*(this: var vtkFlagpoleLabel; x: cdouble; y: cdouble; z: cdouble) {.
    importcpp: "SetBasePosition", header: "vtkFlagpoleLabel.h".}
## !!!Ignored construct:  *
##  Set/Get the world coordinate position of the top
##  virtual double * GetBasePositionBasePositionTopPositionTopPosition ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << TopPosition  pointer  << this -> TopPosition ) ; return this -> TopPosition ; } VTK_WRAPEXCLUDE virtual void GetBasePositionBasePositionTopPositionTopPosition ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> TopPosition [ 0 ] ; _arg2 = this -> TopPosition [ 1 ] ; _arg3 = this -> TopPosition [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << TopPosition  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetBasePositionBasePositionTopPositionTopPosition ( double _arg [ 3 ] ) { this -> GetBasePositionBasePositionTopPositionTopPosition ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetTopPosition*(this: var vtkFlagpoleLabel; x: cdouble; y: cdouble; z: cdouble) {.
    importcpp: "SetTopPosition", header: "vtkFlagpoleLabel.h".}
## !!!Ignored construct:  *
##  Set/Get the size of the flag. 1.0 is the default size
##  which corresponds to a preset texels/window value. Adjust this
##  to increase or decrease the default size.
##  virtual double GetFlagSizeFlagSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FlagSize  of  << this -> FlagSize ) ; return this -> FlagSize ; } ;
## Error: expected ';'!!!

proc SetFlagSize*(this: var vtkFlagpoleLabel; _arg: cdouble) {.
    importcpp: "SetFlagSize", header: "vtkFlagpoleLabel.h".}