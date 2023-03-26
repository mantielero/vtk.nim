## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    QVTKRenderWindowAdapter.h
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
##  @class QVTKRenderWindowAdapter
##  @brief Helper to manage Qt context and other OpenGL components
##
##  QVTKRenderWindowAdapter is an internal class that is used by
##  QVTKOpenGLNativeWidget and QVTKOpenGLWindow to manage the rendering using
##  vtkGenericOpenGLRenderWindow within a OpenGL context created via Qt.
##
##  QVTKRenderWindowAdapter is expected to be recreated anytime the context
##  changes. In the constructor, QVTKRenderWindowAdapter will mark the
##  vtkGenericOpenGLRenderWindow ready for rendering and call OpenGL context
##  initialization API (vtkOpenGLRenderWindow::OpenGLInitContext).
##
##  By observing events on vtkGenericOpenGLRenderWindow, QVTKRenderWindowAdapter
##  can then support rendering to an internally created FBO via VTK's rendering
##  calls. Making sure that the rendering results are shown on the screen is
##  handled by QVTKOpenGLWindow or QVTKOpenGLNativeWidget.
##

import
  vtkGUISupportQtModule

discard "forward decl of QOpenGLContext"
discard "forward decl of QSurfaceFormat"
discard "forward decl of QWidget"
discard "forward decl of QWindow"
discard "forward decl of vtkGenericOpenGLRenderWindow"
discard "forward decl of vtkObject"
type
  QVTKRenderWindowAdapter* {.importcpp: "QVTKRenderWindowAdapter",
                            header: "QVTKRenderWindowAdapter.h", bycopy.} = object of QObject ## /@{
                                                                                       ## *
                                                                                       ##  Constructor that makes vtkGenericOpenGLRenderWindow ready for subsequent
                                                                                       ##  render requests i.e. calls
                                                                                       ##  `vtkGenericOpenGLRenderWindow::SetReadyForRendering(true)`. This also calls
                                                                                       ##  `vtkOpenGLRenderWindow::OpenGLInitContext` to ensure that the OpenGL
                                                                                       ##  context is ready for VTK rendering.
                                                                                       ##


## !!!Ignored construct:  Q_OBJECT ;
## Error: identifier expected, but got: ;!!!

type
  Superclass* = QObject

proc constructQVTKRenderWindowAdapter*(cntxt: ptr QOpenGLContext;
                                      window: ptr vtkGenericOpenGLRenderWindow;
                                      parent: ptr QWindow): QVTKRenderWindowAdapter {.
    constructor, importcpp: "QVTKRenderWindowAdapter(@)",
    header: "QVTKRenderWindowAdapter.h".}
proc constructQVTKRenderWindowAdapter*(cntxt: ptr QOpenGLContext;
                                      window: ptr vtkGenericOpenGLRenderWindow;
                                      parent: ptr QWidget): QVTKRenderWindowAdapter {.
    constructor, importcpp: "QVTKRenderWindowAdapter(@)",
    header: "QVTKRenderWindowAdapter.h".}
proc destroyQVTKRenderWindowAdapter*(this: var QVTKRenderWindowAdapter) {.
    importcpp: "#.~QVTKRenderWindowAdapter()", header: "QVTKRenderWindowAdapter.h".}
proc defaultFormat*(stereo_capable: bool = false): QSurfaceFormat {.
    importcpp: "QVTKRenderWindowAdapter::defaultFormat(@)",
    header: "QVTKRenderWindowAdapter.h".}
proc context*(this: QVTKRenderWindowAdapter): ptr QOpenGLContext {.noSideEffect,
    importcpp: "context", header: "QVTKRenderWindowAdapter.h".}
proc paint*(this: var QVTKRenderWindowAdapter) {.importcpp: "paint",
    header: "QVTKRenderWindowAdapter.h".}
proc resize*(this: var QVTKRenderWindowAdapter; width: cint; height: cint) {.
    importcpp: "resize", header: "QVTKRenderWindowAdapter.h".}
proc blit*(this: var QVTKRenderWindowAdapter; targetId: cuint;
          targetAttachement: cint; targetRect: QRect; left: bool = true): bool {.
    importcpp: "blit", header: "QVTKRenderWindowAdapter.h".}
proc blitLeftEye*(this: var QVTKRenderWindowAdapter; targetId: cuint;
                 targetAttachement: cint; targetRect: QRect): bool {.
    importcpp: "blitLeftEye", header: "QVTKRenderWindowAdapter.h".}
proc blitRightEye*(this: var QVTKRenderWindowAdapter; targetId: cuint;
                  targetAttachement: cint; targetRect: QRect): bool {.
    importcpp: "blitRightEye", header: "QVTKRenderWindowAdapter.h".}
proc handleEvent*(this: var QVTKRenderWindowAdapter; evt: ptr QEvent): bool {.
    importcpp: "handleEvent", header: "QVTKRenderWindowAdapter.h".}
proc setDefaultCursor*(this: var QVTKRenderWindowAdapter; cursor: QCursor) {.
    importcpp: "setDefaultCursor", header: "QVTKRenderWindowAdapter.h".}
proc defaultCursor*(this: QVTKRenderWindowAdapter): QCursor {.noSideEffect,
    importcpp: "defaultCursor", header: "QVTKRenderWindowAdapter.h".}
proc setEnableHiDPI*(this: var QVTKRenderWindowAdapter; value: bool) {.
    importcpp: "setEnableHiDPI", header: "QVTKRenderWindowAdapter.h".}
proc setUnscaledDPI*(this: var QVTKRenderWindowAdapter; value: cint) {.
    importcpp: "setUnscaledDPI", header: "QVTKRenderWindowAdapter.h".}
proc setCustomDevicePixelRatio*(this: var QVTKRenderWindowAdapter; dpr: cdouble) {.
    importcpp: "setCustomDevicePixelRatio", header: "QVTKRenderWindowAdapter.h".}
## !!!Ignored construct:  /@} private Q_SLOTS : void contextAboutToBeDestroyed ( ) ;
## Error: token expected: : but got: [identifier]!!!
