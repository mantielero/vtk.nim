## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    QQuickVTKInteractorAdapter.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##   This software is distributed WITHOUT ANY WARRANTY; without even
##   the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##   PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================

##  VTK includes

import
  QVTKInteractorAdapter, vtkGUISupportQtQuickModule

##  Qt includes

##  Forward declarations

discard "forward decl of QEnterEvent"
discard "forward decl of QEvent"
discard "forward decl of QFocusEvent"
discard "forward decl of QHoverEvent"
discard "forward decl of QKeyEvent"
discard "forward decl of QMouseEvent"
discard "forward decl of QQuickItem"
discard "forward decl of QQuickWindow"
discard "forward decl of QWheelEvent"
discard "forward decl of vtkRenderWindowInteractor"
discard "forward decl of vtkRenderer"
type
  QQuickVTKInteractorAdapter* {.importcpp: "QQuickVTKInteractorAdapter",
                               header: "QQuickVTKInteractorAdapter.h", bycopy.} = object of QVTKInteractorAdapter


proc constructQQuickVTKInteractorAdapter*(parent: ptr QObject = nil): QQuickVTKInteractorAdapter {.
    constructor, importcpp: "QQuickVTKInteractorAdapter(@)",
    header: "QQuickVTKInteractorAdapter.h".}
proc setQQuickWindow*(this: var QQuickVTKInteractorAdapter; win: ptr QQuickWindow) {.
    importcpp: "setQQuickWindow", header: "QQuickVTKInteractorAdapter.h".}
proc QueueHoverEvent*(this: var QQuickVTKInteractorAdapter; item: ptr QQuickItem;
                     e: ptr QHoverEvent) {.importcpp: "QueueHoverEvent",
                                        header: "QQuickVTKInteractorAdapter.h".}
proc QueueKeyEvent*(this: var QQuickVTKInteractorAdapter; item: ptr QQuickItem;
                   e: ptr QKeyEvent) {.importcpp: "QueueKeyEvent",
                                    header: "QQuickVTKInteractorAdapter.h".}
proc QueueFocusEvent*(this: var QQuickVTKInteractorAdapter; item: ptr QQuickItem;
                     e: ptr QFocusEvent) {.importcpp: "QueueFocusEvent",
                                        header: "QQuickVTKInteractorAdapter.h".}
proc QueueMouseEvent*(this: var QQuickVTKInteractorAdapter; item: ptr QQuickItem;
                     e: ptr QMouseEvent) {.importcpp: "QueueMouseEvent",
                                        header: "QQuickVTKInteractorAdapter.h".}
proc QueueGeometryChanged*(this: var QQuickVTKInteractorAdapter;
                          newGeometry: QRectF; oldGeometry: QRectF) {.
    importcpp: "QueueGeometryChanged", header: "QQuickVTKInteractorAdapter.h".}
proc QueueWheelEvent*(this: var QQuickVTKInteractorAdapter; item: ptr QQuickItem;
                     e: ptr QWheelEvent) {.importcpp: "QueueWheelEvent",
                                        header: "QQuickVTKInteractorAdapter.h".}
proc ProcessEvents*(this: var QQuickVTKInteractorAdapter;
                   interactor: ptr vtkRenderWindowInteractor) {.
    importcpp: "ProcessEvents", header: "QQuickVTKInteractorAdapter.h".}
proc mapEventPosition*(item: ptr QQuickItem; localPos: QPointF): QPointF {.
    importcpp: "QQuickVTKInteractorAdapter::mapEventPosition(@)",
    header: "QQuickVTKInteractorAdapter.h".}
proc mapEventPositionFlipY*(item: ptr QQuickItem; localPos: QPointF): QPointF {.
    importcpp: "QQuickVTKInteractorAdapter::mapEventPositionFlipY(@)",
    header: "QQuickVTKInteractorAdapter.h".}