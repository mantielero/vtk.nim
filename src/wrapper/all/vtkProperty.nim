## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkProperty.h
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
##  @class   vtkProperty
##  @brief   represent surface properties of a geometric object
##
##  vtkProperty is an object that represents lighting and other surface
##  properties of a geometric object. The primary properties that can be
##  set are colors (overall, ambient, diffuse, specular, and edge color);
##  specular power; opacity of the object; the representation of the
##  object (points, wireframe, or surface); and the shading method to be
##  used (flat, Gouraud, and Phong). Also, some special graphics features
##  like backface properties can be set and manipulated with this object.
##
##  @sa
##  vtkActor vtkPropertyDevice
##

import
  vtkObject, vtkRenderingCoreModule

##  shading models

const
  VTK_FLAT* = 0
  VTK_GOURAUD* = 1
  VTK_PHONG* = 2
  VTK_PBR* = 3

##  representation models

const
  VTK_POINTS* = 0
  VTK_WIREFRAME* = 1
  VTK_SURFACE* = 2

discard "forward decl of vtkActor"
discard "forward decl of vtkInformation"
discard "forward decl of vtkRenderer"
discard "forward decl of vtkShaderProgram"
discard "forward decl of vtkTexture"
discard "forward decl of vtkWindow"
discard "forward decl of vtkXMLDataElement"
discard "forward decl of vtkXMLMaterial"
discard "forward decl of vtkPropertyInternals"
type
  vtkProperty* {.importcpp: "vtkProperty", header: "vtkProperty.h", bycopy.} = object of vtkObject
    vtkProperty* {.importc: "vtkProperty".}: VTK_NEWINSTANCE
    ##  Arbitrary extra information associated with this Property.

  vtkPropertySuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkProperty::IsTypeOf(@)", header: "vtkProperty.h".}
