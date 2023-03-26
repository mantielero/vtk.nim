## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkScalarsToColors.h
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
##  @class   vtkScalarsToColors
##  @brief   Superclass for mapping scalar values to colors
##
##  vtkScalarsToColors is a general-purpose base class for objects that
##  convert scalars to colors. This include vtkLookupTable classes and
##  color transfer functions.  By itself, this class will simply rescale
##  the scalars.
##
##  The scalar-to-color mapping can be augmented with an additional
##  uniform alpha blend. This is used, for example, to blend a vtkActor's
##  opacity with the lookup table values.
##
##  Specific scalar values may be annotated with text strings that will
##  be included in color legends using \a SetAnnotations, \a SetAnnotation,
##  \a GetNumberOfAnnotatedValues, \a GetAnnotatedValue, \a GetAnnotation,
##  \a RemoveAnnotation, and \a ResetAnnotations.
##
##  This class also has a method for indicating that the set of
##  annotated values form a categorical color map; by setting \a
##  IndexedLookup to true, you indicate that the annotated values are
##  the only valid values for which entries in the color table should
##  be returned. In this mode, subclasses should then assign colors to
##  annotated values by taking the modulus of an annotated value's
##  index in the list of annotations with the number of colors in the
##  table.
##
##  @sa
##  vtkLookupTable vtkColorTransferFunction
##

import
  vtkCommonCoreModule, vtkObject, vtkVariant

discard "forward decl of vtkAbstractArray"
discard "forward decl of vtkDataArray"
discard "forward decl of vtkUnsignedCharArray"
discard "forward decl of vtkAbstractArray"
discard "forward decl of vtkStringArray"
discard "forward decl of vtkUnsignedCharArray"
type
  vtkScalarsToColors* {.importcpp: "vtkScalarsToColors",
                       header: "vtkScalarsToColors.h", bycopy.} = object of vtkObject
    vtkScalarsToColors* {.importc: "vtkScalarsToColors".}: VTK_NEWINSTANCE
    ##  How to map arrays with multiple components.
    ##  Obsolete, kept so subclasses will still compile

  vtkScalarsToColorsSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkScalarsToColors::IsTypeOf(@)", header: "vtkScalarsToColors.h".}
