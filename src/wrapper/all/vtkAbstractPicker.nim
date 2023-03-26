## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAbstractPicker.h
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
##  @class   vtkAbstractPicker
##  @brief   define API for picking subclasses
##
##  vtkAbstractPicker is an abstract superclass that defines a minimal API
##  for its concrete subclasses. The minimum functionality of a picker is
##  to return the x-y-z global coordinate position of a pick (the pick
##  itself is defined in display coordinates).
##
##  The API to this class is to invoke the Pick() method with a selection
##  point (in display coordinates - pixels) and a renderer. Then get the
##  resulting pick position in global coordinates with the GetPickPosition()
##  method.
##
##  vtkPicker fires events during the picking process.  These
##  events are StartPickEvent, PickEvent, and EndPickEvent which are
##  invoked prior to picking, when something is picked, and after all picking
##  candidates have been tested. Note that during the pick process the
##  PickEvent of vtkProp (and its subclasses such as vtkActor) is fired
##  prior to the PickEvent of vtkPicker.
##
##  @warning
##  vtkAbstractPicker and its subclasses will not pick props that are
##  "unpickable" (see vtkProp) or are fully transparent (if transparency
##  is a property of the vtkProp).
##
##  @warning
##  There are two classes of pickers: those that pick using geometric methods
##  (typically a ray cast); and those that use rendering hardware. Geometric
##  methods return more information but are slower. Hardware methods are much
##  faster and return minimal information. Examples of geometric pickers
##  include vtkPicker, vtkCellPicker, and vtkPointPicker. Examples of hardware
##  pickers include vtkWorldPointPicker and vtkPropPicker.
##
##  @sa
##  vtkPropPicker uses hardware acceleration to pick an instance of vtkProp.
##  (This means that 2D and 3D props can be picked, and it's relatively fast.)
##  If you need to pick cells or points, you might wish to use vtkCellPicker
##  or vtkPointPicker. vtkWorldPointPicker is the fastest picker, returning
##  an x-y-z coordinate value using the hardware z-buffer. vtkPicker can be
##  used to pick the bounding box of 3D props.
##

import
  vtkObject, vtkRenderingCoreModule

discard "forward decl of vtkRenderer"
discard "forward decl of vtkProp"
discard "forward decl of vtkPropCollection"
type
  vtkAbstractPicker* {.importcpp: "vtkAbstractPicker",
                      header: "vtkAbstractPicker.h", bycopy.} = object of vtkObject
    vtkAbstractPicker* {.importc: "vtkAbstractPicker".}: VTK_NEWINSTANCE
    ##  pick occurred in this renderer's viewport
    ##  selection point in window (pixel) coordinates
    ##  selection point in world coordinates
    ##  use the following to control picking from a list

  vtkAbstractPickerSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAbstractPicker::IsTypeOf(@)", header: "vtkAbstractPicker.h".}
proc IsA*(this: var vtkAbstractPicker; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkAbstractPicker.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAbstractPicker {.
    importcpp: "vtkAbstractPicker::SafeDownCast(@)", header: "vtkAbstractPicker.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAbstractPicker :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAbstractPicker :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAbstractPicker :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAbstractPicker; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkAbstractPicker.h".}
proc GetnameRenderer*(this: var vtkAbstractPicker): ptr vtkRenderer {.
    importcpp: "GetnameRenderer", header: "vtkAbstractPicker.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the selection point in screen (pixel) coordinates. The third
  ##  value is related to z-buffer depth. (Normally should be =0.)
  ##
## !!!Ignored construct:  virtual double * GetSelectionPoint ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << SelectionPoint  pointer  << this -> SelectionPoint ) ; return this -> SelectionPoint ; } VTK_WRAPEXCLUDE virtual void GetSelectionPoint ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> SelectionPoint [ i ] ; } } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Return position in global coordinates of pick point.
##  virtual double * GetSelectionPointPickPositionPickPosition ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << PickPosition  pointer  << this -> PickPosition ) ; return this -> PickPosition ; } VTK_WRAPEXCLUDE virtual void GetSelectionPointPickPositionPickPosition ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> PickPosition [ i ] ; } } ;
## Error: expected ';'!!!

proc Pick*(this: var vtkAbstractPicker; selectionX: cdouble; selectionY: cdouble;
          selectionZ: cdouble; renderer: ptr vtkRenderer): cint {.importcpp: "Pick",
    header: "vtkAbstractPicker.h".}
proc Pick*(this: var vtkAbstractPicker; selectionPt: array[3, cdouble];
          ren: ptr vtkRenderer): cint {.importcpp: "Pick",
                                    header: "vtkAbstractPicker.h".}
proc Pick3DPoint*(this: var vtkAbstractPicker; a2: array[3, cdouble]; a3: ptr vtkRenderer): cint {.
    importcpp: "Pick3DPoint", header: "vtkAbstractPicker.h".}
  ## ren
proc Pick3DRay*(this: var vtkAbstractPicker; a2: array[3, cdouble];
               a3: array[4, cdouble]; a4: ptr vtkRenderer): cint {.
    importcpp: "Pick3DRay", header: "vtkAbstractPicker.h".}
  ## ren
proc SetPickFromList*(this: var vtkAbstractPicker; _arg: vtkTypeBool) {.
    importcpp: "SetPickFromList", header: "vtkAbstractPicker.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetPickFromList ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PickFromList  of  << this -> PickFromList ) ; return this -> PickFromList ; } ;
## Error: expected ';'!!!

proc PickFromListOn*(this: var vtkAbstractPicker) {.importcpp: "PickFromListOn",
    header: "vtkAbstractPicker.h".}
proc PickFromListOff*(this: var vtkAbstractPicker) {.importcpp: "PickFromListOff",
    header: "vtkAbstractPicker.h".}
  ## /@}
  ## *
  ##  Initialize list of actors in pick list.
  ##
proc InitializePickList*(this: var vtkAbstractPicker) {.
    importcpp: "InitializePickList", header: "vtkAbstractPicker.h".}
proc AddPickList*(this: var vtkAbstractPicker; a2: ptr vtkProp) {.
    importcpp: "AddPickList", header: "vtkAbstractPicker.h".}
proc DeletePickList*(this: var vtkAbstractPicker; a2: ptr vtkProp) {.
    importcpp: "DeletePickList", header: "vtkAbstractPicker.h".}
proc GetPickList*(this: var vtkAbstractPicker): ptr vtkPropCollection {.
    importcpp: "GetPickList", header: "vtkAbstractPicker.h".}