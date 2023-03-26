## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageMapper.h
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
##  @class   vtkImageMapper
##  @brief   2D image display
##
##  vtkImageMapper provides 2D image display support for vtk.
##  It is a Mapper2D subclass that can be associated with an Actor2D
##  and placed within a RenderWindow or ImageWindow.
##  The vtkImageMapper is a 2D mapper, which means that it displays images
##  in display coordinates. In display coordinates, one image pixel is
##  always one screen pixel.
##
##  @sa
##  vtkMapper2D vtkActor2D
##

import
  vtkMapper2D, vtkRenderingCoreModule

discard "forward decl of vtkWindow"
discard "forward decl of vtkViewport"
discard "forward decl of vtkActor2D"
discard "forward decl of vtkImageData"
type
  vtkImageMapper* {.importcpp: "vtkImageMapper", header: "vtkImageMapper.h", bycopy.} = object of vtkMapper2D
    vtkImageMapper* {.importc: "vtkImageMapper".}: VTK_NEWINSTANCE
    DisplayExtent* {.importc: "DisplayExtent".}: array[6, cint] ## /@{
                                                           ## *
                                                           ##  Set the Input of a filter.
                                                           ##

  vtkImageMapperSuperclass* = vtkMapper2D

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageMapper::IsTypeOf(@)", header: "vtkImageMapper.h".}
proc IsA*(this: var vtkImageMapper; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkImageMapper.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageMapper {.
    importcpp: "vtkImageMapper::SafeDownCast(@)", header: "vtkImageMapper.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageMapper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMapper2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageMapper :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc New*(): ptr vtkImageMapper {.importcpp: "vtkImageMapper::New(@)",
                              header: "vtkImageMapper.h".}
proc PrintSelf*(this: var vtkImageMapper; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageMapper.h".}
proc GetMTime*(this: var vtkImageMapper): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkImageMapper.h".}
proc SetColorWindow*(this: var vtkImageMapper; _arg: cdouble) {.
    importcpp: "SetColorWindow", header: "vtkImageMapper.h".}
## !!!Ignored construct:  virtual double GetColorWindow ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ColorWindow  of  << this -> ColorWindow ) ; return this -> ColorWindow ; } ;
## Error: expected ';'!!!

proc SetColorWindowColorLevel*(this: var vtkImageMapper; _arg: cdouble) {.
    importcpp: "SetColorWindowColorLevel", header: "vtkImageMapper.h".}
## !!!Ignored construct:  virtual double GetColorWindowColorLevel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ColorLevel  of  << this -> ColorLevel ) ; return this -> ColorLevel ; } ;
## Error: expected ';'!!!

proc SetColorWindowColorLevelZSlice*(this: var vtkImageMapper; _arg: cint) {.
    importcpp: "SetColorWindowColorLevelZSlice", header: "vtkImageMapper.h".}
## !!!Ignored construct:  virtual int GetColorWindowColorLevelZSlice ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ZSlice  of  << this -> ZSlice ) ; return this -> ZSlice ; } ;
## Error: expected ';'!!!

proc GetWholeZMin*(this: var vtkImageMapper): cint {.importcpp: "GetWholeZMin",
    header: "vtkImageMapper.h".}
proc GetWholeZMax*(this: var vtkImageMapper): cint {.importcpp: "GetWholeZMax",
    header: "vtkImageMapper.h".}
proc RenderStart*(this: var vtkImageMapper; viewport: ptr vtkViewport;
                 actor: ptr vtkActor2D) {.importcpp: "RenderStart",
                                       header: "vtkImageMapper.h".}
proc RenderData*(this: var vtkImageMapper; a2: ptr vtkViewport; a3: ptr vtkImageData;
                a4: ptr vtkActor2D) {.importcpp: "RenderData",
                                   header: "vtkImageMapper.h".}
proc GetColorShift*(this: var vtkImageMapper): cdouble {.importcpp: "GetColorShift",
    header: "vtkImageMapper.h".}
proc GetColorScale*(this: var vtkImageMapper): cdouble {.importcpp: "GetColorScale",
    header: "vtkImageMapper.h".}
proc SetInputData*(this: var vtkImageMapper; input: ptr vtkImageData) {.
    importcpp: "SetInputData", header: "vtkImageMapper.h".}
proc GetInput*(this: var vtkImageMapper): ptr vtkImageData {.importcpp: "GetInput",
    header: "vtkImageMapper.h".}
proc SetColorWindowColorLevelZSliceRenderToRectangle*(this: var vtkImageMapper;
    _arg: vtkTypeBool) {.importcpp: "SetColorWindowColorLevelZSliceRenderToRectangle",
                       header: "vtkImageMapper.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetColorWindowColorLevelZSliceRenderToRectangle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RenderToRectangle  of  << this -> RenderToRectangle ) ; return this -> RenderToRectangle ; } ;
## Error: expected ';'!!!

proc RenderToRectangleOn*(this: var vtkImageMapper) {.
    importcpp: "RenderToRectangleOn", header: "vtkImageMapper.h".}
proc RenderToRectangleOff*(this: var vtkImageMapper) {.
    importcpp: "RenderToRectangleOff", header: "vtkImageMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  Usually, the entire image is displayed, if UseCustomExtents
  ##  is set (by default not), then the region supplied in the
  ##  CustomDisplayExtents is used in preference.
  ##  Note that the Custom extents are x,y only and the zslice is still
  ##  applied
  ##
proc SetColorWindowColorLevelZSliceRenderToRectangleUseCustomExtents*(
    this: var vtkImageMapper; _arg: vtkTypeBool) {.importcpp: "SetColorWindowColorLevelZSliceRenderToRectangleUseCustomExtents",
    header: "vtkImageMapper.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetColorWindowColorLevelZSliceRenderToRectangleUseCustomExtents ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseCustomExtents  of  << this -> UseCustomExtents ) ; return this -> UseCustomExtents ; } ;
## Error: expected ';'!!!

proc UseCustomExtentsOn*(this: var vtkImageMapper) {.
    importcpp: "UseCustomExtentsOn", header: "vtkImageMapper.h".}
proc UseCustomExtentsOff*(this: var vtkImageMapper) {.
    importcpp: "UseCustomExtentsOff", header: "vtkImageMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  The image extents which should be displayed with UseCustomExtents
  ##  Note that the Custom extents are x,y only and the zslice is still
  ##  applied
  ##
proc SetCustomDisplayExtents*(this: var vtkImageMapper; data: ptr cint) {.
    importcpp: "SetCustomDisplayExtents", header: "vtkImageMapper.h".}
## !!!Ignored construct:  virtual int * GetCustomDisplayExtents ( ) VTK_SIZEHINT ( 4 ) { vtkDebugWithObjectMacro ( this , <<  returning  << CustomDisplayExtents  pointer  << this -> CustomDisplayExtents ) ; return this -> CustomDisplayExtents ; } VTK_WRAPEXCLUDE virtual void GetCustomDisplayExtents ( int data [ 4 ] ) { for ( int i = 0 ; i < 4 ; i ++ ) { data [ i ] = this -> CustomDisplayExtents [ i ] ; } } ;
## Error: expected ';'!!!
