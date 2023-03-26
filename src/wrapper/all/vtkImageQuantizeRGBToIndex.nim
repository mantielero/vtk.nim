## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageQuantizeRGBToIndex.h
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
##  @class   vtkImageQuantizeRGBToIndex
##  @brief   generalized histograms up to 4 dimensions
##
##  vtkImageQuantizeRGBToIndex takes a 3 component RGB image as
##  input and produces a one component index image as output, along with
##  a lookup table that contains the color definitions for the index values.
##  This filter works on the entire input extent - it does not perform
##  streaming, and it does not supported threaded execution (because it has
##  to process the entire image).
##
##  To use this filter, you typically set the number of colors
##  (between 2 and 65536), execute it, and then retrieve the lookup table.
##  The colors can then be using the lookup table and the image index.
##
##  This filter can run faster, by initially sampling the colors at a
##  coarser level. This can be specified by the SamplingRate parameter.
##
##  The "index-image" viewed as a greyscale image, is usually quite
##  arbitrary, accentuating contrast where none can be perceived in
##  the original color image.
##  To make the index image more meaningful (e.g. for image segmentation
##  operating on scalar images), we sort the mean colors by luminance
##  and re-map the indices accordingly. This option does not introduce any
##  computational complexity and has no impact on actual colors in the
##  lookup table (only their order).
##

import
  vtkImageAlgorithm, vtkImagingColorModule

discard "forward decl of vtkLookupTable"
type
  vtkImageQuantizeRGBToIndex* {.importcpp: "vtkImageQuantizeRGBToIndex",
                               header: "vtkImageQuantizeRGBToIndex.h", bycopy.} = object of vtkImageAlgorithm
    vtkImageQuantizeRGBToIndex* {.importc: "vtkImageQuantizeRGBToIndex".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageQuantizeRGBToIndex {.
    importcpp: "vtkImageQuantizeRGBToIndex::New(@)",
    header: "vtkImageQuantizeRGBToIndex.h".}
type
  vtkImageQuantizeRGBToIndexSuperclass* = vtkImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageQuantizeRGBToIndex::IsTypeOf(@)",
    header: "vtkImageQuantizeRGBToIndex.h".}
proc IsA*(this: var vtkImageQuantizeRGBToIndex; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageQuantizeRGBToIndex.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageQuantizeRGBToIndex {.
    importcpp: "vtkImageQuantizeRGBToIndex::SafeDownCast(@)",
    header: "vtkImageQuantizeRGBToIndex.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageQuantizeRGBToIndex :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageQuantizeRGBToIndex :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageQuantizeRGBToIndex :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageQuantizeRGBToIndex; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkImageQuantizeRGBToIndex.h".}
proc SetNumberOfColors*(this: var vtkImageQuantizeRGBToIndex; _arg: cint) {.
    importcpp: "SetNumberOfColors", header: "vtkImageQuantizeRGBToIndex.h".}
proc GetNumberOfColorsMinValue*(this: var vtkImageQuantizeRGBToIndex): cint {.
    importcpp: "GetNumberOfColorsMinValue", header: "vtkImageQuantizeRGBToIndex.h".}
proc GetNumberOfColorsMaxValue*(this: var vtkImageQuantizeRGBToIndex): cint {.
    importcpp: "GetNumberOfColorsMaxValue", header: "vtkImageQuantizeRGBToIndex.h".}
## !!!Ignored construct:  virtual int GetNumberOfColors ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfColors  of  << this -> NumberOfColors ) ; return this -> NumberOfColors ; } ;
## Error: expected ';'!!!

proc SetSamplingRate*(this: var vtkImageQuantizeRGBToIndex; _arg1: cint; _arg2: cint;
                     _arg3: cint) {.importcpp: "SetSamplingRate",
                                  header: "vtkImageQuantizeRGBToIndex.h".}
proc SetSamplingRate*(this: var vtkImageQuantizeRGBToIndex; _arg: array[3, cint]) {.
    importcpp: "SetSamplingRate", header: "vtkImageQuantizeRGBToIndex.h".}
## !!!Ignored construct:  virtual int * GetSamplingRate ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << SamplingRate  pointer  << this -> SamplingRate ) ; return this -> SamplingRate ; } VTK_WRAPEXCLUDE virtual void GetSamplingRate ( int & _arg1 , int & _arg2 , int & _arg3 ) { _arg1 = this -> SamplingRate [ 0 ] ; _arg2 = this -> SamplingRate [ 1 ] ; _arg3 = this -> SamplingRate [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << SamplingRate  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetSamplingRate ( int _arg [ 3 ] ) { this -> GetSamplingRate ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetSortIndexByLuminance*(this: var vtkImageQuantizeRGBToIndex; _arg: bool) {.
    importcpp: "SetSortIndexByLuminance", header: "vtkImageQuantizeRGBToIndex.h".}
