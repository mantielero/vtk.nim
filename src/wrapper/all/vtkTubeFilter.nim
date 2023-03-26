## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTubeFilter.h
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
##  @class   vtkTubeFilter
##  @brief   filter that generates tubes around lines
##
##  vtkTubeFilter is a filter that generates a tube around each input line.
##  The tubes are made up of triangle strips and rotate around the tube with
##  the rotation of the line normals. (If no normals are present, they are
##  computed automatically.) The radius of the tube can be set to vary with
##  scalar or vector value. If the radius varies with scalar value the radius
##  is linearly adjusted. If the radius varies by vector, a mass flux preserving
##  variation is used. If the radius varies by vector norm, the radius is
##  linearly adjusted to its norm. The number of sides for the tube also
##  can be specified. You can also specify which of the sides are visible. This
##  is useful for generating interesting striping effects. Other options
##  include the ability to cap the tube and generate texture coordinates.
##  Texture coordinates can be used with an associated texture map to create
##  interesting effects such as marking the tube with stripes corresponding
##  to length or time.
##
##  This filter is typically used to create thick or dramatic lines. Another
##  common use is to combine this filter with vtkStreamTracer to generate
##  streamtubes.
##
##  @warning
##  The number of tube sides must be greater than 3. If you wish to use fewer
##  sides (i.e., a ribbon), use vtkRibbonFilter.
##
##  @warning
##  The input line must not have duplicate points, or normals at points that
##  are parallel to the incoming/outgoing line segments. (Duplicate points
##  can be removed with vtkCleanPolyData.) If a line does not meet this
##  criteria, then that line is not tubed.
##
##  @sa
##  vtkRibbonFilter vtkStreamTracer vtkTubeBender
##
##  @par Thanks:
##  Michael Finch for absolute scalar radius
##

