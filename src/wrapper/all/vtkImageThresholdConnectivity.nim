## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageThresholdConnectivity.h
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
##  @class   vtkImageThresholdConnectivity
##  @brief   Flood fill an image region.
##
##  vtkImageThresholdConnectivity will perform a flood fill on an image,
##  given upper and lower pixel intensity thresholds. It works similarly
##  to vtkImageThreshold, but also allows the user to set seed points
##  to limit the threshold operation to contiguous regions of the image.
##  The filled region, or the "inside", will be passed through to the
##  output by default, while the "outside" will be replaced with zeros.
##  This behavior can be changed by using the ReplaceIn() and ReplaceOut()
##  methods.  The scalar type of the output is the same as the input.
##  @sa
##  vtkImageThreshold
##  @par Thanks:
##  Thanks to David Gobbi for contributing this class to VTK.
##

import
  vtkImageAlgorithm, vtkImagingMorphologicalModule

discard "forward decl of vtkPoints"
discard "forward decl of vtkImageData"
discard "forward decl of vtkImageStencilData"
type
  vtkImageThresholdConnectivity* {.importcpp: "vtkImageThresholdConnectivity",
                                  header: "vtkImageThresholdConnectivity.h",
                                  bycopy.} = object of vtkImageAlgorithm
    vtkImageThresholdConnectivity* {.importc: "vtkImageThresholdConnectivity".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageThresholdConnectivity {.
    importcpp: "vtkImageThresholdConnectivity::New(@)",
    header: "vtkImageThresholdConnectivity.h".}
type
  vtkImageThresholdConnectivitySuperclass* = vtkImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageThresholdConnectivity::IsTypeOf(@)",
    header: "vtkImageThresholdConnectivity.h".}
