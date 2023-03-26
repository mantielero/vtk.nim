## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageThreshold.h
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
##  @class   vtkImageThreshold
##  @brief    Flexible threshold
##
##  vtkImageThreshold can do binary or continuous thresholding for lower, upper
##  or a range of data.  The output data type may be different than the
##  output, but defaults to the same type.
##

import
  vtkImagingCoreModule, vtkThreadedImageAlgorithm

type
  vtkImageThreshold* {.importcpp: "vtkImageThreshold",
                      header: "vtkImageThreshold.h", bycopy.} = object of vtkThreadedImageAlgorithm
    vtkImageThreshold* {.importc: "vtkImageThreshold".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageThreshold {.importcpp: "vtkImageThreshold::New(@)",
                                 header: "vtkImageThreshold.h".}
type
  vtkImageThresholdSuperclass* = vtkThreadedImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageThreshold::IsTypeOf(@)", header: "vtkImageThreshold.h".}
proc IsA*(this: var vtkImageThreshold; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageThreshold.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageThreshold {.
    importcpp: "vtkImageThreshold::SafeDownCast(@)", header: "vtkImageThreshold.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageThreshold :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageThreshold :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageThreshold :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageThreshold; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageThreshold.h".}
proc ThresholdByUpper*(this: var vtkImageThreshold; thresh: cdouble) {.
    importcpp: "ThresholdByUpper", header: "vtkImageThreshold.h".}
proc ThresholdByLower*(this: var vtkImageThreshold; thresh: cdouble) {.
    importcpp: "ThresholdByLower", header: "vtkImageThreshold.h".}
proc ThresholdBetween*(this: var vtkImageThreshold; lower: cdouble; upper: cdouble) {.
    importcpp: "ThresholdBetween", header: "vtkImageThreshold.h".}
proc SetReplaceIn*(this: var vtkImageThreshold; _arg: vtkTypeBool) {.
    importcpp: "SetReplaceIn", header: "vtkImageThreshold.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetReplaceIn ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReplaceIn  of  << this -> ReplaceIn ) ; return this -> ReplaceIn ; } ;
## Error: expected ';'!!!

proc ReplaceInOn*(this: var vtkImageThreshold) {.importcpp: "ReplaceInOn",
    header: "vtkImageThreshold.h".}
proc ReplaceInOff*(this: var vtkImageThreshold) {.importcpp: "ReplaceInOff",
    header: "vtkImageThreshold.h".}
  ## /@}
  ## /@{
  ## *
  ##  Replace the in range pixels with this value.
  ##
proc SetInValue*(this: var vtkImageThreshold; val: cdouble) {.importcpp: "SetInValue",
    header: "vtkImageThreshold.h".}
## !!!Ignored construct:  virtual double GetReplaceInInValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InValue  of  << this -> InValue ) ; return this -> InValue ; } ;
## Error: expected ';'!!!

proc SetReplaceInReplaceOut*(this: var vtkImageThreshold; _arg: vtkTypeBool) {.
    importcpp: "SetReplaceInReplaceOut", header: "vtkImageThreshold.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetReplaceInInValueReplaceOut ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReplaceOut  of  << this -> ReplaceOut ) ; return this -> ReplaceOut ; } ;
## Error: expected ';'!!!

proc ReplaceOutOn*(this: var vtkImageThreshold) {.importcpp: "ReplaceOutOn",
    header: "vtkImageThreshold.h".}
proc ReplaceOutOff*(this: var vtkImageThreshold) {.importcpp: "ReplaceOutOff",
    header: "vtkImageThreshold.h".}
  ## /@}
  ## /@{
  ## *
  ##  Replace the in range pixels with this value.
  ##
proc SetOutValue*(this: var vtkImageThreshold; val: cdouble) {.
    importcpp: "SetOutValue", header: "vtkImageThreshold.h".}
## !!!Ignored construct:  virtual double GetReplaceInInValueReplaceOutOutValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutValue  of  << this -> OutValue ) ; return this -> OutValue ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get the Upper and Lower thresholds.
##  virtual double GetReplaceInInValueReplaceOutOutValueUpperThresholdUpperThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UpperThreshold  of  << this -> UpperThreshold ) ; return this -> UpperThreshold ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual double GetReplaceInInValueReplaceOutOutValueUpperThresholdUpperThresholdLowerThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LowerThreshold  of  << this -> LowerThreshold ) ; return this -> LowerThreshold ; } ;
## Error: expected ';'!!!

proc SetReplaceInReplaceOutOutputScalarType*(this: var vtkImageThreshold; _arg: cint) {.
    importcpp: "SetReplaceInReplaceOutOutputScalarType",
    header: "vtkImageThreshold.h".}
## !!!Ignored construct:  virtual int GetReplaceInInValueReplaceOutOutValueUpperThresholdUpperThresholdLowerThresholdOutputScalarType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputScalarType  of  << this -> OutputScalarType ) ; return this -> OutputScalarType ; } ;
## Error: expected ';'!!!

proc SetOutputScalarTypeToDouble*(this: var vtkImageThreshold) {.
    importcpp: "SetOutputScalarTypeToDouble", header: "vtkImageThreshold.h".}
proc SetOutputScalarTypeToFloat*(this: var vtkImageThreshold) {.
    importcpp: "SetOutputScalarTypeToFloat", header: "vtkImageThreshold.h".}
proc SetOutputScalarTypeToLong*(this: var vtkImageThreshold) {.
    importcpp: "SetOutputScalarTypeToLong", header: "vtkImageThreshold.h".}
proc SetOutputScalarTypeToUnsignedLong*(this: var vtkImageThreshold) {.
    importcpp: "SetOutputScalarTypeToUnsignedLong", header: "vtkImageThreshold.h".}
proc SetOutputScalarTypeToInt*(this: var vtkImageThreshold) {.
    importcpp: "SetOutputScalarTypeToInt", header: "vtkImageThreshold.h".}
proc SetOutputScalarTypeToUnsignedInt*(this: var vtkImageThreshold) {.
    importcpp: "SetOutputScalarTypeToUnsignedInt", header: "vtkImageThreshold.h".}
proc SetOutputScalarTypeToShort*(this: var vtkImageThreshold) {.
    importcpp: "SetOutputScalarTypeToShort", header: "vtkImageThreshold.h".}
proc SetOutputScalarTypeToUnsignedShort*(this: var vtkImageThreshold) {.
    importcpp: "SetOutputScalarTypeToUnsignedShort", header: "vtkImageThreshold.h".}
proc SetOutputScalarTypeToChar*(this: var vtkImageThreshold) {.
    importcpp: "SetOutputScalarTypeToChar", header: "vtkImageThreshold.h".}
proc SetOutputScalarTypeToSignedChar*(this: var vtkImageThreshold) {.
    importcpp: "SetOutputScalarTypeToSignedChar", header: "vtkImageThreshold.h".}
proc SetOutputScalarTypeToUnsignedChar*(this: var vtkImageThreshold) {.
    importcpp: "SetOutputScalarTypeToUnsignedChar", header: "vtkImageThreshold.h".}