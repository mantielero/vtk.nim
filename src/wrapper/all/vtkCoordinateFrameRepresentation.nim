## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCoordinateFrameRepresentation.h
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
##  @class   vtkCoordinateFrameRepresentation
##  @brief   a class defining the representation for a vtkCoordinateFrameWidget
##
##  This class is a concrete representation for the
##  vtkCoordinateFrameWidget. It represents a coordinate frame with an origin, 3 axis and
##  3 axis lockers. Through interaction with the widget, the coordinate frame can be manipulated
##  by adjusting the axis normals, locking them, or moving/picking the origin point.
##
##  The PlaceWidget() method is also used to initially position the
##  representation.
##
##  @warning
##  This class, and vtkCoordinateFrameWidget, are next generation VTK
##  widgets.
##

import
  vtkDeprecation, vtkInteractionWidgetsModule, vtkNew, vtkWidgetRepresentation

discard "forward decl of vtkActor"
discard "forward decl of vtkBox"
discard "forward decl of vtkCellPicker"
discard "forward decl of vtkConeSource"
discard "forward decl of vtkFeatureEdges"
discard "forward decl of vtkGenericCell"
discard "forward decl of vtkHardwarePicker"
discard "forward decl of vtkLineSource"
discard "forward decl of vtkPlane"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkPolyDataMapper"
discard "forward decl of vtkProperty"
discard "forward decl of vtkSphereSource"
discard "forward decl of vtkTransform"
type
  vtkCoordinateFrameRepresentation* {.importcpp: "vtkCoordinateFrameRepresentation", header: "vtkCoordinateFrameRepresentation.h",
                                     bycopy.} = object of vtkWidgetRepresentation ## *
                                                                             ##  Instantiate the class.
                                                                             ##
    vtkCoordinateFrameRepresentation* {.importc: "vtkCoordinateFrameRepresentation".}: VTK_NEWINSTANCE
    ##  Keep track of event positions
    ##  Locking normal to camera
    ##  The XVector cone source
    ##  The YVector cone source
    ##  The Vector Z cone source
    ##  Used for picking rendered props
    ##  Used for picking widget props
    ##  Compute Picker tolerance
    ##  Methods to manipulate the plane


proc New*(): ptr vtkCoordinateFrameRepresentation {.
    importcpp: "vtkCoordinateFrameRepresentation::New(@)",
    header: "vtkCoordinateFrameRepresentation.h".}
type
  vtkCoordinateFrameRepresentationSuperclass* = vtkWidgetRepresentation

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCoordinateFrameRepresentation::IsTypeOf(@)",
    header: "vtkCoordinateFrameRepresentation.h".}
proc IsA*(this: var vtkCoordinateFrameRepresentation; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkCoordinateFrameRepresentation.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCoordinateFrameRepresentation {.
    importcpp: "vtkCoordinateFrameRepresentation::SafeDownCast(@)",
    header: "vtkCoordinateFrameRepresentation.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCoordinateFrameRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWidgetRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCoordinateFrameRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCoordinateFrameRepresentation :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCoordinateFrameRepresentation; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkCoordinateFrameRepresentation.h".}
proc SetOrigin*(this: var vtkCoordinateFrameRepresentation; x: cdouble; y: cdouble;
               z: cdouble) {.importcpp: "SetOrigin",
                           header: "vtkCoordinateFrameRepresentation.h".}
proc SetOrigin*(this: var vtkCoordinateFrameRepresentation; x: array[3, cdouble]) {.
    importcpp: "SetOrigin", header: "vtkCoordinateFrameRepresentation.h".}
## !!!Ignored construct:  virtual double * GetOrigin ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Origin  pointer  << this -> Origin ) ; return this -> Origin ; } VTK_WRAPEXCLUDE virtual void GetOrigin ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Origin [ 0 ] ; _arg2 = this -> Origin [ 1 ] ; _arg3 = this -> Origin [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Origin  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOrigin ( double _arg [ 3 ] ) { this -> GetOrigin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetNormal*(this: var vtkCoordinateFrameRepresentation; x: cdouble; y: cdouble;
               z: cdouble) {.importcpp: "SetNormal",
                           header: "vtkCoordinateFrameRepresentation.h".}
proc SetNormal*(this: var vtkCoordinateFrameRepresentation; n: array[3, cdouble]) {.
    importcpp: "SetNormal", header: "vtkCoordinateFrameRepresentation.h".}
