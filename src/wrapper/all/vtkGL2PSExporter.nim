## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGL2PSExporter.h
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
##  @class   vtkGL2PSExporter
##  @brief   export a scene as a PostScript file using GL2PS.
##
##  vtkGL2PSExporter is a concrete subclass of vtkExporter that writes
##  high quality vector PostScript (PS/EPS), PDF or SVG files by using
##  GL2PS.  GL2PS can be obtained at: http://www.geuz.org/gl2ps/.  This
##  can be very useful when one requires publication quality pictures.
##  This class works best with simple 3D scenes and most 2D plots.
##  Please note that GL2PS has its limitations since PostScript is not
##  an ideal language to represent complex 3D scenes.  However, this
##  class does allow one to write mixed vector/raster files by using
##  the Write3DPropsAsRasterImage ivar.  Please do read the caveats
##  section of this documentation.
##
##  By default vtkGL2PSExporter generates Encapsulated PostScript (EPS)
##  output along with the text in portrait orientation with the
##  background color of the window being drawn.  The generated output
##  is also compressed using zlib. The various other options are set to
##  sensible defaults.
##
##  The output file format (FileFormat) can be either PostScript (PS),
##  Encapsulated PostScript (EPS), PDF, SVG or TeX.  The file extension
##  is generated automatically depending on the FileFormat.  The
##  default is EPS.  When TeX output is chosen, only the text strings
##  in the plot are generated and put into a picture environment.  One
##  can turn on and off the text when generating PS/EPS/PDF/SVG files
##  by using the Text boolean variable.  By default the text is drawn.
##  The background color of the renderwindow is drawn by default.  To
##  make the background white instead use the DrawBackgroundOff
##  function.  Landscape figures can be generated by using the
##  LandscapeOn function.  Portrait orientation is used by default.
##  Several of the GL2PS options can be set.  The names of the ivars
##  for these options are similar to the ones that GL2PS provides.
##  Compress, SimpleLineOffset, Silent, BestRoot, PS3Shading and
##  OcclusionCull are similar to the options provided by GL2PS.  Please
##  read the function documentation or the GL2PS documentation for more
##  details.  The ivar Write3DPropsAsRasterImage allows one to generate
##  mixed vector/raster images.  All the 3D props in the scene will be
##  written as a raster image and all 2D actors will be written as
##  vector graphic primitives.  This makes it possible to handle
##  transparency and complex 3D scenes.  This ivar is set to Off by
##  default.  Specific 3D props can be excluded from the rasterization
##  process by adding them to the RasterExclusions ivar.  Props in this
##  collection will be rendered as 2D vector primitives instead.
##
##  @warning
##  By default (with Write3DPropsAsRasterImage set to Off) exporting
##  complex 3D scenes can take a long while and result in huge output
##  files.  Generating correct vector graphics output for scenes with
##  transparency is almost impossible.  However, one can set
##  Write3DPropsAsRasterImageOn and generate mixed vector/raster files.
##  This should work fine with complex scenes along with transparent
##  actors.
##
##  @sa
##  vtkExporter
##
##  @par Thanks:
##  Thanks to Goodwin Lawlor and Prabhu Ramachandran for this class.
##

