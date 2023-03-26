## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkParticleReader.h
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
##  @class   vtkParticleReader
##  @brief   Read ASCII or binary particle
##                             data and (optionally) one scalar
##                             value associated with each particle.
##
##  vtkParticleReader reads either a binary or a text file of
##   particles. Each particle can have associated with it an optional
##   scalar value. So the format is: x, y, z, scalar
##   (all floats or doubles). The text file can consist of a comma
##   delimited set of values. In most cases vtkParticleReader can
##   automatically determine whether the file is text or binary.
##   The data can be either float or double.
##   Progress updates are provided.
##   With respect to binary files, random access into the file to read
##   pieces is supported.
##
##

## !!!Ignored construct:  # vtkParticleReader_h [NewLine] # vtkParticleReader_h [NewLine] # vtkIOGeometryModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] # VTK_FILE_BYTE_ORDER_BIG_ENDIAN 0 [NewLine] # VTK_FILE_BYTE_ORDER_LITTLE_ENDIAN 1 [NewLine] class VTKIOGEOMETRY_EXPORT vtkParticleReader : public vtkPolyDataAlgorithm { public : static vtkParticleReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkParticleReader :: IsTypeOf ( type ) ; } static vtkParticleReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkParticleReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkParticleReader * NewInstance ( ) const { return vtkParticleReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkParticleReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkParticleReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Specify file name.
##  virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ; /@} /@{ *
##  These methods should be used instead of the SwapBytes methods.
##  They indicate the byte ordering of the file you are trying
##  to read in. These methods will then either swap or not swap
##  the bytes depending on the byte ordering of the machine it is
##  being run on. For example, reading in a BigEndian file on a
##  BigEndian machine will result in no swapping. Trying to read
##  the same file on a LittleEndian machine will result in swapping.
##  As a quick note most UNIX machines are BigEndian while PC's
##  and VAX tend to be LittleEndian. So if the file you are reading
##  in was generated on a VAX or PC, SetDataByteOrderToLittleEndian
##  otherwise SetDataByteOrderToBigEndian. Not used when reading
##  text files.
##  void SetDataByteOrderToBigEndian ( ) ; void SetDataByteOrderToLittleEndian ( ) ; int GetDataByteOrder ( ) ; void SetDataByteOrder ( int ) ; const char * GetDataByteOrderAsString ( ) ; /@} /@{ *
##  Set/Get the byte swapping to explicitly swap the bytes of a file.
##  Not used when reading text files.
##  virtual void SetSwapBytes ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SwapBytes  to  << _arg ) ; if ( this -> SwapBytes != _arg ) { this -> SwapBytes = _arg ; this -> Modified ( ) ; } } ; vtkTypeBool GetSwapBytes ( ) { return this -> SwapBytes ; } virtual void SwapBytesOn ( ) { this -> SetSwapBytes ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void SwapBytesOff ( ) { this -> SetSwapBytes ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Default: 1. If 1 then each particle has a value associated with it.
##  virtual void SetSwapBytesHasScalar ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  HasScalar  to  << _arg ) ; if ( this -> HasScalar != _arg ) { this -> HasScalar = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetHasScalar ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HasScalar  of  << this -> HasScalar ) ; return this -> HasScalar ; } ; virtual void HasScalarOn ( ) { this -> SetSwapBytesHasScalar ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void HasScalarOff ( ) { this -> SetSwapBytesHasScalar ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Get/Set the file type.  The options are:
##  - FILE_TYPE_IS_UNKNOWN (default) the class
##  will attempt to determine the file type.
##  If this fails then you should set the file type
##  yourself.
##  - FILE_TYPE_IS_TEXT the file type is text.
##  - FILE_TYPE_IS_BINARY the file type is binary.
##  virtual void SetFileType ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileType  to  << _arg ) ; if ( this -> FileType != ( _arg < FILE_TYPE_IS_UNKNOWN ? FILE_TYPE_IS_UNKNOWN : ( _arg > FILE_TYPE_IS_BINARY ? FILE_TYPE_IS_BINARY : _arg ) ) ) { this -> FileType = ( _arg < FILE_TYPE_IS_UNKNOWN ? FILE_TYPE_IS_UNKNOWN : ( _arg > FILE_TYPE_IS_BINARY ? FILE_TYPE_IS_BINARY : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetFileTypeMinValue ( ) { return FILE_TYPE_IS_UNKNOWN ; } virtual int GetFileTypeMaxValue ( ) { return FILE_TYPE_IS_BINARY ; } ; virtual int GetHasScalarFileType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileType  of  << this -> FileType ) ; return this -> FileType ; } ; void SetFileTypeToUnknown ( ) { this -> SetFileType ( FILE_TYPE_IS_UNKNOWN ) ; } void SetFileTypeToText ( ) { this -> SetFileType ( FILE_TYPE_IS_TEXT ) ; } void SetFileTypeToBinary ( ) { this -> SetFileType ( FILE_TYPE_IS_BINARY ) ; } /@} /@{ *
##  Get/Set the data type.  The options are:
##  - VTK_FLOAT (default) single precision floating point.
##  - VTK_DOUBLE double precision floating point.
##  virtual void SetFileTypeDataType ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << DataType  to  << _arg ) ; if ( this -> DataType != ( _arg < VTK_FLOAT ? VTK_FLOAT : ( _arg > VTK_DOUBLE ? VTK_DOUBLE : _arg ) ) ) { this -> DataType = ( _arg < VTK_FLOAT ? VTK_FLOAT : ( _arg > VTK_DOUBLE ? VTK_DOUBLE : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetFileTypeMinValueDataTypeMinValue ( ) { return VTK_FLOAT ; } virtual int GetFileTypeMaxValueDataTypeMaxValue ( ) { return VTK_DOUBLE ; } ; virtual int GetHasScalarFileTypeDataType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DataType  of  << this -> DataType ) ; return this -> DataType ; } ; void SetDataTypeToFloat ( ) { this -> SetDataType ( VTK_FLOAT ) ; } void SetDataTypeToDouble ( ) { this -> SetDataType ( VTK_DOUBLE ) ; } /@} protected : vtkParticleReader ( ) ; ~ vtkParticleReader ( ) override ; void OpenFile ( ) ; char * FileName ; istream * File ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; /@{ *
##  The format that will be read if the file is a text file is:
##  x, y, z, s (where s is some scalar value associated with the particle).
##  Each line corresponding to a particle is terminated with a line feed.
##  If y, z, or s is missing, zero is substituted for them.
##  Comment lines in the file are handled as follows:
##  1) Any line containing "\/\/" "\#" "\%" anywhere in the line is discarded.
##  2) Lines containing "\/\*" are discarded until a "\*\/" is found. The line
##  following the "\*\/" will be read.
##  int ProduceOutputFromTextFileDouble ( vtkInformationVector * outputVector ) ; int ProduceOutputFromTextFileFloat ( vtkInformationVector * outputVector ) ; /@} /@{ *
##  This reader assumes that the file is binary and consists of floating
##  point values by default.
##  int ProduceOutputFromBinaryFileDouble ( vtkInformationVector * outputVector ) ; int ProduceOutputFromBinaryFileFloat ( vtkInformationVector * outputVector ) ; /@} *
##  Determine the type of file based on an analysis of its contents.
##  Up to 5000 bytes of the file are read and classified. The classification
##  of a file as either binary or text is based on the proportions of bytes in
##  various classifications. The classification of the file is not infallible
##  but should work correctly most of the time. If it fails, use SetFileTypeToText()
##  or SetFileTypeToBinary() to set the file type.
##  This algorithm probably only identifies ASCII text correctly and will not
##  work for UTF-8 UCS-2 (or UTF-16) or UCS-4 or EBCIDIC.
##  int DetermineFileType ( ) ; *
##  Update of the progress.
##  void DoProgressUpdate ( size_t & bytesRead , size_t & fileLength ) ; *
##  Enumerate the supported file types.
##
##  - FILE_TYPE_IS_UNKNOWN, (default) the class will attempt to determine the file type.
##  - FILE_TYPE_IS_TEXT, the file type is text.
##  - FILE_TYPE_IS_BINARY, the file type is binary.
##  enum FILE_TYPE { FILE_TYPE_IS_UNKNOWN = 0 , FILE_TYPE_IS_TEXT , FILE_TYPE_IS_BINARY } ; vtkTypeBool HasScalar ; *
##  Used to decide which reader should be used.
##  int FileType ; *
##  Used to specify the data type.
##  int DataType ; *
##  Set an alliquot of bytes.
##  size_t Alliquot ; *
##  Count of the number of alliquots processed.
##  size_t Count ; vtkTypeBool SwapBytes ; size_t NumberOfPoints ; private : vtkParticleReader ( const vtkParticleReader & ) = delete ; void operator = ( const vtkParticleReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
