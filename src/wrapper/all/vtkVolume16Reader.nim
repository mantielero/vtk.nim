## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkVolume16Reader.h
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
##  @class   vtkVolume16Reader
##  @brief   read 16 bit image files
##
##  vtkVolume16Reader is a source object that reads 16 bit image files.
##
##  Volume16Reader creates structured point datasets. The dimension of the
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
##  byte swapping.
##
##  The Transform instance variable specifies a permutation transformation
##  to map slice space into world space. vtkImageReader has replaced the
##  functionality of this class and should be used instead.
##
##  @sa
##  vtkSliceCubes vtkMarchingCubes vtkImageReader
##

## !!!Ignored construct:  # vtkVolume16Reader_h [NewLine] # vtkVolume16Reader_h [NewLine] # vtkIOImageModule.h  For export macro # vtkVolumeReader.h [NewLine] class vtkTransform ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkUnsignedCharArray"
discard "forward decl of vtkUnsignedShortArray"
const
  VTK_FILE_BYTE_ORDER_BIG_ENDIAN* = 0
  VTK_FILE_BYTE_ORDER_LITTLE_ENDIAN* = 1

## !!!Ignored construct:  class VTKIOIMAGE_EXPORT vtkVolume16Reader : public vtkVolumeReader { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkVolumeReader Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkVolumeReader :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkVolume16Reader :: IsTypeOf ( type ) ; } static vtkVolume16Reader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkVolume16Reader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkVolume16Reader * NewInstance ( ) const { return vtkVolume16Reader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkVolumeReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkVolume16Reader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkVolume16Reader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct object with nullptr file prefix; file pattern "%s.%d"; image range
##  set to (1,1); data origin (0,0,0); data spacing (1,1,1); no data mask;
##  header size 0; and byte swapping turned off.
##  static vtkVolume16Reader * New ( ) ; /@{ *
##  Specify the dimensions for the data.
##  virtual void SetDataDimensions ( int _arg1 , int _arg2 ) { vtkDebugWithObjectMacro ( this , <<  setting  << DataDimensions  to ( << _arg1 << , << _arg2 << ) ) ; if ( ( this -> DataDimensions [ 0 ] != _arg1 ) || ( this -> DataDimensions [ 1 ] != _arg2 ) ) { this -> DataDimensions [ 0 ] = _arg1 ; this -> DataDimensions [ 1 ] = _arg2 ; this -> Modified ( ) ; } } void SetDataDimensions ( const int _arg [ 2 ] ) { this -> SetDataDimensions ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; virtual int * GetDataDimensions ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << DataDimensions  pointer  << this -> DataDimensions ) ; return this -> DataDimensions ; } VTK_WRAPEXCLUDE virtual void GetDataDimensions ( int data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> DataDimensions [ i ] ; } } ; /@} /@{ *
##  Specify a mask used to eliminate data in the data file (e.g.,
##  connectivity bits).
##  virtual void SetDataMask ( unsigned short _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  DataMask  to  << _arg ) ; if ( this -> DataMask != _arg ) { this -> DataMask = _arg ; this -> Modified ( ) ; } } ; virtual unsigned short GetDataMask ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DataMask  of  << this -> DataMask ) ; return this -> DataMask ; } ; /@} /@{ *
##  Specify the number of bytes to seek over at start of image.
##  virtual void SetDataMaskHeaderSize ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  HeaderSize  to  << _arg ) ; if ( this -> HeaderSize != _arg ) { this -> HeaderSize = _arg ; this -> Modified ( ) ; } } ; virtual int GetDataMaskHeaderSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HeaderSize  of  << this -> HeaderSize ) ; return this -> HeaderSize ; } ; /@} /@{ *
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
##  virtual void SetDataMaskHeaderSizeSwapBytes ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SwapBytes  to  << _arg ) ; if ( this -> SwapBytes != _arg ) { this -> SwapBytes = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetDataMaskHeaderSizeSwapBytes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SwapBytes  of  << this -> SwapBytes ) ; return this -> SwapBytes ; } ; virtual void SwapBytesOn ( ) { this -> SetSwapBytes ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void SwapBytesOff ( ) { this -> SetSwapBytes ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get transformation matrix to transform the data from slice space
##  into world space. This matrix must be a permutation matrix. To qualify,
##  the sums of the rows must be + or - 1.
##  virtual void SetTransform ( vtkTransform * ) ; virtual vtkTransform * GetnameTransform ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Transform  address  << static_cast < vtkTransform * > ( this -> Transform ) ) ; return this -> Transform ; } ; /@} *
##  Other objects make use of these methods
##  vtkImageData * GetImage ( int ImageNumber ) override ; protected : vtkVolume16Reader ( ) ; ~ vtkVolume16Reader ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int DataDimensions [ 2 ] ; unsigned short DataMask ; vtkTypeBool SwapBytes ; int HeaderSize ; vtkTransform * Transform ; void TransformSlice ( unsigned short * slice , unsigned short * pixels , int k , int dimensions [ 3 ] , int bounds [ 3 ] ) ; void ComputeTransformedDimensions ( int dimensions [ 3 ] ) ; void ComputeTransformedBounds ( int bounds [ 6 ] ) ; void ComputeTransformedSpacing ( double Spacing [ 3 ] ) ; void ComputeTransformedOrigin ( double origin [ 3 ] ) ; void AdjustSpacingAndOrigin ( int dimensions [ 3 ] , double Spacing [ 3 ] , double origin [ 3 ] ) ; void ReadImage ( int ImageNumber , vtkUnsignedShortArray * ) ; void ReadVolume ( int FirstImage , int LastImage , vtkUnsignedShortArray * ) ; int Read16BitImage ( FILE * fp , unsigned short * pixels , int xsize , int ysize , int skip , int swapBytes ) ; private : vtkVolume16Reader ( const vtkVolume16Reader & ) = delete ; void operator = ( const vtkVolume16Reader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
