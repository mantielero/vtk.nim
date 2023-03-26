## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkThreadedImageAlgorithm.h
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
##  @class   vtkThreadedImageAlgorithm
##  @brief   Generic filter that has one input.
##
##  vtkThreadedImageAlgorithm is a filter superclass that hides much of the
##  pipeline complexity. It handles breaking the pipeline execution
##  into smaller extents so that the vtkImageData limits are observed. It
##  also provides support for multithreading. If you don't need any of this
##  functionality, consider using vtkSimpleImageToImageAlgorithm instead.
##  @sa
##  vtkSimpleImageToImageAlgorithm
##

import
  vtkCommonExecutionModelModule, vtkImageAlgorithm, vtkThreads

discard "forward decl of vtkImageData"
discard "forward decl of vtkMultiThreader"
type
  vtkThreadedImageAlgorithm* {.importcpp: "vtkThreadedImageAlgorithm",
                              header: "vtkThreadedImageAlgorithm.h", bycopy.} = object of vtkImageAlgorithm
    vtkThreadedImageAlgorithm* {.importc: "vtkThreadedImageAlgorithm".}: VTK_NEWINSTANCE
    ## *
    ##  This is called by the superclass.
    ##  This is the method you should override.
    ##

  vtkThreadedImageAlgorithmSuperclass* = vtkImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkThreadedImageAlgorithm::IsTypeOf(@)",
    header: "vtkThreadedImageAlgorithm.h".}
proc IsA*(this: var vtkThreadedImageAlgorithm; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkThreadedImageAlgorithm.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkThreadedImageAlgorithm {.
    importcpp: "vtkThreadedImageAlgorithm::SafeDownCast(@)",
    header: "vtkThreadedImageAlgorithm.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkThreadedImageAlgorithm :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkThreadedImageAlgorithm :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkThreadedImageAlgorithm; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkThreadedImageAlgorithm.h".}
proc ThreadedRequestData*(this: var vtkThreadedImageAlgorithm;
                         request: ptr vtkInformation;
                         inputVector: ptr ptr vtkInformationVector;
                         outputVector: ptr vtkInformationVector;
                         inData: ptr ptr ptr vtkImageData;
                         outData: ptr ptr vtkImageData; extent: array[6, cint];
                         threadId: cint) {.importcpp: "ThreadedRequestData",
    header: "vtkThreadedImageAlgorithm.h".}
proc ThreadedExecute*(this: var vtkThreadedImageAlgorithm; inData: ptr vtkImageData;
                     outData: ptr vtkImageData; extent: array[6, cint]; threadId: cint) {.
    importcpp: "ThreadedExecute", header: "vtkThreadedImageAlgorithm.h".}
## !!!Ignored construct:  /@{ *
##  Enable/Disable SMP for threading.
##  virtual bool GetEnableSMPEnableSMP ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EnableSMP  of  << this -> EnableSMP ) ; return this -> EnableSMP ; } ;
## Error: expected ';'!!!

proc SetEnableSMP*(this: var vtkThreadedImageAlgorithm; _arg: bool) {.
    importcpp: "SetEnableSMP", header: "vtkThreadedImageAlgorithm.h".}
  ## /@}
  ## /@{
  ## *
  ##  Global Disable SMP for all derived Imaging filters.
  ##
proc SetGlobalDefaultEnableSMP*(enable: bool) {.
    importcpp: "vtkThreadedImageAlgorithm::SetGlobalDefaultEnableSMP(@)",
    header: "vtkThreadedImageAlgorithm.h".}
proc GetGlobalDefaultEnableSMP*(): bool {.importcpp: "vtkThreadedImageAlgorithm::GetGlobalDefaultEnableSMP(@)",
                                       header: "vtkThreadedImageAlgorithm.h".}
proc SetMinimumPieceSize*(this: var vtkThreadedImageAlgorithm; _arg1: cint;
                         _arg2: cint; _arg3: cint) {.
    importcpp: "SetMinimumPieceSize", header: "vtkThreadedImageAlgorithm.h".}
proc SetMinimumPieceSize*(this: var vtkThreadedImageAlgorithm; _arg: array[3, cint]) {.
    importcpp: "SetMinimumPieceSize", header: "vtkThreadedImageAlgorithm.h".}
## !!!Ignored construct:  virtual int * GetMinimumPieceSize ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << MinimumPieceSize  pointer  << this -> MinimumPieceSize ) ; return this -> MinimumPieceSize ; } VTK_WRAPEXCLUDE virtual void GetMinimumPieceSize ( int & _arg1 , int & _arg2 , int & _arg3 ) { _arg1 = this -> MinimumPieceSize [ 0 ] ; _arg2 = this -> MinimumPieceSize [ 1 ] ; _arg3 = this -> MinimumPieceSize [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << MinimumPieceSize  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetMinimumPieceSize ( int _arg [ 3 ] ) { this -> GetMinimumPieceSize ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetEnableSMPDesiredBytesPerPiece*(this: var vtkThreadedImageAlgorithm;
                                      _arg: vtkIdType) {.
    importcpp: "SetEnableSMPDesiredBytesPerPiece",
    header: "vtkThreadedImageAlgorithm.h".}
