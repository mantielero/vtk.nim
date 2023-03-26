## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkQtRecordView.h
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
##  @class   vtkQtRecordView
##  @brief   Superclass for QAbstractItemView-based views.
##
##
##  This superclass provides all the plumbing to integrate a QAbstractItemView
##  into the VTK view framework, including reporting selection changes and
##  detecting selection changes from linked views.
##
##  @par Thanks:
##  Thanks to Brian Wylie from Sandia National Laboratories for implementing
##  this class
##

import
  vtkQtView, vtkSmartPointer, vtkViewsQtModule

discard "forward decl of QTextEdit"
discard "forward decl of vtkDataObjectToTable"
type
  vtkQtRecordView* {.importcpp: "vtkQtRecordView", header: "vtkQtRecordView.h",
                    bycopy.} = object of vtkQtView
    vtkQtRecordView* {.importc: "vtkQtRecordView".}: VTK_NEWINSTANCE


## !!!Ignored construct:  Q_OBJECT public : static vtkQtRecordView * New ( ) ;
## Error: token expected: [integer literal] but got: [identifier]!!!

type
  vtkQtRecordViewSuperclass* = vtkQtView

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkQtRecordView::IsTypeOf(@)", header: "vtkQtRecordView.h".}
proc IsA*(this: var vtkQtRecordView; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkQtRecordView.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkQtRecordView {.
    importcpp: "vtkQtRecordView::SafeDownCast(@)", header: "vtkQtRecordView.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkQtRecordView :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkQtView :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkQtRecordView :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkQtRecordView :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkQtRecordView; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkQtRecordView.h".}
proc GetWidget*(this: var vtkQtRecordView): ptr QWidget {.importcpp: "GetWidget",
    header: "vtkQtRecordView.h".}
const
  vtkQtRecordViewFIELD_DATA* = 0
  vtkQtRecordViewPOINT_DATA* = 1
  vtkQtRecordViewCELL_DATA* = 2
  vtkQtRecordViewVERTEX_DATA* = 3
  vtkQtRecordViewEDGE_DATA* = 4
  vtkQtRecordViewROW_DATA* = 5

## !!!Ignored construct:  /@{ *
##  The field type to copy into the output table.
##  Should be one of FIELD_DATA, POINT_DATA, CELL_DATA, VERTEX_DATA, EDGE_DATA.
##  virtual int GetFieldTypeFieldType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FieldType  of  << this -> FieldType ) ; return this -> FieldType ; } ;
## Error: expected ';'!!!

proc SetFieldType*(this: var vtkQtRecordView; a2: cint) {.importcpp: "SetFieldType",
    header: "vtkQtRecordView.h".}
## !!!Ignored construct:  /@} virtual int GetFieldTypeFieldTypeCurrentRowCurrentRow ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CurrentRow  of  << this -> CurrentRow ) ; return this -> CurrentRow ; } ;
## Error: expected ';'!!!

proc GetText*(this: var vtkQtRecordView): cstring {.importcpp: "GetText",
    header: "vtkQtRecordView.h".}
  ## *
  ##  Updates the view.
  ##
proc Update*(this: var vtkQtRecordView) {.importcpp: "Update",
                                      header: "vtkQtRecordView.h".}