## !!!Ignored construct:  virtual bool GetNumberOfColorsSortIndexByLuminance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SortIndexByLuminance  of  << this -> SortIndexByLuminance ) ; return this -> SortIndexByLuminance ; } ;
## Error: expected ';'!!!

proc SortIndexByLuminanceOn*(this: var vtkImageQuantizeRGBToIndex) {.
    importcpp: "SortIndexByLuminanceOn", header: "vtkImageQuantizeRGBToIndex.h".}
proc SortIndexByLuminanceOff*(this: var vtkImageQuantizeRGBToIndex) {.
    importcpp: "SortIndexByLuminanceOff", header: "vtkImageQuantizeRGBToIndex.h".}
  ## /@{
  ## *
  ##  Get the resulting lookup table that contains the color definitions
  ##  corresponding to the index values in the output image.
  ##
proc GetnameLookupTable*(this: var vtkImageQuantizeRGBToIndex): ptr vtkLookupTable {.
    importcpp: "GetnameLookupTable", header: "vtkImageQuantizeRGBToIndex.h".}
  ## /@}
## !!!Ignored construct:  virtual double GetNumberOfColorsSortIndexByLuminanceInitializeExecuteTime ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InitializeExecuteTime  of  << this -> InitializeExecuteTime ) ; return this -> InitializeExecuteTime ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual double GetNumberOfColorsSortIndexByLuminanceInitializeExecuteTimeBuildTreeExecuteTime ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BuildTreeExecuteTime  of  << this -> BuildTreeExecuteTime ) ; return this -> BuildTreeExecuteTime ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual double GetNumberOfColorsSortIndexByLuminanceInitializeExecuteTimeBuildTreeExecuteTimeLookupIndexExecuteTime ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LookupIndexExecuteTime  of  << this -> LookupIndexExecuteTime ) ; return this -> LookupIndexExecuteTime ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@{ *
##  For internal use only - get the type of the image
##  virtual int GetNumberOfColorsSortIndexByLuminanceInitializeExecuteTimeBuildTreeExecuteTimeLookupIndexExecuteTimeInputTypeInputType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InputType  of  << this -> InputType ) ; return this -> InputType ; } ;
## Error: expected ';'!!!

proc SetSortIndexByLuminanceInitializeExecuteTime*(
    this: var vtkImageQuantizeRGBToIndex; _arg: cdouble) {.
    importcpp: "SetSortIndexByLuminanceInitializeExecuteTime",
    header: "vtkImageQuantizeRGBToIndex.h".}
proc SetSortIndexByLuminanceInitializeExecuteTimeBuildTreeExecuteTime*(
    this: var vtkImageQuantizeRGBToIndex; _arg: cdouble) {.importcpp: "SetSortIndexByLuminanceInitializeExecuteTimeBuildTreeExecuteTime",
    header: "vtkImageQuantizeRGBToIndex.h".}
proc SetSortIndexByLuminanceInitializeExecuteTimeBuildTreeExecuteTimeLookupIndexExecuteTime*(
    this: var vtkImageQuantizeRGBToIndex; _arg: cdouble) {.importcpp: "SetSortIndexByLuminanceInitializeExecuteTimeBuildTreeExecuteTimeLookupIndexExecuteTime",
    header: "vtkImageQuantizeRGBToIndex.h".}
  ## /@}