## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCleanPolyData.h
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
##  @class   vtkCleanPolyData
##  @brief   merge duplicate points, and/or remove unused points and/or remove degenerate cells
##
##  vtkCleanPolyData is a filter that takes polygonal data as input and
##  generates polygonal data as output. vtkCleanPolyData will merge duplicate
##  points (within specified tolerance and if enabled), eliminate points
##  that are not used in any cell, and if enabled, transform degenerate cells into
##  appropriate forms (for example, a triangle is converted into a line
##  if two points of triangle are merged).
##
##  Conversion of degenerate cells is controlled by the flags
##  ConvertLinesToPoints, ConvertPolysToLines, ConvertStripsToPolys which act
##  cumulatively such that a degenerate strip may become a poly.
##  The full set is
##  Line with 1 points -> Vert (if ConvertLinesToPoints)
##  Poly with 2 points -> Line (if ConvertPolysToLines)
##  Poly with 1 points -> Vert (if ConvertPolysToLines && ConvertLinesToPoints)
##  Strp with 3 points -> Poly (if ConvertStripsToPolys)
##  Strp with 2 points -> Line (if ConvertStripsToPolys && ConvertPolysToLines)
##  Strp with 1 points -> Vert (if ConvertStripsToPolys && ConvertPolysToLines
##    && ConvertLinesToPoints)
##
##  Cells of type VTK_POLY_LINE will be converted to a vertex only if
##  ConvertLinesToPoints is on and all points are merged into one. Degenerate line
##  segments (with two identical end points) will be removed.
##
##  If tolerance is specified precisely=0.0, then vtkCleanPolyData will use
##  the vtkMergePoints object to merge points (which is faster). Otherwise the
##  slower vtkIncrementalPointLocator is used.  Before inserting points into the point
##  locator, this class calls a function OperateOnPoint which can be used (in
##  subclasses) to further refine the cleaning process. See
##  vtkQuantizePolyDataPoints.
##
##  In addition, if a point global id array is available, then two points are merged
##  if and only if they share the same global id.
##
##  Note that merging of points can be disabled. In this case, a point locator
##  will not be used, and points that are not used by any cells will be
##  eliminated, but never merged.
##
##  @warning
##  Merging points can alter topology, including introducing non-manifold
##  forms. The tolerance should be chosen carefully to avoid these problems.
##  Subclasses should handle OperateOnBounds as well as OperateOnPoint
##  to ensure that the locator is correctly initialized (i.e. all modified
##  points must lie inside modified bounds).
##
##  @warning
##  If you wish to operate on a set of point coordinates that has no cells,
##  you must add a vtkPolyVertex cell with all of the points to the PolyData
##  (or use a vtkVertexGlyphFilter) before using the vtkCleanPolyData filter.
##
##  @warning
##  The vtkStaticCleanPolyData filter is similar in operation to
##  vtkCleanPolyData. However, vtkStaticCleanPolyData is non-incremental and
##  uses a much faster threading approach (especially for larger datasets, and
##  when merging points with a non-zero tolerance). However because of the
##  difference in the traveral order in the point merging process, the output
##  of the filters may be different.
##
##  @sa
##  vtkQuantizePolyDataPoints vtkStaticCleanPolyData
##  vtkStaticCleanUnstructuredGrid
##

