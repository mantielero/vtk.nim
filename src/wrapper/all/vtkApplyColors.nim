## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkApplyColors.h
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
##  @class   vtkApplyColors
##  @brief   apply colors to a data set.
##
##
##  vtkApplyColors performs a coloring of the dataset using default colors,
##  lookup tables, annotations, and/or a selection. The output is a
##  four-component vtkUnsignedCharArray containing RGBA tuples for each
##  element in the dataset. The first input is the dataset to be colored, which
##  may be a vtkTable, vtkGraph subclass, or vtkDataSet subclass. The API
##  of this algorithm refers to "points" and "cells". For vtkGraph, the
##  "points" refer to the graph vertices and "cells" refer to graph edges.
##  For vtkTable, "points" refer to table rows. For vtkDataSet subclasses, the
##  meaning is obvious.
##
##  The second (optional) input is a vtkAnnotationLayers object, which stores
##  a list of annotation layers, with each layer holding a list of
##  vtkAnnotation objects. The annotation specifies a subset of data along with
##  other properties, including color. For annotations with color properties,
##  this algorithm will use the color to color elements, using a "top one wins"
##  strategy.
##
##  The third (optional) input is a vtkSelection object, meant for specifying
##  the current selection. You can control the color of the selection.
##
##  The algorithm takes two input arrays, specified with
##  SetInputArrayToProcess(0, 0, 0, vtkDataObject::FIELD_ASSOCIATION_POINTS, name)
##  and
##  SetInputArrayToProcess(1, 0, 0, vtkDataObject::FIELD_ASSOCIATION_CELLS, name).
##  These set the point and cell data arrays to use to color the data with
##  the associated lookup table. For vtkGraph, vtkTable inputs, you would use
##  FIELD_ASSOCIATION_VERTICES, FIELD_ASSOCIATION_EDGES, or
##  FIELD_ASSOCIATION_ROWS as appropriate.
##
##  To use the color array generated here, you should do the following:
##
##   mapper->SetScalarModeToUseCellFieldData();
##   mapper->SelectColorArray("vtkApplyColors color");
##   mapper->SetScalarVisibility(true);
##
##  Colors are assigned with the following priorities:
##  <ol>
##  <li> If an item is part of the selection, it is colored with that color.
##  <li> Otherwise, if the item is part of an annotation, it is colored
##       with the color of the final (top) annotation in the set of layers.
##  <li> Otherwise, if the lookup table is used, it is colored using the
##       lookup table color for the data value of the element.
##  <li> Otherwise it will be colored with the default color.
##  </ol>
##
##  Note: The opacity of an unselected item is defined by the multiplication
##  of default opacity, lookup table opacity, and annotation opacity, where
##  opacity is taken as a number from 0 to 1. So items will never be more opaque
##  than any of these three opacities. Selected items are always given the
##  selection opacity directly.
##

