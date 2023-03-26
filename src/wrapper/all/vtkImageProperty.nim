## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageProperty.h
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
##  @class   vtkImageProperty
##  @brief   image display properties
##
##  vtkImageProperty is an object that allows control of the display
##  of an image slice.
##  @par Thanks:
##  Thanks to David Gobbi at the Seaman Family MR Centre and Dept. of Clinical
##  Neurosciences, Foothills Medical Centre, Calgary, for providing this class.
##  @sa
##  vtkImage vtkImageMapper3D vtkImageSliceMapper vtkImageResliceMapper
##

import
  vtkObject, vtkRenderingCoreModule

discard "forward decl of vtkScalarsToColors"
type
  vtkImageProperty* {.importcpp: "vtkImageProperty", header: "vtkImageProperty.h",
                     bycopy.} = object of vtkObject
    vtkImageProperty* {.importc: "vtkImageProperty".}: VTK_NEWINSTANCE

  vtkImagePropertySuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageProperty::IsTypeOf(@)", header: "vtkImageProperty.h".}
proc IsA*(this: var vtkImageProperty; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkImageProperty.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageProperty {.
    importcpp: "vtkImageProperty::SafeDownCast(@)", header: "vtkImageProperty.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageProperty :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageProperty :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageProperty :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageProperty; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageProperty.h".}
proc New*(): ptr vtkImageProperty {.importcpp: "vtkImageProperty::New(@)",
                                header: "vtkImageProperty.h".}
proc DeepCopy*(this: var vtkImageProperty; p: ptr vtkImageProperty) {.
    importcpp: "DeepCopy", header: "vtkImageProperty.h".}
proc SetColorWindow*(this: var vtkImageProperty; _arg: cdouble) {.
    importcpp: "SetColorWindow", header: "vtkImageProperty.h".}
## !!!Ignored construct:  virtual double GetColorWindow ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ColorWindow  of  << this -> ColorWindow ) ; return this -> ColorWindow ; } ;
## Error: expected ';'!!!

proc SetColorWindowColorLevel*(this: var vtkImageProperty; _arg: cdouble) {.
    importcpp: "SetColorWindowColorLevel", header: "vtkImageProperty.h".}
## !!!Ignored construct:  virtual double GetColorWindowColorLevel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ColorLevel  of  << this -> ColorLevel ) ; return this -> ColorLevel ; } ;
## Error: expected ';'!!!

proc SetLookupTable*(this: var vtkImageProperty; lut: ptr vtkScalarsToColors) {.
    importcpp: "SetLookupTable", header: "vtkImageProperty.h".}
proc GetnameLookupTable*(this: var vtkImageProperty): ptr vtkScalarsToColors {.
    importcpp: "GetnameLookupTable", header: "vtkImageProperty.h".}
  ## /@}
  ## /@{
  ## *
  ##  Use the range that is set in the lookup table, instead
  ##  of setting the range from the Window/Level settings.
  ##  This is off by default.
  ##
proc SetColorWindowColorLevelUseLookupTableScalarRange*(
    this: var vtkImageProperty; _arg: vtkTypeBool) {.
    importcpp: "SetColorWindowColorLevelUseLookupTableScalarRange",
    header: "vtkImageProperty.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetColorWindowColorLevelUseLookupTableScalarRange ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseLookupTableScalarRange  of  << this -> UseLookupTableScalarRange ) ; return this -> UseLookupTableScalarRange ; } ;
## Error: expected ';'!!!

proc UseLookupTableScalarRangeOn*(this: var vtkImageProperty) {.
    importcpp: "UseLookupTableScalarRangeOn", header: "vtkImageProperty.h".}
proc UseLookupTableScalarRangeOff*(this: var vtkImageProperty) {.
    importcpp: "UseLookupTableScalarRangeOff", header: "vtkImageProperty.h".}
  ## /@}
  ## /@{
  ## *
  ##  The opacity of the image, where 1.0 is opaque and 0.0 is
  ##  transparent.  If the image has an alpha component, then
  ##  the alpha component will be multiplied by this value.
  ##  The default is 1.0.
  ##
proc SetOpacity*(this: var vtkImageProperty; _arg: cdouble) {.importcpp: "SetOpacity",
    header: "vtkImageProperty.h".}
proc GetOpacityMinValue*(this: var vtkImageProperty): cdouble {.
    importcpp: "GetOpacityMinValue", header: "vtkImageProperty.h".}
proc GetOpacityMaxValue*(this: var vtkImageProperty): cdouble {.
    importcpp: "GetOpacityMaxValue", header: "vtkImageProperty.h".}
## !!!Ignored construct:  virtual double GetColorWindowColorLevelUseLookupTableScalarRangeOpacity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Opacity  of  << this -> Opacity ) ; return this -> Opacity ; } ;
## Error: expected ';'!!!

proc SetOpacityAmbient*(this: var vtkImageProperty; _arg: cdouble) {.
    importcpp: "SetOpacityAmbient", header: "vtkImageProperty.h".}
proc GetOpacityMinValueAmbientMinValue*(this: var vtkImageProperty): cdouble {.
    importcpp: "GetOpacityMinValueAmbientMinValue", header: "vtkImageProperty.h".}
proc GetOpacityMaxValueAmbientMaxValue*(this: var vtkImageProperty): cdouble {.
    importcpp: "GetOpacityMaxValueAmbientMaxValue", header: "vtkImageProperty.h".}
## !!!Ignored construct:  virtual double GetColorWindowColorLevelUseLookupTableScalarRangeOpacityAmbient ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Ambient  of  << this -> Ambient ) ; return this -> Ambient ; } ;
## Error: expected ';'!!!

proc SetOpacityAmbientDiffuse*(this: var vtkImageProperty; _arg: cdouble) {.
    importcpp: "SetOpacityAmbientDiffuse", header: "vtkImageProperty.h".}
proc GetOpacityMinValueAmbientMinValueDiffuseMinValue*(this: var vtkImageProperty): cdouble {.
    importcpp: "GetOpacityMinValueAmbientMinValueDiffuseMinValue",
    header: "vtkImageProperty.h".}
proc GetOpacityMaxValueAmbientMaxValueDiffuseMaxValue*(this: var vtkImageProperty): cdouble {.
    importcpp: "GetOpacityMaxValueAmbientMaxValueDiffuseMaxValue",
    header: "vtkImageProperty.h".}
## !!!Ignored construct:  virtual double GetColorWindowColorLevelUseLookupTableScalarRangeOpacityAmbientDiffuse ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Diffuse  of  << this -> Diffuse ) ; return this -> Diffuse ; } ;
## Error: expected ';'!!!

proc SetOpacityAmbientDiffuseInterpolationType*(this: var vtkImageProperty;
    _arg: cint) {.importcpp: "SetOpacityAmbientDiffuseInterpolationType",
                header: "vtkImageProperty.h".}
proc GetOpacityMinValueAmbientMinValueDiffuseMinValueInterpolationTypeMinValue*(
    this: var vtkImageProperty): cint {.importcpp: "GetOpacityMinValueAmbientMinValueDiffuseMinValueInterpolationTypeMinValue",
                                    header: "vtkImageProperty.h".}
proc GetOpacityMaxValueAmbientMaxValueDiffuseMaxValueInterpolationTypeMaxValue*(
    this: var vtkImageProperty): cint {.importcpp: "GetOpacityMaxValueAmbientMaxValueDiffuseMaxValueInterpolationTypeMaxValue",
                                    header: "vtkImageProperty.h".}
## !!!Ignored construct:  virtual int GetColorWindowColorLevelUseLookupTableScalarRangeOpacityAmbientDiffuseInterpolationType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InterpolationType  of  << this -> InterpolationType ) ; return this -> InterpolationType ; } ;
## Error: expected ';'!!!

proc SetInterpolationTypeToNearest*(this: var vtkImageProperty) {.
    importcpp: "SetInterpolationTypeToNearest", header: "vtkImageProperty.h".}
proc SetInterpolationTypeToLinear*(this: var vtkImageProperty) {.
    importcpp: "SetInterpolationTypeToLinear", header: "vtkImageProperty.h".}
proc SetInterpolationTypeToCubic*(this: var vtkImageProperty) {.
    importcpp: "SetInterpolationTypeToCubic", header: "vtkImageProperty.h".}
proc GetInterpolationTypeAsString*(this: var vtkImageProperty): cstring {.
    importcpp: "GetInterpolationTypeAsString", header: "vtkImageProperty.h".}
proc SetColorWindowColorLevelUseLookupTableScalarRangeLayerNumber*(
    this: var vtkImageProperty; _arg: cint) {.
    importcpp: "SetColorWindowColorLevelUseLookupTableScalarRangeLayerNumber",
    header: "vtkImageProperty.h".}
proc GetLayerNumber*(this: var vtkImageProperty): cint {.importcpp: "GetLayerNumber",
    header: "vtkImageProperty.h".}
proc SetColorWindowColorLevelUseLookupTableScalarRangeLayerNumberCheckerboard*(
    this: var vtkImageProperty; _arg: vtkTypeBool) {.importcpp: "SetColorWindowColorLevelUseLookupTableScalarRangeLayerNumberCheckerboard",
    header: "vtkImageProperty.h".}
proc CheckerboardOn*(this: var vtkImageProperty) {.importcpp: "CheckerboardOn",
    header: "vtkImageProperty.h".}
proc CheckerboardOff*(this: var vtkImageProperty) {.importcpp: "CheckerboardOff",
    header: "vtkImageProperty.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetColorWindowColorLevelUseLookupTableScalarRangeOpacityAmbientDiffuseInterpolationTypeCheckerboard ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Checkerboard  of  << this -> Checkerboard ) ; return this -> Checkerboard ; } ;
## Error: expected ';'!!!

proc SetCheckerboardSpacing*(this: var vtkImageProperty; _arg1: cdouble;
                            _arg2: cdouble) {.importcpp: "SetCheckerboardSpacing",
    header: "vtkImageProperty.h".}
proc SetCheckerboardSpacing*(this: var vtkImageProperty; _arg: array[2, cdouble]) {.
    importcpp: "SetCheckerboardSpacing", header: "vtkImageProperty.h".}
## !!!Ignored construct:  virtual double * GetCheckerboardSpacing ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << CheckerboardSpacing  pointer  << this -> CheckerboardSpacing ) ; return this -> CheckerboardSpacing ; } VTK_WRAPEXCLUDE virtual void GetCheckerboardSpacing ( double & _arg1 , double & _arg2 ) { _arg1 = this -> CheckerboardSpacing [ 0 ] ; _arg2 = this -> CheckerboardSpacing [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << CheckerboardSpacing  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCheckerboardSpacing ( double _arg [ 2 ] ) { this -> GetCheckerboardSpacing ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetCheckerboardSpacingCheckerboardOffset*(this: var vtkImageProperty;
    _arg1: cdouble; _arg2: cdouble) {.importcpp: "SetCheckerboardSpacingCheckerboardOffset",
                                  header: "vtkImageProperty.h".}
proc SetCheckerboardSpacingCheckerboardOffset*(this: var vtkImageProperty;
    _arg: array[2, cdouble]) {.importcpp: "SetCheckerboardSpacingCheckerboardOffset",
                            header: "vtkImageProperty.h".}
## !!!Ignored construct:  virtual double * GetCheckerboardSpacingCheckerboardOffset ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << CheckerboardOffset  pointer  << this -> CheckerboardOffset ) ; return this -> CheckerboardOffset ; } VTK_WRAPEXCLUDE virtual void GetCheckerboardSpacingCheckerboardOffset ( double & _arg1 , double & _arg2 ) { _arg1 = this -> CheckerboardOffset [ 0 ] ; _arg2 = this -> CheckerboardOffset [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << CheckerboardOffset  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCheckerboardSpacingCheckerboardOffset ( double _arg [ 2 ] ) { this -> GetCheckerboardSpacingCheckerboardOffset ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetColorWindowColorLevelUseLookupTableScalarRangeLayerNumberCheckerboardBacking*(
    this: var vtkImageProperty; _arg: vtkTypeBool) {.importcpp: "SetColorWindowColorLevelUseLookupTableScalarRangeLayerNumberCheckerboardBacking",
    header: "vtkImageProperty.h".}
proc BackingOn*(this: var vtkImageProperty) {.importcpp: "BackingOn",
    header: "vtkImageProperty.h".}
proc BackingOff*(this: var vtkImageProperty) {.importcpp: "BackingOff",
    header: "vtkImageProperty.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetColorWindowColorLevelUseLookupTableScalarRangeOpacityAmbientDiffuseInterpolationTypeCheckerboardBacking ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Backing  of  << this -> Backing ) ; return this -> Backing ; } ;
## Error: expected ';'!!!

proc SetBackingColor*(this: var vtkImageProperty; _arg1: cdouble; _arg2: cdouble;
                     _arg3: cdouble) {.importcpp: "SetBackingColor",
                                     header: "vtkImageProperty.h".}
proc SetBackingColor*(this: var vtkImageProperty; _arg: array[3, cdouble]) {.
    importcpp: "SetBackingColor", header: "vtkImageProperty.h".}
## !!!Ignored construct:  virtual double * GetBackingColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << BackingColor  pointer  << this -> BackingColor ) ; return this -> BackingColor ; } VTK_WRAPEXCLUDE virtual void GetBackingColor ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> BackingColor [ 0 ] ; _arg2 = this -> BackingColor [ 1 ] ; _arg3 = this -> BackingColor [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << BackingColor  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetBackingColor ( double _arg [ 3 ] ) { this -> GetBackingColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc GetMTime*(this: var vtkImageProperty): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkImageProperty.h".}