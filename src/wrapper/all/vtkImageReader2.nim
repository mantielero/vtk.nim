## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageReader2.h
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
##  @class   vtkImageReader2
##  @brief   Superclass of binary file readers.
##
##  vtkImageReader2 is a parent class for many VTK image readers.
##  It was written to simplify the interface of vtkImageReader.
##  It can also be used directly to read data without headers (raw).
##  It is a good super class for streaming readers that do not require
##  a mask or transform on the data. An example of reading a raw file is
##  shown below:
##  \code
##   vtkSmartPointer<vtkImageReader2> reader =
##    vtkSmartPointer<vtkImageReader2>::New();
##  reader->SetFilePrefix(argv[1]);
##  reader->SetDataExtent(0, 63, 0, 63, 1, 93);
##  reader->SetDataSpacing(3.2, 3.2, 1.5);
##  reader->SetDataOrigin(0.0, 0.0, 0.0);
##  reader->SetDataScalarTypeToUnsignedShort();
##  reader->SetDataByteOrderToLittleEndian();
##  reader->UpdateWholeExtent();
##  \endcode
##
##  @sa
##  vtkJPEGReader vtkPNGReader vtkImageReader vtkGESignaReader
##

import
  vtkIOImageModule, vtkImageAlgorithm

discard "forward decl of vtkStringArray"
const
  VTK_FILE_BYTE_ORDER_BIG_ENDIAN* = 0
  VTK_FILE_BYTE_ORDER_LITTLE_ENDIAN* = 1

