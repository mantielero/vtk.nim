## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLineSource.h
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
##  @class   vtkLineSource
##  @brief   create a line defined by two end points
##
##  vtkLineSource is a source object that creates a polyline defined by
##  two endpoints or a collection of connected line segments. To define the line
##  by end points, use `SetPoint1` and `SetPoint2` methods. To define a broken
##  line comprising of multiple line segments, use `SetPoints` to provide the
##  corner points that for the line.
##
##  Intermediate points within line segment (when specifying end points alone) or
##  each of the individual line segments (when specifying broken line) can be
##  specified in two ways. First, when `UseRegularRefinement` is true (default),
##  the `Resolution` is used to determine how many intermediate points to add
##  using regular refinement. Thus, if `Resolution` is set to 1, a mid point will
##  be added for each of the line segments resulting in a line with 3 points: the
##  two end points and the mid point. Second, when `UseRegularRefinement` is
##  false, refinement ratios for points per segment are specified using
##  `SetRefinementRatio` and `SetNumberOfRefinementRatios`. To generate same
##  points as `Resolution` set to 1, the refinement ratios will be `[0, 0.5,
##  1.0]`. To add the end points of the line segment `0.0` and `1.0` must be
##  included in the collection of refinement ratios.
##
##  @section ChangesVTK9 Changes in VTK 9.0
##
##  Prior to VTK 9.0, when broken line was being generated, the texture
##  coordinates for each of the individual breaks in the line ranged from [0.0,
##  1.0]. This has been changed to generate texture coordinates in the range
##  [0.0, 1.0] over the entire output line irrespective of whether the line was
##  generated by simply specifying the end points or multiple line segments.
##
##  @par Thanks:
##  This class was extended by Philippe Pebay, Kitware SAS 2011, to support
##  broken lines as well as simple lines.
##

## !!!Ignored construct:  # vtkLineSource_h [NewLine] # vtkLineSource_h [NewLine] # vtkFiltersSourcesModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] # < vector >   for std::vector class vtkPoints ;
## Error: did not expect [NewLine]!!!

## !!!Ignored construct:  [NewLine] class vtkLineSource : public vtkPolyDataAlgorithm { public : static vtkLineSource * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkLineSource :: IsTypeOf ( type ) ; } static vtkLineSource * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkLineSource * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkLineSource * NewInstance ( ) const { return vtkLineSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLineSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLineSource :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set position of first end point.
##  virtual void SetPoint1 ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Point1  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Point1 [ 0 ] != _arg1 ) || ( this -> Point1 [ 1 ] != _arg2 ) || ( this -> Point1 [ 2 ] != _arg3 ) ) { this -> Point1 [ 0 ] = _arg1 ; this -> Point1 [ 1 ] = _arg2 ; this -> Point1 [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetPoint1 ( const double _arg [ 3 ] ) { this -> SetPoint1 ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetPoint1 ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Point1  pointer  << this -> Point1 ) ; return this -> Point1 ; } VTK_WRAPEXCLUDE virtual void GetPoint1 ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Point1 [ i ] ; } } ; void SetPoint1 ( float [ 3 ] ) ; /@} /@{ *
##  Set position of other end point.
##  virtual void SetPoint1Point2 ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Point2  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Point2 [ 0 ] != _arg1 ) || ( this -> Point2 [ 1 ] != _arg2 ) || ( this -> Point2 [ 2 ] != _arg3 ) ) { this -> Point2 [ 0 ] = _arg1 ; this -> Point2 [ 1 ] = _arg2 ; this -> Point2 [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetPoint1Point2 ( const double _arg [ 3 ] ) { this -> SetPoint1Point2 ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetPoint1Point2 ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Point2  pointer  << this -> Point2 ) ; return this -> Point2 ; } VTK_WRAPEXCLUDE virtual void GetPoint1Point2 ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Point2 [ i ] ; } } ; void SetPoint2 ( float [ 3 ] ) ; /@} /@{ *
##  Set/Get how the line segment is to be refined. One can choose to add points
##  at regular intervals per segment (defined using `Resolution`) or explicit
##  locations (defined using `SetRefinementRatio`). Default is true i.e
##  `Resolution` will be used to determine placement of points within each line
##  segment.
##  virtual void SetUseRegularRefinement ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseRegularRefinement  to  << _arg ) ; if ( this -> UseRegularRefinement != _arg ) { this -> UseRegularRefinement = _arg ; this -> Modified ( ) ; } } ; virtual bool GetUseRegularRefinement ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseRegularRefinement  of  << this -> UseRegularRefinement ) ; return this -> UseRegularRefinement ; } ; virtual void UseRegularRefinementOn ( ) { this -> SetUseRegularRefinement ( static_cast < bool > ( 1 ) ) ; } virtual void UseRegularRefinementOff ( ) { this -> SetUseRegularRefinement ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Divide line into Resolution number of pieces. This is used when
##  `UseRegularRefinement` is true.
##  virtual void SetResolution ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Resolution  to  << _arg ) ; if ( this -> Resolution != ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> Resolution = ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetResolutionMinValue ( ) { return 1 ; } virtual int GetResolutionMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetUseRegularRefinementResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Resolution  of  << this -> Resolution ) ; return this -> Resolution ; } ; /@} /@{ *
##  API for setting/getting refinement ratios for points added to the line
##  segment. The ratio is in the range `[0.0, 1.0]` where 0.0 is the start of
##  the line segment and 1.0 is the end. When generating broken lines i.e.
##  using `SetPoints`, this specifies refinement points for each of the
##  individual line segment. Note that `0.0` and `1.0` must be explicitly
##  included to generate a point and the start and/or end of the line segment.
##  This is used only when `UseRegularRefinement` is false.
##  void SetNumberOfRefinementRatios ( int ) ; void SetRefinementRatio ( int index , double value ) ; int GetNumberOfRefinementRatios ( ) ; double GetRefinementRatio ( int index ) ; /@} /@{ *
##  Set/Get the list of points defining a broken line
##  virtual void SetPoints ( vtkPoints * ) ; virtual vtkPoints * GetnamePoints ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Points  address  << static_cast < vtkPoints * > ( this -> Points ) ) ; return this -> Points ; } ; /@} /@{ *
##  Set/get the desired precision for the output points.
##  vtkAlgorithm::SINGLE_PRECISION - Output single-precision floating point.
##  vtkAlgorithm::DOUBLE_PRECISION - Output double-precision floating point.
##  virtual void SetUseRegularRefinementOutputPointsPrecision ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputPointsPrecision  to  << _arg ) ; if ( this -> OutputPointsPrecision != _arg ) { this -> OutputPointsPrecision = _arg ; this -> Modified ( ) ; } } ; virtual int GetUseRegularRefinementResolutionOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ; /@} protected : vtkLineSource ( int res = 1 ) ; ~ vtkLineSource ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; double Point1 [ 3 ] ; double Point2 [ 3 ] ; int Resolution ; int OutputPointsPrecision ; bool UseRegularRefinement ; std :: vector < double > RefinementRatios ; *
##  The list of points defining a broken line
##  NB: The Point1/Point2 definition of a single line segment is used by default
##  vtkPoints * Points ; private : vtkLineSource ( const vtkLineSource & ) = delete ; void operator = ( const vtkLineSource & ) = delete ; } ;
## Error: did not expect [NewLine]!!!
