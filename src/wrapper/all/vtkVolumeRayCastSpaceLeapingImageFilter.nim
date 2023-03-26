## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFixedPointVolumeRayCastMapper.h
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
##  @class   vtkVolumeRayCastSpaceLeapingImageFilter
##  @brief   Builds the space leaping data structure.
##
##  This is an optimized multi-threaded imaging filter that builds the space
##  leaping datastructure, used by vtkFixedPointVolumeRayCastMapper. Empty
##  space leaping is used to skip large empty regions in the scalar
##  opacity and/or the gradient opacity transfer functions. Depending on
##  the various options set by vtkFixedPointVolumeRayCastMapper, the class
##  will internally invoke one of the many optimized routines to compute the
##  min/max/gradient-max values within a fixed block size, trying to
##  compute everything in a single multi-threaded pass through the data
##
##  The block size may be changed at compile time. Its ifdef'ed to 4 in the CXX
##  file.
##

import
  vtkRenderingVolumeModule, vtkThreadedImageAlgorithm

discard "forward decl of vtkDataArray"
type
  vtkVolumeRayCastSpaceLeapingImageFilter* {.
      importcpp: "vtkVolumeRayCastSpaceLeapingImageFilter",
      header: "vtkVolumeRayCastSpaceLeapingImageFilter.h", bycopy.} = object of vtkThreadedImageAlgorithm
    vtkVolumeRayCastSpaceLeapingImageFilter*
        {.importc: "vtkVolumeRayCastSpaceLeapingImageFilter".}: VTK_NEWINSTANCE

  vtkVolumeRayCastSpaceLeapingImageFilterSuperclass* = vtkThreadedImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkVolumeRayCastSpaceLeapingImageFilter::IsTypeOf(@)",
    header: "vtkVolumeRayCastSpaceLeapingImageFilter.h".}
