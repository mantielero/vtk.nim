## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLWriterBase.h
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
##  @class vtkXMLWriterBase
##  @brief Abstract base class for VTK-XML writers.
##
##  vtkXMLWriterBase class was created to help refactor XML writers
##  (vtkXMLWriter and subclasses). Get/Set API on vtkXMLWriter is moved here while
##  all the gory implementation details are left in vtkXMLWriter. This enables use to create
##  a sibling hierarchy to vtkXMLWriter that uses a cleaner design to implement
##  the IO capabilities. Eventually, we vtkXMLWriter and its children will be
##  substituted by a parallel hierarchy at which point this class may merge with
##  it's new subclass.
##

import
  vtkAlgorithm, vtkIOXMLModule

discard "forward decl of vtkDataCompressor"
type
  vtkXMLWriterBase* {.importcpp: "vtkXMLWriterBase", header: "vtkXMLWriterBase.h",
                     bycopy.} = object of vtkAlgorithm
    vtkXMLWriterBase* {.importc: "vtkXMLWriterBase".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    ##  Whether this object is writing to a string or a file.
    ##  Default is 0: write to file.
    ##  The output string.
    ##  The output byte order.
    ##  The output binary header word type.
    ##  The output vtkIdType.
    ##  The form of binary data to write.  Used by subclasses to choose
    ##  how to write data.
    ##  Whether to base64-encode the appended data section.
    ##  Compression information.
    ##  Compression Level for vtkDataCompressor objects
    ##  1 (worst compression, fastest) ... 9 (best compression, slowest)
    ##  This variable is used to ease transition to new versions of VTK XML files.
    ##  If data that needs to be written satisfies certain conditions,
    ##  the writer can use the previous file version version.
    ##  For version change 0.1 -> 2.0 (UInt32 header) and 1.0 -> 2.0
    ##  (UInt64 header), if data does not have a vtkGhostType array,
    ##  the file is written with version: 0.1/1.0.

  vtkXMLWriterBaseSuperclass* = vtkAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkXMLWriterBase::IsTypeOf(@)", header: "vtkXMLWriterBase.h".}
proc IsA*(this: var vtkXMLWriterBase; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkXMLWriterBase.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkXMLWriterBase {.
    importcpp: "vtkXMLWriterBase::SafeDownCast(@)", header: "vtkXMLWriterBase.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkXMLWriterBase :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLWriterBase :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLWriterBase :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkXMLWriterBase; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkXMLWriterBase.h".}
const
  vtkXMLWriterBaseBigEndian* = 0
  vtkXMLWriterBaseLittleEndian* = 1

const
  vtkXMLWriterBaseAscii* = 0
  vtkXMLWriterBaseBinary* = 1
  vtkXMLWriterBaseAppended* = 2

const
  vtkXMLWriterBaseInt32* = 32
  vtkXMLWriterBaseInt64* = 64

const
  vtkXMLWriterBaseUInt32* = 32
  vtkXMLWriterBaseUInt64* = 64

proc SetByteOrder*(this: var vtkXMLWriterBase; _arg: cint) {.
    importcpp: "SetByteOrder", header: "vtkXMLWriterBase.h".}
## !!!Ignored construct:  virtual int GetByteOrder ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ByteOrder  of  << this -> ByteOrder ) ; return this -> ByteOrder ; } ;
## Error: expected ';'!!!

proc SetByteOrderToBigEndian*(this: var vtkXMLWriterBase) {.
    importcpp: "SetByteOrderToBigEndian", header: "vtkXMLWriterBase.h".}
proc SetByteOrderToLittleEndian*(this: var vtkXMLWriterBase) {.
    importcpp: "SetByteOrderToLittleEndian", header: "vtkXMLWriterBase.h".}
proc SetHeaderType*(this: var vtkXMLWriterBase; a2: cint) {.
    importcpp: "SetHeaderType", header: "vtkXMLWriterBase.h".}
## !!!Ignored construct:  virtual int GetByteOrderHeaderType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HeaderType  of  << this -> HeaderType ) ; return this -> HeaderType ; } ;
## Error: expected ';'!!!

proc SetHeaderTypeToUInt32*(this: var vtkXMLWriterBase) {.
    importcpp: "SetHeaderTypeToUInt32", header: "vtkXMLWriterBase.h".}
proc SetHeaderTypeToUInt64*(this: var vtkXMLWriterBase) {.
    importcpp: "SetHeaderTypeToUInt64", header: "vtkXMLWriterBase.h".}
proc SetIdType*(this: var vtkXMLWriterBase; a2: cint) {.importcpp: "SetIdType",
    header: "vtkXMLWriterBase.h".}
## !!!Ignored construct:  virtual int GetByteOrderHeaderTypeIdType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IdType  of  << this -> IdType ) ; return this -> IdType ; } ;
## Error: expected ';'!!!

proc SetIdTypeToInt32*(this: var vtkXMLWriterBase) {.importcpp: "SetIdTypeToInt32",
    header: "vtkXMLWriterBase.h".}
proc SetIdTypeToInt64*(this: var vtkXMLWriterBase) {.importcpp: "SetIdTypeToInt64",
    header: "vtkXMLWriterBase.h".}
## !!!Ignored construct:  /@} /@{ *
##  Get/Set the name of the output file.
##  virtual void SetFileNameFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

proc SetByteOrderWriteToOutputString*(this: var vtkXMLWriterBase; _arg: bool) {.
    importcpp: "SetByteOrderWriteToOutputString", header: "vtkXMLWriterBase.h".}
## !!!Ignored construct:  virtual bool GetByteOrderHeaderTypeIdTypeWriteToOutputString ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WriteToOutputString  of  << this -> WriteToOutputString ) ; return this -> WriteToOutputString ; } ;
## Error: expected ';'!!!

proc WriteToOutputStringOn*(this: var vtkXMLWriterBase) {.
    importcpp: "WriteToOutputStringOn", header: "vtkXMLWriterBase.h".}
proc WriteToOutputStringOff*(this: var vtkXMLWriterBase) {.
    importcpp: "WriteToOutputStringOff", header: "vtkXMLWriterBase.h".}
proc GetOutputString*(this: var vtkXMLWriterBase): string {.
    importcpp: "GetOutputString", header: "vtkXMLWriterBase.h".}
proc SetCompressor*(this: var vtkXMLWriterBase; a2: ptr vtkDataCompressor) {.
    importcpp: "SetCompressor", header: "vtkXMLWriterBase.h".}
proc GetnameCompressor*(this: var vtkXMLWriterBase): ptr vtkDataCompressor {.
    importcpp: "GetnameCompressor", header: "vtkXMLWriterBase.h".}
  ## /@}
type
  vtkXMLWriterBaseCompressorType* {.size: sizeof(cint), importcpp: "vtkXMLWriterBase::CompressorType",
                                   header: "vtkXMLWriterBase.h".} = enum
    NONE, ZLIB, LZ4, LZMA


proc SetCompressorType*(this: var vtkXMLWriterBase; compressorType: cint) {.
    importcpp: "SetCompressorType", header: "vtkXMLWriterBase.h".}
proc SetCompressorTypeToNone*(this: var vtkXMLWriterBase) {.
    importcpp: "SetCompressorTypeToNone", header: "vtkXMLWriterBase.h".}
proc SetCompressorTypeToLZ4*(this: var vtkXMLWriterBase) {.
    importcpp: "SetCompressorTypeToLZ4", header: "vtkXMLWriterBase.h".}
proc SetCompressorTypeToZLib*(this: var vtkXMLWriterBase) {.
    importcpp: "SetCompressorTypeToZLib", header: "vtkXMLWriterBase.h".}
proc SetCompressorTypeToLZMA*(this: var vtkXMLWriterBase) {.
    importcpp: "SetCompressorTypeToLZMA", header: "vtkXMLWriterBase.h".}
proc SetCompressionLevel*(this: var vtkXMLWriterBase; compressorLevel: cint) {.
    importcpp: "SetCompressionLevel", header: "vtkXMLWriterBase.h".}
## !!!Ignored construct:  virtual int GetByteOrderHeaderTypeIdTypeWriteToOutputStringCompressionLevel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CompressionLevel  of  << this -> CompressionLevel ) ; return this -> CompressionLevel ; } ;
## Error: expected ';'!!!

proc SetBlockSize*(this: var vtkXMLWriterBase; blockSize: csize_t) {.
    importcpp: "SetBlockSize", header: "vtkXMLWriterBase.h".}
## !!!Ignored construct:  virtual size_t GetByteOrderHeaderTypeIdTypeWriteToOutputStringCompressionLevelBlockSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BlockSize  of  << this -> BlockSize ) ; return this -> BlockSize ; } ;
## Error: expected ';'!!!

proc SetByteOrderWriteToOutputStringDataMode*(this: var vtkXMLWriterBase; _arg: cint) {.
    importcpp: "SetByteOrderWriteToOutputStringDataMode",
    header: "vtkXMLWriterBase.h".}
## !!!Ignored construct:  virtual int GetByteOrderHeaderTypeIdTypeWriteToOutputStringCompressionLevelBlockSizeDataMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DataMode  of  << this -> DataMode ) ; return this -> DataMode ; } ;
## Error: expected ';'!!!

proc SetDataModeToAscii*(this: var vtkXMLWriterBase) {.
    importcpp: "SetDataModeToAscii", header: "vtkXMLWriterBase.h".}
proc SetDataModeToBinary*(this: var vtkXMLWriterBase) {.
    importcpp: "SetDataModeToBinary", header: "vtkXMLWriterBase.h".}
proc SetDataModeToAppended*(this: var vtkXMLWriterBase) {.
    importcpp: "SetDataModeToAppended", header: "vtkXMLWriterBase.h".}
proc SetByteOrderWriteToOutputStringDataModeEncodeAppendedData*(
    this: var vtkXMLWriterBase; _arg: bool) {.
    importcpp: "SetByteOrderWriteToOutputStringDataModeEncodeAppendedData",
    header: "vtkXMLWriterBase.h".}
## !!!Ignored construct:  virtual bool GetByteOrderHeaderTypeIdTypeWriteToOutputStringCompressionLevelBlockSizeDataModeEncodeAppendedData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EncodeAppendedData  of  << this -> EncodeAppendedData ) ; return this -> EncodeAppendedData ; } ;
## Error: expected ';'!!!

proc EncodeAppendedDataOn*(this: var vtkXMLWriterBase) {.
    importcpp: "EncodeAppendedDataOn", header: "vtkXMLWriterBase.h".}
proc EncodeAppendedDataOff*(this: var vtkXMLWriterBase) {.
    importcpp: "EncodeAppendedDataOff", header: "vtkXMLWriterBase.h".}
  ## /@}
  ## *
  ##  Get the default file extension for files written by this writer.
  ##
proc GetDefaultFileExtension*(this: var vtkXMLWriterBase): cstring {.
    importcpp: "GetDefaultFileExtension", header: "vtkXMLWriterBase.h".}
proc Write*(this: var vtkXMLWriterBase): cint {.importcpp: "Write",
    header: "vtkXMLWriterBase.h".}