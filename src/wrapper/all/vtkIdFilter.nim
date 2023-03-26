## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkIdFilter.h
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
##  @class   vtkIdFilter
##  @brief   generate scalars or field data from point and cell ids
##
##  vtkIdFilter is a filter to that generates scalars or field data
##  using cell and point ids. That is, the point attribute data scalars
##  or field data are generated from the point ids, and the cell
##  attribute data scalars or field data are generated from the
##  cell ids.
##
##  Typically this filter is used with vtkLabeledDataMapper (and possibly
##  vtkSelectVisiblePoints) to create labels for points and cells, or labels
##  for the point or cell data scalar values.
##

## !!!Ignored construct:  # vtkIdFilter_h [NewLine] # vtkIdFilter_h [NewLine] # vtkDataSetAlgorithm.h [NewLine] # vtkFiltersCoreModule.h  For export macro [NewLine] class VTKFILTERSCORE_EXPORT vtkIdFilter : public vtkDataSetAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkIdFilter :: IsTypeOf ( type ) ; } static vtkIdFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkIdFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkIdFilter * NewInstance ( ) const { return vtkIdFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkIdFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkIdFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct object with PointIds and CellIds on; and ids being generated
##  as scalars.
##  static vtkIdFilter * New ( ) ; /@{ *
##  Enable/disable the generation of point ids. Default is on.
##  virtual void SetPointIds ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PointIds  to  << _arg ) ; if ( this -> PointIds != _arg ) { this -> PointIds = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetPointIds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PointIds  of  << this -> PointIds ) ; return this -> PointIds ; } ; virtual void PointIdsOn ( ) { this -> SetPointIds ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void PointIdsOff ( ) { this -> SetPointIds ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Enable/disable the generation of point ids. Default is on.
##  virtual void SetPointIdsCellIds ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CellIds  to  << _arg ) ; if ( this -> CellIds != _arg ) { this -> CellIds = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetPointIdsCellIds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CellIds  of  << this -> CellIds ) ; return this -> CellIds ; } ; virtual void CellIdsOn ( ) { this -> SetPointIdsCellIds ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void CellIdsOff ( ) { this -> SetPointIdsCellIds ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the flag which controls whether to generate scalar data
##  or field data. If this flag is off, scalar data is generated.
##  Otherwise, field data is generated. Default is off.
##  virtual void SetPointIdsCellIdsFieldData ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  FieldData  to  << _arg ) ; if ( this -> FieldData != _arg ) { this -> FieldData = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetPointIdsCellIdsFieldData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FieldData  of  << this -> FieldData ) ; return this -> FieldData ; } ; virtual void FieldDataOn ( ) { this -> SetPointIdsCellIdsFieldData ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void FieldDataOff ( ) { this -> SetPointIdsCellIdsFieldData ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the name of the Ids array for points, if generated. By default,
##  set to "vtkIdFilter_Ids" for backwards compatibility.
##  virtual void SetPointIdsArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << PointIdsArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> PointIdsArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> PointIdsArrayName && _arg && ( ! strcmp ( this -> PointIdsArrayName , _arg ) ) ) { return ; } delete [ ] this -> PointIdsArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> PointIdsArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> PointIdsArrayName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetPointIdsArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << PointIdsArrayName  of  << ( this -> PointIdsArrayName ? this -> PointIdsArrayName : (null) ) ) ; return this -> PointIdsArrayName ; } ; /@} /@{ *
##  Set/Get the name of the Ids array for points, if generated. By default,
##  set to "vtkIdFilter_Ids" for backwards compatibility.
##  virtual void SetPointIdsArrayNameCellIdsArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << CellIdsArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> CellIdsArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> CellIdsArrayName && _arg && ( ! strcmp ( this -> CellIdsArrayName , _arg ) ) ) { return ; } delete [ ] this -> CellIdsArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> CellIdsArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> CellIdsArrayName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetPointIdsArrayNameCellIdsArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << CellIdsArrayName  of  << ( this -> CellIdsArrayName ? this -> CellIdsArrayName : (null) ) ) ; return this -> CellIdsArrayName ; } ; /@} protected : vtkIdFilter ( ) ; ~ vtkIdFilter ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; vtkTypeBool PointIds ; vtkTypeBool CellIds ; vtkTypeBool FieldData ; char * PointIdsArrayName ; char * CellIdsArrayName ; private : vtkIdFilter ( const vtkIdFilter & ) = delete ; void operator = ( const vtkIdFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