proc IsA*(this: var vtkVolumeRayCastSpaceLeapingImageFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkVolumeRayCastSpaceLeapingImageFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkVolumeRayCastSpaceLeapingImageFilter {.
    importcpp: "vtkVolumeRayCastSpaceLeapingImageFilter::SafeDownCast(@)",
    header: "vtkVolumeRayCastSpaceLeapingImageFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkVolumeRayCastSpaceLeapingImageFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkVolumeRayCastSpaceLeapingImageFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkVolumeRayCastSpaceLeapingImageFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkVolumeRayCastSpaceLeapingImageFilter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkVolumeRayCastSpaceLeapingImageFilter.h".}
proc New*(): ptr vtkVolumeRayCastSpaceLeapingImageFilter {.
    importcpp: "vtkVolumeRayCastSpaceLeapingImageFilter::New(@)",
    header: "vtkVolumeRayCastSpaceLeapingImageFilter.h".}
proc SetCurrentScalars*(this: var vtkVolumeRayCastSpaceLeapingImageFilter;
                       a2: ptr vtkDataArray) {.importcpp: "SetCurrentScalars",
    header: "vtkVolumeRayCastSpaceLeapingImageFilter.h".}
proc GetnameCurrentScalars*(this: var vtkVolumeRayCastSpaceLeapingImageFilter): ptr vtkDataArray {.
    importcpp: "GetnameCurrentScalars",
    header: "vtkVolumeRayCastSpaceLeapingImageFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Do we use independent components, or dependent components ?
  ##
proc SetIndependentComponents*(this: var vtkVolumeRayCastSpaceLeapingImageFilter;
                              _arg: cint) {.importcpp: "SetIndependentComponents",
    header: "vtkVolumeRayCastSpaceLeapingImageFilter.h".}
## !!!Ignored construct:  virtual int GetIndependentComponents ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IndependentComponents  of  << this -> IndependentComponents ) ; return this -> IndependentComponents ; } ;
## Error: expected ';'!!!

proc SetIndependentComponentsComputeGradientOpacity*(
    this: var vtkVolumeRayCastSpaceLeapingImageFilter; _arg: vtkTypeBool) {.
    importcpp: "SetIndependentComponentsComputeGradientOpacity",
    header: "vtkVolumeRayCastSpaceLeapingImageFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetIndependentComponentsComputeGradientOpacity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeGradientOpacity  of  << this -> ComputeGradientOpacity ) ; return this -> ComputeGradientOpacity ; } ;
## Error: expected ';'!!!

proc ComputeGradientOpacityOn*(this: var vtkVolumeRayCastSpaceLeapingImageFilter) {.
    importcpp: "ComputeGradientOpacityOn",
    header: "vtkVolumeRayCastSpaceLeapingImageFilter.h".}
proc ComputeGradientOpacityOff*(this: var vtkVolumeRayCastSpaceLeapingImageFilter) {.
    importcpp: "ComputeGradientOpacityOff",
    header: "vtkVolumeRayCastSpaceLeapingImageFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Compute the min max structure ?.
  ##
proc SetIndependentComponentsComputeGradientOpacityComputeMinMax*(
    this: var vtkVolumeRayCastSpaceLeapingImageFilter; _arg: vtkTypeBool) {.
    importcpp: "SetIndependentComponentsComputeGradientOpacityComputeMinMax",
    header: "vtkVolumeRayCastSpaceLeapingImageFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetIndependentComponentsComputeGradientOpacityComputeMinMax ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeMinMax  of  << this -> ComputeMinMax ) ; return this -> ComputeMinMax ; } ;
## Error: expected ';'!!!

proc ComputeMinMaxOn*(this: var vtkVolumeRayCastSpaceLeapingImageFilter) {.
    importcpp: "ComputeMinMaxOn",
    header: "vtkVolumeRayCastSpaceLeapingImageFilter.h".}
proc ComputeMinMaxOff*(this: var vtkVolumeRayCastSpaceLeapingImageFilter) {.
    importcpp: "ComputeMinMaxOff",
    header: "vtkVolumeRayCastSpaceLeapingImageFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Update the gradient opacity flags. (The scalar opacity flags are always
  ##  updated upon execution of this filter.)
  ##
proc SetIndependentComponentsComputeGradientOpacityComputeMinMaxUpdateGradientOpacityFlags*(
    this: var vtkVolumeRayCastSpaceLeapingImageFilter; _arg: vtkTypeBool) {.importcpp: "SetIndependentComponentsComputeGradientOpacityComputeMinMaxUpdateGradientOpacityFlags",
    header: "vtkVolumeRayCastSpaceLeapingImageFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetIndependentComponentsComputeGradientOpacityComputeMinMaxUpdateGradientOpacityFlags ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UpdateGradientOpacityFlags  of  << this -> UpdateGradientOpacityFlags ) ; return this -> UpdateGradientOpacityFlags ; } ;
## Error: expected ';'!!!

proc UpdateGradientOpacityFlagsOn*(this: var vtkVolumeRayCastSpaceLeapingImageFilter) {.
    importcpp: "UpdateGradientOpacityFlagsOn",
    header: "vtkVolumeRayCastSpaceLeapingImageFilter.h".}
proc UpdateGradientOpacityFlagsOff*(this: var vtkVolumeRayCastSpaceLeapingImageFilter) {.
    importcpp: "UpdateGradientOpacityFlagsOff",
    header: "vtkVolumeRayCastSpaceLeapingImageFilter.h".}
  ## /@}
  ## *
  ##  Get the last execution time. This is updated every
  ##  time the scalars or the gradient opacity values are computed
  ##
proc GetLastMinMaxBuildTime*(this: var vtkVolumeRayCastSpaceLeapingImageFilter): vtkMTimeType {.
    importcpp: "GetLastMinMaxBuildTime",
    header: "vtkVolumeRayCastSpaceLeapingImageFilter.h".}
proc GetLastMinMaxFlagTime*(this: var vtkVolumeRayCastSpaceLeapingImageFilter): vtkMTimeType {.
    importcpp: "GetLastMinMaxFlagTime",
    header: "vtkVolumeRayCastSpaceLeapingImageFilter.h".}
proc SetTableShift*(this: var vtkVolumeRayCastSpaceLeapingImageFilter;
                   _arg1: cfloat; _arg2: cfloat; _arg3: cfloat; _arg4: cfloat) {.
    importcpp: "SetTableShift",
    header: "vtkVolumeRayCastSpaceLeapingImageFilter.h".}
proc SetTableShift*(this: var vtkVolumeRayCastSpaceLeapingImageFilter;
                   _arg: array[4, cfloat]) {.importcpp: "SetTableShift",
    header: "vtkVolumeRayCastSpaceLeapingImageFilter.h".}
## !!!Ignored construct:  virtual float * GetTableShift ( ) VTK_SIZEHINT ( 4 ) { vtkDebugWithObjectMacro ( this , <<  returning  << TableShift  pointer  << this -> TableShift ) ; return this -> TableShift ; } VTK_WRAPEXCLUDE virtual void GetTableShift ( float & _arg1 , float & _arg2 , float & _arg3 , float & _arg4 ) { _arg1 = this -> TableShift [ 0 ] ; _arg2 = this -> TableShift [ 1 ] ; _arg3 = this -> TableShift [ 2 ] ; _arg4 = this -> TableShift [ 3 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << TableShift  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetTableShift ( float _arg [ 4 ] ) { this -> GetTableShift ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ;
## Error: expected ';'!!!

proc SetTableShiftTableScale*(this: var vtkVolumeRayCastSpaceLeapingImageFilter;
                             _arg1: cfloat; _arg2: cfloat; _arg3: cfloat;
                             _arg4: cfloat) {.
    importcpp: "SetTableShiftTableScale",
    header: "vtkVolumeRayCastSpaceLeapingImageFilter.h".}
proc SetTableShiftTableScale*(this: var vtkVolumeRayCastSpaceLeapingImageFilter;
                             _arg: array[4, cfloat]) {.
    importcpp: "SetTableShiftTableScale",
    header: "vtkVolumeRayCastSpaceLeapingImageFilter.h".}
## !!!Ignored construct:  virtual float * GetTableShiftTableScale ( ) VTK_SIZEHINT ( 4 ) { vtkDebugWithObjectMacro ( this , <<  returning  << TableScale  pointer  << this -> TableScale ) ; return this -> TableScale ; } VTK_WRAPEXCLUDE virtual void GetTableShiftTableScale ( float & _arg1 , float & _arg2 , float & _arg3 , float & _arg4 ) { _arg1 = this -> TableScale [ 0 ] ; _arg2 = this -> TableScale [ 1 ] ; _arg3 = this -> TableScale [ 2 ] ; _arg4 = this -> TableScale [ 3 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << TableScale  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetTableShiftTableScale ( float _arg [ 4 ] ) { this -> GetTableShiftTableScale ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ;
## Error: expected ';'!!!

proc SetTableShiftTableScaleTableSize*(this: var vtkVolumeRayCastSpaceLeapingImageFilter;
                                      _arg1: cint; _arg2: cint; _arg3: cint;
                                      _arg4: cint) {.
    importcpp: "SetTableShiftTableScaleTableSize",
    header: "vtkVolumeRayCastSpaceLeapingImageFilter.h".}
proc SetTableShiftTableScaleTableSize*(this: var vtkVolumeRayCastSpaceLeapingImageFilter;
                                      _arg: array[4, cint]) {.
    importcpp: "SetTableShiftTableScaleTableSize",
    header: "vtkVolumeRayCastSpaceLeapingImageFilter.h".}
## !!!Ignored construct:  virtual int * GetTableShiftTableScaleTableSize ( ) VTK_SIZEHINT ( 4 ) { vtkDebugWithObjectMacro ( this , <<  returning  << TableSize  pointer  << this -> TableSize ) ; return this -> TableSize ; } VTK_WRAPEXCLUDE virtual void GetTableShiftTableScaleTableSize ( int & _arg1 , int & _arg2 , int & _arg3 , int & _arg4 ) { _arg1 = this -> TableSize [ 0 ] ; _arg2 = this -> TableSize [ 1 ] ; _arg3 = this -> TableSize [ 2 ] ; _arg4 = this -> TableSize [ 3 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << TableSize  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetTableShiftTableScaleTableSize ( int _arg [ 4 ] ) { this -> GetTableShiftTableScaleTableSize ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ;
## Error: expected ';'!!!

proc GetNumberOfIndependentComponents*(this: var vtkVolumeRayCastSpaceLeapingImageFilter): cint {.
    importcpp: "GetNumberOfIndependentComponents",
    header: "vtkVolumeRayCastSpaceLeapingImageFilter.h".}
proc GetMinMaxVolume*(this: var vtkVolumeRayCastSpaceLeapingImageFilter;
                     dims: array[4, cint]): ptr cushort {.
    importcpp: "GetMinMaxVolume",
    header: "vtkVolumeRayCastSpaceLeapingImageFilter.h".}
proc SetCache*(this: var vtkVolumeRayCastSpaceLeapingImageFilter;
              imageCache: ptr vtkImageData) {.importcpp: "SetCache",
    header: "vtkVolumeRayCastSpaceLeapingImageFilter.h".}
proc ComputeInputExtentsForOutput*(inExt: array[6, cint]; inDim: array[3, cint];
                                  outExt: array[6, cint]; inData: ptr vtkImageData) {.importcpp: "vtkVolumeRayCastSpaceLeapingImageFilter::ComputeInputExtentsForOutput(@)",
    header: "vtkVolumeRayCastSpaceLeapingImageFilter.h".}
proc GetMinNonZeroScalarIndex*(this: var vtkVolumeRayCastSpaceLeapingImageFilter): ptr cushort {.
    importcpp: "GetMinNonZeroScalarIndex",
    header: "vtkVolumeRayCastSpaceLeapingImageFilter.h".}
proc GetMinNonZeroGradientMagnitudeIndex*(
    this: var vtkVolumeRayCastSpaceLeapingImageFilter): ptr cuchar {.
    importcpp: "GetMinNonZeroGradientMagnitudeIndex",
    header: "vtkVolumeRayCastSpaceLeapingImageFilter.h".}
proc SetGradientMagnitude*(this: var vtkVolumeRayCastSpaceLeapingImageFilter;
                          gradientMagnitude: ptr ptr cuchar) {.
    importcpp: "SetGradientMagnitude",
    header: "vtkVolumeRayCastSpaceLeapingImageFilter.h".}
proc GetGradientMagnitude*(this: var vtkVolumeRayCastSpaceLeapingImageFilter): ptr ptr cuchar {.
    importcpp: "GetGradientMagnitude",
    header: "vtkVolumeRayCastSpaceLeapingImageFilter.h".}
proc SetScalarOpacityTable*(this: var vtkVolumeRayCastSpaceLeapingImageFilter;
                           c: cint; t: ptr cushort) {.
    importcpp: "SetScalarOpacityTable",
    header: "vtkVolumeRayCastSpaceLeapingImageFilter.h".}
proc SetGradientOpacityTable*(this: var vtkVolumeRayCastSpaceLeapingImageFilter;
                             c: cint; t: ptr cushort) {.
    importcpp: "SetGradientOpacityTable",
    header: "vtkVolumeRayCastSpaceLeapingImageFilter.h".}
proc ComputeOffset*(this: var vtkVolumeRayCastSpaceLeapingImageFilter;
                   ext: array[6, cint]; wholeExt: array[6, cint]; nComponents: cint): vtkIdType {.
    importcpp: "ComputeOffset",
    header: "vtkVolumeRayCastSpaceLeapingImageFilter.h".}