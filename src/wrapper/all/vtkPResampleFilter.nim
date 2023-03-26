## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPResampleFilter.h
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
##  @class   vtkPResampleFilter
##  @brief   probe dataset in parallel using a vtkImageData
##
##

import
  vtkFiltersParallelModule, vtkImageAlgorithm

discard "forward decl of vtkMultiProcessController"
type
  vtkPResampleFilter* {.importcpp: "vtkPResampleFilter",
                       header: "vtkPResampleFilter.h", bycopy.} = object of vtkImageAlgorithm
    vtkPResampleFilter* {.importc: "vtkPResampleFilter".}: VTK_NEWINSTANCE

  vtkPResampleFilterSuperclass* = vtkImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPResampleFilter::IsTypeOf(@)", header: "vtkPResampleFilter.h".}
proc IsA*(this: var vtkPResampleFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPResampleFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPResampleFilter {.
    importcpp: "vtkPResampleFilter::SafeDownCast(@)",
    header: "vtkPResampleFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPResampleFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPResampleFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPResampleFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPResampleFilter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPResampleFilter.h".}
proc New*(): ptr vtkPResampleFilter {.importcpp: "vtkPResampleFilter::New(@)",
                                  header: "vtkPResampleFilter.h".}
proc SetController*(this: var vtkPResampleFilter; a2: ptr vtkMultiProcessController) {.
    importcpp: "SetController", header: "vtkPResampleFilter.h".}
proc GetnameController*(this: var vtkPResampleFilter): ptr vtkMultiProcessController {.
    importcpp: "GetnameController", header: "vtkPResampleFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get if the filter should use Input bounds to sub-sample the data.
  ##  By default it is set to 1.
  ##
proc SetUseInputBounds*(this: var vtkPResampleFilter; _arg: vtkTypeBool) {.
    importcpp: "SetUseInputBounds", header: "vtkPResampleFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetUseInputBounds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseInputBounds  of  << this -> UseInputBounds ) ; return this -> UseInputBounds ; } ;
## Error: expected ';'!!!

proc UseInputBoundsOn*(this: var vtkPResampleFilter) {.
    importcpp: "UseInputBoundsOn", header: "vtkPResampleFilter.h".}
proc UseInputBoundsOff*(this: var vtkPResampleFilter) {.
    importcpp: "UseInputBoundsOff", header: "vtkPResampleFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get sampling bounds. If (UseInputBounds == 1) then the sampling
  ##  bounds won't be used.
  ##
proc SetCustomSamplingBounds*(this: var vtkPResampleFilter; _arg1: cdouble;
                             _arg2: cdouble; _arg3: cdouble; _arg4: cdouble;
                             _arg5: cdouble; _arg6: cdouble) {.
    importcpp: "SetCustomSamplingBounds", header: "vtkPResampleFilter.h".}
proc SetCustomSamplingBounds*(this: var vtkPResampleFilter; _arg: array[6, cdouble]) {.
    importcpp: "SetCustomSamplingBounds", header: "vtkPResampleFilter.h".}
## !!!Ignored construct:  virtual double * GetCustomSamplingBounds ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << CustomSamplingBounds  pointer  << this -> CustomSamplingBounds ) ; return this -> CustomSamplingBounds ; } VTK_WRAPEXCLUDE virtual void GetCustomSamplingBounds ( double & _arg1 , double & _arg2 , double & _arg3 , double & _arg4 , double & _arg5 , double & _arg6 ) { _arg1 = this -> CustomSamplingBounds [ 0 ] ; _arg2 = this -> CustomSamplingBounds [ 1 ] ; _arg3 = this -> CustomSamplingBounds [ 2 ] ; _arg4 = this -> CustomSamplingBounds [ 3 ] ; _arg5 = this -> CustomSamplingBounds [ 4 ] ; _arg6 = this -> CustomSamplingBounds [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << CustomSamplingBounds  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCustomSamplingBounds ( double _arg [ 6 ] ) { this -> GetCustomSamplingBounds ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ;
## Error: expected ';'!!!

proc SetSamplingDimension*(this: var vtkPResampleFilter; _arg1: cint; _arg2: cint;
                          _arg3: cint) {.importcpp: "SetSamplingDimension",
                                       header: "vtkPResampleFilter.h".}
proc SetSamplingDimension*(this: var vtkPResampleFilter; _arg: array[3, cint]) {.
    importcpp: "SetSamplingDimension", header: "vtkPResampleFilter.h".}
## !!!Ignored construct:  virtual int * GetSamplingDimension ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << SamplingDimension  pointer  << this -> SamplingDimension ) ; return this -> SamplingDimension ; } VTK_WRAPEXCLUDE virtual void GetSamplingDimension ( int & _arg1 , int & _arg2 , int & _arg3 ) { _arg1 = this -> SamplingDimension [ 0 ] ; _arg2 = this -> SamplingDimension [ 1 ] ; _arg3 = this -> SamplingDimension [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << SamplingDimension  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetSamplingDimension ( int _arg [ 3 ] ) { this -> GetSamplingDimension ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!