## !!!Ignored construct:  virtual vtkIdType GetEnableSMPEnableSMPDesiredBytesPerPiece ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DesiredBytesPerPiece  of  << this -> DesiredBytesPerPiece ) ; return this -> DesiredBytesPerPiece ; } ;
## Error: expected ';'!!!

proc SetSplitMode*(this: var vtkThreadedImageAlgorithm; _arg: cint) {.
    importcpp: "SetSplitMode", header: "vtkThreadedImageAlgorithm.h".}
proc GetSplitModeMinValue*(this: var vtkThreadedImageAlgorithm): cint {.
    importcpp: "GetSplitModeMinValue", header: "vtkThreadedImageAlgorithm.h".}
proc GetSplitModeMaxValue*(this: var vtkThreadedImageAlgorithm): cint {.
    importcpp: "GetSplitModeMaxValue", header: "vtkThreadedImageAlgorithm.h".}
proc SetSplitModeToSlab*(this: var vtkThreadedImageAlgorithm) {.
    importcpp: "SetSplitModeToSlab", header: "vtkThreadedImageAlgorithm.h".}
proc SetSplitModeToBeam*(this: var vtkThreadedImageAlgorithm) {.
    importcpp: "SetSplitModeToBeam", header: "vtkThreadedImageAlgorithm.h".}
proc SetSplitModeToBlock*(this: var vtkThreadedImageAlgorithm) {.
    importcpp: "SetSplitModeToBlock", header: "vtkThreadedImageAlgorithm.h".}
## !!!Ignored construct:  virtual int GetEnableSMPEnableSMPDesiredBytesPerPieceSplitMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SplitMode  of  << this -> SplitMode ) ; return this -> SplitMode ; } ;
## Error: expected ';'!!!

proc SetSplitModeNumberOfThreads*(this: var vtkThreadedImageAlgorithm; _arg: cint) {.
    importcpp: "SetSplitModeNumberOfThreads",
    header: "vtkThreadedImageAlgorithm.h".}
proc GetSplitModeMinValueNumberOfThreadsMinValue*(
    this: var vtkThreadedImageAlgorithm): cint {.
    importcpp: "GetSplitModeMinValueNumberOfThreadsMinValue",
    header: "vtkThreadedImageAlgorithm.h".}
proc GetSplitModeMaxValueNumberOfThreadsMaxValue*(
    this: var vtkThreadedImageAlgorithm): cint {.
    importcpp: "GetSplitModeMaxValueNumberOfThreadsMaxValue",
    header: "vtkThreadedImageAlgorithm.h".}
## !!!Ignored construct:  virtual int GetEnableSMPEnableSMPDesiredBytesPerPieceSplitModeNumberOfThreads ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfThreads  of  << this -> NumberOfThreads ) ; return this -> NumberOfThreads ; } ;
## Error: expected ';'!!!

proc SplitExtent*(this: var vtkThreadedImageAlgorithm; splitExt: array[6, cint];
                 startExt: array[6, cint]; num: cint; total: cint): cint {.
    importcpp: "SplitExtent", header: "vtkThreadedImageAlgorithm.h".}