proc SetNormalToCamera*(this: var vtkCoordinateFrameRepresentation) {.
    importcpp: "SetNormalToCamera", header: "vtkCoordinateFrameRepresentation.h".}
## !!!Ignored construct:  virtual double * GetOriginXVectorNormal ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << XVectorNormal  pointer  << this -> XVectorNormal ) ; return this -> XVectorNormal ; } VTK_WRAPEXCLUDE virtual void GetOriginXVectorNormal ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> XVectorNormal [ 0 ] ; _arg2 = this -> XVectorNormal [ 1 ] ; _arg3 = this -> XVectorNormal [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << XVectorNormal  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOriginXVectorNormal ( double _arg [ 3 ] ) { this -> GetOriginXVectorNormal ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual double * GetOriginXVectorNormalYVectorNormal ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << YVectorNormal  pointer  << this -> YVectorNormal ) ; return this -> YVectorNormal ; } VTK_WRAPEXCLUDE virtual void GetOriginXVectorNormalYVectorNormal ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> YVectorNormal [ 0 ] ; _arg2 = this -> YVectorNormal [ 1 ] ; _arg3 = this -> YVectorNormal [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << YVectorNormal  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOriginXVectorNormalYVectorNormal ( double _arg [ 3 ] ) { this -> GetOriginXVectorNormalYVectorNormal ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual double * GetOriginXVectorNormalYVectorNormalZVectorNormal ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ZVectorNormal  pointer  << this -> ZVectorNormal ) ; return this -> ZVectorNormal ; } VTK_WRAPEXCLUDE virtual void GetOriginXVectorNormalYVectorNormalZVectorNormal ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> ZVectorNormal [ 0 ] ; _arg2 = this -> ZVectorNormal [ 1 ] ; _arg3 = this -> ZVectorNormal [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ZVectorNormal  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOriginXVectorNormalYVectorNormalZVectorNormal ( double _arg [ 3 ] ) { this -> GetOriginXVectorNormalYVectorNormalZVectorNormal ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetDirection*(this: var vtkCoordinateFrameRepresentation; x: cdouble; y: cdouble;
                  z: cdouble) {.importcpp: "SetDirection",
                              header: "vtkCoordinateFrameRepresentation.h".}
proc SetDirection*(this: var vtkCoordinateFrameRepresentation; d: array[3, cdouble]) {.
    importcpp: "SetDirection", header: "vtkCoordinateFrameRepresentation.h".}
proc SetXAxisVector*(this: var vtkCoordinateFrameRepresentation;
                    v: array[3, cdouble]) {.importcpp: "SetXAxisVector",
    header: "vtkCoordinateFrameRepresentation.h".}
proc SetXAxisVector*(this: var vtkCoordinateFrameRepresentation; x: cdouble;
                    y: cdouble; z: cdouble) {.importcpp: "SetXAxisVector",
    header: "vtkCoordinateFrameRepresentation.h".}
proc SetYAxisVector*(this: var vtkCoordinateFrameRepresentation;
                    v: array[3, cdouble]) {.importcpp: "SetYAxisVector",
    header: "vtkCoordinateFrameRepresentation.h".}
proc SetYAxisVector*(this: var vtkCoordinateFrameRepresentation; x: cdouble;
                    y: cdouble; z: cdouble) {.importcpp: "SetYAxisVector",
    header: "vtkCoordinateFrameRepresentation.h".}
proc SetZAxisVector*(this: var vtkCoordinateFrameRepresentation;
                    v: array[3, cdouble]) {.importcpp: "SetZAxisVector",
    header: "vtkCoordinateFrameRepresentation.h".}
proc SetZAxisVector*(this: var vtkCoordinateFrameRepresentation; x: cdouble;
                    y: cdouble; z: cdouble) {.importcpp: "SetZAxisVector",
    header: "vtkCoordinateFrameRepresentation.h".}
