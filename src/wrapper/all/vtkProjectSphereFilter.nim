## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkProjectSphereFilter.h
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
##  @class   vtkProjectSphereFilter
##  @brief   A filter to 'unroll' a sphere.  The
##  unroll longitude is -180.
##
##
##

## !!!Ignored construct:  # vtkProjectSphereFilter_h [NewLine] # vtkProjectSphereFilter_h [NewLine] # vtkFiltersGeometryModule.h  For export macro # vtkPointSetAlgorithm.h [NewLine] class vtkCell ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkCellArray"
discard "forward decl of vtkDataSetAttributes"
discard "forward decl of vtkIdList"
discard "forward decl of vtkIncrementalPointLocator"
discard "forward decl of vtkUnstructuredGrid"
## !!!Ignored construct:  class VTKFILTERSGEOMETRY_EXPORT vtkProjectSphereFilter : public vtkPointSetAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPointSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPointSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkProjectSphereFilter :: IsTypeOf ( type ) ; } static vtkProjectSphereFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkProjectSphereFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkProjectSphereFilter * NewInstance ( ) const { return vtkProjectSphereFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPointSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkProjectSphereFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkProjectSphereFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkProjectSphereFilter * New ( ) ; /@{ *
##  Set the center of the sphere to be split. Default is 0,0,0.
##  virtual void SetCenter ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Center  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Center [ 0 ] != _arg1 ) || ( this -> Center [ 1 ] != _arg2 ) || ( this -> Center [ 2 ] != _arg3 ) ) { this -> Center [ 0 ] = _arg1 ; this -> Center [ 1 ] = _arg2 ; this -> Center [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetCenter ( const double _arg [ 3 ] ) { this -> SetCenter ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetCenter ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Center  pointer  << this -> Center ) ; return this -> Center ; } VTK_WRAPEXCLUDE virtual void GetCenter ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Center [ i ] ; } } ; /@} /@{ *
##  Specify whether or not to keep the cells using a point at
##  a pole. The default is false.
##  virtual bool GetKeepPolePoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << KeepPolePoints  of  << this -> KeepPolePoints ) ; return this -> KeepPolePoints ; } ; virtual void SetKeepPolePoints ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  KeepPolePoints  to  << _arg ) ; if ( this -> KeepPolePoints != _arg ) { this -> KeepPolePoints = _arg ; this -> Modified ( ) ; } } ; virtual void KeepPolePointsOn ( ) { this -> SetKeepPolePoints ( static_cast < bool > ( 1 ) ) ; } virtual void KeepPolePointsOff ( ) { this -> SetKeepPolePoints ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify whether (true) or not to translate the points in the projected
##  transformation such that the input point with the smallest
##  radius is at 0. The default is false.
##  virtual bool GetKeepPolePointsTranslateZ ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TranslateZ  of  << this -> TranslateZ ) ; return this -> TranslateZ ; } ; virtual void SetKeepPolePointsTranslateZ ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  TranslateZ  to  << _arg ) ; if ( this -> TranslateZ != _arg ) { this -> TranslateZ = _arg ; this -> Modified ( ) ; } } ; virtual void TranslateZOn ( ) { this -> SetKeepPolePointsTranslateZ ( static_cast < bool > ( 1 ) ) ; } virtual void TranslateZOff ( ) { this -> SetKeepPolePointsTranslateZ ( static_cast < bool > ( 0 ) ) ; } ; /@} protected : vtkProjectSphereFilter ( ) ; ~ vtkProjectSphereFilter ( ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; void TransformPointInformation ( vtkPointSet * input , vtkPointSet * output , vtkIdList * ) ; void TransformCellInformation ( vtkPointSet * input , vtkPointSet * output , vtkIdList * ) ; void TransformTensors ( vtkIdType id , double * coord , vtkDataSetAttributes * arrays ) ; *
##  Parallel part of the algorithm to figure out the closest point
##  to the centerline (i.e. line connecting -90 latitude to 90 latitude)
##  if we don't build cells using points at the poles.
##  virtual void ComputePointsClosestToCenterLine ( double , vtkIdList * ) { } *
##  If TranslateZ is true then this is the method that computes
##  the amount to translate.
##  virtual double GetZTranslation ( vtkPointSet * input ) ; *
##  Split a cell into multiple cells because it stretches across the
##  SplitLongitude. splitSide is 1 for left side and 0 for sight side.
##  void SplitCell ( vtkPointSet * input , vtkPointSet * output , vtkIdType inputCellId , vtkIncrementalPointLocator * locator , vtkCellArray * connectivity , int splitSide ) ; void SetCellInformation ( vtkUnstructuredGrid * output , vtkCell * cell , vtkIdType numberOfNewCells ) ; private : vtkProjectSphereFilter ( const vtkProjectSphereFilter & ) = delete ; void operator = ( const vtkProjectSphereFilter & ) = delete ; double Center [ 3 ] ; const double SplitLongitude ; bool KeepPolePoints ; bool TranslateZ ; } ;
## Error: token expected: ; but got: [identifier]!!!