proc IsA*(this: var vtkImageThresholdConnectivity; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageThresholdConnectivity.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageThresholdConnectivity {.
    importcpp: "vtkImageThresholdConnectivity::SafeDownCast(@)",
    header: "vtkImageThresholdConnectivity.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageThresholdConnectivity :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageThresholdConnectivity :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageThresholdConnectivity :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageThresholdConnectivity; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkImageThresholdConnectivity.h".}
proc SetSeedPoints*(this: var vtkImageThresholdConnectivity; points: ptr vtkPoints) {.
    importcpp: "SetSeedPoints", header: "vtkImageThresholdConnectivity.h".}
proc GetnameSeedPoints*(this: var vtkImageThresholdConnectivity): ptr vtkPoints {.
    importcpp: "GetnameSeedPoints", header: "vtkImageThresholdConnectivity.h".}
  ## /@}
  ## *
  ##  Values greater than or equal to this threshold will be filled.
  ##
proc ThresholdByUpper*(this: var vtkImageThresholdConnectivity; thresh: cdouble) {.
    importcpp: "ThresholdByUpper", header: "vtkImageThresholdConnectivity.h".}
proc ThresholdByLower*(this: var vtkImageThresholdConnectivity; thresh: cdouble) {.
    importcpp: "ThresholdByLower", header: "vtkImageThresholdConnectivity.h".}
proc ThresholdBetween*(this: var vtkImageThresholdConnectivity; lower: cdouble;
                      upper: cdouble) {.importcpp: "ThresholdBetween",
                                      header: "vtkImageThresholdConnectivity.h".}
proc SetReplaceIn*(this: var vtkImageThresholdConnectivity; _arg: vtkTypeBool) {.
    importcpp: "SetReplaceIn", header: "vtkImageThresholdConnectivity.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetReplaceIn ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReplaceIn  of  << this -> ReplaceIn ) ; return this -> ReplaceIn ; } ;
## Error: expected ';'!!!

proc ReplaceInOn*(this: var vtkImageThresholdConnectivity) {.
    importcpp: "ReplaceInOn", header: "vtkImageThresholdConnectivity.h".}
proc ReplaceInOff*(this: var vtkImageThresholdConnectivity) {.
    importcpp: "ReplaceInOff", header: "vtkImageThresholdConnectivity.h".}
  ## /@}
  ## /@{
  ## *
  ##  If ReplaceIn is set, the filled region will be replaced by this value.
  ##
proc SetInValue*(this: var vtkImageThresholdConnectivity; val: cdouble) {.
    importcpp: "SetInValue", header: "vtkImageThresholdConnectivity.h".}
## !!!Ignored construct:  virtual double GetReplaceInInValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InValue  of  << this -> InValue ) ; return this -> InValue ; } ;
## Error: expected ';'!!!

proc SetReplaceInReplaceOut*(this: var vtkImageThresholdConnectivity;
                            _arg: vtkTypeBool) {.
    importcpp: "SetReplaceInReplaceOut", header: "vtkImageThresholdConnectivity.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetReplaceInInValueReplaceOut ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReplaceOut  of  << this -> ReplaceOut ) ; return this -> ReplaceOut ; } ;
## Error: expected ';'!!!

proc ReplaceOutOn*(this: var vtkImageThresholdConnectivity) {.
    importcpp: "ReplaceOutOn", header: "vtkImageThresholdConnectivity.h".}
proc ReplaceOutOff*(this: var vtkImageThresholdConnectivity) {.
    importcpp: "ReplaceOutOff", header: "vtkImageThresholdConnectivity.h".}
  ## /@}
  ## /@{
  ## *
  ##  If ReplaceOut is set, outside the fill will be replaced by this value.
  ##
proc SetOutValue*(this: var vtkImageThresholdConnectivity; val: cdouble) {.
    importcpp: "SetOutValue", header: "vtkImageThresholdConnectivity.h".}
## !!!Ignored construct:  virtual double GetReplaceInInValueReplaceOutOutValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutValue  of  << this -> OutValue ) ; return this -> OutValue ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get the Upper and Lower thresholds.
##  virtual double GetReplaceInInValueReplaceOutOutValueUpperThresholdUpperThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UpperThreshold  of  << this -> UpperThreshold ) ; return this -> UpperThreshold ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual double GetReplaceInInValueReplaceOutOutValueUpperThresholdUpperThresholdLowerThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LowerThreshold  of  << this -> LowerThreshold ) ; return this -> LowerThreshold ; } ;
## Error: expected ';'!!!

proc SetSliceRangeX*(this: var vtkImageThresholdConnectivity; _arg1: cint; _arg2: cint) {.
    importcpp: "SetSliceRangeX", header: "vtkImageThresholdConnectivity.h".}
proc SetSliceRangeX*(this: var vtkImageThresholdConnectivity; _arg: array[2, cint]) {.
    importcpp: "SetSliceRangeX", header: "vtkImageThresholdConnectivity.h".}
## !!!Ignored construct:  virtual int * GetSliceRangeX ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << SliceRangeX  pointer  << this -> SliceRangeX ) ; return this -> SliceRangeX ; } VTK_WRAPEXCLUDE virtual void GetSliceRangeX ( int & _arg1 , int & _arg2 ) { _arg1 = this -> SliceRangeX [ 0 ] ; _arg2 = this -> SliceRangeX [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << SliceRangeX  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetSliceRangeX ( int _arg [ 2 ] ) { this -> GetSliceRangeX ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetSliceRangeXSliceRangeY*(this: var vtkImageThresholdConnectivity;
                               _arg1: cint; _arg2: cint) {.
    importcpp: "SetSliceRangeXSliceRangeY",
    header: "vtkImageThresholdConnectivity.h".}
proc SetSliceRangeXSliceRangeY*(this: var vtkImageThresholdConnectivity;
                               _arg: array[2, cint]) {.
    importcpp: "SetSliceRangeXSliceRangeY",
    header: "vtkImageThresholdConnectivity.h".}
## !!!Ignored construct:  virtual int * GetSliceRangeXSliceRangeY ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << SliceRangeY  pointer  << this -> SliceRangeY ) ; return this -> SliceRangeY ; } VTK_WRAPEXCLUDE virtual void GetSliceRangeXSliceRangeY ( int & _arg1 , int & _arg2 ) { _arg1 = this -> SliceRangeY [ 0 ] ; _arg2 = this -> SliceRangeY [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << SliceRangeY  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetSliceRangeXSliceRangeY ( int _arg [ 2 ] ) { this -> GetSliceRangeXSliceRangeY ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetSliceRangeXSliceRangeYSliceRangeZ*(
    this: var vtkImageThresholdConnectivity; _arg1: cint; _arg2: cint) {.
    importcpp: "SetSliceRangeXSliceRangeYSliceRangeZ",
    header: "vtkImageThresholdConnectivity.h".}
proc SetSliceRangeXSliceRangeYSliceRangeZ*(
    this: var vtkImageThresholdConnectivity; _arg: array[2, cint]) {.
    importcpp: "SetSliceRangeXSliceRangeYSliceRangeZ",
    header: "vtkImageThresholdConnectivity.h".}
## !!!Ignored construct:  virtual int * GetSliceRangeXSliceRangeYSliceRangeZ ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << SliceRangeZ  pointer  << this -> SliceRangeZ ) ; return this -> SliceRangeZ ; } VTK_WRAPEXCLUDE virtual void GetSliceRangeXSliceRangeYSliceRangeZ ( int & _arg1 , int & _arg2 ) { _arg1 = this -> SliceRangeZ [ 0 ] ; _arg2 = this -> SliceRangeZ [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << SliceRangeZ  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetSliceRangeXSliceRangeYSliceRangeZ ( int _arg [ 2 ] ) { this -> GetSliceRangeXSliceRangeYSliceRangeZ ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetStencilData*(this: var vtkImageThresholdConnectivity;
                    stencil: ptr vtkImageStencilData) {.
    importcpp: "SetStencilData", header: "vtkImageThresholdConnectivity.h".}
