## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtractUnstructuredGrid.h
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
##  @class   vtkExtractUnstructuredGrid
##  @brief   extract subset of unstructured grid geometry
##
##  vtkExtractUnstructuredGrid is a general-purpose filter to
##  extract geometry (and associated data) from an unstructured grid
##  dataset. The extraction process is controlled by specifying a range
##  of point ids, cell ids, or a bounding box (referred to as "Extent").
##  Those cells laying within these regions are sent to the output.
##  The user has the choice of merging coincident points (Merging is on)
##  or using the original point set (Merging is off).
##
##  @warning
##  If merging is off, the input points are copied through to the
##  output. This means unused points may be present in the output data.
##  If merging is on, then coincident points with different point attribute
##  values are merged.
##
##  @sa
##  vtkImageDataGeometryFilter vtkStructuredGridGeometryFilter
##  vtkRectilinearGridGeometryFilter
##  vtkExtractGeometry vtkExtractVOI
##

## !!!Ignored construct:  # vtkExtractUnstructuredGrid_h [NewLine] # vtkExtractUnstructuredGrid_h [NewLine] # vtkFiltersExtractionModule.h  For export macro # vtkUnstructuredGridAlgorithm.h [NewLine] class vtkIncrementalPointLocator ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSEXTRACTION_EXPORT vtkExtractUnstructuredGrid : public vtkUnstructuredGridAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkUnstructuredGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkUnstructuredGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkExtractUnstructuredGrid :: IsTypeOf ( type ) ; } static vtkExtractUnstructuredGrid * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkExtractUnstructuredGrid * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkExtractUnstructuredGrid * NewInstance ( ) const { return vtkExtractUnstructuredGrid :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtractUnstructuredGrid :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtractUnstructuredGrid :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct with all types of clipping turned off.
##  static vtkExtractUnstructuredGrid * New ( ) ; /@{ *
##  Turn on/off selection of geometry by point id.
##  virtual void SetPointClipping ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PointClipping  to  << _arg ) ; if ( this -> PointClipping != _arg ) { this -> PointClipping = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetPointClipping ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PointClipping  of  << this -> PointClipping ) ; return this -> PointClipping ; } ; virtual void PointClippingOn ( ) { this -> SetPointClipping ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void PointClippingOff ( ) { this -> SetPointClipping ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off selection of geometry by cell id.
##  virtual void SetPointClippingCellClipping ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CellClipping  to  << _arg ) ; if ( this -> CellClipping != _arg ) { this -> CellClipping = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetPointClippingCellClipping ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CellClipping  of  << this -> CellClipping ) ; return this -> CellClipping ; } ; virtual void CellClippingOn ( ) { this -> SetPointClippingCellClipping ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void CellClippingOff ( ) { this -> SetPointClippingCellClipping ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off selection of geometry via bounding box.
##  virtual void SetPointClippingCellClippingExtentClipping ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ExtentClipping  to  << _arg ) ; if ( this -> ExtentClipping != _arg ) { this -> ExtentClipping = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetPointClippingCellClippingExtentClipping ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ExtentClipping  of  << this -> ExtentClipping ) ; return this -> ExtentClipping ; } ; virtual void ExtentClippingOn ( ) { this -> SetPointClippingCellClippingExtentClipping ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ExtentClippingOff ( ) { this -> SetPointClippingCellClippingExtentClipping ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify the minimum point id for point id selection.
##  virtual void SetPointMinimum ( vtkIdType _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << PointMinimum  to  << _arg ) ; if ( this -> PointMinimum != ( _arg < 0 ? 0 : ( _arg > VTK_ID_MAX ? VTK_ID_MAX : _arg ) ) ) { this -> PointMinimum = ( _arg < 0 ? 0 : ( _arg > VTK_ID_MAX ? VTK_ID_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual vtkIdType GetPointMinimumMinValue ( ) { return 0 ; } virtual vtkIdType GetPointMinimumMaxValue ( ) { return VTK_ID_MAX ; } ; virtual vtkIdType GetPointClippingCellClippingExtentClippingPointMinimum ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PointMinimum  of  << this -> PointMinimum ) ; return this -> PointMinimum ; } ; /@} /@{ *
##  Specify the maximum point id for point id selection.
##  virtual void SetPointMinimumPointMaximum ( vtkIdType _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << PointMaximum  to  << _arg ) ; if ( this -> PointMaximum != ( _arg < 0 ? 0 : ( _arg > VTK_ID_MAX ? VTK_ID_MAX : _arg ) ) ) { this -> PointMaximum = ( _arg < 0 ? 0 : ( _arg > VTK_ID_MAX ? VTK_ID_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual vtkIdType GetPointMinimumMinValuePointMaximumMinValue ( ) { return 0 ; } virtual vtkIdType GetPointMinimumMaxValuePointMaximumMaxValue ( ) { return VTK_ID_MAX ; } ; virtual vtkIdType GetPointClippingCellClippingExtentClippingPointMinimumPointMaximum ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PointMaximum  of  << this -> PointMaximum ) ; return this -> PointMaximum ; } ; /@} /@{ *
##  Specify the minimum cell id for point id selection.
##  virtual void SetPointMinimumPointMaximumCellMinimum ( vtkIdType _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << CellMinimum  to  << _arg ) ; if ( this -> CellMinimum != ( _arg < 0 ? 0 : ( _arg > VTK_ID_MAX ? VTK_ID_MAX : _arg ) ) ) { this -> CellMinimum = ( _arg < 0 ? 0 : ( _arg > VTK_ID_MAX ? VTK_ID_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual vtkIdType GetPointMinimumMinValuePointMaximumMinValueCellMinimumMinValue ( ) { return 0 ; } virtual vtkIdType GetPointMinimumMaxValuePointMaximumMaxValueCellMinimumMaxValue ( ) { return VTK_ID_MAX ; } ; virtual vtkIdType GetPointClippingCellClippingExtentClippingPointMinimumPointMaximumCellMinimum ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CellMinimum  of  << this -> CellMinimum ) ; return this -> CellMinimum ; } ; /@} /@{ *
##  Specify the maximum cell id for point id selection.
##  virtual void SetPointMinimumPointMaximumCellMinimumCellMaximum ( vtkIdType _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << CellMaximum  to  << _arg ) ; if ( this -> CellMaximum != ( _arg < 0 ? 0 : ( _arg > VTK_ID_MAX ? VTK_ID_MAX : _arg ) ) ) { this -> CellMaximum = ( _arg < 0 ? 0 : ( _arg > VTK_ID_MAX ? VTK_ID_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual vtkIdType GetPointMinimumMinValuePointMaximumMinValueCellMinimumMinValueCellMaximumMinValue ( ) { return 0 ; } virtual vtkIdType GetPointMinimumMaxValuePointMaximumMaxValueCellMinimumMaxValueCellMaximumMaxValue ( ) { return VTK_ID_MAX ; } ; virtual vtkIdType GetPointClippingCellClippingExtentClippingPointMinimumPointMaximumCellMinimumCellMaximum ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CellMaximum  of  << this -> CellMaximum ) ; return this -> CellMaximum ; } ; /@} *
##  Specify a (xmin,xmax, ymin,ymax, zmin,zmax) bounding box to clip data.
##  void SetExtent ( double xMin , double xMax , double yMin , double yMax , double zMin , double zMax ) ; /@{ *
##  Set / get a (xmin,xmax, ymin,ymax, zmin,zmax) bounding box to clip data.
##  void SetExtent ( double extent [ 6 ] ) ; double * GetExtent ( ) VTK_SIZEHINT ( 6 ) { return this -> Extent ; } /@} /@{ *
##  Turn on/off merging of coincident points. Note that is merging is
##  on, points with different point attributes (e.g., normals) are merged,
##  which may cause rendering artifacts.
##  virtual void SetPointClippingCellClippingExtentClippingMerging ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Merging  to  << _arg ) ; if ( this -> Merging != _arg ) { this -> Merging = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetPointClippingCellClippingExtentClippingPointMinimumPointMaximumCellMinimumCellMaximumMerging ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Merging  of  << this -> Merging ) ; return this -> Merging ; } ; virtual void MergingOn ( ) { this -> SetPointClippingCellClippingExtentClippingMerging ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void MergingOff ( ) { this -> SetPointClippingCellClippingExtentClippingMerging ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set / get a spatial locator for merging points. By
##  default an instance of vtkMergePoints is used.
##  void SetLocator ( vtkIncrementalPointLocator * locator ) ; virtual vtkIncrementalPointLocator * GetnameLocator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Locator  address  << static_cast < vtkIncrementalPointLocator * > ( this -> Locator ) ) ; return this -> Locator ; } ; /@} *
##  Create default locator. Used to create one when none is specified.
##  void CreateDefaultLocator ( ) ; *
##  Return the MTime also considering the locator.
##  vtkMTimeType GetMTime ( ) override ; protected : vtkExtractUnstructuredGrid ( ) ; ~ vtkExtractUnstructuredGrid ( ) override = default ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; vtkIdType PointMinimum ; vtkIdType PointMaximum ; vtkIdType CellMinimum ; vtkIdType CellMaximum ; double Extent [ 6 ] ; vtkTypeBool PointClipping ; vtkTypeBool CellClipping ; vtkTypeBool ExtentClipping ; vtkTypeBool Merging ; vtkIncrementalPointLocator * Locator ; private : vtkExtractUnstructuredGrid ( const vtkExtractUnstructuredGrid & ) = delete ; void operator = ( const vtkExtractUnstructuredGrid & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
