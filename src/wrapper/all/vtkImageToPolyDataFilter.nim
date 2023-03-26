## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageToPolyDataFilter.h
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
##  @class   vtkImageToPolyDataFilter
##  @brief   generate linear primitives (vtkPolyData) from an image
##
##  vtkImageToPolyDataFilter converts raster data (i.e., an image) into
##  polygonal data (i.e., quads or n-sided polygons), with each polygon
##  assigned a constant color. This is useful for writers that generate vector
##  formats (i.e., CGM or PostScript). To use this filter, you specify how to
##  quantize the color (or whether to use an image with a lookup table), and
##  what style the output should be. The output is always polygons, but the
##  choice is n x m quads (where n and m define the input image dimensions)
##  "Pixelize" option; arbitrary polygons "Polygonalize" option; or variable
##  number of quads of constant color generated along scan lines "RunLength"
##  option.
##
##  The algorithm quantizes color in order to create coherent regions that the
##  polygons can represent with good compression. By default, the input image
##  is quantized to 256 colors using a 3-3-2 bits for red-green-blue. However,
##  you can also supply a single component image and a lookup table, with the
##  single component assumed to be an index into the table.  (Note: a quantized
##  image can be generated with the filter vtkImageQuantizeRGBToIndex.) The
##  number of colors on output is equal to the number of colors in the input
##  lookup table (or 256 if the built in linear ramp is used).
##
##  The output of the filter is polygons with a single color per polygon cell.
##  If the output style is set to "Polygonalize", the polygons may have an
##  large number of points (bounded by something like 2*(n+m)); and the
##  polygon may not be convex which may cause rendering problems on some
##  systems (use vtkTriangleFilter). Otherwise, each polygon will have four
##  vertices. The output also contains scalar data defining RGB color in
##  unsigned char form.
##
##  @warning
##  The input linear lookup table must
##  be of the form of 3-component unsigned char.
##
##  @warning
##  This filter defines constant cell colors. If you have a plotting
##  device that supports Gouraud shading (linear interpolation of color), then
##  superior algorithms are available for generating polygons from images.
##
##  @warning
##  Note that many plotting devices/formats support only a limited number of
##  colors.
##
##  @sa
##  vtkCGMWriter vtkImageQuantizeRGBToIndex vtkTriangleFilter
##

