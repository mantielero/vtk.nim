## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkQtAnnotationView.h
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
##  @class   vtkQtAnnotationView
##  @brief   A VTK view that displays the annotations
##     on its annotation link.
##
##
##  vtkQtAnnotationView is a VTK view using an underlying QTableView.
##
##

import
  vtkQtView, vtkViewsQtModule

discard "forward decl of vtkQtAnnotationLayersModelAdapter"
discard "forward decl of QItemSelection"
discard "forward decl of QTableView"
type
  vtkQtAnnotationView* {.importcpp: "vtkQtAnnotationView",
                        header: "vtkQtAnnotationView.h", bycopy.} = object of vtkQtView
    vtkQtAnnotationView* {.importc: "vtkQtAnnotationView".}: VTK_NEWINSTANCE


## !!!Ignored construct:  Q_OBJECT public : static vtkQtAnnotationView * New ( ) ;
## Error: token expected: [integer literal] but got: [identifier]!!!

type
  vtkQtAnnotationViewSuperclass* = vtkQtView

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkQtAnnotationView::IsTypeOf(@)", header: "vtkQtAnnotationView.h".}
proc IsA*(this: var vtkQtAnnotationView; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkQtAnnotationView.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkQtAnnotationView {.
    importcpp: "vtkQtAnnotationView::SafeDownCast(@)",
    header: "vtkQtAnnotationView.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkQtAnnotationView :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkQtView :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkQtAnnotationView :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkQtAnnotationView :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkQtAnnotationView; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkQtAnnotationView.h".}
proc GetWidget*(this: var vtkQtAnnotationView): ptr QWidget {.importcpp: "GetWidget",
    header: "vtkQtAnnotationView.h".}
proc Update*(this: var vtkQtAnnotationView) {.importcpp: "Update",
    header: "vtkQtAnnotationView.h".}
## !!!Ignored construct:  private Q_SLOTS : void slotQtSelectionChanged ( const QItemSelection & , const QItemSelection & ) ;
## Error: token expected: : but got: [identifier]!!!
