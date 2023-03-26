## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkViewport.h
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
##  @class   vtkViewport
##  @brief   abstract specification for Viewports
##
##  vtkViewport provides an abstract specification for Viewports. A Viewport
##  is an object that controls the rendering process for objects. Rendering
##  is the process of converting geometry, a specification for lights, and
##  a camera view into an image. vtkViewport also performs coordinate
##  transformation between world coordinates, view coordinates (the computer
##  graphics rendering coordinate system), and display coordinates (the
##  actual screen coordinates on the display device). Certain advanced
##  rendering features such as two-sided lighting can also be controlled.
##
##  @sa
##  vtkWindow vtkRenderer
##

import
  vtkObject, vtkRenderingCoreModule, vtkSelection, vtkSmartPointer

discard "forward decl of vtkActor2DCollection"
discard "forward decl of vtkAssemblyPath"
discard "forward decl of vtkProp"
discard "forward decl of vtkPropCollection"
discard "forward decl of vtkWindow"
type
  vtkViewport* {.importcpp: "vtkViewport", header: "vtkViewport.h", bycopy.} = object of vtkObject ##  Create a vtkViewport with a black background, a white ambient light,
                                                                                         ##  two-sided lighting turned on, a viewport of (0,0,1,1), and back face
                                                                                         ##  culling turned off.
    vtkViewport* {.importc: "vtkViewport".}: VTK_NEWINSTANCE
    ##  End Ivars for picking

  vtkViewportSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkViewport::IsTypeOf(@)", header: "vtkViewport.h".}
proc IsA*(this: var vtkViewport; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkViewport.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkViewport {.
    importcpp: "vtkViewport::SafeDownCast(@)", header: "vtkViewport.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkViewport :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkViewport :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkViewport :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkViewport; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkViewport.h".}
proc AddViewProp*(this: var vtkViewport; a2: ptr vtkProp) {.importcpp: "AddViewProp",
    header: "vtkViewport.h".}
proc GetViewProps*(this: var vtkViewport): ptr vtkPropCollection {.
    importcpp: "GetViewProps", header: "vtkViewport.h".}
proc HasViewProp*(this: var vtkViewport; a2: ptr vtkProp): cint {.
    importcpp: "HasViewProp", header: "vtkViewport.h".}
proc RemoveViewProp*(this: var vtkViewport; a2: ptr vtkProp) {.
    importcpp: "RemoveViewProp", header: "vtkViewport.h".}
proc RemoveAllViewProps*(this: var vtkViewport) {.importcpp: "RemoveAllViewProps",
    header: "vtkViewport.h".}
proc AddActor2D*(this: var vtkViewport; p: ptr vtkProp) {.importcpp: "AddActor2D",
    header: "vtkViewport.h".}
proc RemoveActor2D*(this: var vtkViewport; p: ptr vtkProp) {.
    importcpp: "RemoveActor2D", header: "vtkViewport.h".}
proc GetActors2D*(this: var vtkViewport): ptr vtkActor2DCollection {.
    importcpp: "GetActors2D", header: "vtkViewport.h".}
proc SetBackground*(this: var vtkViewport; _arg1: cdouble; _arg2: cdouble;
                   _arg3: cdouble) {.importcpp: "SetBackground",
                                   header: "vtkViewport.h".}
proc SetBackground*(this: var vtkViewport; _arg: array[3, cdouble]) {.
    importcpp: "SetBackground", header: "vtkViewport.h".}
## !!!Ignored construct:  virtual double * GetBackground ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Background  pointer  << this -> Background ) ; return this -> Background ; } VTK_WRAPEXCLUDE virtual void GetBackground ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Background [ 0 ] ; _arg2 = this -> Background [ 1 ] ; _arg3 = this -> Background [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Background  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetBackground ( double _arg [ 3 ] ) { this -> GetBackground ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetBackgroundBackground2*(this: var vtkViewport; _arg1: cdouble; _arg2: cdouble;
                              _arg3: cdouble) {.
    importcpp: "SetBackgroundBackground2", header: "vtkViewport.h".}
proc SetBackgroundBackground2*(this: var vtkViewport; _arg: array[3, cdouble]) {.
    importcpp: "SetBackgroundBackground2", header: "vtkViewport.h".}
