## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBoundedPointSource.h
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
##  @class   vtkBoundedPointSource
##  @brief   create a random cloud of points within a
##  specified bounding box
##
##
##  vtkBoundedPointSource is a source object that creates a user-specified
##  number of points within a specified bounding box. The points are scattered
##  randomly throughout the box. Optionally, the user can produce a
##  vtkPolyVertex cell as well as random scalar values within a specified
##  range. The class is typically used for debugging and testing, as well as
##  seeding streamlines.
##

## !!!Ignored construct:  # vtkBoundedPointSource_h [NewLine] # vtkBoundedPointSource_h [NewLine] # vtkFiltersPointsModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class VTKFILTERSPOINTS_EXPORT vtkBoundedPointSource : public vtkPolyDataAlgorithm { public : /@{ *
##  Standard methods for instantiation, type information and printing.
##  static vtkBoundedPointSource * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkBoundedPointSource :: IsTypeOf ( type ) ; } static vtkBoundedPointSource * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkBoundedPointSource * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkBoundedPointSource * NewInstance ( ) const { return vtkBoundedPointSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBoundedPointSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBoundedPointSource :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Set the number of points to generate.
##  virtual void SetNumberOfPoints ( vtkIdType _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << NumberOfPoints  to  << _arg ) ; if ( this -> NumberOfPoints != ( _arg < 1 ? 1 : ( _arg > VTK_ID_MAX ? VTK_ID_MAX : _arg ) ) ) { this -> NumberOfPoints = ( _arg < 1 ? 1 : ( _arg > VTK_ID_MAX ? VTK_ID_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual vtkIdType GetNumberOfPointsMinValue ( ) { return 1 ; } virtual vtkIdType GetNumberOfPointsMaxValue ( ) { return VTK_ID_MAX ; } ; virtual vtkIdType GetNumberOfPoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfPoints  of  << this -> NumberOfPoints ) ; return this -> NumberOfPoints ; } ; /@} /@{ *
##  Set the bounding box for the point distribution. By default the bounds is
##  (-1,1,-1,1,-1,1).
##  virtual void SetBounds ( double _arg1 , double _arg2 , double _arg3 , double _arg4 , double _arg5 , double _arg6 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Bounds  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; if ( ( this -> Bounds [ 0 ] != _arg1 ) || ( this -> Bounds [ 1 ] != _arg2 ) || ( this -> Bounds [ 2 ] != _arg3 ) || ( this -> Bounds [ 3 ] != _arg4 ) || ( this -> Bounds [ 4 ] != _arg5 ) || ( this -> Bounds [ 5 ] != _arg6 ) ) { this -> Bounds [ 0 ] = _arg1 ; this -> Bounds [ 1 ] = _arg2 ; this -> Bounds [ 2 ] = _arg3 ; this -> Bounds [ 3 ] = _arg4 ; this -> Bounds [ 4 ] = _arg5 ; this -> Bounds [ 5 ] = _arg6 ; this -> Modified ( ) ; } } virtual void SetBounds ( const double _arg [ 6 ] ) { this -> SetBounds ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; virtual double * GetBounds ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Bounds  pointer  << this -> Bounds ) ; return this -> Bounds ; } VTK_WRAPEXCLUDE virtual void GetBounds ( double data [ 6 ] ) { for ( int i = 0 ; i < 6 ; i ++ ) { data [ i ] = this -> Bounds [ i ] ; } } ; /@} /@{ *
##  Set/get the desired precision for the output points.
##  vtkAlgorithm::SINGLE_PRECISION - Output single-precision floating point.
##  vtkAlgorithm::DOUBLE_PRECISION - Output double-precision floating point.
##  virtual void SetOutputPointsPrecision ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputPointsPrecision  to  << _arg ) ; if ( this -> OutputPointsPrecision != _arg ) { this -> OutputPointsPrecision = _arg ; this -> Modified ( ) ; } } ; virtual int GetNumberOfPointsOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ; /@} /@{ *
##  Indicate whether to produce a vtkPolyVertex cell to go along with the
##  output vtkPoints generated. By default a cell is NOT produced. Some filters
##  do not need the vtkPolyVertex which just consumes a lot of memory.
##  virtual void SetOutputPointsPrecisionProduceCellOutput ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ProduceCellOutput  to  << _arg ) ; if ( this -> ProduceCellOutput != _arg ) { this -> ProduceCellOutput = _arg ; this -> Modified ( ) ; } } ; virtual bool GetNumberOfPointsOutputPointsPrecisionProduceCellOutput ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProduceCellOutput  of  << this -> ProduceCellOutput ) ; return this -> ProduceCellOutput ; } ; virtual void ProduceCellOutputOn ( ) { this -> SetProduceCellOutput ( static_cast < bool > ( 1 ) ) ; } virtual void ProduceCellOutputOff ( ) { this -> SetProduceCellOutput ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Indicate whether to produce random point scalars in the output. By default
##  this is off.
##  virtual void SetOutputPointsPrecisionProduceCellOutputProduceRandomScalars ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ProduceRandomScalars  to  << _arg ) ; if ( this -> ProduceRandomScalars != _arg ) { this -> ProduceRandomScalars = _arg ; this -> Modified ( ) ; } } ; virtual bool GetNumberOfPointsOutputPointsPrecisionProduceCellOutputProduceRandomScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProduceRandomScalars  of  << this -> ProduceRandomScalars ) ; return this -> ProduceRandomScalars ; } ; virtual void ProduceRandomScalarsOn ( ) { this -> SetProduceCellOutputProduceRandomScalars ( static_cast < bool > ( 1 ) ) ; } virtual void ProduceRandomScalarsOff ( ) { this -> SetProduceCellOutputProduceRandomScalars ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Set the range in which the random scalars should be produced. By default the
##  scalar range is (0,1).
##  virtual void SetScalarRange ( double _arg1 , double _arg2 ) { vtkDebugWithObjectMacro ( this , <<  setting  << ScalarRange  to ( << _arg1 << , << _arg2 << ) ) ; if ( ( this -> ScalarRange [ 0 ] != _arg1 ) || ( this -> ScalarRange [ 1 ] != _arg2 ) ) { this -> ScalarRange [ 0 ] = _arg1 ; this -> ScalarRange [ 1 ] = _arg2 ; this -> Modified ( ) ; } } void SetScalarRange ( const double _arg [ 2 ] ) { this -> SetScalarRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; virtual double * GetBoundsScalarRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarRange  pointer  << this -> ScalarRange ) ; return this -> ScalarRange ; } VTK_WRAPEXCLUDE virtual void GetBoundsScalarRange ( double data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> ScalarRange [ i ] ; } } ; /@} protected : vtkBoundedPointSource ( ) ; ~ vtkBoundedPointSource ( ) override = default ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; vtkIdType NumberOfPoints ; double Bounds [ 6 ] ; int OutputPointsPrecision ; bool ProduceCellOutput ; bool ProduceRandomScalars ; double ScalarRange [ 2 ] ; private : vtkBoundedPointSource ( const vtkBoundedPointSource & ) = delete ; void operator = ( const vtkBoundedPointSource & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