## !!!Ignored construct:  # vtkTubeFilter_h [NewLine] # vtkTubeFilter_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] # VTK_VARY_RADIUS_OFF 0 [NewLine] # VTK_VARY_RADIUS_BY_SCALAR 1 [NewLine] # VTK_VARY_RADIUS_BY_VECTOR 2 [NewLine] # VTK_VARY_RADIUS_BY_ABSOLUTE_SCALAR 3 [NewLine] # VTK_VARY_RADIUS_BY_VECTOR_NORM 4 [NewLine] # VTK_TCOORDS_OFF 0 [NewLine] # VTK_TCOORDS_FROM_NORMALIZED_LENGTH 1 [NewLine] # VTK_TCOORDS_FROM_LENGTH 2 [NewLine] # VTK_TCOORDS_FROM_SCALARS 3 [NewLine] class vtkCellArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkCellData"
discard "forward decl of vtkDataArray"
discard "forward decl of vtkFloatArray"
discard "forward decl of vtkPointData"
discard "forward decl of vtkPoints"
## !!!Ignored construct:  class VTKFILTERSCORE_EXPORT vtkTubeFilter : public vtkPolyDataAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkTubeFilter :: IsTypeOf ( type ) ; } static vtkTubeFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkTubeFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkTubeFilter * NewInstance ( ) const { return vtkTubeFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTubeFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTubeFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct object with radius 0.5, radius variation turned off, the
##  number of sides set to 3, and radius factor of 10.
##  static vtkTubeFilter * New ( ) ; /@{ *
##  Set the minimum tube radius (minimum because the tube radius may vary).
##  virtual void SetRadius ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Radius  to  << _arg ) ; if ( this -> Radius != ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ) { this -> Radius = ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetRadiusMinValue ( ) { return 0.0 ; } virtual double GetRadiusMaxValue ( ) { return VTK_DOUBLE_MAX ; } ; virtual double GetRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Radius  of  << this -> Radius ) ; return this -> Radius ; } ; /@} /@{ *
##  Turn on/off the variation of tube radius with scalar value.
##  virtual void SetRadiusVaryRadius ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << VaryRadius  to  << _arg ) ; if ( this -> VaryRadius != ( _arg < VTK_VARY_RADIUS_OFF ? VTK_VARY_RADIUS_OFF : ( _arg > VTK_VARY_RADIUS_BY_VECTOR_NORM ? VTK_VARY_RADIUS_BY_VECTOR_NORM : _arg ) ) ) { this -> VaryRadius = ( _arg < VTK_VARY_RADIUS_OFF ? VTK_VARY_RADIUS_OFF : ( _arg > VTK_VARY_RADIUS_BY_VECTOR_NORM ? VTK_VARY_RADIUS_BY_VECTOR_NORM : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetRadiusMinValueVaryRadiusMinValue ( ) { return VTK_VARY_RADIUS_OFF ; } virtual int GetRadiusMaxValueVaryRadiusMaxValue ( ) { return VTK_VARY_RADIUS_BY_VECTOR_NORM ; } ; virtual int GetRadiusVaryRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VaryRadius  of  << this -> VaryRadius ) ; return this -> VaryRadius ; } ; void SetVaryRadiusToVaryRadiusOff ( ) { this -> SetVaryRadius ( VTK_VARY_RADIUS_OFF ) ; } void SetVaryRadiusToVaryRadiusByScalar ( ) { this -> SetVaryRadius ( VTK_VARY_RADIUS_BY_SCALAR ) ; } void SetVaryRadiusToVaryRadiusByVector ( ) { this -> SetVaryRadius ( VTK_VARY_RADIUS_BY_VECTOR ) ; } void SetVaryRadiusToVaryRadiusByVectorNorm ( ) { this -> SetVaryRadius ( VTK_VARY_RADIUS_BY_VECTOR_NORM ) ; } void SetVaryRadiusToVaryRadiusByAbsoluteScalar ( ) { this -> SetVaryRadius ( VTK_VARY_RADIUS_BY_ABSOLUTE_SCALAR ) ; } const char * GetVaryRadiusAsString ( ) ; /@} /@{ *
##  Set the number of sides for the tube. At a minimum, number of sides is 3.
##  virtual void SetRadiusVaryRadiusNumberOfSides ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << NumberOfSides  to  << _arg ) ; if ( this -> NumberOfSides != ( _arg < 3 ? 3 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> NumberOfSides = ( _arg < 3 ? 3 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetRadiusMinValueVaryRadiusMinValueNumberOfSidesMinValue ( ) { return 3 ; } virtual int GetRadiusMaxValueVaryRadiusMaxValueNumberOfSidesMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetRadiusVaryRadiusNumberOfSides ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfSides  of  << this -> NumberOfSides ) ; return this -> NumberOfSides ; } ; /@} /@{ *
##  Set the maximum tube radius in terms of a multiple of the minimum radius.
##  virtual void SetRadiusFactor ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  RadiusFactor  to  << _arg ) ; if ( this -> RadiusFactor != _arg ) { this -> RadiusFactor = _arg ; this -> Modified ( ) ; } } ; virtual double GetRadiusVaryRadiusNumberOfSidesRadiusFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RadiusFactor  of  << this -> RadiusFactor ) ; return this -> RadiusFactor ; } ; /@} /@{ *
##  Set the default normal to use if no normals are supplied, and the
##  DefaultNormalOn is set.
##  virtual void SetDefaultNormal ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << DefaultNormal  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> DefaultNormal [ 0 ] != _arg1 ) || ( this -> DefaultNormal [ 1 ] != _arg2 ) || ( this -> DefaultNormal [ 2 ] != _arg3 ) ) { this -> DefaultNormal [ 0 ] = _arg1 ; this -> DefaultNormal [ 1 ] = _arg2 ; this -> DefaultNormal [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetDefaultNormal ( const double _arg [ 3 ] ) { this -> SetDefaultNormal ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetDefaultNormal ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << DefaultNormal  pointer  << this -> DefaultNormal ) ; return this -> DefaultNormal ; } VTK_WRAPEXCLUDE virtual void GetDefaultNormal ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> DefaultNormal [ i ] ; } } ; /@} /@{ *
##  Set a boolean to control whether to use default normals.
##  DefaultNormalOn is set.
##  virtual void SetRadiusFactorUseDefaultNormal ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseDefaultNormal  to  << _arg ) ; if ( this -> UseDefaultNormal != _arg ) { this -> UseDefaultNormal = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetRadiusVaryRadiusNumberOfSidesRadiusFactorUseDefaultNormal ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseDefaultNormal  of  << this -> UseDefaultNormal ) ; return this -> UseDefaultNormal ; } ; virtual void UseDefaultNormalOn ( ) { this -> SetUseDefaultNormal ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void UseDefaultNormalOff ( ) { this -> SetUseDefaultNormal ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set a boolean to control whether tube sides should share vertices.
##  This creates independent strips, with constant normals so the
##  tube is always faceted in appearance.
##  virtual void SetRadiusFactorUseDefaultNormalSidesShareVertices ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SidesShareVertices  to  << _arg ) ; if ( this -> SidesShareVertices != _arg ) { this -> SidesShareVertices = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetRadiusVaryRadiusNumberOfSidesRadiusFactorUseDefaultNormalSidesShareVertices ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SidesShareVertices  of  << this -> SidesShareVertices ) ; return this -> SidesShareVertices ; } ; virtual void SidesShareVerticesOn ( ) { this -> SetUseDefaultNormalSidesShareVertices ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void SidesShareVerticesOff ( ) { this -> SetUseDefaultNormalSidesShareVertices ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off whether to cap the ends with polygons. Initial value is off.
##  virtual void SetRadiusFactorUseDefaultNormalSidesShareVerticesCapping ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Capping  to  << _arg ) ; if ( this -> Capping != _arg ) { this -> Capping = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetRadiusVaryRadiusNumberOfSidesRadiusFactorUseDefaultNormalSidesShareVerticesCapping ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Capping  of  << this -> Capping ) ; return this -> Capping ; } ; virtual void CappingOn ( ) { this -> SetUseDefaultNormalSidesShareVerticesCapping ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void CappingOff ( ) { this -> SetUseDefaultNormalSidesShareVerticesCapping ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Control the striping of the tubes. If OnRatio is greater than 1,
##  then every nth tube side is turned on, beginning with the Offset
##  side.
##  virtual void SetRadiusVaryRadiusNumberOfSidesOnRatio ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << OnRatio  to  << _arg ) ; if ( this -> OnRatio != ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> OnRatio = ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetRadiusMinValueVaryRadiusMinValueNumberOfSidesMinValueOnRatioMinValue ( ) { return 1 ; } virtual int GetRadiusMaxValueVaryRadiusMaxValueNumberOfSidesMaxValueOnRatioMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetRadiusVaryRadiusNumberOfSidesRadiusFactorUseDefaultNormalSidesShareVerticesCappingOnRatio ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OnRatio  of  << this -> OnRatio ) ; return this -> OnRatio ; } ; /@} /@{ *
##  Control the striping of the tubes. The offset sets the
##  first tube side that is visible. Offset is generally used with
##  OnRatio to create nifty striping effects.
##  virtual void SetRadiusVaryRadiusNumberOfSidesOnRatioOffset ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Offset  to  << _arg ) ; if ( this -> Offset != ( _arg < 0 ? 0 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> Offset = ( _arg < 0 ? 0 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetRadiusMinValueVaryRadiusMinValueNumberOfSidesMinValueOnRatioMinValueOffsetMinValue ( ) { return 0 ; } virtual int GetRadiusMaxValueVaryRadiusMaxValueNumberOfSidesMaxValueOnRatioMaxValueOffsetMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetRadiusVaryRadiusNumberOfSidesRadiusFactorUseDefaultNormalSidesShareVerticesCappingOnRatioOffset ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Offset  of  << this -> Offset ) ; return this -> Offset ; } ; /@} /@{ *
##  Control whether and how texture coordinates are produced. This is
##  useful for striping the tube with length textures, etc. If you
##  use scalars to create the texture, the scalars are assumed to be
##  monotonically increasing (or decreasing).
##  virtual void SetRadiusVaryRadiusNumberOfSidesOnRatioOffsetGenerateTCoords ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << GenerateTCoords  to  << _arg ) ; if ( this -> GenerateTCoords != ( _arg < VTK_TCOORDS_OFF ? VTK_TCOORDS_OFF : ( _arg > VTK_TCOORDS_FROM_SCALARS ? VTK_TCOORDS_FROM_SCALARS : _arg ) ) ) { this -> GenerateTCoords = ( _arg < VTK_TCOORDS_OFF ? VTK_TCOORDS_OFF : ( _arg > VTK_TCOORDS_FROM_SCALARS ? VTK_TCOORDS_FROM_SCALARS : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetRadiusMinValueVaryRadiusMinValueNumberOfSidesMinValueOnRatioMinValueOffsetMinValueGenerateTCoordsMinValue ( ) { return VTK_TCOORDS_OFF ; } virtual int GetRadiusMaxValueVaryRadiusMaxValueNumberOfSidesMaxValueOnRatioMaxValueOffsetMaxValueGenerateTCoordsMaxValue ( ) { return VTK_TCOORDS_FROM_SCALARS ; } ; virtual int GetRadiusVaryRadiusNumberOfSidesRadiusFactorUseDefaultNormalSidesShareVerticesCappingOnRatioOffsetGenerateTCoords ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateTCoords  of  << this -> GenerateTCoords ) ; return this -> GenerateTCoords ; } ; void SetGenerateTCoordsToOff ( ) { this -> SetGenerateTCoords ( VTK_TCOORDS_OFF ) ; } void SetGenerateTCoordsToNormalizedLength ( ) { this -> SetGenerateTCoords ( VTK_TCOORDS_FROM_NORMALIZED_LENGTH ) ; } void SetGenerateTCoordsToUseLength ( ) { this -> SetGenerateTCoords ( VTK_TCOORDS_FROM_LENGTH ) ; } void SetGenerateTCoordsToUseScalars ( ) { this -> SetGenerateTCoords ( VTK_TCOORDS_FROM_SCALARS ) ; } const char * GetGenerateTCoordsAsString ( ) ; /@} /@{ *
##  Control the conversion of units during the texture coordinates
##  calculation. The TextureLength indicates what length (whether
##  calculated from scalars or length) is mapped to the [0,1)
##  texture space.
##  virtual void SetRadiusVaryRadiusNumberOfSidesOnRatioOffsetGenerateTCoordsTextureLength ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << TextureLength  to  << _arg ) ; if ( this -> TextureLength != ( _arg < 0.000001 ? 0.000001 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> TextureLength = ( _arg < 0.000001 ? 0.000001 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetRadiusMinValueVaryRadiusMinValueNumberOfSidesMinValueOnRatioMinValueOffsetMinValueGenerateTCoordsMinValueTextureLengthMinValue ( ) { return 0.000001 ; } virtual double GetRadiusMaxValueVaryRadiusMaxValueNumberOfSidesMaxValueOnRatioMaxValueOffsetMaxValueGenerateTCoordsMaxValueTextureLengthMaxValue ( ) { return VTK_INT_MAX ; } ; virtual double GetRadiusVaryRadiusNumberOfSidesRadiusFactorUseDefaultNormalSidesShareVerticesCappingOnRatioOffsetGenerateTCoordsTextureLength ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TextureLength  of  << this -> TextureLength ) ; return this -> TextureLength ; } ; /@} /@{ *
##  Set/get the desired precision for the output types. See the documentation
##  for the vtkAlgorithm::DesiredOutputPrecision enum for an explanation of
##  the available precision settings.
##  virtual void SetRadiusFactorUseDefaultNormalSidesShareVerticesCappingOutputPointsPrecision ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputPointsPrecision  to  << _arg ) ; if ( this -> OutputPointsPrecision != _arg ) { this -> OutputPointsPrecision = _arg ; this -> Modified ( ) ; } } ; virtual int GetRadiusVaryRadiusNumberOfSidesRadiusFactorUseDefaultNormalSidesShareVerticesCappingOnRatioOffsetGenerateTCoordsTextureLengthOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ; /@} protected : vtkTubeFilter ( ) ; ~ vtkTubeFilter ( ) override = default ;  Usual data generation method int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; double Radius ;  minimum radius of tube int VaryRadius ;  controls radius variation int NumberOfSides ;  number of sides to create tube double RadiusFactor ;  maximum allowable radius double DefaultNormal [ 3 ] ; vtkTypeBool UseDefaultNormal ; vtkTypeBool SidesShareVertices ; vtkTypeBool Capping ;  control whether tubes are capped int OnRatio ;  control the generation of the sides of the tube int Offset ;  control the generation of the sides int GenerateTCoords ;  control texture coordinate generation int OutputPointsPrecision ; double TextureLength ;  this length is mapped to [0,1) texture space  Helper methods int GeneratePoints ( vtkIdType offset , vtkIdType npts , const vtkIdType * pts , vtkPoints * inPts , vtkPoints * newPts , vtkPointData * pd , vtkPointData * outPD , vtkFloatArray * newNormals , vtkDataArray * inScalars , double range [ 2 ] , vtkDataArray * inVectors , double maxSpeed , vtkDataArray * inNormals ) ; void GenerateStrips ( vtkIdType offset , vtkIdType npts , const vtkIdType * pts , vtkIdType inCellId , vtkCellData * cd , vtkCellData * outCD , vtkCellArray * newStrips ) ; void GenerateTextureCoords ( vtkIdType offset , vtkIdType npts , const vtkIdType * pts , vtkPoints * inPts , vtkDataArray * inScalars , vtkFloatArray * newTCoords ) ; vtkIdType ComputeOffset ( vtkIdType offset , vtkIdType npts ) ;  Helper data members double Theta ; private : vtkTubeFilter ( const vtkTubeFilter & ) = delete ; void operator = ( const vtkTubeFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
