## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkVolumeProperty.h
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
##  @class   vtkVolumeProperty
##  @brief   represents the common properties for rendering a volume.
##
##  vtkVolumeProperty is used to represent common properties associated
##  with volume rendering. This includes properties for determining the type
##  of interpolation to use when sampling a volume, the color of a volume,
##  the scalar opacity of a volume, the gradient opacity of a volume, and the
##  shading parameters of a volume.
##
##  Color, scalar opacity and gradient magnitude opacity transfer functions
##  can be set as either 3 separate 1D functions or as a single 2D transfer
##  function.
##
##  - 1D Transfer functions (vtkVolumeProperty::TF_1D)
##  Color, scalar opacity and gradient magnitude opacity are defined by 1
##  vtkColorTransferFunction and 2 vtkPiecewiseFunctions respectively.
##  When the scalar opacity or the gradient opacity of a volume is not set,
##  then the function is defined to be a constant value of 1.0. When a
##  scalar and gradient opacity are both set simultaneously, then the opacity
##  is defined to be the product of the scalar opacity and gradient opacity
##  transfer functions. 1D transfer functions is the legacy and default behavior.
##
##  - 2D Transfer functions (vtkVolumeProperty::TF_2D)
##  Color and scalar/gradient magnitude opacity are defined by a 4-component
##  vtkImageData instance mapping scalar value vs. gradient magnitude on its
##  x and y axis respectively. This mode is only available if a 2D TF has been
##  explicitly set (see SetTransferFunction2D).
##
##  Most properties can be set per "component" for volume mappers that
##  support multiple independent components. If you are using 2 component
##  data as LV or 4 component data as RGBV (as specified in the mapper)
##  only the first scalar opacity and gradient opacity transfer functions
##  will be used (and all color functions will be ignored). Omitting the
##  index parameter on the Set/Get methods will access index = 0.
##
##  @sa vtkPiecewiseFunction vtkColorTransferFunction
##

import
  vtkImplicitFunction, vtkNew, vtkObject, vtkRenderingCoreModule, vtkSmartPointer

##  STL includes

discard "forward decl of vtkColorTransferFunction"
discard "forward decl of vtkContourValues"
discard "forward decl of vtkImageData"
discard "forward decl of vtkPiecewiseFunction"
discard "forward decl of vtkTimeStamp"
type
  vtkVolumeProperty* {.importcpp: "vtkVolumeProperty",
                      header: "vtkVolumeProperty.h", bycopy.} = object of vtkObject
    vtkVolumeProperty* {.importc: "vtkVolumeProperty".}: VTK_NEWINSTANCE
    ## *
    ##  Contour values for isosurface blend mode
    ##
    ## *
    ##  Function used for slice
    ##
    ## *
    ##  Label map transfer functions
    ##


proc New*(): ptr vtkVolumeProperty {.importcpp: "vtkVolumeProperty::New(@)",
                                 header: "vtkVolumeProperty.h".}
type
  vtkVolumePropertySuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkVolumeProperty::IsTypeOf(@)", header: "vtkVolumeProperty.h".}