type
  vtkImageReader2* {.importcpp: "vtkImageReader2", header: "vtkImageReader2.h",
                    bycopy.} = object of vtkImageAlgorithm
    vtkImageReader2* {.importc: "vtkImageReader2".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    FileNames* {.importc: "FileNames".}: ptr vtkStringArray
    InternalFileName* {.importc: "InternalFileName".}: cstring
    FileName* {.importc: "FileName".}: cstring
    FilePrefix* {.importc: "FilePrefix".}: cstring
    FilePattern* {.importc: "FilePattern".}: cstring
    NumberOfScalarComponents* {.importc: "NumberOfScalarComponents".}: cint
    FileLowerLeft* {.importc: "FileLowerLeft".}: vtkTypeBool
    MemoryBuffer* {.importc: "MemoryBuffer".}: pointer
    MemoryBufferLength* {.importc: "MemoryBufferLength".}: vtkIdType
    File* {.importc: "File".}: ptr istream
    DataIncrements* {.importc: "DataIncrements".}: array[4, culong]
    DataExtent* {.importc: "DataExtent".}: array[6, cint]
    SwapBytes* {.importc: "SwapBytes".}: vtkTypeBool
    FileDimensionality* {.importc: "FileDimensionality".}: cint
    HeaderSize* {.importc: "HeaderSize".}: culong
    DataScalarType* {.importc: "DataScalarType".}: cint
    ManualHeaderSize* {.importc: "ManualHeaderSize".}: culong
    DataSpacing* {.importc: "DataSpacing".}: array[3, cdouble]
    DataOrigin* {.importc: "DataOrigin".}: array[3, cdouble]
    DataDirection* {.importc: "DataDirection".}: array[9, cdouble]
    FileNameSliceOffset* {.importc: "FileNameSliceOffset".}: cint
    FileNameSliceSpacing* {.importc: "FileNameSliceSpacing".}: cint


proc New*(): ptr vtkImageReader2 {.importcpp: "vtkImageReader2::New(@)",
                               header: "vtkImageReader2.h".}
type
  vtkImageReader2Superclass* = vtkImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageReader2::IsTypeOf(@)", header: "vtkImageReader2.h".}
proc IsA*(this: var vtkImageReader2; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkImageReader2.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageReader2 {.
    importcpp: "vtkImageReader2::SafeDownCast(@)", header: "vtkImageReader2.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageReader2 :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageReader2 :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageReader2 :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageReader2; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageReader2.h".}
## !!!Ignored construct:  /@{ *
##  Specify file name for the image file. If the data is stored in
##  multiple files, then use SetFileNames or SetFilePrefix instead.
##  virtual void SetFileName ( VTK_FILEPATH const char * ) ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

proc SetFileNames*(this: var vtkImageReader2; a2: ptr vtkStringArray) {.
    importcpp: "SetFileNames", header: "vtkImageReader2.h".}
proc GetnameFileNames*(this: var vtkImageReader2): ptr vtkStringArray {.
    importcpp: "GetnameFileNames", header: "vtkImageReader2.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify file prefix for the image file or files.  This can be
  ##  used in place of SetFileName or SetFileNames if the filenames
  ##  follow a specific naming pattern, but you must explicitly set
  ##  the DataExtent so that the reader will know what range of slices
  ##  to load.
  ##
## !!!Ignored construct:  virtual void SetFilePrefix ( VTK_FILEPATH const char * ) ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileNameFilePrefix ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FilePrefix  of  << ( this -> FilePrefix ? this -> FilePrefix : (null) ) ) ; return this -> FilePrefix ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  The snprintf-style format string used to build filename from
##  FilePrefix and slice number.
##  virtual void SetFilePattern ( VTK_FILEPATH const char * ) ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileNameFilePrefixFilePattern ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FilePattern  of  << ( this -> FilePattern ? this -> FilePattern : (null) ) ) ; return this -> FilePattern ; } ;
## Error: expected ';'!!!

proc SetMemoryBuffer*(this: var vtkImageReader2; a2: pointer) {.
    importcpp: "SetMemoryBuffer", header: "vtkImageReader2.h".}
proc GetMemoryBuffer*(this: var vtkImageReader2): pointer {.
    importcpp: "GetMemoryBuffer", header: "vtkImageReader2.h".}
proc SetMemoryBufferLength*(this: var vtkImageReader2; buflen: vtkIdType) {.
    importcpp: "SetMemoryBufferLength", header: "vtkImageReader2.h".}
proc GetMemoryBufferLength*(this: var vtkImageReader2): vtkIdType {.
    importcpp: "GetMemoryBufferLength", header: "vtkImageReader2.h".}
proc SetDataScalarType*(this: var vtkImageReader2; `type`: cint) {.
    importcpp: "SetDataScalarType", header: "vtkImageReader2.h".}
proc SetDataScalarTypeToFloat*(this: var vtkImageReader2) {.
    importcpp: "SetDataScalarTypeToFloat", header: "vtkImageReader2.h".}
proc SetDataScalarTypeToDouble*(this: var vtkImageReader2) {.
    importcpp: "SetDataScalarTypeToDouble", header: "vtkImageReader2.h".}
proc SetDataScalarTypeToInt*(this: var vtkImageReader2) {.
    importcpp: "SetDataScalarTypeToInt", header: "vtkImageReader2.h".}
proc SetDataScalarTypeToUnsignedInt*(this: var vtkImageReader2) {.
    importcpp: "SetDataScalarTypeToUnsignedInt", header: "vtkImageReader2.h".}
proc SetDataScalarTypeToShort*(this: var vtkImageReader2) {.
    importcpp: "SetDataScalarTypeToShort", header: "vtkImageReader2.h".}
proc SetDataScalarTypeToUnsignedShort*(this: var vtkImageReader2) {.
    importcpp: "SetDataScalarTypeToUnsignedShort", header: "vtkImageReader2.h".}
proc SetDataScalarTypeToChar*(this: var vtkImageReader2) {.
    importcpp: "SetDataScalarTypeToChar", header: "vtkImageReader2.h".}
proc SetDataScalarTypeToSignedChar*(this: var vtkImageReader2) {.
    importcpp: "SetDataScalarTypeToSignedChar", header: "vtkImageReader2.h".}
proc SetDataScalarTypeToUnsignedChar*(this: var vtkImageReader2) {.
    importcpp: "SetDataScalarTypeToUnsignedChar", header: "vtkImageReader2.h".}
## !!!Ignored construct:  /@{ *
##  Get the file format.  Pixels are this type in the file.
##  virtual int GetDataScalarTypeDataScalarType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DataScalarType  of  << this -> DataScalarType ) ; return this -> DataScalarType ; } ;
## Error: expected ';'!!!

proc SetNumberOfScalarComponents*(this: var vtkImageReader2; _arg: cint) {.
    importcpp: "SetNumberOfScalarComponents", header: "vtkImageReader2.h".}
## !!!Ignored construct:  virtual int GetDataScalarTypeDataScalarTypeNumberOfScalarComponents ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfScalarComponents  of  << this -> NumberOfScalarComponents ) ; return this -> NumberOfScalarComponents ; } ;
## Error: expected ';'!!!

proc SetDataExtent*(this: var vtkImageReader2; _arg1: cint; _arg2: cint; _arg3: cint;
                   _arg4: cint; _arg5: cint; _arg6: cint) {.
    importcpp: "SetDataExtent", header: "vtkImageReader2.h".}
proc SetDataExtent*(this: var vtkImageReader2; _arg: array[6, cint]) {.
    importcpp: "SetDataExtent", header: "vtkImageReader2.h".}
## !!!Ignored construct:  virtual int * GetDataExtent ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << DataExtent  pointer  << this -> DataExtent ) ; return this -> DataExtent ; } VTK_WRAPEXCLUDE virtual void GetDataExtent ( int & _arg1 , int & _arg2 , int & _arg3 , int & _arg4 , int & _arg5 , int & _arg6 ) { _arg1 = this -> DataExtent [ 0 ] ; _arg2 = this -> DataExtent [ 1 ] ; _arg3 = this -> DataExtent [ 2 ] ; _arg4 = this -> DataExtent [ 3 ] ; _arg5 = this -> DataExtent [ 4 ] ; _arg6 = this -> DataExtent [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << DataExtent  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetDataExtent ( int _arg [ 6 ] ) { this -> GetDataExtent ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ;
## Error: expected ';'!!!

proc SetNumberOfScalarComponentsFileDimensionality*(this: var vtkImageReader2;
    _arg: cint) {.importcpp: "SetNumberOfScalarComponentsFileDimensionality",
                header: "vtkImageReader2.h".}
proc GetFileDimensionality*(this: var vtkImageReader2): cint {.
    importcpp: "GetFileDimensionality", header: "vtkImageReader2.h".}
proc SetDataSpacing*(this: var vtkImageReader2; _arg1: cdouble; _arg2: cdouble;
                    _arg3: cdouble) {.importcpp: "SetDataSpacing",
                                    header: "vtkImageReader2.h".}
proc SetDataSpacing*(this: var vtkImageReader2; _arg: array[3, cdouble]) {.
    importcpp: "SetDataSpacing", header: "vtkImageReader2.h".}
## !!!Ignored construct:  virtual double * GetDataSpacing ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << DataSpacing  pointer  << this -> DataSpacing ) ; return this -> DataSpacing ; } VTK_WRAPEXCLUDE virtual void GetDataSpacing ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> DataSpacing [ 0 ] ; _arg2 = this -> DataSpacing [ 1 ] ; _arg3 = this -> DataSpacing [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << DataSpacing  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetDataSpacing ( double _arg [ 3 ] ) { this -> GetDataSpacing ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetDataSpacingDataOrigin*(this: var vtkImageReader2; _arg1: cdouble;
                              _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetDataSpacingDataOrigin", header: "vtkImageReader2.h".}
proc SetDataSpacingDataOrigin*(this: var vtkImageReader2; _arg: array[3, cdouble]) {.
    importcpp: "SetDataSpacingDataOrigin", header: "vtkImageReader2.h".}
## !!!Ignored construct:  virtual double * GetDataSpacingDataOrigin ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << DataOrigin  pointer  << this -> DataOrigin ) ; return this -> DataOrigin ; } VTK_WRAPEXCLUDE virtual void GetDataSpacingDataOrigin ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> DataOrigin [ 0 ] ; _arg2 = this -> DataOrigin [ 1 ] ; _arg3 = this -> DataOrigin [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << DataOrigin  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetDataSpacingDataOrigin ( double _arg [ 3 ] ) { this -> GetDataSpacingDataOrigin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetDataDirection*(this: var vtkImageReader2; data: ptr cdouble) {.
    importcpp: "SetDataDirection", header: "vtkImageReader2.h".}
## !!!Ignored construct:  virtual double * GetDataDirection ( ) VTK_SIZEHINT ( 9 ) { vtkDebugWithObjectMacro ( this , <<  returning  << DataDirection  pointer  << this -> DataDirection ) ; return this -> DataDirection ; } VTK_WRAPEXCLUDE virtual void GetDataDirection ( double data [ 9 ] ) { for ( int i = 0 ; i < 9 ; i ++ ) { data [ i ] = this -> DataDirection [ i ] ; } } ;
## Error: expected ';'!!!

proc GetHeaderSize*(this: var vtkImageReader2): culong {.importcpp: "GetHeaderSize",
    header: "vtkImageReader2.h".}
proc GetHeaderSize*(this: var vtkImageReader2; slice: culong): culong {.
    importcpp: "GetHeaderSize", header: "vtkImageReader2.h".}
proc SetHeaderSize*(this: var vtkImageReader2; size: culong) {.
    importcpp: "SetHeaderSize", header: "vtkImageReader2.h".}
proc SetDataByteOrderToBigEndian*(this: var vtkImageReader2) {.
    importcpp: "SetDataByteOrderToBigEndian", header: "vtkImageReader2.h".}
proc SetDataByteOrderToLittleEndian*(this: var vtkImageReader2) {.
    importcpp: "SetDataByteOrderToLittleEndian", header: "vtkImageReader2.h".}
proc GetDataByteOrder*(this: var vtkImageReader2): cint {.
    importcpp: "GetDataByteOrder", header: "vtkImageReader2.h".}
proc SetDataByteOrder*(this: var vtkImageReader2; a2: cint) {.
    importcpp: "SetDataByteOrder", header: "vtkImageReader2.h".}
proc GetDataByteOrderAsString*(this: var vtkImageReader2): cstring {.
    importcpp: "GetDataByteOrderAsString", header: "vtkImageReader2.h".}
proc SetNumberOfScalarComponentsFileDimensionalityFileNameSliceOffset*(
    this: var vtkImageReader2; _arg: cint) {.importcpp: "SetNumberOfScalarComponentsFileDimensionalityFileNameSliceOffset",
                                        header: "vtkImageReader2.h".}
## !!!Ignored construct:  virtual int GetDataScalarTypeDataScalarTypeNumberOfScalarComponentsFileNameSliceOffset ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileNameSliceOffset  of  << this -> FileNameSliceOffset ) ; return this -> FileNameSliceOffset ; } ;
## Error: expected ';'!!!

proc SetNumberOfScalarComponentsFileDimensionalityFileNameSliceOffsetFileNameSliceSpacing*(
    this: var vtkImageReader2; _arg: cint) {.importcpp: "SetNumberOfScalarComponentsFileDimensionalityFileNameSliceOffsetFileNameSliceSpacing",
                                        header: "vtkImageReader2.h".}
## !!!Ignored construct:  virtual int GetDataScalarTypeDataScalarTypeNumberOfScalarComponentsFileNameSliceOffsetFileNameSliceSpacing ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileNameSliceSpacing  of  << this -> FileNameSliceSpacing ) ; return this -> FileNameSliceSpacing ; } ;
## Error: expected ';'!!!

proc SetNumberOfScalarComponentsFileDimensionalityFileNameSliceOffsetFileNameSliceSpacingSwapBytes*(
    this: var vtkImageReader2; _arg: vtkTypeBool) {.importcpp: "SetNumberOfScalarComponentsFileDimensionalityFileNameSliceOffsetFileNameSliceSpacingSwapBytes",
    header: "vtkImageReader2.h".}
proc GetSwapBytes*(this: var vtkImageReader2): vtkTypeBool {.
    importcpp: "GetSwapBytes", header: "vtkImageReader2.h".}
proc SwapBytesOn*(this: var vtkImageReader2) {.importcpp: "SwapBytesOn",
    header: "vtkImageReader2.h".}
proc SwapBytesOff*(this: var vtkImageReader2) {.importcpp: "SwapBytesOff",
    header: "vtkImageReader2.h".}
  ## /@}
proc GetFile*(this: var vtkImageReader2): ptr istream {.importcpp: "GetFile",
    header: "vtkImageReader2.h".}
## !!!Ignored construct:  virtual unsigned long * GetDataDirectionDataIncrements ( ) VTK_SIZEHINT ( 4 ) { vtkDebugWithObjectMacro ( this , <<  returning  << DataIncrements  pointer  << this -> DataIncrements ) ; return this -> DataIncrements ; } VTK_WRAPEXCLUDE virtual void GetDataDirectionDataIncrements ( unsigned long data [ 4 ] ) { for ( int i = 0 ; i < 4 ; i ++ ) { data [ i ] = this -> DataIncrements [ i ] ; } } ;
## Error: expected ';'!!!

proc OpenFile*(this: var vtkImageReader2): cint {.importcpp: "OpenFile",
    header: "vtkImageReader2.h".}
proc CloseFile*(this: var vtkImageReader2) {.importcpp: "CloseFile",
    header: "vtkImageReader2.h".}
proc SeekFile*(this: var vtkImageReader2; i: cint; j: cint; k: cint) {.
    importcpp: "SeekFile", header: "vtkImageReader2.h".}
proc FileLowerLeftOn*(this: var vtkImageReader2) {.importcpp: "FileLowerLeftOn",
    header: "vtkImageReader2.h".}
proc FileLowerLeftOff*(this: var vtkImageReader2) {.importcpp: "FileLowerLeftOff",
    header: "vtkImageReader2.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetDataScalarTypeDataScalarTypeNumberOfScalarComponentsFileNameSliceOffsetFileNameSliceSpacingFileLowerLeft ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileLowerLeft  of  << this -> FileLowerLeft ) ; return this -> FileLowerLeft ; } ;
## Error: expected ';'!!!

proc SetNumberOfScalarComponentsFileDimensionalityFileNameSliceOffsetFileNameSliceSpacingSwapBytesFileLowerLeft*(
    this: var vtkImageReader2; _arg: vtkTypeBool) {.importcpp: "SetNumberOfScalarComponentsFileDimensionalityFileNameSliceOffsetFileNameSliceSpacingSwapBytesFileLowerLeft",
    header: "vtkImageReader2.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the internal file name
  ##
proc ComputeInternalFileName*(this: var vtkImageReader2; slice: cint) {.
    importcpp: "ComputeInternalFileName", header: "vtkImageReader2.h".}
## !!!Ignored construct:  char * GetFileNameFilePrefixFilePatternInternalFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InternalFileName  of  << ( this -> InternalFileName ? this -> InternalFileName : (null) ) ) ; return this -> InternalFileName ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} *
##  Return non zero if the reader can read the given file name.
##  Should be implemented by all sub-classes of vtkImageReader2.
##  For non zero return values the following values are to be used
##  1 - I think I can read the file but I cannot prove it
##  2 - I definitely can read the file
##  3 - I can read the file and I have validated that I am the
##  correct reader for this file
##  virtual int CanReadFile ( VTK_FILEPATH const char * vtkNotUsed ( fname ) ) { return 0 ; } *
##  Get the file extensions for this format.
##  Returns a string with a space separated list of extensions in
##  the format .extension
##  virtual const char * GetFileExtensions ( ) { return nullptr ; } /@{ *
##  Return a descriptive name for the file format that might be useful in a GUI.
##  virtual const char * GetDescriptiveName ( ) { return nullptr ; } protected : vtkImageReader2 ( ) ;
## Error: token expected: ) but got: *!!!

proc destroyvtkImageReader2*(this: var vtkImageReader2) {.
    importcpp: "#.~vtkImageReader2()", header: "vtkImageReader2.h".}
proc RequestInformation*(this: var vtkImageReader2; request: ptr vtkInformation;
                        inputVector: ptr ptr vtkInformationVector;
                        outputVector: ptr vtkInformationVector): cint {.
    importcpp: "RequestInformation", header: "vtkImageReader2.h".}
proc ExecuteInformation*(this: var vtkImageReader2) {.
    importcpp: "ExecuteInformation", header: "vtkImageReader2.h".}
proc ExecuteDataWithInformation*(this: var vtkImageReader2; data: ptr vtkDataObject;
                                outInfo: ptr vtkInformation) {.
    importcpp: "ExecuteDataWithInformation", header: "vtkImageReader2.h".}
proc ComputeDataIncrements*(this: var vtkImageReader2) {.
    importcpp: "ComputeDataIncrements", header: "vtkImageReader2.h".}