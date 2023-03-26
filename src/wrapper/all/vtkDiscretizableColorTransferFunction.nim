## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDiscretizableColorTransferFunction.h
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
##  @class   vtkDiscretizableColorTransferFunction
##  @brief   a combination of
##  vtkColorTransferFunction and vtkLookupTable.
##
##  This is a cross between a vtkColorTransferFunction and a vtkLookupTable
##  selectively combining the functionality of both. This class is a
##  vtkColorTransferFunction allowing users to specify the RGB control points
##  that control the color transfer function. At the same time, by setting
##  \a Discretize to 1 (true), one can force the transfer function to only have
##  \a NumberOfValues discrete colors.
##
##  When \a IndexedLookup is true, this class behaves differently. The annotated
##  values are considered to the be only valid values for which entries in the
##  color table should be returned. The colors for annotated values are those
##  specified using \a AddIndexedColors. Typically, there must be at least as many
##  indexed colors specified as the annotations. For backwards compatibility, if
##  no indexed-colors are specified, the colors in the lookup \a Table are assigned
##  to annotated values by taking the modulus of their index in the list
##  of annotations. If a scalar value is not present in \a AnnotatedValues,
##  then \a NanColor will be used.
##
##  One can set a scalar opacity function to map scalars to color types handling
##  transparency (VTK_RGBA, VTK_LUMINANCE_ALPHA). Opacity mapping is off by
##  default. Call EnableOpacityMappingOn() to handle mapping of alpha values.
##
##  NOTE: One must call Build() after making any changes to the points
##  in the ColorTransferFunction to ensure that the discrete and non-discrete
##  versions match up.
##

import
  vtkColorTransferFunction, vtkRenderingCoreModule, vtkSmartPointer

discard "forward decl of vtkColorTransferFunction"
discard "forward decl of vtkLookupTable"
discard "forward decl of vtkPiecewiseFunction"
discard "forward decl of vtkUnsignedCharArray"
type
  vtkDiscretizableColorTransferFunction* {.
      importcpp: "vtkDiscretizableColorTransferFunction",
      header: "vtkDiscretizableColorTransferFunction.h", bycopy.} = object of vtkColorTransferFunction
    vtkDiscretizableColorTransferFunction*
        {.importc: "vtkDiscretizableColorTransferFunction".}: VTK_NEWINSTANCE
    ## *
    ##  Flag indicating whether log scaling is to be used.
    ##
    ## *
    ##  Number of values to use in discretized color map.
    ##
    ## *
    ##  Internal lookup table used for some aspects of the color mapping
    ##


proc New*(): ptr vtkDiscretizableColorTransferFunction {.
    importcpp: "vtkDiscretizableColorTransferFunction::New(@)",
    header: "vtkDiscretizableColorTransferFunction.h".}
type
  vtkDiscretizableColorTransferFunctionSuperclass* = vtkColorTransferFunction

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDiscretizableColorTransferFunction::IsTypeOf(@)",
    header: "vtkDiscretizableColorTransferFunction.h".}