proc SetLockNormalToCamera*(this: var vtkCoordinateFrameRepresentation;
                           a2: vtkTypeBool) {.importcpp: "SetLockNormalToCamera",
    header: "vtkCoordinateFrameRepresentation.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetLockNormalToCamera ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LockNormalToCamera  of  << this -> LockNormalToCamera ) ; return this -> LockNormalToCamera ; } ;
## Error: expected ';'!!!

proc LockNormalToCameraOn*(this: var vtkCoordinateFrameRepresentation) {.
    importcpp: "LockNormalToCameraOn",
    header: "vtkCoordinateFrameRepresentation.h".}
proc LockNormalToCameraOff*(this: var vtkCoordinateFrameRepresentation) {.
    importcpp: "LockNormalToCameraOff",
    header: "vtkCoordinateFrameRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Toggles constraint translation axis on/off.
  ##
proc SetXTranslationAxisOn*(this: var vtkCoordinateFrameRepresentation) {.
    importcpp: "SetXTranslationAxisOn",
    header: "vtkCoordinateFrameRepresentation.h".}
proc SetYTranslationAxisOn*(this: var vtkCoordinateFrameRepresentation) {.
    importcpp: "SetYTranslationAxisOn",
    header: "vtkCoordinateFrameRepresentation.h".}
proc SetZTranslationAxisOn*(this: var vtkCoordinateFrameRepresentation) {.
    importcpp: "SetZTranslationAxisOn",
    header: "vtkCoordinateFrameRepresentation.h".}
proc SetTranslationAxisOff*(this: var vtkCoordinateFrameRepresentation) {.
    importcpp: "SetTranslationAxisOff",
    header: "vtkCoordinateFrameRepresentation.h".}
proc IsTranslationConstrained*(this: var vtkCoordinateFrameRepresentation): bool {.
    importcpp: "IsTranslationConstrained",
    header: "vtkCoordinateFrameRepresentation.h".}
proc UpdatePlacement*(this: var vtkCoordinateFrameRepresentation) {.
    importcpp: "UpdatePlacement", header: "vtkCoordinateFrameRepresentation.h".}
proc Reset*(this: var vtkCoordinateFrameRepresentation) {.importcpp: "Reset",
    header: "vtkCoordinateFrameRepresentation.h".}
proc ResetAxes*(this: var vtkCoordinateFrameRepresentation) {.
    importcpp: "ResetAxes", header: "vtkCoordinateFrameRepresentation.h".}
proc GetnameOriginProperty*(this: var vtkCoordinateFrameRepresentation): ptr vtkProperty {.
    importcpp: "GetnameOriginProperty",
    header: "vtkCoordinateFrameRepresentation.h".}
proc GetnameOriginPropertySelectedOriginProperty*(
    this: var vtkCoordinateFrameRepresentation): ptr vtkProperty {.
    importcpp: "GetnameOriginPropertySelectedOriginProperty",
    header: "vtkCoordinateFrameRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the properties on the XVector. The properties of the XVector when selected
  ##  and unselected can be manipulated.
  ##
proc GetnameOriginPropertySelectedOriginPropertyXVectorProperty*(
    this: var vtkCoordinateFrameRepresentation): ptr vtkProperty {.
    importcpp: "GetnameOriginPropertySelectedOriginPropertyXVectorProperty",
    header: "vtkCoordinateFrameRepresentation.h".}
proc GetnameOriginPropertySelectedOriginPropertyXVectorPropertySelectedXVectorProperty*(
    this: var vtkCoordinateFrameRepresentation): ptr vtkProperty {.importcpp: "GetnameOriginPropertySelectedOriginPropertyXVectorPropertySelectedXVectorProperty",
    header: "vtkCoordinateFrameRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the properties on the LockedXVector. The properties of the LockedXVector when selected
  ##  and unselected can be manipulated.
  ##
proc GetnameOriginPropertySelectedOriginPropertyXVectorPropertySelectedXVectorPropertyLockedXVectorProperty*(
    this: var vtkCoordinateFrameRepresentation): ptr vtkProperty {.importcpp: "GetnameOriginPropertySelectedOriginPropertyXVectorPropertySelectedXVectorPropertyLockedXVectorProperty",
    header: "vtkCoordinateFrameRepresentation.h".}
proc GetnameOriginPropertySelectedOriginPropertyXVectorPropertySelectedXVectorPropertyLockedXVectorPropertySelectedLockedXVectorProperty*(
    this: var vtkCoordinateFrameRepresentation): ptr vtkProperty {.importcpp: "GetnameOriginPropertySelectedOriginPropertyXVectorPropertySelectedXVectorPropertyLockedXVectorPropertySelectedLockedXVectorProperty",
    header: "vtkCoordinateFrameRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the properties on the UnlockedXVector. The properties of the UnlockedXVector when selected
  ##  and unselected can be manipulated.
  ##
proc GetnameOriginPropertySelectedOriginPropertyXVectorPropertySelectedXVectorPropertyLockedXVectorPropertySelectedLockedXVectorPropertyUnlockedXVectorProperty*(
    this: var vtkCoordinateFrameRepresentation): ptr vtkProperty {.importcpp: "GetnameOriginPropertySelectedOriginPropertyXVectorPropertySelectedXVectorPropertyLockedXVectorPropertySelectedLockedXVectorPropertyUnlockedXVectorProperty",
    header: "vtkCoordinateFrameRepresentation.h".}
proc GetnameOriginPropertySelectedOriginPropertyXVectorPropertySelectedXVectorPropertyLockedXVectorPropertySelectedLockedXVectorPropertyUnlockedXVectorPropertySelectedUnlockedXVectorProperty*(
    this: var vtkCoordinateFrameRepresentation): ptr vtkProperty {.importcpp: "GetnameOriginPropertySelectedOriginPropertyXVectorPropertySelectedXVectorPropertyLockedXVectorPropertySelectedLockedXVectorPropertyUnlockedXVectorPropertySelectedUnlockedXVectorProperty",
    header: "vtkCoordinateFrameRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the properties on the YVector. The properties of the YVector when selected
  ##  and unselected can be manipulated.
  ##
proc GetnameOriginPropertySelectedOriginPropertyXVectorPropertySelectedXVectorPropertyLockedXVectorPropertySelectedLockedXVectorPropertyUnlockedXVectorPropertySelectedUnlockedXVectorPropertyYVectorProperty*(
    this: var vtkCoordinateFrameRepresentation): ptr vtkProperty {.importcpp: "GetnameOriginPropertySelectedOriginPropertyXVectorPropertySelectedXVectorPropertyLockedXVectorPropertySelectedLockedXVectorPropertyUnlockedXVectorPropertySelectedUnlockedXVectorPropertyYVectorProperty",
    header: "vtkCoordinateFrameRepresentation.h".}
proc GetnameOriginPropertySelectedOriginPropertyXVectorPropertySelectedXVectorPropertyLockedXVectorPropertySelectedLockedXVectorPropertyUnlockedXVectorPropertySelectedUnlockedXVectorPropertyYVectorPropertySelectedYVectorProperty*(
    this: var vtkCoordinateFrameRepresentation): ptr vtkProperty {.importcpp: "GetnameOriginPropertySelectedOriginPropertyXVectorPropertySelectedXVectorPropertyLockedXVectorPropertySelectedLockedXVectorPropertyUnlockedXVectorPropertySelectedUnlockedXVectorPropertyYVectorPropertySelectedYVectorProperty",
    header: "vtkCoordinateFrameRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the properties on the LockedYVector. The properties of the LockedYVector when selected
  ##  and unselected can be manipulated.
  ##
proc GetnameOriginPropertySelectedOriginPropertyXVectorPropertySelectedXVectorPropertyLockedXVectorPropertySelectedLockedXVectorPropertyUnlockedXVectorPropertySelectedUnlockedXVectorPropertyYVectorPropertySelectedYVectorPropertyLockedYVectorProperty*(
    this: var vtkCoordinateFrameRepresentation): ptr vtkProperty {.importcpp: "GetnameOriginPropertySelectedOriginPropertyXVectorPropertySelectedXVectorPropertyLockedXVectorPropertySelectedLockedXVectorPropertyUnlockedXVectorPropertySelectedUnlockedXVectorPropertyYVectorPropertySelectedYVectorPropertyLockedYVectorProperty",
    header: "vtkCoordinateFrameRepresentation.h".}
proc GetnameOriginPropertySelectedOriginPropertyXVectorPropertySelectedXVectorPropertyLockedXVectorPropertySelectedLockedXVectorPropertyUnlockedXVectorPropertySelectedUnlockedXVectorPropertyYVectorPropertySelectedYVectorPropertyLockedYVectorPropertySelectedLockedYVectorProperty*(
    this: var vtkCoordinateFrameRepresentation): ptr vtkProperty {.importcpp: "GetnameOriginPropertySelectedOriginPropertyXVectorPropertySelectedXVectorPropertyLockedXVectorPropertySelectedLockedXVectorPropertyUnlockedXVectorPropertySelectedUnlockedXVectorPropertyYVectorPropertySelectedYVectorPropertyLockedYVectorPropertySelectedLockedYVectorProperty",
    header: "vtkCoordinateFrameRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the properties on the UnlockedYVector. The properties of the UnlockedYVector when selected
  ##  and unselected can be manipulated.
  ##
proc GetnameOriginPropertySelectedOriginPropertyXVectorPropertySelectedXVectorPropertyLockedXVectorPropertySelectedLockedXVectorPropertyUnlockedXVectorPropertySelectedUnlockedXVectorPropertyYVectorPropertySelectedYVectorPropertyLockedYVectorPropertySelectedLockedYVectorPropertyUnlockedYVectorProperty*(
    this: var vtkCoordinateFrameRepresentation): ptr vtkProperty {.importcpp: "GetnameOriginPropertySelectedOriginPropertyXVectorPropertySelectedXVectorPropertyLockedXVectorPropertySelectedLockedXVectorPropertyUnlockedXVectorPropertySelectedUnlockedXVectorPropertyYVectorPropertySelectedYVectorPropertyLockedYVectorPropertySelectedLockedYVectorPropertyUnlockedYVectorProperty",
    header: "vtkCoordinateFrameRepresentation.h".}
proc GetnameOriginPropertySelectedOriginPropertyXVectorPropertySelectedXVectorPropertyLockedXVectorPropertySelectedLockedXVectorPropertyUnlockedXVectorPropertySelectedUnlockedXVectorPropertyYVectorPropertySelectedYVectorPropertyLockedYVectorPropertySelectedLockedYVectorPropertyUnlockedYVectorPropertySelectedUnlockedYVectorProperty*(
    this: var vtkCoordinateFrameRepresentation): ptr vtkProperty {.importcpp: "GetnameOriginPropertySelectedOriginPropertyXVectorPropertySelectedXVectorPropertyLockedXVectorPropertySelectedLockedXVectorPropertyUnlockedXVectorPropertySelectedUnlockedXVectorPropertyYVectorPropertySelectedYVectorPropertyLockedYVectorPropertySelectedLockedYVectorPropertyUnlockedYVectorPropertySelectedUnlockedYVectorProperty",
    header: "vtkCoordinateFrameRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the properties on the ZVector. The properties of the ZVector when selected
  ##  and unselected can be manipulated.
  ##
proc GetnameOriginPropertySelectedOriginPropertyXVectorPropertySelectedXVectorPropertyLockedXVectorPropertySelectedLockedXVectorPropertyUnlockedXVectorPropertySelectedUnlockedXVectorPropertyYVectorPropertySelectedYVectorPropertyLockedYVectorPropertySelectedLockedYVectorPropertyUnlockedYVectorPropertySelectedUnlockedYVectorPropertyZVectorProperty*(
    this: var vtkCoordinateFrameRepresentation): ptr vtkProperty {.importcpp: "GetnameOriginPropertySelectedOriginPropertyXVectorPropertySelectedXVectorPropertyLockedXVectorPropertySelectedLockedXVectorPropertyUnlockedXVectorPropertySelectedUnlockedXVectorPropertyYVectorPropertySelectedYVectorPropertyLockedYVectorPropertySelectedLockedYVectorPropertyUnlockedYVectorPropertySelectedUnlockedYVectorPropertyZVectorProperty",
    header: "vtkCoordinateFrameRepresentation.h".}
proc GetnameOriginPropertySelectedOriginPropertyXVectorPropertySelectedXVectorPropertyLockedXVectorPropertySelectedLockedXVectorPropertyUnlockedXVectorPropertySelectedUnlockedXVectorPropertyYVectorPropertySelectedYVectorPropertyLockedYVectorPropertySelectedLockedYVectorPropertyUnlockedYVectorPropertySelectedUnlockedYVectorPropertyZVectorPropertySelectedZVectorProperty*(
    this: var vtkCoordinateFrameRepresentation): ptr vtkProperty {.importcpp: "GetnameOriginPropertySelectedOriginPropertyXVectorPropertySelectedXVectorPropertyLockedXVectorPropertySelectedLockedXVectorPropertyUnlockedXVectorPropertySelectedUnlockedXVectorPropertyYVectorPropertySelectedYVectorPropertyLockedYVectorPropertySelectedLockedYVectorPropertyUnlockedYVectorPropertySelectedUnlockedYVectorPropertyZVectorPropertySelectedZVectorProperty",
    header: "vtkCoordinateFrameRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the properties on the LockedZVector. The properties of the LockedZVector when selected
  ##  and unselected can be manipulated.
  ##
proc GetnameOriginPropertySelectedOriginPropertyXVectorPropertySelectedXVectorPropertyLockedXVectorPropertySelectedLockedXVectorPropertyUnlockedXVectorPropertySelectedUnlockedXVectorPropertyYVectorPropertySelectedYVectorPropertyLockedYVectorPropertySelectedLockedYVectorPropertyUnlockedYVectorPropertySelectedUnlockedYVectorPropertyZVectorPropertySelectedZVectorPropertyLockedZVectorProperty*(
    this: var vtkCoordinateFrameRepresentation): ptr vtkProperty {.importcpp: "GetnameOriginPropertySelectedOriginPropertyXVectorPropertySelectedXVectorPropertyLockedXVectorPropertySelectedLockedXVectorPropertyUnlockedXVectorPropertySelectedUnlockedXVectorPropertyYVectorPropertySelectedYVectorPropertyLockedYVectorPropertySelectedLockedYVectorPropertyUnlockedYVectorPropertySelectedUnlockedYVectorPropertyZVectorPropertySelectedZVectorPropertyLockedZVectorProperty",
    header: "vtkCoordinateFrameRepresentation.h".}
proc GetnameOriginPropertySelectedOriginPropertyXVectorPropertySelectedXVectorPropertyLockedXVectorPropertySelectedLockedXVectorPropertyUnlockedXVectorPropertySelectedUnlockedXVectorPropertyYVectorPropertySelectedYVectorPropertyLockedYVectorPropertySelectedLockedYVectorPropertyUnlockedYVectorPropertySelectedUnlockedYVectorPropertyZVectorPropertySelectedZVectorPropertyLockedZVectorPropertySelectedLockedZVectorProperty*(
    this: var vtkCoordinateFrameRepresentation): ptr vtkProperty {.importcpp: "GetnameOriginPropertySelectedOriginPropertyXVectorPropertySelectedXVectorPropertyLockedXVectorPropertySelectedLockedXVectorPropertyUnlockedXVectorPropertySelectedUnlockedXVectorPropertyYVectorPropertySelectedYVectorPropertyLockedYVectorPropertySelectedLockedYVectorPropertyUnlockedYVectorPropertySelectedUnlockedYVectorPropertyZVectorPropertySelectedZVectorPropertyLockedZVectorPropertySelectedLockedZVectorProperty",
    header: "vtkCoordinateFrameRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the properties on the UnlockedZVector. The properties of the UnlockedZVector when selected
  ##  and unselected can be manipulated.
  ##
proc GetnameOriginPropertySelectedOriginPropertyXVectorPropertySelectedXVectorPropertyLockedXVectorPropertySelectedLockedXVectorPropertyUnlockedXVectorPropertySelectedUnlockedXVectorPropertyYVectorPropertySelectedYVectorPropertyLockedYVectorPropertySelectedLockedYVectorPropertyUnlockedYVectorPropertySelectedUnlockedYVectorPropertyZVectorPropertySelectedZVectorPropertyLockedZVectorPropertySelectedLockedZVectorPropertyUnlockedZVectorProperty*(
    this: var vtkCoordinateFrameRepresentation): ptr vtkProperty {.importcpp: "GetnameOriginPropertySelectedOriginPropertyXVectorPropertySelectedXVectorPropertyLockedXVectorPropertySelectedLockedXVectorPropertyUnlockedXVectorPropertySelectedUnlockedXVectorPropertyYVectorPropertySelectedYVectorPropertyLockedYVectorPropertySelectedLockedYVectorPropertyUnlockedYVectorPropertySelectedUnlockedYVectorPropertyZVectorPropertySelectedZVectorPropertyLockedZVectorPropertySelectedLockedZVectorPropertyUnlockedZVectorProperty",
    header: "vtkCoordinateFrameRepresentation.h".}
proc GetnameOriginPropertySelectedOriginPropertyXVectorPropertySelectedXVectorPropertyLockedXVectorPropertySelectedLockedXVectorPropertyUnlockedXVectorPropertySelectedUnlockedXVectorPropertyYVectorPropertySelectedYVectorPropertyLockedYVectorPropertySelectedLockedYVectorPropertyUnlockedYVectorPropertySelectedUnlockedYVectorPropertyZVectorPropertySelectedZVectorPropertyLockedZVectorPropertySelectedLockedZVectorPropertyUnlockedZVectorPropertySelectedUnlockedZVectorProperty*(
    this: var vtkCoordinateFrameRepresentation): ptr vtkProperty {.importcpp: "GetnameOriginPropertySelectedOriginPropertyXVectorPropertySelectedXVectorPropertyLockedXVectorPropertySelectedLockedXVectorPropertyUnlockedXVectorPropertySelectedUnlockedXVectorPropertyYVectorPropertySelectedYVectorPropertyLockedYVectorPropertySelectedLockedYVectorPropertyUnlockedYVectorPropertySelectedUnlockedYVectorPropertyZVectorPropertySelectedZVectorPropertyLockedZVectorPropertySelectedLockedZVectorPropertyUnlockedZVectorPropertySelectedUnlockedZVectorProperty",
    header: "vtkCoordinateFrameRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Enable/Disable picking camera focal info if no result is available for PickOrigin, PickNormal
  ##  and PickDirectionPoint. The default is disabled.
  ##
## !!!Ignored construct:  virtual bool GetLockNormalToCameraPickCameraFocalInfo ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PickCameraFocalInfo  of  << this -> PickCameraFocalInfo ) ; return this -> PickCameraFocalInfo ; } ;
## Error: expected ';'!!!

proc SetPickCameraFocalInfo*(this: var vtkCoordinateFrameRepresentation; _arg: bool) {.
    importcpp: "SetPickCameraFocalInfo",
    header: "vtkCoordinateFrameRepresentation.h".}
proc PickCameraFocalInfoOn*(this: var vtkCoordinateFrameRepresentation) {.
    importcpp: "PickCameraFocalInfoOn",
    header: "vtkCoordinateFrameRepresentation.h".}
proc PickCameraFocalInfoOff*(this: var vtkCoordinateFrameRepresentation) {.
    importcpp: "PickCameraFocalInfoOff",
    header: "vtkCoordinateFrameRepresentation.h".}
  ## /@}
  ## *
  ##  Given the X, Y display coordinates, pick a new origin for the coordinate frame
  ##  from a point that is on the objects rendered by the renderer.
  ##
  ##  Note: if a point from a rendered object is not picked, the camera focal point can optionally be
  ##  set.
  ##
proc PickOrigin*(this: var vtkCoordinateFrameRepresentation; X: cint; Y: cint;
                snapToMeshPoint: bool = false): bool {.importcpp: "PickOrigin",
    header: "vtkCoordinateFrameRepresentation.h".}
proc PickNormal*(this: var vtkCoordinateFrameRepresentation; X: cint; Y: cint;
                snapToMeshPoint: bool = false): bool {.importcpp: "PickNormal",
    header: "vtkCoordinateFrameRepresentation.h".}
proc PickDirectionPoint*(this: var vtkCoordinateFrameRepresentation; X: cint; Y: cint;
                        snapToMeshPoint: bool = false): bool {.
    importcpp: "PickDirectionPoint", header: "vtkCoordinateFrameRepresentation.h".}
proc GetLockedAxis*(this: vtkCoordinateFrameRepresentation): cint {.noSideEffect,
    importcpp: "GetLockedAxis", header: "vtkCoordinateFrameRepresentation.h".}
proc SetLockedAxis*(this: var vtkCoordinateFrameRepresentation; axis: cint) {.
    importcpp: "SetLockedAxis", header: "vtkCoordinateFrameRepresentation.h".}
proc ComputeInteractionState*(this: var vtkCoordinateFrameRepresentation; X: cint;
                             Y: cint; modify: cint = 0): cint {.
    importcpp: "ComputeInteractionState",
    header: "vtkCoordinateFrameRepresentation.h".}
proc PlaceWidget*(this: var vtkCoordinateFrameRepresentation;
                 bounds: array[6, cdouble]) {.importcpp: "PlaceWidget",
    header: "vtkCoordinateFrameRepresentation.h".}
proc BuildRepresentation*(this: var vtkCoordinateFrameRepresentation) {.
    importcpp: "BuildRepresentation", header: "vtkCoordinateFrameRepresentation.h".}
proc StartWidgetInteraction*(this: var vtkCoordinateFrameRepresentation;
                            eventPos: array[2, cdouble]) {.
    importcpp: "StartWidgetInteraction",
    header: "vtkCoordinateFrameRepresentation.h".}
proc WidgetInteraction*(this: var vtkCoordinateFrameRepresentation;
                       newEventPos: array[2, cdouble]) {.
    importcpp: "WidgetInteraction", header: "vtkCoordinateFrameRepresentation.h".}
proc EndWidgetInteraction*(this: var vtkCoordinateFrameRepresentation;
                          newEventPos: array[2, cdouble]) {.
    importcpp: "EndWidgetInteraction",
    header: "vtkCoordinateFrameRepresentation.h".}
## !!!Ignored construct:  /@} /@{ *
##  Methods supporting the rendering process.
##  double * GetBounds ( ) VTK_SIZEHINT ( 6 ) override ;
## Error: expected ';'!!!

proc GetActors*(this: var vtkCoordinateFrameRepresentation;
               pc: ptr vtkPropCollection) {.importcpp: "GetActors",
    header: "vtkCoordinateFrameRepresentation.h".}
proc ReleaseGraphicsResources*(this: var vtkCoordinateFrameRepresentation;
                              a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources",
    header: "vtkCoordinateFrameRepresentation.h".}
proc RenderOpaqueGeometry*(this: var vtkCoordinateFrameRepresentation;
                          a2: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry",
    header: "vtkCoordinateFrameRepresentation.h".}
proc RenderTranslucentPolygonalGeometry*(this: var vtkCoordinateFrameRepresentation;
                                        a2: ptr vtkViewport): cint {.
    importcpp: "RenderTranslucentPolygonalGeometry",
    header: "vtkCoordinateFrameRepresentation.h".}
proc HasTranslucentPolygonalGeometry*(this: var vtkCoordinateFrameRepresentation): vtkTypeBool {.
    importcpp: "HasTranslucentPolygonalGeometry",
    header: "vtkCoordinateFrameRepresentation.h".}
type
  vtkCoordinateFrameRepresentationInteractionStateType* {.size: sizeof(cint),
      importcpp: "vtkCoordinateFrameRepresentation::InteractionStateType",
      header: "vtkCoordinateFrameRepresentation.h".} = enum
    Outside = 0, Moving, MovingOrigin, RotatingXVector, RotatingYVector,
    RotatingZVector, ModifyingLockerXVector, ModifyingLockerYVector,
    ModifyingLockerZVector


## !!!Ignored construct:  # ! defined ( VTK_LEGACY_REMOVE ) [NewLine] VTK_DEPRECATED_IN_9_2_0 ( because leading underscore is reserved ) typedef InteractionStateType _InteractionState ;
## Error: identifier expected, but got: because leading underscore is reserved!!!

proc SetInteractionState*(this: var vtkCoordinateFrameRepresentation; _arg: cint) {.
    importcpp: "SetInteractionState", header: "vtkCoordinateFrameRepresentation.h".}
proc GetInteractionStateMinValue*(this: var vtkCoordinateFrameRepresentation): cint {.
    importcpp: "GetInteractionStateMinValue",
    header: "vtkCoordinateFrameRepresentation.h".}
proc GetInteractionStateMaxValue*(this: var vtkCoordinateFrameRepresentation): cint {.
    importcpp: "GetInteractionStateMaxValue",
    header: "vtkCoordinateFrameRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Sets the visual appearance of the representation based on the
  ##  state it is in. This state is usually the same as InteractionState.
  ##
proc SetRepresentationState*(this: var vtkCoordinateFrameRepresentation; a2: cint) {.
    importcpp: "SetRepresentationState",
    header: "vtkCoordinateFrameRepresentation.h".}
## !!!Ignored construct:  virtual int GetLockNormalToCameraPickCameraFocalInfoRepresentationState ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RepresentationState  of  << this -> RepresentationState ) ; return this -> RepresentationState ; } ;
## Error: expected ';'!!!

proc SetInteractionStateLengthFactor*(this: var vtkCoordinateFrameRepresentation;
                                     _arg: cdouble) {.
    importcpp: "SetInteractionStateLengthFactor",
    header: "vtkCoordinateFrameRepresentation.h".}
proc GetInteractionStateMinValueLengthFactorMinValue*(
    this: var vtkCoordinateFrameRepresentation): cdouble {.
    importcpp: "GetInteractionStateMinValueLengthFactorMinValue",
    header: "vtkCoordinateFrameRepresentation.h".}
proc GetInteractionStateMaxValueLengthFactorMaxValue*(
    this: var vtkCoordinateFrameRepresentation): cdouble {.
    importcpp: "GetInteractionStateMaxValueLengthFactorMaxValue",
    header: "vtkCoordinateFrameRepresentation.h".}
## !!!Ignored construct:  virtual double GetLockNormalToCameraPickCameraFocalInfoRepresentationStateLengthFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LengthFactor  of  << this -> LengthFactor ) ; return this -> LengthFactor ; } ;
## Error: expected ';'!!!