## !!!Ignored construct:  # vtkCleanPolyData_h [NewLine] # vtkCleanPolyData_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class vtkIncrementalPointLocator ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSCORE_EXPORT vtkCleanPolyData : public vtkPolyDataAlgorithm { public : static vtkCleanPolyData * New ( ) ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkCleanPolyData :: IsTypeOf ( type ) ; } static vtkCleanPolyData * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkCleanPolyData * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkCleanPolyData * NewInstance ( ) const { return vtkCleanPolyData :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCleanPolyData :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCleanPolyData :: New ( ) ; } public : ; /@{ *
##  By default ToleranceIsAbsolute is false and Tolerance is
##  a fraction of Bounding box diagonal, if true, AbsoluteTolerance is
##  used when adding points to locator (merging)
##  virtual void SetToleranceIsAbsolute ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ToleranceIsAbsolute  to  << _arg ) ; if ( this -> ToleranceIsAbsolute != _arg ) { this -> ToleranceIsAbsolute = _arg ; this -> Modified ( ) ; } } ; virtual void ToleranceIsAbsoluteOn ( ) { this -> SetToleranceIsAbsolute ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ToleranceIsAbsoluteOff ( ) { this -> SetToleranceIsAbsolute ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual vtkTypeBool GetToleranceIsAbsolute ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ToleranceIsAbsolute  of  << this -> ToleranceIsAbsolute ) ; return this -> ToleranceIsAbsolute ; } ; /@} /@{ *
##  Specify tolerance in terms of fraction of bounding box length.
##  Default is 0.0.
##  virtual void SetTolerance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Tolerance  to  << _arg ) ; if ( this -> Tolerance != ( _arg < 0.0 ? 0.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ) { this -> Tolerance = ( _arg < 0.0 ? 0.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetToleranceMinValue ( ) { return 0.0 ; } virtual double GetToleranceMaxValue ( ) { return 1.0 ; } ; virtual double GetToleranceIsAbsoluteTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tolerance  of  << this -> Tolerance ) ; return this -> Tolerance ; } ; /@} /@{ *
##  Specify tolerance in absolute terms. Default is 1.0.
##  virtual void SetToleranceAbsoluteTolerance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << AbsoluteTolerance  to  << _arg ) ; if ( this -> AbsoluteTolerance != ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ) { this -> AbsoluteTolerance = ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetToleranceMinValueAbsoluteToleranceMinValue ( ) { return 0.0 ; } virtual double GetToleranceMaxValueAbsoluteToleranceMaxValue ( ) { return VTK_DOUBLE_MAX ; } ; virtual double GetToleranceIsAbsoluteToleranceAbsoluteTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AbsoluteTolerance  of  << this -> AbsoluteTolerance ) ; return this -> AbsoluteTolerance ; } ; /@} /@{ *
##  Turn on/off conversion of degenerate lines to points. Default is On.
##  virtual void SetToleranceIsAbsoluteConvertLinesToPoints ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ConvertLinesToPoints  to  << _arg ) ; if ( this -> ConvertLinesToPoints != _arg ) { this -> ConvertLinesToPoints = _arg ; this -> Modified ( ) ; } } ; virtual void ConvertLinesToPointsOn ( ) { this -> SetToleranceIsAbsoluteConvertLinesToPoints ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ConvertLinesToPointsOff ( ) { this -> SetToleranceIsAbsoluteConvertLinesToPoints ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual vtkTypeBool GetToleranceIsAbsoluteToleranceAbsoluteToleranceConvertLinesToPoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ConvertLinesToPoints  of  << this -> ConvertLinesToPoints ) ; return this -> ConvertLinesToPoints ; } ; /@} /@{ *
##  Turn on/off conversion of degenerate polys to lines. Default is On.
##  virtual void SetToleranceIsAbsoluteConvertLinesToPointsConvertPolysToLines ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ConvertPolysToLines  to  << _arg ) ; if ( this -> ConvertPolysToLines != _arg ) { this -> ConvertPolysToLines = _arg ; this -> Modified ( ) ; } } ; virtual void ConvertPolysToLinesOn ( ) { this -> SetToleranceIsAbsoluteConvertLinesToPointsConvertPolysToLines ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ConvertPolysToLinesOff ( ) { this -> SetToleranceIsAbsoluteConvertLinesToPointsConvertPolysToLines ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual vtkTypeBool GetToleranceIsAbsoluteToleranceAbsoluteToleranceConvertLinesToPointsConvertPolysToLines ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ConvertPolysToLines  of  << this -> ConvertPolysToLines ) ; return this -> ConvertPolysToLines ; } ; /@} /@{ *
##  Turn on/off conversion of degenerate strips to polys. Default is On.
##  virtual void SetToleranceIsAbsoluteConvertLinesToPointsConvertPolysToLinesConvertStripsToPolys ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ConvertStripsToPolys  to  << _arg ) ; if ( this -> ConvertStripsToPolys != _arg ) { this -> ConvertStripsToPolys = _arg ; this -> Modified ( ) ; } } ; virtual void ConvertStripsToPolysOn ( ) { this -> SetToleranceIsAbsoluteConvertLinesToPointsConvertPolysToLinesConvertStripsToPolys ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ConvertStripsToPolysOff ( ) { this -> SetToleranceIsAbsoluteConvertLinesToPointsConvertPolysToLinesConvertStripsToPolys ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual vtkTypeBool GetToleranceIsAbsoluteToleranceAbsoluteToleranceConvertLinesToPointsConvertPolysToLinesConvertStripsToPolys ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ConvertStripsToPolys  of  << this -> ConvertStripsToPolys ) ; return this -> ConvertStripsToPolys ; } ; /@} /@{ *
##  Set/Get a boolean value that controls whether point merging is
##  performed. If on, a locator will be used, and points laying within
##  the appropriate tolerance may be merged. If off, points are never
##  merged. By default, merging is on.
##  virtual void SetToleranceIsAbsoluteConvertLinesToPointsConvertPolysToLinesConvertStripsToPolysPointMerging ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PointMerging  to  << _arg ) ; if ( this -> PointMerging != _arg ) { this -> PointMerging = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetToleranceIsAbsoluteToleranceAbsoluteToleranceConvertLinesToPointsConvertPolysToLinesConvertStripsToPolysPointMerging ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PointMerging  of  << this -> PointMerging ) ; return this -> PointMerging ; } ; virtual void PointMergingOn ( ) { this -> SetToleranceIsAbsoluteConvertLinesToPointsConvertPolysToLinesConvertStripsToPolysPointMerging ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void PointMergingOff ( ) { this -> SetToleranceIsAbsoluteConvertLinesToPointsConvertPolysToLinesConvertStripsToPolysPointMerging ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get a spatial locator for speeding the search process. By
##  default an instance of vtkMergePoints is used.
##  virtual void SetLocator ( vtkIncrementalPointLocator * locator ) ; virtual vtkIncrementalPointLocator * GetnameLocator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Locator  address  << static_cast < vtkIncrementalPointLocator * > ( this -> Locator ) ) ; return this -> Locator ; } ; /@} *
##  Create default locator. Used to create one when none is specified.
##  void CreateDefaultLocator ( vtkPolyData * input = nullptr ) ; *
##  Release locator
##  void ReleaseLocator ( ) { this -> SetLocator ( nullptr ) ; } *
##  Get the MTime of this object also considering the locator.
##  vtkMTimeType GetMTime ( ) override ; *
##  Perform operation on a point
##  virtual void OperateOnPoint ( double in [ 3 ] , double out [ 3 ] ) ; *
##  Perform operation on bounds
##  virtual void OperateOnBounds ( double in [ 6 ] , double out [ 6 ] ) ;  This filter is difficult to stream.
##  To get invariant results, the whole input must be processed at once.
##  This flag allows the user to select whether strict piece invariance
##  is required.  By default it is on.  When off, the filter can stream,
##  but results may change. virtual void SetToleranceIsAbsoluteConvertLinesToPointsConvertPolysToLinesConvertStripsToPolysPointMergingPieceInvariant ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PieceInvariant  to  << _arg ) ; if ( this -> PieceInvariant != _arg ) { this -> PieceInvariant = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetToleranceIsAbsoluteToleranceAbsoluteToleranceConvertLinesToPointsConvertPolysToLinesConvertStripsToPolysPointMergingPieceInvariant ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PieceInvariant  of  << this -> PieceInvariant ) ; return this -> PieceInvariant ; } ; virtual void PieceInvariantOn ( ) { this -> SetToleranceIsAbsoluteConvertLinesToPointsConvertPolysToLinesConvertStripsToPolysPointMergingPieceInvariant ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void PieceInvariantOff ( ) { this -> SetToleranceIsAbsoluteConvertLinesToPointsConvertPolysToLinesConvertStripsToPolysPointMergingPieceInvariant ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@{ *
##  Set/get the desired precision for the output types. See the documentation
##  for the vtkAlgorithm::DesiredOutputPrecision enum for an explanation of
##  the available precision settings.
##  virtual void SetToleranceIsAbsoluteConvertLinesToPointsConvertPolysToLinesConvertStripsToPolysPointMergingPieceInvariantOutputPointsPrecision ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputPointsPrecision  to  << _arg ) ; if ( this -> OutputPointsPrecision != _arg ) { this -> OutputPointsPrecision = _arg ; this -> Modified ( ) ; } } ; virtual int GetToleranceIsAbsoluteToleranceAbsoluteToleranceConvertLinesToPointsConvertPolysToLinesConvertStripsToPolysPointMergingPieceInvariantOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ; /@} protected : vtkCleanPolyData ( ) ; ~ vtkCleanPolyData ( ) override ;  Usual data generation method int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; vtkTypeBool PointMerging ; double Tolerance ; double AbsoluteTolerance ; vtkTypeBool ConvertLinesToPoints ; vtkTypeBool ConvertPolysToLines ; vtkTypeBool ConvertStripsToPolys ; vtkTypeBool ToleranceIsAbsolute ; vtkIncrementalPointLocator * Locator ; vtkTypeBool PieceInvariant ; int OutputPointsPrecision ; private : vtkCleanPolyData ( const vtkCleanPolyData & ) = delete ; void operator = ( const vtkCleanPolyData & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