proc IsA*(this: var vtkProperty; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkProperty.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkProperty {.
    importcpp: "vtkProperty::SafeDownCast(@)", header: "vtkProperty.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkProperty :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkProperty :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkProperty :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkProperty; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkProperty.h".}
proc New*(): ptr vtkProperty {.importcpp: "vtkProperty::New(@)",
                           header: "vtkProperty.h".}
proc DeepCopy*(this: var vtkProperty; p: ptr vtkProperty) {.importcpp: "DeepCopy",
    header: "vtkProperty.h".}
proc Render*(this: var vtkProperty; a2: ptr vtkActor; a3: ptr vtkRenderer) {.
    importcpp: "Render", header: "vtkProperty.h".}
proc BackfaceRender*(this: var vtkProperty; a2: ptr vtkActor; a3: ptr vtkRenderer) {.
    importcpp: "BackfaceRender", header: "vtkProperty.h".}
proc PostRender*(this: var vtkProperty; a2: ptr vtkActor; a3: ptr vtkRenderer) {.
    importcpp: "PostRender", header: "vtkProperty.h".}
## !!!Ignored construct:  /@{ *
##  Set/Get lighting flag for an object. Initial value is true.
##  virtual bool GetLightingLighting ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Lighting  of  << this -> Lighting ) ; return this -> Lighting ; } ;
## Error: expected ';'!!!

proc SetLighting*(this: var vtkProperty; _arg: bool) {.importcpp: "SetLighting",
    header: "vtkProperty.h".}
proc LightingOn*(this: var vtkProperty) {.importcpp: "LightingOn",
                                      header: "vtkProperty.h".}
proc LightingOff*(this: var vtkProperty) {.importcpp: "LightingOff",
                                       header: "vtkProperty.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get rendering of points as spheres. The size of the
  ##  sphere in pixels is controlled by the PointSize
  ##  attribute. Note that half spheres may be rendered
  ##  instead of spheres.
  ##
## !!!Ignored construct:  virtual bool GetLightingLightingRenderPointsAsSpheres ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RenderPointsAsSpheres  of  << this -> RenderPointsAsSpheres ) ; return this -> RenderPointsAsSpheres ; } ;
## Error: expected ';'!!!

proc SetLightingRenderPointsAsSpheres*(this: var vtkProperty; _arg: bool) {.
    importcpp: "SetLightingRenderPointsAsSpheres", header: "vtkProperty.h".}
proc RenderPointsAsSpheresOn*(this: var vtkProperty) {.
    importcpp: "RenderPointsAsSpheresOn", header: "vtkProperty.h".}
proc RenderPointsAsSpheresOff*(this: var vtkProperty) {.
    importcpp: "RenderPointsAsSpheresOff", header: "vtkProperty.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get rendering of lines as tubes. The width of the
  ##  line in pixels is controlled by the LineWidth
  ##  attribute. May not be supported on every platform
  ##  and the implementation may be half tubes, or something
  ##  only tube like in appearance.
  ##
## !!!Ignored construct:  virtual bool GetLightingLightingRenderPointsAsSpheresRenderLinesAsTubes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RenderLinesAsTubes  of  << this -> RenderLinesAsTubes ) ; return this -> RenderLinesAsTubes ; } ;
## Error: expected ';'!!!

proc SetLightingRenderPointsAsSpheresRenderLinesAsTubes*(this: var vtkProperty;
    _arg: bool) {.importcpp: "SetLightingRenderPointsAsSpheresRenderLinesAsTubes",
                header: "vtkProperty.h".}
proc RenderLinesAsTubesOn*(this: var vtkProperty) {.
    importcpp: "RenderLinesAsTubesOn", header: "vtkProperty.h".}
proc RenderLinesAsTubesOff*(this: var vtkProperty) {.
    importcpp: "RenderLinesAsTubesOff", header: "vtkProperty.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the shading interpolation method for an object.
  ##
proc SetInterpolation*(this: var vtkProperty; _arg: cint) {.
    importcpp: "SetInterpolation", header: "vtkProperty.h".}
proc GetInterpolationMinValue*(this: var vtkProperty): cint {.
    importcpp: "GetInterpolationMinValue", header: "vtkProperty.h".}
proc GetInterpolationMaxValue*(this: var vtkProperty): cint {.
    importcpp: "GetInterpolationMaxValue", header: "vtkProperty.h".}
## !!!Ignored construct:  virtual int GetLightingLightingRenderPointsAsSpheresRenderLinesAsTubesInterpolation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Interpolation  of  << this -> Interpolation ) ; return this -> Interpolation ; } ;
## Error: expected ';'!!!

proc SetInterpolationToFlat*(this: var vtkProperty) {.
    importcpp: "SetInterpolationToFlat", header: "vtkProperty.h".}
proc SetInterpolationToGouraud*(this: var vtkProperty) {.
    importcpp: "SetInterpolationToGouraud", header: "vtkProperty.h".}
proc SetInterpolationToPhong*(this: var vtkProperty) {.
    importcpp: "SetInterpolationToPhong", header: "vtkProperty.h".}
proc SetInterpolationToPBR*(this: var vtkProperty) {.
    importcpp: "SetInterpolationToPBR", header: "vtkProperty.h".}
proc GetInterpolationAsString*(this: var vtkProperty): cstring {.
    importcpp: "GetInterpolationAsString", header: "vtkProperty.h".}
proc SetInterpolationRepresentation*(this: var vtkProperty; _arg: cint) {.
    importcpp: "SetInterpolationRepresentation", header: "vtkProperty.h".}
proc GetInterpolationMinValueRepresentationMinValue*(this: var vtkProperty): cint {.
    importcpp: "GetInterpolationMinValueRepresentationMinValue",
    header: "vtkProperty.h".}
proc GetInterpolationMaxValueRepresentationMaxValue*(this: var vtkProperty): cint {.
    importcpp: "GetInterpolationMaxValueRepresentationMaxValue",
    header: "vtkProperty.h".}
## !!!Ignored construct:  virtual int GetLightingLightingRenderPointsAsSpheresRenderLinesAsTubesInterpolationRepresentation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Representation  of  << this -> Representation ) ; return this -> Representation ; } ;
## Error: expected ';'!!!

proc SetRepresentationToPoints*(this: var vtkProperty) {.
    importcpp: "SetRepresentationToPoints", header: "vtkProperty.h".}
proc SetRepresentationToWireframe*(this: var vtkProperty) {.
    importcpp: "SetRepresentationToWireframe", header: "vtkProperty.h".}
proc SetRepresentationToSurface*(this: var vtkProperty) {.
    importcpp: "SetRepresentationToSurface", header: "vtkProperty.h".}
proc GetRepresentationAsString*(this: var vtkProperty): cstring {.
    importcpp: "GetRepresentationAsString", header: "vtkProperty.h".}
proc SetColor*(this: var vtkProperty; r: cdouble; g: cdouble; b: cdouble) {.
    importcpp: "SetColor", header: "vtkProperty.h".}
proc SetColor*(this: var vtkProperty; a: array[3, cdouble]) {.importcpp: "SetColor",
    header: "vtkProperty.h".}
## !!!Ignored construct:  double * GetColor ( ) VTK_SIZEHINT ( 3 ) ;
## Error: expected ';'!!!

proc GetColor*(this: var vtkProperty; rgb: array[3, cdouble]) {.importcpp: "GetColor",
    header: "vtkProperty.h".}
proc GetColor*(this: var vtkProperty; r: var cdouble; g: var cdouble; b: var cdouble) {.
    importcpp: "GetColor", header: "vtkProperty.h".}
proc SetInterpolationRepresentationBaseIOR*(this: var vtkProperty; _arg: cdouble) {.
    importcpp: "SetInterpolationRepresentationBaseIOR", header: "vtkProperty.h".}
proc GetInterpolationMinValueRepresentationMinValueBaseIORMinValue*(
    this: var vtkProperty): cdouble {.importcpp: "GetInterpolationMinValueRepresentationMinValueBaseIORMinValue",
                                  header: "vtkProperty.h".}
proc GetInterpolationMaxValueRepresentationMaxValueBaseIORMaxValue*(
    this: var vtkProperty): cdouble {.importcpp: "GetInterpolationMaxValueRepresentationMaxValueBaseIORMaxValue",
                                  header: "vtkProperty.h".}
## !!!Ignored construct:  virtual double GetLightingLightingRenderPointsAsSpheresRenderLinesAsTubesInterpolationRepresentationBaseIOR ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BaseIOR  of  << this -> BaseIOR ) ; return this -> BaseIOR ; } ;
## Error: expected ';'!!!

proc SetInterpolationRepresentationBaseIORMetallic*(this: var vtkProperty;
    _arg: cdouble) {.importcpp: "SetInterpolationRepresentationBaseIORMetallic",
                   header: "vtkProperty.h".}
proc GetInterpolationMinValueRepresentationMinValueBaseIORMinValueMetallicMinValue*(
    this: var vtkProperty): cdouble {.importcpp: "GetInterpolationMinValueRepresentationMinValueBaseIORMinValueMetallicMinValue",
                                  header: "vtkProperty.h".}
proc GetInterpolationMaxValueRepresentationMaxValueBaseIORMaxValueMetallicMaxValue*(
    this: var vtkProperty): cdouble {.importcpp: "GetInterpolationMaxValueRepresentationMaxValueBaseIORMaxValueMetallicMaxValue",
                                  header: "vtkProperty.h".}
## !!!Ignored construct:  virtual double GetLightingLightingRenderPointsAsSpheresRenderLinesAsTubesInterpolationRepresentationBaseIORMetallic ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Metallic  of  << this -> Metallic ) ; return this -> Metallic ; } ;
## Error: expected ';'!!!

proc SetInterpolationRepresentationBaseIORMetallicRoughness*(
    this: var vtkProperty; _arg: cdouble) {.importcpp: "SetInterpolationRepresentationBaseIORMetallicRoughness",
                                       header: "vtkProperty.h".}
proc GetInterpolationMinValueRepresentationMinValueBaseIORMinValueMetallicMinValueRoughnessMinValue*(
    this: var vtkProperty): cdouble {.importcpp: "GetInterpolationMinValueRepresentationMinValueBaseIORMinValueMetallicMinValueRoughnessMinValue",
                                  header: "vtkProperty.h".}
proc GetInterpolationMaxValueRepresentationMaxValueBaseIORMaxValueMetallicMaxValueRoughnessMaxValue*(
    this: var vtkProperty): cdouble {.importcpp: "GetInterpolationMaxValueRepresentationMaxValueBaseIORMaxValueMetallicMaxValueRoughnessMaxValue",
                                  header: "vtkProperty.h".}
## !!!Ignored construct:  virtual double GetLightingLightingRenderPointsAsSpheresRenderLinesAsTubesInterpolationRepresentationBaseIORMetallicRoughness ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Roughness  of  << this -> Roughness ) ; return this -> Roughness ; } ;
## Error: expected ';'!!!

proc SetInterpolationRepresentationBaseIORMetallicRoughnessAnisotropy*(
    this: var vtkProperty; _arg: cdouble) {.importcpp: "SetInterpolationRepresentationBaseIORMetallicRoughnessAnisotropy",
                                       header: "vtkProperty.h".}
proc GetInterpolationMinValueRepresentationMinValueBaseIORMinValueMetallicMinValueRoughnessMinValueAnisotropyMinValue*(
    this: var vtkProperty): cdouble {.importcpp: "GetInterpolationMinValueRepresentationMinValueBaseIORMinValueMetallicMinValueRoughnessMinValueAnisotropyMinValue",
                                  header: "vtkProperty.h".}
proc GetInterpolationMaxValueRepresentationMaxValueBaseIORMaxValueMetallicMaxValueRoughnessMaxValueAnisotropyMaxValue*(
    this: var vtkProperty): cdouble {.importcpp: "GetInterpolationMaxValueRepresentationMaxValueBaseIORMaxValueMetallicMaxValueRoughnessMaxValueAnisotropyMaxValue",
                                  header: "vtkProperty.h".}
## !!!Ignored construct:  virtual double GetLightingLightingRenderPointsAsSpheresRenderLinesAsTubesInterpolationRepresentationBaseIORMetallicRoughnessAnisotropy ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Anisotropy  of  << this -> Anisotropy ) ; return this -> Anisotropy ; } ;
## Error: expected ';'!!!

proc SetInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotation*(
    this: var vtkProperty; _arg: cdouble) {.importcpp: "SetInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotation",
                                       header: "vtkProperty.h".}
proc GetInterpolationMinValueRepresentationMinValueBaseIORMinValueMetallicMinValueRoughnessMinValueAnisotropyMinValueAnisotropyRotationMinValue*(
    this: var vtkProperty): cdouble {.importcpp: "GetInterpolationMinValueRepresentationMinValueBaseIORMinValueMetallicMinValueRoughnessMinValueAnisotropyMinValueAnisotropyRotationMinValue",
                                  header: "vtkProperty.h".}
proc GetInterpolationMaxValueRepresentationMaxValueBaseIORMaxValueMetallicMaxValueRoughnessMaxValueAnisotropyMaxValueAnisotropyRotationMaxValue*(
    this: var vtkProperty): cdouble {.importcpp: "GetInterpolationMaxValueRepresentationMaxValueBaseIORMaxValueMetallicMaxValueRoughnessMaxValueAnisotropyMaxValueAnisotropyRotationMaxValue",
                                  header: "vtkProperty.h".}
## !!!Ignored construct:  virtual double GetLightingLightingRenderPointsAsSpheresRenderLinesAsTubesInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AnisotropyRotation  of  << this -> AnisotropyRotation ) ; return this -> AnisotropyRotation ; } ;
## Error: expected ';'!!!

proc SetInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIOR*(
    this: var vtkProperty; _arg: cdouble) {.importcpp: "SetInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIOR",
                                       header: "vtkProperty.h".}
proc GetInterpolationMinValueRepresentationMinValueBaseIORMinValueMetallicMinValueRoughnessMinValueAnisotropyMinValueAnisotropyRotationMinValueCoatIORMinValue*(
    this: var vtkProperty): cdouble {.importcpp: "GetInterpolationMinValueRepresentationMinValueBaseIORMinValueMetallicMinValueRoughnessMinValueAnisotropyMinValueAnisotropyRotationMinValueCoatIORMinValue",
                                  header: "vtkProperty.h".}
proc GetInterpolationMaxValueRepresentationMaxValueBaseIORMaxValueMetallicMaxValueRoughnessMaxValueAnisotropyMaxValueAnisotropyRotationMaxValueCoatIORMaxValue*(
    this: var vtkProperty): cdouble {.importcpp: "GetInterpolationMaxValueRepresentationMaxValueBaseIORMaxValueMetallicMaxValueRoughnessMaxValueAnisotropyMaxValueAnisotropyRotationMaxValueCoatIORMaxValue",
                                  header: "vtkProperty.h".}
## !!!Ignored construct:  virtual double GetLightingLightingRenderPointsAsSpheresRenderLinesAsTubesInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIOR ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CoatIOR  of  << this -> CoatIOR ) ; return this -> CoatIOR ; } ;
## Error: expected ';'!!!

proc SetInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughness*(
    this: var vtkProperty; _arg: cdouble) {.importcpp: "SetInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughness",
                                       header: "vtkProperty.h".}
proc GetInterpolationMinValueRepresentationMinValueBaseIORMinValueMetallicMinValueRoughnessMinValueAnisotropyMinValueAnisotropyRotationMinValueCoatIORMinValueCoatRoughnessMinValue*(
    this: var vtkProperty): cdouble {.importcpp: "GetInterpolationMinValueRepresentationMinValueBaseIORMinValueMetallicMinValueRoughnessMinValueAnisotropyMinValueAnisotropyRotationMinValueCoatIORMinValueCoatRoughnessMinValue",
                                  header: "vtkProperty.h".}
proc GetInterpolationMaxValueRepresentationMaxValueBaseIORMaxValueMetallicMaxValueRoughnessMaxValueAnisotropyMaxValueAnisotropyRotationMaxValueCoatIORMaxValueCoatRoughnessMaxValue*(
    this: var vtkProperty): cdouble {.importcpp: "GetInterpolationMaxValueRepresentationMaxValueBaseIORMaxValueMetallicMaxValueRoughnessMaxValueAnisotropyMaxValueAnisotropyRotationMaxValueCoatIORMaxValueCoatRoughnessMaxValue",
                                  header: "vtkProperty.h".}
## !!!Ignored construct:  virtual double GetLightingLightingRenderPointsAsSpheresRenderLinesAsTubesInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughness ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CoatRoughness  of  << this -> CoatRoughness ) ; return this -> CoatRoughness ; } ;
## Error: expected ';'!!!

proc SetInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrength*(
    this: var vtkProperty; _arg: cdouble) {.importcpp: "SetInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrength",
                                       header: "vtkProperty.h".}
proc GetInterpolationMinValueRepresentationMinValueBaseIORMinValueMetallicMinValueRoughnessMinValueAnisotropyMinValueAnisotropyRotationMinValueCoatIORMinValueCoatRoughnessMinValueCoatStrengthMinValue*(
    this: var vtkProperty): cdouble {.importcpp: "GetInterpolationMinValueRepresentationMinValueBaseIORMinValueMetallicMinValueRoughnessMinValueAnisotropyMinValueAnisotropyRotationMinValueCoatIORMinValueCoatRoughnessMinValueCoatStrengthMinValue",
                                  header: "vtkProperty.h".}
proc GetInterpolationMaxValueRepresentationMaxValueBaseIORMaxValueMetallicMaxValueRoughnessMaxValueAnisotropyMaxValueAnisotropyRotationMaxValueCoatIORMaxValueCoatRoughnessMaxValueCoatStrengthMaxValue*(
    this: var vtkProperty): cdouble {.importcpp: "GetInterpolationMaxValueRepresentationMaxValueBaseIORMaxValueMetallicMaxValueRoughnessMaxValueAnisotropyMaxValueAnisotropyRotationMaxValueCoatIORMaxValueCoatRoughnessMaxValueCoatStrengthMaxValue",
                                  header: "vtkProperty.h".}
## !!!Ignored construct:  virtual double GetLightingLightingRenderPointsAsSpheresRenderLinesAsTubesInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrength ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CoatStrength  of  << this -> CoatStrength ) ; return this -> CoatStrength ; } ;
## Error: expected ';'!!!

proc SetCoatColor*(this: var vtkProperty; _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetCoatColor", header: "vtkProperty.h".}
proc SetCoatColor*(this: var vtkProperty; _arg: array[3, cdouble]) {.
    importcpp: "SetCoatColor", header: "vtkProperty.h".}
## !!!Ignored construct:  virtual double * GetCoatColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << CoatColor  pointer  << this -> CoatColor ) ; return this -> CoatColor ; } VTK_WRAPEXCLUDE virtual void GetCoatColor ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> CoatColor [ 0 ] ; _arg2 = this -> CoatColor [ 1 ] ; _arg3 = this -> CoatColor [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << CoatColor  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCoatColor ( double _arg [ 3 ] ) { this -> GetCoatColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScale*(
    this: var vtkProperty; _arg: cdouble) {.importcpp: "SetInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScale",
                                       header: "vtkProperty.h".}
proc GetInterpolationMinValueRepresentationMinValueBaseIORMinValueMetallicMinValueRoughnessMinValueAnisotropyMinValueAnisotropyRotationMinValueCoatIORMinValueCoatRoughnessMinValueCoatStrengthMinValueCoatNormalScaleMinValue*(
    this: var vtkProperty): cdouble {.importcpp: "GetInterpolationMinValueRepresentationMinValueBaseIORMinValueMetallicMinValueRoughnessMinValueAnisotropyMinValueAnisotropyRotationMinValueCoatIORMinValueCoatRoughnessMinValueCoatStrengthMinValueCoatNormalScaleMinValue",
                                  header: "vtkProperty.h".}
proc GetInterpolationMaxValueRepresentationMaxValueBaseIORMaxValueMetallicMaxValueRoughnessMaxValueAnisotropyMaxValueAnisotropyRotationMaxValueCoatIORMaxValueCoatRoughnessMaxValueCoatStrengthMaxValueCoatNormalScaleMaxValue*(
    this: var vtkProperty): cdouble {.importcpp: "GetInterpolationMaxValueRepresentationMaxValueBaseIORMaxValueMetallicMaxValueRoughnessMaxValueAnisotropyMaxValueAnisotropyRotationMaxValueCoatIORMaxValueCoatRoughnessMaxValueCoatStrengthMaxValueCoatNormalScaleMaxValue",
                                  header: "vtkProperty.h".}
## !!!Ignored construct:  virtual double GetLightingLightingRenderPointsAsSpheresRenderLinesAsTubesInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScale ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CoatNormalScale  of  << this -> CoatNormalScale ) ; return this -> CoatNormalScale ; } ;
## Error: expected ';'!!!

proc SetLightingRenderPointsAsSpheresRenderLinesAsTubesNormalScale*(
    this: var vtkProperty; _arg: cdouble) {.importcpp: "SetLightingRenderPointsAsSpheresRenderLinesAsTubesNormalScale",
                                       header: "vtkProperty.h".}
## !!!Ignored construct:  virtual double GetLightingLightingRenderPointsAsSpheresRenderLinesAsTubesInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScaleNormalScale ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NormalScale  of  << this -> NormalScale ) ; return this -> NormalScale ; } ;
## Error: expected ';'!!!

proc SetInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScaleOcclusionStrength*(
    this: var vtkProperty; _arg: cdouble) {.importcpp: "SetInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScaleOcclusionStrength",
                                       header: "vtkProperty.h".}
proc GetInterpolationMinValueRepresentationMinValueBaseIORMinValueMetallicMinValueRoughnessMinValueAnisotropyMinValueAnisotropyRotationMinValueCoatIORMinValueCoatRoughnessMinValueCoatStrengthMinValueCoatNormalScaleMinValueOcclusionStrengthMinValue*(
    this: var vtkProperty): cdouble {.importcpp: "GetInterpolationMinValueRepresentationMinValueBaseIORMinValueMetallicMinValueRoughnessMinValueAnisotropyMinValueAnisotropyRotationMinValueCoatIORMinValueCoatRoughnessMinValueCoatStrengthMinValueCoatNormalScaleMinValueOcclusionStrengthMinValue",
                                  header: "vtkProperty.h".}
proc GetInterpolationMaxValueRepresentationMaxValueBaseIORMaxValueMetallicMaxValueRoughnessMaxValueAnisotropyMaxValueAnisotropyRotationMaxValueCoatIORMaxValueCoatRoughnessMaxValueCoatStrengthMaxValueCoatNormalScaleMaxValueOcclusionStrengthMaxValue*(
    this: var vtkProperty): cdouble {.importcpp: "GetInterpolationMaxValueRepresentationMaxValueBaseIORMaxValueMetallicMaxValueRoughnessMaxValueAnisotropyMaxValueAnisotropyRotationMaxValueCoatIORMaxValueCoatRoughnessMaxValueCoatStrengthMaxValueCoatNormalScaleMaxValueOcclusionStrengthMaxValue",
                                  header: "vtkProperty.h".}
## !!!Ignored construct:  virtual double GetLightingLightingRenderPointsAsSpheresRenderLinesAsTubesInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScaleNormalScaleOcclusionStrength ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OcclusionStrength  of  << this -> OcclusionStrength ) ; return this -> OcclusionStrength ; } ;
## Error: expected ';'!!!

proc SetCoatColorEmissiveFactor*(this: var vtkProperty; _arg1: cdouble;
                                _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetCoatColorEmissiveFactor", header: "vtkProperty.h".}
proc SetCoatColorEmissiveFactor*(this: var vtkProperty; _arg: array[3, cdouble]) {.
    importcpp: "SetCoatColorEmissiveFactor", header: "vtkProperty.h".}
## !!!Ignored construct:  virtual double * GetCoatColorEmissiveFactor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << EmissiveFactor  pointer  << this -> EmissiveFactor ) ; return this -> EmissiveFactor ; } VTK_WRAPEXCLUDE virtual void GetCoatColorEmissiveFactor ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> EmissiveFactor [ 0 ] ; _arg2 = this -> EmissiveFactor [ 1 ] ; _arg3 = this -> EmissiveFactor [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << EmissiveFactor  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCoatColorEmissiveFactor ( double _arg [ 3 ] ) { this -> GetCoatColorEmissiveFactor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetCoatColorEmissiveFactorEdgeTint*(this: var vtkProperty; _arg1: cdouble;
                                        _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetCoatColorEmissiveFactorEdgeTint", header: "vtkProperty.h".}
proc SetCoatColorEmissiveFactorEdgeTint*(this: var vtkProperty;
                                        _arg: array[3, cdouble]) {.
    importcpp: "SetCoatColorEmissiveFactorEdgeTint", header: "vtkProperty.h".}
## !!!Ignored construct:  virtual double * GetCoatColorEmissiveFactorEdgeTint ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << EdgeTint  pointer  << this -> EdgeTint ) ; return this -> EdgeTint ; } VTK_WRAPEXCLUDE virtual void GetCoatColorEmissiveFactorEdgeTint ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> EdgeTint [ 0 ] ; _arg2 = this -> EdgeTint [ 1 ] ; _arg3 = this -> EdgeTint [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << EdgeTint  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCoatColorEmissiveFactorEdgeTint ( double _arg [ 3 ] ) { this -> GetCoatColorEmissiveFactorEdgeTint ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScaleOcclusionStrengthAmbient*(
    this: var vtkProperty; _arg: cdouble) {.importcpp: "SetInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScaleOcclusionStrengthAmbient",
                                       header: "vtkProperty.h".}
proc GetInterpolationMinValueRepresentationMinValueBaseIORMinValueMetallicMinValueRoughnessMinValueAnisotropyMinValueAnisotropyRotationMinValueCoatIORMinValueCoatRoughnessMinValueCoatStrengthMinValueCoatNormalScaleMinValueOcclusionStrengthMinValueAmbientMinValue*(
    this: var vtkProperty): cdouble {.importcpp: "GetInterpolationMinValueRepresentationMinValueBaseIORMinValueMetallicMinValueRoughnessMinValueAnisotropyMinValueAnisotropyRotationMinValueCoatIORMinValueCoatRoughnessMinValueCoatStrengthMinValueCoatNormalScaleMinValueOcclusionStrengthMinValueAmbientMinValue",
                                  header: "vtkProperty.h".}
proc GetInterpolationMaxValueRepresentationMaxValueBaseIORMaxValueMetallicMaxValueRoughnessMaxValueAnisotropyMaxValueAnisotropyRotationMaxValueCoatIORMaxValueCoatRoughnessMaxValueCoatStrengthMaxValueCoatNormalScaleMaxValueOcclusionStrengthMaxValueAmbientMaxValue*(
    this: var vtkProperty): cdouble {.importcpp: "GetInterpolationMaxValueRepresentationMaxValueBaseIORMaxValueMetallicMaxValueRoughnessMaxValueAnisotropyMaxValueAnisotropyRotationMaxValueCoatIORMaxValueCoatRoughnessMaxValueCoatStrengthMaxValueCoatNormalScaleMaxValueOcclusionStrengthMaxValueAmbientMaxValue",
                                  header: "vtkProperty.h".}
## !!!Ignored construct:  virtual double GetLightingLightingRenderPointsAsSpheresRenderLinesAsTubesInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScaleNormalScaleOcclusionStrengthAmbient ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Ambient  of  << this -> Ambient ) ; return this -> Ambient ; } ;
## Error: expected ';'!!!

proc SetInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScaleOcclusionStrengthAmbientDiffuse*(
    this: var vtkProperty; _arg: cdouble) {.importcpp: "SetInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScaleOcclusionStrengthAmbientDiffuse",
                                       header: "vtkProperty.h".}
proc GetInterpolationMinValueRepresentationMinValueBaseIORMinValueMetallicMinValueRoughnessMinValueAnisotropyMinValueAnisotropyRotationMinValueCoatIORMinValueCoatRoughnessMinValueCoatStrengthMinValueCoatNormalScaleMinValueOcclusionStrengthMinValueAmbientMinValueDiffuseMinValue*(
    this: var vtkProperty): cdouble {.importcpp: "GetInterpolationMinValueRepresentationMinValueBaseIORMinValueMetallicMinValueRoughnessMinValueAnisotropyMinValueAnisotropyRotationMinValueCoatIORMinValueCoatRoughnessMinValueCoatStrengthMinValueCoatNormalScaleMinValueOcclusionStrengthMinValueAmbientMinValueDiffuseMinValue",
                                  header: "vtkProperty.h".}
proc GetInterpolationMaxValueRepresentationMaxValueBaseIORMaxValueMetallicMaxValueRoughnessMaxValueAnisotropyMaxValueAnisotropyRotationMaxValueCoatIORMaxValueCoatRoughnessMaxValueCoatStrengthMaxValueCoatNormalScaleMaxValueOcclusionStrengthMaxValueAmbientMaxValueDiffuseMaxValue*(
    this: var vtkProperty): cdouble {.importcpp: "GetInterpolationMaxValueRepresentationMaxValueBaseIORMaxValueMetallicMaxValueRoughnessMaxValueAnisotropyMaxValueAnisotropyRotationMaxValueCoatIORMaxValueCoatRoughnessMaxValueCoatStrengthMaxValueCoatNormalScaleMaxValueOcclusionStrengthMaxValueAmbientMaxValueDiffuseMaxValue",
                                  header: "vtkProperty.h".}
## !!!Ignored construct:  virtual double GetLightingLightingRenderPointsAsSpheresRenderLinesAsTubesInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScaleNormalScaleOcclusionStrengthAmbientDiffuse ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Diffuse  of  << this -> Diffuse ) ; return this -> Diffuse ; } ;
## Error: expected ';'!!!

proc SetInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScaleOcclusionStrengthAmbientDiffuseSpecular*(
    this: var vtkProperty; _arg: cdouble) {.importcpp: "SetInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScaleOcclusionStrengthAmbientDiffuseSpecular",
                                       header: "vtkProperty.h".}
proc GetInterpolationMinValueRepresentationMinValueBaseIORMinValueMetallicMinValueRoughnessMinValueAnisotropyMinValueAnisotropyRotationMinValueCoatIORMinValueCoatRoughnessMinValueCoatStrengthMinValueCoatNormalScaleMinValueOcclusionStrengthMinValueAmbientMinValueDiffuseMinValueSpecularMinValue*(
    this: var vtkProperty): cdouble {.importcpp: "GetInterpolationMinValueRepresentationMinValueBaseIORMinValueMetallicMinValueRoughnessMinValueAnisotropyMinValueAnisotropyRotationMinValueCoatIORMinValueCoatRoughnessMinValueCoatStrengthMinValueCoatNormalScaleMinValueOcclusionStrengthMinValueAmbientMinValueDiffuseMinValueSpecularMinValue",
                                  header: "vtkProperty.h".}
proc GetInterpolationMaxValueRepresentationMaxValueBaseIORMaxValueMetallicMaxValueRoughnessMaxValueAnisotropyMaxValueAnisotropyRotationMaxValueCoatIORMaxValueCoatRoughnessMaxValueCoatStrengthMaxValueCoatNormalScaleMaxValueOcclusionStrengthMaxValueAmbientMaxValueDiffuseMaxValueSpecularMaxValue*(
    this: var vtkProperty): cdouble {.importcpp: "GetInterpolationMaxValueRepresentationMaxValueBaseIORMaxValueMetallicMaxValueRoughnessMaxValueAnisotropyMaxValueAnisotropyRotationMaxValueCoatIORMaxValueCoatRoughnessMaxValueCoatStrengthMaxValueCoatNormalScaleMaxValueOcclusionStrengthMaxValueAmbientMaxValueDiffuseMaxValueSpecularMaxValue",
                                  header: "vtkProperty.h".}
## !!!Ignored construct:  virtual double GetLightingLightingRenderPointsAsSpheresRenderLinesAsTubesInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScaleNormalScaleOcclusionStrengthAmbientDiffuseSpecular ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Specular  of  << this -> Specular ) ; return this -> Specular ; } ;
## Error: expected ';'!!!

proc SetInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScaleOcclusionStrengthAmbientDiffuseSpecularSpecularPower*(
    this: var vtkProperty; _arg: cdouble) {.importcpp: "SetInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScaleOcclusionStrengthAmbientDiffuseSpecularSpecularPower",
                                       header: "vtkProperty.h".}
proc GetInterpolationMinValueRepresentationMinValueBaseIORMinValueMetallicMinValueRoughnessMinValueAnisotropyMinValueAnisotropyRotationMinValueCoatIORMinValueCoatRoughnessMinValueCoatStrengthMinValueCoatNormalScaleMinValueOcclusionStrengthMinValueAmbientMinValueDiffuseMinValueSpecularMinValueSpecularPowerMinValue*(
    this: var vtkProperty): cdouble {.importcpp: "GetInterpolationMinValueRepresentationMinValueBaseIORMinValueMetallicMinValueRoughnessMinValueAnisotropyMinValueAnisotropyRotationMinValueCoatIORMinValueCoatRoughnessMinValueCoatStrengthMinValueCoatNormalScaleMinValueOcclusionStrengthMinValueAmbientMinValueDiffuseMinValueSpecularMinValueSpecularPowerMinValue",
                                  header: "vtkProperty.h".}
proc GetInterpolationMaxValueRepresentationMaxValueBaseIORMaxValueMetallicMaxValueRoughnessMaxValueAnisotropyMaxValueAnisotropyRotationMaxValueCoatIORMaxValueCoatRoughnessMaxValueCoatStrengthMaxValueCoatNormalScaleMaxValueOcclusionStrengthMaxValueAmbientMaxValueDiffuseMaxValueSpecularMaxValueSpecularPowerMaxValue*(
    this: var vtkProperty): cdouble {.importcpp: "GetInterpolationMaxValueRepresentationMaxValueBaseIORMaxValueMetallicMaxValueRoughnessMaxValueAnisotropyMaxValueAnisotropyRotationMaxValueCoatIORMaxValueCoatRoughnessMaxValueCoatStrengthMaxValueCoatNormalScaleMaxValueOcclusionStrengthMaxValueAmbientMaxValueDiffuseMaxValueSpecularMaxValueSpecularPowerMaxValue",
                                  header: "vtkProperty.h".}
## !!!Ignored construct:  virtual double GetLightingLightingRenderPointsAsSpheresRenderLinesAsTubesInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScaleNormalScaleOcclusionStrengthAmbientDiffuseSpecularSpecularPower ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SpecularPower  of  << this -> SpecularPower ) ; return this -> SpecularPower ; } ;
## Error: expected ';'!!!

proc SetInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScaleOcclusionStrengthAmbientDiffuseSpecularSpecularPowerOpacity*(
    this: var vtkProperty; _arg: cdouble) {.importcpp: "SetInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScaleOcclusionStrengthAmbientDiffuseSpecularSpecularPowerOpacity",
                                       header: "vtkProperty.h".}
proc GetInterpolationMinValueRepresentationMinValueBaseIORMinValueMetallicMinValueRoughnessMinValueAnisotropyMinValueAnisotropyRotationMinValueCoatIORMinValueCoatRoughnessMinValueCoatStrengthMinValueCoatNormalScaleMinValueOcclusionStrengthMinValueAmbientMinValueDiffuseMinValueSpecularMinValueSpecularPowerMinValueOpacityMinValue*(
    this: var vtkProperty): cdouble {.importcpp: "GetInterpolationMinValueRepresentationMinValueBaseIORMinValueMetallicMinValueRoughnessMinValueAnisotropyMinValueAnisotropyRotationMinValueCoatIORMinValueCoatRoughnessMinValueCoatStrengthMinValueCoatNormalScaleMinValueOcclusionStrengthMinValueAmbientMinValueDiffuseMinValueSpecularMinValueSpecularPowerMinValueOpacityMinValue",
                                  header: "vtkProperty.h".}
proc GetInterpolationMaxValueRepresentationMaxValueBaseIORMaxValueMetallicMaxValueRoughnessMaxValueAnisotropyMaxValueAnisotropyRotationMaxValueCoatIORMaxValueCoatRoughnessMaxValueCoatStrengthMaxValueCoatNormalScaleMaxValueOcclusionStrengthMaxValueAmbientMaxValueDiffuseMaxValueSpecularMaxValueSpecularPowerMaxValueOpacityMaxValue*(
    this: var vtkProperty): cdouble {.importcpp: "GetInterpolationMaxValueRepresentationMaxValueBaseIORMaxValueMetallicMaxValueRoughnessMaxValueAnisotropyMaxValueAnisotropyRotationMaxValueCoatIORMaxValueCoatRoughnessMaxValueCoatStrengthMaxValueCoatNormalScaleMaxValueOcclusionStrengthMaxValueAmbientMaxValueDiffuseMaxValueSpecularMaxValueSpecularPowerMaxValueOpacityMaxValue",
                                  header: "vtkProperty.h".}
## !!!Ignored construct:  virtual double GetLightingLightingRenderPointsAsSpheresRenderLinesAsTubesInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScaleNormalScaleOcclusionStrengthAmbientDiffuseSpecularSpecularPowerOpacity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Opacity  of  << this -> Opacity ) ; return this -> Opacity ; } ;
## Error: expected ';'!!!

proc SetCoatColorEmissiveFactorEdgeTintAmbientColor*(this: var vtkProperty;
    _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetCoatColorEmissiveFactorEdgeTintAmbientColor",
    header: "vtkProperty.h".}
proc SetCoatColorEmissiveFactorEdgeTintAmbientColor*(this: var vtkProperty;
    _arg: array[3, cdouble]) {.importcpp: "SetCoatColorEmissiveFactorEdgeTintAmbientColor",
                            header: "vtkProperty.h".}
## !!!Ignored construct:  virtual double * GetCoatColorEmissiveFactorEdgeTintAmbientColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << AmbientColor  pointer  << this -> AmbientColor ) ; return this -> AmbientColor ; } VTK_WRAPEXCLUDE virtual void GetCoatColorEmissiveFactorEdgeTintAmbientColor ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> AmbientColor [ 0 ] ; _arg2 = this -> AmbientColor [ 1 ] ; _arg3 = this -> AmbientColor [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << AmbientColor  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCoatColorEmissiveFactorEdgeTintAmbientColor ( double _arg [ 3 ] ) { this -> GetCoatColorEmissiveFactorEdgeTintAmbientColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetCoatColorEmissiveFactorEdgeTintAmbientColorDiffuseColor*(
    this: var vtkProperty; _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetCoatColorEmissiveFactorEdgeTintAmbientColorDiffuseColor",
    header: "vtkProperty.h".}
proc SetCoatColorEmissiveFactorEdgeTintAmbientColorDiffuseColor*(
    this: var vtkProperty; _arg: array[3, cdouble]) {.
    importcpp: "SetCoatColorEmissiveFactorEdgeTintAmbientColorDiffuseColor",
    header: "vtkProperty.h".}
## !!!Ignored construct:  virtual double * GetCoatColorEmissiveFactorEdgeTintAmbientColorDiffuseColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << DiffuseColor  pointer  << this -> DiffuseColor ) ; return this -> DiffuseColor ; } VTK_WRAPEXCLUDE virtual void GetCoatColorEmissiveFactorEdgeTintAmbientColorDiffuseColor ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> DiffuseColor [ 0 ] ; _arg2 = this -> DiffuseColor [ 1 ] ; _arg3 = this -> DiffuseColor [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << DiffuseColor  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCoatColorEmissiveFactorEdgeTintAmbientColorDiffuseColor ( double _arg [ 3 ] ) { this -> GetCoatColorEmissiveFactorEdgeTintAmbientColorDiffuseColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetCoatColorEmissiveFactorEdgeTintAmbientColorDiffuseColorSpecularColor*(
    this: var vtkProperty; _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.importcpp: "SetCoatColorEmissiveFactorEdgeTintAmbientColorDiffuseColorSpecularColor",
    header: "vtkProperty.h".}
proc SetCoatColorEmissiveFactorEdgeTintAmbientColorDiffuseColorSpecularColor*(
    this: var vtkProperty; _arg: array[3, cdouble]) {.importcpp: "SetCoatColorEmissiveFactorEdgeTintAmbientColorDiffuseColorSpecularColor",
    header: "vtkProperty.h".}
## !!!Ignored construct:  virtual double * GetCoatColorEmissiveFactorEdgeTintAmbientColorDiffuseColorSpecularColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << SpecularColor  pointer  << this -> SpecularColor ) ; return this -> SpecularColor ; } VTK_WRAPEXCLUDE virtual void GetCoatColorEmissiveFactorEdgeTintAmbientColorDiffuseColorSpecularColor ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> SpecularColor [ 0 ] ; _arg2 = this -> SpecularColor [ 1 ] ; _arg3 = this -> SpecularColor [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << SpecularColor  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCoatColorEmissiveFactorEdgeTintAmbientColorDiffuseColorSpecularColor ( double _arg [ 3 ] ) { this -> GetCoatColorEmissiveFactorEdgeTintAmbientColorDiffuseColorSpecularColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Turn on/off the visibility of edges. On some renderers it is
##  possible to render the edges of geometric primitives separately
##  from the interior.
##  virtual vtkTypeBool GetLightingLightingRenderPointsAsSpheresRenderLinesAsTubesInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScaleNormalScaleOcclusionStrengthAmbientDiffuseSpecularSpecularPowerOpacityEdgeVisibilityEdgeVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EdgeVisibility  of  << this -> EdgeVisibility ) ; return this -> EdgeVisibility ; } ;
## Error: expected ';'!!!

proc SetLightingRenderPointsAsSpheresRenderLinesAsTubesNormalScaleEdgeVisibility*(
    this: var vtkProperty; _arg: vtkTypeBool) {.importcpp: "SetLightingRenderPointsAsSpheresRenderLinesAsTubesNormalScaleEdgeVisibility",
    header: "vtkProperty.h".}
proc EdgeVisibilityOn*(this: var vtkProperty) {.importcpp: "EdgeVisibilityOn",
    header: "vtkProperty.h".}
proc EdgeVisibilityOff*(this: var vtkProperty) {.importcpp: "EdgeVisibilityOff",
    header: "vtkProperty.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the color of primitive edges (if edge visibility is enabled).
  ##
proc SetCoatColorEmissiveFactorEdgeTintAmbientColorDiffuseColorSpecularColorEdgeColor*(
    this: var vtkProperty; _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.importcpp: "SetCoatColorEmissiveFactorEdgeTintAmbientColorDiffuseColorSpecularColorEdgeColor",
    header: "vtkProperty.h".}
proc SetCoatColorEmissiveFactorEdgeTintAmbientColorDiffuseColorSpecularColorEdgeColor*(
    this: var vtkProperty; _arg: array[3, cdouble]) {.importcpp: "SetCoatColorEmissiveFactorEdgeTintAmbientColorDiffuseColorSpecularColorEdgeColor",
    header: "vtkProperty.h".}
## !!!Ignored construct:  virtual double * GetCoatColorEmissiveFactorEdgeTintAmbientColorDiffuseColorSpecularColorEdgeColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << EdgeColor  pointer  << this -> EdgeColor ) ; return this -> EdgeColor ; } VTK_WRAPEXCLUDE virtual void GetCoatColorEmissiveFactorEdgeTintAmbientColorDiffuseColorSpecularColorEdgeColor ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> EdgeColor [ 0 ] ; _arg2 = this -> EdgeColor [ 1 ] ; _arg3 = this -> EdgeColor [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << EdgeColor  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCoatColorEmissiveFactorEdgeTintAmbientColorDiffuseColorSpecularColorEdgeColor ( double _arg [ 3 ] ) { this -> GetCoatColorEmissiveFactorEdgeTintAmbientColorDiffuseColorSpecularColorEdgeColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Turn on/off the visibility of vertices. On some renderers it is
##  possible to render the vertices of geometric primitives separately
##  from the interior.
##  virtual vtkTypeBool GetLightingLightingRenderPointsAsSpheresRenderLinesAsTubesInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScaleNormalScaleOcclusionStrengthAmbientDiffuseSpecularSpecularPowerOpacityEdgeVisibilityEdgeVisibilityVertexVisibilityVertexVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VertexVisibility  of  << this -> VertexVisibility ) ; return this -> VertexVisibility ; } ;
## Error: expected ';'!!!

proc SetLightingRenderPointsAsSpheresRenderLinesAsTubesNormalScaleEdgeVisibilityVertexVisibility*(
    this: var vtkProperty; _arg: vtkTypeBool) {.importcpp: "SetLightingRenderPointsAsSpheresRenderLinesAsTubesNormalScaleEdgeVisibilityVertexVisibility",
    header: "vtkProperty.h".}
proc VertexVisibilityOn*(this: var vtkProperty) {.importcpp: "VertexVisibilityOn",
    header: "vtkProperty.h".}
proc VertexVisibilityOff*(this: var vtkProperty) {.importcpp: "VertexVisibilityOff",
    header: "vtkProperty.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the color of primitive vertices (if vertex visibility is enabled).
  ##
proc SetCoatColorEmissiveFactorEdgeTintAmbientColorDiffuseColorSpecularColorEdgeColorVertexColor*(
    this: var vtkProperty; _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.importcpp: "SetCoatColorEmissiveFactorEdgeTintAmbientColorDiffuseColorSpecularColorEdgeColorVertexColor",
    header: "vtkProperty.h".}
proc SetCoatColorEmissiveFactorEdgeTintAmbientColorDiffuseColorSpecularColorEdgeColorVertexColor*(
    this: var vtkProperty; _arg: array[3, cdouble]) {.importcpp: "SetCoatColorEmissiveFactorEdgeTintAmbientColorDiffuseColorSpecularColorEdgeColorVertexColor",
    header: "vtkProperty.h".}
## !!!Ignored construct:  virtual double * GetCoatColorEmissiveFactorEdgeTintAmbientColorDiffuseColorSpecularColorEdgeColorVertexColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << VertexColor  pointer  << this -> VertexColor ) ; return this -> VertexColor ; } VTK_WRAPEXCLUDE virtual void GetCoatColorEmissiveFactorEdgeTintAmbientColorDiffuseColorSpecularColorEdgeColorVertexColor ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> VertexColor [ 0 ] ; _arg2 = this -> VertexColor [ 1 ] ; _arg3 = this -> VertexColor [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << VertexColor  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCoatColorEmissiveFactorEdgeTintAmbientColorDiffuseColorSpecularColorEdgeColorVertexColor ( double _arg [ 3 ] ) { this -> GetCoatColorEmissiveFactorEdgeTintAmbientColorDiffuseColorSpecularColorEdgeColorVertexColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetSelectionColor*(this: var vtkProperty; _arg1: cdouble; _arg2: cdouble;
                       _arg3: cdouble; _arg4: cdouble) {.
    importcpp: "SetSelectionColor", header: "vtkProperty.h".}
proc SetSelectionColor*(this: var vtkProperty; _arg: array[4, cdouble]) {.
    importcpp: "SetSelectionColor", header: "vtkProperty.h".}
## !!!Ignored construct:  virtual double * GetSelectionColor ( ) VTK_SIZEHINT ( 4 ) { vtkDebugWithObjectMacro ( this , <<  returning  << SelectionColor  pointer  << this -> SelectionColor ) ; return this -> SelectionColor ; } VTK_WRAPEXCLUDE virtual void GetSelectionColor ( double & _arg1 , double & _arg2 , double & _arg3 , double & _arg4 ) { _arg1 = this -> SelectionColor [ 0 ] ; _arg2 = this -> SelectionColor [ 1 ] ; _arg3 = this -> SelectionColor [ 2 ] ; _arg4 = this -> SelectionColor [ 3 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << SelectionColor  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetSelectionColor ( double _arg [ 4 ] ) { this -> GetSelectionColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ;
## Error: expected ';'!!!

proc SetLightingRenderPointsAsSpheresRenderLinesAsTubesNormalScaleEdgeVisibilityVertexVisibilitySelectionLineWidth*(
    this: var vtkProperty; _arg: cfloat) {.importcpp: "SetLightingRenderPointsAsSpheresRenderLinesAsTubesNormalScaleEdgeVisibilityVertexVisibilitySelectionLineWidth",
                                      header: "vtkProperty.h".}
## !!!Ignored construct:  virtual float GetLightingLightingRenderPointsAsSpheresRenderLinesAsTubesInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScaleNormalScaleOcclusionStrengthAmbientDiffuseSpecularSpecularPowerOpacityEdgeVisibilityEdgeVisibilityVertexVisibilityVertexVisibilitySelectionLineWidth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SelectionLineWidth  of  << this -> SelectionLineWidth ) ; return this -> SelectionLineWidth ; } ;
## Error: expected ';'!!!

proc SetLightingRenderPointsAsSpheresRenderLinesAsTubesNormalScaleEdgeVisibilityVertexVisibilitySelectionLineWidthSelectionPointSize*(
    this: var vtkProperty; _arg: cfloat) {.importcpp: "SetLightingRenderPointsAsSpheresRenderLinesAsTubesNormalScaleEdgeVisibilityVertexVisibilitySelectionLineWidthSelectionPointSize",
                                      header: "vtkProperty.h".}
## !!!Ignored construct:  virtual float GetLightingLightingRenderPointsAsSpheresRenderLinesAsTubesInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScaleNormalScaleOcclusionStrengthAmbientDiffuseSpecularSpecularPowerOpacityEdgeVisibilityEdgeVisibilityVertexVisibilityVertexVisibilitySelectionLineWidthSelectionPointSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SelectionPointSize  of  << this -> SelectionPointSize ) ; return this -> SelectionPointSize ; } ;
## Error: expected ';'!!!

proc SetInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScaleOcclusionStrengthAmbientDiffuseSpecularSpecularPowerOpacityLineWidth*(
    this: var vtkProperty; _arg: cfloat) {.importcpp: "SetInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScaleOcclusionStrengthAmbientDiffuseSpecularSpecularPowerOpacityLineWidth",
                                      header: "vtkProperty.h".}
proc GetInterpolationMinValueRepresentationMinValueBaseIORMinValueMetallicMinValueRoughnessMinValueAnisotropyMinValueAnisotropyRotationMinValueCoatIORMinValueCoatRoughnessMinValueCoatStrengthMinValueCoatNormalScaleMinValueOcclusionStrengthMinValueAmbientMinValueDiffuseMinValueSpecularMinValueSpecularPowerMinValueOpacityMinValueLineWidthMinValue*(
    this: var vtkProperty): cfloat {.importcpp: "GetInterpolationMinValueRepresentationMinValueBaseIORMinValueMetallicMinValueRoughnessMinValueAnisotropyMinValueAnisotropyRotationMinValueCoatIORMinValueCoatRoughnessMinValueCoatStrengthMinValueCoatNormalScaleMinValueOcclusionStrengthMinValueAmbientMinValueDiffuseMinValueSpecularMinValueSpecularPowerMinValueOpacityMinValueLineWidthMinValue",
                                 header: "vtkProperty.h".}
proc GetInterpolationMaxValueRepresentationMaxValueBaseIORMaxValueMetallicMaxValueRoughnessMaxValueAnisotropyMaxValueAnisotropyRotationMaxValueCoatIORMaxValueCoatRoughnessMaxValueCoatStrengthMaxValueCoatNormalScaleMaxValueOcclusionStrengthMaxValueAmbientMaxValueDiffuseMaxValueSpecularMaxValueSpecularPowerMaxValueOpacityMaxValueLineWidthMaxValue*(
    this: var vtkProperty): cfloat {.importcpp: "GetInterpolationMaxValueRepresentationMaxValueBaseIORMaxValueMetallicMaxValueRoughnessMaxValueAnisotropyMaxValueAnisotropyRotationMaxValueCoatIORMaxValueCoatRoughnessMaxValueCoatStrengthMaxValueCoatNormalScaleMaxValueOcclusionStrengthMaxValueAmbientMaxValueDiffuseMaxValueSpecularMaxValueSpecularPowerMaxValueOpacityMaxValueLineWidthMaxValue",
                                 header: "vtkProperty.h".}
## !!!Ignored construct:  virtual float GetLightingLightingRenderPointsAsSpheresRenderLinesAsTubesInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScaleNormalScaleOcclusionStrengthAmbientDiffuseSpecularSpecularPowerOpacityEdgeVisibilityEdgeVisibilityVertexVisibilityVertexVisibilitySelectionLineWidthSelectionPointSizeLineWidth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LineWidth  of  << this -> LineWidth ) ; return this -> LineWidth ; } ;
## Error: expected ';'!!!

proc SetLightingRenderPointsAsSpheresRenderLinesAsTubesNormalScaleEdgeVisibilityVertexVisibilitySelectionLineWidthSelectionPointSizeLineStipplePattern*(
    this: var vtkProperty; _arg: cint) {.importcpp: "SetLightingRenderPointsAsSpheresRenderLinesAsTubesNormalScaleEdgeVisibilityVertexVisibilitySelectionLineWidthSelectionPointSizeLineStipplePattern",
                                    header: "vtkProperty.h".}
## !!!Ignored construct:  virtual int GetLightingLightingRenderPointsAsSpheresRenderLinesAsTubesInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScaleNormalScaleOcclusionStrengthAmbientDiffuseSpecularSpecularPowerOpacityEdgeVisibilityEdgeVisibilityVertexVisibilityVertexVisibilitySelectionLineWidthSelectionPointSizeLineWidthLineStipplePattern ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LineStipplePattern  of  << this -> LineStipplePattern ) ; return this -> LineStipplePattern ; } ;
## Error: expected ';'!!!

proc SetInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScaleOcclusionStrengthAmbientDiffuseSpecularSpecularPowerOpacityLineWidthLineStippleRepeatFactor*(
    this: var vtkProperty; _arg: cint) {.importcpp: "SetInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScaleOcclusionStrengthAmbientDiffuseSpecularSpecularPowerOpacityLineWidthLineStippleRepeatFactor",
                                    header: "vtkProperty.h".}
proc GetInterpolationMinValueRepresentationMinValueBaseIORMinValueMetallicMinValueRoughnessMinValueAnisotropyMinValueAnisotropyRotationMinValueCoatIORMinValueCoatRoughnessMinValueCoatStrengthMinValueCoatNormalScaleMinValueOcclusionStrengthMinValueAmbientMinValueDiffuseMinValueSpecularMinValueSpecularPowerMinValueOpacityMinValueLineWidthMinValueLineStippleRepeatFactorMinValue*(
    this: var vtkProperty): cint {.importcpp: "GetInterpolationMinValueRepresentationMinValueBaseIORMinValueMetallicMinValueRoughnessMinValueAnisotropyMinValueAnisotropyRotationMinValueCoatIORMinValueCoatRoughnessMinValueCoatStrengthMinValueCoatNormalScaleMinValueOcclusionStrengthMinValueAmbientMinValueDiffuseMinValueSpecularMinValueSpecularPowerMinValueOpacityMinValueLineWidthMinValueLineStippleRepeatFactorMinValue",
                               header: "vtkProperty.h".}
proc GetInterpolationMaxValueRepresentationMaxValueBaseIORMaxValueMetallicMaxValueRoughnessMaxValueAnisotropyMaxValueAnisotropyRotationMaxValueCoatIORMaxValueCoatRoughnessMaxValueCoatStrengthMaxValueCoatNormalScaleMaxValueOcclusionStrengthMaxValueAmbientMaxValueDiffuseMaxValueSpecularMaxValueSpecularPowerMaxValueOpacityMaxValueLineWidthMaxValueLineStippleRepeatFactorMaxValue*(
    this: var vtkProperty): cint {.importcpp: "GetInterpolationMaxValueRepresentationMaxValueBaseIORMaxValueMetallicMaxValueRoughnessMaxValueAnisotropyMaxValueAnisotropyRotationMaxValueCoatIORMaxValueCoatRoughnessMaxValueCoatStrengthMaxValueCoatNormalScaleMaxValueOcclusionStrengthMaxValueAmbientMaxValueDiffuseMaxValueSpecularMaxValueSpecularPowerMaxValueOpacityMaxValueLineWidthMaxValueLineStippleRepeatFactorMaxValue",
                               header: "vtkProperty.h".}
## !!!Ignored construct:  virtual int GetLightingLightingRenderPointsAsSpheresRenderLinesAsTubesInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScaleNormalScaleOcclusionStrengthAmbientDiffuseSpecularSpecularPowerOpacityEdgeVisibilityEdgeVisibilityVertexVisibilityVertexVisibilitySelectionLineWidthSelectionPointSizeLineWidthLineStipplePatternLineStippleRepeatFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LineStippleRepeatFactor  of  << this -> LineStippleRepeatFactor ) ; return this -> LineStippleRepeatFactor ; } ;
## Error: expected ';'!!!

proc SetInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScaleOcclusionStrengthAmbientDiffuseSpecularSpecularPowerOpacityLineWidthLineStippleRepeatFactorPointSize*(
    this: var vtkProperty; _arg: cfloat) {.importcpp: "SetInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScaleOcclusionStrengthAmbientDiffuseSpecularSpecularPowerOpacityLineWidthLineStippleRepeatFactorPointSize",
                                      header: "vtkProperty.h".}
proc GetInterpolationMinValueRepresentationMinValueBaseIORMinValueMetallicMinValueRoughnessMinValueAnisotropyMinValueAnisotropyRotationMinValueCoatIORMinValueCoatRoughnessMinValueCoatStrengthMinValueCoatNormalScaleMinValueOcclusionStrengthMinValueAmbientMinValueDiffuseMinValueSpecularMinValueSpecularPowerMinValueOpacityMinValueLineWidthMinValueLineStippleRepeatFactorMinValuePointSizeMinValue*(
    this: var vtkProperty): cfloat {.importcpp: "GetInterpolationMinValueRepresentationMinValueBaseIORMinValueMetallicMinValueRoughnessMinValueAnisotropyMinValueAnisotropyRotationMinValueCoatIORMinValueCoatRoughnessMinValueCoatStrengthMinValueCoatNormalScaleMinValueOcclusionStrengthMinValueAmbientMinValueDiffuseMinValueSpecularMinValueSpecularPowerMinValueOpacityMinValueLineWidthMinValueLineStippleRepeatFactorMinValuePointSizeMinValue",
                                 header: "vtkProperty.h".}
proc GetInterpolationMaxValueRepresentationMaxValueBaseIORMaxValueMetallicMaxValueRoughnessMaxValueAnisotropyMaxValueAnisotropyRotationMaxValueCoatIORMaxValueCoatRoughnessMaxValueCoatStrengthMaxValueCoatNormalScaleMaxValueOcclusionStrengthMaxValueAmbientMaxValueDiffuseMaxValueSpecularMaxValueSpecularPowerMaxValueOpacityMaxValueLineWidthMaxValueLineStippleRepeatFactorMaxValuePointSizeMaxValue*(
    this: var vtkProperty): cfloat {.importcpp: "GetInterpolationMaxValueRepresentationMaxValueBaseIORMaxValueMetallicMaxValueRoughnessMaxValueAnisotropyMaxValueAnisotropyRotationMaxValueCoatIORMaxValueCoatRoughnessMaxValueCoatStrengthMaxValueCoatNormalScaleMaxValueOcclusionStrengthMaxValueAmbientMaxValueDiffuseMaxValueSpecularMaxValueSpecularPowerMaxValueOpacityMaxValueLineWidthMaxValueLineStippleRepeatFactorMaxValuePointSizeMaxValue",
                                 header: "vtkProperty.h".}
## !!!Ignored construct:  virtual float GetLightingLightingRenderPointsAsSpheresRenderLinesAsTubesInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScaleNormalScaleOcclusionStrengthAmbientDiffuseSpecularSpecularPowerOpacityEdgeVisibilityEdgeVisibilityVertexVisibilityVertexVisibilitySelectionLineWidthSelectionPointSizeLineWidthLineStipplePatternLineStippleRepeatFactorPointSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PointSize  of  << this -> PointSize ) ; return this -> PointSize ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Turn on/off fast culling of polygons based on orientation of normal
##  with respect to camera. If backface culling is on, polygons facing
##  away from camera are not drawn.
##  virtual vtkTypeBool GetLightingLightingRenderPointsAsSpheresRenderLinesAsTubesInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScaleNormalScaleOcclusionStrengthAmbientDiffuseSpecularSpecularPowerOpacityEdgeVisibilityEdgeVisibilityVertexVisibilityVertexVisibilitySelectionLineWidthSelectionPointSizeLineWidthLineStipplePatternLineStippleRepeatFactorPointSizeBackfaceCullingBackfaceCulling ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BackfaceCulling  of  << this -> BackfaceCulling ) ; return this -> BackfaceCulling ; } ;
## Error: expected ';'!!!

proc SetLightingRenderPointsAsSpheresRenderLinesAsTubesNormalScaleEdgeVisibilityVertexVisibilitySelectionLineWidthSelectionPointSizeLineStipplePatternBackfaceCulling*(
    this: var vtkProperty; _arg: vtkTypeBool) {.importcpp: "SetLightingRenderPointsAsSpheresRenderLinesAsTubesNormalScaleEdgeVisibilityVertexVisibilitySelectionLineWidthSelectionPointSizeLineStipplePatternBackfaceCulling",
    header: "vtkProperty.h".}
proc BackfaceCullingOn*(this: var vtkProperty) {.importcpp: "BackfaceCullingOn",
    header: "vtkProperty.h".}
proc BackfaceCullingOff*(this: var vtkProperty) {.importcpp: "BackfaceCullingOff",
    header: "vtkProperty.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off fast culling of polygons based on orientation of normal
  ##  with respect to camera. If frontface culling is on, polygons facing
  ##  towards camera are not drawn.
  ##
## !!!Ignored construct:  virtual vtkTypeBool GetLightingLightingRenderPointsAsSpheresRenderLinesAsTubesInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScaleNormalScaleOcclusionStrengthAmbientDiffuseSpecularSpecularPowerOpacityEdgeVisibilityEdgeVisibilityVertexVisibilityVertexVisibilitySelectionLineWidthSelectionPointSizeLineWidthLineStipplePatternLineStippleRepeatFactorPointSizeBackfaceCullingBackfaceCullingFrontfaceCulling ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FrontfaceCulling  of  << this -> FrontfaceCulling ) ; return this -> FrontfaceCulling ; } ;
## Error: expected ';'!!!

proc SetLightingRenderPointsAsSpheresRenderLinesAsTubesNormalScaleEdgeVisibilityVertexVisibilitySelectionLineWidthSelectionPointSizeLineStipplePatternBackfaceCullingFrontfaceCulling*(
    this: var vtkProperty; _arg: vtkTypeBool) {.importcpp: "SetLightingRenderPointsAsSpheresRenderLinesAsTubesNormalScaleEdgeVisibilityVertexVisibilitySelectionLineWidthSelectionPointSizeLineStipplePatternBackfaceCullingFrontfaceCulling",
    header: "vtkProperty.h".}
proc FrontfaceCullingOn*(this: var vtkProperty) {.importcpp: "FrontfaceCullingOn",
    header: "vtkProperty.h".}
proc FrontfaceCullingOff*(this: var vtkProperty) {.importcpp: "FrontfaceCullingOff",
    header: "vtkProperty.h".}
  ## /@}
  ## /@{
  ## *
  ##  Returns the name of the material currently loaded, if any.
  ##
proc SetMaterialName*(this: var vtkProperty; _arg: cstring) {.
    importcpp: "SetMaterialName", header: "vtkProperty.h".}
proc GetMaterialName*(this: var vtkProperty): cstring {.importcpp: "GetMaterialName",
    header: "vtkProperty.h".}
  ## /@}
  ## /@{
  ## *
  ##  Enable/Disable shading. When shading is enabled, the
  ##  Material must be set.
  ##
proc SetLightingRenderPointsAsSpheresRenderLinesAsTubesNormalScaleEdgeVisibilityVertexVisibilitySelectionLineWidthSelectionPointSizeLineStipplePatternBackfaceCullingFrontfaceCullingShading*(
    this: var vtkProperty; _arg: vtkTypeBool) {.importcpp: "SetLightingRenderPointsAsSpheresRenderLinesAsTubesNormalScaleEdgeVisibilityVertexVisibilitySelectionLineWidthSelectionPointSizeLineStipplePatternBackfaceCullingFrontfaceCullingShading",
    header: "vtkProperty.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetLightingLightingRenderPointsAsSpheresRenderLinesAsTubesInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScaleNormalScaleOcclusionStrengthAmbientDiffuseSpecularSpecularPowerOpacityEdgeVisibilityEdgeVisibilityVertexVisibilityVertexVisibilitySelectionLineWidthSelectionPointSizeLineWidthLineStipplePatternLineStippleRepeatFactorPointSizeBackfaceCullingBackfaceCullingFrontfaceCullingShading ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Shading  of  << this -> Shading ) ; return this -> Shading ; } ;
## Error: expected ';'!!!

proc ShadingOn*(this: var vtkProperty) {.importcpp: "ShadingOn",
                                     header: "vtkProperty.h".}
proc ShadingOff*(this: var vtkProperty) {.importcpp: "ShadingOff",
                                      header: "vtkProperty.h".}
  ## /@}
  ## /@{
  ## *
  ##  Provide values to initialize shader variables.
  ##  Useful to initialize shader variables that change over time
  ##  (animation, GUI widgets inputs, etc. )
  ##  - \p name - hardware name of the uniform variable
  ##  - \p numVars - number of variables being set
  ##  - \p x - values
  ##
proc AddShaderVariable*(this: var vtkProperty; name: cstring; numVars: cint; x: ptr cint) {.
    importcpp: "AddShaderVariable", header: "vtkProperty.h".}
proc AddShaderVariable*(this: var vtkProperty; name: cstring; numVars: cint;
                       x: ptr cfloat) {.importcpp: "AddShaderVariable",
                                     header: "vtkProperty.h".}
proc AddShaderVariable*(this: var vtkProperty; name: cstring; numVars: cint;
                       x: ptr cdouble) {.importcpp: "AddShaderVariable",
                                      header: "vtkProperty.h".}
proc AddShaderVariable*(this: var vtkProperty; name: cstring; v: cint) {.
    importcpp: "AddShaderVariable", header: "vtkProperty.h".}
proc AddShaderVariable*(this: var vtkProperty; name: cstring; v: cfloat) {.
    importcpp: "AddShaderVariable", header: "vtkProperty.h".}
proc AddShaderVariable*(this: var vtkProperty; name: cstring; v: cdouble) {.
    importcpp: "AddShaderVariable", header: "vtkProperty.h".}
proc AddShaderVariable*(this: var vtkProperty; name: cstring; v1: cint; v2: cint) {.
    importcpp: "AddShaderVariable", header: "vtkProperty.h".}
proc AddShaderVariable*(this: var vtkProperty; name: cstring; v1: cfloat; v2: cfloat) {.
    importcpp: "AddShaderVariable", header: "vtkProperty.h".}
proc AddShaderVariable*(this: var vtkProperty; name: cstring; v1: cdouble; v2: cdouble) {.
    importcpp: "AddShaderVariable", header: "vtkProperty.h".}
proc AddShaderVariable*(this: var vtkProperty; name: cstring; v1: cint; v2: cint; v3: cint) {.
    importcpp: "AddShaderVariable", header: "vtkProperty.h".}
proc AddShaderVariable*(this: var vtkProperty; name: cstring; v1: cfloat; v2: cfloat;
                       v3: cfloat) {.importcpp: "AddShaderVariable",
                                   header: "vtkProperty.h".}
proc AddShaderVariable*(this: var vtkProperty; name: cstring; v1: cdouble; v2: cdouble;
                       v3: cdouble) {.importcpp: "AddShaderVariable",
                                    header: "vtkProperty.h".}
proc SetLightingRenderPointsAsSpheresRenderLinesAsTubesNormalScaleEdgeVisibilityVertexVisibilitySelectionLineWidthSelectionPointSizeLineStipplePatternBackfaceCullingFrontfaceCullingShadingShowTexturesOnBackface*(
    this: var vtkProperty; _arg: bool) {.importcpp: "SetLightingRenderPointsAsSpheresRenderLinesAsTubesNormalScaleEdgeVisibilityVertexVisibilitySelectionLineWidthSelectionPointSizeLineStipplePatternBackfaceCullingFrontfaceCullingShadingShowTexturesOnBackface",
                                    header: "vtkProperty.h".}
## !!!Ignored construct:  virtual bool GetLightingLightingRenderPointsAsSpheresRenderLinesAsTubesInterpolationRepresentationBaseIORMetallicRoughnessAnisotropyAnisotropyRotationCoatIORCoatRoughnessCoatStrengthCoatNormalScaleNormalScaleOcclusionStrengthAmbientDiffuseSpecularSpecularPowerOpacityEdgeVisibilityEdgeVisibilityVertexVisibilityVertexVisibilitySelectionLineWidthSelectionPointSizeLineWidthLineStipplePatternLineStippleRepeatFactorPointSizeBackfaceCullingBackfaceCullingFrontfaceCullingShadingShowTexturesOnBackface ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ShowTexturesOnBackface  of  << this -> ShowTexturesOnBackface ) ; return this -> ShowTexturesOnBackface ; } ;
## Error: expected ';'!!!

proc ShowTexturesOnBackfaceOn*(this: var vtkProperty) {.
    importcpp: "ShowTexturesOnBackfaceOn", header: "vtkProperty.h".}
proc ShowTexturesOnBackfaceOff*(this: var vtkProperty) {.
    importcpp: "ShowTexturesOnBackfaceOff", header: "vtkProperty.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the texture object to control rendering texture maps. This will
  ##  be a vtkTexture object. A property does not need to have an associated
  ##  texture map and multiple properties can share one texture. Textures
  ##  must be assigned unique names. Note that for texture blending the
  ##  textures will be rendering is alphabetical order and after any texture
  ##  defined in the actor.
  ##  There exists 6 special textures with reserved names: "albedoTex", "materialTex", "normalTex",
  ##  "emissiveTex", "anisotropyTex" and "coatNormalTex". While these textures can be added with the
  ##  regular SetTexture method, it is preferred to use the methods SetBaseColorTexture,
  ##  SetORMTexture, SetNormalTexture, SetEmissiveTexture, SetAnisotropyTexture and SetCoatNormalTex
  ##  respectively.
  ##
proc SetTexture*(this: var vtkProperty; name: cstring; texture: ptr vtkTexture) {.
    importcpp: "SetTexture", header: "vtkProperty.h".}
proc GetTexture*(this: var vtkProperty; name: cstring): ptr vtkTexture {.
    importcpp: "GetTexture", header: "vtkProperty.h".}
proc SetBaseColorTexture*(this: var vtkProperty; texture: ptr vtkTexture) {.
    importcpp: "SetBaseColorTexture", header: "vtkProperty.h".}
proc SetORMTexture*(this: var vtkProperty; texture: ptr vtkTexture) {.
    importcpp: "SetORMTexture", header: "vtkProperty.h".}
proc SetAnisotropyTexture*(this: var vtkProperty; texture: ptr vtkTexture) {.
    importcpp: "SetAnisotropyTexture", header: "vtkProperty.h".}
proc SetNormalTexture*(this: var vtkProperty; texture: ptr vtkTexture) {.
    importcpp: "SetNormalTexture", header: "vtkProperty.h".}
proc SetEmissiveTexture*(this: var vtkProperty; texture: ptr vtkTexture) {.
    importcpp: "SetEmissiveTexture", header: "vtkProperty.h".}
proc SetCoatNormalTexture*(this: var vtkProperty; texture: ptr vtkTexture) {.
    importcpp: "SetCoatNormalTexture", header: "vtkProperty.h".}
proc RemoveTexture*(this: var vtkProperty; name: cstring) {.
    importcpp: "RemoveTexture", header: "vtkProperty.h".}
proc RemoveAllTextures*(this: var vtkProperty) {.importcpp: "RemoveAllTextures",
    header: "vtkProperty.h".}
proc GetNumberOfTextures*(this: var vtkProperty): cint {.
    importcpp: "GetNumberOfTextures", header: "vtkProperty.h".}
proc GetAllTextures*(this: var vtkProperty): var map[string, ptr vtkTexture] {.
    importcpp: "GetAllTextures", header: "vtkProperty.h".}
proc ReleaseGraphicsResources*(this: var vtkProperty; win: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkProperty.h".}
proc GetnameInformation*(this: var vtkProperty): ptr vtkInformation {.
    importcpp: "GetnameInformation", header: "vtkProperty.h".}
proc SetInformation*(this: var vtkProperty; a2: ptr vtkInformation) {.
    importcpp: "SetInformation", header: "vtkProperty.h".}
proc ComputeReflectanceFromIOR*(IORTo: cdouble; IORFrom: cdouble): cdouble {.
    importcpp: "vtkProperty::ComputeReflectanceFromIOR(@)",
    header: "vtkProperty.h".}
proc ComputeIORFromReflectance*(reflectance: cdouble; ior: cdouble): cdouble {.
    importcpp: "vtkProperty::ComputeIORFromReflectance(@)",
    header: "vtkProperty.h".}
proc ComputeReflectanceOfBaseLayer*(this: var vtkProperty): cdouble {.
    importcpp: "ComputeReflectanceOfBaseLayer", header: "vtkProperty.h".}
## *
##  Return the method of shading as a descriptive character string.
##

proc GetInterpolationAsString*(this: var vtkProperty): cstring {.
    importcpp: "GetInterpolationAsString", header: "vtkProperty.h".}
## *
##  Return the method of shading as a descriptive character string.
##

proc GetRepresentationAsString*(this: var vtkProperty): cstring {.
    importcpp: "GetRepresentationAsString", header: "vtkProperty.h".}