## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageResliceMapper.h
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
##  @class   vtkImageResliceMapper
##  @brief   map a slice of a vtkImageData to the screen
##
##  vtkImageResliceMapper will cut a 3D image with an arbitrary slice plane
##  and draw the results on the screen.  The slice can be set to automatically
##  follow the camera, so that the camera controls the slicing.
##  @par Thanks:
##  Thanks to David Gobbi at the Seaman Family MR Centre and Dept. of Clinical
##  Neurosciences, Foothills Medical Centre, Calgary, for providing this class.
##  @sa
##  vtkImageSlice vtkImageProperty vtkImageSliceMapper
##

import
  vtkImageMapper3D, vtkRenderingImageModule

discard "forward decl of vtkImageSliceMapper"
discard "forward decl of vtkRenderer"
discard "forward decl of vtkRenderWindow"
discard "forward decl of vtkCamera"
discard "forward decl of vtkLookupTable"
discard "forward decl of vtkImageSlice"
discard "forward decl of vtkImageData"
discard "forward decl of vtkImageResliceToColors"
discard "forward decl of vtkMatrix4x4"
discard "forward decl of vtkAbstractImageInterpolator"
type
  vtkImageResliceMapper* {.importcpp: "vtkImageResliceMapper",
                          header: "vtkImageResliceMapper.h", bycopy.} = object of vtkImageMapper3D
    vtkImageResliceMapper* {.importc: "vtkImageResliceMapper".}: VTK_NEWINSTANCE
    ##  Does the OpenGL rendering
    ##  Adjust SliceAtFocalPoint
    ##  LOD-style behavior
    ##  Do window/level as a separate step
    ##  Current slab thickness
    ##  Current slab mode
    ##  Sampling factor for slab mode
    ##  Sampling factor for image pixels
    ##  Use software interpolation only
    ##  Use software interpolation only
    ##  Execute reslice on next render
    ##  For software interpolation
    ##  Cached reslice matrix
    ##  World to Data transform matrix
    ##  Slice to World transform matrix


proc New*(): ptr vtkImageResliceMapper {.importcpp: "vtkImageResliceMapper::New(@)",
                                     header: "vtkImageResliceMapper.h".}
type
  vtkImageResliceMapperSuperclass* = vtkImageMapper3D

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageResliceMapper::IsTypeOf(@)",
    header: "vtkImageResliceMapper.h".}