## !!!Ignored construct:  virtual double * GetBackgroundBackground2 ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Background2  pointer  << this -> Background2 ) ; return this -> Background2 ; } VTK_WRAPEXCLUDE virtual void GetBackgroundBackground2 ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Background2 [ 0 ] ; _arg2 = this -> Background2 [ 1 ] ; _arg3 = this -> Background2 [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Background2  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetBackgroundBackground2 ( double _arg [ 3 ] ) { this -> GetBackgroundBackground2 ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetBackgroundAlpha*(this: var vtkViewport; _arg: cdouble) {.
    importcpp: "SetBackgroundAlpha", header: "vtkViewport.h".}
proc GetBackgroundAlphaMinValue*(this: var vtkViewport): cdouble {.
    importcpp: "GetBackgroundAlphaMinValue", header: "vtkViewport.h".}
proc GetBackgroundAlphaMaxValue*(this: var vtkViewport): cdouble {.
    importcpp: "GetBackgroundAlphaMaxValue", header: "vtkViewport.h".}
## !!!Ignored construct:  virtual double GetBackgroundAlpha ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BackgroundAlpha  of  << this -> BackgroundAlpha ) ; return this -> BackgroundAlpha ; } ;
## Error: expected ';'!!!

proc SetGradientBackground*(this: var vtkViewport; _arg: bool) {.
    importcpp: "SetGradientBackground", header: "vtkViewport.h".}
## !!!Ignored construct:  virtual bool GetBackgroundAlphaGradientBackground ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GradientBackground  of  << this -> GradientBackground ) ; return this -> GradientBackground ; } ;
## Error: expected ';'!!!

proc GradientBackgroundOn*(this: var vtkViewport) {.
    importcpp: "GradientBackgroundOn", header: "vtkViewport.h".}