proc GetStencil*(this: var vtkImageThresholdConnectivity): ptr vtkImageStencilData {.
    importcpp: "GetStencil", header: "vtkImageThresholdConnectivity.h".}
proc SetReplaceInReplaceOutActiveComponent*(
    this: var vtkImageThresholdConnectivity; _arg: cint) {.
    importcpp: "SetReplaceInReplaceOutActiveComponent",
    header: "vtkImageThresholdConnectivity.h".}
## !!!Ignored construct:  virtual int GetReplaceInInValueReplaceOutOutValueUpperThresholdUpperThresholdLowerThresholdActiveComponent ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ActiveComponent  of  << this -> ActiveComponent ) ; return this -> ActiveComponent ; } ;
## Error: expected ';'!!!

proc SetNeighborhoodRadius*(this: var vtkImageThresholdConnectivity; _arg1: cdouble;
                           _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetNeighborhoodRadius", header: "vtkImageThresholdConnectivity.h".}
proc SetNeighborhoodRadius*(this: var vtkImageThresholdConnectivity;
                           _arg: array[3, cdouble]) {.
    importcpp: "SetNeighborhoodRadius", header: "vtkImageThresholdConnectivity.h".}
## !!!Ignored construct:  virtual double * GetNeighborhoodRadius ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << NeighborhoodRadius  pointer  << this -> NeighborhoodRadius ) ; return this -> NeighborhoodRadius ; } VTK_WRAPEXCLUDE virtual void GetNeighborhoodRadius ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> NeighborhoodRadius [ 0 ] ; _arg2 = this -> NeighborhoodRadius [ 1 ] ; _arg3 = this -> NeighborhoodRadius [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << NeighborhoodRadius  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetNeighborhoodRadius ( double _arg [ 3 ] ) { this -> GetNeighborhoodRadius ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetNeighborhoodFraction*(this: var vtkImageThresholdConnectivity; _arg: cdouble) {.
    importcpp: "SetNeighborhoodFraction",
    header: "vtkImageThresholdConnectivity.h".}
proc GetNeighborhoodFractionMinValue*(this: var vtkImageThresholdConnectivity): cdouble {.
    importcpp: "GetNeighborhoodFractionMinValue",
    header: "vtkImageThresholdConnectivity.h".}
proc GetNeighborhoodFractionMaxValue*(this: var vtkImageThresholdConnectivity): cdouble {.
    importcpp: "GetNeighborhoodFractionMaxValue",
    header: "vtkImageThresholdConnectivity.h".}
## !!!Ignored construct:  virtual double GetReplaceInInValueReplaceOutOutValueUpperThresholdUpperThresholdLowerThresholdActiveComponentNeighborhoodFraction ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NeighborhoodFraction  of  << this -> NeighborhoodFraction ) ; return this -> NeighborhoodFraction ; } ;
## Error: expected ';'!!!

proc GetMTime*(this: var vtkImageThresholdConnectivity): vtkMTimeType {.
    importcpp: "GetMTime", header: "vtkImageThresholdConnectivity.h".}
## !!!Ignored construct:  /@{ *
##  After the filter has executed, use GetNumberOfVoxels() to find
##  out how many voxels were filled.
##  virtual int GetReplaceInInValueReplaceOutOutValueUpperThresholdUpperThresholdLowerThresholdActiveComponentNeighborhoodFractionNumberOfInVoxelsNumberOfInVoxels ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfInVoxels  of  << this -> NumberOfInVoxels ) ; return this -> NumberOfInVoxels ; } ;
## Error: expected ';'!!!
