## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkWindowToImageFilter.h
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
##  @class   vtkWindowToImageFilter
##  @brief   Use a vtkWindow as input to image pipeline
##
##  vtkWindowToImageFilter provides methods needed to read the data in
##  a vtkWindow and use it as input to the imaging pipeline. This is
##  useful for saving an image to a file for example. The window can
##  be read as either RGB or RGBA pixels;  in addition, the depth buffer
##  can also be read.   RGB and RGBA pixels are of type unsigned char,
##  while Z-Buffer data is returned as floats.  Use this filter
##  to convert RenderWindows or ImageWindows to an image format.
##
##  @warning
##  A vtkWindow doesn't behave like other parts of the VTK pipeline: its
##  modification time doesn't get updated when an image is rendered.  As a
##  result, naive use of vtkWindowToImageFilter will produce an image of
##  the first image that the window rendered, but which is never updated
##  on subsequent window updates.  This behavior is unexpected and in
##  general undesirable.
##
##  @warning
##  To force an update of the output image, call vtkWindowToImageFilter's
##  Modified method after rendering to the window.
##
##  @warning
##  In VTK versions 4 and later, this filter is part of the canonical
##  way to output an image of a window to a file (replacing the
##  obsolete SaveImageAsPPM method for vtkRenderWindows that existed in
##  3.2 and earlier).  Connect this filter to the output of the window,
##  and filter's output to a writer such as vtkPNGWriter.
##
##  @warning
##  Reading back alpha planes is dependent on the correct operation of
##  the render window's GetRGBACharPixelData method, which in turn is
##  dependent on the configuration of the window's alpha planes.  As of
##  VTK 4.4+, machine-independent behavior is not automatically
##  assured because of these dependencies.
##
##  @sa
##  vtkRendererSource vtkRendererPointCloudSource vtkWindow
##  vtkRenderLargeImage
##

import
  vtkAlgorithm, vtkImageData, vtkRenderingCoreModule

##  VTK_RGB and VTK_RGBA are defined in system includes

const
  VTK_ZBUFFER* = 5

discard "forward decl of vtkWindow"
discard "forward decl of vtkWTI2DHelperClass"
type
  vtkWindowToImageFilter* {.importcpp: "vtkWindowToImageFilter",
                           header: "vtkWindowToImageFilter.h", bycopy.} = object of vtkAlgorithm
    vtkWindowToImageFilter* {.importc: "vtkWindowToImageFilter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkWindowToImageFilter {.importcpp: "vtkWindowToImageFilter::New(@)",
                                      header: "vtkWindowToImageFilter.h".}
type
  vtkWindowToImageFilterSuperclass* = vtkAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkWindowToImageFilter::IsTypeOf(@)",
    header: "vtkWindowToImageFilter.h".}