## !!!Ignored construct:  # vtkGL2PSExporter_h [NewLine] # vtkGL2PSExporter_h [NewLine] # vtkExporter.h [NewLine] # vtkIOExportGL2PSModule.h  For export macro [NewLine] # vtkNew.h  For vtkNew [NewLine] class vtkPropCollection ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOEXPORTGL2PS_EXPORT vtkGL2PSExporter : public vtkExporter { public : static vtkGL2PSExporter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkExporter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkExporter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkGL2PSExporter :: IsTypeOf ( type ) ; } static vtkGL2PSExporter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkGL2PSExporter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkGL2PSExporter * NewInstance ( ) const { return vtkGL2PSExporter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkExporter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGL2PSExporter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGL2PSExporter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Specify the prefix of the files to write out. The resulting filenames
##  will have .ps or .eps or .tex appended to them depending on the
##  other options chosen.
##  virtual void SetFilePrefix ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FilePrefix  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FilePrefix == nullptr && _arg == nullptr ) { return ; } if ( this -> FilePrefix && _arg && ( ! strcmp ( this -> FilePrefix , _arg ) ) ) { return ; } delete [ ] this -> FilePrefix ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FilePrefix = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FilePrefix = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFilePrefix ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FilePrefix  of  << ( this -> FilePrefix ? this -> FilePrefix : (null) ) ) ; return this -> FilePrefix ; } ; /@} /@{ *
##  The initial size of the GL2PS export buffer in bytes. The buffer is used to
##  store the exported image prior to writing to file. If the buffer is too
##  small, the exporter will enlarge the buffer and rerender until the export
##  is successful. Setting a larger value here can reduce the time needed to
##  export a complex scene by reducing the number of iterations required.
##  The default initial size is 4 MB.
##  virtual void SetBufferSize ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  BufferSize  to  << _arg ) ; if ( this -> BufferSize != _arg ) { this -> BufferSize = _arg ; this -> Modified ( ) ; } } ; virtual int GetBufferSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BufferSize  of  << this -> BufferSize ) ; return this -> BufferSize ; } ; /@} /@{ *
##  Set the title for the output, if supported. If nullptr, "VTK GL2PS Export" is
##  used.
##  virtual void SetTitle ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Title  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> Title == nullptr && _arg == nullptr ) { return ; } if ( this -> Title && _arg && ( ! strcmp ( this -> Title , _arg ) ) ) { return ; } delete [ ] this -> Title ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> Title = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> Title = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetTitle ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << Title  of  << ( this -> Title ? this -> Title : (null) ) ) ; return this -> Title ; } ; /@} enum OutputFormat { PS_FILE , EPS_FILE , PDF_FILE , TEX_FILE , SVG_FILE } ; /@{ *
##  Configure the exporter to expect a painter-ordered 2D rendering, that is,
##  a rendering at a fixed depth where primitives are drawn from the bottom up.
##  This disables sorting, which will break the painter ordering, and turns off
##  the simple line offset, which can cause line primitives to be drawn on top
##  of all other geometry.
##  void UsePainterSettings ( ) { this -> SetSortToOff ( ) ; this -> SetSimpleLineOffset ( 0 ) ; } /@} /@{ *
##  Specify the format of file to write out.  This can be one of:
##  PS_FILE, EPS_FILE, PDF_FILE, TEX_FILE.  Defaults to EPS_FILE.
##  Depending on the option chosen it generates the appropriate file
##  (with correct extension) when the Write function is called.
##  virtual void SetFileFormat ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileFormat  to  << _arg ) ; if ( this -> FileFormat != ( _arg < PS_FILE ? PS_FILE : ( _arg > SVG_FILE ? SVG_FILE : _arg ) ) ) { this -> FileFormat = ( _arg < PS_FILE ? PS_FILE : ( _arg > SVG_FILE ? SVG_FILE : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetFileFormatMinValue ( ) { return PS_FILE ; } virtual int GetFileFormatMaxValue ( ) { return SVG_FILE ; } ; virtual int GetBufferSizeFileFormat ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileFormat  of  << this -> FileFormat ) ; return this -> FileFormat ; } ; void SetFileFormatToPS ( ) { this -> SetFileFormat ( PS_FILE ) ; } void SetFileFormatToEPS ( ) { this -> SetFileFormat ( EPS_FILE ) ; } void SetFileFormatToPDF ( ) { this -> SetFileFormat ( PDF_FILE ) ; } void SetFileFormatToTeX ( ) { this -> SetFileFormat ( TEX_FILE ) ; } void SetFileFormatToSVG ( ) { this -> SetFileFormat ( SVG_FILE ) ; } const char * GetFileFormatAsString ( ) ; /@} enum SortScheme { NO_SORT = 0 , SIMPLE_SORT = 1 , BSP_SORT = 2 } ; /@{ *
##  Set the type of sorting algorithm to order primitives from
##  back to front.  Successive algorithms are more memory
##  intensive.  Simple is the default but BSP is perhaps the best.
##  virtual void SetFileFormatSort ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Sort  to  << _arg ) ; if ( this -> Sort != ( _arg < NO_SORT ? NO_SORT : ( _arg > BSP_SORT ? BSP_SORT : _arg ) ) ) { this -> Sort = ( _arg < NO_SORT ? NO_SORT : ( _arg > BSP_SORT ? BSP_SORT : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetFileFormatMinValueSortMinValue ( ) { return NO_SORT ; } virtual int GetFileFormatMaxValueSortMaxValue ( ) { return BSP_SORT ; } ; virtual int GetBufferSizeFileFormatSort ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Sort  of  << this -> Sort ) ; return this -> Sort ; } ; void SetSortToOff ( ) { this -> SetSort ( NO_SORT ) ; } void SetSortToSimple ( ) { this -> SetSort ( SIMPLE_SORT ) ; } void SetSortToBSP ( ) { this -> SetSort ( BSP_SORT ) ; } const char * GetSortAsString ( ) ; /@} /@{ *
##  Turn on/off compression when generating PostScript or PDF
##  output. By default compression is on.
##  virtual void SetBufferSizeCompress ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Compress  to  << _arg ) ; if ( this -> Compress != _arg ) { this -> Compress = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetBufferSizeFileFormatSortCompress ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Compress  of  << this -> Compress ) ; return this -> Compress ; } ; virtual void CompressOn ( ) { this -> SetCompress ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void CompressOff ( ) { this -> SetCompress ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off drawing the background frame.  If off the background
##  is treated as white.  By default the background is drawn.
##  On the OpenGL2 backend, the background is always drawn.
##  virtual void SetBufferSizeCompressDrawBackground ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  DrawBackground  to  << _arg ) ; if ( this -> DrawBackground != _arg ) { this -> DrawBackground = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetBufferSizeFileFormatSortCompressDrawBackground ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DrawBackground  of  << this -> DrawBackground ) ; return this -> DrawBackground ; } ; virtual void DrawBackgroundOn ( ) { this -> SetCompressDrawBackground ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void DrawBackgroundOff ( ) { this -> SetCompressDrawBackground ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off the GL2PS_SIMPLE_LINE_OFFSET option.  When enabled a
##  small offset is added in the z-buffer to all the lines in the
##  plot.  This results in an anti-aliasing like solution.  Defaults to
##  on.
##  virtual void SetBufferSizeCompressDrawBackgroundSimpleLineOffset ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SimpleLineOffset  to  << _arg ) ; if ( this -> SimpleLineOffset != _arg ) { this -> SimpleLineOffset = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetBufferSizeFileFormatSortCompressDrawBackgroundSimpleLineOffset ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SimpleLineOffset  of  << this -> SimpleLineOffset ) ; return this -> SimpleLineOffset ; } ; virtual void SimpleLineOffsetOn ( ) { this -> SetCompressDrawBackgroundSimpleLineOffset ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void SimpleLineOffsetOff ( ) { this -> SetCompressDrawBackgroundSimpleLineOffset ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off GL2PS messages sent to stderr (GL2PS_SILENT).  When
##  enabled GL2PS messages are suppressed.  Defaults to off.
##  virtual void SetBufferSizeCompressDrawBackgroundSimpleLineOffsetSilent ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Silent  to  << _arg ) ; if ( this -> Silent != _arg ) { this -> Silent = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetBufferSizeFileFormatSortCompressDrawBackgroundSimpleLineOffsetSilent ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Silent  of  << this -> Silent ) ; return this -> Silent ; } ; virtual void SilentOn ( ) { this -> SetCompressDrawBackgroundSimpleLineOffsetSilent ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void SilentOff ( ) { this -> SetCompressDrawBackgroundSimpleLineOffsetSilent ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off the GL2PS_BEST_ROOT option.  When enabled the
##  construction of the BSP tree is optimized by choosing the root
##  primitives leading to the minimum number of splits.  Defaults to
##  on.
##  virtual void SetBufferSizeCompressDrawBackgroundSimpleLineOffsetSilentBestRoot ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  BestRoot  to  << _arg ) ; if ( this -> BestRoot != _arg ) { this -> BestRoot = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetBufferSizeFileFormatSortCompressDrawBackgroundSimpleLineOffsetSilentBestRoot ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BestRoot  of  << this -> BestRoot ) ; return this -> BestRoot ; } ; virtual void BestRootOn ( ) { this -> SetCompressDrawBackgroundSimpleLineOffsetSilentBestRoot ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void BestRootOff ( ) { this -> SetCompressDrawBackgroundSimpleLineOffsetSilentBestRoot ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off drawing the text.  If on (default) the text is drawn.
##  If the FileFormat is set to TeX output then a LaTeX picture is
##  generated with the text strings.  If off text output is
##  suppressed.
##  virtual void SetBufferSizeCompressDrawBackgroundSimpleLineOffsetSilentBestRootText ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Text  to  << _arg ) ; if ( this -> Text != _arg ) { this -> Text = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetBufferSizeFileFormatSortCompressDrawBackgroundSimpleLineOffsetSilentBestRootText ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Text  of  << this -> Text ) ; return this -> Text ; } ; virtual void TextOn ( ) { this -> SetCompressDrawBackgroundSimpleLineOffsetSilentBestRootText ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void TextOff ( ) { this -> SetCompressDrawBackgroundSimpleLineOffsetSilentBestRootText ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off landscape orientation.  If off (default) the
##  orientation is set to portrait.
##  virtual void SetBufferSizeCompressDrawBackgroundSimpleLineOffsetSilentBestRootTextLandscape ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Landscape  to  << _arg ) ; if ( this -> Landscape != _arg ) { this -> Landscape = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetBufferSizeFileFormatSortCompressDrawBackgroundSimpleLineOffsetSilentBestRootTextLandscape ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Landscape  of  << this -> Landscape ) ; return this -> Landscape ; } ; virtual void LandscapeOn ( ) { this -> SetCompressDrawBackgroundSimpleLineOffsetSilentBestRootTextLandscape ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void LandscapeOff ( ) { this -> SetCompressDrawBackgroundSimpleLineOffsetSilentBestRootTextLandscape ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off the GL2PS_PS3_SHADING option.  When enabled the
##  shfill PostScript level 3 operator is used.  Read the GL2PS
##  documentation for more details.  Defaults to on.
##  virtual void SetBufferSizeCompressDrawBackgroundSimpleLineOffsetSilentBestRootTextLandscapePS3Shading ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PS3Shading  to  << _arg ) ; if ( this -> PS3Shading != _arg ) { this -> PS3Shading = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetBufferSizeFileFormatSortCompressDrawBackgroundSimpleLineOffsetSilentBestRootTextLandscapePS3Shading ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PS3Shading  of  << this -> PS3Shading ) ; return this -> PS3Shading ; } ; virtual void PS3ShadingOn ( ) { this -> SetCompressDrawBackgroundSimpleLineOffsetSilentBestRootTextLandscapePS3Shading ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void PS3ShadingOff ( ) { this -> SetCompressDrawBackgroundSimpleLineOffsetSilentBestRootTextLandscapePS3Shading ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off culling of occluded polygons (GL2PS_OCCLUSION_CULL).
##  When enabled hidden polygons are removed.  This reduces file size
##  considerably.  Defaults to on.
##  virtual void SetBufferSizeCompressDrawBackgroundSimpleLineOffsetSilentBestRootTextLandscapePS3ShadingOcclusionCull ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OcclusionCull  to  << _arg ) ; if ( this -> OcclusionCull != _arg ) { this -> OcclusionCull = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetBufferSizeFileFormatSortCompressDrawBackgroundSimpleLineOffsetSilentBestRootTextLandscapePS3ShadingOcclusionCull ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OcclusionCull  of  << this -> OcclusionCull ) ; return this -> OcclusionCull ; } ; virtual void OcclusionCullOn ( ) { this -> SetCompressDrawBackgroundSimpleLineOffsetSilentBestRootTextLandscapePS3ShadingOcclusionCull ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void OcclusionCullOff ( ) { this -> SetCompressDrawBackgroundSimpleLineOffsetSilentBestRootTextLandscapePS3ShadingOcclusionCull ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off writing 3D props as raster images.  2D props are
##  rendered using vector graphics primitives.  If you have hi-res
##  actors and are using transparency you probably need to turn this
##  on.  Defaults to Off.
##  This option has no effect when the OpenGL2 backend is in use, as all
##  3D props (excluding vtkTextActor3D) are rasterized into the background.
##  virtual void SetBufferSizeCompressDrawBackgroundSimpleLineOffsetSilentBestRootTextLandscapePS3ShadingOcclusionCullWrite3DPropsAsRasterImage ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Write3DPropsAsRasterImage  to  << _arg ) ; if ( this -> Write3DPropsAsRasterImage != _arg ) { this -> Write3DPropsAsRasterImage = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetBufferSizeFileFormatSortCompressDrawBackgroundSimpleLineOffsetSilentBestRootTextLandscapePS3ShadingOcclusionCullWrite3DPropsAsRasterImage ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Write3DPropsAsRasterImage  of  << this -> Write3DPropsAsRasterImage ) ; return this -> Write3DPropsAsRasterImage ; } ; virtual void Write3DPropsAsRasterImageOn ( ) { this -> SetCompressDrawBackgroundSimpleLineOffsetSilentBestRootTextLandscapePS3ShadingOcclusionCullWrite3DPropsAsRasterImage ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void Write3DPropsAsRasterImageOff ( ) { this -> SetCompressDrawBackgroundSimpleLineOffsetSilentBestRootTextLandscapePS3ShadingOcclusionCullWrite3DPropsAsRasterImage ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off exporting text as path information, rather than character data.
##  This is useful for the PDF backend, which does not properly
##  support aligned text otherwise. Defaults to Off.
##  virtual void SetBufferSizeCompressDrawBackgroundSimpleLineOffsetSilentBestRootTextLandscapePS3ShadingOcclusionCullWrite3DPropsAsRasterImageTextAsPath ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  TextAsPath  to  << _arg ) ; if ( this -> TextAsPath != _arg ) { this -> TextAsPath = _arg ; this -> Modified ( ) ; } } ; virtual bool GetBufferSizeFileFormatSortCompressDrawBackgroundSimpleLineOffsetSilentBestRootTextLandscapePS3ShadingOcclusionCullWrite3DPropsAsRasterImageTextAsPath ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TextAsPath  of  << this -> TextAsPath ) ; return this -> TextAsPath ; } ; virtual void TextAsPathOn ( ) { this -> SetCompressDrawBackgroundSimpleLineOffsetSilentBestRootTextLandscapePS3ShadingOcclusionCullWrite3DPropsAsRasterImageTextAsPath ( static_cast < bool > ( 1 ) ) ; } virtual void TextAsPathOff ( ) { this -> SetCompressDrawBackgroundSimpleLineOffsetSilentBestRootTextLandscapePS3ShadingOcclusionCullWrite3DPropsAsRasterImageTextAsPath ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Collection of props to exclude from rasterization. These will be
##  rendered as 2D vector primitives in the output. This setting is ignored if
##  Write3DPropsAsRasterImage is false. Behind the scenes, these props are
##  treated as 2D props during the vector output generation.
##  void SetRasterExclusions ( vtkPropCollection * ) ; virtual vtkPropCollection * GetnameRasterExclusions ( ) { vtkDebugWithObjectMacro ( this , <<  returning  RasterExclusions  address  << static_cast < vtkPropCollection * > ( this -> RasterExclusions ) ) ; return this -> RasterExclusions ; } ; /@} /@{ *
##  Set the ratio between the OpenGL PointSize and that used by GL2PS
##  to generate PostScript.  Defaults to a ratio of 5/7.
##  virtual void SetBufferSizeCompressDrawBackgroundSimpleLineOffsetSilentBestRootTextLandscapePS3ShadingOcclusionCullWrite3DPropsAsRasterImageTextAsPathPointSizeFactor ( float _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PointSizeFactor  to  << _arg ) ; if ( this -> PointSizeFactor != _arg ) { this -> PointSizeFactor = _arg ; this -> Modified ( ) ; } } ; virtual float GetBufferSizeFileFormatSortCompressDrawBackgroundSimpleLineOffsetSilentBestRootTextLandscapePS3ShadingOcclusionCullWrite3DPropsAsRasterImageTextAsPathPointSizeFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PointSizeFactor  of  << this -> PointSizeFactor ) ; return this -> PointSizeFactor ; } ; /@} /@{ *
##  Set the ratio between the OpenGL LineWidth and that used by GL2PS
##  to generate PostScript.  Defaults to a ratio of 5/7.
##  virtual void SetBufferSizeCompressDrawBackgroundSimpleLineOffsetSilentBestRootTextLandscapePS3ShadingOcclusionCullWrite3DPropsAsRasterImageTextAsPathPointSizeFactorLineWidthFactor ( float _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  LineWidthFactor  to  << _arg ) ; if ( this -> LineWidthFactor != _arg ) { this -> LineWidthFactor = _arg ; this -> Modified ( ) ; } } ; virtual float GetBufferSizeFileFormatSortCompressDrawBackgroundSimpleLineOffsetSilentBestRootTextLandscapePS3ShadingOcclusionCullWrite3DPropsAsRasterImageTextAsPathPointSizeFactorLineWidthFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LineWidthFactor  of  << this -> LineWidthFactor ) ; return this -> LineWidthFactor ; } ; /@} protected : vtkGL2PSExporter ( ) ; ~ vtkGL2PSExporter ( ) override ; int GetGL2PSOptions ( ) ; int GetGL2PSSort ( ) ; int GetGL2PSFormat ( ) ; const char * GetFileExtension ( ) ; vtkPropCollection * RasterExclusions ; char * FilePrefix ; char * Title ; int FileFormat ; int BufferSize ; int Sort ; vtkTypeBool Compress ; vtkTypeBool DrawBackground ; vtkTypeBool SimpleLineOffset ; vtkTypeBool Silent ; vtkTypeBool BestRoot ; vtkTypeBool Text ; vtkTypeBool Landscape ; vtkTypeBool PS3Shading ; vtkTypeBool OcclusionCull ; vtkTypeBool Write3DPropsAsRasterImage ; bool TextAsPath ; float PointSizeFactor ; float LineWidthFactor ; private : vtkGL2PSExporter ( const vtkGL2PSExporter & ) = delete ; void operator = ( const vtkGL2PSExporter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

proc GetSortAsString*(): cstring {.importcpp: "VTKIOEXPORTGL2PS_EXPORT::GetSortAsString(@)",
                                header: "vtkGL2PSExporter.h".}
proc GetFileFormatAsString*(): cstring {.importcpp: "VTKIOEXPORTGL2PS_EXPORT::GetFileFormatAsString(@)",
                                      header: "vtkGL2PSExporter.h".}