## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLinearCellExtrusionFilter.h
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
##  @class   vtkLinearCellExtrusionFilter
##  @brief   extrude polygonal data to create 3D cells from 2D cells
##
##  vtkLinearCellExtrusionFilter is a modeling filter. It takes polygonal data as
##  input and generates an unstructured grid data on output. The input dataset is swept
##  according to the input cell data array value along the cell normal and creates
##  new 3D primitives.
##  Triangles will become Wedges, Quads will become Hexahedrons,
##  and Polygons will become Polyhedrons.
##  This filter currently takes into account only polys and discard vertices, lines and strips.
##  Unlike the vtkLinearExtrusionFilter, this filter is designed to extrude each cell independently
##  using its normal and its scalar value.
##
##  @sa
##  vtkLinearExtrusionFilter
##

## !!!Ignored construct:  # vtkLinearCellExtrusionFilter_h [NewLine] # vtkLinearCellExtrusionFilter_h [NewLine] # vtkFiltersModelingModule.h  For export macro # vtkIncrementalPointLocator.h  For vtkIncrementalPointLocator # vtkPolyDataAlgorithm.h [NewLine] # vtkSmartPointer.h  For smart pointer [NewLine] class VTKFILTERSMODELING_EXPORT vtkLinearCellExtrusionFilter : public vtkPolyDataAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkLinearCellExtrusionFilter :: IsTypeOf ( type ) ; } static vtkLinearCellExtrusionFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkLinearCellExtrusionFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkLinearCellExtrusionFilter * NewInstance ( ) const { return vtkLinearCellExtrusionFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLinearCellExtrusionFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLinearCellExtrusionFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkLinearCellExtrusionFilter * New ( ) ; /@{ *
##  Specify the scale factor applied on the cell value during extrusion.
##  Default is 1.0
##  virtual void SetScaleFactor ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ScaleFactor  to  << _arg ) ; if ( this -> ScaleFactor != _arg ) { this -> ScaleFactor = _arg ; this -> Modified ( ) ; } } ; virtual double GetScaleFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScaleFactor  of  << this -> ScaleFactor ) ; return this -> ScaleFactor ; } ; /@} /@{ *
##  Specify if the algorithm should use the specified vector instead of cell normals.
##  Default is false
##  virtual void SetScaleFactorUseUserVector ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseUserVector  to  << _arg ) ; if ( this -> UseUserVector != _arg ) { this -> UseUserVector = _arg ; this -> Modified ( ) ; } } ; virtual bool GetScaleFactorUseUserVector ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseUserVector  of  << this -> UseUserVector ) ; return this -> UseUserVector ; } ; virtual void UseUserVectorOn ( ) { this -> SetUseUserVector ( static_cast < bool > ( 1 ) ) ; } virtual void UseUserVectorOff ( ) { this -> SetUseUserVector ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify the scale factor applied on the cell value during extrusion.
##  virtual void SetUserVector ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << UserVector  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> UserVector [ 0 ] != _arg1 ) || ( this -> UserVector [ 1 ] != _arg2 ) || ( this -> UserVector [ 2 ] != _arg3 ) ) { this -> UserVector [ 0 ] = _arg1 ; this -> UserVector [ 1 ] = _arg2 ; this -> UserVector [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetUserVector ( const double _arg [ 3 ] ) { this -> SetUserVector ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetUserVector ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << UserVector  pointer  << this -> UserVector ) ; return this -> UserVector ; } VTK_WRAPEXCLUDE virtual void GetUserVector ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> UserVector [ 0 ] ; _arg2 = this -> UserVector [ 1 ] ; _arg3 = this -> UserVector [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << UserVector  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetUserVector ( double _arg [ 3 ] ) { this -> GetUserVector ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  Specify if the algorithm should merge duplicate points.
##  Default is false
##  virtual void SetScaleFactorUseUserVectorMergeDuplicatePoints ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MergeDuplicatePoints  to  << _arg ) ; if ( this -> MergeDuplicatePoints != _arg ) { this -> MergeDuplicatePoints = _arg ; this -> Modified ( ) ; } } ; virtual bool GetScaleFactorUseUserVectorMergeDuplicatePoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MergeDuplicatePoints  of  << this -> MergeDuplicatePoints ) ; return this -> MergeDuplicatePoints ; } ; virtual void MergeDuplicatePointsOn ( ) { this -> SetUseUserVectorMergeDuplicatePoints ( static_cast < bool > ( 1 ) ) ; } virtual void MergeDuplicatePointsOff ( ) { this -> SetUseUserVectorMergeDuplicatePoints ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify a spatial locator for merging points.
##  By default, an instance of vtkMergePoints is used.
##  virtual vtkIncrementalPointLocator * Getname ( ) { vtkDebugWithObjectMacro ( this , <<  returning  name  address  << static_cast < vtkIncrementalPointLocator * > ( this -> Locator ) ) ; return this -> Locator ; } ; virtual void SetLocator ( vtkIncrementalPointLocator * _arg ) { { vtkDebugWithObjectMacro ( this , <<  setting  << Locator  to  << _arg ) ; if ( this -> Locator != _arg ) { this -> Locator = _arg ; this -> Modified ( ) ; } } ; } ; /@} *
##  Create default locator. Used to create one when none is specified. The
##  locator is used to merge coincident points.
##  void CreateDefaultLocator ( ) ; protected : vtkLinearCellExtrusionFilter ( ) ; ~ vtkLinearCellExtrusionFilter ( ) override = default ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillOutputPortInformation ( int port , vtkInformation * info ) override ; double ScaleFactor = 1.0 ; double UserVector [ 3 ] = { 0.0 , 0.0 , 1.0 } ; bool UseUserVector = false ; bool MergeDuplicatePoints = false ; vtkSmartPointer < vtkIncrementalPointLocator > Locator ; private : vtkLinearCellExtrusionFilter ( const vtkLinearCellExtrusionFilter & ) = delete ; void operator = ( const vtkLinearCellExtrusionFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
