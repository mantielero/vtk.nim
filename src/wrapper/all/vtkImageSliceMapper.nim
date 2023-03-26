## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageSliceMapper.h
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
##  @class   vtkImageSliceMapper
##  @brief   map a slice of a vtkImageData to the screen
##
##  vtkImageSliceMapper is a mapper that will draw a 2D image, or a slice
##  of a 3D image.  For 3D images, the slice may be oriented in the X, Y,
##  or Z direction.  This mapper works via 2D textures with accelerated
##  zoom and pan operations.
##  @par Thanks:
##  Thanks to David Gobbi at the Seaman Family MR Centre and Dept. of Clinical
##  Neurosciences, Foothills Medical Centre, Calgary, for providing this class.
##  @sa
##  vtkImageSlice vtkImageProperty vtkImageResliceMapper
##

import
  vtkImageMapper3D, vtkRenderingCoreModule

discard "forward decl of vtkCamera"
discard "forward decl of vtkPoints"
type
  vtkImageSliceMapper* {.importcpp: "vtkImageSliceMapper",
                        header: "vtkImageSliceMapper.h", bycopy.} = object of vtkImageMapper3D
    vtkImageSliceMapper* {.importc: "vtkImageSliceMapper".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageSliceMapper {.importcpp: "vtkImageSliceMapper::New(@)",
                                   header: "vtkImageSliceMapper.h".}
type
  vtkImageSliceMapperSuperclass* = vtkImageMapper3D

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageSliceMapper::IsTypeOf(@)", header: "vtkImageSliceMapper.h".}
proc IsA*(this: var vtkImageSliceMapper; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageSliceMapper.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageSliceMapper {.
    importcpp: "vtkImageSliceMapper::SafeDownCast(@)",
    header: "vtkImageSliceMapper.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageSliceMapper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageMapper3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageSliceMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageSliceMapper :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageSliceMapper; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageSliceMapper.h".}
proc SetSliceNumber*(this: var vtkImageSliceMapper; slice: cint) {.
    importcpp: "SetSliceNumber", header: "vtkImageSliceMapper.h".}
proc GetSliceNumber*(this: var vtkImageSliceMapper): cint {.
    importcpp: "GetSliceNumber", header: "vtkImageSliceMapper.h".}
proc GetSliceNumberMinValue*(this: var vtkImageSliceMapper): cint {.
    importcpp: "GetSliceNumberMinValue", header: "vtkImageSliceMapper.h".}
proc GetSliceNumberMaxValue*(this: var vtkImageSliceMapper): cint {.
    importcpp: "GetSliceNumberMaxValue", header: "vtkImageSliceMapper.h".}
proc SetOrientation*(this: var vtkImageSliceMapper; _arg: cint) {.
    importcpp: "SetOrientation", header: "vtkImageSliceMapper.h".}
proc GetOrientationMinValue*(this: var vtkImageSliceMapper): cint {.
    importcpp: "GetOrientationMinValue", header: "vtkImageSliceMapper.h".}
proc GetOrientationMaxValue*(this: var vtkImageSliceMapper): cint {.
    importcpp: "GetOrientationMaxValue", header: "vtkImageSliceMapper.h".}
## !!!Ignored construct:  virtual int GetOrientation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Orientation  of  << this -> Orientation ) ; return this -> Orientation ; } ;
## Error: expected ';'!!!

proc SetOrientationToI*(this: var vtkImageSliceMapper) {.
    importcpp: "SetOrientationToI", header: "vtkImageSliceMapper.h".}
proc SetOrientationToJ*(this: var vtkImageSliceMapper) {.
    importcpp: "SetOrientationToJ", header: "vtkImageSliceMapper.h".}
proc SetOrientationToK*(this: var vtkImageSliceMapper) {.
    importcpp: "SetOrientationToK", header: "vtkImageSliceMapper.h".}
proc SetOrientationToX*(this: var vtkImageSliceMapper) {.
    importcpp: "SetOrientationToX", header: "vtkImageSliceMapper.h".}
proc SetOrientationToY*(this: var vtkImageSliceMapper) {.
    importcpp: "SetOrientationToY", header: "vtkImageSliceMapper.h".}
proc SetOrientationToZ*(this: var vtkImageSliceMapper) {.
    importcpp: "SetOrientationToZ", header: "vtkImageSliceMapper.h".}
proc SetCropping*(this: var vtkImageSliceMapper; _arg: vtkTypeBool) {.
    importcpp: "SetCropping", header: "vtkImageSliceMapper.h".}
proc CroppingOn*(this: var vtkImageSliceMapper) {.importcpp: "CroppingOn",
    header: "vtkImageSliceMapper.h".}
proc CroppingOff*(this: var vtkImageSliceMapper) {.importcpp: "CroppingOff",
    header: "vtkImageSliceMapper.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetOrientationCropping ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Cropping  of  << this -> Cropping ) ; return this -> Cropping ; } ;
## Error: expected ';'!!!

proc SetCroppingRegion*(this: var vtkImageSliceMapper; _arg1: cint; _arg2: cint;
                       _arg3: cint; _arg4: cint; _arg5: cint; _arg6: cint) {.
    importcpp: "SetCroppingRegion", header: "vtkImageSliceMapper.h".}
proc SetCroppingRegion*(this: var vtkImageSliceMapper; _arg: array[6, cint]) {.
    importcpp: "SetCroppingRegion", header: "vtkImageSliceMapper.h".}
## !!!Ignored construct:  virtual int * GetCroppingRegion ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << CroppingRegion  pointer  << this -> CroppingRegion ) ; return this -> CroppingRegion ; } VTK_WRAPEXCLUDE virtual void GetCroppingRegion ( int & _arg1 , int & _arg2 , int & _arg3 , int & _arg4 , int & _arg5 , int & _arg6 ) { _arg1 = this -> CroppingRegion [ 0 ] ; _arg2 = this -> CroppingRegion [ 1 ] ; _arg3 = this -> CroppingRegion [ 2 ] ; _arg4 = this -> CroppingRegion [ 3 ] ; _arg5 = this -> CroppingRegion [ 4 ] ; _arg6 = this -> CroppingRegion [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << CroppingRegion  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCroppingRegion ( int _arg [ 6 ] ) { this -> GetCroppingRegion ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ;
## Error: expected ';'!!!

proc Render*(this: var vtkImageSliceMapper; renderer: ptr vtkRenderer;
            prop: ptr vtkImageSlice) {.importcpp: "Render",
                                    header: "vtkImageSliceMapper.h".}
proc ReleaseGraphicsResources*(this: var vtkImageSliceMapper; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkImageSliceMapper.h".}
proc GetMTime*(this: var vtkImageSliceMapper): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkImageSliceMapper.h".}
proc GetBounds*(this: var vtkImageSliceMapper): ptr cdouble {.importcpp: "GetBounds",
    header: "vtkImageSliceMapper.h".}
proc GetBounds*(this: var vtkImageSliceMapper; bounds: array[6, cdouble]) {.
    importcpp: "GetBounds", header: "vtkImageSliceMapper.h".}
proc GetIndexBounds*(this: var vtkImageSliceMapper; extent: array[6, cdouble]) {.
    importcpp: "GetIndexBounds", header: "vtkImageSliceMapper.h".}
proc GetSlicePlaneInDataCoords*(this: var vtkImageSliceMapper;
                               propMatrix: ptr vtkMatrix4x4;
                               plane: array[4, cdouble]) {.
    importcpp: "GetSlicePlaneInDataCoords", header: "vtkImageSliceMapper.h".}
proc ProcessRequest*(this: var vtkImageSliceMapper; request: ptr vtkInformation;
                    inInfo: ptr ptr vtkInformationVector;
                    outInfo: ptr vtkInformationVector): vtkTypeBool {.
    importcpp: "ProcessRequest", header: "vtkImageSliceMapper.h".}
proc SetDisplayExtent*(this: var vtkImageSliceMapper; extent: array[6, cint]) {.
    importcpp: "SetDisplayExtent", header: "vtkImageSliceMapper.h".}