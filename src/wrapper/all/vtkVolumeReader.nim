## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkVolumeReader.h
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
##  @class   vtkVolumeReader
##  @brief   read image files
##
##  vtkVolumeReader is a source object that reads image files.
##
##  VolumeReader creates structured point datasets. The dimension of the
##  dataset depends upon the number of files read. Reading a single file
##  results in a 2D image, while reading more than one file results in a
##  3D volume.
##
##  File names are created using FilePattern and FilePrefix as follows:
##  snprintf (filename, sizeof(filename), FilePattern, FilePrefix, number);
##  where number is in the range ImageRange[0] to ImageRange[1]. If
##  ImageRange[1] <= ImageRange[0], then slice number ImageRange[0] is
##  read. Thus to read an image set ImageRange[0] = ImageRange[1] = slice
##  number. The default behavior is to read a single file (i.e., image slice 1).
##
##  The DataMask instance variable is used to read data files with embedded
##  connectivity or segmentation information. For example, some data has
##  the high order bit set to indicate connected surface. The DataMask allows
##  you to select this data. Other important ivars include HeaderSize, which
##  allows you to skip over initial info, and SwapBytes, which turns on/off
##  byte swapping. Consider using vtkImageReader as a replacement.
##
##  @sa
##  vtkSliceCubes vtkMarchingCubes vtkPNMReader vtkVolume16Reader
##  vtkImageReader
##

## !!!Ignored construct:  # vtkVolumeReader_h [NewLine] # vtkVolumeReader_h [NewLine] # vtkIOImageModule.h  For export macro # vtkImageAlgorithm.h [NewLine] class VTKIOIMAGE_EXPORT vtkVolumeReader : public vtkImageAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkVolumeReader :: IsTypeOf ( type ) ; } static vtkVolumeReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkVolumeReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkVolumeReader * NewInstance ( ) const { return vtkVolumeReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkVolumeReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkVolumeReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Specify file prefix for the image file(s).
##  virtual void SetFilePrefix ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FilePrefix  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FilePrefix == nullptr && _arg == nullptr ) { return ; } if ( this -> FilePrefix && _arg && ( ! strcmp ( this -> FilePrefix , _arg ) ) ) { return ; } delete [ ] this -> FilePrefix ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FilePrefix = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FilePrefix = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFilePrefix ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FilePrefix  of  << ( this -> FilePrefix ? this -> FilePrefix : (null) ) ) ; return this -> FilePrefix ; } ; /@} /@{ *
##  The snprintf format used to build filename from FilePrefix and number.
##  virtual void SetFilePrefixFilePattern ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FilePattern  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FilePattern == nullptr && _arg == nullptr ) { return ; } if ( this -> FilePattern && _arg && ( ! strcmp ( this -> FilePattern , _arg ) ) ) { return ; } delete [ ] this -> FilePattern ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FilePattern = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FilePattern = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFilePrefixFilePattern ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FilePattern  of  << ( this -> FilePattern ? this -> FilePattern : (null) ) ) ; return this -> FilePattern ; } ; /@} /@{ *
##  Set the range of files to read.
##  virtual void SetImageRange ( int _arg1 , int _arg2 ) { vtkDebugWithObjectMacro ( this , <<  setting  << ImageRange  to ( << _arg1 << , << _arg2 << ) ) ; if ( ( this -> ImageRange [ 0 ] != _arg1 ) || ( this -> ImageRange [ 1 ] != _arg2 ) ) { this -> ImageRange [ 0 ] = _arg1 ; this -> ImageRange [ 1 ] = _arg2 ; this -> Modified ( ) ; } } void SetImageRange ( const int _arg [ 2 ] ) { this -> SetImageRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; virtual int * GetImageRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ImageRange  pointer  << this -> ImageRange ) ; return this -> ImageRange ; } VTK_WRAPEXCLUDE virtual void GetImageRange ( int data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> ImageRange [ i ] ; } } ; /@} /@{ *
##  Specify the spacing for the data.
##  virtual void SetDataSpacing ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << DataSpacing  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> DataSpacing [ 0 ] != _arg1 ) || ( this -> DataSpacing [ 1 ] != _arg2 ) || ( this -> DataSpacing [ 2 ] != _arg3 ) ) { this -> DataSpacing [ 0 ] = _arg1 ; this -> DataSpacing [ 1 ] = _arg2 ; this -> DataSpacing [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetDataSpacing ( const double _arg [ 3 ] ) { this -> SetDataSpacing ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetImageRangeDataSpacing ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << DataSpacing  pointer  << this -> DataSpacing ) ; return this -> DataSpacing ; } VTK_WRAPEXCLUDE virtual void GetImageRangeDataSpacing ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> DataSpacing [ i ] ; } } ; /@} /@{ *
##  Specify the origin for the data.
##  virtual void SetDataSpacingDataOrigin ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << DataOrigin  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> DataOrigin [ 0 ] != _arg1 ) || ( this -> DataOrigin [ 1 ] != _arg2 ) || ( this -> DataOrigin [ 2 ] != _arg3 ) ) { this -> DataOrigin [ 0 ] = _arg1 ; this -> DataOrigin [ 1 ] = _arg2 ; this -> DataOrigin [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetDataSpacingDataOrigin ( const double _arg [ 3 ] ) { this -> SetDataSpacingDataOrigin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetImageRangeDataSpacingDataOrigin ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << DataOrigin  pointer  << this -> DataOrigin ) ; return this -> DataOrigin ; } VTK_WRAPEXCLUDE virtual void GetImageRangeDataSpacingDataOrigin ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> DataOrigin [ i ] ; } } ; /@} *
##  Other objects make use of this method.
##  virtual vtkImageData * GetImage ( int ImageNumber ) = 0 ; protected : vtkVolumeReader ( ) ; ~ vtkVolumeReader ( ) override ; char * FilePrefix ; char * FilePattern ; int ImageRange [ 2 ] ; double DataSpacing [ 3 ] ; double DataOrigin [ 3 ] ; private : vtkVolumeReader ( const vtkVolumeReader & ) = delete ; void operator = ( const vtkVolumeReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