proc IsA*(this: var vtkScalarsToColors; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkScalarsToColors.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkScalarsToColors {.
    importcpp: "vtkScalarsToColors::SafeDownCast(@)",
    header: "vtkScalarsToColors.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkScalarsToColors :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkScalarsToColors :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkScalarsToColors :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkScalarsToColors; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkScalarsToColors.h".}
proc New*(): ptr vtkScalarsToColors {.importcpp: "vtkScalarsToColors::New(@)",
                                  header: "vtkScalarsToColors.h".}
proc IsOpaque*(this: var vtkScalarsToColors): cint {.importcpp: "IsOpaque",
    header: "vtkScalarsToColors.h".}
proc IsOpaque*(this: var vtkScalarsToColors; scalars: ptr vtkAbstractArray;
              colorMode: cint; component: cint): cint {.importcpp: "IsOpaque",
    header: "vtkScalarsToColors.h".}
proc IsOpaque*(this: var vtkScalarsToColors; scalars: ptr vtkAbstractArray;
              colorMode: cint; component: cint; ghosts: ptr vtkUnsignedCharArray;
              ghostsToSkip: cuchar = 0xff): cint {.importcpp: "IsOpaque",
    header: "vtkScalarsToColors.h".}
proc Build*(this: var vtkScalarsToColors) {.importcpp: "Build",
                                        header: "vtkScalarsToColors.h".}
## !!!Ignored construct:  /@{ *
##  Sets/Gets the range of scalars that will be mapped.
##  virtual double * GetRange ( ) VTK_SIZEHINT ( 2 ) ;
## Error: expected ';'!!!

proc SetRange*(this: var vtkScalarsToColors; min: cdouble; max: cdouble) {.
    importcpp: "SetRange", header: "vtkScalarsToColors.h".}
proc SetRange*(this: var vtkScalarsToColors; rng: array[2, cdouble]) {.
    importcpp: "SetRange", header: "vtkScalarsToColors.h".}
proc MapValue*(this: var vtkScalarsToColors; v: cdouble): ptr cuchar {.
    importcpp: "MapValue", header: "vtkScalarsToColors.h".}
proc GetColor*(this: var vtkScalarsToColors; v: cdouble; rgb: array[3, cdouble]) {.
    importcpp: "GetColor", header: "vtkScalarsToColors.h".}
## !!!Ignored construct:  *
##  Map one value through the lookup table and return the color as
##  an RGB array of doubles between 0 and 1.
##  double * GetColor ( double v ) VTK_SIZEHINT ( 3 ) { this -> GetColor ( v , this -> RGB ) ; return this -> RGB ; } *
##  Map one value through the lookup table and return the alpha value
##  (the opacity) as a double between 0 and 1. This implementation
##  always returns 1.
##  virtual double GetOpacity ( double v ) ;
## Error: expected ';'!!!

proc GetLuminance*(this: var vtkScalarsToColors; x: cdouble): cdouble {.
    importcpp: "GetLuminance", header: "vtkScalarsToColors.h".}
proc SetAlpha*(this: var vtkScalarsToColors; alpha: cdouble) {.importcpp: "SetAlpha",
    header: "vtkScalarsToColors.h".}
## !!!Ignored construct:  virtual double GetAlpha ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Alpha  of  << this -> Alpha ) ; return this -> Alpha ; } ;
## Error: expected ';'!!!

proc MapScalars*(this: var vtkScalarsToColors; scalars: ptr vtkDataArray;
                colorMode: cint; component: cint; outputFormat: cint = VTK_RGBA): ptr vtkUnsignedCharArray {.
    importcpp: "MapScalars", header: "vtkScalarsToColors.h".}
proc MapScalars*(this: var vtkScalarsToColors; scalars: ptr vtkAbstractArray;
                colorMode: cint; component: cint; outputFormat: cint = VTK_RGBA): ptr vtkUnsignedCharArray {.
    importcpp: "MapScalars", header: "vtkScalarsToColors.h".}
proc SetVectorMode*(this: var vtkScalarsToColors; _arg: cint) {.
    importcpp: "SetVectorMode", header: "vtkScalarsToColors.h".}
## !!!Ignored construct:  virtual int GetAlphaVectorMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VectorMode  of  << this -> VectorMode ) ; return this -> VectorMode ; } ;
## Error: expected ';'!!!

proc SetVectorModeToMagnitude*(this: var vtkScalarsToColors) {.
    importcpp: "SetVectorModeToMagnitude", header: "vtkScalarsToColors.h".}
proc SetVectorModeToComponent*(this: var vtkScalarsToColors) {.
    importcpp: "SetVectorModeToComponent", header: "vtkScalarsToColors.h".}
proc SetVectorModeToRGBColors*(this: var vtkScalarsToColors) {.
    importcpp: "SetVectorModeToRGBColors", header: "vtkScalarsToColors.h".}
type
  vtkScalarsToColorsVectorModes* {.size: sizeof(cint),
                                  importcpp: "vtkScalarsToColors::VectorModes",
                                  header: "vtkScalarsToColors.h".} = enum
    MAGNITUDE = 0, COMPONENT = 1, RGBCOLORS = 2


proc SetVectorModeVectorComponent*(this: var vtkScalarsToColors; _arg: cint) {.
    importcpp: "SetVectorModeVectorComponent", header: "vtkScalarsToColors.h".}
## !!!Ignored construct:  virtual int GetAlphaVectorModeVectorComponent ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VectorComponent  of  << this -> VectorComponent ) ; return this -> VectorComponent ; } ;
## Error: expected ';'!!!

proc SetVectorModeVectorComponentVectorSize*(this: var vtkScalarsToColors;
    _arg: cint) {.importcpp: "SetVectorModeVectorComponentVectorSize",
                header: "vtkScalarsToColors.h".}
## !!!Ignored construct:  virtual int GetAlphaVectorModeVectorComponentVectorSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VectorSize  of  << this -> VectorSize ) ; return this -> VectorSize ; } ;
## Error: expected ';'!!!

proc MapVectorsThroughTable*(this: var vtkScalarsToColors; input: pointer;
                            output: ptr cuchar; inputDataType: cint;
                            numberOfValues: cint; inputIncrement: cint;
                            outputFormat: cint; vectorComponent: cint;
                            vectorSize: cint) {.
    importcpp: "MapVectorsThroughTable", header: "vtkScalarsToColors.h".}
proc MapVectorsThroughTable*(this: var vtkScalarsToColors; input: pointer;
                            output: ptr cuchar; inputDataType: cint;
                            numberOfValues: cint; inputIncrement: cint;
                            outputFormat: cint) {.
    importcpp: "MapVectorsThroughTable", header: "vtkScalarsToColors.h".}
proc MapScalarsThroughTable*(this: var vtkScalarsToColors;
                            scalars: ptr vtkDataArray; output: ptr cuchar;
                            outputFormat: cint) {.
    importcpp: "MapScalarsThroughTable", header: "vtkScalarsToColors.h".}
proc MapScalarsThroughTable*(this: var vtkScalarsToColors;
                            scalars: ptr vtkDataArray; output: ptr cuchar) {.
    importcpp: "MapScalarsThroughTable", header: "vtkScalarsToColors.h".}
proc MapScalarsThroughTable*(this: var vtkScalarsToColors; input: pointer;
                            output: ptr cuchar; inputDataType: cint;
                            numberOfValues: cint; inputIncrement: cint;
                            outputFormat: cint) {.
    importcpp: "MapScalarsThroughTable", header: "vtkScalarsToColors.h".}
proc MapScalarsThroughTable2*(this: var vtkScalarsToColors; input: pointer;
                             output: ptr cuchar; inputDataType: cint;
                             numberOfValues: cint; inputIncrement: cint;
                             outputFormat: cint) {.
    importcpp: "MapScalarsThroughTable2", header: "vtkScalarsToColors.h".}
proc DeepCopy*(this: var vtkScalarsToColors; o: ptr vtkScalarsToColors) {.
    importcpp: "DeepCopy", header: "vtkScalarsToColors.h".}
proc UsingLogScale*(this: var vtkScalarsToColors): cint {.importcpp: "UsingLogScale",
    header: "vtkScalarsToColors.h".}
proc GetNumberOfAvailableColors*(this: var vtkScalarsToColors): vtkIdType {.
    importcpp: "GetNumberOfAvailableColors", header: "vtkScalarsToColors.h".}
proc SetAnnotations*(this: var vtkScalarsToColors; values: ptr vtkAbstractArray;
                    annotations: ptr vtkStringArray) {.importcpp: "SetAnnotations",
    header: "vtkScalarsToColors.h".}
proc GetnameAnnotatedValues*(this: var vtkScalarsToColors): ptr vtkAbstractArray {.
    importcpp: "GetnameAnnotatedValues", header: "vtkScalarsToColors.h".}
proc GetnameAnnotatedValuesAnnotations*(this: var vtkScalarsToColors): ptr vtkStringArray {.
    importcpp: "GetnameAnnotatedValuesAnnotations", header: "vtkScalarsToColors.h".}
  ## /@}
  ## *
  ##  Add a new entry (or change an existing entry) to the list of annotated values.
  ##  Returns the index of \a value in the list of annotations.
  ##
proc SetAnnotation*(this: var vtkScalarsToColors; value: vtkVariant;
                   annotation: vtkStdString): vtkIdType {.
    importcpp: "SetAnnotation", header: "vtkScalarsToColors.h".}
proc SetAnnotation*(this: var vtkScalarsToColors; value: vtkStdString;
                   annotation: vtkStdString): vtkIdType {.
    importcpp: "SetAnnotation", header: "vtkScalarsToColors.h".}
proc GetNumberOfAnnotatedValues*(this: var vtkScalarsToColors): vtkIdType {.
    importcpp: "GetNumberOfAnnotatedValues", header: "vtkScalarsToColors.h".}
proc GetAnnotatedValue*(this: var vtkScalarsToColors; idx: vtkIdType): vtkVariant {.
    importcpp: "GetAnnotatedValue", header: "vtkScalarsToColors.h".}
proc GetAnnotation*(this: var vtkScalarsToColors; idx: vtkIdType): vtkStdString {.
    importcpp: "GetAnnotation", header: "vtkScalarsToColors.h".}
proc GetAnnotationColor*(this: var vtkScalarsToColors; val: vtkVariant;
                        rgba: array[4, cdouble]) {.importcpp: "GetAnnotationColor",
    header: "vtkScalarsToColors.h".}
proc GetAnnotatedValueIndex*(this: var vtkScalarsToColors; val: vtkVariant): vtkIdType {.
    importcpp: "GetAnnotatedValueIndex", header: "vtkScalarsToColors.h".}
proc GetAnnotatedValueIndexInternal*(this: var vtkScalarsToColors; val: vtkVariant): vtkIdType {.
    importcpp: "GetAnnotatedValueIndexInternal", header: "vtkScalarsToColors.h".}
proc GetIndexedColor*(this: var vtkScalarsToColors; i: vtkIdType;
                     rgba: array[4, cdouble]) {.importcpp: "GetIndexedColor",
    header: "vtkScalarsToColors.h".}
proc RemoveAnnotation*(this: var vtkScalarsToColors; value: vtkVariant): bool {.
    importcpp: "RemoveAnnotation", header: "vtkScalarsToColors.h".}
proc ResetAnnotations*(this: var vtkScalarsToColors) {.
    importcpp: "ResetAnnotations", header: "vtkScalarsToColors.h".}
proc SetVectorModeVectorComponentVectorSizeIndexedLookup*(
    this: var vtkScalarsToColors; _arg: vtkTypeBool) {.
    importcpp: "SetVectorModeVectorComponentVectorSizeIndexedLookup",
    header: "vtkScalarsToColors.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetAlphaVectorModeVectorComponentVectorSizeIndexedLookup ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IndexedLookup  of  << this -> IndexedLookup ) ; return this -> IndexedLookup ; } ;
## Error: expected ';'!!!

proc IndexedLookupOn*(this: var vtkScalarsToColors) {.importcpp: "IndexedLookupOn",
    header: "vtkScalarsToColors.h".}
proc IndexedLookupOff*(this: var vtkScalarsToColors) {.
    importcpp: "IndexedLookupOff", header: "vtkScalarsToColors.h".}
  ## /@}
  ## /@{
  ## *
  ##  Converts a color from numeric type T to uchar. We assume the integral type
  ##  is already in the range 0-255. If it is not, behavior is undefined.
  ##  Floating point types are assumed to be in interval 0.0-1.0
  ##
proc ColorToUChar*[T](t: T): cuchar {.importcpp: "vtkScalarsToColors::ColorToUChar(@)",
                                  header: "vtkScalarsToColors.h".}
proc ColorToUChar*[T](t: T; dest: ptr cuchar) {.
    importcpp: "vtkScalarsToColors::ColorToUChar(@)",
    header: "vtkScalarsToColors.h".}
## /@{
## *
##  Specializations of vtkScalarsToColors::ColorToUChar
##  Converts from a color in a floating point type in range 0.0-1.0 to a uchar
##  in range 0-255.
##

proc ColorToUChar*(this: var vtkScalarsToColors; t: cdouble): cuchar {.
    importcpp: "ColorToUChar", header: "vtkScalarsToColors.h".}
proc ColorToUChar*(this: var vtkScalarsToColors; t: cfloat): cuchar {.
    importcpp: "ColorToUChar", header: "vtkScalarsToColors.h".}
## /@}
