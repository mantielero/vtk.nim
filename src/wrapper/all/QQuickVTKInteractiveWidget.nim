## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    QQuickVTKInteractiveWidget.h
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
## *
##  @class QQuickVTKInteractiveWidget
##  @brief QObject that manages a VTK interactive widget to ensure that it behaves as per the QtQuick
##  threaded render loop.
##
##  QQuickVTKInteractiveWidget holds a weak reference to the vtk widget it manages.
##

##  Qt includes

##  vtk includes

import
  vtkWeakPointer, vtkGUISupportQtQuickModule

##  Forward declarations

discard "forward decl of vtkAbstractWidget"
discard "forward decl of vtkRenderer"
type
  QQuickVTKInteractiveWidget* {.importcpp: "QQuickVTKInteractiveWidget",
                               header: "QQuickVTKInteractiveWidget.h", bycopy.} = object of QObject ##  Helper members
    ##  Enabled/disabled


## !!!Ignored construct:  Q_PROPERTY ( bool enabled READ enabled WRITE setEnabled NOTIFY enabledChanged ) ;
## Error: token expected: ) but got: [identifier]!!!

proc constructQQuickVTKInteractiveWidget*(parent: ptr QObject = nil): QQuickVTKInteractiveWidget {.
    constructor, importcpp: "QQuickVTKInteractiveWidget(@)",
    header: "QQuickVTKInteractiveWidget.h".}
proc destroyQQuickVTKInteractiveWidget*(this: var QQuickVTKInteractiveWidget) {.
    importcpp: "#.~QQuickVTKInteractiveWidget()",
    header: "QQuickVTKInteractiveWidget.h".}
proc setWidget*(this: var QQuickVTKInteractiveWidget; w: ptr vtkAbstractWidget) {.
    importcpp: "setWidget", header: "QQuickVTKInteractiveWidget.h".}
proc widget*(this: QQuickVTKInteractiveWidget): ptr vtkAbstractWidget {.noSideEffect,
    importcpp: "widget", header: "QQuickVTKInteractiveWidget.h".}
proc setEnabled*(this: var QQuickVTKInteractiveWidget; e: bool) {.
    importcpp: "setEnabled", header: "QQuickVTKInteractiveWidget.h".}
proc enabled*(this: QQuickVTKInteractiveWidget): bool {.noSideEffect,
    importcpp: "enabled", header: "QQuickVTKInteractiveWidget.h".}
## !!!Ignored construct:  /@} public Q_SLOTS : virtual void sync ( vtkRenderer * ren ) ;
## Error: token expected: : but got: [identifier]!!!

## !!!Ignored construct:  Q_SIGNALS : void enabledChanged ( bool e ) ;
## Error: identifier expected, but got: :!!!
