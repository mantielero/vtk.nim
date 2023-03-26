## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageImport.h
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
##  @class   vtkImageImport
##  @brief   Import data from a C array.
##
##  vtkImageImport provides methods needed to import image data from a source
##  independent of VTK, such as a simple C array or a third-party pipeline.
##  Note that the VTK convention is for the image voxel index (0,0,0) to be
##  the lower-left corner of the image, while most 2D image formats use
##  the upper-left corner.  You can use vtkImageFlip to correct the
##  orientation after the image has been loaded into VTK.
##  Note that is also possible to import the raw data from a Python string
##  instead of from a C array. The array applies on scalar point data only, not
##  on cell data.
##  @sa
##  vtkImageExport
##

import
  vtkIOImageModule, vtkImageAlgorithm

type
  vtkImageImport* {.importcpp: "vtkImageImport", header: "vtkImageImport.h", bycopy.} = object of vtkImageAlgorithm
    vtkImageImport* {.importc: "vtkImageImport".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageImport {.importcpp: "vtkImageImport::New(@)",
                              header: "vtkImageImport.h".}
type
  vtkImageImportSuperclass* = vtkImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageImport::IsTypeOf(@)", header: "vtkImageImport.h".}
proc IsA*(this: var vtkImageImport; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkImageImport.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageImport {.
    importcpp: "vtkImageImport::SafeDownCast(@)", header: "vtkImageImport.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageImport :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageImport :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageImport :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageImport; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageImport.h".}
proc CopyImportVoidPointer*(this: var vtkImageImport; `ptr`: pointer; size: vtkIdType) {.
    importcpp: "CopyImportVoidPointer", header: "vtkImageImport.h".}
proc SetImportVoidPointer*(this: var vtkImageImport; `ptr`: pointer) {.
    importcpp: "SetImportVoidPointer", header: "vtkImageImport.h".}
proc GetImportVoidPointer*(this: var vtkImageImport): pointer {.
    importcpp: "GetImportVoidPointer", header: "vtkImageImport.h".}
proc SetImportVoidPointer*(this: var vtkImageImport; `ptr`: pointer; save: cint) {.
    importcpp: "SetImportVoidPointer", header: "vtkImageImport.h".}
proc SetDataScalarType*(this: var vtkImageImport; _arg: cint) {.
    importcpp: "SetDataScalarType", header: "vtkImageImport.h".}
proc SetDataScalarTypeToDouble*(this: var vtkImageImport) {.
    importcpp: "SetDataScalarTypeToDouble", header: "vtkImageImport.h".}
proc SetDataScalarTypeToFloat*(this: var vtkImageImport) {.
    importcpp: "SetDataScalarTypeToFloat", header: "vtkImageImport.h".}
proc SetDataScalarTypeToInt*(this: var vtkImageImport) {.
    importcpp: "SetDataScalarTypeToInt", header: "vtkImageImport.h".}
proc SetDataScalarTypeToShort*(this: var vtkImageImport) {.
    importcpp: "SetDataScalarTypeToShort", header: "vtkImageImport.h".}
proc SetDataScalarTypeToUnsignedShort*(this: var vtkImageImport) {.
    importcpp: "SetDataScalarTypeToUnsignedShort", header: "vtkImageImport.h".}
proc SetDataScalarTypeToUnsignedChar*(this: var vtkImageImport) {.
    importcpp: "SetDataScalarTypeToUnsignedChar", header: "vtkImageImport.h".}
## !!!Ignored construct:  virtual int GetDataScalarType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DataScalarType  of  << this -> DataScalarType ) ; return this -> DataScalarType ; } ;
## Error: expected ';'!!!

proc GetDataScalarTypeAsString*(this: var vtkImageImport): cstring {.
    importcpp: "GetDataScalarTypeAsString", header: "vtkImageImport.h".}
proc SetDataScalarTypeNumberOfScalarComponents*(this: var vtkImageImport; _arg: cint) {.
    importcpp: "SetDataScalarTypeNumberOfScalarComponents",
    header: "vtkImageImport.h".}
## !!!Ignored construct:  virtual int GetDataScalarTypeNumberOfScalarComponents ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfScalarComponents  of  << this -> NumberOfScalarComponents ) ; return this -> NumberOfScalarComponents ; } ;
## Error: expected ';'!!!

proc SetDataExtent*(this: var vtkImageImport; _arg1: cint; _arg2: cint; _arg3: cint;
                   _arg4: cint; _arg5: cint; _arg6: cint) {.
    importcpp: "SetDataExtent", header: "vtkImageImport.h".}
proc SetDataExtent*(this: var vtkImageImport; _arg: array[6, cint]) {.
    importcpp: "SetDataExtent", header: "vtkImageImport.h".}
## !!!Ignored construct:  virtual int * GetDataExtent ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << DataExtent  pointer  << this -> DataExtent ) ; return this -> DataExtent ; } VTK_WRAPEXCLUDE virtual void GetDataExtent ( int & _arg1 , int & _arg2 , int & _arg3 , int & _arg4 , int & _arg5 , int & _arg6 ) { _arg1 = this -> DataExtent [ 0 ] ; _arg2 = this -> DataExtent [ 1 ] ; _arg3 = this -> DataExtent [ 2 ] ; _arg4 = this -> DataExtent [ 3 ] ; _arg5 = this -> DataExtent [ 4 ] ; _arg6 = this -> DataExtent [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << DataExtent  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetDataExtent ( int _arg [ 6 ] ) { this -> GetDataExtent ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ;
## Error: expected ';'!!!

proc SetDataExtentToWholeExtent*(this: var vtkImageImport) {.
    importcpp: "SetDataExtentToWholeExtent", header: "vtkImageImport.h".}
proc SetDataSpacing*(this: var vtkImageImport; _arg1: cdouble; _arg2: cdouble;
                    _arg3: cdouble) {.importcpp: "SetDataSpacing",
                                    header: "vtkImageImport.h".}
proc SetDataSpacing*(this: var vtkImageImport; _arg: array[3, cdouble]) {.
    importcpp: "SetDataSpacing", header: "vtkImageImport.h".}
## !!!Ignored construct:  virtual double * GetDataSpacing ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << DataSpacing  pointer  << this -> DataSpacing ) ; return this -> DataSpacing ; } VTK_WRAPEXCLUDE virtual void GetDataSpacing ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> DataSpacing [ 0 ] ; _arg2 = this -> DataSpacing [ 1 ] ; _arg3 = this -> DataSpacing [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << DataSpacing  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetDataSpacing ( double _arg [ 3 ] ) { this -> GetDataSpacing ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetDataSpacingDataOrigin*(this: var vtkImageImport; _arg1: cdouble;
                              _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetDataSpacingDataOrigin", header: "vtkImageImport.h".}
proc SetDataSpacingDataOrigin*(this: var vtkImageImport; _arg: array[3, cdouble]) {.
    importcpp: "SetDataSpacingDataOrigin", header: "vtkImageImport.h".}
## !!!Ignored construct:  virtual double * GetDataSpacingDataOrigin ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << DataOrigin  pointer  << this -> DataOrigin ) ; return this -> DataOrigin ; } VTK_WRAPEXCLUDE virtual void GetDataSpacingDataOrigin ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> DataOrigin [ 0 ] ; _arg2 = this -> DataOrigin [ 1 ] ; _arg3 = this -> DataOrigin [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << DataOrigin  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetDataSpacingDataOrigin ( double _arg [ 3 ] ) { this -> GetDataSpacingDataOrigin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetDataDirection*(this: var vtkImageImport; data: ptr cdouble) {.
    importcpp: "SetDataDirection", header: "vtkImageImport.h".}
## !!!Ignored construct:  virtual double * GetDataDirection ( ) VTK_SIZEHINT ( 9 ) { vtkDebugWithObjectMacro ( this , <<  returning  << DataDirection  pointer  << this -> DataDirection ) ; return this -> DataDirection ; } VTK_WRAPEXCLUDE virtual void GetDataDirection ( double data [ 9 ] ) { for ( int i = 0 ; i < 9 ; i ++ ) { data [ i ] = this -> DataDirection [ i ] ; } } ;
## Error: expected ';'!!!

proc SetDataExtentWholeExtent*(this: var vtkImageImport; _arg1: cint; _arg2: cint;
                              _arg3: cint; _arg4: cint; _arg5: cint; _arg6: cint) {.
    importcpp: "SetDataExtentWholeExtent", header: "vtkImageImport.h".}
proc SetDataExtentWholeExtent*(this: var vtkImageImport; _arg: array[6, cint]) {.
    importcpp: "SetDataExtentWholeExtent", header: "vtkImageImport.h".}
## !!!Ignored construct:  virtual int * GetDataExtentWholeExtent ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << WholeExtent  pointer  << this -> WholeExtent ) ; return this -> WholeExtent ; } VTK_WRAPEXCLUDE virtual void GetDataExtentWholeExtent ( int & _arg1 , int & _arg2 , int & _arg3 , int & _arg4 , int & _arg5 , int & _arg6 ) { _arg1 = this -> WholeExtent [ 0 ] ; _arg2 = this -> WholeExtent [ 1 ] ; _arg3 = this -> WholeExtent [ 2 ] ; _arg4 = this -> WholeExtent [ 3 ] ; _arg5 = this -> WholeExtent [ 4 ] ; _arg6 = this -> WholeExtent [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << WholeExtent  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetDataExtentWholeExtent ( int _arg [ 6 ] ) { this -> GetDataExtentWholeExtent ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ;
## Error: expected ';'!!!

proc RequestUpdateExtent*(this: var vtkImageImport; request: ptr vtkInformation;
                         inputVector: ptr ptr vtkInformationVector;
                         outputVector: ptr vtkInformationVector): cint {.
    importcpp: "RequestUpdateExtent", header: "vtkImageImport.h".}
proc ComputePipelineMTime*(this: var vtkImageImport; request: ptr vtkInformation;
                          inInfoVec: ptr ptr vtkInformationVector;
                          outInfoVec: ptr vtkInformationVector;
                          requestFromOutputPort: cint; mtime: ptr vtkMTimeType): cint {.
    importcpp: "ComputePipelineMTime", header: "vtkImageImport.h".}
proc SetScalarArrayName*(this: var vtkImageImport; _arg: cstring) {.
    importcpp: "SetScalarArrayName", header: "vtkImageImport.h".}
proc GetScalarArrayName*(this: var vtkImageImport): cstring {.
    importcpp: "GetScalarArrayName", header: "vtkImageImport.h".}
  ## /@}
  ## /@{
  ## *
  ##  These are function pointer types for the pipeline connection
  ##  callbacks.  See further documentation on each individual callback.
  ##
type
  vtkImageImportUpdateInformationCallbackType* = proc (a1: pointer)
  vtkImageImportPipelineModifiedCallbackType* = proc (a1: pointer): cint
  vtkImageImportWholeExtentCallbackType* = proc (a1: pointer): ptr cint
  vtkImageImportSpacingCallbackType* = proc (a1: pointer): ptr cdouble
  vtkImageImportOriginCallbackType* = proc (a1: pointer): ptr cdouble
  vtkImageImportDirectionCallbackType* = proc (a1: pointer): ptr cdouble
  vtkImageImportScalarTypeCallbackType* = proc (a1: pointer): cstring
  vtkImageImportNumberOfComponentsCallbackType* = proc (a1: pointer): cint
  vtkImageImportPropagateUpdateExtentCallbackType* = proc (a1: pointer; a2: ptr cint)
  vtkImageImportUpdateDataCallbackType* = proc (a1: pointer)
  vtkImageImportDataExtentCallbackType* = proc (a1: pointer): ptr cint
  vtkImageImportBufferPointerCallbackType* = proc (a1: pointer): pointer

proc SetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallback*(
    this: var vtkImageImport; _arg: vtkImageImportUpdateInformationCallbackType) {.importcpp: "SetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallback",
    header: "vtkImageImport.h".}
## !!!Ignored construct:  virtual UpdateInformationCallbackType GetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallback ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UpdateInformationCallback  of  << this -> UpdateInformationCallback ) ; return this -> UpdateInformationCallback ; } ;
## Error: expected ';'!!!

proc SetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallbackPipelineModifiedCallback*(
    this: var vtkImageImport; _arg: vtkImageImportPipelineModifiedCallbackType) {.importcpp: "SetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallbackPipelineModifiedCallback",
    header: "vtkImageImport.h".}
## !!!Ignored construct:  virtual PipelineModifiedCallbackType GetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallbackPipelineModifiedCallback ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PipelineModifiedCallback  of  << this -> PipelineModifiedCallback ) ; return this -> PipelineModifiedCallback ; } ;
## Error: expected ';'!!!

proc SetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallbackPipelineModifiedCallbackWholeExtentCallback*(
    this: var vtkImageImport; _arg: vtkImageImportWholeExtentCallbackType) {.importcpp: "SetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallbackPipelineModifiedCallbackWholeExtentCallback",
    header: "vtkImageImport.h".}
## !!!Ignored construct:  virtual WholeExtentCallbackType GetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallbackPipelineModifiedCallbackWholeExtentCallback ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WholeExtentCallback  of  << this -> WholeExtentCallback ) ; return this -> WholeExtentCallback ; } ;
## Error: expected ';'!!!

proc SetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallbackPipelineModifiedCallbackWholeExtentCallbackSpacingCallback*(
    this: var vtkImageImport; _arg: vtkImageImportSpacingCallbackType) {.importcpp: "SetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallbackPipelineModifiedCallbackWholeExtentCallbackSpacingCallback",
    header: "vtkImageImport.h".}
## !!!Ignored construct:  virtual SpacingCallbackType GetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallbackPipelineModifiedCallbackWholeExtentCallbackSpacingCallback ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SpacingCallback  of  << this -> SpacingCallback ) ; return this -> SpacingCallback ; } ;
## Error: expected ';'!!!

proc SetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallbackPipelineModifiedCallbackWholeExtentCallbackSpacingCallbackOriginCallback*(
    this: var vtkImageImport; _arg: vtkImageImportOriginCallbackType) {.importcpp: "SetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallbackPipelineModifiedCallbackWholeExtentCallbackSpacingCallbackOriginCallback",
    header: "vtkImageImport.h".}
## !!!Ignored construct:  virtual OriginCallbackType GetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallbackPipelineModifiedCallbackWholeExtentCallbackSpacingCallbackOriginCallback ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OriginCallback  of  << this -> OriginCallback ) ; return this -> OriginCallback ; } ;
## Error: expected ';'!!!

proc SetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallbackPipelineModifiedCallbackWholeExtentCallbackSpacingCallbackOriginCallbackDirectionCallback*(
    this: var vtkImageImport; _arg: vtkImageImportDirectionCallbackType) {.importcpp: "SetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallbackPipelineModifiedCallbackWholeExtentCallbackSpacingCallbackOriginCallbackDirectionCallback",
    header: "vtkImageImport.h".}
## !!!Ignored construct:  virtual DirectionCallbackType GetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallbackPipelineModifiedCallbackWholeExtentCallbackSpacingCallbackOriginCallbackDirectionCallback ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DirectionCallback  of  << this -> DirectionCallback ) ; return this -> DirectionCallback ; } ;
## Error: expected ';'!!!

proc SetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallbackPipelineModifiedCallbackWholeExtentCallbackSpacingCallbackOriginCallbackDirectionCallbackScalarTypeCallback*(
    this: var vtkImageImport; _arg: vtkImageImportScalarTypeCallbackType) {.importcpp: "SetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallbackPipelineModifiedCallbackWholeExtentCallbackSpacingCallbackOriginCallbackDirectionCallbackScalarTypeCallback",
    header: "vtkImageImport.h".}
## !!!Ignored construct:  virtual ScalarTypeCallbackType GetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallbackPipelineModifiedCallbackWholeExtentCallbackSpacingCallbackOriginCallbackDirectionCallbackScalarTypeCallback ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarTypeCallback  of  << this -> ScalarTypeCallback ) ; return this -> ScalarTypeCallback ; } ;
## Error: expected ';'!!!

proc SetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallbackPipelineModifiedCallbackWholeExtentCallbackSpacingCallbackOriginCallbackDirectionCallbackScalarTypeCallbackNumberOfComponentsCallback*(
    this: var vtkImageImport; _arg: vtkImageImportNumberOfComponentsCallbackType) {.importcpp: "SetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallbackPipelineModifiedCallbackWholeExtentCallbackSpacingCallbackOriginCallbackDirectionCallbackScalarTypeCallbackNumberOfComponentsCallback",
    header: "vtkImageImport.h".}
## !!!Ignored construct:  virtual NumberOfComponentsCallbackType GetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallbackPipelineModifiedCallbackWholeExtentCallbackSpacingCallbackOriginCallbackDirectionCallbackScalarTypeCallbackNumberOfComponentsCallback ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfComponentsCallback  of  << this -> NumberOfComponentsCallback ) ; return this -> NumberOfComponentsCallback ; } ;
## Error: expected ';'!!!

proc SetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallbackPipelineModifiedCallbackWholeExtentCallbackSpacingCallbackOriginCallbackDirectionCallbackScalarTypeCallbackNumberOfComponentsCallbackPropagateUpdateExtentCallback*(
    this: var vtkImageImport; _arg: vtkImageImportPropagateUpdateExtentCallbackType) {.importcpp: "SetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallbackPipelineModifiedCallbackWholeExtentCallbackSpacingCallbackOriginCallbackDirectionCallbackScalarTypeCallbackNumberOfComponentsCallbackPropagateUpdateExtentCallback",
    header: "vtkImageImport.h".}
## !!!Ignored construct:  virtual PropagateUpdateExtentCallbackType GetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallbackPipelineModifiedCallbackWholeExtentCallbackSpacingCallbackOriginCallbackDirectionCallbackScalarTypeCallbackNumberOfComponentsCallbackPropagateUpdateExtentCallback ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PropagateUpdateExtentCallback  of  << this -> PropagateUpdateExtentCallback ) ; return this -> PropagateUpdateExtentCallback ; } ;
## Error: expected ';'!!!

proc SetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallbackPipelineModifiedCallbackWholeExtentCallbackSpacingCallbackOriginCallbackDirectionCallbackScalarTypeCallbackNumberOfComponentsCallbackPropagateUpdateExtentCallbackUpdateDataCallback*(
    this: var vtkImageImport; _arg: vtkImageImportUpdateDataCallbackType) {.importcpp: "SetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallbackPipelineModifiedCallbackWholeExtentCallbackSpacingCallbackOriginCallbackDirectionCallbackScalarTypeCallbackNumberOfComponentsCallbackPropagateUpdateExtentCallbackUpdateDataCallback",
    header: "vtkImageImport.h".}
## !!!Ignored construct:  virtual UpdateDataCallbackType GetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallbackPipelineModifiedCallbackWholeExtentCallbackSpacingCallbackOriginCallbackDirectionCallbackScalarTypeCallbackNumberOfComponentsCallbackPropagateUpdateExtentCallbackUpdateDataCallback ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UpdateDataCallback  of  << this -> UpdateDataCallback ) ; return this -> UpdateDataCallback ; } ;
## Error: expected ';'!!!

proc SetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallbackPipelineModifiedCallbackWholeExtentCallbackSpacingCallbackOriginCallbackDirectionCallbackScalarTypeCallbackNumberOfComponentsCallbackPropagateUpdateExtentCallbackUpdateDataCallbackDataExtentCallback*(
    this: var vtkImageImport; _arg: vtkImageImportDataExtentCallbackType) {.importcpp: "SetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallbackPipelineModifiedCallbackWholeExtentCallbackSpacingCallbackOriginCallbackDirectionCallbackScalarTypeCallbackNumberOfComponentsCallbackPropagateUpdateExtentCallbackUpdateDataCallbackDataExtentCallback",
    header: "vtkImageImport.h".}
## !!!Ignored construct:  virtual DataExtentCallbackType GetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallbackPipelineModifiedCallbackWholeExtentCallbackSpacingCallbackOriginCallbackDirectionCallbackScalarTypeCallbackNumberOfComponentsCallbackPropagateUpdateExtentCallbackUpdateDataCallbackDataExtentCallback ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DataExtentCallback  of  << this -> DataExtentCallback ) ; return this -> DataExtentCallback ; } ;
## Error: expected ';'!!!

proc SetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallbackPipelineModifiedCallbackWholeExtentCallbackSpacingCallbackOriginCallbackDirectionCallbackScalarTypeCallbackNumberOfComponentsCallbackPropagateUpdateExtentCallbackUpdateDataCallbackDataExtentCallbackBufferPointerCallback*(
    this: var vtkImageImport; _arg: vtkImageImportBufferPointerCallbackType) {.importcpp: "SetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallbackPipelineModifiedCallbackWholeExtentCallbackSpacingCallbackOriginCallbackDirectionCallbackScalarTypeCallbackNumberOfComponentsCallbackPropagateUpdateExtentCallbackUpdateDataCallbackDataExtentCallbackBufferPointerCallback",
    header: "vtkImageImport.h".}
## !!!Ignored construct:  virtual BufferPointerCallbackType GetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallbackPipelineModifiedCallbackWholeExtentCallbackSpacingCallbackOriginCallbackDirectionCallbackScalarTypeCallbackNumberOfComponentsCallbackPropagateUpdateExtentCallbackUpdateDataCallbackDataExtentCallbackBufferPointerCallback ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BufferPointerCallback  of  << this -> BufferPointerCallback ) ; return this -> BufferPointerCallback ; } ;
## Error: expected ';'!!!

proc SetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallbackPipelineModifiedCallbackWholeExtentCallbackSpacingCallbackOriginCallbackDirectionCallbackScalarTypeCallbackNumberOfComponentsCallbackPropagateUpdateExtentCallbackUpdateDataCallbackDataExtentCallbackBufferPointerCallbackCallbackUserData*(
    this: var vtkImageImport; _arg: pointer) {.importcpp: "SetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallbackPipelineModifiedCallbackWholeExtentCallbackSpacingCallbackOriginCallbackDirectionCallbackScalarTypeCallbackNumberOfComponentsCallbackPropagateUpdateExtentCallbackUpdateDataCallbackDataExtentCallbackBufferPointerCallbackCallbackUserData",
    header: "vtkImageImport.h".}
## !!!Ignored construct:  virtual void * GetDataScalarTypeNumberOfScalarComponentsUpdateInformationCallbackPipelineModifiedCallbackWholeExtentCallbackSpacingCallbackOriginCallbackDirectionCallbackScalarTypeCallbackNumberOfComponentsCallbackPropagateUpdateExtentCallbackUpdateDataCallbackDataExtentCallbackBufferPointerCallbackCallbackUserData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CallbackUserData  of  << this -> CallbackUserData ) ; return this -> CallbackUserData ; } ;
## Error: expected ';'!!!

proc InvokePipelineModifiedCallbacks*(this: var vtkImageImport): cint {.
    importcpp: "InvokePipelineModifiedCallbacks", header: "vtkImageImport.h".}
proc InvokeUpdateInformationCallbacks*(this: var vtkImageImport) {.
    importcpp: "InvokeUpdateInformationCallbacks", header: "vtkImageImport.h".}
proc InvokeExecuteInformationCallbacks*(this: var vtkImageImport) {.
    importcpp: "InvokeExecuteInformationCallbacks", header: "vtkImageImport.h".}
proc InvokeExecuteDataCallbacks*(this: var vtkImageImport) {.
    importcpp: "InvokeExecuteDataCallbacks", header: "vtkImageImport.h".}
proc LegacyCheckWholeExtent*(this: var vtkImageImport) {.
    importcpp: "LegacyCheckWholeExtent", header: "vtkImageImport.h".}