## !!!Ignored construct:  # vtkImageToPolyDataFilter_h [NewLine] # vtkImageToPolyDataFilter_h [NewLine] # vtkFiltersHybridModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] # VTK_STYLE_PIXELIZE 0 [NewLine] # VTK_STYLE_POLYGONALIZE 1 [NewLine] # VTK_STYLE_RUN_LENGTH 2 [NewLine] # VTK_COLOR_MODE_LUT 0 [NewLine] # VTK_COLOR_MODE_LINEAR_256 1 [NewLine] class vtkDataArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkEdgeTable"
discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkIntArray"
discard "forward decl of vtkScalarsToColors"
discard "forward decl of vtkStructuredPoints"
discard "forward decl of vtkTimeStamp"
discard "forward decl of vtkUnsignedCharArray"
## !!!Ignored construct:  class VTKFILTERSHYBRID_EXPORT vtkImageToPolyDataFilter : public vtkPolyDataAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageToPolyDataFilter :: IsTypeOf ( type ) ; } static vtkImageToPolyDataFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageToPolyDataFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageToPolyDataFilter * NewInstance ( ) const { return vtkImageToPolyDataFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageToPolyDataFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageToPolyDataFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Instantiate object with initial number of colors 256.
##  static vtkImageToPolyDataFilter * New ( ) ; /@{ *
##  Specify how to create the output. Pixelize means converting the image
##  to quad polygons with a constant color per quad. Polygonalize means
##  merging colors together into polygonal regions, and then smoothing
##  the regions (if smoothing is turned on). RunLength means creating
##  quad polygons that may encompass several pixels on a scan line. The
##  default behavior is Polygonalize.
##  virtual void SetOutputStyle ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << OutputStyle  to  << _arg ) ; if ( this -> OutputStyle != ( _arg < VTK_STYLE_PIXELIZE ? VTK_STYLE_PIXELIZE : ( _arg > VTK_STYLE_RUN_LENGTH ? VTK_STYLE_RUN_LENGTH : _arg ) ) ) { this -> OutputStyle = ( _arg < VTK_STYLE_PIXELIZE ? VTK_STYLE_PIXELIZE : ( _arg > VTK_STYLE_RUN_LENGTH ? VTK_STYLE_RUN_LENGTH : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetOutputStyleMinValue ( ) { return VTK_STYLE_PIXELIZE ; } virtual int GetOutputStyleMaxValue ( ) { return VTK_STYLE_RUN_LENGTH ; } ; virtual int GetOutputStyle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputStyle  of  << this -> OutputStyle ) ; return this -> OutputStyle ; } ; void SetOutputStyleToPixelize ( ) { this -> SetOutputStyle ( VTK_STYLE_PIXELIZE ) ; } void SetOutputStyleToPolygonalize ( ) { this -> SetOutputStyle ( VTK_STYLE_POLYGONALIZE ) ; } void SetOutputStyleToRunLength ( ) { this -> SetOutputStyle ( VTK_STYLE_RUN_LENGTH ) ; } /@} /@{ *
##  Specify how to quantize color.
##  virtual void SetOutputStyleColorMode ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ColorMode  to  << _arg ) ; if ( this -> ColorMode != ( _arg < VTK_COLOR_MODE_LUT ? VTK_COLOR_MODE_LUT : ( _arg > VTK_COLOR_MODE_LINEAR_256 ? VTK_COLOR_MODE_LINEAR_256 : _arg ) ) ) { this -> ColorMode = ( _arg < VTK_COLOR_MODE_LUT ? VTK_COLOR_MODE_LUT : ( _arg > VTK_COLOR_MODE_LINEAR_256 ? VTK_COLOR_MODE_LINEAR_256 : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetOutputStyleMinValueColorModeMinValue ( ) { return VTK_COLOR_MODE_LUT ; } virtual int GetOutputStyleMaxValueColorModeMaxValue ( ) { return VTK_COLOR_MODE_LINEAR_256 ; } ; virtual int GetOutputStyleColorMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ColorMode  of  << this -> ColorMode ) ; return this -> ColorMode ; } ; void SetColorModeToLUT ( ) { this -> SetColorMode ( VTK_COLOR_MODE_LUT ) ; } void SetColorModeToLinear256 ( ) { this -> SetColorMode ( VTK_COLOR_MODE_LINEAR_256 ) ; } /@} /@{ *
##  Set/Get the vtkLookupTable to use. The lookup table is used when the
##  color mode is set to LUT and a single component scalar is input.
##  virtual void SetLookupTable ( vtkScalarsToColors * ) ; virtual vtkScalarsToColors * GetnameLookupTable ( ) { vtkDebugWithObjectMacro ( this , <<  returning  LookupTable  address  << static_cast < vtkScalarsToColors * > ( this -> LookupTable ) ) ; return this -> LookupTable ; } ; /@} /@{ *
##  If the output style is set to polygonalize, then you can control
##  whether to smooth boundaries.
##  virtual void SetSmoothing ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Smoothing  to  << _arg ) ; if ( this -> Smoothing != _arg ) { this -> Smoothing = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetOutputStyleColorModeSmoothing ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Smoothing  of  << this -> Smoothing ) ; return this -> Smoothing ; } ; virtual void SmoothingOn ( ) { this -> SetSmoothing ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void SmoothingOff ( ) { this -> SetSmoothing ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify the number of smoothing iterations to smooth polygons. (Only
##  in effect if output style is Polygonalize and smoothing is on.)
##  virtual void SetOutputStyleColorModeNumberOfSmoothingIterations ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << NumberOfSmoothingIterations  to  << _arg ) ; if ( this -> NumberOfSmoothingIterations != ( _arg < 0 ? 0 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> NumberOfSmoothingIterations = ( _arg < 0 ? 0 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetOutputStyleMinValueColorModeMinValueNumberOfSmoothingIterationsMinValue ( ) { return 0 ; } virtual int GetOutputStyleMaxValueColorModeMaxValueNumberOfSmoothingIterationsMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetOutputStyleColorModeSmoothingNumberOfSmoothingIterations ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfSmoothingIterations  of  << this -> NumberOfSmoothingIterations ) ; return this -> NumberOfSmoothingIterations ; } ; /@} /@{ *
##  Turn on/off whether the final polygons should be decimated.
##  whether to smooth boundaries.
##  virtual void SetSmoothingDecimation ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Decimation  to  << _arg ) ; if ( this -> Decimation != _arg ) { this -> Decimation = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetOutputStyleColorModeSmoothingNumberOfSmoothingIterationsDecimation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Decimation  of  << this -> Decimation ) ; return this -> Decimation ; } ; virtual void DecimationOn ( ) { this -> SetSmoothingDecimation ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void DecimationOff ( ) { this -> SetSmoothingDecimation ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify the error to use for decimation (if decimation is on).
##  The error is an absolute number--the image spacing and
##  dimensions are used to create points so the error should be
##  consistent with the image size.
##  virtual void SetOutputStyleColorModeNumberOfSmoothingIterationsDecimationError ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << DecimationError  to  << _arg ) ; if ( this -> DecimationError != ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ) { this -> DecimationError = ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetOutputStyleMinValueColorModeMinValueNumberOfSmoothingIterationsMinValueDecimationErrorMinValue ( ) { return 0.0 ; } virtual double GetOutputStyleMaxValueColorModeMaxValueNumberOfSmoothingIterationsMaxValueDecimationErrorMaxValue ( ) { return VTK_DOUBLE_MAX ; } ; virtual double GetOutputStyleColorModeSmoothingNumberOfSmoothingIterationsDecimationDecimationError ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DecimationError  of  << this -> DecimationError ) ; return this -> DecimationError ; } ; /@} /@{ *
##  Specify the error value between two colors where the colors are
##  considered the same. Only use this if the color mode uses the
##  default 256 table.
##  virtual void SetOutputStyleColorModeNumberOfSmoothingIterationsDecimationErrorError ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Error  to  << _arg ) ; if ( this -> Error != ( _arg < 0 ? 0 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> Error = ( _arg < 0 ? 0 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetOutputStyleMinValueColorModeMinValueNumberOfSmoothingIterationsMinValueDecimationErrorMinValueErrorMinValue ( ) { return 0 ; } virtual int GetOutputStyleMaxValueColorModeMaxValueNumberOfSmoothingIterationsMaxValueDecimationErrorMaxValueErrorMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetOutputStyleColorModeSmoothingNumberOfSmoothingIterationsDecimationDecimationErrorError ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Error  of  << this -> Error ) ; return this -> Error ; } ; /@} /@{ *
##  Specify the size (n by n pixels) of the largest region to
##  polygonalize. When the OutputStyle is set to VTK_STYLE_POLYGONALIZE,
##  large amounts of memory are used. In order to process large images,
##  the image is broken into pieces that are at most Size pixels in
##  width and height.
##  virtual void SetOutputStyleColorModeNumberOfSmoothingIterationsDecimationErrorErrorSubImageSize ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << SubImageSize  to  << _arg ) ; if ( this -> SubImageSize != ( _arg < 10 ? 10 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> SubImageSize = ( _arg < 10 ? 10 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetOutputStyleMinValueColorModeMinValueNumberOfSmoothingIterationsMinValueDecimationErrorMinValueErrorMinValueSubImageSizeMinValue ( ) { return 10 ; } virtual int GetOutputStyleMaxValueColorModeMaxValueNumberOfSmoothingIterationsMaxValueDecimationErrorMaxValueErrorMaxValueSubImageSizeMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetOutputStyleColorModeSmoothingNumberOfSmoothingIterationsDecimationDecimationErrorErrorSubImageSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SubImageSize  of  << this -> SubImageSize ) ; return this -> SubImageSize ; } ; /@} protected : vtkImageToPolyDataFilter ( ) ; ~ vtkImageToPolyDataFilter ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int OutputStyle ; int ColorMode ; vtkTypeBool Smoothing ; int NumberOfSmoothingIterations ; vtkTypeBool Decimation ; double DecimationError ; int Error ; int SubImageSize ; vtkScalarsToColors * LookupTable ; virtual void PixelizeImage ( vtkUnsignedCharArray * pixels , int dims [ 3 ] , double origin [ 3 ] , double spacing [ 3 ] , vtkPolyData * output ) ; virtual void PolygonalizeImage ( vtkUnsignedCharArray * pixels , int dims [ 3 ] , double origin [ 3 ] , double spacing [ 3 ] , vtkPolyData * output ) ; virtual void RunLengthImage ( vtkUnsignedCharArray * pixels , int dims [ 3 ] , double origin [ 3 ] , double spacing [ 3 ] , vtkPolyData * output ) ; private : vtkUnsignedCharArray * Table ;  color table used to quantize points vtkTimeStamp TableMTime ; int * Visited ;  traverse & mark connected regions vtkUnsignedCharArray * PolyColors ;  the colors of each region -> polygon vtkEdgeTable * EdgeTable ;  keep track of intersection points vtkEdgeTable * EdgeUseTable ;  keep track of polygons use of edges vtkIntArray * EdgeUses ;  the two polygons that use an edge
##  and point id associated with edge (if any) void BuildTable ( unsigned char * inPixels ) ; vtkUnsignedCharArray * QuantizeImage ( vtkDataArray * inScalars , int numComp , int type , int dims [ 3 ] , int ext [ 4 ] ) ; int ProcessImage ( vtkUnsignedCharArray * pixels , int dims [ 2 ] ) ; int BuildEdges ( vtkUnsignedCharArray * pixels , int dims [ 3 ] , double origin [ 3 ] , double spacing [ 3 ] , vtkUnsignedCharArray * pointDescr , vtkPolyData * edges ) ; void BuildPolygons ( vtkUnsignedCharArray * pointDescr , vtkPolyData * edges , int numPolys , vtkUnsignedCharArray * polyColors ) ; void SmoothEdges ( vtkUnsignedCharArray * pointDescr , vtkPolyData * edges ) ; void DecimateEdges ( vtkPolyData * edges , vtkUnsignedCharArray * pointDescr , double tol2 ) ; void GeneratePolygons ( vtkPolyData * edges , int numPolys , vtkPolyData * output , vtkUnsignedCharArray * polyColors , vtkUnsignedCharArray * pointDescr ) ; int GetNeighbors ( unsigned char * ptr , int & i , int & j , int dims [ 3 ] , unsigned char * neighbors [ 4 ] , int mode ) ; void GetIJ ( int id , int & i , int & j , int dims [ 2 ] ) ; unsigned char * GetColor ( unsigned char * rgb ) ; int IsSameColor ( unsigned char * p1 , unsigned char * p2 ) ; private : vtkImageToPolyDataFilter ( const vtkImageToPolyDataFilter & ) = delete ; void operator = ( const vtkImageToPolyDataFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