proc IsA*(this: var vtkImageResliceMapper; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageResliceMapper.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageResliceMapper {.
    importcpp: "vtkImageResliceMapper::SafeDownCast(@)",
    header: "vtkImageResliceMapper.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageResliceMapper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageMapper3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageResliceMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageResliceMapper :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageResliceMapper; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageResliceMapper.h".}
proc SetSlicePlane*(this: var vtkImageResliceMapper; plane: ptr vtkPlane) {.
    importcpp: "SetSlicePlane", header: "vtkImageResliceMapper.h".}
proc SetJumpToNearestSlice*(this: var vtkImageResliceMapper; _arg: vtkTypeBool) {.
    importcpp: "SetJumpToNearestSlice", header: "vtkImageResliceMapper.h".}
proc JumpToNearestSliceOn*(this: var vtkImageResliceMapper) {.
    importcpp: "JumpToNearestSliceOn", header: "vtkImageResliceMapper.h".}
proc JumpToNearestSliceOff*(this: var vtkImageResliceMapper) {.
    importcpp: "JumpToNearestSliceOff", header: "vtkImageResliceMapper.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetJumpToNearestSlice ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << JumpToNearestSlice  of  << this -> JumpToNearestSlice ) ; return this -> JumpToNearestSlice ; } ;
## Error: expected ';'!!!

proc SetJumpToNearestSliceSlabThickness*(this: var vtkImageResliceMapper;
                                        _arg: cdouble) {.
    importcpp: "SetJumpToNearestSliceSlabThickness",
    header: "vtkImageResliceMapper.h".}
## !!!Ignored construct:  virtual double GetJumpToNearestSliceSlabThickness ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SlabThickness  of  << this -> SlabThickness ) ; return this -> SlabThickness ; } ;
## Error: expected ';'!!!

proc SetSlabType*(this: var vtkImageResliceMapper; _arg: cint) {.
    importcpp: "SetSlabType", header: "vtkImageResliceMapper.h".}
proc GetSlabTypeMinValue*(this: var vtkImageResliceMapper): cint {.
    importcpp: "GetSlabTypeMinValue", header: "vtkImageResliceMapper.h".}
proc GetSlabTypeMaxValue*(this: var vtkImageResliceMapper): cint {.
    importcpp: "GetSlabTypeMaxValue", header: "vtkImageResliceMapper.h".}
## !!!Ignored construct:  virtual int GetJumpToNearestSliceSlabThicknessSlabType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SlabType  of  << this -> SlabType ) ; return this -> SlabType ; } ;
## Error: expected ';'!!!

proc SetSlabTypeToMin*(this: var vtkImageResliceMapper) {.
    importcpp: "SetSlabTypeToMin", header: "vtkImageResliceMapper.h".}
proc SetSlabTypeToMax*(this: var vtkImageResliceMapper) {.
    importcpp: "SetSlabTypeToMax", header: "vtkImageResliceMapper.h".}
proc SetSlabTypeToMean*(this: var vtkImageResliceMapper) {.
    importcpp: "SetSlabTypeToMean", header: "vtkImageResliceMapper.h".}
proc SetSlabTypeToSum*(this: var vtkImageResliceMapper) {.
    importcpp: "SetSlabTypeToSum", header: "vtkImageResliceMapper.h".}
proc GetSlabTypeAsString*(this: var vtkImageResliceMapper): cstring {.
    importcpp: "GetSlabTypeAsString", header: "vtkImageResliceMapper.h".}
proc SetSlabTypeSlabSampleFactor*(this: var vtkImageResliceMapper; _arg: cint) {.
    importcpp: "SetSlabTypeSlabSampleFactor", header: "vtkImageResliceMapper.h".}
proc GetSlabTypeMinValueSlabSampleFactorMinValue*(this: var vtkImageResliceMapper): cint {.
    importcpp: "GetSlabTypeMinValueSlabSampleFactorMinValue",
    header: "vtkImageResliceMapper.h".}
proc GetSlabTypeMaxValueSlabSampleFactorMaxValue*(this: var vtkImageResliceMapper): cint {.
    importcpp: "GetSlabTypeMaxValueSlabSampleFactorMaxValue",
    header: "vtkImageResliceMapper.h".}
## !!!Ignored construct:  virtual int GetJumpToNearestSliceSlabThicknessSlabTypeSlabSampleFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SlabSampleFactor  of  << this -> SlabSampleFactor ) ; return this -> SlabSampleFactor ; } ;
## Error: expected ';'!!!

proc SetSlabTypeSlabSampleFactorImageSampleFactor*(
    this: var vtkImageResliceMapper; _arg: cint) {.
    importcpp: "SetSlabTypeSlabSampleFactorImageSampleFactor",
    header: "vtkImageResliceMapper.h".}
proc GetSlabTypeMinValueSlabSampleFactorMinValueImageSampleFactorMinValue*(
    this: var vtkImageResliceMapper): cint {.importcpp: "GetSlabTypeMinValueSlabSampleFactorMinValueImageSampleFactorMinValue",
    header: "vtkImageResliceMapper.h".}
proc GetSlabTypeMaxValueSlabSampleFactorMaxValueImageSampleFactorMaxValue*(
    this: var vtkImageResliceMapper): cint {.importcpp: "GetSlabTypeMaxValueSlabSampleFactorMaxValueImageSampleFactorMaxValue",
    header: "vtkImageResliceMapper.h".}
## !!!Ignored construct:  virtual int GetJumpToNearestSliceSlabThicknessSlabTypeSlabSampleFactorImageSampleFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ImageSampleFactor  of  << this -> ImageSampleFactor ) ; return this -> ImageSampleFactor ; } ;
## Error: expected ';'!!!

proc SetJumpToNearestSliceSlabThicknessAutoAdjustImageQuality*(
    this: var vtkImageResliceMapper; _arg: vtkTypeBool) {.
    importcpp: "SetJumpToNearestSliceSlabThicknessAutoAdjustImageQuality",
    header: "vtkImageResliceMapper.h".}
proc AutoAdjustImageQualityOn*(this: var vtkImageResliceMapper) {.
    importcpp: "AutoAdjustImageQualityOn", header: "vtkImageResliceMapper.h".}
proc AutoAdjustImageQualityOff*(this: var vtkImageResliceMapper) {.
    importcpp: "AutoAdjustImageQualityOff", header: "vtkImageResliceMapper.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetJumpToNearestSliceSlabThicknessSlabTypeSlabSampleFactorImageSampleFactorAutoAdjustImageQuality ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AutoAdjustImageQuality  of  << this -> AutoAdjustImageQuality ) ; return this -> AutoAdjustImageQuality ; } ;
## Error: expected ';'!!!

proc SetJumpToNearestSliceSlabThicknessAutoAdjustImageQualityResampleToScreenPixels*(
    this: var vtkImageResliceMapper; _arg: vtkTypeBool) {.importcpp: "SetJumpToNearestSliceSlabThicknessAutoAdjustImageQualityResampleToScreenPixels",
    header: "vtkImageResliceMapper.h".}
proc ResampleToScreenPixelsOn*(this: var vtkImageResliceMapper) {.
    importcpp: "ResampleToScreenPixelsOn", header: "vtkImageResliceMapper.h".}
proc ResampleToScreenPixelsOff*(this: var vtkImageResliceMapper) {.
    importcpp: "ResampleToScreenPixelsOff", header: "vtkImageResliceMapper.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetJumpToNearestSliceSlabThicknessSlabTypeSlabSampleFactorImageSampleFactorAutoAdjustImageQualityResampleToScreenPixels ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ResampleToScreenPixels  of  << this -> ResampleToScreenPixels ) ; return this -> ResampleToScreenPixels ; } ;
## Error: expected ';'!!!

proc SetJumpToNearestSliceSlabThicknessAutoAdjustImageQualityResampleToScreenPixelsSeparateWindowLevelOperation*(
    this: var vtkImageResliceMapper; _arg: vtkTypeBool) {.importcpp: "SetJumpToNearestSliceSlabThicknessAutoAdjustImageQualityResampleToScreenPixelsSeparateWindowLevelOperation",
    header: "vtkImageResliceMapper.h".}
proc SeparateWindowLevelOperationOn*(this: var vtkImageResliceMapper) {.
    importcpp: "SeparateWindowLevelOperationOn", header: "vtkImageResliceMapper.h".}
proc SeparateWindowLevelOperationOff*(this: var vtkImageResliceMapper) {.
    importcpp: "SeparateWindowLevelOperationOff",
    header: "vtkImageResliceMapper.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetJumpToNearestSliceSlabThicknessSlabTypeSlabSampleFactorImageSampleFactorAutoAdjustImageQualityResampleToScreenPixelsSeparateWindowLevelOperation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SeparateWindowLevelOperation  of  << this -> SeparateWindowLevelOperation ) ; return this -> SeparateWindowLevelOperation ; } ;
## Error: expected ';'!!!

proc SetInterpolator*(this: var vtkImageResliceMapper;
                     interpolator: ptr vtkAbstractImageInterpolator) {.
    importcpp: "SetInterpolator", header: "vtkImageResliceMapper.h".}
proc GetInterpolator*(this: var vtkImageResliceMapper): ptr vtkAbstractImageInterpolator {.
    importcpp: "GetInterpolator", header: "vtkImageResliceMapper.h".}
proc Render*(this: var vtkImageResliceMapper; renderer: ptr vtkRenderer;
            prop: ptr vtkImageSlice) {.importcpp: "Render",
                                    header: "vtkImageResliceMapper.h".}
proc ReleaseGraphicsResources*(this: var vtkImageResliceMapper; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkImageResliceMapper.h".}
proc GetMTime*(this: var vtkImageResliceMapper): vtkMTimeType {.
    importcpp: "GetMTime", header: "vtkImageResliceMapper.h".}
proc GetBounds*(this: var vtkImageResliceMapper): ptr cdouble {.
    importcpp: "GetBounds", header: "vtkImageResliceMapper.h".}
proc GetBounds*(this: var vtkImageResliceMapper; bounds: array[6, cdouble]) {.
    importcpp: "GetBounds", header: "vtkImageResliceMapper.h".}
proc ProcessRequest*(this: var vtkImageResliceMapper; request: ptr vtkInformation;
                    inInfo: ptr ptr vtkInformationVector;
                    outInfo: ptr vtkInformationVector): vtkTypeBool {.
    importcpp: "ProcessRequest", header: "vtkImageResliceMapper.h".}
proc GetIndexBounds*(this: var vtkImageResliceMapper; extent: array[6, cdouble]) {.
    importcpp: "GetIndexBounds", header: "vtkImageResliceMapper.h".}