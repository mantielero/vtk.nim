## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkWarpScalar.h
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
##  @class   vtkWarpScalar
##  @brief   deform geometry with scalar data
##
##  vtkWarpScalar is a filter that modifies point coordinates by moving
##  points along point normals by the scalar amount times the scale factor.
##  Useful for creating carpet or x-y-z plots.
##
##  If normals are not present in data, the Normal instance variable will
##  be used as the direction along which to warp the geometry. If normals are
##  present but you would like to use the Normal instance variable, set the
##  UseNormal boolean to true.
##
##  If XYPlane boolean is set true, then the z-value is considered to be
##  a scalar value (still scaled by scale factor), and the displacement is
##  along the z-axis. If scalars are also present, these are copied through
##  and can be used to color the surface.
##
##  Note that the filter passes both its point data and cell data to
##  its output, except for normals, since these are distorted by the
##  warping.
##

## !!!Ignored construct:  # vtkWarpScalar_h [NewLine] # vtkWarpScalar_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkPointSetAlgorithm.h [NewLine] class vtkDataArray ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSGENERAL_EXPORT vtkWarpScalar : public vtkPointSetAlgorithm { public : /@{ *
##  Standard methods for instantiation, obtaining type information,
##  and printing.
##  static vtkWarpScalar * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPointSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPointSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkWarpScalar :: IsTypeOf ( type ) ; } static vtkWarpScalar * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkWarpScalar * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkWarpScalar * NewInstance ( ) const { return vtkWarpScalar :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPointSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkWarpScalar :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkWarpScalar :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Specify value to scale displacement.
##  virtual void SetScaleFactor ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ScaleFactor  to  << _arg ) ; if ( this -> ScaleFactor != _arg ) { this -> ScaleFactor = _arg ; this -> Modified ( ) ; } } ; virtual double GetScaleFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScaleFactor  of  << this -> ScaleFactor ) ; return this -> ScaleFactor ; } ; /@} /@{ *
##  Turn on/off use of user specified normal. If on, data normals
##  will be ignored and instance variable Normal will be used instead.
##  virtual void SetScaleFactorUseNormal ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseNormal  to  << _arg ) ; if ( this -> UseNormal != _arg ) { this -> UseNormal = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetScaleFactorUseNormal ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseNormal  of  << this -> UseNormal ) ; return this -> UseNormal ; } ; virtual void UseNormalOn ( ) { this -> SetUseNormal ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void UseNormalOff ( ) { this -> SetUseNormal ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Normal (i.e., direction) along which to warp geometry. Only used
##  if UseNormal boolean set to true or no normals available in data.
##  virtual void SetNormal ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Normal  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Normal [ 0 ] != _arg1 ) || ( this -> Normal [ 1 ] != _arg2 ) || ( this -> Normal [ 2 ] != _arg3 ) ) { this -> Normal [ 0 ] = _arg1 ; this -> Normal [ 1 ] = _arg2 ; this -> Normal [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetNormal ( const double _arg [ 3 ] ) { this -> SetNormal ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetNormal ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Normal  pointer  << this -> Normal ) ; return this -> Normal ; } VTK_WRAPEXCLUDE virtual void GetNormal ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Normal [ i ] ; } } ; /@} /@{ *
##  Turn on/off flag specifying that input data is x-y plane. If x-y plane,
##  then the z value is used to warp the surface in the z-axis direction
##  (times the scale factor) and scalars are used to color the surface.
##  virtual void SetScaleFactorUseNormalXYPlane ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  XYPlane  to  << _arg ) ; if ( this -> XYPlane != _arg ) { this -> XYPlane = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetScaleFactorUseNormalXYPlane ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << XYPlane  of  << this -> XYPlane ) ; return this -> XYPlane ; } ; virtual void XYPlaneOn ( ) { this -> SetUseNormalXYPlane ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void XYPlaneOff ( ) { this -> SetUseNormalXYPlane ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/get the desired precision for the output points type. By default
##  (DEFAULT_PRECISION) the output type is SINGLE_PRECISION, otherwise it is
##  either SINGLE_PRECISION or DOUBLE_PRECISION as specified by the user.
##  virtual void SetScaleFactorUseNormalXYPlaneOutputPointsPrecision ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputPointsPrecision  to  << _arg ) ; if ( this -> OutputPointsPrecision != _arg ) { this -> OutputPointsPrecision = _arg ; this -> Modified ( ) ; } } ; virtual int GetScaleFactorUseNormalXYPlaneOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ; /@} int FillInputPortInformation ( int port , vtkInformation * info ) override ; protected : vtkWarpScalar ( ) ; ~ vtkWarpScalar ( ) override ; int RequestDataObject ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; double ScaleFactor ; vtkTypeBool UseNormal ; double Normal [ 3 ] ; vtkTypeBool XYPlane ; int OutputPointsPrecision ; private : vtkWarpScalar ( const vtkWarpScalar & ) = delete ; void operator = ( const vtkWarpScalar & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