proc GradientBackgroundOff*(this: var vtkViewport) {.
    importcpp: "GradientBackgroundOff", header: "vtkViewport.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the aspect ratio of the rendered image. This is computed
  ##  automatically and should not be set by the user.
  ##
proc SetAspect*(this: var vtkViewport; _arg1: cdouble; _arg2: cdouble) {.
    importcpp: "SetAspect", header: "vtkViewport.h".}
proc SetAspect*(this: var vtkViewport; _arg: array[2, cdouble]) {.
    importcpp: "SetAspect", header: "vtkViewport.h".}
## !!!Ignored construct:  virtual double * GetAspect ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Aspect  pointer  << this -> Aspect ) ; return this -> Aspect ; } VTK_WRAPEXCLUDE virtual void GetAspect ( double data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> Aspect [ i ] ; } } ;
## Error: expected ';'!!!

proc ComputeAspect*(this: var vtkViewport) {.importcpp: "ComputeAspect",
    header: "vtkViewport.h".}
proc SetAspectPixelAspect*(this: var vtkViewport; _arg1: cdouble; _arg2: cdouble) {.
    importcpp: "SetAspectPixelAspect", header: "vtkViewport.h".}
proc SetAspectPixelAspect*(this: var vtkViewport; _arg: array[2, cdouble]) {.
    importcpp: "SetAspectPixelAspect", header: "vtkViewport.h".}
## !!!Ignored construct:  virtual double * GetAspectPixelAspect ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << PixelAspect  pointer  << this -> PixelAspect ) ; return this -> PixelAspect ; } VTK_WRAPEXCLUDE virtual void GetAspectPixelAspect ( double data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> PixelAspect [ i ] ; } } ;
## Error: expected ';'!!!

proc SetViewport*(this: var vtkViewport; _arg1: cdouble; _arg2: cdouble; _arg3: cdouble;
                 _arg4: cdouble) {.importcpp: "SetViewport", header: "vtkViewport.h".}
proc SetViewport*(this: var vtkViewport; _arg: array[4, cdouble]) {.
    importcpp: "SetViewport", header: "vtkViewport.h".}
## !!!Ignored construct:  virtual double * GetAspectPixelAspectViewport ( ) VTK_SIZEHINT ( 4 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Viewport  pointer  << this -> Viewport ) ; return this -> Viewport ; } VTK_WRAPEXCLUDE virtual void GetAspectPixelAspectViewport ( double data [ 4 ] ) { for ( int i = 0 ; i < 4 ; i ++ ) { data [ i ] = this -> Viewport [ i ] ; } } ;
## Error: expected ';'!!!

proc SetBackgroundBackground2DisplayPoint*(this: var vtkViewport; _arg1: cdouble;
    _arg2: cdouble; _arg3: cdouble) {.importcpp: "SetBackgroundBackground2DisplayPoint",
                                  header: "vtkViewport.h".}
proc SetBackgroundBackground2DisplayPoint*(this: var vtkViewport;
    _arg: array[3, cdouble]) {.importcpp: "SetBackgroundBackground2DisplayPoint",
                            header: "vtkViewport.h".}
## !!!Ignored construct:  virtual double * GetAspectPixelAspectViewportDisplayPoint ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << DisplayPoint  pointer  << this -> DisplayPoint ) ; return this -> DisplayPoint ; } VTK_WRAPEXCLUDE virtual void GetAspectPixelAspectViewportDisplayPoint ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> DisplayPoint [ i ] ; } } ;
## Error: expected ';'!!!

proc SetBackgroundBackground2DisplayPointViewPoint*(this: var vtkViewport;
    _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetBackgroundBackground2DisplayPointViewPoint",
    header: "vtkViewport.h".}
proc SetBackgroundBackground2DisplayPointViewPoint*(this: var vtkViewport;
    _arg: array[3, cdouble]) {.importcpp: "SetBackgroundBackground2DisplayPointViewPoint",
                            header: "vtkViewport.h".}
## !!!Ignored construct:  virtual double * GetAspectPixelAspectViewportDisplayPointViewPoint ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ViewPoint  pointer  << this -> ViewPoint ) ; return this -> ViewPoint ; } VTK_WRAPEXCLUDE virtual void GetAspectPixelAspectViewportDisplayPointViewPoint ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> ViewPoint [ i ] ; } } ;
## Error: expected ';'!!!

proc SetViewportWorldPoint*(this: var vtkViewport; _arg1: cdouble; _arg2: cdouble;
                           _arg3: cdouble; _arg4: cdouble) {.
    importcpp: "SetViewportWorldPoint", header: "vtkViewport.h".}
proc SetViewportWorldPoint*(this: var vtkViewport; _arg: array[4, cdouble]) {.
    importcpp: "SetViewportWorldPoint", header: "vtkViewport.h".}
## !!!Ignored construct:  virtual double * GetAspectPixelAspectViewportDisplayPointViewPointWorldPoint ( ) VTK_SIZEHINT ( 4 ) { vtkDebugWithObjectMacro ( this , <<  returning  << WorldPoint  pointer  << this -> WorldPoint ) ; return this -> WorldPoint ; } VTK_WRAPEXCLUDE virtual void GetAspectPixelAspectViewportDisplayPointViewPointWorldPoint ( double data [ 4 ] ) { for ( int i = 0 ; i < 4 ; i ++ ) { data [ i ] = this -> WorldPoint [ i ] ; } } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} *
##  Return the center of this viewport in display coordinates.
##  virtual double * GetCenter ( ) VTK_SIZEHINT ( 2 ) ;
## Error: expected ';'!!!

proc IsInViewport*(this: var vtkViewport; x: cint; y: cint): cint {.
    importcpp: "IsInViewport", header: "vtkViewport.h".}
proc GetVTKWindow*(this: var vtkViewport): ptr vtkWindow {.importcpp: "GetVTKWindow",
    header: "vtkViewport.h".}
proc DisplayToView*(this: var vtkViewport) {.importcpp: "DisplayToView",
    header: "vtkViewport.h".}
proc ViewToDisplay*(this: var vtkViewport) {.importcpp: "ViewToDisplay",
    header: "vtkViewport.h".}
proc WorldToView*(this: var vtkViewport) {.importcpp: "WorldToView",
                                       header: "vtkViewport.h".}
proc ViewToWorld*(this: var vtkViewport) {.importcpp: "ViewToWorld",
                                       header: "vtkViewport.h".}
proc DisplayToWorld*(this: var vtkViewport) {.importcpp: "DisplayToWorld",
    header: "vtkViewport.h".}
proc WorldToDisplay*(this: var vtkViewport) {.importcpp: "WorldToDisplay",
    header: "vtkViewport.h".}
proc WorldToDisplay*(this: var vtkViewport; x: var cdouble; y: var cdouble; z: var cdouble) {.
    importcpp: "WorldToDisplay", header: "vtkViewport.h".}
proc LocalDisplayToDisplay*(this: var vtkViewport; x: var cdouble; y: var cdouble) {.
    importcpp: "LocalDisplayToDisplay", header: "vtkViewport.h".}
proc DisplayToNormalizedDisplay*(this: var vtkViewport; u: var cdouble; v: var cdouble) {.
    importcpp: "DisplayToNormalizedDisplay", header: "vtkViewport.h".}
proc NormalizedDisplayToViewport*(this: var vtkViewport; x: var cdouble; y: var cdouble) {.
    importcpp: "NormalizedDisplayToViewport", header: "vtkViewport.h".}
proc ViewportToNormalizedViewport*(this: var vtkViewport; u: var cdouble;
                                  v: var cdouble) {.
    importcpp: "ViewportToNormalizedViewport", header: "vtkViewport.h".}
proc NormalizedViewportToView*(this: var vtkViewport; x: var cdouble; y: var cdouble;
                              z: var cdouble) {.
    importcpp: "NormalizedViewportToView", header: "vtkViewport.h".}
proc ViewToPose*(this: var vtkViewport; a2: var cdouble; a3: var cdouble; a4: var cdouble) {.
    importcpp: "ViewToPose", header: "vtkViewport.h".}
proc PoseToWorld*(this: var vtkViewport; a2: var cdouble; a3: var cdouble; a4: var cdouble) {.
    importcpp: "PoseToWorld", header: "vtkViewport.h".}
proc DisplayToLocalDisplay*(this: var vtkViewport; x: var cdouble; y: var cdouble) {.
    importcpp: "DisplayToLocalDisplay", header: "vtkViewport.h".}
proc NormalizedDisplayToDisplay*(this: var vtkViewport; u: var cdouble; v: var cdouble) {.
    importcpp: "NormalizedDisplayToDisplay", header: "vtkViewport.h".}
proc ViewportToNormalizedDisplay*(this: var vtkViewport; x: var cdouble; y: var cdouble) {.
    importcpp: "ViewportToNormalizedDisplay", header: "vtkViewport.h".}
proc NormalizedViewportToViewport*(this: var vtkViewport; u: var cdouble;
                                  v: var cdouble) {.
    importcpp: "NormalizedViewportToViewport", header: "vtkViewport.h".}
proc ViewToNormalizedViewport*(this: var vtkViewport; x: var cdouble; y: var cdouble;
                              z: var cdouble) {.
    importcpp: "ViewToNormalizedViewport", header: "vtkViewport.h".}
proc PoseToView*(this: var vtkViewport; a2: var cdouble; a3: var cdouble; a4: var cdouble) {.
    importcpp: "PoseToView", header: "vtkViewport.h".}
proc WorldToPose*(this: var vtkViewport; a2: var cdouble; a3: var cdouble; a4: var cdouble) {.
    importcpp: "WorldToPose", header: "vtkViewport.h".}
proc ViewToWorld*(this: var vtkViewport; a2: var cdouble; a3: var cdouble; a4: var cdouble) {.
    importcpp: "ViewToWorld", header: "vtkViewport.h".}
proc WorldToView*(this: var vtkViewport; a2: var cdouble; a3: var cdouble; a4: var cdouble) {.
    importcpp: "WorldToView", header: "vtkViewport.h".}
proc ViewToDisplay*(this: var vtkViewport; x: var cdouble; y: var cdouble; z: var cdouble) {.
    importcpp: "ViewToDisplay", header: "vtkViewport.h".}
## !!!Ignored construct:  /@} /@{ *
##  Get the size and origin of the viewport in display coordinates. Note:
##  if the window has not yet been realized, GetSize() and GetOrigin()
##  return (0,0).
##  virtual int * GetSize ( ) VTK_SIZEHINT ( 2 ) ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual int * GetOrigin ( ) VTK_SIZEHINT ( 2 ) ;
## Error: expected ';'!!!

proc GetTiledSize*(this: var vtkViewport; width: ptr cint; height: ptr cint) {.
    importcpp: "GetTiledSize", header: "vtkViewport.h".}
proc GetTiledSizeAndOrigin*(this: var vtkViewport; width: ptr cint; height: ptr cint;
                           lowerLeftX: ptr cint; lowerLeftY: ptr cint) {.
    importcpp: "GetTiledSizeAndOrigin", header: "vtkViewport.h".}
proc PickProp*(this: var vtkViewport; selectionX: cdouble; selectionY: cdouble): ptr vtkAssemblyPath {.
    importcpp: "PickProp", header: "vtkViewport.h".}
proc PickProp*(this: var vtkViewport; selectionX1: cdouble; selectionY1: cdouble;
              selectionX2: cdouble; selectionY2: cdouble): ptr vtkAssemblyPath {.
    importcpp: "PickProp", header: "vtkViewport.h".}
proc PickPropFrom*(this: var vtkViewport; selectionX: cdouble; selectionY: cdouble;
                  a4: ptr vtkPropCollection): ptr vtkAssemblyPath {.
    importcpp: "PickPropFrom", header: "vtkViewport.h".}
proc PickPropFrom*(this: var vtkViewport; selectionX1: cdouble; selectionY1: cdouble;
                  selectionX2: cdouble; selectionY2: cdouble;
                  a6: ptr vtkPropCollection): ptr vtkAssemblyPath {.
    importcpp: "PickPropFrom", header: "vtkViewport.h".}
proc PickProp*(this: var vtkViewport; selectionX: cdouble; selectionY: cdouble;
              fieldAssociation: cint; selection: vtkSmartPointer[vtkSelection]): ptr vtkAssemblyPath {.
    importcpp: "PickProp", header: "vtkViewport.h".}
proc PickProp*(this: var vtkViewport; selectionX1: cdouble; selectionY1: cdouble;
              selectionX2: cdouble; selectionY2: cdouble; fieldAssociation: cint;
              selection: vtkSmartPointer[vtkSelection]): ptr vtkAssemblyPath {.
    importcpp: "PickProp", header: "vtkViewport.h".}
proc PickPropFrom*(this: var vtkViewport; selectionX: cdouble; selectionY: cdouble;
                  a4: ptr vtkPropCollection; fieldAssociation: cint;
                  selection: vtkSmartPointer[vtkSelection]): ptr vtkAssemblyPath {.
    importcpp: "PickPropFrom", header: "vtkViewport.h".}
proc PickPropFrom*(this: var vtkViewport; selectionX1: cdouble; selectionY1: cdouble;
                  selectionX2: cdouble; selectionY2: cdouble;
                  a6: ptr vtkPropCollection; fieldAssociation: cint;
                  selection: vtkSmartPointer[vtkSelection]): ptr vtkAssemblyPath {.
    importcpp: "PickPropFrom", header: "vtkViewport.h".}
proc GetPickX*(this: vtkViewport): cdouble {.noSideEffect, importcpp: "GetPickX",
    header: "vtkViewport.h".}
proc GetPickY*(this: vtkViewport): cdouble {.noSideEffect, importcpp: "GetPickY",
    header: "vtkViewport.h".}
proc GetPickWidth*(this: vtkViewport): cdouble {.noSideEffect,
    importcpp: "GetPickWidth", header: "vtkViewport.h".}
proc GetPickHeight*(this: vtkViewport): cdouble {.noSideEffect,
    importcpp: "GetPickHeight", header: "vtkViewport.h".}
proc GetPickX1*(this: vtkViewport): cdouble {.noSideEffect, importcpp: "GetPickX1",
    header: "vtkViewport.h".}
proc GetPickY1*(this: vtkViewport): cdouble {.noSideEffect, importcpp: "GetPickY1",
    header: "vtkViewport.h".}
proc GetPickX2*(this: vtkViewport): cdouble {.noSideEffect, importcpp: "GetPickX2",
    header: "vtkViewport.h".}
proc GetPickY2*(this: vtkViewport): cdouble {.noSideEffect, importcpp: "GetPickY2",
    header: "vtkViewport.h".}
proc GetnamePickResultProps*(this: var vtkViewport): ptr vtkPropCollection {.
    importcpp: "GetnamePickResultProps", header: "vtkViewport.h".}
  ## /@}
  ## *
  ##  Return the Z value for the last picked Prop.
  ##
proc GetPickedZ*(this: var vtkViewport): cdouble {.importcpp: "GetPickedZ",
    header: "vtkViewport.h".}
proc SetBackgroundBackground2DisplayPointViewPointEnvironmentalBG*(
    this: var vtkViewport; _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetBackgroundBackground2DisplayPointViewPointEnvironmentalBG",
    header: "vtkViewport.h".}
proc SetBackgroundBackground2DisplayPointViewPointEnvironmentalBG*(
    this: var vtkViewport; _arg: array[3, cdouble]) {.
    importcpp: "SetBackgroundBackground2DisplayPointViewPointEnvironmentalBG",
    header: "vtkViewport.h".}
## !!!Ignored construct:  virtual double * GetBackgroundBackground2EnvironmentalBG ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << EnvironmentalBG  pointer  << this -> EnvironmentalBG ) ; return this -> EnvironmentalBG ; } VTK_WRAPEXCLUDE virtual void GetBackgroundBackground2EnvironmentalBG ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> EnvironmentalBG [ 0 ] ; _arg2 = this -> EnvironmentalBG [ 1 ] ; _arg3 = this -> EnvironmentalBG [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << EnvironmentalBG  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetBackgroundBackground2EnvironmentalBG ( double _arg [ 3 ] ) { this -> GetBackgroundBackground2EnvironmentalBG ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetBackgroundBackground2DisplayPointViewPointEnvironmentalBGEnvironmentalBG2*(
    this: var vtkViewport; _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.importcpp: "SetBackgroundBackground2DisplayPointViewPointEnvironmentalBGEnvironmentalBG2",
    header: "vtkViewport.h".}