## !!!Ignored construct:  # vtkApplyColors_h [NewLine] # vtkApplyColors_h [NewLine] # vtkPassInputTypeAlgorithm.h [NewLine] # vtkViewsInfovisModule.h  For export macro [NewLine] class vtkScalarsToColors ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkUnsignedCharArray"
## !!!Ignored construct:  class VTKVIEWSINFOVIS_EXPORT vtkApplyColors : public vtkPassInputTypeAlgorithm { public : static vtkApplyColors * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPassInputTypeAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPassInputTypeAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkApplyColors :: IsTypeOf ( type ) ; } static vtkApplyColors * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkApplyColors * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkApplyColors * NewInstance ( ) const { return vtkApplyColors :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPassInputTypeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkApplyColors :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkApplyColors :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  The lookup table to use for point colors. This is only used if
##  input array 0 is set and UsePointLookupTable is on.
##  virtual void SetPointLookupTable ( vtkScalarsToColors * lut ) ; virtual vtkScalarsToColors * GetnamePointLookupTable ( ) { vtkDebugWithObjectMacro ( this , <<  returning  PointLookupTable  address  << static_cast < vtkScalarsToColors * > ( this -> PointLookupTable ) ) ; return this -> PointLookupTable ; } ; /@} /@{ *
##  If on, uses the point lookup table to set the colors of unannotated,
##  unselected elements of the data.
##  virtual void SetUsePointLookupTable ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UsePointLookupTable  to  << _arg ) ; if ( this -> UsePointLookupTable != _arg ) { this -> UsePointLookupTable = _arg ; this -> Modified ( ) ; } } ; virtual bool GetUsePointLookupTable ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UsePointLookupTable  of  << this -> UsePointLookupTable ) ; return this -> UsePointLookupTable ; } ; virtual void UsePointLookupTableOn ( ) { this -> SetUsePointLookupTable ( static_cast < bool > ( 1 ) ) ; } virtual void UsePointLookupTableOff ( ) { this -> SetUsePointLookupTable ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  If on, uses the range of the data to scale the lookup table range.
##  Otherwise, uses the range defined in the lookup table.
##  virtual void SetUsePointLookupTableScalePointLookupTable ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ScalePointLookupTable  to  << _arg ) ; if ( this -> ScalePointLookupTable != _arg ) { this -> ScalePointLookupTable = _arg ; this -> Modified ( ) ; } } ; virtual bool GetUsePointLookupTableScalePointLookupTable ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalePointLookupTable  of  << this -> ScalePointLookupTable ) ; return this -> ScalePointLookupTable ; } ; virtual void ScalePointLookupTableOn ( ) { this -> SetUsePointLookupTableScalePointLookupTable ( static_cast < bool > ( 1 ) ) ; } virtual void ScalePointLookupTableOff ( ) { this -> SetUsePointLookupTableScalePointLookupTable ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  The default point color for all unannotated, unselected elements
##  of the data. This is used if UsePointLookupTable is off.
##  virtual void SetDefaultPointColor ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << DefaultPointColor  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> DefaultPointColor [ 0 ] != _arg1 ) || ( this -> DefaultPointColor [ 1 ] != _arg2 ) || ( this -> DefaultPointColor [ 2 ] != _arg3 ) ) { this -> DefaultPointColor [ 0 ] = _arg1 ; this -> DefaultPointColor [ 1 ] = _arg2 ; this -> DefaultPointColor [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetDefaultPointColor ( const double _arg [ 3 ] ) { this -> SetDefaultPointColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetDefaultPointColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << DefaultPointColor  pointer  << this -> DefaultPointColor ) ; return this -> DefaultPointColor ; } VTK_WRAPEXCLUDE virtual void GetDefaultPointColor ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> DefaultPointColor [ 0 ] ; _arg2 = this -> DefaultPointColor [ 1 ] ; _arg3 = this -> DefaultPointColor [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << DefaultPointColor  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetDefaultPointColor ( double _arg [ 3 ] ) { this -> GetDefaultPointColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  The default point opacity for all unannotated, unselected elements
##  of the data. This is used if UsePointLookupTable is off.
##  virtual void SetUsePointLookupTableScalePointLookupTableDefaultPointOpacity ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  DefaultPointOpacity  to  << _arg ) ; if ( this -> DefaultPointOpacity != _arg ) { this -> DefaultPointOpacity = _arg ; this -> Modified ( ) ; } } ; virtual double GetUsePointLookupTableScalePointLookupTableDefaultPointOpacity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DefaultPointOpacity  of  << this -> DefaultPointOpacity ) ; return this -> DefaultPointOpacity ; } ; /@} /@{ *
##  The point color for all selected elements of the data.
##  This is used if the selection input is available.
##  virtual void SetDefaultPointColorSelectedPointColor ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << SelectedPointColor  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> SelectedPointColor [ 0 ] != _arg1 ) || ( this -> SelectedPointColor [ 1 ] != _arg2 ) || ( this -> SelectedPointColor [ 2 ] != _arg3 ) ) { this -> SelectedPointColor [ 0 ] = _arg1 ; this -> SelectedPointColor [ 1 ] = _arg2 ; this -> SelectedPointColor [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetDefaultPointColorSelectedPointColor ( const double _arg [ 3 ] ) { this -> SetDefaultPointColorSelectedPointColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetDefaultPointColorSelectedPointColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << SelectedPointColor  pointer  << this -> SelectedPointColor ) ; return this -> SelectedPointColor ; } VTK_WRAPEXCLUDE virtual void GetDefaultPointColorSelectedPointColor ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> SelectedPointColor [ 0 ] ; _arg2 = this -> SelectedPointColor [ 1 ] ; _arg3 = this -> SelectedPointColor [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << SelectedPointColor  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetDefaultPointColorSelectedPointColor ( double _arg [ 3 ] ) { this -> GetDefaultPointColorSelectedPointColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  The point opacity for all selected elements of the data.
##  This is used if the selection input is available.
##  virtual void SetUsePointLookupTableScalePointLookupTableDefaultPointOpacitySelectedPointOpacity ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SelectedPointOpacity  to  << _arg ) ; if ( this -> SelectedPointOpacity != _arg ) { this -> SelectedPointOpacity = _arg ; this -> Modified ( ) ; } } ; virtual double GetUsePointLookupTableScalePointLookupTableDefaultPointOpacitySelectedPointOpacity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SelectedPointOpacity  of  << this -> SelectedPointOpacity ) ; return this -> SelectedPointOpacity ; } ; /@} /@{ *
##  The output array name for the point color RGBA array.
##  Default is "vtkApplyColors color".
##  virtual void SetPointColorOutputArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << PointColorOutputArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> PointColorOutputArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> PointColorOutputArrayName && _arg && ( ! strcmp ( this -> PointColorOutputArrayName , _arg ) ) ) { return ; } delete [ ] this -> PointColorOutputArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> PointColorOutputArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> PointColorOutputArrayName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetPointColorOutputArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << PointColorOutputArrayName  of  << ( this -> PointColorOutputArrayName ? this -> PointColorOutputArrayName : (null) ) ) ; return this -> PointColorOutputArrayName ; } ; /@} /@{ *
##  The lookup table to use for cell colors. This is only used if
##  input array 1 is set and UseCellLookupTable is on.
##  virtual void SetCellLookupTable ( vtkScalarsToColors * lut ) ; virtual vtkScalarsToColors * GetnamePointLookupTableCellLookupTable ( ) { vtkDebugWithObjectMacro ( this , <<  returning  CellLookupTable  address  << static_cast < vtkScalarsToColors * > ( this -> CellLookupTable ) ) ; return this -> CellLookupTable ; } ; /@} /@{ *
##  If on, uses the cell lookup table to set the colors of unannotated,
##  unselected elements of the data.
##  virtual void SetUsePointLookupTableScalePointLookupTableDefaultPointOpacitySelectedPointOpacityUseCellLookupTable ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseCellLookupTable  to  << _arg ) ; if ( this -> UseCellLookupTable != _arg ) { this -> UseCellLookupTable = _arg ; this -> Modified ( ) ; } } ; virtual bool GetUsePointLookupTableScalePointLookupTableDefaultPointOpacitySelectedPointOpacityUseCellLookupTable ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseCellLookupTable  of  << this -> UseCellLookupTable ) ; return this -> UseCellLookupTable ; } ; virtual void UseCellLookupTableOn ( ) { this -> SetUsePointLookupTableScalePointLookupTableUseCellLookupTable ( static_cast < bool > ( 1 ) ) ; } virtual void UseCellLookupTableOff ( ) { this -> SetUsePointLookupTableScalePointLookupTableUseCellLookupTable ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  If on, uses the range of the data to scale the lookup table range.
##  Otherwise, uses the range defined in the lookup table.
##  virtual void SetUsePointLookupTableScalePointLookupTableDefaultPointOpacitySelectedPointOpacityUseCellLookupTableScaleCellLookupTable ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ScaleCellLookupTable  to  << _arg ) ; if ( this -> ScaleCellLookupTable != _arg ) { this -> ScaleCellLookupTable = _arg ; this -> Modified ( ) ; } } ; virtual bool GetUsePointLookupTableScalePointLookupTableDefaultPointOpacitySelectedPointOpacityUseCellLookupTableScaleCellLookupTable ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScaleCellLookupTable  of  << this -> ScaleCellLookupTable ) ; return this -> ScaleCellLookupTable ; } ; virtual void ScaleCellLookupTableOn ( ) { this -> SetUsePointLookupTableScalePointLookupTableUseCellLookupTableScaleCellLookupTable ( static_cast < bool > ( 1 ) ) ; } virtual void ScaleCellLookupTableOff ( ) { this -> SetUsePointLookupTableScalePointLookupTableUseCellLookupTableScaleCellLookupTable ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  The default cell color for all unannotated, unselected elements
##  of the data. This is used if UseCellLookupTable is off.
##  virtual void SetDefaultPointColorSelectedPointColorDefaultCellColor ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << DefaultCellColor  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> DefaultCellColor [ 0 ] != _arg1 ) || ( this -> DefaultCellColor [ 1 ] != _arg2 ) || ( this -> DefaultCellColor [ 2 ] != _arg3 ) ) { this -> DefaultCellColor [ 0 ] = _arg1 ; this -> DefaultCellColor [ 1 ] = _arg2 ; this -> DefaultCellColor [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetDefaultPointColorSelectedPointColorDefaultCellColor ( const double _arg [ 3 ] ) { this -> SetDefaultPointColorSelectedPointColorDefaultCellColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetDefaultPointColorSelectedPointColorDefaultCellColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << DefaultCellColor  pointer  << this -> DefaultCellColor ) ; return this -> DefaultCellColor ; } VTK_WRAPEXCLUDE virtual void GetDefaultPointColorSelectedPointColorDefaultCellColor ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> DefaultCellColor [ 0 ] ; _arg2 = this -> DefaultCellColor [ 1 ] ; _arg3 = this -> DefaultCellColor [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << DefaultCellColor  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetDefaultPointColorSelectedPointColorDefaultCellColor ( double _arg [ 3 ] ) { this -> GetDefaultPointColorSelectedPointColorDefaultCellColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  The default cell opacity for all unannotated, unselected elements
##  of the data. This is used if UseCellLookupTable is off.
##  virtual void SetUsePointLookupTableScalePointLookupTableDefaultPointOpacitySelectedPointOpacityUseCellLookupTableScaleCellLookupTableDefaultCellOpacity ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  DefaultCellOpacity  to  << _arg ) ; if ( this -> DefaultCellOpacity != _arg ) { this -> DefaultCellOpacity = _arg ; this -> Modified ( ) ; } } ; virtual double GetUsePointLookupTableScalePointLookupTableDefaultPointOpacitySelectedPointOpacityUseCellLookupTableScaleCellLookupTableDefaultCellOpacity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DefaultCellOpacity  of  << this -> DefaultCellOpacity ) ; return this -> DefaultCellOpacity ; } ; /@} /@{ *
##  The cell color for all selected elements of the data.
##  This is used if the selection input is available.
##  virtual void SetDefaultPointColorSelectedPointColorDefaultCellColorSelectedCellColor ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << SelectedCellColor  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> SelectedCellColor [ 0 ] != _arg1 ) || ( this -> SelectedCellColor [ 1 ] != _arg2 ) || ( this -> SelectedCellColor [ 2 ] != _arg3 ) ) { this -> SelectedCellColor [ 0 ] = _arg1 ; this -> SelectedCellColor [ 1 ] = _arg2 ; this -> SelectedCellColor [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetDefaultPointColorSelectedPointColorDefaultCellColorSelectedCellColor ( const double _arg [ 3 ] ) { this -> SetDefaultPointColorSelectedPointColorDefaultCellColorSelectedCellColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetDefaultPointColorSelectedPointColorDefaultCellColorSelectedCellColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << SelectedCellColor  pointer  << this -> SelectedCellColor ) ; return this -> SelectedCellColor ; } VTK_WRAPEXCLUDE virtual void GetDefaultPointColorSelectedPointColorDefaultCellColorSelectedCellColor ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> SelectedCellColor [ 0 ] ; _arg2 = this -> SelectedCellColor [ 1 ] ; _arg3 = this -> SelectedCellColor [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << SelectedCellColor  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetDefaultPointColorSelectedPointColorDefaultCellColorSelectedCellColor ( double _arg [ 3 ] ) { this -> GetDefaultPointColorSelectedPointColorDefaultCellColorSelectedCellColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  The cell opacity for all selected elements of the data.
##  This is used if the selection input is available.
##  virtual void SetUsePointLookupTableScalePointLookupTableDefaultPointOpacitySelectedPointOpacityUseCellLookupTableScaleCellLookupTableDefaultCellOpacitySelectedCellOpacity ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SelectedCellOpacity  to  << _arg ) ; if ( this -> SelectedCellOpacity != _arg ) { this -> SelectedCellOpacity = _arg ; this -> Modified ( ) ; } } ; virtual double GetUsePointLookupTableScalePointLookupTableDefaultPointOpacitySelectedPointOpacityUseCellLookupTableScaleCellLookupTableDefaultCellOpacitySelectedCellOpacity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SelectedCellOpacity  of  << this -> SelectedCellOpacity ) ; return this -> SelectedCellOpacity ; } ; /@} /@{ *
##  The output array name for the cell color RGBA array.
##  Default is "vtkApplyColors color".
##  virtual void SetPointColorOutputArrayNameCellColorOutputArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << CellColorOutputArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> CellColorOutputArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> CellColorOutputArrayName && _arg && ( ! strcmp ( this -> CellColorOutputArrayName , _arg ) ) ) { return ; } delete [ ] this -> CellColorOutputArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> CellColorOutputArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> CellColorOutputArrayName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetPointColorOutputArrayNameCellColorOutputArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << CellColorOutputArrayName  of  << ( this -> CellColorOutputArrayName ? this -> CellColorOutputArrayName : (null) ) ) ; return this -> CellColorOutputArrayName ; } ; /@} /@{ *
##  Use the annotation to color the current annotation
##  (i.e. the current selection). Otherwise use the selection
##  color attributes of this filter.
##  virtual void SetUsePointLookupTableScalePointLookupTableDefaultPointOpacitySelectedPointOpacityUseCellLookupTableScaleCellLookupTableDefaultCellOpacitySelectedCellOpacityUseCurrentAnnotationColor ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseCurrentAnnotationColor  to  << _arg ) ; if ( this -> UseCurrentAnnotationColor != _arg ) { this -> UseCurrentAnnotationColor = _arg ; this -> Modified ( ) ; } } ; virtual bool GetUsePointLookupTableScalePointLookupTableDefaultPointOpacitySelectedPointOpacityUseCellLookupTableScaleCellLookupTableDefaultCellOpacitySelectedCellOpacityUseCurrentAnnotationColor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseCurrentAnnotationColor  of  << this -> UseCurrentAnnotationColor ) ; return this -> UseCurrentAnnotationColor ; } ; virtual void UseCurrentAnnotationColorOn ( ) { this -> SetUsePointLookupTableScalePointLookupTableUseCellLookupTableScaleCellLookupTableUseCurrentAnnotationColor ( static_cast < bool > ( 1 ) ) ; } virtual void UseCurrentAnnotationColorOff ( ) { this -> SetUsePointLookupTableScalePointLookupTableUseCellLookupTableScaleCellLookupTableUseCurrentAnnotationColor ( static_cast < bool > ( 0 ) ) ; } ; /@} *
##  Retrieve the modified time for this filter.
##  vtkMTimeType GetMTime ( ) override ; protected : vtkApplyColors ( ) ; ~ vtkApplyColors ( ) override ; *
##  Convert the vtkGraph into vtkPolyData.
##  int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; *
##  Set the input type of the algorithm to vtkGraph.
##  int FillInputPortInformation ( int port , vtkInformation * info ) override ; void ProcessColorArray ( vtkUnsignedCharArray * colorArr , vtkScalarsToColors * lut , vtkAbstractArray * arr , unsigned char color [ 4 ] , bool scale ) ; vtkScalarsToColors * PointLookupTable ; vtkScalarsToColors * CellLookupTable ; double DefaultPointColor [ 3 ] ; double DefaultPointOpacity ; double DefaultCellColor [ 3 ] ; double DefaultCellOpacity ; double SelectedPointColor [ 3 ] ; double SelectedPointOpacity ; double SelectedCellColor [ 3 ] ; double SelectedCellOpacity ; bool ScalePointLookupTable ; bool ScaleCellLookupTable ; bool UsePointLookupTable ; bool UseCellLookupTable ; char * PointColorOutputArrayName ; char * CellColorOutputArrayName ; bool UseCurrentAnnotationColor ; private : vtkApplyColors ( const vtkApplyColors & ) = delete ; void operator = ( const vtkApplyColors & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
