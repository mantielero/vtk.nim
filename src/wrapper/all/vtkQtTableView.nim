## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkQtTableView.h
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
##  @class   vtkQtTableView
##  @brief   A VTK view based on a Qt Table view.
##
##
##  vtkQtTableView is a VTK view using an underlying QTableView.
##
##  @par Thanks:
##  Thanks to Brian Wylie from Sandia National Laboratories for implementing
##  this class
##

## !!!Ignored construct:  # vtkQtTableView_h [NewLine] # vtkQtTableView_h [NewLine] # vtkQtView.h [NewLine] # vtkViewsQtModule.h  For export macro [NewLine] # vtkSmartPointer.h  Needed for member variables # < QPointer >  Needed to hold the view [NewLine] class vtkAddMembershipArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkApplyColors"
discard "forward decl of vtkDataObjectToTable"
discard "forward decl of vtkIdTypeArray"
discard "forward decl of QItemSelection"
discard "forward decl of QSortFilterProxyModel"
discard "forward decl of QTableView"
discard "forward decl of vtkQtTableModelAdapter"
## !!!Ignored construct:  class VTKVIEWSQT_EXPORT vtkQtTableView : public vtkQtView { Q_OBJECT public : static vtkQtTableView * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkQtView Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkQtView :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkQtTableView :: IsTypeOf ( type ) ; } static vtkQtTableView * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkQtTableView * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkQtTableView * NewInstance ( ) const { return vtkQtTableView :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkQtView :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkQtTableView :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkQtTableView :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Get the main container of this view (a  QWidget).
##  The application typically places the view with a call
##  to GetWidget(): something like this
##  this->ui->box->layout()->addWidget(this->View->GetWidget());
##  QWidget * GetWidget ( ) override ; *
##  Have the view show/hide its column headers
##  void SetShowVerticalHeaders ( bool ) ; *
##  Have the view show/hide its row headers
##  void SetShowHorizontalHeaders ( bool ) ; enum { FIELD_DATA = 0 , POINT_DATA = 1 , CELL_DATA = 2 , VERTEX_DATA = 3 , EDGE_DATA = 4 , ROW_DATA = 5 , } ; /@{ *
##  The field type to copy into the output table.
##  Should be one of FIELD_DATA, POINT_DATA, CELL_DATA, VERTEX_DATA, EDGE_DATA.
##  virtual int GetFieldType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FieldType  of  << this -> FieldType ) ; return this -> FieldType ; } ; void SetFieldType ( int ) ; /@} *
##  Enable drag and drop on this widget
##  void SetEnableDragDrop ( bool ) ; *
##  Whether the table allows individual columns to be sorted upon
##  Sorting is enabled by default (turn off for large tables);
##  void SetSortingEnabled ( bool ) ; /@{ *
##  Whether or not to display all columns from the input table or to use the
##  ColumnName provided.
##  FIXME: This should be replaced with an Add/Remove column API.
##  void SetShowAll ( bool ) ; virtual bool GetFieldTypeShowAll ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ShowAll  of  << this -> ShowAll ) ; return this -> ShowAll ; } ; /@} /@{ *
##  The name of a single column to display.
##  FIXME: This should be replaced with an Add/Remove column API.
##  virtual void SetColumnName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ColumnName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> ColumnName == nullptr && _arg == nullptr ) { return ; } if ( this -> ColumnName && _arg && ( ! strcmp ( this -> ColumnName , _arg ) ) ) { return ; } delete [ ] this -> ColumnName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> ColumnName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> ColumnName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetColumnName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << ColumnName  of  << ( this -> ColumnName ? this -> ColumnName : (null) ) ) ; return this -> ColumnName ; } ; /@} void SetColumnVisibility ( const QString & name , bool status ) ; *
##  Set whether or not the table view should split multi-component columns
##  into multiple single-component columns
##  void SetSplitMultiComponentColumns ( bool value ) ; *
##  Get whether or not the table view splits multi-component columns into
##  multiple single-component columns
##  bool GetSplitMultiComponentColumns ( ) ; /@{ *
##  Whether or not to sort selections that the view receives to the top
##  void SetSortSelectionToTop ( bool value ) ; virtual bool GetFieldTypeShowAllSortSelectionToTop ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SortSelectionToTop  of  << this -> SortSelectionToTop ) ; return this -> SortSelectionToTop ; } ; /@} /@{ *
##  Whether or not to add an icon to the row header denoting the color
##  of an annotated row.
##  void SetApplyRowColors ( bool value ) ; virtual bool GetFieldTypeShowAllSortSelectionToTopApplyRowColors ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ApplyRowColors  of  << this -> ApplyRowColors ) ; return this -> ApplyRowColors ; } ; /@} *
##  Updates the view.
##  void Update ( ) override ; /@{ *
##  The array to use for coloring items in view.  Default is "color".
##  void SetColorArrayName ( const char * name ) ; const char * GetColorArrayName ( ) ; /@} /@{ *
##  Whether to color vertices.  Default is off.
##  void SetColorByArray ( bool vis ) ; bool GetColorByArray ( ) ; virtual void ColorByArrayOn ( ) { this -> SetColorByArray ( static_cast < bool > ( 1 ) ) ; } virtual void ColorByArrayOff ( ) { this -> SetColorByArray ( static_cast < bool > ( 0 ) ) ; } ; /@} *
##  Apply a view theme to this view.
##  void ApplyViewTheme ( vtkViewTheme * theme ) override ; enum { SELECT_ITEMS = 0 , SELECT_ROWS , SELECT_COLUMNS } ; /@{ *
##  The selection mode for this view.
##  SELECT_ITEMS (0) selects single items.
##  SELECT_ROWS (1) selects rows.
##  SELECT_COLUMNS (2) selects columns.
##  Linked selection only works when in the default mode
##  SELECT_ROWS. Selections from other modes may be retrieved
##  using GetSelectedItems().
##  virtual void SetSelectionBehavior ( int type ) ; virtual int GetSelectionBehavior ( ) ; /@} *
##  Fills the array with the selected items of the view.
##  If the selection behavior is SELECT_ITEMS,
##  arr will be a 2-component array containing (row,column)
##  for each selected item.
##  If the selection behavior is SELECT_ROWS or SELECT_COLUMNS,
##  arr will contain a list of row or column indices.
##  virtual void GetSelectedItems ( vtkIdTypeArray * arr ) ; protected : vtkQtTableView ( ) ; ~ vtkQtTableView ( ) override ; void AddRepresentationInternal ( vtkDataRepresentation * rep ) override ; void RemoveRepresentationInternal ( vtkDataRepresentation * rep ) override ; private Q_SLOTS : void slotQtSelectionChanged ( const QItemSelection & , const QItemSelection & ) ; private : void SetVTKSelection ( ) ; vtkMTimeType LastSelectionMTime ; vtkMTimeType LastInputMTime ; vtkMTimeType LastMTime ; virtual void SetColumnNameColorArrayNameInternal ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ColorArrayNameInternal  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> ColorArrayNameInternal == nullptr && _arg == nullptr ) { return ; } if ( this -> ColorArrayNameInternal && _arg && ( ! strcmp ( this -> ColorArrayNameInternal , _arg ) ) ) { return ; } delete [ ] this -> ColorArrayNameInternal ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> ColorArrayNameInternal = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> ColorArrayNameInternal = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetColumnNameColorArrayNameInternal ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << ColorArrayNameInternal  of  << ( this -> ColorArrayNameInternal ? this -> ColorArrayNameInternal : (null) ) ) ; return this -> ColorArrayNameInternal ; } ; QPointer < QTableView > TableView ; vtkQtTableModelAdapter * TableAdapter ; QSortFilterProxyModel * TableSorter ; int FieldType ; bool ShowAll ; char * ColumnName ; bool InSelectionChanged ; bool SortSelectionToTop ; bool ApplyRowColors ; char * ColorArrayNameInternal ; vtkSmartPointer < vtkAddMembershipArray > AddSelectedColumn ; vtkSmartPointer < vtkDataObjectToTable > DataObjectToTable ; vtkSmartPointer < vtkApplyColors > ApplyColors ; vtkQtTableView ( const vtkQtTableView & ) = delete ; void operator = ( const vtkQtTableView & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
