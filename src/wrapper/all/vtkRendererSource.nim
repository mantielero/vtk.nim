## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRendererSource.h
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
##  @class   vtkRendererSource
##  @brief   take a renderer's image and/or depth map into the pipeline
##
##
##  vtkRendererSource is a source object whose input is a renderer's image
##  and/or depth map, which is then used to produce an output image. This
##  output can then be used in the visualization pipeline. You must explicitly
##  send a Modify() to this object to get it to reload its data from the
##  renderer. Consider also using vtkWindowToImageFilter instead of this
##  class.
##
##  By default, the data placed into the output is the renderer's image RGB
##  values (these color scalars are represented by unsigned chars, one per
##  color channel). Optionally, you can also grab the image depth (e.g.,
##  z-buffer) values, and include it in the output in one of three ways. 1)
##  First, when the data member DepthValues is enabled, a separate float array
##  of these depth values is included in the output point data with array name
##  "ZBuffer". 2) If DepthValuesInScalars is enabled, then the z-buffer values
##  are shifted and scaled to fit into an unsigned char and included in the
##  output image (so the output image pixels are four components RGBZ). Note
##  that DepthValues and and DepthValuesInScalars can be enabled
##  simultaneously if desired. Finally 3) if DepthValuesOnly is enabled, then
##  the output image consists only of the z-buffer values represented by a
##  single component float array; and the data members DepthValues and
##  DepthValuesInScalars are ignored.
##
##  @sa
##  vtkWindowToImageFilter vtkRendererPointCloudSource vtkRenderer
##  vtkImageData vtkDepthImageToPointCloud
##

import
  vtkAlgorithm, vtkImageData, vtkRenderingCoreModule

discard "forward decl of vtkRenderer"
type
  vtkRendererSource* {.importcpp: "vtkRendererSource",
                      header: "vtkRendererSource.h", bycopy.} = object of vtkAlgorithm
    vtkRendererSource* {.importc: "vtkRendererSource".}: VTK_NEWINSTANCE
    ##  see algorithm for more info


proc New*(): ptr vtkRendererSource {.importcpp: "vtkRendererSource::New(@)",
                                 header: "vtkRendererSource.h".}
type
  vtkRendererSourceSuperclass* = vtkAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkRendererSource::IsTypeOf(@)", header: "vtkRendererSource.h".}
