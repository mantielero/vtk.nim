## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMCubesReader.h
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
##  @class   vtkMCubesReader
##  @brief   read binary marching cubes file
##
##  vtkMCubesReader is a source object that reads binary marching cubes
##  files. (Marching cubes is an isosurfacing technique that generates
##  many triangles.) The binary format is supported by W. Lorensen's
##  marching cubes program (and the vtkSliceCubes object). The format
##  repeats point coordinates, so this object will merge the points
##  with a vtkLocator object. You can choose to supply the vtkLocator
##  or use the default.
##
##  @warning
##  Binary files assumed written in sun/hp/sgi (i.e., Big Endian) form.
##
##  @warning
##  Because points are merged when read, degenerate triangles may be removed.
##  Thus the number of triangles read may be fewer than the number of triangles
##  actually created.
##
##  @warning
##  The point merging does not take into account that the same point may have
##  different normals. For example, running vtkPolyDataNormals after
##  vtkContourFilter may split triangles because of the FeatureAngle
##  ivar. Subsequent reading with vtkMCubesReader will merge the points and
##  use the first point's normal. For the most part, this is undesirable.
##
##  @warning
##  Normals are generated from the gradient of the data scalar values. Hence
##  the normals may on occasion point in a direction inconsistent with the
##  ordering of the triangle vertices. If this happens, the resulting surface
##  may be "black".  Reverse the sense of the FlipNormals boolean flag to
##  correct this.
##
##  @sa
##  vtkContourFilter vtkMarchingCubes vtkSliceCubes vtkLocator
##

## !!!Ignored construct:  # vtkMCubesReader_h [NewLine] # vtkMCubesReader_h [NewLine] # vtkIOGeometryModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] # VTK_FILE_BYTE_ORDER_BIG_ENDIAN 0 [NewLine] # VTK_FILE_BYTE_ORDER_LITTLE_ENDIAN 1 [NewLine] class vtkIncrementalPointLocator ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOGEOMETRY_EXPORT vtkMCubesReader : public vtkPolyDataAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkMCubesReader :: IsTypeOf ( type ) ; } static vtkMCubesReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkMCubesReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkMCubesReader * NewInstance ( ) const { return vtkMCubesReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMCubesReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMCubesReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct object with FlipNormals turned off and Normals set to true.
##  static vtkMCubesReader * New ( ) ; /@{ *
##  Specify file name of marching cubes file.
##  virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ; /@} /@{ *
##  Set / get the file name of the marching cubes limits file.
##  virtual void SetFileNameLimitsFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << LimitsFileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> LimitsFileName == nullptr && _arg == nullptr ) { return ; } if ( this -> LimitsFileName && _arg && ( ! strcmp ( this -> LimitsFileName , _arg ) ) ) { return ; } delete [ ] this -> LimitsFileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> LimitsFileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> LimitsFileName = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFileNameLimitsFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LimitsFileName  of  << ( this -> LimitsFileName ? this -> LimitsFileName : (null) ) ) ; return this -> LimitsFileName ; } ; /@} /@{ *
##  Specify a header size if one exists. The header is skipped and not used at this time.
##  virtual void SetHeaderSize ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << HeaderSize  to  << _arg ) ; if ( this -> HeaderSize != ( _arg < 0 ? 0 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> HeaderSize = ( _arg < 0 ? 0 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetHeaderSizeMinValue ( ) { return 0 ; } virtual int GetHeaderSizeMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetHeaderSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HeaderSize  of  << this -> HeaderSize ) ; return this -> HeaderSize ; } ; /@} /@{ *
##  Specify whether to flip normals in opposite direction. Flipping ONLY
##  changes the direction of the normal vector. Contrast this with flipping
##  in vtkPolyDataNormals which flips both the normal and the cell point
##  order.
##  virtual void SetFlipNormals ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  FlipNormals  to  << _arg ) ; if ( this -> FlipNormals != _arg ) { this -> FlipNormals = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetHeaderSizeFlipNormals ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FlipNormals  of  << this -> FlipNormals ) ; return this -> FlipNormals ; } ; virtual void FlipNormalsOn ( ) { this -> SetFlipNormals ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void FlipNormalsOff ( ) { this -> SetFlipNormals ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify whether to read normals.
##  virtual void SetFlipNormalsNormals ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Normals  to  << _arg ) ; if ( this -> Normals != _arg ) { this -> Normals = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetHeaderSizeFlipNormalsNormals ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Normals  of  << this -> Normals ) ; return this -> Normals ; } ; virtual void NormalsOn ( ) { this -> SetFlipNormalsNormals ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void NormalsOff ( ) { this -> SetFlipNormalsNormals ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  These methods should be used instead of the SwapBytes methods.
##  They indicate the byte ordering of the file you are trying
##  to read in. These methods will then either swap or not swap
##  the bytes depending on the byte ordering of the machine it is
##  being run on. For example, reading in a BigEndian file on a
##  BigEndian machine will result in no swapping. Trying to read
##  the same file on a LittleEndian machine will result in swapping.
##  As a quick note most UNIX machines are BigEndian while PC's
##  and VAX tend to be LittleEndian. So if the file you are reading
##  in was generated on a VAX or PC, SetDataByteOrderToLittleEndian otherwise
##  SetDataByteOrderToBigEndian.
##  void SetDataByteOrderToBigEndian ( ) ; void SetDataByteOrderToLittleEndian ( ) ; int GetDataByteOrder ( ) ; void SetDataByteOrder ( int ) ; const char * GetDataByteOrderAsString ( ) ; /@} /@{ *
##  Turn on/off byte swapping.
##  virtual void SetFlipNormalsNormalsSwapBytes ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SwapBytes  to  << _arg ) ; if ( this -> SwapBytes != _arg ) { this -> SwapBytes = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetHeaderSizeFlipNormalsNormalsSwapBytes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SwapBytes  of  << this -> SwapBytes ) ; return this -> SwapBytes ; } ; virtual void SwapBytesOn ( ) { this -> SetFlipNormalsNormalsSwapBytes ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void SwapBytesOff ( ) { this -> SetFlipNormalsNormalsSwapBytes ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set / get a spatial locator for merging points. By default,
##  an instance of vtkMergePoints is used.
##  void SetLocator ( vtkIncrementalPointLocator * locator ) ; virtual vtkIncrementalPointLocator * GetnameLocator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Locator  address  << static_cast < vtkIncrementalPointLocator * > ( this -> Locator ) ) ; return this -> Locator ; } ; /@} *
##  Create default locator. Used to create one when none is specified.
##  void CreateDefaultLocator ( ) ; *
##  Return the mtime also considering the locator.
##  vtkMTimeType GetMTime ( ) override ; protected : vtkMCubesReader ( ) ; ~ vtkMCubesReader ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; char * FileName ; char * LimitsFileName ; vtkIncrementalPointLocator * Locator ; vtkTypeBool SwapBytes ; int HeaderSize ; vtkTypeBool FlipNormals ; vtkTypeBool Normals ; private : vtkMCubesReader ( const vtkMCubesReader & ) = delete ; void operator = ( const vtkMCubesReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
