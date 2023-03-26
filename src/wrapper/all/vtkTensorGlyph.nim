## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTensorGlyph.h
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
##  @class   vtkTensorGlyph
##  @brief   scale and orient glyph(s) according to eigenvalues and eigenvectors of symmetrical part
##  of tensor
##
##  vtkTensorGlyph is a filter that copies a geometric representation
##  (specified as polygonal data) to every input point. The geometric
##  representation, or glyph, can be scaled and/or rotated according to
##  the tensor at the input point. Scaling and rotation is controlled
##  by the eigenvalues/eigenvectors of the symmetrical part of the tensor
##  as follows:
##  For each tensor, the eigenvalues (and associated eigenvectors) are sorted
##  to determine the major, medium, and minor eigenvalues/eigenvectors.
##  The eigenvalue decomposition only makes sense for symmetric tensors,
##  hence the need to only consider the symmetric part of the tensor, which is
##  1/2 (T + T.transposed()).
##
##  If the boolean variable ThreeGlyphs is not set the major eigenvalue
##  scales the glyph in the x-direction, the medium in the y-direction,
##  and the minor in the z-direction. Then, the glyph is rotated so
##  that the glyph's local x-axis lies along the major eigenvector,
##  y-axis along the medium eigenvector, and z-axis along the minor.
##
##  If the boolean variable ThreeGlyphs is set three glyphs are produced,
##  each of them oriented along an eigenvector and scaled according to the
##  corresponding eigenvector.
##
##  If the boolean variable Symmetric is set each glyph is mirrored (2 or 6
##  glyphs will be produced)
##
##  The x-axis of the source glyph will correspond to the eigenvector
##  on output. Point (0,0,0) in the source will be placed in the data point.
##  Variable Length will normally correspond to the distance from the
##  origin to the tip of the source glyph along the x-axis,
##  but can be changed to produce other results when Symmetric is on,
##  e.g. glyphs that do not touch or that overlap.
##
##  Please note that when Symmetric is false it will generally be better
##  to place the source glyph from (-0.5,0,0) to (0.5,0,0), i.e. centered
##  at the origin. When symmetric is true the placement from (0,0,0) to
##  (1,0,0) will generally be more convenient.
##
##  A scale factor is provided to control the amount of scaling. Also, you
##  can turn off scaling completely if desired. The boolean variable
##  ClampScaling controls the maximum scaling (in conjunction with
##  MaxScaleFactor.) This is useful in certain applications where
##  singularities or large order of magnitude differences exist in
##  the eigenvalues.
##
##  If the boolean variable ColorGlyphs is set to true the glyphs are
##  colored.  The glyphs can be colored using the input scalars
##  (SetColorModeToScalars), which is the default, or colored using the
##  eigenvalues (SetColorModeToEigenvalues).
##
##  Another instance variable, ExtractEigenvalues, has been provided to
##  control extraction of eigenvalues/eigenvectors. If this boolean is
##  false, then eigenvalues/eigenvectors are not extracted, and the
##  columns of the tensor are taken as the eigenvectors (the norm of
##  column, always positive, is the eigenvalue).  This allows
##  additional capability over the vtkGlyph3D object. That is, the
##  glyph can be oriented in three directions instead of one.
##
##  @par Thanks:
##  Thanks to Jose Paulo Moitinho de Almeida for enhancements.
##
##  @sa
##  vtkGlyph3D vtkPointLoad vtkHyperStreamline
##