proc IsA*(this: var vtkDiscretizableColorTransferFunction; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkDiscretizableColorTransferFunction.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDiscretizableColorTransferFunction {.
    importcpp: "vtkDiscretizableColorTransferFunction::SafeDownCast(@)",
    header: "vtkDiscretizableColorTransferFunction.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDiscretizableColorTransferFunction :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkColorTransferFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDiscretizableColorTransferFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDiscretizableColorTransferFunction :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDiscretizableColorTransferFunction; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkDiscretizableColorTransferFunction.h".}
proc IsOpaque*(this: var vtkDiscretizableColorTransferFunction): cint {.
    importcpp: "IsOpaque", header: "vtkDiscretizableColorTransferFunction.h".}
proc IsOpaque*(this: var vtkDiscretizableColorTransferFunction;
              scalars: ptr vtkAbstractArray; colorMode: cint; component: cint): cint {.
    importcpp: "IsOpaque", header: "vtkDiscretizableColorTransferFunction.h".}
proc IsOpaque*(this: var vtkDiscretizableColorTransferFunction;
              scalars: ptr vtkAbstractArray; colorMode: cint; component: cint;
              ghosts: ptr vtkUnsignedCharArray; ghostsToSkip: cuchar = 0xff): cint {.
    importcpp: "IsOpaque", header: "vtkDiscretizableColorTransferFunction.h".}
proc SetIndexedColorRGB*(this: var vtkDiscretizableColorTransferFunction;
                        index: cuint; rgb: array[3, cdouble]) {.
    importcpp: "SetIndexedColorRGB",
    header: "vtkDiscretizableColorTransferFunction.h".}
proc SetIndexedColorRGBA*(this: var vtkDiscretizableColorTransferFunction;
                         index: cuint; rgba: array[4, cdouble]) {.
    importcpp: "SetIndexedColorRGBA",
    header: "vtkDiscretizableColorTransferFunction.h".}
proc SetIndexedColor*(this: var vtkDiscretizableColorTransferFunction; index: cuint;
                     r: cdouble; g: cdouble; b: cdouble; a: cdouble = 1.0) {.
    importcpp: "SetIndexedColor",
    header: "vtkDiscretizableColorTransferFunction.h".}
proc GetIndexedColor*(this: var vtkDiscretizableColorTransferFunction; i: vtkIdType;
                     rgba: array[4, cdouble]) {.importcpp: "GetIndexedColor",
    header: "vtkDiscretizableColorTransferFunction.h".}
proc SetNumberOfIndexedColors*(this: var vtkDiscretizableColorTransferFunction;
                              count: cuint) {.
    importcpp: "SetNumberOfIndexedColors",
    header: "vtkDiscretizableColorTransferFunction.h".}
proc GetNumberOfIndexedColors*(this: var vtkDiscretizableColorTransferFunction): cuint {.
    importcpp: "GetNumberOfIndexedColors",
    header: "vtkDiscretizableColorTransferFunction.h".}
proc Build*(this: var vtkDiscretizableColorTransferFunction) {.importcpp: "Build",
    header: "vtkDiscretizableColorTransferFunction.h".}
proc SetDiscretize*(this: var vtkDiscretizableColorTransferFunction;
                   _arg: vtkTypeBool) {.importcpp: "SetDiscretize", header: "vtkDiscretizableColorTransferFunction.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetDiscretize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Discretize  of  << this -> Discretize ) ; return this -> Discretize ; } ;
## Error: expected ';'!!!

proc DiscretizeOn*(this: var vtkDiscretizableColorTransferFunction) {.
    importcpp: "DiscretizeOn", header: "vtkDiscretizableColorTransferFunction.h".}
proc DiscretizeOff*(this: var vtkDiscretizableColorTransferFunction) {.
    importcpp: "DiscretizeOff", header: "vtkDiscretizableColorTransferFunction.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get/Set if log scale must be used while mapping scalars
  ##  to colors. The default is 0.
  ##
proc SetUseLogScale*(this: var vtkDiscretizableColorTransferFunction;
                    useLogScale: cint) {.importcpp: "SetUseLogScale", header: "vtkDiscretizableColorTransferFunction.h".}
## !!!Ignored construct:  virtual int GetDiscretizeUseLogScale ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseLogScale  of  << this -> UseLogScale ) ; return this -> UseLogScale ; } ;
## Error: expected ';'!!!

proc SetDiscretizeNumberOfValues*(this: var vtkDiscretizableColorTransferFunction;
                                 _arg: vtkIdType) {.
    importcpp: "SetDiscretizeNumberOfValues",
    header: "vtkDiscretizableColorTransferFunction.h".}
## !!!Ignored construct:  virtual vtkIdType GetDiscretizeUseLogScaleNumberOfValues ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfValues  of  << this -> NumberOfValues ) ; return this -> NumberOfValues ; } ;
## Error: expected ';'!!!

proc MapValue*(this: var vtkDiscretizableColorTransferFunction; v: cdouble): ptr cuchar {.
    importcpp: "MapValue", header: "vtkDiscretizableColorTransferFunction.h".}
proc GetColor*(this: var vtkDiscretizableColorTransferFunction; v: cdouble;
              rgb: array[3, cdouble]) {.importcpp: "GetColor", header: "vtkDiscretizableColorTransferFunction.h".}
proc GetOpacity*(this: var vtkDiscretizableColorTransferFunction; v: cdouble): cdouble {.
    importcpp: "GetOpacity", header: "vtkDiscretizableColorTransferFunction.h".}
proc MapScalarsThroughTable2*(this: var vtkDiscretizableColorTransferFunction;
                             input: pointer; output: ptr cuchar; inputDataType: cint;
                             numberOfValues: cint; inputIncrement: cint;
                             outputFormat: cint) {.
    importcpp: "MapScalarsThroughTable2",
    header: "vtkDiscretizableColorTransferFunction.h".}
proc SetAlpha*(this: var vtkDiscretizableColorTransferFunction; alpha: cdouble) {.
    importcpp: "SetAlpha", header: "vtkDiscretizableColorTransferFunction.h".}
proc SetNanColor*(this: var vtkDiscretizableColorTransferFunction; r: cdouble;
                 g: cdouble; b: cdouble) {.importcpp: "SetNanColor", header: "vtkDiscretizableColorTransferFunction.h".}
proc SetNanColor*(this: var vtkDiscretizableColorTransferFunction;
                 rgb: array[3, cdouble]) {.importcpp: "SetNanColor", header: "vtkDiscretizableColorTransferFunction.h".}
proc SetNanOpacity*(this: var vtkDiscretizableColorTransferFunction; a: cdouble) {.
    importcpp: "SetNanOpacity", header: "vtkDiscretizableColorTransferFunction.h".}
proc UsingLogScale*(this: var vtkDiscretizableColorTransferFunction): cint {.
    importcpp: "UsingLogScale", header: "vtkDiscretizableColorTransferFunction.h".}
proc GetNumberOfAvailableColors*(this: var vtkDiscretizableColorTransferFunction): vtkIdType {.
    importcpp: "GetNumberOfAvailableColors",
    header: "vtkDiscretizableColorTransferFunction.h".}
proc SetScalarOpacityFunction*(this: var vtkDiscretizableColorTransferFunction;
                              function: ptr vtkPiecewiseFunction) {.
    importcpp: "SetScalarOpacityFunction",
    header: "vtkDiscretizableColorTransferFunction.h".}
proc GetScalarOpacityFunction*(this: vtkDiscretizableColorTransferFunction): ptr vtkPiecewiseFunction {.
    noSideEffect, importcpp: "GetScalarOpacityFunction",
    header: "vtkDiscretizableColorTransferFunction.h".}
proc SetDiscretizeNumberOfValuesEnableOpacityMapping*(
    this: var vtkDiscretizableColorTransferFunction; _arg: bool) {.
    importcpp: "SetDiscretizeNumberOfValuesEnableOpacityMapping",
    header: "vtkDiscretizableColorTransferFunction.h".}
## !!!Ignored construct:  virtual bool GetDiscretizeUseLogScaleNumberOfValuesEnableOpacityMapping ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EnableOpacityMapping  of  << this -> EnableOpacityMapping ) ; return this -> EnableOpacityMapping ; } ;
## Error: expected ';'!!!

proc EnableOpacityMappingOn*(this: var vtkDiscretizableColorTransferFunction) {.
    importcpp: "EnableOpacityMappingOn",
    header: "vtkDiscretizableColorTransferFunction.h".}
proc EnableOpacityMappingOff*(this: var vtkDiscretizableColorTransferFunction) {.
    importcpp: "EnableOpacityMappingOff",
    header: "vtkDiscretizableColorTransferFunction.h".}
  ## /@}
  ## *
  ##  Overridden to include the ScalarOpacityFunction's MTime.
  ##
proc GetMTime*(this: var vtkDiscretizableColorTransferFunction): vtkMTimeType {.
    importcpp: "GetMTime", header: "vtkDiscretizableColorTransferFunction.h".}
## !!!Ignored construct:  template < template < class > class VectorGetter > [end of template] void AllTypesMapVectorToOpacity ( int scalarType , void * scalarsPtr , int component , int numberOfComponents , vtkIdType numberOfTuples , unsigned char * colors ) ;
## Error: token expected: > [end of template] but got: [identifier]!!!
