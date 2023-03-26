## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageHistogram.h
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
##  @class   vtkImageHistogram
##  @brief   Compute the histogram for an image.
##
##  vtkImageHistogram generates a histogram from its input, and optionally
##  produces a 2D black-and-white image of the histogram as its output.
##  Unlike the class vtkImageAccumulate, a multi-component image does not
##  result in a multi-dimensional histogram.  Instead, the resulting
##  histogram will be the sum of the histograms of each of the individual
##  components, unless SetActiveComponent is used to choose a single
##  component.
##  @par Thanks:
##  Thanks to David Gobbi at the Seaman Family MR Centre and Dept. of Clinical
##  Neurosciences, Foothills Medical Centre, Calgary, for providing this class.
##

import
  vtkImagingStatisticsModule, vtkThreadedImageAlgorithm

discard "forward decl of vtkImageStencilData"
discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkImageHistogramThreadData"
discard "forward decl of vtkImageHistogramSMPThreadLocal"
type
  vtkImageHistogram* {.importcpp: "vtkImageHistogram",
                      header: "vtkImageHistogram.h", bycopy.} = object of vtkThreadedImageAlgorithm
    vtkImageHistogram* {.importc: "vtkImageHistogram".}: VTK_NEWINSTANCE
    ##  Used for vtkMultiThreader operation.
    ##  Used for vtkSMPTools operation.


proc New*(): ptr vtkImageHistogram {.importcpp: "vtkImageHistogram::New(@)",
                                 header: "vtkImageHistogram.h".}
type
  vtkImageHistogramSuperclass* = vtkThreadedImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageHistogram::IsTypeOf(@)", header: "vtkImageHistogram.h".}
