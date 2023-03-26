## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRenderer.h
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
##  @class   vtkRenderer
##  @brief   abstract specification for renderers
##
##  vtkRenderer provides an abstract specification for renderers. A renderer
##  is an object that controls the rendering process for objects. Rendering
##  is the process of converting geometry, a specification for lights, and
##  a camera view into an image. vtkRenderer also performs coordinate
##  transformation between world coordinates, view coordinates (the computer
##  graphics rendering coordinate system), and display coordinates (the
##  actual screen coordinates on the display device). Certain advanced
##  rendering features such as two-sided lighting can also be controlled.
##
##  @sa
##  vtkRenderWindow vtkActor vtkCamera vtkLight vtkVolume
##

import
  vtkRenderingCoreModule, vtkViewport, vtkActorCollection, vtkVolumeCollection

discard "forward decl of vtkFXAAOptions"
discard "forward decl of vtkRenderWindow"
discard "forward decl of vtkVolume"
discard "forward decl of vtkCuller"
discard "forward decl of vtkActor"
discard "forward decl of vtkActor2D"
discard "forward decl of vtkCamera"
discard "forward decl of vtkFrameBufferObjectBase"
discard "forward decl of vtkInformation"
discard "forward decl of vtkLightCollection"
discard "forward decl of vtkCullerCollection"
discard "forward decl of vtkLight"
discard "forward decl of vtkHardwareSelector"
discard "forward decl of vtkRendererDelegate"
discard "forward decl of vtkRenderPass"
discard "forward decl of vtkTexture"
discard "forward decl of vtkRecti"
discard "forward decl of vtkVector3d"
type
  vtkRenderer* {.importcpp: "vtkRenderer", header: "vtkRenderer.h", bycopy.} = object of vtkViewport ## *
                                                                                           ##  Cache of CompositeProjectionTransformationMatrix.
                                                                                           ##
    vtkRenderer* {.importc: "vtkRenderer".}: VTK_NEWINSTANCE
    ##  Allocate the time for each prop
    ##  A temporary list of props used for culling, and traversal
    ##  of all props when rendering
    ##  Indicates if the renderer should receive events from an interactor.
    ##  Typically only used in conjunction with transparent renderers.
    ##  Shows what layer this renderer belongs to.  Only of interested when
    ##  there are layered renderers.
    ##  Holds the result of ComputeVisiblePropBounds so that it is visible from
    ##  wrapped languages
    ## *
    ##  Specifies the minimum distance of the near clipping
    ##  plane as a percentage of the far clipping plane distance.  Values below
    ##  this threshold are clipped to NearClippingPlaneTolerance*range[1].
    ##  Note that values which are too small may cause problems on systems
    ##  with low z-buffer resolution.
    ##
    ## *
    ##  Specify enlargement of bounds when resetting the
    ##  camera clipping range.
    ##
    ## *
    ##  When this flag is off, the renderer will not erase the background
    ##  or the Zbuffer.  It is used to have overlapping renderers.
    ##  Both the RenderWindow Erase and Render Erase must be on
    ##  for the camera to clear the renderer.  By default, Erase is on.
    ##
    ## *
    ##  When this flag is off, render commands are ignored.  It is used to either
    ##  multiplex a vtkRenderWindow or render only part of a vtkRenderWindow.
    ##  By default, Draw is on.
    ##
    ## *
    ##  Temporary collection used by vtkRenderWindow::CaptureGL2PSSpecialProps.
    ##
    ## *
    ##  Gets the ActiveCamera CompositeProjectionTransformationMatrix, only computing it if necessary.
    ##  This function expects that this->ActiveCamera is not nullptr.
    ##
    ## *
    ##  Holds the FXAA configuration.
    ##
    ## *
    ##  If this flag is on and the rendering engine supports it render shadows
    ##  Initial value is off.
    ##
    ## *
    ##  When this flag is on and the rendering engine supports it, wireframe
    ##  polydata will be rendered using hidden line removal.
    ##
    ## *
    ##  If this flag is on and the GPU supports it, depth peeling is used
    ##  for rendering translucent materials.
    ##  If this flag is off, alpha blending is used.
    ##  Initial value is off.
    ##
    ## *
    ##  This flag is on and the GPU supports it, depth-peel volumes along with
    ##  the translucent geometry. Default is false;
    ##
    ## *
    ##  In case of use of depth peeling technique for rendering translucent
    ##  material, define the threshold under which the algorithm stops to
    ##  iterate over peel layers. This is the ratio of the number of pixels
    ##  that have been touched by the last layer over the total number of pixels
    ##  of the viewport area.
    ##  Initial value is 0.0, meaning rendering have to be exact. Greater values
    ##  may speed-up the rendering with small impact on the quality.
    ##
    ## *
    ##  In case of depth peeling, define the maximum number of peeling layers.
    ##  Initial value is 4. A special value of 0 means no maximum limit.
    ##  It has to be a positive value.
    ##
    ## *
    ##  Tells if the last call to DeviceRenderTranslucentPolygonalGeometry()
    ##  actually used depth peeling.
    ##  Initial value is false.
    ##
    ##  HARDWARE SELECTION ----------------------------------------
    ## ---------------------------------------------------------------
    ##  Arbitrary extra information associated with this renderer
    ## *
    ##  Tiled Aspect Ratio used to get the transform in this->CompositeProjectionTransformationMatrix.
    ##
    ## *
    ##  Modified time from the camera when this->CompositeProjectionTransformationMatrix was set.
    ##
    ## *
    ##  Cache of ProjectionTransformationMatrix.
    ##
    ## *
    ##  Tiled Aspect Ratio used to get the transform in this->ProjectionTransformationMatrix.
    ##
    ## *
    ##  Modified time from the camera when this->ProjectionTransformationMatrix was set.
    ##
    ## *
    ##  Cache of ViewTransformMatrix.
    ##
    ## *
    ##  Modified time from the camera when this->ViewTransformMatrix was set.
    ##

  vtkRendererSuperclass* = vtkViewport

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkRenderer::IsTypeOf(@)", header: "vtkRenderer.h".}
proc IsA*(this: var vtkRenderer; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkRenderer.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkRenderer {.
    importcpp: "vtkRenderer::SafeDownCast(@)", header: "vtkRenderer.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkRenderer :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkViewport :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRenderer :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRenderer :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkRenderer; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkRenderer.h".}
proc New*(): ptr vtkRenderer {.importcpp: "vtkRenderer::New(@)",
                           header: "vtkRenderer.h".}
proc AddActor*(this: var vtkRenderer; p: ptr vtkProp) {.importcpp: "AddActor",
    header: "vtkRenderer.h".}
proc AddVolume*(this: var vtkRenderer; p: ptr vtkProp) {.importcpp: "AddVolume",
    header: "vtkRenderer.h".}
proc RemoveActor*(this: var vtkRenderer; p: ptr vtkProp) {.importcpp: "RemoveActor",
    header: "vtkRenderer.h".}
proc RemoveVolume*(this: var vtkRenderer; p: ptr vtkProp) {.importcpp: "RemoveVolume",
    header: "vtkRenderer.h".}
proc AddLight*(this: var vtkRenderer; a2: ptr vtkLight) {.importcpp: "AddLight",
    header: "vtkRenderer.h".}
proc RemoveLight*(this: var vtkRenderer; a2: ptr vtkLight) {.importcpp: "RemoveLight",
    header: "vtkRenderer.h".}
proc RemoveAllLights*(this: var vtkRenderer) {.importcpp: "RemoveAllLights",
    header: "vtkRenderer.h".}
proc GetLights*(this: var vtkRenderer): ptr vtkLightCollection {.
    importcpp: "GetLights", header: "vtkRenderer.h".}
proc SetLightCollection*(this: var vtkRenderer; lights: ptr vtkLightCollection) {.
    importcpp: "SetLightCollection", header: "vtkRenderer.h".}
proc CreateLight*(this: var vtkRenderer) {.importcpp: "CreateLight",
                                       header: "vtkRenderer.h".}
proc MakeLight*(this: var vtkRenderer): ptr vtkLight {.importcpp: "MakeLight",
    header: "vtkRenderer.h".}
## !!!Ignored construct:  //@{ *
##  Turn on/off two-sided lighting of surfaces. If two-sided lighting is
##  off, then only the side of the surface facing the light(s) will be lit,
##  and the other side dark. If two-sided lighting on, both sides of the
##  surface will be lit.
##  virtual vtkTypeBool GetTwoSidedLightingTwoSidedLighting ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TwoSidedLighting  of  << this -> TwoSidedLighting ) ; return this -> TwoSidedLighting ; } ;
## Error: expected ';'!!!

proc SetTwoSidedLighting*(this: var vtkRenderer; _arg: vtkTypeBool) {.
    importcpp: "SetTwoSidedLighting", header: "vtkRenderer.h".}
proc TwoSidedLightingOn*(this: var vtkRenderer) {.importcpp: "TwoSidedLightingOn",
    header: "vtkRenderer.h".}
proc TwoSidedLightingOff*(this: var vtkRenderer) {.importcpp: "TwoSidedLightingOff",
    header: "vtkRenderer.h".}
  ## //@}
  ## //@{
  ## *
  ##  Turn on/off the automatic repositioning of lights as the camera moves.
  ##  If LightFollowCamera is on, lights that are designated as Headlights
  ##  or CameraLights will be adjusted to move with this renderer's camera.
  ##  If LightFollowCamera is off, the lights will not be adjusted.
  ##
  ##  (Note: In previous versions of vtk, this light-tracking
  ##  functionality was part of the interactors, not the renderer. For
  ##  backwards compatibility, the older, more limited interactor
  ##  behavior is enabled by default. To disable this mode, turn the
  ##  interactor's LightFollowCamera flag OFF, and leave the renderer's
  ##  LightFollowCamera flag ON.)
  ##
proc SetTwoSidedLightingLightFollowCamera*(this: var vtkRenderer; _arg: vtkTypeBool) {.
    importcpp: "SetTwoSidedLightingLightFollowCamera", header: "vtkRenderer.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetTwoSidedLightingTwoSidedLightingLightFollowCamera ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LightFollowCamera  of  << this -> LightFollowCamera ) ; return this -> LightFollowCamera ; } ;
## Error: expected ';'!!!

proc LightFollowCameraOn*(this: var vtkRenderer) {.importcpp: "LightFollowCameraOn",
    header: "vtkRenderer.h".}
proc LightFollowCameraOff*(this: var vtkRenderer) {.
    importcpp: "LightFollowCameraOff", header: "vtkRenderer.h".}
  ## //@}
  ## //@{
  ## *
  ##  Turn on/off a flag which disables the automatic light creation capability.
  ##  Normally in VTK if no lights are associated with the renderer, then a light
  ##  is automatically created. However, in special circumstances this feature is
  ##  undesirable, so the following boolean is provided to disable automatic
  ##  light creation. (Turn AutomaticLightCreation off if you do not want lights
  ##  to be created.)
  ##
## !!!Ignored construct:  virtual vtkTypeBool GetTwoSidedLightingTwoSidedLightingLightFollowCameraAutomaticLightCreation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AutomaticLightCreation  of  << this -> AutomaticLightCreation ) ; return this -> AutomaticLightCreation ; } ;
## Error: expected ';'!!!

proc SetTwoSidedLightingLightFollowCameraAutomaticLightCreation*(
    this: var vtkRenderer; _arg: vtkTypeBool) {.
    importcpp: "SetTwoSidedLightingLightFollowCameraAutomaticLightCreation",
    header: "vtkRenderer.h".}
proc AutomaticLightCreationOn*(this: var vtkRenderer) {.
    importcpp: "AutomaticLightCreationOn", header: "vtkRenderer.h".}
proc AutomaticLightCreationOff*(this: var vtkRenderer) {.
    importcpp: "AutomaticLightCreationOff", header: "vtkRenderer.h".}
  ## //@}
  ## *
  ##  Ask the lights in the scene that are not in world space
  ##  (for instance, Headlights or CameraLights that are attached to the
  ##  camera) to update their geometry to match the active camera.
  ##
proc UpdateLightsGeometryToFollowCamera*(this: var vtkRenderer): vtkTypeBool {.
    importcpp: "UpdateLightsGeometryToFollowCamera", header: "vtkRenderer.h".}
proc GetVolumes*(this: var vtkRenderer): ptr vtkVolumeCollection {.
    importcpp: "GetVolumes", header: "vtkRenderer.h".}
proc GetActors*(this: var vtkRenderer): ptr vtkActorCollection {.
    importcpp: "GetActors", header: "vtkRenderer.h".}
proc SetActiveCamera*(this: var vtkRenderer; a2: ptr vtkCamera) {.
    importcpp: "SetActiveCamera", header: "vtkRenderer.h".}
proc GetActiveCamera*(this: var vtkRenderer): ptr vtkCamera {.
    importcpp: "GetActiveCamera", header: "vtkRenderer.h".}
proc MakeCamera*(this: var vtkRenderer): ptr vtkCamera {.importcpp: "MakeCamera",
    header: "vtkRenderer.h".}
proc SetTwoSidedLightingLightFollowCameraAutomaticLightCreationErase*(
    this: var vtkRenderer; _arg: vtkTypeBool) {.importcpp: "SetTwoSidedLightingLightFollowCameraAutomaticLightCreationErase",
    header: "vtkRenderer.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetTwoSidedLightingTwoSidedLightingLightFollowCameraAutomaticLightCreationErase ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Erase  of  << this -> Erase ) ; return this -> Erase ; } ;
## Error: expected ';'!!!

proc EraseOn*(this: var vtkRenderer) {.importcpp: "EraseOn", header: "vtkRenderer.h".}
proc EraseOff*(this: var vtkRenderer) {.importcpp: "EraseOff", header: "vtkRenderer.h".}
  ## //@}
  ## //@{
  ## *
  ##  When this flag is off, render commands are ignored.  It is used to either
  ##  multiplex a vtkRenderWindow or render only part of a vtkRenderWindow.
  ##  By default, Draw is on.
  ##
proc SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDraw*(
    this: var vtkRenderer; _arg: vtkTypeBool) {.importcpp: "SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDraw",
    header: "vtkRenderer.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetTwoSidedLightingTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDraw ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Draw  of  << this -> Draw ) ; return this -> Draw ; } ;
## Error: expected ';'!!!

proc DrawOn*(this: var vtkRenderer) {.importcpp: "DrawOn", header: "vtkRenderer.h".}
proc DrawOff*(this: var vtkRenderer) {.importcpp: "DrawOff", header: "vtkRenderer.h".}
  ## //@}
  ## *
  ##  This function is called to capture an instance of vtkProp that requires
  ##  special handling during vtkRenderWindow::CaptureGL2PSSpecialProps().
  ##
proc CaptureGL2PSSpecialProp*(this: var vtkRenderer; a2: ptr vtkProp): cint {.
    importcpp: "CaptureGL2PSSpecialProp", header: "vtkRenderer.h".}
proc SetGL2PSSpecialPropCollection*(this: var vtkRenderer; a2: ptr vtkPropCollection) {.
    importcpp: "SetGL2PSSpecialPropCollection", header: "vtkRenderer.h".}
proc AddCuller*(this: var vtkRenderer; a2: ptr vtkCuller) {.importcpp: "AddCuller",
    header: "vtkRenderer.h".}
proc RemoveCuller*(this: var vtkRenderer; a2: ptr vtkCuller) {.
    importcpp: "RemoveCuller", header: "vtkRenderer.h".}
proc GetCullers*(this: var vtkRenderer): ptr vtkCullerCollection {.
    importcpp: "GetCullers", header: "vtkRenderer.h".}
proc SetAmbient*(this: var vtkRenderer; _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetAmbient", header: "vtkRenderer.h".}
proc SetAmbient*(this: var vtkRenderer; _arg: array[3, cdouble]) {.
    importcpp: "SetAmbient", header: "vtkRenderer.h".}
## !!!Ignored construct:  virtual double * GetAmbient ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Ambient  pointer  << this -> Ambient ) ; return this -> Ambient ; } VTK_WRAPEXCLUDE virtual void GetAmbient ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Ambient [ i ] ; } } ;
## Error: expected ';'!!!

proc SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawAllocatedRenderTime*(
    this: var vtkRenderer; _arg: cdouble) {.importcpp: "SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawAllocatedRenderTime",
                                       header: "vtkRenderer.h".}
proc GetAllocatedRenderTime*(this: var vtkRenderer): cdouble {.
    importcpp: "GetAllocatedRenderTime", header: "vtkRenderer.h".}
proc GetTimeFactor*(this: var vtkRenderer): cdouble {.importcpp: "GetTimeFactor",
    header: "vtkRenderer.h".}
proc Render*(this: var vtkRenderer) {.importcpp: "Render", header: "vtkRenderer.h".}
proc DeviceRender*(this: var vtkRenderer) {.importcpp: "DeviceRender",
                                        header: "vtkRenderer.h".}
  ## *
  ##  Render opaque polygonal geometry. Default implementation just calls
  ##  UpdateOpaquePolygonalGeometry().
  ##  Subclasses of vtkRenderer that can deal with, e.g. hidden line removal must
  ##  override this method.
  ##
proc DeviceRenderOpaqueGeometry*(this: var vtkRenderer;
                                fbo: ptr vtkFrameBufferObjectBase = nil) {.
    importcpp: "DeviceRenderOpaqueGeometry", header: "vtkRenderer.h".}
proc DeviceRenderTranslucentPolygonalGeometry*(this: var vtkRenderer;
    fbo: ptr vtkFrameBufferObjectBase = nil) {.
    importcpp: "DeviceRenderTranslucentPolygonalGeometry", header: "vtkRenderer.h".}
proc ClearLights*(this: var vtkRenderer) {.importcpp: "ClearLights",
                                       header: "vtkRenderer.h".}
proc Clear*(this: var vtkRenderer) {.importcpp: "Clear", header: "vtkRenderer.h".}
proc VisibleActorCount*(this: var vtkRenderer): cint {.
    importcpp: "VisibleActorCount", header: "vtkRenderer.h".}
proc VisibleVolumeCount*(this: var vtkRenderer): cint {.
    importcpp: "VisibleVolumeCount", header: "vtkRenderer.h".}
proc ComputeVisiblePropBounds*(this: var vtkRenderer; bounds: array[6, cdouble]) {.
    importcpp: "ComputeVisiblePropBounds", header: "vtkRenderer.h".}
## !!!Ignored construct:  *
##  Wrapper-friendly version of ComputeVisiblePropBounds
##  double * ComputeVisiblePropBounds ( ) VTK_SIZEHINT ( 6 ) ;
## Error: expected ';'!!!

proc ResetCameraClippingRange*(this: var vtkRenderer) {.
    importcpp: "ResetCameraClippingRange", header: "vtkRenderer.h".}
proc ResetCameraClippingRange*(this: var vtkRenderer; bounds: array[6, cdouble]) {.
    importcpp: "ResetCameraClippingRange", header: "vtkRenderer.h".}
proc ResetCameraClippingRange*(this: var vtkRenderer; xmin: cdouble; xmax: cdouble;
                              ymin: cdouble; ymax: cdouble; zmin: cdouble;
                              zmax: cdouble) {.
    importcpp: "ResetCameraClippingRange", header: "vtkRenderer.h".}
proc SetNearClippingPlaneTolerance*(this: var vtkRenderer; _arg: cdouble) {.
    importcpp: "SetNearClippingPlaneTolerance", header: "vtkRenderer.h".}
proc GetNearClippingPlaneToleranceMinValue*(this: var vtkRenderer): cdouble {.
    importcpp: "GetNearClippingPlaneToleranceMinValue", header: "vtkRenderer.h".}
proc GetNearClippingPlaneToleranceMaxValue*(this: var vtkRenderer): cdouble {.
    importcpp: "GetNearClippingPlaneToleranceMaxValue", header: "vtkRenderer.h".}
## !!!Ignored construct:  virtual double GetTwoSidedLightingTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawNearClippingPlaneTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NearClippingPlaneTolerance  of  << this -> NearClippingPlaneTolerance ) ; return this -> NearClippingPlaneTolerance ; } ;
## Error: expected ';'!!!

proc SetNearClippingPlaneToleranceClippingRangeExpansion*(this: var vtkRenderer;
    _arg: cdouble) {.importcpp: "SetNearClippingPlaneToleranceClippingRangeExpansion",
                   header: "vtkRenderer.h".}
proc GetNearClippingPlaneToleranceMinValueClippingRangeExpansionMinValue*(
    this: var vtkRenderer): cdouble {.importcpp: "GetNearClippingPlaneToleranceMinValueClippingRangeExpansionMinValue",
                                  header: "vtkRenderer.h".}
proc GetNearClippingPlaneToleranceMaxValueClippingRangeExpansionMaxValue*(
    this: var vtkRenderer): cdouble {.importcpp: "GetNearClippingPlaneToleranceMaxValueClippingRangeExpansionMaxValue",
                                  header: "vtkRenderer.h".}
## !!!Ignored construct:  virtual double GetTwoSidedLightingTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawNearClippingPlaneToleranceClippingRangeExpansion ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ClippingRangeExpansion  of  << this -> ClippingRangeExpansion ) ; return this -> ClippingRangeExpansion ; } ;
## Error: expected ';'!!!

proc ResetCamera*(this: var vtkRenderer) {.importcpp: "ResetCamera",
                                       header: "vtkRenderer.h".}
proc ResetCamera*(this: var vtkRenderer; bounds: array[6, cdouble]) {.
    importcpp: "ResetCamera", header: "vtkRenderer.h".}
proc ResetCamera*(this: var vtkRenderer; xmin: cdouble; xmax: cdouble; ymin: cdouble;
                 ymax: cdouble; zmin: cdouble; zmax: cdouble) {.
    importcpp: "ResetCamera", header: "vtkRenderer.h".}
proc ResetCameraScreenSpace*(this: var vtkRenderer) {.
    importcpp: "ResetCameraScreenSpace", header: "vtkRenderer.h".}
proc ResetCameraScreenSpace*(this: var vtkRenderer; bounds: array[6, cdouble]) {.
    importcpp: "ResetCameraScreenSpace", header: "vtkRenderer.h".}
## using statement

proc DisplayToWorld*(this: var vtkRenderer; display: vtkVector3d): vtkVector3d {.
    importcpp: "DisplayToWorld", header: "vtkRenderer.h".}
proc ZoomToBoxUsingViewAngle*(this: var vtkRenderer; box: vtkRecti;
                             offsetRatio: cdouble = 1.0) {.
    importcpp: "ZoomToBoxUsingViewAngle", header: "vtkRenderer.h".}
proc ResetCameraScreenSpace*(this: var vtkRenderer; xmin: cdouble; xmax: cdouble;
                            ymin: cdouble; ymax: cdouble; zmin: cdouble; zmax: cdouble) {.
    importcpp: "ResetCameraScreenSpace", header: "vtkRenderer.h".}
proc SetRenderWindow*(this: var vtkRenderer; a2: ptr vtkRenderWindow) {.
    importcpp: "SetRenderWindow", header: "vtkRenderer.h".}
proc GetRenderWindow*(this: var vtkRenderer): ptr vtkRenderWindow {.
    importcpp: "GetRenderWindow", header: "vtkRenderer.h".}
proc GetVTKWindow*(this: var vtkRenderer): ptr vtkWindow {.importcpp: "GetVTKWindow",
    header: "vtkRenderer.h".}
proc SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawAllocatedRenderTimeBackingStore*(
    this: var vtkRenderer; _arg: vtkTypeBool) {.importcpp: "SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawAllocatedRenderTimeBackingStore",
    header: "vtkRenderer.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetTwoSidedLightingTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawNearClippingPlaneToleranceClippingRangeExpansionBackingStore ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BackingStore  of  << this -> BackingStore ) ; return this -> BackingStore ; } ;
## Error: expected ';'!!!

proc BackingStoreOn*(this: var vtkRenderer) {.importcpp: "BackingStoreOn",
    header: "vtkRenderer.h".}
proc BackingStoreOff*(this: var vtkRenderer) {.importcpp: "BackingStoreOff",
    header: "vtkRenderer.h".}
  ## //@}
  ## //@{
  ## *
  ##  Turn on/off interactive status.  An interactive renderer is one that
  ##  can receive events from an interactor.  Should only be set if
  ##  there are multiple renderers in the same section of the viewport.
  ##
proc SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawAllocatedRenderTimeBackingStoreInteractive*(
    this: var vtkRenderer; _arg: vtkTypeBool) {.importcpp: "SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawAllocatedRenderTimeBackingStoreInteractive",
    header: "vtkRenderer.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetTwoSidedLightingTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawNearClippingPlaneToleranceClippingRangeExpansionBackingStoreInteractive ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Interactive  of  << this -> Interactive ) ; return this -> Interactive ; } ;
## Error: expected ';'!!!

proc InteractiveOn*(this: var vtkRenderer) {.importcpp: "InteractiveOn",
    header: "vtkRenderer.h".}
proc InteractiveOff*(this: var vtkRenderer) {.importcpp: "InteractiveOff",
    header: "vtkRenderer.h".}
  ## //@}
  ## //@{
  ## *
  ##  Set/Get the layer that this renderer belongs to.  This is only used if
  ##  there are layered renderers.
  ##
  ##  Note: Changing the layer will update the PreserveColorBuffer setting. If
  ##  the layer is 0, PreserveColorBuffer will be set to false, making the
  ##  bottom renderer opaque. If the layer is non-zero, PreserveColorBuffer will
  ##  be set to true, giving the renderer a transparent background. If other
  ##  PreserveColorBuffer configurations are desired, they must be adjusted after
  ##  the layer is set.
  ##
proc SetLayer*(this: var vtkRenderer; layer: cint) {.importcpp: "SetLayer",
    header: "vtkRenderer.h".}
## !!!Ignored construct:  virtual int GetTwoSidedLightingTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawNearClippingPlaneToleranceClippingRangeExpansionBackingStoreInteractiveLayer ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Layer  of  << this -> Layer ) ; return this -> Layer ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  //@} //@{ *
##  By default, the renderer at layer 0 is opaque, and all non-zero layer
##  renderers are transparent. This flag allows this behavior to be overridden.
##  If true, this setting will force the renderer to preserve the existing
##  color buffer regardless of layer. If false, it will always be cleared at
##  the start of rendering.
##
##  This flag influences the Transparent() method, and is updated by calls to
##  SetLayer(). For this reason it should only be set after changing the layer.
##  virtual vtkTypeBool GetTwoSidedLightingTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawNearClippingPlaneToleranceClippingRangeExpansionBackingStoreInteractiveLayerPreserveColorBufferPreserveColorBuffer ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PreserveColorBuffer  of  << this -> PreserveColorBuffer ) ; return this -> PreserveColorBuffer ; } ;
## Error: expected ';'!!!

proc SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawAllocatedRenderTimeBackingStoreInteractivePreserveColorBuffer*(
    this: var vtkRenderer; _arg: vtkTypeBool) {.importcpp: "SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawAllocatedRenderTimeBackingStoreInteractivePreserveColorBuffer",
    header: "vtkRenderer.h".}
proc PreserveColorBufferOn*(this: var vtkRenderer) {.
    importcpp: "PreserveColorBufferOn", header: "vtkRenderer.h".}
proc PreserveColorBufferOff*(this: var vtkRenderer) {.
    importcpp: "PreserveColorBufferOff", header: "vtkRenderer.h".}
  ## //@}
  ## //@{
  ## *
  ##  By default, the depth buffer is reset for each renderer. If this flag is
  ##  true, this renderer will use the existing depth buffer for its rendering.
  ##
proc SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawAllocatedRenderTimeBackingStoreInteractivePreserveColorBufferPreserveDepthBuffer*(
    this: var vtkRenderer; _arg: vtkTypeBool) {.importcpp: "SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawAllocatedRenderTimeBackingStoreInteractivePreserveColorBufferPreserveDepthBuffer",
    header: "vtkRenderer.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetTwoSidedLightingTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawNearClippingPlaneToleranceClippingRangeExpansionBackingStoreInteractiveLayerPreserveColorBufferPreserveColorBufferPreserveDepthBuffer ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PreserveDepthBuffer  of  << this -> PreserveDepthBuffer ) ; return this -> PreserveDepthBuffer ; } ;
## Error: expected ';'!!!

proc PreserveDepthBufferOn*(this: var vtkRenderer) {.
    importcpp: "PreserveDepthBufferOn", header: "vtkRenderer.h".}
proc PreserveDepthBufferOff*(this: var vtkRenderer) {.
    importcpp: "PreserveDepthBufferOff", header: "vtkRenderer.h".}
  ## //@}
  ## *
  ##  Returns a boolean indicating if this renderer is transparent.  It is
  ##  transparent if it is not in the deepest layer of its render window.
  ##
proc Transparent*(this: var vtkRenderer): cint {.importcpp: "Transparent",
    header: "vtkRenderer.h".}
proc WorldToView*(this: var vtkRenderer) {.importcpp: "WorldToView",
                                       header: "vtkRenderer.h".}
proc ViewToWorld*(this: var vtkRenderer) {.importcpp: "ViewToWorld",
                                       header: "vtkRenderer.h".}
proc ViewToWorld*(this: var vtkRenderer; wx: var cdouble; wy: var cdouble; wz: var cdouble) {.
    importcpp: "ViewToWorld", header: "vtkRenderer.h".}
proc WorldToView*(this: var vtkRenderer; wx: var cdouble; wy: var cdouble; wz: var cdouble) {.
    importcpp: "WorldToView", header: "vtkRenderer.h".}
proc WorldToPose*(this: var vtkRenderer; wx: var cdouble; wy: var cdouble; wz: var cdouble) {.
    importcpp: "WorldToPose", header: "vtkRenderer.h".}
proc PoseToWorld*(this: var vtkRenderer; wx: var cdouble; wy: var cdouble; wz: var cdouble) {.
    importcpp: "PoseToWorld", header: "vtkRenderer.h".}
proc ViewToPose*(this: var vtkRenderer; wx: var cdouble; wy: var cdouble; wz: var cdouble) {.
    importcpp: "ViewToPose", header: "vtkRenderer.h".}
proc PoseToView*(this: var vtkRenderer; wx: var cdouble; wy: var cdouble; wz: var cdouble) {.
    importcpp: "PoseToView", header: "vtkRenderer.h".}
proc GetZ*(this: var vtkRenderer; x: cint; y: cint): cdouble {.importcpp: "GetZ",
    header: "vtkRenderer.h".}
proc GetMTime*(this: var vtkRenderer): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkRenderer.h".}
## !!!Ignored construct:  //@{ *
##  Get the time required, in seconds, for the last Render call.
##  virtual double GetTwoSidedLightingTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawNearClippingPlaneToleranceClippingRangeExpansionBackingStoreInteractiveLayerPreserveColorBufferPreserveColorBufferPreserveDepthBufferLastRenderTimeInSecondsLastRenderTimeInSeconds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LastRenderTimeInSeconds  of  << this -> LastRenderTimeInSeconds ) ; return this -> LastRenderTimeInSeconds ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  //@} //@{ *
##  Should be used internally only during a render
##  Get the number of props that were rendered using a
##  RenderOpaqueGeometry or RenderTranslucentPolygonalGeometry call.
##  This is used to know if something is in the frame buffer.
##  virtual int GetTwoSidedLightingTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawNearClippingPlaneToleranceClippingRangeExpansionBackingStoreInteractiveLayerPreserveColorBufferPreserveColorBufferPreserveDepthBufferLastRenderTimeInSecondsLastRenderTimeInSecondsNumberOfPropsRenderedNumberOfPropsRendered ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfPropsRendered  of  << this -> NumberOfPropsRendered ) ; return this -> NumberOfPropsRendered ; } ;
## Error: expected ';'!!!

proc PickProp*(this: var vtkRenderer; selectionX: cdouble; selectionY: cdouble): ptr vtkAssemblyPath {.
    importcpp: "PickProp", header: "vtkRenderer.h".}
proc PickProp*(this: var vtkRenderer; selectionX1: cdouble; selectionY1: cdouble;
              selectionX2: cdouble; selectionY2: cdouble): ptr vtkAssemblyPath {.
    importcpp: "PickProp", header: "vtkRenderer.h".}
proc PickProp*(this: var vtkRenderer; selectionX: cdouble; selectionY: cdouble;
              fieldAssociation: cint; selection: vtkSmartPointer[vtkSelection]): ptr vtkAssemblyPath {.
    importcpp: "PickProp", header: "vtkRenderer.h".}
proc PickProp*(this: var vtkRenderer; selectionX1: cdouble; selectionY1: cdouble;
              selectionX2: cdouble; selectionY2: cdouble; fieldAssociation: cint;
              selection: vtkSmartPointer[vtkSelection]): ptr vtkAssemblyPath {.
    importcpp: "PickProp", header: "vtkRenderer.h".}
proc StereoMidpoint*(this: var vtkRenderer) {.importcpp: "StereoMidpoint",
    header: "vtkRenderer.h".}
proc GetTiledAspectRatio*(this: var vtkRenderer): cdouble {.
    importcpp: "GetTiledAspectRatio", header: "vtkRenderer.h".}
proc IsActiveCameraCreated*(this: var vtkRenderer): vtkTypeBool {.
    importcpp: "IsActiveCameraCreated", header: "vtkRenderer.h".}
proc SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawAllocatedRenderTimeBackingStoreInteractivePreserveColorBufferPreserveDepthBufferUseDepthPeeling*(
    this: var vtkRenderer; _arg: vtkTypeBool) {.importcpp: "SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawAllocatedRenderTimeBackingStoreInteractivePreserveColorBufferPreserveDepthBufferUseDepthPeeling",
    header: "vtkRenderer.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetTwoSidedLightingTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawNearClippingPlaneToleranceClippingRangeExpansionBackingStoreInteractiveLayerPreserveColorBufferPreserveColorBufferPreserveDepthBufferLastRenderTimeInSecondsLastRenderTimeInSecondsNumberOfPropsRenderedNumberOfPropsRenderedUseDepthPeeling ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseDepthPeeling  of  << this -> UseDepthPeeling ) ; return this -> UseDepthPeeling ; } ;
## Error: expected ';'!!!

proc UseDepthPeelingOn*(this: var vtkRenderer) {.importcpp: "UseDepthPeelingOn",
    header: "vtkRenderer.h".}
proc UseDepthPeelingOff*(this: var vtkRenderer) {.importcpp: "UseDepthPeelingOff",
    header: "vtkRenderer.h".}
  ## //@}
  ## *
  ##  This flag is on and the GPU supports it, depth-peel volumes along with
  ##  the translucent geometry. Only supported on OpenGL2 with dual-depth
  ##  peeling. Default is false.
  ##
proc SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawAllocatedRenderTimeBackingStoreInteractivePreserveColorBufferPreserveDepthBufferUseDepthPeelingUseDepthPeelingForVolumes*(
    this: var vtkRenderer; _arg: bool) {.importcpp: "SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawAllocatedRenderTimeBackingStoreInteractivePreserveColorBufferPreserveDepthBufferUseDepthPeelingUseDepthPeelingForVolumes",
                                    header: "vtkRenderer.h".}
## !!!Ignored construct:  virtual bool GetTwoSidedLightingTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawNearClippingPlaneToleranceClippingRangeExpansionBackingStoreInteractiveLayerPreserveColorBufferPreserveColorBufferPreserveDepthBufferLastRenderTimeInSecondsLastRenderTimeInSecondsNumberOfPropsRenderedNumberOfPropsRenderedUseDepthPeelingUseDepthPeelingForVolumes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseDepthPeelingForVolumes  of  << this -> UseDepthPeelingForVolumes ) ; return this -> UseDepthPeelingForVolumes ; } ;
## Error: expected ';'!!!

proc UseDepthPeelingForVolumesOn*(this: var vtkRenderer) {.
    importcpp: "UseDepthPeelingForVolumesOn", header: "vtkRenderer.h".}
proc UseDepthPeelingForVolumesOff*(this: var vtkRenderer) {.
    importcpp: "UseDepthPeelingForVolumesOff", header: "vtkRenderer.h".}
  ## //@{
  ## *
  ##  In case of use of depth peeling technique for rendering translucent
  ##  material, define the threshold under which the algorithm stops to
  ##  iterate over peel layers. This is the ratio of the number of pixels
  ##  that have been touched by the last layer over the total number of pixels
  ##  of the viewport area.
  ##  Initial value is 0.0, meaning rendering have to be exact. Greater values
  ##  may speed-up the rendering with small impact on the quality.
  ##
proc SetNearClippingPlaneToleranceClippingRangeExpansionOcclusionRatio*(
    this: var vtkRenderer; _arg: cdouble) {.importcpp: "SetNearClippingPlaneToleranceClippingRangeExpansionOcclusionRatio",
                                       header: "vtkRenderer.h".}
proc GetNearClippingPlaneToleranceMinValueClippingRangeExpansionMinValueOcclusionRatioMinValue*(
    this: var vtkRenderer): cdouble {.importcpp: "GetNearClippingPlaneToleranceMinValueClippingRangeExpansionMinValueOcclusionRatioMinValue",
                                  header: "vtkRenderer.h".}
proc GetNearClippingPlaneToleranceMaxValueClippingRangeExpansionMaxValueOcclusionRatioMaxValue*(
    this: var vtkRenderer): cdouble {.importcpp: "GetNearClippingPlaneToleranceMaxValueClippingRangeExpansionMaxValueOcclusionRatioMaxValue",
                                  header: "vtkRenderer.h".}
## !!!Ignored construct:  virtual double GetTwoSidedLightingTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawNearClippingPlaneToleranceClippingRangeExpansionBackingStoreInteractiveLayerPreserveColorBufferPreserveColorBufferPreserveDepthBufferLastRenderTimeInSecondsLastRenderTimeInSecondsNumberOfPropsRenderedNumberOfPropsRenderedUseDepthPeelingUseDepthPeelingForVolumesOcclusionRatio ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OcclusionRatio  of  << this -> OcclusionRatio ) ; return this -> OcclusionRatio ; } ;
## Error: expected ';'!!!

proc SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawAllocatedRenderTimeBackingStoreInteractivePreserveColorBufferPreserveDepthBufferUseDepthPeelingUseDepthPeelingForVolumesMaximumNumberOfPeels*(
    this: var vtkRenderer; _arg: cint) {.importcpp: "SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawAllocatedRenderTimeBackingStoreInteractivePreserveColorBufferPreserveDepthBufferUseDepthPeelingUseDepthPeelingForVolumesMaximumNumberOfPeels",
                                    header: "vtkRenderer.h".}
## !!!Ignored construct:  virtual int GetTwoSidedLightingTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawNearClippingPlaneToleranceClippingRangeExpansionBackingStoreInteractiveLayerPreserveColorBufferPreserveColorBufferPreserveDepthBufferLastRenderTimeInSecondsLastRenderTimeInSecondsNumberOfPropsRenderedNumberOfPropsRenderedUseDepthPeelingUseDepthPeelingForVolumesOcclusionRatioMaximumNumberOfPeels ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumNumberOfPeels  of  << this -> MaximumNumberOfPeels ) ; return this -> MaximumNumberOfPeels ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  //@} //@{ *
##  Tells if the last call to DeviceRenderTranslucentPolygonalGeometry()
##  actually used depth peeling.
##  Initial value is false.
##  virtual vtkTypeBool GetTwoSidedLightingTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawNearClippingPlaneToleranceClippingRangeExpansionBackingStoreInteractiveLayerPreserveColorBufferPreserveColorBufferPreserveDepthBufferLastRenderTimeInSecondsLastRenderTimeInSecondsNumberOfPropsRenderedNumberOfPropsRenderedUseDepthPeelingUseDepthPeelingForVolumesOcclusionRatioMaximumNumberOfPeelsLastRenderingUsedDepthPeelingLastRenderingUsedDepthPeeling ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LastRenderingUsedDepthPeeling  of  << this -> LastRenderingUsedDepthPeeling ) ; return this -> LastRenderingUsedDepthPeeling ; } ;
## Error: expected ';'!!!

proc SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawAllocatedRenderTimeBackingStoreInteractivePreserveColorBufferPreserveDepthBufferUseDepthPeelingUseDepthPeelingForVolumesMaximumNumberOfPeelsUseSSAO*(
    this: var vtkRenderer; _arg: bool) {.importcpp: "SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawAllocatedRenderTimeBackingStoreInteractivePreserveColorBufferPreserveDepthBufferUseDepthPeelingUseDepthPeelingForVolumesMaximumNumberOfPeelsUseSSAO",
                                    header: "vtkRenderer.h".}
## !!!Ignored construct:  virtual bool GetTwoSidedLightingTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawNearClippingPlaneToleranceClippingRangeExpansionBackingStoreInteractiveLayerPreserveColorBufferPreserveColorBufferPreserveDepthBufferLastRenderTimeInSecondsLastRenderTimeInSecondsNumberOfPropsRenderedNumberOfPropsRenderedUseDepthPeelingUseDepthPeelingForVolumesOcclusionRatioMaximumNumberOfPeelsLastRenderingUsedDepthPeelingLastRenderingUsedDepthPeelingUseSSAO ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseSSAO  of  << this -> UseSSAO ) ; return this -> UseSSAO ; } ;
## Error: expected ';'!!!

proc UseSSAOOn*(this: var vtkRenderer) {.importcpp: "UseSSAOOn",
                                     header: "vtkRenderer.h".}
proc UseSSAOOff*(this: var vtkRenderer) {.importcpp: "UseSSAOOff",
                                      header: "vtkRenderer.h".}
  ## //@}
  ## //@{
  ## *
  ##  When using SSAO, define the SSAO hemisphere radius.
  ##  Default is 0.5
  ##
proc SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawAllocatedRenderTimeBackingStoreInteractivePreserveColorBufferPreserveDepthBufferUseDepthPeelingUseDepthPeelingForVolumesMaximumNumberOfPeelsUseSSAOSSAORadius*(
    this: var vtkRenderer; _arg: cdouble) {.importcpp: "SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawAllocatedRenderTimeBackingStoreInteractivePreserveColorBufferPreserveDepthBufferUseDepthPeelingUseDepthPeelingForVolumesMaximumNumberOfPeelsUseSSAOSSAORadius",
                                       header: "vtkRenderer.h".}
## !!!Ignored construct:  virtual double GetTwoSidedLightingTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawNearClippingPlaneToleranceClippingRangeExpansionBackingStoreInteractiveLayerPreserveColorBufferPreserveColorBufferPreserveDepthBufferLastRenderTimeInSecondsLastRenderTimeInSecondsNumberOfPropsRenderedNumberOfPropsRenderedUseDepthPeelingUseDepthPeelingForVolumesOcclusionRatioMaximumNumberOfPeelsLastRenderingUsedDepthPeelingLastRenderingUsedDepthPeelingUseSSAOSSAORadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SSAORadius  of  << this -> SSAORadius ) ; return this -> SSAORadius ; } ;
## Error: expected ';'!!!

proc SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawAllocatedRenderTimeBackingStoreInteractivePreserveColorBufferPreserveDepthBufferUseDepthPeelingUseDepthPeelingForVolumesMaximumNumberOfPeelsUseSSAOSSAORadiusSSAOBias*(
    this: var vtkRenderer; _arg: cdouble) {.importcpp: "SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawAllocatedRenderTimeBackingStoreInteractivePreserveColorBufferPreserveDepthBufferUseDepthPeelingUseDepthPeelingForVolumesMaximumNumberOfPeelsUseSSAOSSAORadiusSSAOBias",
                                       header: "vtkRenderer.h".}
## !!!Ignored construct:  virtual double GetTwoSidedLightingTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawNearClippingPlaneToleranceClippingRangeExpansionBackingStoreInteractiveLayerPreserveColorBufferPreserveColorBufferPreserveDepthBufferLastRenderTimeInSecondsLastRenderTimeInSecondsNumberOfPropsRenderedNumberOfPropsRenderedUseDepthPeelingUseDepthPeelingForVolumesOcclusionRatioMaximumNumberOfPeelsLastRenderingUsedDepthPeelingLastRenderingUsedDepthPeelingUseSSAOSSAORadiusSSAOBias ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SSAOBias  of  << this -> SSAOBias ) ; return this -> SSAOBias ; } ;
## Error: expected ';'!!!

proc SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawAllocatedRenderTimeBackingStoreInteractivePreserveColorBufferPreserveDepthBufferUseDepthPeelingUseDepthPeelingForVolumesMaximumNumberOfPeelsUseSSAOSSAORadiusSSAOBiasSSAOKernelSize*(
    this: var vtkRenderer; _arg: cuint) {.importcpp: "SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawAllocatedRenderTimeBackingStoreInteractivePreserveColorBufferPreserveDepthBufferUseDepthPeelingUseDepthPeelingForVolumesMaximumNumberOfPeelsUseSSAOSSAORadiusSSAOBiasSSAOKernelSize",
                                     header: "vtkRenderer.h".}
## !!!Ignored construct:  virtual unsigned int GetTwoSidedLightingTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawNearClippingPlaneToleranceClippingRangeExpansionBackingStoreInteractiveLayerPreserveColorBufferPreserveColorBufferPreserveDepthBufferLastRenderTimeInSecondsLastRenderTimeInSecondsNumberOfPropsRenderedNumberOfPropsRenderedUseDepthPeelingUseDepthPeelingForVolumesOcclusionRatioMaximumNumberOfPeelsLastRenderingUsedDepthPeelingLastRenderingUsedDepthPeelingUseSSAOSSAORadiusSSAOBiasSSAOKernelSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SSAOKernelSize  of  << this -> SSAOKernelSize ) ; return this -> SSAOKernelSize ; } ;
## Error: expected ';'!!!

proc SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawAllocatedRenderTimeBackingStoreInteractivePreserveColorBufferPreserveDepthBufferUseDepthPeelingUseDepthPeelingForVolumesMaximumNumberOfPeelsUseSSAOSSAORadiusSSAOBiasSSAOKernelSizeSSAOBlur*(
    this: var vtkRenderer; _arg: bool) {.importcpp: "SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawAllocatedRenderTimeBackingStoreInteractivePreserveColorBufferPreserveDepthBufferUseDepthPeelingUseDepthPeelingForVolumesMaximumNumberOfPeelsUseSSAOSSAORadiusSSAOBiasSSAOKernelSizeSSAOBlur",
                                    header: "vtkRenderer.h".}
## !!!Ignored construct:  virtual bool GetTwoSidedLightingTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawNearClippingPlaneToleranceClippingRangeExpansionBackingStoreInteractiveLayerPreserveColorBufferPreserveColorBufferPreserveDepthBufferLastRenderTimeInSecondsLastRenderTimeInSecondsNumberOfPropsRenderedNumberOfPropsRenderedUseDepthPeelingUseDepthPeelingForVolumesOcclusionRatioMaximumNumberOfPeelsLastRenderingUsedDepthPeelingLastRenderingUsedDepthPeelingUseSSAOSSAORadiusSSAOBiasSSAOKernelSizeSSAOBlur ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SSAOBlur  of  << this -> SSAOBlur ) ; return this -> SSAOBlur ; } ;
## Error: expected ';'!!!

proc SSAOBlurOn*(this: var vtkRenderer) {.importcpp: "SSAOBlurOn",
                                      header: "vtkRenderer.h".}
proc SSAOBlurOff*(this: var vtkRenderer) {.importcpp: "SSAOBlurOff",
                                       header: "vtkRenderer.h".}
  ## //@}
  ## //@{
  ## *
  ##  Set/Get a custom Render call. Allows to hook a Render call from an
  ##  external project.It will be used in place of vtkRenderer::Render() if it
  ##  is not NULL and its Used ivar is set to true.
  ##  Initial value is NULL.
  ##
proc SetDelegate*(this: var vtkRenderer; d: ptr vtkRendererDelegate) {.
    importcpp: "SetDelegate", header: "vtkRenderer.h".}
proc GetnameDelegate*(this: var vtkRenderer): ptr vtkRendererDelegate {.
    importcpp: "GetnameDelegate", header: "vtkRenderer.h".}
  ## //@}
  ## //@{
  ## *
  ##  Get the current hardware selector. If the Selector is set, it implies the
  ##  current render pass is for selection. Mappers/Properties may choose to
  ##  behave differently when rendering for hardware selection.
  ##
proc GetnameDelegateSelector*(this: var vtkRenderer): ptr vtkHardwareSelector {.
    importcpp: "GetnameDelegateSelector", header: "vtkRenderer.h".}
  ## //@}
  ## //@{
  ## *
  ##  Set/Get the texture to be used for the monocular or stereo left eye
  ##  background. If set and enabled this gets the priority over the gradient
  ##  background.
  ##
proc SetLeftBackgroundTexture*(this: var vtkRenderer; a2: ptr vtkTexture) {.
    importcpp: "SetLeftBackgroundTexture", header: "vtkRenderer.h".}
proc GetLeftBackgroundTexture*(this: var vtkRenderer): ptr vtkTexture {.
    importcpp: "GetLeftBackgroundTexture", header: "vtkRenderer.h".}
proc SetBackgroundTexture*(this: var vtkRenderer; a2: ptr vtkTexture) {.
    importcpp: "SetBackgroundTexture", header: "vtkRenderer.h".}
proc GetnameDelegateSelectorBackgroundTexture*(this: var vtkRenderer): ptr vtkTexture {.
    importcpp: "GetnameDelegateSelectorBackgroundTexture", header: "vtkRenderer.h".}
  ## //@}
  ## //@{
  ## *
  ##  Set/Get the texture to be used for the right eye background. If set
  ##  and enabled this gets the priority over the gradient background.
  ##
proc SetRightBackgroundTexture*(this: var vtkRenderer; a2: ptr vtkTexture) {.
    importcpp: "SetRightBackgroundTexture", header: "vtkRenderer.h".}
proc GetnameDelegateSelectorBackgroundTextureRightBackgroundTexture*(
    this: var vtkRenderer): ptr vtkTexture {.importcpp: "GetnameDelegateSelectorBackgroundTextureRightBackgroundTexture",
                                        header: "vtkRenderer.h".}
  ## //@}
  ## //@{
  ## *
  ##  Set/Get whether this viewport should have a textured background.
  ##  Default is off.
  ##
proc SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawAllocatedRenderTimeBackingStoreInteractivePreserveColorBufferPreserveDepthBufferUseDepthPeelingUseDepthPeelingForVolumesMaximumNumberOfPeelsUseSSAOSSAORadiusSSAOBiasSSAOKernelSizeSSAOBlurTexturedBackground*(
    this: var vtkRenderer; _arg: bool) {.importcpp: "SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawAllocatedRenderTimeBackingStoreInteractivePreserveColorBufferPreserveDepthBufferUseDepthPeelingUseDepthPeelingForVolumesMaximumNumberOfPeelsUseSSAOSSAORadiusSSAOBiasSSAOKernelSizeSSAOBlurTexturedBackground",
                                    header: "vtkRenderer.h".}
## !!!Ignored construct:  virtual bool GetTwoSidedLightingTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawNearClippingPlaneToleranceClippingRangeExpansionBackingStoreInteractiveLayerPreserveColorBufferPreserveColorBufferPreserveDepthBufferLastRenderTimeInSecondsLastRenderTimeInSecondsNumberOfPropsRenderedNumberOfPropsRenderedUseDepthPeelingUseDepthPeelingForVolumesOcclusionRatioMaximumNumberOfPeelsLastRenderingUsedDepthPeelingLastRenderingUsedDepthPeelingUseSSAOSSAORadiusSSAOBiasSSAOKernelSizeSSAOBlurTexturedBackground ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TexturedBackground  of  << this -> TexturedBackground ) ; return this -> TexturedBackground ; } ;
## Error: expected ';'!!!

proc TexturedBackgroundOn*(this: var vtkRenderer) {.
    importcpp: "TexturedBackgroundOn", header: "vtkRenderer.h".}
proc TexturedBackgroundOff*(this: var vtkRenderer) {.
    importcpp: "TexturedBackgroundOff", header: "vtkRenderer.h".}
  ## //@}
  ##  method to release graphics resources in any derived renderers.
proc ReleaseGraphicsResources*(this: var vtkRenderer; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkRenderer.h".}
proc SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawAllocatedRenderTimeBackingStoreInteractivePreserveColorBufferPreserveDepthBufferUseDepthPeelingUseDepthPeelingForVolumesMaximumNumberOfPeelsUseSSAOSSAORadiusSSAOBiasSSAOKernelSizeSSAOBlurTexturedBackgroundUseFXAA*(
    this: var vtkRenderer; _arg: bool) {.importcpp: "SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawAllocatedRenderTimeBackingStoreInteractivePreserveColorBufferPreserveDepthBufferUseDepthPeelingUseDepthPeelingForVolumesMaximumNumberOfPeelsUseSSAOSSAORadiusSSAOBiasSSAOKernelSizeSSAOBlurTexturedBackgroundUseFXAA",
                                    header: "vtkRenderer.h".}
## !!!Ignored construct:  virtual bool GetTwoSidedLightingTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawNearClippingPlaneToleranceClippingRangeExpansionBackingStoreInteractiveLayerPreserveColorBufferPreserveColorBufferPreserveDepthBufferLastRenderTimeInSecondsLastRenderTimeInSecondsNumberOfPropsRenderedNumberOfPropsRenderedUseDepthPeelingUseDepthPeelingForVolumesOcclusionRatioMaximumNumberOfPeelsLastRenderingUsedDepthPeelingLastRenderingUsedDepthPeelingUseSSAOSSAORadiusSSAOBiasSSAOKernelSizeSSAOBlurTexturedBackgroundUseFXAA ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseFXAA  of  << this -> UseFXAA ) ; return this -> UseFXAA ; } ;
## Error: expected ';'!!!

proc UseFXAAOn*(this: var vtkRenderer) {.importcpp: "UseFXAAOn",
                                     header: "vtkRenderer.h".}
proc UseFXAAOff*(this: var vtkRenderer) {.importcpp: "UseFXAAOff",
                                      header: "vtkRenderer.h".}
  ## //@}
  ## //@{
  ## *
  ##  The configuration object for FXAA antialiasing.
  ##
proc GetnameDelegateSelectorBackgroundTextureRightBackgroundTextureFXAAOptions*(
    this: var vtkRenderer): ptr vtkFXAAOptions {.importcpp: "GetnameDelegateSelectorBackgroundTextureRightBackgroundTextureFXAAOptions",
    header: "vtkRenderer.h".}
proc SetFXAAOptions*(this: var vtkRenderer; a2: ptr vtkFXAAOptions) {.
    importcpp: "SetFXAAOptions", header: "vtkRenderer.h".}
proc SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawAllocatedRenderTimeBackingStoreInteractivePreserveColorBufferPreserveDepthBufferUseDepthPeelingUseDepthPeelingForVolumesMaximumNumberOfPeelsUseSSAOSSAORadiusSSAOBiasSSAOKernelSizeSSAOBlurTexturedBackgroundUseFXAAUseShadows*(
    this: var vtkRenderer; _arg: vtkTypeBool) {.importcpp: "SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawAllocatedRenderTimeBackingStoreInteractivePreserveColorBufferPreserveDepthBufferUseDepthPeelingUseDepthPeelingForVolumesMaximumNumberOfPeelsUseSSAOSSAORadiusSSAOBiasSSAOKernelSizeSSAOBlurTexturedBackgroundUseFXAAUseShadows",
    header: "vtkRenderer.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetTwoSidedLightingTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawNearClippingPlaneToleranceClippingRangeExpansionBackingStoreInteractiveLayerPreserveColorBufferPreserveColorBufferPreserveDepthBufferLastRenderTimeInSecondsLastRenderTimeInSecondsNumberOfPropsRenderedNumberOfPropsRenderedUseDepthPeelingUseDepthPeelingForVolumesOcclusionRatioMaximumNumberOfPeelsLastRenderingUsedDepthPeelingLastRenderingUsedDepthPeelingUseSSAOSSAORadiusSSAOBiasSSAOKernelSizeSSAOBlurTexturedBackgroundUseFXAAUseShadows ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseShadows  of  << this -> UseShadows ) ; return this -> UseShadows ; } ;
## Error: expected ';'!!!

proc UseShadowsOn*(this: var vtkRenderer) {.importcpp: "UseShadowsOn",
                                        header: "vtkRenderer.h".}
proc UseShadowsOff*(this: var vtkRenderer) {.importcpp: "UseShadowsOff",
    header: "vtkRenderer.h".}
  ## //@}
  ## //@{
  ## *
  ##  If this flag is true and the rendering engine supports it, wireframe
  ##  geometry will be drawn using hidden line removal.
  ##
proc SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawAllocatedRenderTimeBackingStoreInteractivePreserveColorBufferPreserveDepthBufferUseDepthPeelingUseDepthPeelingForVolumesMaximumNumberOfPeelsUseSSAOSSAORadiusSSAOBiasSSAOKernelSizeSSAOBlurTexturedBackgroundUseFXAAUseShadowsUseHiddenLineRemoval*(
    this: var vtkRenderer; _arg: vtkTypeBool) {.importcpp: "SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawAllocatedRenderTimeBackingStoreInteractivePreserveColorBufferPreserveDepthBufferUseDepthPeelingUseDepthPeelingForVolumesMaximumNumberOfPeelsUseSSAOSSAORadiusSSAOBiasSSAOKernelSizeSSAOBlurTexturedBackgroundUseFXAAUseShadowsUseHiddenLineRemoval",
    header: "vtkRenderer.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetTwoSidedLightingTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawNearClippingPlaneToleranceClippingRangeExpansionBackingStoreInteractiveLayerPreserveColorBufferPreserveColorBufferPreserveDepthBufferLastRenderTimeInSecondsLastRenderTimeInSecondsNumberOfPropsRenderedNumberOfPropsRenderedUseDepthPeelingUseDepthPeelingForVolumesOcclusionRatioMaximumNumberOfPeelsLastRenderingUsedDepthPeelingLastRenderingUsedDepthPeelingUseSSAOSSAORadiusSSAOBiasSSAOKernelSizeSSAOBlurTexturedBackgroundUseFXAAUseShadowsUseHiddenLineRemoval ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseHiddenLineRemoval  of  << this -> UseHiddenLineRemoval ) ; return this -> UseHiddenLineRemoval ; } ;
## Error: expected ';'!!!

proc UseHiddenLineRemovalOn*(this: var vtkRenderer) {.
    importcpp: "UseHiddenLineRemovalOn", header: "vtkRenderer.h".}
proc UseHiddenLineRemovalOff*(this: var vtkRenderer) {.
    importcpp: "UseHiddenLineRemovalOff", header: "vtkRenderer.h".}
  ## //@}
  ##  Set/Get a custom render pass.
  ##  Initial value is NULL.
proc SetPass*(this: var vtkRenderer; p: ptr vtkRenderPass) {.importcpp: "SetPass",
    header: "vtkRenderer.h".}
proc GetnameDelegateSelectorBackgroundTextureRightBackgroundTextureFXAAOptionsPass*(
    this: var vtkRenderer): ptr vtkRenderPass {.importcpp: "GetnameDelegateSelectorBackgroundTextureRightBackgroundTextureFXAAOptionsPass",
    header: "vtkRenderer.h".}
  ## //@{
  ## *
  ##  Set/Get the information object associated with this algorithm.
  ##
proc GetnameDelegateSelectorBackgroundTextureRightBackgroundTextureFXAAOptionsPassInformation*(
    this: var vtkRenderer): ptr vtkInformation {.importcpp: "GetnameDelegateSelectorBackgroundTextureRightBackgroundTextureFXAAOptionsPassInformation",
    header: "vtkRenderer.h".}
proc SetInformation*(this: var vtkRenderer; a2: ptr vtkInformation) {.
    importcpp: "SetInformation", header: "vtkRenderer.h".}
proc SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawAllocatedRenderTimeBackingStoreInteractivePreserveColorBufferPreserveDepthBufferUseDepthPeelingUseDepthPeelingForVolumesMaximumNumberOfPeelsUseSSAOSSAORadiusSSAOBiasSSAOKernelSizeSSAOBlurTexturedBackgroundUseFXAAUseShadowsUseHiddenLineRemovalUseImageBasedLighting*(
    this: var vtkRenderer; _arg: bool) {.importcpp: "SetTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawAllocatedRenderTimeBackingStoreInteractivePreserveColorBufferPreserveDepthBufferUseDepthPeelingUseDepthPeelingForVolumesMaximumNumberOfPeelsUseSSAOSSAORadiusSSAOBiasSSAOKernelSizeSSAOBlurTexturedBackgroundUseFXAAUseShadowsUseHiddenLineRemovalUseImageBasedLighting",
                                    header: "vtkRenderer.h".}
## !!!Ignored construct:  virtual bool GetTwoSidedLightingTwoSidedLightingLightFollowCameraAutomaticLightCreationEraseDrawNearClippingPlaneToleranceClippingRangeExpansionBackingStoreInteractiveLayerPreserveColorBufferPreserveColorBufferPreserveDepthBufferLastRenderTimeInSecondsLastRenderTimeInSecondsNumberOfPropsRenderedNumberOfPropsRenderedUseDepthPeelingUseDepthPeelingForVolumesOcclusionRatioMaximumNumberOfPeelsLastRenderingUsedDepthPeelingLastRenderingUsedDepthPeelingUseSSAOSSAORadiusSSAOBiasSSAOKernelSizeSSAOBlurTexturedBackgroundUseFXAAUseShadowsUseHiddenLineRemovalUseImageBasedLighting ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseImageBasedLighting  of  << this -> UseImageBasedLighting ) ; return this -> UseImageBasedLighting ; } ;
## Error: expected ';'!!!

proc UseImageBasedLightingOn*(this: var vtkRenderer) {.
    importcpp: "UseImageBasedLightingOn", header: "vtkRenderer.h".}
proc UseImageBasedLightingOff*(this: var vtkRenderer) {.
    importcpp: "UseImageBasedLightingOff", header: "vtkRenderer.h".}
  ## //@}
  ## //@{
  ## *
  ##  Set/Get the environment texture used for image based lighting.
  ##  This texture is supposed to represent the scene background.
  ##  If it is not a cubemap, the texture is supposed to represent an equirectangular projection.
  ##  If used with raytracing backends, the texture must be an equirectangular projection and must be
  ##  constructed with a valid vtkImageData.
  ##  Warning, this texture must be expressed in linear color space.
  ##  If the texture is in sRGB color space, set the color flag on the texture or
  ##  set the argument isSRGB to true.
  ##  @sa vtkTexture::UseSRGBColorSpaceOn
  ##
proc GetnameDelegateSelectorBackgroundTextureRightBackgroundTextureFXAAOptionsPassInformationEnvironmentTexture*(
    this: var vtkRenderer): ptr vtkTexture {.importcpp: "GetnameDelegateSelectorBackgroundTextureRightBackgroundTextureFXAAOptionsPassInformationEnvironmentTexture",
                                        header: "vtkRenderer.h".}
proc SetEnvironmentTexture*(this: var vtkRenderer; texture: ptr vtkTexture;
                           isSRGB: bool = false) {.
    importcpp: "SetEnvironmentTexture", header: "vtkRenderer.h".}
## !!!Ignored construct:  //@} //@{ *
##  Set/Get the environment up vector.
##  virtual double * GetEnvironmentUpEnvironmentUp ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << EnvironmentUp  pointer  << this -> EnvironmentUp ) ; return this -> EnvironmentUp ; } VTK_WRAPEXCLUDE virtual void GetEnvironmentUpEnvironmentUp ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> EnvironmentUp [ 0 ] ; _arg2 = this -> EnvironmentUp [ 1 ] ; _arg3 = this -> EnvironmentUp [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << EnvironmentUp  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetEnvironmentUpEnvironmentUp ( double _arg [ 3 ] ) { this -> GetEnvironmentUpEnvironmentUp ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetAmbientEnvironmentUp*(this: var vtkRenderer; _arg1: cdouble; _arg2: cdouble;
                             _arg3: cdouble) {.
    importcpp: "SetAmbientEnvironmentUp", header: "vtkRenderer.h".}
proc SetAmbientEnvironmentUp*(this: var vtkRenderer; _arg: array[3, cdouble]) {.
    importcpp: "SetAmbientEnvironmentUp", header: "vtkRenderer.h".}
  ## //@}
  ## //@{
  ## *
  ##  Set/Get the environment right vector.
  ##
## !!!Ignored construct:  virtual double * GetEnvironmentUpEnvironmentUpEnvironmentRight ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << EnvironmentRight  pointer  << this -> EnvironmentRight ) ; return this -> EnvironmentRight ; } VTK_WRAPEXCLUDE virtual void GetEnvironmentUpEnvironmentUpEnvironmentRight ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> EnvironmentRight [ 0 ] ; _arg2 = this -> EnvironmentRight [ 1 ] ; _arg3 = this -> EnvironmentRight [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << EnvironmentRight  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetEnvironmentUpEnvironmentUpEnvironmentRight ( double _arg [ 3 ] ) { this -> GetEnvironmentUpEnvironmentUpEnvironmentRight ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetAmbientEnvironmentUpEnvironmentRight*(this: var vtkRenderer; _arg1: cdouble;
    _arg2: cdouble; _arg3: cdouble) {.importcpp: "SetAmbientEnvironmentUpEnvironmentRight",
                                  header: "vtkRenderer.h".}
proc SetAmbientEnvironmentUpEnvironmentRight*(this: var vtkRenderer;
    _arg: array[3, cdouble]) {.importcpp: "SetAmbientEnvironmentUpEnvironmentRight",
                            header: "vtkRenderer.h".}
  ## //@}
proc GetLights*(this: var vtkRenderer): ptr vtkLightCollection {.
    importcpp: "GetLights", header: "vtkRenderer.h".}
## *
##  Get the list of cullers for this renderer.
##

proc GetCullers*(this: var vtkRenderer): ptr vtkCullerCollection {.
    importcpp: "GetCullers", header: "vtkRenderer.h".}