## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkQtTreeView.h
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
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkQtTreeView
##  @brief   A VTK view based on a Qt tree view.
##
##
##  vtkQtTreeView is a VTK view using an underlying QTreeView.
##
##  @par Thanks:
##  Thanks to Brian Wylie from Sandia National Laboratories for implementing
##  this class
##

import
  vtkQtView, vtkViewsQtModule, vtkSmartPointer

discard "forward decl of QAbstractItemDelegate"
discard "forward decl of QAbstractItemView"
discard "forward decl of QFilterTreeProxyModel"
discard "forward decl of QColumnView"
discard "forward decl of QItemSelection"
discard "forward decl of QModelIndex"
discard "forward decl of QTreeView"
discard "forward decl of vtkApplyColors"
discard "forward decl of QVBoxLayout"
discard "forward decl of vtkQtTreeModelAdapter"
discard "forward decl of QItemSelectionModel"
type
  vtkQtTreeView* {.importcpp: "vtkQtTreeView", header: "vtkQtTreeView.h", bycopy.} = object of vtkQtView
    vtkQtTreeView* {.importc: "vtkQtTreeView".}: VTK_NEWINSTANCE


## !!!Ignored construct:  Q_OBJECT Q_SIGNALS : void expanded ( const QModelIndex & ) ;
## Error: token expected: [integer literal] but got: [identifier]!!!

proc New*(): ptr vtkQtTreeView {.importcpp: "vtkQtTreeView::New(@)",
                             header: "vtkQtTreeView.h".}
type
  vtkQtTreeViewSuperclass* = vtkQtView

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkQtTreeView::IsTypeOf(@)", header: "vtkQtTreeView.h".}
proc IsA*(this: var vtkQtTreeView; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkQtTreeView.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkQtTreeView {.
    importcpp: "vtkQtTreeView::SafeDownCast(@)", header: "vtkQtTreeView.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkQtTreeView :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkQtView :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkQtTreeView :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkQtTreeView :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkQtTreeView; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkQtTreeView.h".}
proc GetWidget*(this: var vtkQtTreeView): ptr QWidget {.importcpp: "GetWidget",
    header: "vtkQtTreeView.h".}
proc SetShowHeaders*(this: var vtkQtTreeView; a2: bool) {.importcpp: "SetShowHeaders",
    header: "vtkQtTreeView.h".}
proc SetAlternatingRowColors*(this: var vtkQtTreeView; a2: bool) {.
    importcpp: "SetAlternatingRowColors", header: "vtkQtTreeView.h".}
proc SetEnableDragDrop*(this: var vtkQtTreeView; a2: bool) {.
    importcpp: "SetEnableDragDrop", header: "vtkQtTreeView.h".}
proc SetShowRootNode*(this: var vtkQtTreeView; a2: bool) {.
    importcpp: "SetShowRootNode", header: "vtkQtTreeView.h".}
proc HideColumn*(this: var vtkQtTreeView; i: cint) {.importcpp: "HideColumn",
    header: "vtkQtTreeView.h".}
proc ShowColumn*(this: var vtkQtTreeView; i: cint) {.importcpp: "ShowColumn",
    header: "vtkQtTreeView.h".}
proc HideAllButFirstColumn*(this: var vtkQtTreeView) {.
    importcpp: "HideAllButFirstColumn", header: "vtkQtTreeView.h".}
proc SetFilterColumn*(this: var vtkQtTreeView; i: cint) {.
    importcpp: "SetFilterColumn", header: "vtkQtTreeView.h".}
when (QT_VERSION >= QT_VERSION_CHECK(5, 12, 0)):
  proc SetFilterRegExp*(this: var vtkQtTreeView; pattern: QRegularExpression) {.
      importcpp: "SetFilterRegExp", header: "vtkQtTreeView.h".}
when not (QT_VERSION >= QT_VERSION_CHECK(5, 12, 0)):
  proc SetFilterRegExp*(this: var vtkQtTreeView; pattern: QRegExp) {.
      importcpp: "SetFilterRegExp", header: "vtkQtTreeView.h".}
proc SetFilterTreeLevel*(this: var vtkQtTreeView; level: cint) {.
    importcpp: "SetFilterTreeLevel", header: "vtkQtTreeView.h".}
proc Collapse*(this: var vtkQtTreeView; index: QModelIndex) {.importcpp: "Collapse",
    header: "vtkQtTreeView.h".}
proc CollapseAll*(this: var vtkQtTreeView) {.importcpp: "CollapseAll",
    header: "vtkQtTreeView.h".}
proc Expand*(this: var vtkQtTreeView; index: QModelIndex) {.importcpp: "Expand",
    header: "vtkQtTreeView.h".}
proc ExpandAll*(this: var vtkQtTreeView) {.importcpp: "ExpandAll",
                                       header: "vtkQtTreeView.h".}
proc ExpandToDepth*(this: var vtkQtTreeView; depth: cint) {.
    importcpp: "ExpandToDepth", header: "vtkQtTreeView.h".}
proc ResizeColumnToContents*(this: var vtkQtTreeView; column: cint) {.
    importcpp: "ResizeColumnToContents", header: "vtkQtTreeView.h".}
proc SetUseColumnView*(this: var vtkQtTreeView; state: cint) {.
    importcpp: "SetUseColumnView", header: "vtkQtTreeView.h".}
proc Update*(this: var vtkQtTreeView) {.importcpp: "Update", header: "vtkQtTreeView.h".}
proc SetItemDelegate*(this: var vtkQtTreeView; delegate: ptr QAbstractItemDelegate) {.
    importcpp: "SetItemDelegate", header: "vtkQtTreeView.h".}
proc SetColorArrayName*(this: var vtkQtTreeView; name: cstring) {.
    importcpp: "SetColorArrayName", header: "vtkQtTreeView.h".}
proc GetColorArrayName*(this: var vtkQtTreeView): cstring {.
    importcpp: "GetColorArrayName", header: "vtkQtTreeView.h".}
proc SetColorByArray*(this: var vtkQtTreeView; vis: bool) {.
    importcpp: "SetColorByArray", header: "vtkQtTreeView.h".}
proc GetColorByArray*(this: var vtkQtTreeView): bool {.importcpp: "GetColorByArray",
    header: "vtkQtTreeView.h".}
proc ColorByArrayOn*(this: var vtkQtTreeView) {.importcpp: "ColorByArrayOn",
    header: "vtkQtTreeView.h".}
proc ColorByArrayOff*(this: var vtkQtTreeView) {.importcpp: "ColorByArrayOff",
    header: "vtkQtTreeView.h".}
  ## /@}
proc ApplyViewTheme*(this: var vtkQtTreeView; theme: ptr vtkViewTheme) {.
    importcpp: "ApplyViewTheme", header: "vtkQtTreeView.h".}
## !!!Ignored construct:  private Q_SLOTS : void slotQtSelectionChanged ( const QItemSelection & , const QItemSelection & ) ;
## Error: token expected: : but got: [identifier]!!!
