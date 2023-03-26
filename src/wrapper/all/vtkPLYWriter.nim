## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPLYWriter.h
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
##  @class   vtkPLYWriter
##  @brief   write Stanford PLY file format
##
##  vtkPLYWriter writes polygonal data in Stanford University PLY format
##  (see http://graphics.stanford.edu/data/3Dscanrep/). The data can be
##  written in either binary (little or big endian) or ASCII representation.
##  As for PointData and CellData, vtkPLYWriter cannot handle normals or
##  vectors. It only handles RGB PointData and CellData. You need to set the
##  name of the array (using SetName for the array and SetArrayName for the
##  writer). If the array is not a vtkUnsignedCharArray with 3 or 4 components,
##  you need to specify a vtkLookupTable to map the scalars to RGB.
##
##  To enable saving out alpha (opacity) values, you must enable alpha using
##  `vtkPLYWriter::SetEnableAlpha()`.
##
##  @warning
##  PLY does not handle big endian versus little endian correctly.
##
##  @sa
##  vtkPLYReader
##

## !!!Ignored construct:  # vtkPLYWriter_h [NewLine] # vtkPLYWriter_h [NewLine] # vtkIOPLYModule.h  For export macro # vtkSmartPointer.h  For protected ivars # vtkWriter.h [NewLine] # < string >  For string parameter [NewLine] class vtkDataSetAttributes ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPolyData"
discard "forward decl of vtkScalarsToColors"
discard "forward decl of vtkStringArray"
discard "forward decl of vtkUnsignedCharArray"
const
  VTK_LITTLE_ENDIAN* = 0
  VTK_BIG_ENDIAN* = 1
  VTK_COLOR_MODE_DEFAULT* = 0
  VTK_COLOR_MODE_UNIFORM_CELL_COLOR* = 1
  VTK_COLOR_MODE_UNIFORM_POINT_COLOR* = 2
  VTK_COLOR_MODE_UNIFORM_COLOR* = 3
  VTK_COLOR_MODE_OFF* = 4
  VTK_TEXTURECOORDS_UV* = 0
  VTK_TEXTURECOORDS_TEXTUREUV* = 1