proc IsA*(this: var vtkWindowToImageFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkWindowToImageFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkWindowToImageFilter {.
    importcpp: "vtkWindowToImageFilter::SafeDownCast(@)",
    header: "vtkWindowToImageFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkWindowToImageFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkWindowToImageFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkWindowToImageFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkWindowToImageFilter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkWindowToImageFilter.h".}
proc SetInput*(this: var vtkWindowToImageFilter; input: ptr vtkWindow) {.
    importcpp: "SetInput", header: "vtkWindowToImageFilter.h".}
proc GetnameInput*(this: var vtkWindowToImageFilter): ptr vtkWindow {.
    importcpp: "GetnameInput", header: "vtkWindowToImageFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get/Set the scale (or magnification) factors in X and Y.
  ##
proc SetScale*(this: var vtkWindowToImageFilter; _arg1: cint; _arg2: cint) {.
    importcpp: "SetScale", header: "vtkWindowToImageFilter.h".}
proc SetScale*(this: var vtkWindowToImageFilter; _arg: array[2, cint]) {.
    importcpp: "SetScale", header: "vtkWindowToImageFilter.h".}
## !!!Ignored construct:  virtual int * GetScale ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Scale  pointer  << this -> Scale ) ; return this -> Scale ; } VTK_WRAPEXCLUDE virtual void GetScale ( int & _arg1 , int & _arg2 ) { _arg1 = this -> Scale [ 0 ] ; _arg2 = this -> Scale [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Scale  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetScale ( int _arg [ 2 ] ) { this -> GetScale ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetScale*(this: var vtkWindowToImageFilter; scale: cint) {.importcpp: "SetScale",
    header: "vtkWindowToImageFilter.h".}
proc SetFixBoundary*(this: var vtkWindowToImageFilter; _arg: bool) {.
    importcpp: "SetFixBoundary", header: "vtkWindowToImageFilter.h".}
## !!!Ignored construct:  virtual bool GetFixBoundary ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FixBoundary  of  << this -> FixBoundary ) ; return this -> FixBoundary ; } ;
## Error: expected ';'!!!

proc FixBoundaryOn*(this: var vtkWindowToImageFilter) {.importcpp: "FixBoundaryOn",
    header: "vtkWindowToImageFilter.h".}
proc FixBoundaryOff*(this: var vtkWindowToImageFilter) {.
    importcpp: "FixBoundaryOff", header: "vtkWindowToImageFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the flag that determines which buffer to read from.
  ##  The default is to read from the front buffer.
  ##
proc ReadFrontBufferOn*(this: var vtkWindowToImageFilter) {.
    importcpp: "ReadFrontBufferOn", header: "vtkWindowToImageFilter.h".}
proc ReadFrontBufferOff*(this: var vtkWindowToImageFilter) {.
    importcpp: "ReadFrontBufferOff", header: "vtkWindowToImageFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetFixBoundaryReadFrontBuffer ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReadFrontBuffer  of  << this -> ReadFrontBuffer ) ; return this -> ReadFrontBuffer ; } ;
## Error: expected ';'!!!

proc SetFixBoundaryReadFrontBuffer*(this: var vtkWindowToImageFilter;
                                   _arg: vtkTypeBool) {.
    importcpp: "SetFixBoundaryReadFrontBuffer", header: "vtkWindowToImageFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get whether to re-render the input window. Initial value is true.
  ##  (This option makes no difference if scale factor > 1.)
  ##
proc ShouldRerenderOn*(this: var vtkWindowToImageFilter) {.
    importcpp: "ShouldRerenderOn", header: "vtkWindowToImageFilter.h".}
proc ShouldRerenderOff*(this: var vtkWindowToImageFilter) {.
    importcpp: "ShouldRerenderOff", header: "vtkWindowToImageFilter.h".}
proc SetFixBoundaryReadFrontBufferShouldRerender*(
    this: var vtkWindowToImageFilter; _arg: vtkTypeBool) {.
    importcpp: "SetFixBoundaryReadFrontBufferShouldRerender",
    header: "vtkWindowToImageFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetFixBoundaryReadFrontBufferShouldRerender ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ShouldRerender  of  << this -> ShouldRerender ) ; return this -> ShouldRerender ; } ;
## Error: expected ';'!!!

proc SetViewport*(this: var vtkWindowToImageFilter; a2: cdouble; a3: cdouble;
                 a4: cdouble; a5: cdouble) {.importcpp: "SetViewport",
    header: "vtkWindowToImageFilter.h".}
proc SetViewport*(this: var vtkWindowToImageFilter; a2: ptr cdouble) {.
    importcpp: "SetViewport", header: "vtkWindowToImageFilter.h".}
## !!!Ignored construct:  virtual double * GetViewport ( ) VTK_SIZEHINT ( 4 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Viewport  pointer  << this -> Viewport ) ; return this -> Viewport ; } VTK_WRAPEXCLUDE virtual void GetViewport ( double data [ 4 ] ) { for ( int i = 0 ; i < 4 ; i ++ ) { data [ i ] = this -> Viewport [ i ] ; } } ;
## Error: expected ';'!!!

proc SetFixBoundaryReadFrontBufferShouldRerenderInputBufferType*(
    this: var vtkWindowToImageFilter; _arg: cint) {.
    importcpp: "SetFixBoundaryReadFrontBufferShouldRerenderInputBufferType",
    header: "vtkWindowToImageFilter.h".}
## !!!Ignored construct:  virtual int GetFixBoundaryReadFrontBufferShouldRerenderInputBufferType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InputBufferType  of  << this -> InputBufferType ) ; return this -> InputBufferType ; } ;
## Error: expected ';'!!!

proc SetInputBufferTypeToRGB*(this: var vtkWindowToImageFilter) {.
    importcpp: "SetInputBufferTypeToRGB", header: "vtkWindowToImageFilter.h".}
proc SetInputBufferTypeToRGBA*(this: var vtkWindowToImageFilter) {.
    importcpp: "SetInputBufferTypeToRGBA", header: "vtkWindowToImageFilter.h".}
proc SetInputBufferTypeToZBuffer*(this: var vtkWindowToImageFilter) {.
    importcpp: "SetInputBufferTypeToZBuffer", header: "vtkWindowToImageFilter.h".}
proc GetOutput*(this: var vtkWindowToImageFilter): ptr vtkImageData {.
    importcpp: "GetOutput", header: "vtkWindowToImageFilter.h".}
proc ProcessRequest*(this: var vtkWindowToImageFilter; a2: ptr vtkInformation;
                    a3: ptr ptr vtkInformationVector; a4: ptr vtkInformationVector): vtkTypeBool {.
    importcpp: "ProcessRequest", header: "vtkWindowToImageFilter.h".}