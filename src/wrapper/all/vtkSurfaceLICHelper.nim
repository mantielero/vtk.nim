## =========================================================================
##
##   Program:   Visualization Toolkit
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
##  @class   vtkSurfaceLICHelper
##  @brief   A small collection of noise routines for LIC
##

import
  vtkOpenGLHelper, vtkPixelExtent, vtkRenderingLICOpenGL2Module, vtkSmartPointer,
  vtkTextureObject, vtkWeakPointer, vtk_glew

discard "forward decl of vtkOpenGLFramebufferObject"
discard "forward decl of vtkOpenGLRenderWindow"
discard "forward decl of vtkPainterCommunicator"
discard "forward decl of vtkImageData"
discard "forward decl of vtkSurfaceLICComposite"
discard "forward decl of vtkLineIntegralConvolution2D"
discard "forward decl of vtkRenderer"
discard "forward decl of vtkActor"
discard "forward decl of vtkDataObject"
type
  vtkSurfaceLICHelper* {.importcpp: "vtkSurfaceLICHelper",
                        header: "vtkSurfaceLICHelper.h", bycopy.} = object
    Noise* {.importc: "Noise".}: vtkSmartPointer[vtkImageData]
    NoiseImage* {.importc: "NoiseImage".}: vtkSmartPointer[vtkTextureObject]
    DepthImage* {.importc: "DepthImage".}: vtkSmartPointer[vtkTextureObject]
    GeometryImage* {.importc: "GeometryImage".}: vtkSmartPointer[vtkTextureObject]
    VectorImage* {.importc: "VectorImage".}: vtkSmartPointer[vtkTextureObject]
    CompositeVectorImage* {.importc: "CompositeVectorImage".}: vtkSmartPointer[
        vtkTextureObject]
    MaskVectorImage* {.importc: "MaskVectorImage".}: vtkSmartPointer[
        vtkTextureObject]
    CompositeMaskVectorImage* {.importc: "CompositeMaskVectorImage".}: vtkSmartPointer[
        vtkTextureObject]
    LICImage* {.importc: "LICImage".}: vtkSmartPointer[vtkTextureObject]
    RGBColorImage* {.importc: "RGBColorImage".}: vtkSmartPointer[vtkTextureObject]
    HSLColorImage* {.importc: "HSLColorImage".}: vtkSmartPointer[vtkTextureObject]
    HasVectors* {.importc: "HasVectors".}: bool
    BlockExts* {.importc: "BlockExts".}: deque[vtkPixelExtent]
    ColorEnhancePass* {.importc: "ColorEnhancePass".}: ptr vtkOpenGLHelper
    CopyPass* {.importc: "CopyPass".}: ptr vtkOpenGLHelper
    ColorPass* {.importc: "ColorPass".}: ptr vtkOpenGLHelper
    Viewsize* {.importc: "Viewsize".}: array[2, cint]
    Compositor* {.importc: "Compositor".}: vtkSmartPointer[vtkSurfaceLICComposite]
    FBO* {.importc: "FBO".}: vtkSmartPointer[vtkOpenGLFramebufferObject]
    LICer* {.importc: "LICer".}: vtkSmartPointer[vtkLineIntegralConvolution2D]
    Communicator* {.importc: "Communicator".}: ptr vtkPainterCommunicator
    DataSetExt* {.importc: "DataSetExt".}: vtkPixelExtent
    Context* {.importc: "Context".}: vtkWeakPointer[vtkOpenGLRenderWindow]
    ContextNeedsUpdate* {.importc: "ContextNeedsUpdate".}: bool
    CommunicatorNeedsUpdate* {.importc: "CommunicatorNeedsUpdate".}: bool


proc constructvtkSurfaceLICHelper*(): vtkSurfaceLICHelper {.constructor,
    importcpp: "vtkSurfaceLICHelper(@)", header: "vtkSurfaceLICHelper.h".}
proc destroyvtkSurfaceLICHelper*(this: var vtkSurfaceLICHelper) {.
    importcpp: "#.~vtkSurfaceLICHelper()", header: "vtkSurfaceLICHelper.h".}
proc IsSupported*(context: ptr vtkOpenGLRenderWindow): bool {.
    importcpp: "vtkSurfaceLICHelper::IsSupported(@)",
    header: "vtkSurfaceLICHelper.h".}
