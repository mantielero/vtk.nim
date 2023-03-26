## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRibbonFilter.h
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
##  @class   vtkRibbonFilter
##  @brief   create oriented ribbons from lines defined in polygonal dataset
##
##  vtkRibbonFilter is a filter to create oriented ribbons from lines defined
##  in polygonal dataset. The orientation of the ribbon is along the line
##  segments and perpendicular to "projected" line normals. Projected line
##  normals are the original line normals projected to be perpendicular to
##  the local line segment. An offset angle can be specified to rotate the
##  ribbon with respect to the normal.
##
##  @warning
##  The input line must not have duplicate points, or normals at points that
##  are parallel to the incoming/outgoing line segments. (Duplicate points
##  can be removed with vtkCleanPolyData.) If a line does not meet this
##  criteria, then that line is not tubed.
##
##  @sa
##  vtkTubeFilter
##

## !!!Ignored construct:  # vtkRibbonFilter_h [NewLine] # vtkRibbonFilter_h [NewLine] # vtkFiltersModelingModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] # VTK_TCOORDS_OFF 0 [NewLine] # VTK_TCOORDS_FROM_NORMALIZED_LENGTH 1 [NewLine] # VTK_TCOORDS_FROM_LENGTH 2 [NewLine] # VTK_TCOORDS_FROM_SCALARS 3 [NewLine] class vtkCellArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkCellData"
discard "forward decl of vtkDataArray"
discard "forward decl of vtkFloatArray"
discard "forward decl of vtkPointData"
discard "forward decl of vtkPoints"
## !!!Ignored construct:  class VTKFILTERSMODELING_EXPORT vtkRibbonFilter : public vtkPolyDataAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkRibbonFilter :: IsTypeOf ( type ) ; } static vtkRibbonFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkRibbonFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkRibbonFilter * NewInstance ( ) const { return vtkRibbonFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRibbonFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRibbonFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct ribbon so that width is 0.1, the width does
##  not vary with scalar values, and the width factor is 2.0.
##  static vtkRibbonFilter * New ( ) ; /@{ *
##  Set the "half" width of the ribbon. If the width is allowed to vary,
##  this is the minimum width. The default is 0.5
##  virtual void SetWidth ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Width  to  << _arg ) ; if ( this -> Width != ( _arg < 0 ? 0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ) { this -> Width = ( _arg < 0 ? 0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetWidthMinValue ( ) { return 0 ; } virtual double GetWidthMaxValue ( ) { return VTK_DOUBLE_MAX ; } ; virtual double GetWidth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Width  of  << this -> Width ) ; return this -> Width ; } ; /@} /@{ *
##  Set the offset angle of the ribbon from the line normal. (The angle
##  is expressed in degrees.) The default is 0.0
##  virtual void SetWidthAngle ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Angle  to  << _arg ) ; if ( this -> Angle != ( _arg < 0 ? 0 : ( _arg > 360 ? 360 : _arg ) ) ) { this -> Angle = ( _arg < 0 ? 0 : ( _arg > 360 ? 360 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetWidthMinValueAngleMinValue ( ) { return 0 ; } virtual double GetWidthMaxValueAngleMaxValue ( ) { return 360 ; } ; virtual double GetWidthAngle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Angle  of  << this -> Angle ) ; return this -> Angle ; } ; /@} /@{ *
##  Turn on/off the variation of ribbon width with scalar value.
##  The default is Off
##  virtual void SetVaryWidth ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  VaryWidth  to  << _arg ) ; if ( this -> VaryWidth != _arg ) { this -> VaryWidth = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetWidthAngleVaryWidth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VaryWidth  of  << this -> VaryWidth ) ; return this -> VaryWidth ; } ; virtual void VaryWidthOn ( ) { this -> SetVaryWidth ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void VaryWidthOff ( ) { this -> SetVaryWidth ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set the maximum ribbon width in terms of a multiple of the minimum width.
##  The default is 2.0
##  virtual void SetVaryWidthWidthFactor ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  WidthFactor  to  << _arg ) ; if ( this -> WidthFactor != _arg ) { this -> WidthFactor = _arg ; this -> Modified ( ) ; } } ; virtual double GetWidthAngleVaryWidthWidthFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WidthFactor  of  << this -> WidthFactor ) ; return this -> WidthFactor ; } ; /@} /@{ *
##  Set the default normal to use if no normals are supplied, and
##  DefaultNormalOn is set. The default is (0,0,1)
##  virtual void SetDefaultNormal ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << DefaultNormal  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> DefaultNormal [ 0 ] != _arg1 ) || ( this -> DefaultNormal [ 1 ] != _arg2 ) || ( this -> DefaultNormal [ 2 ] != _arg3 ) ) { this -> DefaultNormal [ 0 ] = _arg1 ; this -> DefaultNormal [ 1 ] = _arg2 ; this -> DefaultNormal [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetDefaultNormal ( const double _arg [ 3 ] ) { this -> SetDefaultNormal ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetDefaultNormal ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << DefaultNormal  pointer  << this -> DefaultNormal ) ; return this -> DefaultNormal ; } VTK_WRAPEXCLUDE virtual void GetDefaultNormal ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> DefaultNormal [ i ] ; } } ; /@} /@{ *
##  Set a boolean to control whether to use default normals.
##  The default is Off
##  virtual void SetVaryWidthWidthFactorUseDefaultNormal ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseDefaultNormal  to  << _arg ) ; if ( this -> UseDefaultNormal != _arg ) { this -> UseDefaultNormal = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetWidthAngleVaryWidthWidthFactorUseDefaultNormal ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseDefaultNormal  of  << this -> UseDefaultNormal ) ; return this -> UseDefaultNormal ; } ; virtual void UseDefaultNormalOn ( ) { this -> SetVaryWidthUseDefaultNormal ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void UseDefaultNormalOff ( ) { this -> SetVaryWidthUseDefaultNormal ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Control whether and how texture coordinates are produced. This is
##  useful for striping the ribbon with time textures, etc.
##  virtual void SetWidthAngleGenerateTCoords ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << GenerateTCoords  to  << _arg ) ; if ( this -> GenerateTCoords != ( _arg < VTK_TCOORDS_OFF ? VTK_TCOORDS_OFF : ( _arg > VTK_TCOORDS_FROM_SCALARS ? VTK_TCOORDS_FROM_SCALARS : _arg ) ) ) { this -> GenerateTCoords = ( _arg < VTK_TCOORDS_OFF ? VTK_TCOORDS_OFF : ( _arg > VTK_TCOORDS_FROM_SCALARS ? VTK_TCOORDS_FROM_SCALARS : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetWidthMinValueAngleMinValueGenerateTCoordsMinValue ( ) { return VTK_TCOORDS_OFF ; } virtual int GetWidthMaxValueAngleMaxValueGenerateTCoordsMaxValue ( ) { return VTK_TCOORDS_FROM_SCALARS ; } ; virtual int GetWidthAngleVaryWidthWidthFactorUseDefaultNormalGenerateTCoords ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateTCoords  of  << this -> GenerateTCoords ) ; return this -> GenerateTCoords ; } ; void SetGenerateTCoordsToOff ( ) { this -> SetGenerateTCoords ( VTK_TCOORDS_OFF ) ; } void SetGenerateTCoordsToNormalizedLength ( ) { this -> SetGenerateTCoords ( VTK_TCOORDS_FROM_NORMALIZED_LENGTH ) ; } void SetGenerateTCoordsToUseLength ( ) { this -> SetGenerateTCoords ( VTK_TCOORDS_FROM_LENGTH ) ; } void SetGenerateTCoordsToUseScalars ( ) { this -> SetGenerateTCoords ( VTK_TCOORDS_FROM_SCALARS ) ; } const char * GetGenerateTCoordsAsString ( ) ; /@} /@{ *
##  Control the conversion of units during the texture coordinates
##  calculation. The TextureLength indicates what length (whether
##  calculated from scalars or length) is mapped to the [0,1)
##  texture space. The default is 1.0
##  virtual void SetWidthAngleGenerateTCoordsTextureLength ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << TextureLength  to  << _arg ) ; if ( this -> TextureLength != ( _arg < 0.000001 ? 0.000001 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> TextureLength = ( _arg < 0.000001 ? 0.000001 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetWidthMinValueAngleMinValueGenerateTCoordsMinValueTextureLengthMinValue ( ) { return 0.000001 ; } virtual double GetWidthMaxValueAngleMaxValueGenerateTCoordsMaxValueTextureLengthMaxValue ( ) { return VTK_INT_MAX ; } ; virtual double GetWidthAngleVaryWidthWidthFactorUseDefaultNormalGenerateTCoordsTextureLength ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TextureLength  of  << this -> TextureLength ) ; return this -> TextureLength ; } ; /@} protected : vtkRibbonFilter ( ) ; ~ vtkRibbonFilter ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; double Width ; double Angle ; vtkTypeBool VaryWidth ;  controls whether width varies with scalar data double WidthFactor ; double DefaultNormal [ 3 ] ; vtkTypeBool UseDefaultNormal ; int GenerateTCoords ;  control texture coordinate generation double TextureLength ;  this length is mapped to [0,1) texture space  Helper methods int GeneratePoints ( vtkIdType offset , vtkIdType npts , const vtkIdType * pts , vtkPoints * inPts , vtkPoints * newPts , vtkPointData * pd , vtkPointData * outPD , vtkFloatArray * newNormals , vtkDataArray * inScalars , double range [ 2 ] , vtkDataArray * inNormals ) ; void GenerateStrip ( vtkIdType offset , vtkIdType npts , const vtkIdType * pts , vtkIdType inCellId , vtkCellData * cd , vtkCellData * outCD , vtkCellArray * newStrips ) ; void GenerateTextureCoords ( vtkIdType offset , vtkIdType npts , const vtkIdType * pts , vtkPoints * inPts , vtkDataArray * inScalars , vtkFloatArray * newTCoords ) ; vtkIdType ComputeOffset ( vtkIdType offset , vtkIdType npts ) ;  Helper data members double Theta ; private : vtkRibbonFilter ( const vtkRibbonFilter & ) = delete ; void operator = ( const vtkRibbonFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