## !!!Ignored construct:  class VTKIOPLY_EXPORT vtkPLYWriter : public vtkWriter { public : static vtkPLYWriter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkWriter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkWriter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPLYWriter :: IsTypeOf ( type ) ; } static vtkPLYWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPLYWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPLYWriter * NewInstance ( ) const { return vtkPLYWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPLYWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPLYWriter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  If the file type is binary, then the user can specify which
##  byte order to use (little versus big endian).
##  virtual void SetDataByteOrder ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << DataByteOrder  to  << _arg ) ; if ( this -> DataByteOrder != ( _arg < VTK_LITTLE_ENDIAN ? VTK_LITTLE_ENDIAN : ( _arg > VTK_BIG_ENDIAN ? VTK_BIG_ENDIAN : _arg ) ) ) { this -> DataByteOrder = ( _arg < VTK_LITTLE_ENDIAN ? VTK_LITTLE_ENDIAN : ( _arg > VTK_BIG_ENDIAN ? VTK_BIG_ENDIAN : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetDataByteOrderMinValue ( ) { return VTK_LITTLE_ENDIAN ; } virtual int GetDataByteOrderMaxValue ( ) { return VTK_BIG_ENDIAN ; } ; virtual int GetDataByteOrder ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DataByteOrder  of  << this -> DataByteOrder ) ; return this -> DataByteOrder ; } ; void SetDataByteOrderToBigEndian ( ) { this -> SetDataByteOrder ( VTK_BIG_ENDIAN ) ; } void SetDataByteOrderToLittleEndian ( ) { this -> SetDataByteOrder ( VTK_LITTLE_ENDIAN ) ; } /@} /@{ *
##  Enable writing to an OutputString instead of the default, a file.
##  Note that writing to an output stream would be more flexible (enabling
##  other kind of streams) and possibly more efficient because we don't need
##  to write the whole stream to a string. However a stream interface
##  does not translate well to python and the string interface satisfies
##  our current needs. So we leave the stream interface for future work.
##  virtual void SetWriteToOutputString ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  WriteToOutputString  to  << _arg ) ; if ( this -> WriteToOutputString != _arg ) { this -> WriteToOutputString = _arg ; this -> Modified ( ) ; } } ; virtual bool GetDataByteOrderWriteToOutputString ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WriteToOutputString  of  << this -> WriteToOutputString ) ; return this -> WriteToOutputString ; } ; virtual void WriteToOutputStringOn ( ) { this -> SetWriteToOutputString ( static_cast < bool > ( 1 ) ) ; } virtual void WriteToOutputStringOff ( ) { this -> SetWriteToOutputString ( static_cast < bool > ( 0 ) ) ; } ; const std :: string & GetOutputString ( ) const { return this -> OutputString ; } /@} /@{ *
##  These methods enable the user to control how to add color into the PLY
##  output file. The default behavior is as follows. The user provides the
##  name of an array and a component number. If the type of the array is
##  three components, unsigned char, then the data is written as three
##  separate "red", "green" and "blue" properties. If the type of the array is
##  four components, unsigned char, then the data is written as three separate
##  "red", "green" and "blue" properties, dropping the "alpha". If the type is not
##  unsigned char, and a lookup table is provided, then the array/component
##  are mapped through the table to generate three separate "red", "green"
##  and "blue" properties in the PLY file. The user can also set the
##  ColorMode to specify a uniform color for the whole part (on a vertex
##  colors, face colors, or both. (Note: vertex colors or cell colors may be
##  written, depending on where the named array is found. If points and
##  cells have the arrays with the same name, then both colors will be
##  written.)
##  virtual void SetWriteToOutputStringColorMode ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ColorMode  to  << _arg ) ; if ( this -> ColorMode != _arg ) { this -> ColorMode = _arg ; this -> Modified ( ) ; } } ; virtual int GetDataByteOrderWriteToOutputStringColorMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ColorMode  of  << this -> ColorMode ) ; return this -> ColorMode ; } ; void SetColorModeToDefault ( ) { this -> SetColorMode ( VTK_COLOR_MODE_DEFAULT ) ; } void SetColorModeToUniformCellColor ( ) { this -> SetColorMode ( VTK_COLOR_MODE_UNIFORM_CELL_COLOR ) ; } void SetColorModeToUniformPointColor ( ) { this -> SetColorMode ( VTK_COLOR_MODE_UNIFORM_POINT_COLOR ) ; } void SetColorModeToUniformColor ( )  both cells and points are colored { this -> SetColorMode ( VTK_COLOR_MODE_UNIFORM_COLOR ) ; } void SetColorModeToOff ( )  No color information is written { this -> SetColorMode ( VTK_COLOR_MODE_OFF ) ; } /@} /@{ *
##  Enable alpha output. Default is off, i.e. only color values will be saved
##  based on ColorMode.
##  virtual void SetWriteToOutputStringColorModeEnableAlpha ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  EnableAlpha  to  << _arg ) ; if ( this -> EnableAlpha != _arg ) { this -> EnableAlpha = _arg ; this -> Modified ( ) ; } } ; virtual bool GetDataByteOrderWriteToOutputStringColorModeEnableAlpha ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EnableAlpha  of  << this -> EnableAlpha ) ; return this -> EnableAlpha ; } ; virtual void EnableAlphaOn ( ) { this -> SetWriteToOutputStringEnableAlpha ( static_cast < bool > ( 1 ) ) ; } virtual void EnableAlphaOff ( ) { this -> SetWriteToOutputStringEnableAlpha ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify the array name to use to color the data.
##  virtual void SetArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> ArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> ArrayName && _arg && ( ! strcmp ( this -> ArrayName , _arg ) ) ) { return ; } delete [ ] this -> ArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> ArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> ArrayName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << ArrayName  of  << ( this -> ArrayName ? this -> ArrayName : (null) ) ) ; return this -> ArrayName ; } ; /@} /@{ *
##  Specify the array component to use to color the data.
##  virtual void SetDataByteOrderComponent ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Component  to  << _arg ) ; if ( this -> Component != ( _arg < 0 ? 0 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> Component = ( _arg < 0 ? 0 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetDataByteOrderMinValueComponentMinValue ( ) { return 0 ; } virtual int GetDataByteOrderMaxValueComponentMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetDataByteOrderWriteToOutputStringColorModeEnableAlphaComponent ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Component  of  << this -> Component ) ; return this -> Component ; } ; /@} /@{ *
##  A lookup table can be specified in order to convert data arrays to
##  RGBA colors.
##  virtual void SetLookupTable ( vtkScalarsToColors * ) ; virtual vtkScalarsToColors * GetnameLookupTable ( ) { vtkDebugWithObjectMacro ( this , <<  returning  LookupTable  address  << static_cast < vtkScalarsToColors * > ( this -> LookupTable ) ) ; return this -> LookupTable ; } ; /@} /@{ *
##  Set the color to use when using a uniform color (either point or cells,
##  or both). The color is specified as a triplet of three unsigned chars
##  between (0,255). This only takes effect when the ColorMode is set to
##  uniform point, uniform cell, or uniform color.
##  virtual void SetColor ( unsigned char _arg1 , unsigned char _arg2 , unsigned char _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Color  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Color [ 0 ] != _arg1 ) || ( this -> Color [ 1 ] != _arg2 ) || ( this -> Color [ 2 ] != _arg3 ) ) { this -> Color [ 0 ] = _arg1 ; this -> Color [ 1 ] = _arg2 ; this -> Color [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetColor ( const unsigned char _arg [ 3 ] ) { this -> SetColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual unsigned char * GetColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Color  pointer  << this -> Color ) ; return this -> Color ; } VTK_WRAPEXCLUDE virtual void GetColor ( unsigned char & _arg1 , unsigned char & _arg2 , unsigned char & _arg3 ) { _arg1 = this -> Color [ 0 ] ; _arg2 = this -> Color [ 1 ] ; _arg3 = this -> Color [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Color  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetColor ( unsigned char _arg [ 3 ] ) { this -> GetColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ * Set the alpha to use when using a uniform color (effect point or cells, or
##   both) and EnableAlpha is ON.
##  virtual void SetWriteToOutputStringColorModeEnableAlphaAlpha ( unsigned char _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Alpha  to  << _arg ) ; if ( this -> Alpha != _arg ) { this -> Alpha = _arg ; this -> Modified ( ) ; } } ; virtual unsigned char GetDataByteOrderWriteToOutputStringColorModeEnableAlphaComponentAlpha ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Alpha  of  << this -> Alpha ) ; return this -> Alpha ; } ; /@} /@{ *
##  Get the input to this writer.
##  vtkPolyData * GetInput ( ) ; vtkPolyData * GetInput ( int port ) ; /@} /@{ *
##  Specify file name of vtk polygon data file to write.
##  virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ; /@} /@{ *
##  Specify file type (ASCII or BINARY) for vtk data file.
##  virtual void SetDataByteOrderComponentFileType ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileType  to  << _arg ) ; if ( this -> FileType != ( _arg < VTK_ASCII ? VTK_ASCII : ( _arg > VTK_BINARY ? VTK_BINARY : _arg ) ) ) { this -> FileType = ( _arg < VTK_ASCII ? VTK_ASCII : ( _arg > VTK_BINARY ? VTK_BINARY : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetDataByteOrderMinValueComponentMinValueFileTypeMinValue ( ) { return VTK_ASCII ; } virtual int GetDataByteOrderMaxValueComponentMaxValueFileTypeMaxValue ( ) { return VTK_BINARY ; } ; virtual int GetDataByteOrderWriteToOutputStringColorModeEnableAlphaComponentAlphaFileType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileType  of  << this -> FileType ) ; return this -> FileType ; } ; void SetFileTypeToASCII ( ) { this -> SetFileType ( VTK_ASCII ) ; } void SetFileTypeToBinary ( ) { this -> SetFileType ( VTK_BINARY ) ; } /@} /@{ *
##  Choose the name used for the texture coordinates.
##  (u, v) or (texture_u, texture_v)
##  virtual void SetDataByteOrderComponentFileTypeTextureCoordinatesName ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << TextureCoordinatesName  to  << _arg ) ; if ( this -> TextureCoordinatesName != ( _arg < VTK_TEXTURECOORDS_UV ? VTK_TEXTURECOORDS_UV : ( _arg > VTK_TEXTURECOORDS_TEXTUREUV ? VTK_TEXTURECOORDS_TEXTUREUV : _arg ) ) ) { this -> TextureCoordinatesName = ( _arg < VTK_TEXTURECOORDS_UV ? VTK_TEXTURECOORDS_UV : ( _arg > VTK_TEXTURECOORDS_TEXTUREUV ? VTK_TEXTURECOORDS_TEXTUREUV : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetDataByteOrderMinValueComponentMinValueFileTypeMinValueTextureCoordinatesNameMinValue ( ) { return VTK_TEXTURECOORDS_UV ; } virtual int GetDataByteOrderMaxValueComponentMaxValueFileTypeMaxValueTextureCoordinatesNameMaxValue ( ) { return VTK_TEXTURECOORDS_TEXTUREUV ; } ; virtual int GetDataByteOrderWriteToOutputStringColorModeEnableAlphaComponentAlphaFileTypeTextureCoordinatesName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TextureCoordinatesName  of  << this -> TextureCoordinatesName ) ; return this -> TextureCoordinatesName ; } ; void SetTextureCoordinatesNameToUV ( ) { this -> SetTextureCoordinatesName ( VTK_TEXTURECOORDS_UV ) ; } void SetTextureCoordinatesNameToTextureUV ( ) { this -> SetTextureCoordinatesName ( VTK_TEXTURECOORDS_TEXTUREUV ) ; } /@} *
##  Add a comment in the header part.
##  void AddComment ( const std :: string & comment ) ; protected : vtkPLYWriter ( ) ; ~ vtkPLYWriter ( ) override ; void WriteData ( ) override ; vtkSmartPointer < vtkUnsignedCharArray > GetColors ( vtkIdType num , vtkDataSetAttributes * dsa ) ; const float * GetTextureCoordinates ( vtkIdType num , vtkDataSetAttributes * dsa ) ; const float * GetNormals ( vtkIdType num , vtkDataSetAttributes * dsa ) ; int DataByteOrder ; char * ArrayName ; int Component ; int ColorMode ; vtkScalarsToColors * LookupTable ; unsigned char Color [ 3 ] ; bool EnableAlpha ; unsigned char Alpha ; char * FileName ; int FileType ; int TextureCoordinatesName ; vtkSmartPointer < vtkStringArray > HeaderComments ;  Whether this object is writing to a string or a file.
##  Default is 0: write to file. bool WriteToOutputString ;  The output string. std :: string OutputString ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; private : vtkPLYWriter ( const vtkPLYWriter & ) = delete ; void operator = ( const vtkPLYWriter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