proc ReleaseGraphicsResources*(this: var vtkSurfaceLICHelper; win: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkSurfaceLICHelper.h".}
proc ClearTextures*(this: var vtkSurfaceLICHelper) {.importcpp: "ClearTextures",
    header: "vtkSurfaceLICHelper.h".}
proc AllocateTextures*(this: var vtkSurfaceLICHelper;
                      context: ptr vtkOpenGLRenderWindow; viewsize: ptr cint) {.
    importcpp: "AllocateTextures", header: "vtkSurfaceLICHelper.h".}
proc AllocateTexture*(this: var vtkSurfaceLICHelper;
                     context: ptr vtkOpenGLRenderWindow; viewsize: ptr cint;
                     tex: var vtkSmartPointer[vtkTextureObject];
                     filter: cint = Nearest) {.importcpp: "AllocateTexture",
    header: "vtkSurfaceLICHelper.h".}
proc AllocateDepthTexture*(this: var vtkSurfaceLICHelper;
                          context: ptr vtkOpenGLRenderWindow; viewsize: ptr cint;
                          tex: var vtkSmartPointer[vtkTextureObject]) {.
    importcpp: "AllocateDepthTexture", header: "vtkSurfaceLICHelper.h".}
proc Updated*(this: var vtkSurfaceLICHelper) {.importcpp: "Updated",
    header: "vtkSurfaceLICHelper.h".}
proc UpdateAll*(this: var vtkSurfaceLICHelper) {.importcpp: "UpdateAll",
    header: "vtkSurfaceLICHelper.h".}
proc ViewportQuadTextureCoords*(this: var vtkSurfaceLICHelper; tcoords: ptr GLfloat) {.
    importcpp: "ViewportQuadTextureCoords", header: "vtkSurfaceLICHelper.h".}
proc ViewportQuadPoints*(this: var vtkSurfaceLICHelper; viewportExt: vtkPixelExtent;
                        quadpts: ptr GLfloat) {.importcpp: "ViewportQuadPoints",
    header: "vtkSurfaceLICHelper.h".}
proc ViewportQuadTextureCoords*(this: var vtkSurfaceLICHelper;
                               viewExt: vtkPixelExtent;
                               viewportExt: vtkPixelExtent; tcoords: ptr GLfloat) {.
    importcpp: "ViewportQuadTextureCoords", header: "vtkSurfaceLICHelper.h".}
proc ViewQuadPoints*(this: var vtkSurfaceLICHelper; quadpts: ptr GLfloat) {.
    importcpp: "ViewQuadPoints", header: "vtkSurfaceLICHelper.h".}
proc ViewQuadTextureCoords*(this: var vtkSurfaceLICHelper; tcoords: ptr GLfloat) {.
    importcpp: "ViewQuadTextureCoords", header: "vtkSurfaceLICHelper.h".}
proc RenderQuad*(this: var vtkSurfaceLICHelper; viewExt: vtkPixelExtent;
                viewportExt: vtkPixelExtent; cbo: ptr vtkOpenGLHelper) {.
    importcpp: "RenderQuad", header: "vtkSurfaceLICHelper.h".}
proc idx*(this: var vtkSurfaceLICHelper; row: cint; col: cint): cint {.importcpp: "idx",
    header: "vtkSurfaceLICHelper.h".}
proc VisibilityTest*(this: var vtkSurfaceLICHelper; ndcBBox: array[24, cdouble]): bool {.
    importcpp: "VisibilityTest", header: "vtkSurfaceLICHelper.h".}
proc ProjectBounds*(this: var vtkSurfaceLICHelper; PMV: array[16, cdouble];
                   viewsize: array[2, cint]; bounds: array[6, cdouble];
                   screenExt: var vtkPixelExtent): bool {.
    importcpp: "ProjectBounds", header: "vtkSurfaceLICHelper.h".}
proc ProjectBounds*(this: var vtkSurfaceLICHelper; ren: ptr vtkRenderer;
                   actor: ptr vtkActor; dobj: ptr vtkDataObject;
                   viewsize: array[2, cint]; dataExt: var vtkPixelExtent;
                   blockExts: var deque[vtkPixelExtent]): cint {.
    importcpp: "ProjectBounds", header: "vtkSurfaceLICHelper.h".}
proc GetPixelBounds*(this: var vtkSurfaceLICHelper; rgba: ptr cfloat; ni: cint;
                    ext: var vtkPixelExtent) {.importcpp: "GetPixelBounds",
    header: "vtkSurfaceLICHelper.h".}
proc GetPixelBounds*(this: var vtkSurfaceLICHelper; rgba: ptr cfloat; ni: cint;
                    blockExts: var deque[vtkPixelExtent]) {.
    importcpp: "GetPixelBounds", header: "vtkSurfaceLICHelper.h".}
proc StreamingFindMinMax*(fbo: ptr vtkOpenGLFramebufferObject;
                         blockExts: var deque[vtkPixelExtent]; min: var cfloat;
                         max: var cfloat) {.
    importcpp: "vtkSurfaceLICHelper::StreamingFindMinMax(@)",
    header: "vtkSurfaceLICHelper.h".}
##  VTK-HeaderTest-Exclude: vtkSurfaceLICHelper.h
