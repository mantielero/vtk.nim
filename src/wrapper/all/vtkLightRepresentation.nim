## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLightRepresentation.h
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
##  @class   vtkLightRepresentation
##  @brief   represent a vtkLight
##
##  The vtkLightRepresentation is a representation for the vtkLight.
##  This representation consists of a LightPosition sphere with an automatically resized
##  radius so it is always visible, a line between the LightPosition and the FocalPoint and
##  a cone of angle ConeAngle when using Positional.
##
##  @sa
##  vtkLightWidget vtkSphereWidget vtkSphereRepresentation
##

import
  vtkInteractionWidgetsModule, vtkNew, vtkWidgetRepresentation

discard "forward decl of vtkActor"
discard "forward decl of vtkBox"
discard "forward decl of vtkCellPicker"
discard "forward decl of vtkConeSource"
discard "forward decl of vtkLineSource"
discard "forward decl of vtkPointHandleRepresentation3D"
discard "forward decl of vtkPolyDataMapper"
discard "forward decl of vtkProperty"
discard "forward decl of vtkSphereSource"
type
  vtkLightRepresentation* {.importcpp: "vtkLightRepresentation",
                           header: "vtkLightRepresentation.h", bycopy.} = object of vtkWidgetRepresentation
    vtkLightRepresentation* {.importc: "vtkLightRepresentation".}: VTK_NEWINSTANCE
    ##  the Sphere
    ##  the Cone
    ##  the Line


proc New*(): ptr vtkLightRepresentation {.importcpp: "vtkLightRepresentation::New(@)",
                                      header: "vtkLightRepresentation.h".}
type
  vtkLightRepresentationSuperclass* = vtkWidgetRepresentation

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkLightRepresentation::IsTypeOf(@)",
    header: "vtkLightRepresentation.h".}
proc IsA*(this: var vtkLightRepresentation; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkLightRepresentation.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkLightRepresentation {.
    importcpp: "vtkLightRepresentation::SafeDownCast(@)",
    header: "vtkLightRepresentation.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkLightRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWidgetRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLightRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLightRepresentation :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkLightRepresentation; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkLightRepresentation.h".}
proc SetPositional*(this: var vtkLightRepresentation; _arg: bool) {.
    importcpp: "SetPositional", header: "vtkLightRepresentation.h".}
## !!!Ignored construct:  virtual bool GetPositional ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Positional  of  << this -> Positional ) ; return this -> Positional ; } ;
## Error: expected ';'!!!

proc PositionalOn*(this: var vtkLightRepresentation) {.importcpp: "PositionalOn",
    header: "vtkLightRepresentation.h".}
proc PositionalOff*(this: var vtkLightRepresentation) {.importcpp: "PositionalOff",
    header: "vtkLightRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the coordinates of the position of the light representation.
  ##
proc SetLightPosition*(this: var vtkLightRepresentation; pos: array[3, cdouble]) {.
    importcpp: "SetLightPosition", header: "vtkLightRepresentation.h".}
## !!!Ignored construct:  virtual double * GetLightPosition ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << LightPosition  pointer  << this -> LightPosition ) ; return this -> LightPosition ; } VTK_WRAPEXCLUDE virtual void GetLightPosition ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> LightPosition [ 0 ] ; _arg2 = this -> LightPosition [ 1 ] ; _arg3 = this -> LightPosition [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << LightPosition  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetLightPosition ( double _arg [ 3 ] ) { this -> GetLightPosition ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetFocalPoint*(this: var vtkLightRepresentation; pos: array[3, cdouble]) {.
    importcpp: "SetFocalPoint", header: "vtkLightRepresentation.h".}
## !!!Ignored construct:  virtual double * GetLightPositionFocalPoint ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << FocalPoint  pointer  << this -> FocalPoint ) ; return this -> FocalPoint ; } VTK_WRAPEXCLUDE virtual void GetLightPositionFocalPoint ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> FocalPoint [ 0 ] ; _arg2 = this -> FocalPoint [ 1 ] ; _arg3 = this -> FocalPoint [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << FocalPoint  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetLightPositionFocalPoint ( double _arg [ 3 ] ) { this -> GetLightPositionFocalPoint ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetConeAngle*(this: var vtkLightRepresentation; angle: cdouble) {.
    importcpp: "SetConeAngle", header: "vtkLightRepresentation.h".}
## !!!Ignored construct:  virtual double GetPositionalConeAngle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ConeAngle  of  << this -> ConeAngle ) ; return this -> ConeAngle ; } ;
## Error: expected ';'!!!

proc SetLightColor*(this: var vtkLightRepresentation; color: ptr cdouble) {.
    importcpp: "SetLightColor", header: "vtkLightRepresentation.h".}
## !!!Ignored construct:  double * GetLightColor ( ) VTK_SIZEHINT ( 3 ) ;
## Error: expected ';'!!!

const
  vtkLightRepresentationOutside* = 0
  vtkLightRepresentationMovingLight* = 1
  vtkLightRepresentationMovingFocalPoint* = 2
  vtkLightRepresentationMovingPositionalFocalPoint* = 3
  vtkLightRepresentationScalingConeAngle* = 4

proc SetInteractionState*(this: var vtkLightRepresentation; _arg: cint) {.
    importcpp: "SetInteractionState", header: "vtkLightRepresentation.h".}
proc GetInteractionStateMinValue*(this: var vtkLightRepresentation): cint {.
    importcpp: "GetInteractionStateMinValue", header: "vtkLightRepresentation.h".}
proc GetInteractionStateMaxValue*(this: var vtkLightRepresentation): cint {.
    importcpp: "GetInteractionStateMaxValue", header: "vtkLightRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the property used for all the actors
  ##
proc GetnameProperty*(this: var vtkLightRepresentation): ptr vtkProperty {.
    importcpp: "GetnameProperty", header: "vtkLightRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Method to satisfy superclasses' API.
  ##
proc BuildRepresentation*(this: var vtkLightRepresentation) {.
    importcpp: "BuildRepresentation", header: "vtkLightRepresentation.h".}
proc ComputeInteractionState*(this: var vtkLightRepresentation; X: cint; Y: cint;
                             modify: cint = 0): cint {.
    importcpp: "ComputeInteractionState", header: "vtkLightRepresentation.h".}
proc StartWidgetInteraction*(this: var vtkLightRepresentation;
                            eventPosition: array[2, cdouble]) {.
    importcpp: "StartWidgetInteraction", header: "vtkLightRepresentation.h".}
proc WidgetInteraction*(this: var vtkLightRepresentation;
                       eventPosition: array[2, cdouble]) {.
    importcpp: "WidgetInteraction", header: "vtkLightRepresentation.h".}
proc GetBounds*(this: var vtkLightRepresentation): ptr cdouble {.
    importcpp: "GetBounds", header: "vtkLightRepresentation.h".}
proc ReleaseGraphicsResources*(this: var vtkLightRepresentation; w: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkLightRepresentation.h".}
proc RenderOpaqueGeometry*(this: var vtkLightRepresentation;
                          viewport: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkLightRepresentation.h".}
proc RenderTranslucentPolygonalGeometry*(this: var vtkLightRepresentation;
                                        viewport: ptr vtkViewport): cint {.
    importcpp: "RenderTranslucentPolygonalGeometry",
    header: "vtkLightRepresentation.h".}