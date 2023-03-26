## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageMapper3D.h
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
##  @class   vtkImageMapper3D
##  @brief   abstract class for mapping images to the screen
##
##  vtkImageMapper3D is a mapper that will draw a 2D image, or a slice
##  of a 3D image.  The slice plane can be set automatically follow the
##  camera, so that it slices through the focal point and faces the camera.
##  @par Thanks:
##  Thanks to David Gobbi at the Seaman Family MR Centre and Dept. of Clinical
##  Neurosciences, Foothills Medical Centre, Calgary, for providing this class.
##  @sa
##  vtkImage vtkImageProperty vtkImageResliceMapper vtkImageSliceMapper
##

import
  vtkAbstractMapper3D, vtkRenderingCoreModule, vtkThreads

discard "forward decl of vtkRenderer"
discard "forward decl of vtkProp3D"
discard "forward decl of vtkPoints"
discard "forward decl of vtkMatrix4x4"
discard "forward decl of vtkLookupTable"
discard "forward decl of vtkScalarsToColors"
discard "forward decl of vtkImageSlice"
discard "forward decl of vtkImageProperty"
discard "forward decl of vtkImageData"
discard "forward decl of vtkMultiThreader"
discard "forward decl of vtkImageToImageMapper3DFriendship"
type
  vtkImageMapper3D* {.importcpp: "vtkImageMapper3D", header: "vtkImageMapper3D.h",
                     bycopy.} = object of vtkAbstractMapper3D ##  The prop this mapper is attached to, or zero if none.
    vtkImageMapper3D* {.importc: "vtkImageMapper3D".}: VTK_NEWINSTANCE
    ##  The slice.
    ##  Information about the image, updated by UpdateInformation
    ##  Set by vtkImageStack when doing multi-pass rendering
    ##  The cached data-to-world matrix

  vtkImageMapper3DSuperclass* = vtkAbstractMapper3D

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageMapper3D::IsTypeOf(@)", header: "vtkImageMapper3D.h".}
proc IsA*(this: var vtkImageMapper3D; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkImageMapper3D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageMapper3D {.
    importcpp: "vtkImageMapper3D::SafeDownCast(@)", header: "vtkImageMapper3D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageMapper3D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractMapper3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageMapper3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageMapper3D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageMapper3D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageMapper3D.h".}
proc Render*(this: var vtkImageMapper3D; renderer: ptr vtkRenderer;
            prop: ptr vtkImageSlice) {.importcpp: "Render",
                                    header: "vtkImageMapper3D.h".}
proc ReleaseGraphicsResources*(this: var vtkImageMapper3D; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkImageMapper3D.h".}
proc SetInputData*(this: var vtkImageMapper3D; input: ptr vtkImageData) {.
    importcpp: "SetInputData", header: "vtkImageMapper3D.h".}
proc GetInput*(this: var vtkImageMapper3D): ptr vtkImageData {.importcpp: "GetInput",
    header: "vtkImageMapper3D.h".}
proc GetDataSetInput*(this: var vtkImageMapper3D): ptr vtkDataSet {.
    importcpp: "GetDataSetInput", header: "vtkImageMapper3D.h".}
proc GetDataObjectInput*(this: var vtkImageMapper3D): ptr vtkDataObject {.
    importcpp: "GetDataObjectInput", header: "vtkImageMapper3D.h".}
proc SetBorder*(this: var vtkImageMapper3D; _arg: vtkTypeBool) {.
    importcpp: "SetBorder", header: "vtkImageMapper3D.h".}
proc BorderOn*(this: var vtkImageMapper3D) {.importcpp: "BorderOn",
    header: "vtkImageMapper3D.h".}
proc BorderOff*(this: var vtkImageMapper3D) {.importcpp: "BorderOff",
    header: "vtkImageMapper3D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetBorder ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Border  of  << this -> Border ) ; return this -> Border ; } ;
## Error: expected ';'!!!

proc SetBorderBackground*(this: var vtkImageMapper3D; _arg: vtkTypeBool) {.
    importcpp: "SetBorderBackground", header: "vtkImageMapper3D.h".}
proc BackgroundOn*(this: var vtkImageMapper3D) {.importcpp: "BackgroundOn",
    header: "vtkImageMapper3D.h".}
proc BackgroundOff*(this: var vtkImageMapper3D) {.importcpp: "BackgroundOff",
    header: "vtkImageMapper3D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetBorderBackground ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Background  of  << this -> Background ) ; return this -> Background ; } ;
## Error: expected ';'!!!

proc SetBorderBackgroundSliceAtFocalPoint*(this: var vtkImageMapper3D;
    _arg: vtkTypeBool) {.importcpp: "SetBorderBackgroundSliceAtFocalPoint",
                       header: "vtkImageMapper3D.h".}
proc SliceAtFocalPointOn*(this: var vtkImageMapper3D) {.
    importcpp: "SliceAtFocalPointOn", header: "vtkImageMapper3D.h".}
proc SliceAtFocalPointOff*(this: var vtkImageMapper3D) {.
    importcpp: "SliceAtFocalPointOff", header: "vtkImageMapper3D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetBorderBackgroundSliceAtFocalPoint ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SliceAtFocalPoint  of  << this -> SliceAtFocalPoint ) ; return this -> SliceAtFocalPoint ; } ;
## Error: expected ';'!!!

proc SetBorderBackgroundSliceAtFocalPointSliceFacesCamera*(
    this: var vtkImageMapper3D; _arg: vtkTypeBool) {.
    importcpp: "SetBorderBackgroundSliceAtFocalPointSliceFacesCamera",
    header: "vtkImageMapper3D.h".}
proc SliceFacesCameraOn*(this: var vtkImageMapper3D) {.
    importcpp: "SliceFacesCameraOn", header: "vtkImageMapper3D.h".}
proc SliceFacesCameraOff*(this: var vtkImageMapper3D) {.
    importcpp: "SliceFacesCameraOff", header: "vtkImageMapper3D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetBorderBackgroundSliceAtFocalPointSliceFacesCamera ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SliceFacesCamera  of  << this -> SliceFacesCamera ) ; return this -> SliceFacesCamera ; } ;
## Error: expected ';'!!!

proc GetnameSlicePlane*(this: var vtkImageMapper3D): ptr vtkPlane {.
    importcpp: "GetnameSlicePlane", header: "vtkImageMapper3D.h".}
  ## /@}
  ## *
  ##  Get the plane as a homogeneous 4-vector that gives the plane
  ##  equation coefficients.  The prop3D matrix must be provided so
  ##  that the plane can be converted to data coords.
  ##
proc GetSlicePlaneInDataCoords*(this: var vtkImageMapper3D;
                               propMatrix: ptr vtkMatrix4x4;
                               plane: array[4, cdouble]) {.
    importcpp: "GetSlicePlaneInDataCoords", header: "vtkImageMapper3D.h".}
proc SetNumberOfThreads*(this: var vtkImageMapper3D; _arg: cint) {.
    importcpp: "SetNumberOfThreads", header: "vtkImageMapper3D.h".}
proc GetNumberOfThreadsMinValue*(this: var vtkImageMapper3D): cint {.
    importcpp: "GetNumberOfThreadsMinValue", header: "vtkImageMapper3D.h".}
proc GetNumberOfThreadsMaxValue*(this: var vtkImageMapper3D): cint {.
    importcpp: "GetNumberOfThreadsMaxValue", header: "vtkImageMapper3D.h".}
## !!!Ignored construct:  virtual int GetBorderBackgroundSliceAtFocalPointSliceFacesCameraNumberOfThreads ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfThreads  of  << this -> NumberOfThreads ) ; return this -> NumberOfThreads ; } ;
## Error: expected ';'!!!

proc SetBorderBackgroundSliceAtFocalPointSliceFacesCameraStreaming*(
    this: var vtkImageMapper3D; _arg: vtkTypeBool) {.
    importcpp: "SetBorderBackgroundSliceAtFocalPointSliceFacesCameraStreaming",
    header: "vtkImageMapper3D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetBorderBackgroundSliceAtFocalPointSliceFacesCameraNumberOfThreadsStreaming ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Streaming  of  << this -> Streaming ) ; return this -> Streaming ; } ;
## Error: expected ';'!!!

proc StreamingOn*(this: var vtkImageMapper3D) {.importcpp: "StreamingOn",
    header: "vtkImageMapper3D.h".}
proc StreamingOff*(this: var vtkImageMapper3D) {.importcpp: "StreamingOff",
    header: "vtkImageMapper3D.h".}
  ## /@}
  ##  return the bounds in index space
proc GetIndexBounds*(this: var vtkImageMapper3D; extent: array[6, cdouble]) {.
    importcpp: "GetIndexBounds", header: "vtkImageMapper3D.h".}