proc SetBackgroundBackground2DisplayPointViewPointEnvironmentalBGEnvironmentalBG2*(
    this: var vtkViewport; _arg: array[3, cdouble]) {.importcpp: "SetBackgroundBackground2DisplayPointViewPointEnvironmentalBGEnvironmentalBG2",
    header: "vtkViewport.h".}
## !!!Ignored construct:  virtual double * GetBackgroundBackground2EnvironmentalBGEnvironmentalBG2 ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << EnvironmentalBG2  pointer  << this -> EnvironmentalBG2 ) ; return this -> EnvironmentalBG2 ; } VTK_WRAPEXCLUDE virtual void GetBackgroundBackground2EnvironmentalBGEnvironmentalBG2 ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> EnvironmentalBG2 [ 0 ] ; _arg2 = this -> EnvironmentalBG2 [ 1 ] ; _arg3 = this -> EnvironmentalBG2 [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << EnvironmentalBG2  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetBackgroundBackground2EnvironmentalBGEnvironmentalBG2 ( double _arg [ 3 ] ) { this -> GetBackgroundBackground2EnvironmentalBGEnvironmentalBG2 ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetGradientBackgroundGradientEnvironmentalBG*(this: var vtkViewport; _arg: bool) {.
    importcpp: "SetGradientBackgroundGradientEnvironmentalBG",
    header: "vtkViewport.h".}
## !!!Ignored construct:  virtual bool GetBackgroundAlphaGradientBackgroundGradientEnvironmentalBG ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GradientEnvironmentalBG  of  << this -> GradientEnvironmentalBG ) ; return this -> GradientEnvironmentalBG ; } ;
## Error: expected ';'!!!

proc GradientEnvironmentalBGOn*(this: var vtkViewport) {.
    importcpp: "GradientEnvironmentalBGOn", header: "vtkViewport.h".}
proc GradientEnvironmentalBGOff*(this: var vtkViewport) {.
    importcpp: "GradientEnvironmentalBGOff", header: "vtkViewport.h".}
  ## /@}