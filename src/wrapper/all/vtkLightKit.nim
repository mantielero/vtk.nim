## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLightKit.h
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
##  @class   vtkLightKit
##  @brief   a simple but quality lighting kit
##
##  vtkLightKit is designed to make general purpose lighting of vtk
##  scenes simple, flexible, and attractive (or at least not horribly
##  ugly without significant effort).  Use a LightKit when you want
##  more control over your lighting than you can get with the default
##  vtk light, which is a headlight located at the camera. (HeadLights
##  are very simple to use, but they don't show the shape of objects very
##  well, don't give a good sense of "up" and "down", and don't evenly
##  light the object.)
##
##  A LightKit consists of three lights, a key light, a fill light, and
##  a headlight.  The main light is the key light.  It is usually
##  positioned so that it appears like an overhead light (like the sun,
##  or a ceiling light).  It is generally positioned to shine down on the
##  scene from about a 45 degree angle vertically and at least a little
##  offset side to side.  The key light usually at least about twice as
##  bright as the total of all other lights in the scene to provide good
##  modeling of object features.
##
##  The other lights in the kit (the fill light, headlight, and a pair of
##  back lights) are weaker sources that provide extra
##  illumination to fill in the spots that the key light misses.  The
##  fill light is usually positioned across from or opposite from the
##  key light (though still on the same side of the object as the
##  camera) in order to simulate diffuse reflections from other objects
##  in the scene.  The headlight, always located at the position of the
##  camera, reduces the contrast between areas lit by the key and fill
##  light. The two back lights, one on the left of the object as seen
##  from the observer and one on the right, fill on the high-contrast
##  areas behind the object.  To enforce the relationship between the
##  different lights, the intensity of the fill, back and headlights
##  are set as a ratio to the key light brightness.  Thus, the
##  brightness of all the lights in the scene can be changed by
##  changing the key light intensity.
##
##  All lights are directional lights (infinitely far away with no
##  falloff).  Lights move with the camera.
##
##  For simplicity, the position of lights in the LightKit can only be
##  specified using angles: the elevation (latitude) and azimuth
##  (longitude) of each light with respect to the camera, expressed in
##  degrees.  (Lights always shine on the camera's lookat point.) For
##  example, a light at (elevation=0, azimuth=0) is located at the
##  camera (a headlight).  A light at (elevation=90, azimuth=0) is
##  above the lookat point, shining down.  Negative azimuth values move
##  the lights clockwise as seen above, positive values
##  counter-clockwise.  So, a light at (elevation=45, azimuth=-20) is
##  above and in front of the object and shining slightly from the left
##  side.
##
##  vtkLightKit limits the colors that can be assigned to any light to
##  those of incandescent sources such as light bulbs and sunlight.  It
##  defines a special color spectrum called "warmth" from which light
##  colors can be chosen, where 0 is cold blue, 0.5 is neutral white,
##  and 1 is deep sunset red.  Colors close to 0.5 are "cool whites" and
##  "warm whites," respectively.
##
##  Since colors far from white on the warmth scale appear less bright,
##  key-to-fill and key-to-headlight ratios are skewed by
##  key, fill, and headlight colors.  If the flag MaintainLuminance
##  is set, vtkLightKit will attempt to compensate for these perceptual
##  differences by increasing the brightness of more saturated colors.
##
##  A LightKit is not explicitly part of the vtk pipeline.  Rather, it
##  is a composite object that controls the behavior of lights using a
##  unified user interface.  Every time a parameter of vtkLightKit is
##  adjusted, the properties of its lights are modified.
##
##  @par Credits:
##  vtkLightKit was originally written and contributed to vtk by
##  Michael Halle (mhalle@bwh.harvard.edu) at the Surgical Planning
##  Lab, Brigham and Women's Hospital.
##

import
  vtkObject, vtkRenderingCoreModule

discard "forward decl of vtkLight"
discard "forward decl of vtkPiecewiseFunction"
discard "forward decl of vtkRenderer"
type
  vtkLightKit* {.importcpp: "vtkLightKit", header: "vtkLightKit.h", bycopy.} = object of vtkObject
    vtkLightKit* {.importc: "vtkLightKit".}: VTK_NEWINSTANCE
    ##  r, g, b, perceptual length