proc IsA*(this: var vtkRendererSource; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkRendererSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkRendererSource {.
    importcpp: "vtkRendererSource::SafeDownCast(@)", header: "vtkRendererSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkRendererSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRendererSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRendererSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkRendererSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkRendererSource.h".}
proc GetMTime*(this: var vtkRendererSource): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkRendererSource.h".}
proc SetInput*(this: var vtkRendererSource; a2: ptr vtkRenderer) {.
    importcpp: "SetInput", header: "vtkRendererSource.h".}
proc GetnameInput*(this: var vtkRendererSource): ptr vtkRenderer {.
    importcpp: "GetnameInput", header: "vtkRendererSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Use the entire RenderWindow as a data source or just the Renderer.
  ##  The default is zero, just the Renderer.
  ##
proc SetWholeWindow*(this: var vtkRendererSource; _arg: vtkTypeBool) {.
    importcpp: "SetWholeWindow", header: "vtkRendererSource.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetWholeWindow ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WholeWindow  of  << this -> WholeWindow ) ; return this -> WholeWindow ; } ;
## Error: expected ';'!!!

proc WholeWindowOn*(this: var vtkRendererSource) {.importcpp: "WholeWindowOn",
    header: "vtkRendererSource.h".}
proc WholeWindowOff*(this: var vtkRendererSource) {.importcpp: "WholeWindowOff",
    header: "vtkRendererSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  If this flag is on, then filter execution causes a render first.
  ##
proc SetWholeWindowRenderFlag*(this: var vtkRendererSource; _arg: vtkTypeBool) {.
    importcpp: "SetWholeWindowRenderFlag", header: "vtkRendererSource.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetWholeWindowRenderFlag ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RenderFlag  of  << this -> RenderFlag ) ; return this -> RenderFlag ; } ;
## Error: expected ';'!!!

proc RenderFlagOn*(this: var vtkRendererSource) {.importcpp: "RenderFlagOn",
    header: "vtkRendererSource.h".}
proc RenderFlagOff*(this: var vtkRendererSource) {.importcpp: "RenderFlagOff",
    header: "vtkRendererSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  A boolean value to control whether to grab z-buffer
  ##  (i.e., depth values) along with the image data. The z-buffer data
  ##  is placed into a field data attributes named "ZBuffer" .
  ##
proc SetWholeWindowRenderFlagDepthValues*(this: var vtkRendererSource;
    _arg: vtkTypeBool) {.importcpp: "SetWholeWindowRenderFlagDepthValues",
                       header: "vtkRendererSource.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetWholeWindowRenderFlagDepthValues ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DepthValues  of  << this -> DepthValues ) ; return this -> DepthValues ; } ;
## Error: expected ';'!!!

proc DepthValuesOn*(this: var vtkRendererSource) {.importcpp: "DepthValuesOn",
    header: "vtkRendererSource.h".}
proc DepthValuesOff*(this: var vtkRendererSource) {.importcpp: "DepthValuesOff",
    header: "vtkRendererSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  A boolean value to control whether to grab z-buffer
  ##  (i.e., depth values) along with the image data. The z-buffer data
  ##  is placed in the scalars as a fourth Z component (shift and scaled
  ##  to map the full 0..255 range).
  ##
proc SetWholeWindowRenderFlagDepthValuesDepthValuesInScalars*(
    this: var vtkRendererSource; _arg: vtkTypeBool) {.
    importcpp: "SetWholeWindowRenderFlagDepthValuesDepthValuesInScalars",
    header: "vtkRendererSource.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetWholeWindowRenderFlagDepthValuesDepthValuesInScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DepthValuesInScalars  of  << this -> DepthValuesInScalars ) ; return this -> DepthValuesInScalars ; } ;
## Error: expected ';'!!!

proc DepthValuesInScalarsOn*(this: var vtkRendererSource) {.
    importcpp: "DepthValuesInScalarsOn", header: "vtkRendererSource.h".}
proc DepthValuesInScalarsOff*(this: var vtkRendererSource) {.
    importcpp: "DepthValuesInScalarsOff", header: "vtkRendererSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  A boolean value to control whether to grab only the z-buffer (i.e.,
  ##  depth values) without the associated image (color scalars) data. If
  ##  enabled, the output data contains only a depth image which is the
  ##  z-buffer values represented by float values. By default, this is
  ##  disabled. Note that if enabled, then the DepthValues and
  ##  DepthValuesInScalars are ignored.
  ##
proc SetWholeWindowRenderFlagDepthValuesDepthValuesInScalarsDepthValuesOnly*(
    this: var vtkRendererSource; _arg: vtkTypeBool) {.importcpp: "SetWholeWindowRenderFlagDepthValuesDepthValuesInScalarsDepthValuesOnly",
    header: "vtkRendererSource.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetWholeWindowRenderFlagDepthValuesDepthValuesInScalarsDepthValuesOnly ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DepthValuesOnly  of  << this -> DepthValuesOnly ) ; return this -> DepthValuesOnly ; } ;
## Error: expected ';'!!!

proc DepthValuesOnlyOn*(this: var vtkRendererSource) {.
    importcpp: "DepthValuesOnlyOn", header: "vtkRendererSource.h".}
proc DepthValuesOnlyOff*(this: var vtkRendererSource) {.
    importcpp: "DepthValuesOnlyOff", header: "vtkRendererSource.h".}
  ## /@}
  ## *
  ##  Get the output data object for a port on this algorithm.
  ##
proc GetOutput*(this: var vtkRendererSource): ptr vtkImageData {.
    importcpp: "GetOutput", header: "vtkRendererSource.h".}
proc ProcessRequest*(this: var vtkRendererSource; a2: ptr vtkInformation;
                    a3: ptr ptr vtkInformationVector; a4: ptr vtkInformationVector): vtkTypeBool {.
    importcpp: "ProcessRequest", header: "vtkRendererSource.h".}