proc IsA*(this: var vtkVolumeProperty; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkVolumeProperty.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkVolumeProperty {.
    importcpp: "vtkVolumeProperty::SafeDownCast(@)", header: "vtkVolumeProperty.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkVolumeProperty :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkVolumeProperty :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkVolumeProperty :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkVolumeProperty; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkVolumeProperty.h".}
proc DeepCopy*(this: var vtkVolumeProperty; p: ptr vtkVolumeProperty) {.
    importcpp: "DeepCopy", header: "vtkVolumeProperty.h".}
proc GetMTime*(this: var vtkVolumeProperty): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkVolumeProperty.h".}
proc SetIndependentComponents*(this: var vtkVolumeProperty; _arg: vtkTypeBool) {.
    importcpp: "SetIndependentComponents", header: "vtkVolumeProperty.h".}
proc GetIndependentComponentsMinValue*(this: var vtkVolumeProperty): vtkTypeBool {.
    importcpp: "GetIndependentComponentsMinValue", header: "vtkVolumeProperty.h".}
proc GetIndependentComponentsMaxValue*(this: var vtkVolumeProperty): vtkTypeBool {.
    importcpp: "GetIndependentComponentsMaxValue", header: "vtkVolumeProperty.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetIndependentComponents ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IndependentComponents  of  << this -> IndependentComponents ) ; return this -> IndependentComponents ; } ;
## Error: expected ';'!!!

proc IndependentComponentsOn*(this: var vtkVolumeProperty) {.
    importcpp: "IndependentComponentsOn", header: "vtkVolumeProperty.h".}
proc IndependentComponentsOff*(this: var vtkVolumeProperty) {.
    importcpp: "IndependentComponentsOff", header: "vtkVolumeProperty.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the interpolation type for sampling a volume. Initial value is
  ##  VTK_NEAREST_INTERPOLATION.
  ##
proc SetIndependentComponentsInterpolationType*(this: var vtkVolumeProperty;
    _arg: cint) {.importcpp: "SetIndependentComponentsInterpolationType",
                header: "vtkVolumeProperty.h".}
proc GetIndependentComponentsMinValueInterpolationTypeMinValue*(
    this: var vtkVolumeProperty): cint {.importcpp: "GetIndependentComponentsMinValueInterpolationTypeMinValue",
                                     header: "vtkVolumeProperty.h".}
proc GetIndependentComponentsMaxValueInterpolationTypeMaxValue*(
    this: var vtkVolumeProperty): cint {.importcpp: "GetIndependentComponentsMaxValueInterpolationTypeMaxValue",
                                     header: "vtkVolumeProperty.h".}
## !!!Ignored construct:  virtual int GetIndependentComponentsInterpolationType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InterpolationType  of  << this -> InterpolationType ) ; return this -> InterpolationType ; } ;
## Error: expected ';'!!!

proc SetInterpolationTypeToNearest*(this: var vtkVolumeProperty) {.
    importcpp: "SetInterpolationTypeToNearest", header: "vtkVolumeProperty.h".}
proc SetInterpolationTypeToLinear*(this: var vtkVolumeProperty) {.
    importcpp: "SetInterpolationTypeToLinear", header: "vtkVolumeProperty.h".}
proc GetInterpolationTypeAsString*(this: var vtkVolumeProperty): cstring {.
    importcpp: "GetInterpolationTypeAsString", header: "vtkVolumeProperty.h".}
proc SetComponentWeight*(this: var vtkVolumeProperty; index: cint; value: cdouble) {.
    importcpp: "SetComponentWeight", header: "vtkVolumeProperty.h".}
proc GetComponentWeight*(this: var vtkVolumeProperty; index: cint): cdouble {.
    importcpp: "GetComponentWeight", header: "vtkVolumeProperty.h".}
proc SetColor*(this: var vtkVolumeProperty; index: cint;
              function: ptr vtkPiecewiseFunction) {.importcpp: "SetColor",
    header: "vtkVolumeProperty.h".}
proc SetColor*(this: var vtkVolumeProperty; function: ptr vtkPiecewiseFunction) {.
    importcpp: "SetColor", header: "vtkVolumeProperty.h".}
proc SetColor*(this: var vtkVolumeProperty; index: cint;
              function: ptr vtkColorTransferFunction) {.importcpp: "SetColor",
    header: "vtkVolumeProperty.h".}
proc SetColor*(this: var vtkVolumeProperty; function: ptr vtkColorTransferFunction) {.
    importcpp: "SetColor", header: "vtkVolumeProperty.h".}
proc GetColorChannels*(this: var vtkVolumeProperty; index: cint): cint {.
    importcpp: "GetColorChannels", header: "vtkVolumeProperty.h".}
proc GetColorChannels*(this: var vtkVolumeProperty): cint {.
    importcpp: "GetColorChannels", header: "vtkVolumeProperty.h".}
proc GetGrayTransferFunction*(this: var vtkVolumeProperty; index: cint): ptr vtkPiecewiseFunction {.
    importcpp: "GetGrayTransferFunction", header: "vtkVolumeProperty.h".}
proc GetGrayTransferFunction*(this: var vtkVolumeProperty): ptr vtkPiecewiseFunction {.
    importcpp: "GetGrayTransferFunction", header: "vtkVolumeProperty.h".}
proc GetRGBTransferFunction*(this: var vtkVolumeProperty; index: cint): ptr vtkColorTransferFunction {.
    importcpp: "GetRGBTransferFunction", header: "vtkVolumeProperty.h".}
proc GetRGBTransferFunction*(this: var vtkVolumeProperty): ptr vtkColorTransferFunction {.
    importcpp: "GetRGBTransferFunction", header: "vtkVolumeProperty.h".}
proc SetScalarOpacity*(this: var vtkVolumeProperty; index: cint;
                      function: ptr vtkPiecewiseFunction) {.
    importcpp: "SetScalarOpacity", header: "vtkVolumeProperty.h".}
proc SetScalarOpacity*(this: var vtkVolumeProperty;
                      function: ptr vtkPiecewiseFunction) {.
    importcpp: "SetScalarOpacity", header: "vtkVolumeProperty.h".}
proc GetScalarOpacity*(this: var vtkVolumeProperty; index: cint): ptr vtkPiecewiseFunction {.
    importcpp: "GetScalarOpacity", header: "vtkVolumeProperty.h".}
proc GetScalarOpacity*(this: var vtkVolumeProperty): ptr vtkPiecewiseFunction {.
    importcpp: "GetScalarOpacity", header: "vtkVolumeProperty.h".}
proc SetScalarOpacityUnitDistance*(this: var vtkVolumeProperty; index: cint;
                                  distance: cdouble) {.
    importcpp: "SetScalarOpacityUnitDistance", header: "vtkVolumeProperty.h".}
proc SetScalarOpacityUnitDistance*(this: var vtkVolumeProperty; distance: cdouble) {.
    importcpp: "SetScalarOpacityUnitDistance", header: "vtkVolumeProperty.h".}
proc GetScalarOpacityUnitDistance*(this: var vtkVolumeProperty; index: cint): cdouble {.
    importcpp: "GetScalarOpacityUnitDistance", header: "vtkVolumeProperty.h".}
proc GetScalarOpacityUnitDistance*(this: var vtkVolumeProperty): cdouble {.
    importcpp: "GetScalarOpacityUnitDistance", header: "vtkVolumeProperty.h".}
proc SetGradientOpacity*(this: var vtkVolumeProperty; index: cint;
                        function: ptr vtkPiecewiseFunction) {.
    importcpp: "SetGradientOpacity", header: "vtkVolumeProperty.h".}
proc SetGradientOpacity*(this: var vtkVolumeProperty;
                        function: ptr vtkPiecewiseFunction) {.
    importcpp: "SetGradientOpacity", header: "vtkVolumeProperty.h".}
proc SetTransferFunction2D*(this: var vtkVolumeProperty; index: cint;
                           function: ptr vtkImageData) {.
    importcpp: "SetTransferFunction2D", header: "vtkVolumeProperty.h".}
proc SetTransferFunction2D*(this: var vtkVolumeProperty; function: ptr vtkImageData) {.
    importcpp: "SetTransferFunction2D", header: "vtkVolumeProperty.h".}
proc GetTransferFunction2D*(this: var vtkVolumeProperty; index: cint): ptr vtkImageData {.
    importcpp: "GetTransferFunction2D", header: "vtkVolumeProperty.h".}
proc GetTransferFunction2D*(this: var vtkVolumeProperty): ptr vtkImageData {.
    importcpp: "GetTransferFunction2D", header: "vtkVolumeProperty.h".}
  ## *
  ##  Color-opacity transfer function mode. TF_1D is its default value.
  ##   - TF_1D Mappers will use 3 separate 1D functions for color, scalar opacity
  ##   and gradient mag. opacity.
  ##   - TF_2D Mappers will use a single 2D function for color and scalar/gradient mag.
  ##   opacity.
  ##
type
  vtkVolumePropertyTransferMode* {.size: sizeof(cint),
                                  importcpp: "vtkVolumeProperty::TransferMode",
                                  header: "vtkVolumeProperty.h".} = enum
    TF_1D = 0, TF_2D


proc SetIndependentComponentsInterpolationTypeTransferFunctionMode*(
    this: var vtkVolumeProperty; _arg: cint) {.
    importcpp: "SetIndependentComponentsInterpolationTypeTransferFunctionMode",
    header: "vtkVolumeProperty.h".}
proc GetIndependentComponentsMinValueInterpolationTypeMinValueTransferFunctionModeMinValue*(
    this: var vtkVolumeProperty): cint {.importcpp: "GetIndependentComponentsMinValueInterpolationTypeMinValueTransferFunctionModeMinValue",
                                     header: "vtkVolumeProperty.h".}
proc GetIndependentComponentsMaxValueInterpolationTypeMaxValueTransferFunctionModeMaxValue*(
    this: var vtkVolumeProperty): cint {.importcpp: "GetIndependentComponentsMaxValueInterpolationTypeMaxValueTransferFunctionModeMaxValue",
                                     header: "vtkVolumeProperty.h".}
## !!!Ignored construct:  virtual int GetIndependentComponentsInterpolationTypeTransferFunctionMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TransferFunctionMode  of  << this -> TransferFunctionMode ) ; return this -> TransferFunctionMode ; } ;
## Error: expected ';'!!!

proc SetTransferFunctionModeTo1D*(this: var vtkVolumeProperty) {.
    importcpp: "SetTransferFunctionModeTo1D", header: "vtkVolumeProperty.h".}
proc SetTransferFunctionModeTo2D*(this: var vtkVolumeProperty) {.
    importcpp: "SetTransferFunctionModeTo2D", header: "vtkVolumeProperty.h".}
proc GetGradientOpacity*(this: var vtkVolumeProperty; index: cint): ptr vtkPiecewiseFunction {.
    importcpp: "GetGradientOpacity", header: "vtkVolumeProperty.h".}
proc GetGradientOpacity*(this: var vtkVolumeProperty): ptr vtkPiecewiseFunction {.
    importcpp: "GetGradientOpacity", header: "vtkVolumeProperty.h".}
proc SetDisableGradientOpacity*(this: var vtkVolumeProperty; index: cint; value: cint) {.
    importcpp: "SetDisableGradientOpacity", header: "vtkVolumeProperty.h".}
proc SetDisableGradientOpacity*(this: var vtkVolumeProperty; value: cint) {.
    importcpp: "SetDisableGradientOpacity", header: "vtkVolumeProperty.h".}
proc DisableGradientOpacityOn*(this: var vtkVolumeProperty; index: cint) {.
    importcpp: "DisableGradientOpacityOn", header: "vtkVolumeProperty.h".}
proc DisableGradientOpacityOn*(this: var vtkVolumeProperty) {.
    importcpp: "DisableGradientOpacityOn", header: "vtkVolumeProperty.h".}
proc DisableGradientOpacityOff*(this: var vtkVolumeProperty; index: cint) {.
    importcpp: "DisableGradientOpacityOff", header: "vtkVolumeProperty.h".}
proc DisableGradientOpacityOff*(this: var vtkVolumeProperty) {.
    importcpp: "DisableGradientOpacityOff", header: "vtkVolumeProperty.h".}
proc GetDisableGradientOpacity*(this: var vtkVolumeProperty; index: cint): cint {.
    importcpp: "GetDisableGradientOpacity", header: "vtkVolumeProperty.h".}
proc GetDisableGradientOpacity*(this: var vtkVolumeProperty): cint {.
    importcpp: "GetDisableGradientOpacity", header: "vtkVolumeProperty.h".}
proc GetStoredGradientOpacity*(this: var vtkVolumeProperty; index: cint): ptr vtkPiecewiseFunction {.
    importcpp: "GetStoredGradientOpacity", header: "vtkVolumeProperty.h".}
proc GetStoredGradientOpacity*(this: var vtkVolumeProperty): ptr vtkPiecewiseFunction {.
    importcpp: "GetStoredGradientOpacity", header: "vtkVolumeProperty.h".}
proc HasGradientOpacity*(this: var vtkVolumeProperty; index: cint = 0): bool {.
    importcpp: "HasGradientOpacity", header: "vtkVolumeProperty.h".}
proc HasLabelGradientOpacity*(this: var vtkVolumeProperty): bool {.
    importcpp: "HasLabelGradientOpacity", header: "vtkVolumeProperty.h".}
proc SetShade*(this: var vtkVolumeProperty; index: cint; value: cint) {.
    importcpp: "SetShade", header: "vtkVolumeProperty.h".}
proc SetShade*(this: var vtkVolumeProperty; value: cint) {.importcpp: "SetShade",
    header: "vtkVolumeProperty.h".}
proc GetShade*(this: var vtkVolumeProperty; index: cint): cint {.importcpp: "GetShade",
    header: "vtkVolumeProperty.h".}
proc GetShade*(this: var vtkVolumeProperty): cint {.importcpp: "GetShade",
    header: "vtkVolumeProperty.h".}
proc ShadeOn*(this: var vtkVolumeProperty; index: cint) {.importcpp: "ShadeOn",
    header: "vtkVolumeProperty.h".}
proc ShadeOn*(this: var vtkVolumeProperty) {.importcpp: "ShadeOn",
    header: "vtkVolumeProperty.h".}
proc ShadeOff*(this: var vtkVolumeProperty; index: cint) {.importcpp: "ShadeOff",
    header: "vtkVolumeProperty.h".}
proc ShadeOff*(this: var vtkVolumeProperty) {.importcpp: "ShadeOff",
    header: "vtkVolumeProperty.h".}
proc SetAmbient*(this: var vtkVolumeProperty; index: cint; value: cdouble) {.
    importcpp: "SetAmbient", header: "vtkVolumeProperty.h".}
proc SetAmbient*(this: var vtkVolumeProperty; value: cdouble) {.
    importcpp: "SetAmbient", header: "vtkVolumeProperty.h".}
proc GetAmbient*(this: var vtkVolumeProperty; index: cint): cdouble {.
    importcpp: "GetAmbient", header: "vtkVolumeProperty.h".}
proc GetAmbient*(this: var vtkVolumeProperty): cdouble {.importcpp: "GetAmbient",
    header: "vtkVolumeProperty.h".}
proc SetDiffuse*(this: var vtkVolumeProperty; index: cint; value: cdouble) {.
    importcpp: "SetDiffuse", header: "vtkVolumeProperty.h".}
proc SetDiffuse*(this: var vtkVolumeProperty; value: cdouble) {.
    importcpp: "SetDiffuse", header: "vtkVolumeProperty.h".}
proc GetDiffuse*(this: var vtkVolumeProperty; index: cint): cdouble {.
    importcpp: "GetDiffuse", header: "vtkVolumeProperty.h".}
proc GetDiffuse*(this: var vtkVolumeProperty): cdouble {.importcpp: "GetDiffuse",
    header: "vtkVolumeProperty.h".}
proc SetSpecular*(this: var vtkVolumeProperty; index: cint; value: cdouble) {.
    importcpp: "SetSpecular", header: "vtkVolumeProperty.h".}
proc SetSpecular*(this: var vtkVolumeProperty; value: cdouble) {.
    importcpp: "SetSpecular", header: "vtkVolumeProperty.h".}
proc GetSpecular*(this: var vtkVolumeProperty; index: cint): cdouble {.
    importcpp: "GetSpecular", header: "vtkVolumeProperty.h".}
proc GetSpecular*(this: var vtkVolumeProperty): cdouble {.importcpp: "GetSpecular",
    header: "vtkVolumeProperty.h".}
proc SetSpecularPower*(this: var vtkVolumeProperty; index: cint; value: cdouble) {.
    importcpp: "SetSpecularPower", header: "vtkVolumeProperty.h".}
proc SetSpecularPower*(this: var vtkVolumeProperty; value: cdouble) {.
    importcpp: "SetSpecularPower", header: "vtkVolumeProperty.h".}
proc GetSpecularPower*(this: var vtkVolumeProperty; index: cint): cdouble {.
    importcpp: "GetSpecularPower", header: "vtkVolumeProperty.h".}
proc GetSpecularPower*(this: var vtkVolumeProperty): cdouble {.
    importcpp: "GetSpecularPower", header: "vtkVolumeProperty.h".}
proc GetIsoSurfaceValues*(this: var vtkVolumeProperty): ptr vtkContourValues {.
    importcpp: "GetIsoSurfaceValues", header: "vtkVolumeProperty.h".}
proc SetSliceFunction*(this: var vtkVolumeProperty; _arg: ptr vtkImplicitFunction) {.
    importcpp: "SetSliceFunction", header: "vtkVolumeProperty.h".}
proc Getname*(this: var vtkVolumeProperty): ptr vtkImplicitFunction {.
    importcpp: "Getname", header: "vtkVolumeProperty.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get/Set the volume's scattering anisotropy.
  ##  The model used is Henyey-Greenstein. The value should
  ##  be between -1.0 (back-scattering) and 1.0 (forward-scattering),
  ##  so the default value of 0.0 corresponds to an isotropic
  ##  volume. For now, it is only used in vtkGPUVolumeRayCastMapper.
  ##
proc SetIndependentComponentsInterpolationTypeTransferFunctionModeScatteringAnisotropy*(
    this: var vtkVolumeProperty; _arg: cfloat) {.importcpp: "SetIndependentComponentsInterpolationTypeTransferFunctionModeScatteringAnisotropy",
    header: "vtkVolumeProperty.h".}
proc GetIndependentComponentsMinValueInterpolationTypeMinValueTransferFunctionModeMinValueScatteringAnisotropyMinValue*(
    this: var vtkVolumeProperty): cfloat {.importcpp: "GetIndependentComponentsMinValueInterpolationTypeMinValueTransferFunctionModeMinValueScatteringAnisotropyMinValue",
                                       header: "vtkVolumeProperty.h".}
proc GetIndependentComponentsMaxValueInterpolationTypeMaxValueTransferFunctionModeMaxValueScatteringAnisotropyMaxValue*(
    this: var vtkVolumeProperty): cfloat {.importcpp: "GetIndependentComponentsMaxValueInterpolationTypeMaxValueTransferFunctionModeMaxValueScatteringAnisotropyMaxValue",
                                       header: "vtkVolumeProperty.h".}
## !!!Ignored construct:  virtual float GetIndependentComponentsInterpolationTypeTransferFunctionModeScatteringAnisotropy ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScatteringAnisotropy  of  << this -> ScatteringAnisotropy ) ; return this -> ScatteringAnisotropy ; } ;
## Error: expected ';'!!!

proc UpdateMTimes*(this: var vtkVolumeProperty) {.importcpp: "UpdateMTimes",
    header: "vtkVolumeProperty.h".}
proc GetGradientOpacityMTime*(this: var vtkVolumeProperty; index: cint): vtkTimeStamp {.
    importcpp: "GetGradientOpacityMTime", header: "vtkVolumeProperty.h".}
proc GetGradientOpacityMTime*(this: var vtkVolumeProperty): vtkTimeStamp {.
    importcpp: "GetGradientOpacityMTime", header: "vtkVolumeProperty.h".}
proc GetScalarOpacityMTime*(this: var vtkVolumeProperty; index: cint): vtkTimeStamp {.
    importcpp: "GetScalarOpacityMTime", header: "vtkVolumeProperty.h".}
proc GetScalarOpacityMTime*(this: var vtkVolumeProperty): vtkTimeStamp {.
    importcpp: "GetScalarOpacityMTime", header: "vtkVolumeProperty.h".}
proc GetRGBTransferFunctionMTime*(this: var vtkVolumeProperty; index: cint): vtkTimeStamp {.
    importcpp: "GetRGBTransferFunctionMTime", header: "vtkVolumeProperty.h".}
proc GetRGBTransferFunctionMTime*(this: var vtkVolumeProperty): vtkTimeStamp {.
    importcpp: "GetRGBTransferFunctionMTime", header: "vtkVolumeProperty.h".}
proc GetGrayTransferFunctionMTime*(this: var vtkVolumeProperty; index: cint): vtkTimeStamp {.
    importcpp: "GetGrayTransferFunctionMTime", header: "vtkVolumeProperty.h".}
proc GetGrayTransferFunctionMTime*(this: var vtkVolumeProperty): vtkTimeStamp {.
    importcpp: "GetGrayTransferFunctionMTime", header: "vtkVolumeProperty.h".}
proc SetUseClippedVoxelIntensity*(this: var vtkVolumeProperty; _arg: cint) {.
    importcpp: "SetUseClippedVoxelIntensity", header: "vtkVolumeProperty.h".}
## !!!Ignored construct:  virtual int GetIndependentComponentsInterpolationTypeTransferFunctionModeScatteringAnisotropyUseClippedVoxelIntensity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseClippedVoxelIntensity  of  << this -> UseClippedVoxelIntensity ) ; return this -> UseClippedVoxelIntensity ; } ;
## Error: expected ';'!!!

proc UseClippedVoxelIntensityOn*(this: var vtkVolumeProperty) {.
    importcpp: "UseClippedVoxelIntensityOn", header: "vtkVolumeProperty.h".}
proc UseClippedVoxelIntensityOff*(this: var vtkVolumeProperty) {.
    importcpp: "UseClippedVoxelIntensityOff", header: "vtkVolumeProperty.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the intensity value for voxels in the clipped space for gradient
  ##  computations (for shading and gradient based opacity modulation).
  ##  By default, this is set to VTK_DOUBLE_MIN.
  ##
  ##  \note This value is only used when UseClippedVoxelIntensity is true.
  ##  \note This property is only used by the vtkGPUVolumeRayCastMapper for now.
  ##  \sa SetUseClippedVoxelIntensity
  ##
proc SetUseClippedVoxelIntensityClippedVoxelIntensity*(
    this: var vtkVolumeProperty; _arg: cdouble) {.
    importcpp: "SetUseClippedVoxelIntensityClippedVoxelIntensity",
    header: "vtkVolumeProperty.h".}
## !!!Ignored construct:  virtual double GetIndependentComponentsInterpolationTypeTransferFunctionModeScatteringAnisotropyUseClippedVoxelIntensityClippedVoxelIntensity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ClippedVoxelIntensity  of  << this -> ClippedVoxelIntensity ) ; return this -> ClippedVoxelIntensity ; } ;
## Error: expected ';'!!!

proc SetLabelColor*(this: var vtkVolumeProperty; label: cint;
                   function: ptr vtkColorTransferFunction) {.
    importcpp: "SetLabelColor", header: "vtkVolumeProperty.h".}
proc GetLabelColor*(this: var vtkVolumeProperty; label: cint): ptr vtkColorTransferFunction {.
    importcpp: "GetLabelColor", header: "vtkVolumeProperty.h".}
proc SetLabelScalarOpacity*(this: var vtkVolumeProperty; label: cint;
                           function: ptr vtkPiecewiseFunction) {.
    importcpp: "SetLabelScalarOpacity", header: "vtkVolumeProperty.h".}
proc GetLabelScalarOpacity*(this: var vtkVolumeProperty; label: cint): ptr vtkPiecewiseFunction {.
    importcpp: "GetLabelScalarOpacity", header: "vtkVolumeProperty.h".}
proc SetLabelGradientOpacity*(this: var vtkVolumeProperty; label: cint;
                             function: ptr vtkPiecewiseFunction) {.
    importcpp: "SetLabelGradientOpacity", header: "vtkVolumeProperty.h".}
proc GetLabelGradientOpacity*(this: var vtkVolumeProperty; label: cint): ptr vtkPiecewiseFunction {.
    importcpp: "GetLabelGradientOpacity", header: "vtkVolumeProperty.h".}
## !!!Ignored construct:  /@} *
##  WARNING: INTERNAL METHOD - NOT INTENDED FOR GENERAL USE
##  Get the time that label color transfer functions were set
##  virtual vtkTimeStamp GetIndependentComponentsInterpolationTypeTransferFunctionModeScatteringAnisotropyUseClippedVoxelIntensityClippedVoxelIntensityLabelColorMTimeLabelColorMTime ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LabelColorMTime  of  << this -> LabelColorMTime ) ; return this -> LabelColorMTime ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  *
##  WARNING: INTERNAL METHOD - NOT INTENDED FOR GENERAL USE
##  Get the time that label scalar opacity transfer functions were set
##  virtual vtkTimeStamp GetIndependentComponentsInterpolationTypeTransferFunctionModeScatteringAnisotropyUseClippedVoxelIntensityClippedVoxelIntensityLabelColorMTimeLabelColorMTimeLabelScalarOpacityMTimeLabelScalarOpacityMTime ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LabelScalarOpacityMTime  of  << this -> LabelScalarOpacityMTime ) ; return this -> LabelScalarOpacityMTime ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  *
##  WARNING: INTERNAL METHOD - NOT INTENDED FOR GENERAL USE
##  Get the time that label gradient opacity transfer functions were set
##  virtual vtkTimeStamp GetIndependentComponentsInterpolationTypeTransferFunctionModeScatteringAnisotropyUseClippedVoxelIntensityClippedVoxelIntensityLabelColorMTimeLabelColorMTimeLabelScalarOpacityMTimeLabelScalarOpacityMTimeLabelGradientOpacityMTimeLabelGradientOpacityMTime ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LabelGradientOpacityMTime  of  << this -> LabelGradientOpacityMTime ) ; return this -> LabelGradientOpacityMTime ; } ;
## Error: expected ';'!!!

proc GetNumberOfLabels*(this: var vtkVolumeProperty): size_t {.
    importcpp: "GetNumberOfLabels", header: "vtkVolumeProperty.h".}
proc GetLabelMapLabels*(this: var vtkVolumeProperty): set[cint] {.
    importcpp: "GetLabelMapLabels", header: "vtkVolumeProperty.h".}
## *
##  Return the interpolation type as a descriptive character string.
##

proc GetInterpolationTypeAsString*(this: var vtkVolumeProperty): cstring {.
    importcpp: "GetInterpolationTypeAsString", header: "vtkVolumeProperty.h".}