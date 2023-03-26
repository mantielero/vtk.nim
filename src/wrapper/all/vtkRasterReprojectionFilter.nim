## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRasterReprojectionFilter.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##    This software is distributed WITHOUT ANY WARRANTY; without even
##    the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##    PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class vtkRasterReprojectionFilter
##  @brief Transform a VTK image data to a different projection.
##
##  Applies map reprojection to vtkUniformGrid or vtkImageData.
##  Internally uses GDAL/Proj4 for the reprojection calculations.
##

## !!!Ignored construct:  # vtkRasterReprojectionFilter_h [NewLine] # vtkRasterReprojectionFilter_h [NewLine] # vtkGeovisGDALModule.h  For export macro # vtkImageAlgorithm.h [NewLine] class VTKGEOVISGDAL_EXPORT vtkRasterReprojectionFilter : public vtkImageAlgorithm { public : static vtkRasterReprojectionFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkRasterReprojectionFilter :: IsTypeOf ( type ) ; } static vtkRasterReprojectionFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkRasterReprojectionFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkRasterReprojectionFilter * NewInstance ( ) const { return vtkRasterReprojectionFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRasterReprojectionFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRasterReprojectionFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set the map-projection string for the input image data.
##  This should *only* be used for nonstandard image inputs,
##  when the MAP_PROJECTION is not embedded as field data.
##  Can be specified using any string formats supported by GDAL,
##  such as "well known text" (WKT) formats (GEOGS[]),
##  or shorter "user string" formats, such as EPSG:3857.
##  virtual void SetInputProjection ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << InputProjection  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> InputProjection == nullptr && _arg == nullptr ) { return ; } if ( this -> InputProjection && _arg && ( ! strcmp ( this -> InputProjection , _arg ) ) ) { return ; } delete [ ] this -> InputProjection ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> InputProjection = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> InputProjection = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetInputProjection ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << InputProjection  of  << ( this -> InputProjection ? this -> InputProjection : (null) ) ) ; return this -> InputProjection ; } ; /@} /@{ *
##  Set the map-projection string for the output image data.
##  virtual void SetInputProjectionOutputProjection ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << OutputProjection  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> OutputProjection == nullptr && _arg == nullptr ) { return ; } if ( this -> OutputProjection && _arg && ( ! strcmp ( this -> OutputProjection , _arg ) ) ) { return ; } delete [ ] this -> OutputProjection ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> OutputProjection = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> OutputProjection = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetInputProjectionOutputProjection ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << OutputProjection  of  << ( this -> OutputProjection ? this -> OutputProjection : (null) ) ) ; return this -> OutputProjection ; } ; /@} /@{ *
##  Set the width and height of the output image.
##  It is recommended to leave this variable unset, in which case,
##  the filter will use the GDAL suggested dimensions to construct
##  the output image. This method can be used to override this, and
##  impose specific output image dimensions.
##  virtual void SetOutputDimensions ( int _arg1 , int _arg2 ) { vtkDebugWithObjectMacro ( this , <<  setting  << OutputDimensions  to ( << _arg1 << , << _arg2 << ) ) ; if ( ( this -> OutputDimensions [ 0 ] != _arg1 ) || ( this -> OutputDimensions [ 1 ] != _arg2 ) ) { this -> OutputDimensions [ 0 ] = _arg1 ; this -> OutputDimensions [ 1 ] = _arg2 ; this -> Modified ( ) ; } } void SetOutputDimensions ( const int _arg [ 2 ] ) { this -> SetOutputDimensions ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; virtual int * GetOutputDimensions ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << OutputDimensions  pointer  << this -> OutputDimensions ) ; return this -> OutputDimensions ; } VTK_WRAPEXCLUDE virtual void GetOutputDimensions ( int & _arg1 , int & _arg2 ) { _arg1 = this -> OutputDimensions [ 0 ] ; _arg2 = this -> OutputDimensions [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << OutputDimensions  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOutputDimensions ( int _arg [ 2 ] ) { this -> GetOutputDimensions ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; /@} /@{ *
##  The data value to use internally to represent blank points in GDAL
##  datasets. By default, this will be set to the minimum value for the input
##  data type.
##  virtual void SetNoDataValue ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NoDataValue  to  << _arg ) ; if ( this -> NoDataValue != _arg ) { this -> NoDataValue = _arg ; this -> Modified ( ) ; } } ; virtual double GetNoDataValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NoDataValue  of  << this -> NoDataValue ) ; return this -> NoDataValue ; } ; /@} /@{ *
##  Set the maximum error, measured in input pixels, that is allowed
##  in approximating the GDAL reprojection transformation.
##  The default is 0.0, for exact calculations.
##  virtual void SetMaxError ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << MaxError  to  << _arg ) ; if ( this -> MaxError != ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ) { this -> MaxError = ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetMaxErrorMinValue ( ) { return 0.0 ; } virtual double GetMaxErrorMaxValue ( ) { return VTK_DOUBLE_MAX ; } ; virtual double GetNoDataValueMaxError ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaxError  of  << this -> MaxError ) ; return this -> MaxError ; } ; /@} /@{ *
##  Set the pixel resampling algorithm. Choices range between 0 and 6:
##  0 = Nearest Neighbor (default)
##  1 = Bilinear
##  2 = Cubic
##  3 = CubicSpline
##  4 = Lanczos
##  5 = Average
##  6 = Mode
##  virtual void SetMaxErrorResamplingAlgorithm ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ResamplingAlgorithm  to  << _arg ) ; if ( this -> ResamplingAlgorithm != ( _arg < 0 ? 0 : ( _arg > 6 ? 6 : _arg ) ) ) { this -> ResamplingAlgorithm = ( _arg < 0 ? 0 : ( _arg > 6 ? 6 : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetMaxErrorMinValueResamplingAlgorithmMinValue ( ) { return 0 ; } virtual int GetMaxErrorMaxValueResamplingAlgorithmMaxValue ( ) { return 6 ; } ; /@} protected : vtkRasterReprojectionFilter ( ) ; ~ vtkRasterReprojectionFilter ( ) override ; int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int RequestUpdateExtent ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int RequestInformation ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int FillOutputPortInformation ( int port , vtkInformation * info ) override ; char * InputProjection ; int FlipAxis [ 3 ] ; char * OutputProjection ; int OutputDimensions [ 2 ] ; double NoDataValue ; double MaxError ; int ResamplingAlgorithm ; class vtkRasterReprojectionFilterInternal ; vtkRasterReprojectionFilterInternal * Internal ; private : vtkRasterReprojectionFilter ( const vtkRasterReprojectionFilter & ) = delete ; void operator = ( const vtkRasterReprojectionFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