## !!!Ignored construct:  # vtkTensorGlyph_h [NewLine] # vtkTensorGlyph_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class VTKFILTERSCORE_EXPORT vtkTensorGlyph : public vtkPolyDataAlgorithm { public : /@{ *
##  Standard methods for instantiation, obtaining type information, and
##  printing.Construct object with scaling on and scale factor
##  1.0. Eigenvalues are extracted, glyphs are colored with input scalar
##  data, and logarithmic scaling is turned off.
##  static vtkTensorGlyph * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkTensorGlyph :: IsTypeOf ( type ) ; } static vtkTensorGlyph * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkTensorGlyph * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkTensorGlyph * NewInstance ( ) const { return vtkTensorGlyph :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTensorGlyph :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTensorGlyph :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Specify the geometry to copy to each point.
##  Note that this method does not connect the pipeline. The algorithm will
##  work on the input data as it is without updating the producer of the data.
##  See SetSourceConnection for connecting the pipeline.
##  void SetSourceData ( vtkPolyData * source ) ; vtkPolyData * GetSource ( ) ; /@} /@{ *
##  Specify a source object at a specified table location. New style.
##  Source connection is stored in port 1. This method is equivalent
##  to SetInputConnection(1, id, outputPort).
##  void SetSourceConnection ( int id , vtkAlgorithmOutput * algOutput ) ; void SetSourceConnection ( vtkAlgorithmOutput * algOutput ) { this -> SetSourceConnection ( 0 , algOutput ) ; } /@} /@{ *
##  Turn on/off scaling of glyph with eigenvalues.
##  virtual void SetScaling ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Scaling  to  << _arg ) ; if ( this -> Scaling != _arg ) { this -> Scaling = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetScaling ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Scaling  of  << this -> Scaling ) ; return this -> Scaling ; } ; virtual void ScalingOn ( ) { this -> SetScaling ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ScalingOff ( ) { this -> SetScaling ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify scale factor to scale object by. (Scale factor always affects
##  output even if scaling is off.)
##  virtual void SetScalingScaleFactor ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ScaleFactor  to  << _arg ) ; if ( this -> ScaleFactor != _arg ) { this -> ScaleFactor = _arg ; this -> Modified ( ) ; } } ; virtual double GetScalingScaleFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScaleFactor  of  << this -> ScaleFactor ) ; return this -> ScaleFactor ; } ; /@} /@{ *
##  Turn on/off drawing three glyphs
##  virtual void SetScalingScaleFactorThreeGlyphs ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ThreeGlyphs  to  << _arg ) ; if ( this -> ThreeGlyphs != _arg ) { this -> ThreeGlyphs = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetScalingScaleFactorThreeGlyphs ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ThreeGlyphs  of  << this -> ThreeGlyphs ) ; return this -> ThreeGlyphs ; } ; virtual void ThreeGlyphsOn ( ) { this -> SetScalingThreeGlyphs ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ThreeGlyphsOff ( ) { this -> SetScalingThreeGlyphs ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off drawing a mirror of each glyph
##  virtual void SetScalingScaleFactorThreeGlyphsSymmetric ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Symmetric  to  << _arg ) ; if ( this -> Symmetric != _arg ) { this -> Symmetric = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetScalingScaleFactorThreeGlyphsSymmetric ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Symmetric  of  << this -> Symmetric ) ; return this -> Symmetric ; } ; virtual void SymmetricOn ( ) { this -> SetScalingThreeGlyphsSymmetric ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void SymmetricOff ( ) { this -> SetScalingThreeGlyphsSymmetric ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the distance, along x, from the origin to the end of the
##  source glyph. It is used to draw the symmetric glyphs.
##  virtual void SetScalingScaleFactorThreeGlyphsSymmetricLength ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Length  to  << _arg ) ; if ( this -> Length != _arg ) { this -> Length = _arg ; this -> Modified ( ) ; } } ; virtual double GetScalingScaleFactorThreeGlyphsSymmetricLength ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Length  of  << this -> Length ) ; return this -> Length ; } ; /@} /@{ *
##  Turn on/off extraction of eigenvalues from tensor.
##  virtual void SetScalingScaleFactorThreeGlyphsSymmetricLengthExtractEigenvalues ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ExtractEigenvalues  to  << _arg ) ; if ( this -> ExtractEigenvalues != _arg ) { this -> ExtractEigenvalues = _arg ; this -> Modified ( ) ; } } ; virtual void ExtractEigenvaluesOn ( ) { this -> SetScalingThreeGlyphsSymmetricExtractEigenvalues ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ExtractEigenvaluesOff ( ) { this -> SetScalingThreeGlyphsSymmetricExtractEigenvalues ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual vtkTypeBool GetScalingScaleFactorThreeGlyphsSymmetricLengthExtractEigenvalues ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ExtractEigenvalues  of  << this -> ExtractEigenvalues ) ; return this -> ExtractEigenvalues ; } ; /@} /@{ *
##  Turn on/off coloring of glyph with input scalar data or
##  eigenvalues. If false, or input scalar data not present, then the
##  scalars from the source object are passed through the filter.
##  virtual void SetScalingScaleFactorThreeGlyphsSymmetricLengthExtractEigenvaluesColorGlyphs ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ColorGlyphs  to  << _arg ) ; if ( this -> ColorGlyphs != _arg ) { this -> ColorGlyphs = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetScalingScaleFactorThreeGlyphsSymmetricLengthExtractEigenvaluesColorGlyphs ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ColorGlyphs  of  << this -> ColorGlyphs ) ; return this -> ColorGlyphs ; } ; virtual void ColorGlyphsOn ( ) { this -> SetScalingThreeGlyphsSymmetricExtractEigenvaluesColorGlyphs ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ColorGlyphsOff ( ) { this -> SetScalingThreeGlyphsSymmetricExtractEigenvaluesColorGlyphs ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} enum { COLOR_BY_SCALARS , COLOR_BY_EIGENVALUES } ; /@{ *
##  Set the color mode to be used for the glyphs.  This can be set to
##  use the input scalars (default) or to use the eigenvalues at the
##  point.  If ThreeGlyphs is set and the eigenvalues are chosen for
##  coloring then each glyph is colored by the corresponding
##  eigenvalue and if not set the color corresponding to the largest
##  eigenvalue is chosen.  The recognized values are:
##  COLOR_BY_SCALARS = 0 (default)
##  COLOR_BY_EIGENVALUES = 1
##  virtual void SetColorMode ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ColorMode  to  << _arg ) ; if ( this -> ColorMode != ( _arg < COLOR_BY_SCALARS ? COLOR_BY_SCALARS : ( _arg > COLOR_BY_EIGENVALUES ? COLOR_BY_EIGENVALUES : _arg ) ) ) { this -> ColorMode = ( _arg < COLOR_BY_SCALARS ? COLOR_BY_SCALARS : ( _arg > COLOR_BY_EIGENVALUES ? COLOR_BY_EIGENVALUES : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetColorModeMinValue ( ) { return COLOR_BY_SCALARS ; } virtual int GetColorModeMaxValue ( ) { return COLOR_BY_EIGENVALUES ; } ; virtual int GetScalingScaleFactorThreeGlyphsSymmetricLengthExtractEigenvaluesColorGlyphsColorMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ColorMode  of  << this -> ColorMode ) ; return this -> ColorMode ; } ; void SetColorModeToScalars ( ) { this -> SetColorMode ( COLOR_BY_SCALARS ) ; } void SetColorModeToEigenvalues ( ) { this -> SetColorMode ( COLOR_BY_EIGENVALUES ) ; } /@} /@{ *
##  Turn on/off scalar clamping. If scalar clamping is on, the ivar
##  MaxScaleFactor is used to control the maximum scale factor. (This is
##  useful to prevent uncontrolled scaling near singularities.)
##  virtual void SetScalingScaleFactorThreeGlyphsSymmetricLengthExtractEigenvaluesColorGlyphsClampScaling ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ClampScaling  to  << _arg ) ; if ( this -> ClampScaling != _arg ) { this -> ClampScaling = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetScalingScaleFactorThreeGlyphsSymmetricLengthExtractEigenvaluesColorGlyphsColorModeClampScaling ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ClampScaling  of  << this -> ClampScaling ) ; return this -> ClampScaling ; } ; virtual void ClampScalingOn ( ) { this -> SetScalingThreeGlyphsSymmetricExtractEigenvaluesColorGlyphsClampScaling ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ClampScalingOff ( ) { this -> SetScalingThreeGlyphsSymmetricExtractEigenvaluesColorGlyphsClampScaling ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the maximum allowable scale factor. This value is compared to the
##  combination of the scale factor times the eigenvalue. If less, the scale
##  factor is reset to the MaxScaleFactor. The boolean ClampScaling has to
##  be "on" for this to work.
##  virtual void SetScalingScaleFactorThreeGlyphsSymmetricLengthExtractEigenvaluesColorGlyphsClampScalingMaxScaleFactor ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MaxScaleFactor  to  << _arg ) ; if ( this -> MaxScaleFactor != _arg ) { this -> MaxScaleFactor = _arg ; this -> Modified ( ) ; } } ; virtual double GetScalingScaleFactorThreeGlyphsSymmetricLengthExtractEigenvaluesColorGlyphsColorModeClampScalingMaxScaleFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaxScaleFactor  of  << this -> MaxScaleFactor ) ; return this -> MaxScaleFactor ; } ; /@} protected : vtkTensorGlyph ( ) ; ~ vtkTensorGlyph ( ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; vtkTypeBool Scaling ;  Determine whether scaling of geometry is performed double ScaleFactor ;  Scale factor to use to scale geometry vtkTypeBool ExtractEigenvalues ;  Boolean controls eigenfunction extraction vtkTypeBool ColorGlyphs ;  Boolean controls coloring with input scalar data int ColorMode ;  The coloring mode to use for the glyphs. vtkTypeBool ClampScaling ;  Boolean controls whether scaling is clamped. double MaxScaleFactor ;  Maximum scale factor (ScaleFactor*eigenvalue) vtkTypeBool ThreeGlyphs ;  Boolean controls drawing 1 or 3 glyphs vtkTypeBool Symmetric ;  Boolean controls drawing a "mirror" of each glyph double Length ;  Distance, in x, from the origin to the end of the glyph private : vtkTensorGlyph ( const vtkTensorGlyph & ) = delete ; void operator = ( const vtkTensorGlyph & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
