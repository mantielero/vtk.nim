## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkResizingWindowToImageFilter.h
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
##  @class   vtkResizingWindowToImageFilter
##  @brief   Use a vtkWindow as input to image pipeline
##
##  vtkResizingWindowToImageFilter provides methods needed to read the data in
##  a vtkWindow and use it as input to the imaging pipeline. This is
##  useful for saving an image to a file for example. The window can
##  be read as either RGB or RGBA pixels;  in addition, the depth buffer
##  can also be read.   RGB and RGBA pixels are of type unsigned char,
##  while Z-Buffer data is returned as floats.  Use this filter
##  to convert RenderWindows or ImageWindows to an image format.
##
##  @note
##  In contrast to the vtkWindowToImageFilter, this allows also for non-integral
##  values to be used as scaling factors for the generated image. Also, it
##  provides a SizeLimit parameter which enables to control when the algorithm
##  will switch to using tiling for generating a large image instead of
##  rendering the entire result at once.
##
##  @warning
##  A vtkWindow doesn't behave like other parts of the VTK pipeline: its
##  modification time doesn't get updated when an image is rendered.  As a
##  result, naive use of vtkResizingWindowToImageFilter will produce an image of
##  the first image that the window rendered, but which is never updated
##  on subsequent window updates.  This behavior is unexpected and in
##  general undesirable.
##
##  @warning
##  To force an update of the output image, call vtkResizingWindowToImageFilter's
##  Modified method after rendering to the window.
##
##  @sa
##  vtkRendererSource vtkRendererPointCloudSource vtkWindow
##  vtkRenderLargeImage vtkWindowToImageFilter
##

import
  vtkAlgorithm, vtkImageData, vtkRenderingCoreModule

##  VTK_RGB and VTK_RGBA are defined in system includes

const
  VTK_ZBUFFER* = 5

discard "forward decl of vtkWindow"
discard "forward decl of vtkWTI2DHelperClass"
type
  vtkResizingWindowToImageFilter* {.importcpp: "vtkResizingWindowToImageFilter",
                                   header: "vtkResizingWindowToImageFilter.h",
                                   bycopy.} = object of vtkAlgorithm
    vtkResizingWindowToImageFilter* {.importc: "vtkResizingWindowToImageFilter".}: VTK_NEWINSTANCE
    ##  requested size of the screenshot in pixels.
    ##  window size limit for using this filter. If the target resolution is higher we switch to
    ##  vtkWindowToImageFilter with tiling


proc New*(): ptr vtkResizingWindowToImageFilter {.
    importcpp: "vtkResizingWindowToImageFilter::New(@)",
    header: "vtkResizingWindowToImageFilter.h".}
type
  vtkResizingWindowToImageFilterSuperclass* = vtkAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkResizingWindowToImageFilter::IsTypeOf(@)",
    header: "vtkResizingWindowToImageFilter.h".}
proc IsA*(this: var vtkResizingWindowToImageFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkResizingWindowToImageFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkResizingWindowToImageFilter {.
    importcpp: "vtkResizingWindowToImageFilter::SafeDownCast(@)",
    header: "vtkResizingWindowToImageFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkResizingWindowToImageFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkResizingWindowToImageFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkResizingWindowToImageFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkResizingWindowToImageFilter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkResizingWindowToImageFilter.h".}
proc SetInput*(this: var vtkResizingWindowToImageFilter; input: ptr vtkWindow) {.
    importcpp: "SetInput", header: "vtkResizingWindowToImageFilter.h".}
proc GetnameInput*(this: var vtkResizingWindowToImageFilter): ptr vtkWindow {.
    importcpp: "GetnameInput", header: "vtkResizingWindowToImageFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get/Set the size of the target image in pixels.
  ##
## !!!Ignored construct:  virtual int * GetSize ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Size  pointer  << this -> Size ) ; return this -> Size ; } VTK_WRAPEXCLUDE virtual void GetSize ( int & _arg1 , int & _arg2 ) { _arg1 = this -> Size [ 0 ] ; _arg2 = this -> Size [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Size  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetSize ( int _arg [ 2 ] ) { this -> GetSize ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetSize*(this: var vtkResizingWindowToImageFilter; _arg1: cint; _arg2: cint) {.
    importcpp: "SetSize", header: "vtkResizingWindowToImageFilter.h".}
proc SetSize*(this: var vtkResizingWindowToImageFilter; _arg: array[2, cint]) {.
    importcpp: "SetSize", header: "vtkResizingWindowToImageFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get/Set the size limit of the image (in pixels per axis) for switching
  ##  from rendering the entire image in memory to using tiling which uses less
  ##  memory but may fail to produce the exact size in pixels as requested.
  ##
## !!!Ignored construct:  virtual int GetSizeLimit ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SizeLimit  of  << this -> SizeLimit ) ; return this -> SizeLimit ; } ;
## Error: expected ';'!!!

proc SetSizeLimit*(this: var vtkResizingWindowToImageFilter; _arg: cint) {.
    importcpp: "SetSizeLimit", header: "vtkResizingWindowToImageFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get the window buffer from which data will be read.  Choices
  ##  include VTK_RGB (read the color image from the window), VTK_RGBA
  ##  (same, but include the alpha channel), and VTK_ZBUFFER (depth
  ##  buffer, returned as a float array). Initial value is VTK_RGB.
  ##
proc SetSizeLimitInputBufferType*(this: var vtkResizingWindowToImageFilter;
                                 _arg: cint) {.
    importcpp: "SetSizeLimitInputBufferType",
    header: "vtkResizingWindowToImageFilter.h".}
## !!!Ignored construct:  virtual int GetSizeLimitInputBufferType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InputBufferType  of  << this -> InputBufferType ) ; return this -> InputBufferType ; } ;
## Error: expected ';'!!!

proc SetInputBufferTypeToRGB*(this: var vtkResizingWindowToImageFilter) {.
    importcpp: "SetInputBufferTypeToRGB",
    header: "vtkResizingWindowToImageFilter.h".}
proc SetInputBufferTypeToRGBA*(this: var vtkResizingWindowToImageFilter) {.
    importcpp: "SetInputBufferTypeToRGBA",
    header: "vtkResizingWindowToImageFilter.h".}
proc SetInputBufferTypeToZBuffer*(this: var vtkResizingWindowToImageFilter) {.
    importcpp: "SetInputBufferTypeToZBuffer",
    header: "vtkResizingWindowToImageFilter.h".}
proc GetOutput*(this: var vtkResizingWindowToImageFilter): ptr vtkImageData {.
    importcpp: "GetOutput", header: "vtkResizingWindowToImageFilter.h".}
proc ProcessRequest*(this: var vtkResizingWindowToImageFilter;
                    a2: ptr vtkInformation; a3: ptr ptr vtkInformationVector;
                    a4: ptr vtkInformationVector): vtkTypeBool {.
    importcpp: "ProcessRequest", header: "vtkResizingWindowToImageFilter.h".}