proc New*(): ptr vtkLightKit {.importcpp: "vtkLightKit::New(@)",
                           header: "vtkLightKit.h".}
type
  vtkLightKitSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkLightKit::IsTypeOf(@)", header: "vtkLightKit.h".}
proc IsA*(this: var vtkLightKit; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkLightKit.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkLightKit {.
    importcpp: "vtkLightKit::SafeDownCast(@)", header: "vtkLightKit.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkLightKit :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLightKit :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLightKit :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkLightKit; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkLightKit.h".}
type
  vtkLightKitLightKitType* {.size: sizeof(cint),
                            importcpp: "vtkLightKit::LightKitType",
                            header: "vtkLightKit.h".} = enum
    TKeyLight, TFillLight, TBackLight, THeadLight


type
  vtkLightKitLightKitSubType* {.size: sizeof(cint),
                               importcpp: "vtkLightKit::LightKitSubType",
                               header: "vtkLightKit.h".} = enum
    Warmth, Intensity, Elevation, Azimuth, KFRatio, KBRatio, KHRatio


proc SetKeyLightIntensity*(this: var vtkLightKit; _arg: cdouble) {.
    importcpp: "SetKeyLightIntensity", header: "vtkLightKit.h".}
## !!!Ignored construct:  virtual double GetKeyLightIntensity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << KeyLightIntensity  of  << this -> KeyLightIntensity ) ; return this -> KeyLightIntensity ; } ;
## Error: expected ';'!!!

proc SetKeyToFillRatio*(this: var vtkLightKit; _arg: cdouble) {.
    importcpp: "SetKeyToFillRatio", header: "vtkLightKit.h".}
proc GetKeyToFillRatioMinValue*(this: var vtkLightKit): cdouble {.
    importcpp: "GetKeyToFillRatioMinValue", header: "vtkLightKit.h".}
proc GetKeyToFillRatioMaxValue*(this: var vtkLightKit): cdouble {.
    importcpp: "GetKeyToFillRatioMaxValue", header: "vtkLightKit.h".}
## !!!Ignored construct:  virtual double GetKeyLightIntensityKeyToFillRatio ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << KeyToFillRatio  of  << this -> KeyToFillRatio ) ; return this -> KeyToFillRatio ; } ;
## Error: expected ';'!!!

proc SetKeyToFillRatioKeyToHeadRatio*(this: var vtkLightKit; _arg: cdouble) {.
    importcpp: "SetKeyToFillRatioKeyToHeadRatio", header: "vtkLightKit.h".}
proc GetKeyToFillRatioMinValueKeyToHeadRatioMinValue*(this: var vtkLightKit): cdouble {.
    importcpp: "GetKeyToFillRatioMinValueKeyToHeadRatioMinValue",
    header: "vtkLightKit.h".}
proc GetKeyToFillRatioMaxValueKeyToHeadRatioMaxValue*(this: var vtkLightKit): cdouble {.
    importcpp: "GetKeyToFillRatioMaxValueKeyToHeadRatioMaxValue",
    header: "vtkLightKit.h".}
## !!!Ignored construct:  virtual double GetKeyLightIntensityKeyToFillRatioKeyToHeadRatio ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << KeyToHeadRatio  of  << this -> KeyToHeadRatio ) ; return this -> KeyToHeadRatio ; } ;
## Error: expected ';'!!!

proc SetKeyToFillRatioKeyToHeadRatioKeyToBackRatio*(this: var vtkLightKit;
    _arg: cdouble) {.importcpp: "SetKeyToFillRatioKeyToHeadRatioKeyToBackRatio",
                   header: "vtkLightKit.h".}
proc GetKeyToFillRatioMinValueKeyToHeadRatioMinValueKeyToBackRatioMinValue*(
    this: var vtkLightKit): cdouble {.importcpp: "GetKeyToFillRatioMinValueKeyToHeadRatioMinValueKeyToBackRatioMinValue",
                                  header: "vtkLightKit.h".}
proc GetKeyToFillRatioMaxValueKeyToHeadRatioMaxValueKeyToBackRatioMaxValue*(
    this: var vtkLightKit): cdouble {.importcpp: "GetKeyToFillRatioMaxValueKeyToHeadRatioMaxValueKeyToBackRatioMaxValue",
                                  header: "vtkLightKit.h".}
## !!!Ignored construct:  virtual double GetKeyLightIntensityKeyToFillRatioKeyToHeadRatioKeyToBackRatio ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << KeyToBackRatio  of  << this -> KeyToBackRatio ) ; return this -> KeyToBackRatio ; } ;
## Error: expected ';'!!!

proc SetKeyLightIntensityKeyLightWarmth*(this: var vtkLightKit; _arg: cdouble) {.
    importcpp: "SetKeyLightIntensityKeyLightWarmth", header: "vtkLightKit.h".}
## !!!Ignored construct:  virtual double GetKeyLightIntensityKeyToFillRatioKeyToHeadRatioKeyToBackRatioKeyLightWarmth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << KeyLightWarmth  of  << this -> KeyLightWarmth ) ; return this -> KeyLightWarmth ; } ;
## Error: expected ';'!!!

proc SetKeyLightIntensityKeyLightWarmthFillLightWarmth*(this: var vtkLightKit;
    _arg: cdouble) {.importcpp: "SetKeyLightIntensityKeyLightWarmthFillLightWarmth",
                   header: "vtkLightKit.h".}
## !!!Ignored construct:  virtual double GetKeyLightIntensityKeyToFillRatioKeyToHeadRatioKeyToBackRatioKeyLightWarmthFillLightWarmth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FillLightWarmth  of  << this -> FillLightWarmth ) ; return this -> FillLightWarmth ; } ;
## Error: expected ';'!!!

proc SetKeyLightIntensityKeyLightWarmthFillLightWarmthHeadLightWarmth*(
    this: var vtkLightKit; _arg: cdouble) {.importcpp: "SetKeyLightIntensityKeyLightWarmthFillLightWarmthHeadLightWarmth",
                                       header: "vtkLightKit.h".}
## !!!Ignored construct:  virtual double GetKeyLightIntensityKeyToFillRatioKeyToHeadRatioKeyToBackRatioKeyLightWarmthFillLightWarmthHeadLightWarmth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HeadLightWarmth  of  << this -> HeadLightWarmth ) ; return this -> HeadLightWarmth ; } ;
## Error: expected ';'!!!

proc SetKeyLightIntensityKeyLightWarmthFillLightWarmthHeadLightWarmthBackLightWarmth*(
    this: var vtkLightKit; _arg: cdouble) {.importcpp: "SetKeyLightIntensityKeyLightWarmthFillLightWarmthHeadLightWarmthBackLightWarmth",
                                       header: "vtkLightKit.h".}
## !!!Ignored construct:  virtual double GetKeyLightIntensityKeyToFillRatioKeyToHeadRatioKeyToBackRatioKeyLightWarmthFillLightWarmthHeadLightWarmthBackLightWarmth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BackLightWarmth  of  << this -> BackLightWarmth ) ; return this -> BackLightWarmth ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@{ *
##  Returns the floating-point RGB values of each of the light's color.
##  virtual double * GetKeyLightColorKeyLightColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << KeyLightColor  pointer  << this -> KeyLightColor ) ; return this -> KeyLightColor ; } VTK_WRAPEXCLUDE virtual void GetKeyLightColorKeyLightColor ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> KeyLightColor [ i ] ; } } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual double * GetKeyLightColorKeyLightColorFillLightColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << FillLightColor  pointer  << this -> FillLightColor ) ; return this -> FillLightColor ; } VTK_WRAPEXCLUDE virtual void GetKeyLightColorKeyLightColorFillLightColor ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> FillLightColor [ i ] ; } } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual double * GetKeyLightColorKeyLightColorFillLightColorHeadLightColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << HeadLightColor  pointer  << this -> HeadLightColor ) ; return this -> HeadLightColor ; } VTK_WRAPEXCLUDE virtual void GetKeyLightColorKeyLightColorFillLightColorHeadLightColor ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> HeadLightColor [ i ] ; } } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual double * GetKeyLightColorKeyLightColorFillLightColorHeadLightColorBackLightColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << BackLightColor  pointer  << this -> BackLightColor ) ; return this -> BackLightColor ; } VTK_WRAPEXCLUDE virtual void GetKeyLightColorKeyLightColorFillLightColorHeadLightColorBackLightColor ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> BackLightColor [ i ] ; } } ;
## Error: expected ';'!!!

proc MaintainLuminanceOn*(this: var vtkLightKit) {.importcpp: "MaintainLuminanceOn",
    header: "vtkLightKit.h".}
proc MaintainLuminanceOff*(this: var vtkLightKit) {.
    importcpp: "MaintainLuminanceOff", header: "vtkLightKit.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetKeyLightIntensityKeyToFillRatioKeyToHeadRatioKeyToBackRatioKeyLightWarmthFillLightWarmthHeadLightWarmthBackLightWarmthMaintainLuminance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaintainLuminance  of  << this -> MaintainLuminance ) ; return this -> MaintainLuminance ; } ;
## Error: expected ';'!!!

proc SetKeyLightIntensityKeyLightWarmthFillLightWarmthHeadLightWarmthBackLightWarmthMaintainLuminance*(
    this: var vtkLightKit; _arg: vtkTypeBool) {.importcpp: "SetKeyLightIntensityKeyLightWarmthFillLightWarmthHeadLightWarmthBackLightWarmthMaintainLuminance",
    header: "vtkLightKit.h".}
  ## /@}
  ## *
  ##  Get/Set the position of the key, fill, and back lights
  ##  using angular methods.  Elevation corresponds to latitude,
  ##  azimuth to longitude.  It is recommended that the key light
  ##  always be on the viewer's side of the object and above the
  ##  object, while the fill light generally lights the part of the object
  ##  not lit by the fill light.  The headlight, which is always located
  ##  at the viewer, can then be used to reduce the contrast in the image.
  ##  There are a pair of back lights.  They are located at the same
  ##  elevation and at opposing azimuths (ie, one to the left, and one to
  ##  the right).  They are generally set at the equator (elevation = 0),
  ##  and at approximately 120 degrees (lighting from each side and behind).
  ##
proc SetKeyLightAngle*(this: var vtkLightKit; elevation: cdouble; azimuth: cdouble) {.
    importcpp: "SetKeyLightAngle", header: "vtkLightKit.h".}
proc SetKeyLightAngle*(this: var vtkLightKit; angle: array[2, cdouble]) {.
    importcpp: "SetKeyLightAngle", header: "vtkLightKit.h".}
proc SetKeyLightElevation*(this: var vtkLightKit; x: cdouble) {.
    importcpp: "SetKeyLightElevation", header: "vtkLightKit.h".}
proc SetKeyLightAzimuth*(this: var vtkLightKit; x: cdouble) {.
    importcpp: "SetKeyLightAzimuth", header: "vtkLightKit.h".}
## !!!Ignored construct:  virtual double * GetKeyLightColorKeyLightColorFillLightColorHeadLightColorBackLightColorKeyLightAngle ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << KeyLightAngle  pointer  << this -> KeyLightAngle ) ; return this -> KeyLightAngle ; } VTK_WRAPEXCLUDE virtual void GetKeyLightColorKeyLightColorFillLightColorHeadLightColorBackLightColorKeyLightAngle ( double data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> KeyLightAngle [ i ] ; } } ;
## Error: expected ';'!!!

proc GetKeyLightElevation*(this: var vtkLightKit): cdouble {.
    importcpp: "GetKeyLightElevation", header: "vtkLightKit.h".}
proc GetKeyLightAzimuth*(this: var vtkLightKit): cdouble {.
    importcpp: "GetKeyLightAzimuth", header: "vtkLightKit.h".}
proc SetFillLightAngle*(this: var vtkLightKit; elevation: cdouble; azimuth: cdouble) {.
    importcpp: "SetFillLightAngle", header: "vtkLightKit.h".}
proc SetFillLightAngle*(this: var vtkLightKit; angle: array[2, cdouble]) {.
    importcpp: "SetFillLightAngle", header: "vtkLightKit.h".}
proc SetFillLightElevation*(this: var vtkLightKit; x: cdouble) {.
    importcpp: "SetFillLightElevation", header: "vtkLightKit.h".}
proc SetFillLightAzimuth*(this: var vtkLightKit; x: cdouble) {.
    importcpp: "SetFillLightAzimuth", header: "vtkLightKit.h".}
## !!!Ignored construct:  virtual double * GetKeyLightColorKeyLightColorFillLightColorHeadLightColorBackLightColorKeyLightAngleFillLightAngle ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << FillLightAngle  pointer  << this -> FillLightAngle ) ; return this -> FillLightAngle ; } VTK_WRAPEXCLUDE virtual void GetKeyLightColorKeyLightColorFillLightColorHeadLightColorBackLightColorKeyLightAngleFillLightAngle ( double data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> FillLightAngle [ i ] ; } } ;
## Error: expected ';'!!!

proc GetFillLightElevation*(this: var vtkLightKit): cdouble {.
    importcpp: "GetFillLightElevation", header: "vtkLightKit.h".}
proc GetFillLightAzimuth*(this: var vtkLightKit): cdouble {.
    importcpp: "GetFillLightAzimuth", header: "vtkLightKit.h".}
proc SetBackLightAngle*(this: var vtkLightKit; elevation: cdouble; azimuth: cdouble) {.
    importcpp: "SetBackLightAngle", header: "vtkLightKit.h".}
proc SetBackLightAngle*(this: var vtkLightKit; angle: array[2, cdouble]) {.
    importcpp: "SetBackLightAngle", header: "vtkLightKit.h".}
proc SetBackLightElevation*(this: var vtkLightKit; x: cdouble) {.
    importcpp: "SetBackLightElevation", header: "vtkLightKit.h".}
proc SetBackLightAzimuth*(this: var vtkLightKit; x: cdouble) {.
    importcpp: "SetBackLightAzimuth", header: "vtkLightKit.h".}
## !!!Ignored construct:  virtual double * GetKeyLightColorKeyLightColorFillLightColorHeadLightColorBackLightColorKeyLightAngleFillLightAngleBackLightAngle ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << BackLightAngle  pointer  << this -> BackLightAngle ) ; return this -> BackLightAngle ; } VTK_WRAPEXCLUDE virtual void GetKeyLightColorKeyLightColorFillLightColorHeadLightColorBackLightColorKeyLightAngleFillLightAngleBackLightAngle ( double data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> BackLightAngle [ i ] ; } } ;
## Error: expected ';'!!!

proc GetBackLightElevation*(this: var vtkLightKit): cdouble {.
    importcpp: "GetBackLightElevation", header: "vtkLightKit.h".}
proc GetBackLightAzimuth*(this: var vtkLightKit): cdouble {.
    importcpp: "GetBackLightAzimuth", header: "vtkLightKit.h".}
proc AddLightsToRenderer*(this: var vtkLightKit; renderer: ptr vtkRenderer) {.
    importcpp: "AddLightsToRenderer", header: "vtkLightKit.h".}
proc RemoveLightsFromRenderer*(this: var vtkLightKit; renderer: ptr vtkRenderer) {.
    importcpp: "RemoveLightsFromRenderer", header: "vtkLightKit.h".}
proc DeepCopy*(this: var vtkLightKit; kit: ptr vtkLightKit) {.importcpp: "DeepCopy",
    header: "vtkLightKit.h".}
proc Modified*(this: var vtkLightKit) {.importcpp: "Modified", header: "vtkLightKit.h".}
proc Update*(this: var vtkLightKit) {.importcpp: "Update", header: "vtkLightKit.h".}
proc GetStringFromType*(`type`: cint): cstring {.
    importcpp: "vtkLightKit::GetStringFromType(@)", header: "vtkLightKit.h".}
proc GetStringFromSubType*(`type`: cint): cstring {.
    importcpp: "vtkLightKit::GetStringFromSubType(@)", header: "vtkLightKit.h".}
proc GetShortStringFromSubType*(subtype: cint): cstring {.
    importcpp: "vtkLightKit::GetShortStringFromSubType(@)",
    header: "vtkLightKit.h".}
proc GetSubType*(`type`: vtkLightKitLightKitType; i: cint): vtkLightKitLightKitSubType {.
    importcpp: "vtkLightKit::GetSubType(@)", header: "vtkLightKit.h".}