proc IsA*(this: var vtkImageHistogram; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageHistogram.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageHistogram {.
    importcpp: "vtkImageHistogram::SafeDownCast(@)", header: "vtkImageHistogram.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageHistogram :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageHistogram :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageHistogram :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageHistogram; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageHistogram.h".}
const
  vtkImageHistogramLinear* = 0
  vtkImageHistogramLog* = 1
  vtkImageHistogramSqrt* = 2

proc SetActiveComponent*(this: var vtkImageHistogram; _arg: cint) {.
    importcpp: "SetActiveComponent", header: "vtkImageHistogram.h".}
## !!!Ignored construct:  virtual int GetActiveComponent ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ActiveComponent  of  << this -> ActiveComponent ) ; return this -> ActiveComponent ; } ;
## Error: expected ';'!!!

proc SetActiveComponentAutomaticBinning*(this: var vtkImageHistogram;
                                        _arg: vtkTypeBool) {.
    importcpp: "SetActiveComponentAutomaticBinning", header: "vtkImageHistogram.h".}
proc AutomaticBinningOn*(this: var vtkImageHistogram) {.
    importcpp: "AutomaticBinningOn", header: "vtkImageHistogram.h".}
proc AutomaticBinningOff*(this: var vtkImageHistogram) {.
    importcpp: "AutomaticBinningOff", header: "vtkImageHistogram.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetActiveComponentAutomaticBinning ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AutomaticBinning  of  << this -> AutomaticBinning ) ; return this -> AutomaticBinning ; } ;
## Error: expected ';'!!!

proc SetActiveComponentAutomaticBinningMaximumNumberOfBins*(
    this: var vtkImageHistogram; _arg: cint) {.
    importcpp: "SetActiveComponentAutomaticBinningMaximumNumberOfBins",
    header: "vtkImageHistogram.h".}
## !!!Ignored construct:  virtual int GetActiveComponentAutomaticBinningMaximumNumberOfBins ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumNumberOfBins  of  << this -> MaximumNumberOfBins ) ; return this -> MaximumNumberOfBins ; } ;
## Error: expected ';'!!!

proc SetActiveComponentAutomaticBinningMaximumNumberOfBinsNumberOfBins*(
    this: var vtkImageHistogram; _arg: cint) {.importcpp: "SetActiveComponentAutomaticBinningMaximumNumberOfBinsNumberOfBins",
    header: "vtkImageHistogram.h".}
## !!!Ignored construct:  virtual int GetActiveComponentAutomaticBinningMaximumNumberOfBinsNumberOfBins ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfBins  of  << this -> NumberOfBins ) ; return this -> NumberOfBins ; } ;
## Error: expected ';'!!!

proc SetActiveComponentAutomaticBinningMaximumNumberOfBinsNumberOfBinsBinOrigin*(
    this: var vtkImageHistogram; _arg: cdouble) {.importcpp: "SetActiveComponentAutomaticBinningMaximumNumberOfBinsNumberOfBinsBinOrigin",
    header: "vtkImageHistogram.h".}
## !!!Ignored construct:  virtual double GetActiveComponentAutomaticBinningMaximumNumberOfBinsNumberOfBinsBinOrigin ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BinOrigin  of  << this -> BinOrigin ) ; return this -> BinOrigin ; } ;
## Error: expected ';'!!!

proc SetActiveComponentAutomaticBinningMaximumNumberOfBinsNumberOfBinsBinOriginBinSpacing*(
    this: var vtkImageHistogram; _arg: cdouble) {.importcpp: "SetActiveComponentAutomaticBinningMaximumNumberOfBinsNumberOfBinsBinOriginBinSpacing",
    header: "vtkImageHistogram.h".}
## !!!Ignored construct:  virtual double GetActiveComponentAutomaticBinningMaximumNumberOfBinsNumberOfBinsBinOriginBinSpacing ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BinSpacing  of  << this -> BinSpacing ) ; return this -> BinSpacing ; } ;
## Error: expected ';'!!!

proc SetStencilData*(this: var vtkImageHistogram; stencil: ptr vtkImageStencilData) {.
    importcpp: "SetStencilData", header: "vtkImageHistogram.h".}
proc GetStencil*(this: var vtkImageHistogram): ptr vtkImageStencilData {.
    importcpp: "GetStencil", header: "vtkImageHistogram.h".}
proc SetStencilConnection*(this: var vtkImageHistogram;
                          algOutput: ptr vtkAlgorithmOutput) {.
    importcpp: "SetStencilConnection", header: "vtkImageHistogram.h".}
proc SetActiveComponentAutomaticBinningMaximumNumberOfBinsNumberOfBinsBinOriginBinSpacingGenerateHistogramImage*(
    this: var vtkImageHistogram; _arg: vtkTypeBool) {.importcpp: "SetActiveComponentAutomaticBinningMaximumNumberOfBinsNumberOfBinsBinOriginBinSpacingGenerateHistogramImage",
    header: "vtkImageHistogram.h".}
proc GenerateHistogramImageOn*(this: var vtkImageHistogram) {.
    importcpp: "GenerateHistogramImageOn", header: "vtkImageHistogram.h".}
proc GenerateHistogramImageOff*(this: var vtkImageHistogram) {.
    importcpp: "GenerateHistogramImageOff", header: "vtkImageHistogram.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetActiveComponentAutomaticBinningMaximumNumberOfBinsNumberOfBinsBinOriginBinSpacingGenerateHistogramImage ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateHistogramImage  of  << this -> GenerateHistogramImage ) ; return this -> GenerateHistogramImage ; } ;
## Error: expected ';'!!!

proc SetHistogramImageSize*(this: var vtkImageHistogram; _arg1: cint; _arg2: cint) {.
    importcpp: "SetHistogramImageSize", header: "vtkImageHistogram.h".}
proc SetHistogramImageSize*(this: var vtkImageHistogram; _arg: array[2, cint]) {.
    importcpp: "SetHistogramImageSize", header: "vtkImageHistogram.h".}
## !!!Ignored construct:  virtual int * GetHistogramImageSize ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << HistogramImageSize  pointer  << this -> HistogramImageSize ) ; return this -> HistogramImageSize ; } VTK_WRAPEXCLUDE virtual void GetHistogramImageSize ( int & _arg1 , int & _arg2 ) { _arg1 = this -> HistogramImageSize [ 0 ] ; _arg2 = this -> HistogramImageSize [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << HistogramImageSize  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetHistogramImageSize ( int _arg [ 2 ] ) { this -> GetHistogramImageSize ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetHistogramImageScale*(this: var vtkImageHistogram; _arg: cint) {.
    importcpp: "SetHistogramImageScale", header: "vtkImageHistogram.h".}
proc GetHistogramImageScaleMinValue*(this: var vtkImageHistogram): cint {.
    importcpp: "GetHistogramImageScaleMinValue", header: "vtkImageHistogram.h".}
proc GetHistogramImageScaleMaxValue*(this: var vtkImageHistogram): cint {.
    importcpp: "GetHistogramImageScaleMaxValue", header: "vtkImageHistogram.h".}
proc SetHistogramImageScaleToLinear*(this: var vtkImageHistogram) {.
    importcpp: "SetHistogramImageScaleToLinear", header: "vtkImageHistogram.h".}
proc SetHistogramImageScaleToLog*(this: var vtkImageHistogram) {.
    importcpp: "SetHistogramImageScaleToLog", header: "vtkImageHistogram.h".}
proc SetHistogramImageScaleToSqrt*(this: var vtkImageHistogram) {.
    importcpp: "SetHistogramImageScaleToSqrt", header: "vtkImageHistogram.h".}
## !!!Ignored construct:  virtual int GetActiveComponentAutomaticBinningMaximumNumberOfBinsNumberOfBinsBinOriginBinSpacingGenerateHistogramImageHistogramImageScale ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HistogramImageScale  of  << this -> HistogramImageScale ) ; return this -> HistogramImageScale ; } ;
## Error: expected ';'!!!

proc GetHistogramImageScaleAsString*(this: var vtkImageHistogram): cstring {.
    importcpp: "GetHistogramImageScaleAsString", header: "vtkImageHistogram.h".}
proc GetHistogram*(this: var vtkImageHistogram): ptr vtkIdTypeArray {.
    importcpp: "GetHistogram", header: "vtkImageHistogram.h".}
proc GetTotal*(this: var vtkImageHistogram): vtkIdType {.importcpp: "GetTotal",
    header: "vtkImageHistogram.h".}
proc ThreadedRequestData*(this: var vtkImageHistogram; request: ptr vtkInformation;
                         inputVector: ptr ptr vtkInformationVector;
                         outputVector: ptr vtkInformationVector;
                         inData: ptr ptr ptr vtkImageData;
                         outData: ptr ptr vtkImageData; ext: array[6, cint]; id: cint) {.
    importcpp: "ThreadedRequestData", header: "vtkImageHistogram.h".}