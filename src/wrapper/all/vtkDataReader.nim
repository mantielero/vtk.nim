## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDataReader.h
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
##  @class   vtkDataReader
##  @brief   helper superclass for objects that read vtk data files
##
##  vtkDataReader is a helper superclass that reads the vtk data file header,
##  dataset type, and attribute data (point and cell attributes such as
##  scalars, vectors, normals, etc.) from a vtk data file.  See text for
##  the format of the various vtk file types.
##
##  @sa
##  vtkPolyDataReader vtkStructuredPointsReader vtkStructuredGridReader
##  vtkUnstructuredGridReader vtkRectilinearGridReader
##

import
  vtkIOLegacyModule, vtkSimpleReader, vtkStdString

const
  VTK_ASCII* = 1
  VTK_BINARY* = 2

discard "forward decl of vtkAbstractArray"
discard "forward decl of vtkCharArray"
discard "forward decl of vtkCellArray"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkDataSetAttributes"
discard "forward decl of vtkFieldData"
discard "forward decl of vtkGraph"
discard "forward decl of vtkPointSet"
discard "forward decl of vtkRectilinearGrid"
discard "forward decl of vtkTable"
type
  vtkDataReader* {.importcpp: "vtkDataReader", header: "vtkDataReader.h", bycopy.} = object of vtkSimpleReader
    vtkDataReader* {.importc: "vtkDataReader".}: VTK_NEWINSTANCE
    char* {.importc: "char".}: VTK_FILEPATH
    char* {.importc: "char".}: VTK_FILEPATH
    CurrentFileName* {.importc: "CurrentFileName".}: string
    FileVersion* {.importc: "FileVersion".}: cint
    FileMajorVersion* {.importc: "FileMajorVersion".}: cint
    FileMinorVersion* {.importc: "FileMinorVersion".}: cint
    FileType* {.importc: "FileType".}: cint
    IS* {.importc: "IS".}: ptr istream
    ScalarsName* {.importc: "ScalarsName".}: cstring
    VectorsName* {.importc: "VectorsName".}: cstring
    TensorsName* {.importc: "TensorsName".}: cstring
    TCoordsName* {.importc: "TCoordsName".}: cstring
    NormalsName* {.importc: "NormalsName".}: cstring
    LookupTableName* {.importc: "LookupTableName".}: cstring
    FieldDataName* {.importc: "FieldDataName".}: cstring
    ScalarLut* {.importc: "ScalarLut".}: cstring
    ReadFromInputString* {.importc: "ReadFromInputString".}: vtkTypeBool
    InputString* {.importc: "InputString".}: cstring
    InputStringLength* {.importc: "InputStringLength".}: cint
    InputStringPos* {.importc: "InputStringPos".}: cint
    Header* {.importc: "Header".}: cstring
    NumberOfScalarsInFile* {.importc: "NumberOfScalarsInFile".}: cint
    ScalarsNameInFile* {.importc: "ScalarsNameInFile".}: cstringArray
    ScalarsNameAllocSize* {.importc: "ScalarsNameAllocSize".}: cint
    NumberOfVectorsInFile* {.importc: "NumberOfVectorsInFile".}: cint
    VectorsNameInFile* {.importc: "VectorsNameInFile".}: cstringArray
    VectorsNameAllocSize* {.importc: "VectorsNameAllocSize".}: cint
    NumberOfTensorsInFile* {.importc: "NumberOfTensorsInFile".}: cint
    TensorsNameInFile* {.importc: "TensorsNameInFile".}: cstringArray
    TensorsNameAllocSize* {.importc: "TensorsNameAllocSize".}: cint
    NumberOfTCoordsInFile* {.importc: "NumberOfTCoordsInFile".}: cint
    TCoordsNameInFile* {.importc: "TCoordsNameInFile".}: cstringArray
    TCoordsNameAllocSize* {.importc: "TCoordsNameAllocSize".}: cint
    NumberOfNormalsInFile* {.importc: "NumberOfNormalsInFile".}: cint
    NormalsNameInFile* {.importc: "NormalsNameInFile".}: cstringArray
    NormalsNameAllocSize* {.importc: "NormalsNameAllocSize".}: cint
    NumberOfFieldDataInFile* {.importc: "NumberOfFieldDataInFile".}: cint
    FieldDataNameInFile* {.importc: "FieldDataNameInFile".}: cstringArray
    FieldDataNameAllocSize* {.importc: "FieldDataNameAllocSize".}: cint
    CharacteristicsTime* {.importc: "CharacteristicsTime".}: vtkTimeStamp
    ReadAllScalars* {.importc: "ReadAllScalars".}: vtkTypeBool
    ReadAllVectors* {.importc: "ReadAllVectors".}: vtkTypeBool
    ReadAllNormals* {.importc: "ReadAllNormals".}: vtkTypeBool
    ReadAllTensors* {.importc: "ReadAllTensors".}: vtkTypeBool
    ReadAllColorScalars* {.importc: "ReadAllColorScalars".}: vtkTypeBool
    ReadAllTCoords* {.importc: "ReadAllTCoords".}: vtkTypeBool
    ReadAllFields* {.importc: "ReadAllFields".}: vtkTypeBool
    CurrentLocale* {.importc: "CurrentLocale".}: locale
    InputArray* {.importc: "InputArray".}: ptr vtkCharArray ## *
                                                       ##  Decode a string. This method is the inverse of
                                                       ##  vtkWriter::EncodeString.  Returns the length of the
                                                       ##  result string.
                                                       ##

  vtkDataReaderFieldType* {.size: sizeof(cint),
                           importcpp: "vtkDataReader::FieldType",
                           header: "vtkDataReader.h".} = enum
    POINT_DATA, CELL_DATA, FIELD_DATA


proc New*(): ptr vtkDataReader {.importcpp: "vtkDataReader::New(@)",
                             header: "vtkDataReader.h".}
type
  vtkDataReaderSuperclass* = vtkSimpleReader

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDataReader::IsTypeOf(@)", header: "vtkDataReader.h".}
proc IsA*(this: var vtkDataReader; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkDataReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDataReader {.
    importcpp: "vtkDataReader::SafeDownCast(@)", header: "vtkDataReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDataReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkSimpleReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDataReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDataReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkDataReader.h".}
## !!!Ignored construct:  /@{ *
##  Specify file name of vtk data file to read. This is just
##  a convenience method that calls the superclass' AddFileName
##  method.
##  void SetFileName ( VTK_FILEPATH const char * fname ) ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  * GetFileName ( ) const ;
## Error: identifier expected, but got: *!!!

## !!!Ignored construct:  * GetFileName ( int i ) const { return this -> vtkSimpleReader :: GetFileName ( i ) ; } /@} /@{ *
##  Return the version of the file read; for example, VTK legacy readers
##  will return the version of the VTK legacy file. (In the case of VTK
##  legacy files, see vtkDataWriter.h for the enum types returned.) This
##  method only returns useful information after a successful read is
##  performed; and some derived classes may not return relevant
##  information.) Note that for VTK legacy readers, the FileVersion is
##  defined by the compositing the major version digits with the minor
##  version digit. Extremely ancient VTK files (e.g., before version 4.2)
##  will return a FileVersion of 3.0.
##  virtual int GetFileVersion ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileVersion  of  << this -> FileVersion ) ; return this -> FileVersion ; } ;
## Error: identifier expected, but got: *!!!

## !!!Ignored construct:  virtual int GetFileVersionFileMajorVersion ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileMajorVersion  of  << this -> FileMajorVersion ) ; return this -> FileMajorVersion ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual int GetFileVersionFileMajorVersionFileMinorVersion ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileMinorVersion  of  << this -> FileMinorVersion ) ; return this -> FileMinorVersion ; } ;
## Error: expected ';'!!!

proc IsFileValid*(this: var vtkDataReader; dstype: cstring): cint {.
    importcpp: "IsFileValid", header: "vtkDataReader.h".}
proc IsFileStructuredPoints*(this: var vtkDataReader): cint {.
    importcpp: "IsFileStructuredPoints", header: "vtkDataReader.h".}
proc IsFilePolyData*(this: var vtkDataReader): cint {.importcpp: "IsFilePolyData",
    header: "vtkDataReader.h".}
proc IsFileStructuredGrid*(this: var vtkDataReader): cint {.
    importcpp: "IsFileStructuredGrid", header: "vtkDataReader.h".}
proc IsFileUnstructuredGrid*(this: var vtkDataReader): cint {.
    importcpp: "IsFileUnstructuredGrid", header: "vtkDataReader.h".}
proc IsFileRectilinearGrid*(this: var vtkDataReader): cint {.
    importcpp: "IsFileRectilinearGrid", header: "vtkDataReader.h".}
proc SetInputString*(this: var vtkDataReader; `in`: cstring) {.
    importcpp: "SetInputString", header: "vtkDataReader.h".}
proc GetInputString*(this: var vtkDataReader): cstring {.importcpp: "GetInputString",
    header: "vtkDataReader.h".}
proc SetInputString*(this: var vtkDataReader; `in`: cstring; len: cint) {.
    importcpp: "SetInputString", header: "vtkDataReader.h".}
## !!!Ignored construct:  virtual int GetFileVersionFileMajorVersionFileMinorVersionInputStringLength ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InputStringLength  of  << this -> InputStringLength ) ; return this -> InputStringLength ; } ;
## Error: expected ';'!!!

proc SetBinaryInputString*(this: var vtkDataReader; a2: cstring; len: cint) {.
    importcpp: "SetBinaryInputString", header: "vtkDataReader.h".}
proc SetInputString*(this: var vtkDataReader; input: vtkStdString) {.
    importcpp: "SetInputString", header: "vtkDataReader.h".}
proc SetInputArray*(this: var vtkDataReader; a2: ptr vtkCharArray) {.
    importcpp: "SetInputArray", header: "vtkDataReader.h".}
proc GetnameInputArray*(this: var vtkDataReader): ptr vtkCharArray {.
    importcpp: "GetnameInputArray", header: "vtkDataReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the header from the vtk data file.
  ##
proc GetInputStringHeader*(this: var vtkDataReader): cstring {.
    importcpp: "GetInputStringHeader", header: "vtkDataReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Enable reading from an InputString or InputArray instead of the default,
  ##  a file.
  ##
proc SetReadFromInputString*(this: var vtkDataReader; _arg: vtkTypeBool) {.
    importcpp: "SetReadFromInputString", header: "vtkDataReader.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetFileVersionFileMajorVersionFileMinorVersionInputStringLengthReadFromInputString ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReadFromInputString  of  << this -> ReadFromInputString ) ; return this -> ReadFromInputString ; } ;
## Error: expected ';'!!!

proc ReadFromInputStringOn*(this: var vtkDataReader) {.
    importcpp: "ReadFromInputStringOn", header: "vtkDataReader.h".}
proc ReadFromInputStringOff*(this: var vtkDataReader) {.
    importcpp: "ReadFromInputStringOff", header: "vtkDataReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the type of file (ASCII or BINARY). Returned value only valid
  ##  after file has been read.
  ##
## !!!Ignored construct:  virtual int GetFileVersionFileMajorVersionFileMinorVersionInputStringLengthReadFromInputStringFileType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileType  of  << this -> FileType ) ; return this -> FileType ; } ;
## Error: expected ';'!!!

proc GetNumberOfScalarsInFile*(this: var vtkDataReader): cint {.
    importcpp: "GetNumberOfScalarsInFile", header: "vtkDataReader.h".}
proc GetNumberOfVectorsInFile*(this: var vtkDataReader): cint {.
    importcpp: "GetNumberOfVectorsInFile", header: "vtkDataReader.h".}
proc GetNumberOfTensorsInFile*(this: var vtkDataReader): cint {.
    importcpp: "GetNumberOfTensorsInFile", header: "vtkDataReader.h".}
proc GetNumberOfNormalsInFile*(this: var vtkDataReader): cint {.
    importcpp: "GetNumberOfNormalsInFile", header: "vtkDataReader.h".}
proc GetNumberOfTCoordsInFile*(this: var vtkDataReader): cint {.
    importcpp: "GetNumberOfTCoordsInFile", header: "vtkDataReader.h".}
proc GetNumberOfFieldDataInFile*(this: var vtkDataReader): cint {.
    importcpp: "GetNumberOfFieldDataInFile", header: "vtkDataReader.h".}
proc GetScalarsNameInFile*(this: var vtkDataReader; i: cint): cstring {.
    importcpp: "GetScalarsNameInFile", header: "vtkDataReader.h".}
proc GetVectorsNameInFile*(this: var vtkDataReader; i: cint): cstring {.
    importcpp: "GetVectorsNameInFile", header: "vtkDataReader.h".}
proc GetTensorsNameInFile*(this: var vtkDataReader; i: cint): cstring {.
    importcpp: "GetTensorsNameInFile", header: "vtkDataReader.h".}
proc GetNormalsNameInFile*(this: var vtkDataReader; i: cint): cstring {.
    importcpp: "GetNormalsNameInFile", header: "vtkDataReader.h".}
proc GetTCoordsNameInFile*(this: var vtkDataReader; i: cint): cstring {.
    importcpp: "GetTCoordsNameInFile", header: "vtkDataReader.h".}
proc GetFieldDataNameInFile*(this: var vtkDataReader; i: cint): cstring {.
    importcpp: "GetFieldDataNameInFile", header: "vtkDataReader.h".}
proc SetScalarsName*(this: var vtkDataReader; _arg: cstring) {.
    importcpp: "SetScalarsName", header: "vtkDataReader.h".}
proc GetInputStringHeaderScalarsName*(this: var vtkDataReader): cstring {.
    importcpp: "GetInputStringHeaderScalarsName", header: "vtkDataReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the name of the vector data to extract. If not specified, first
  ##  vector data encountered is extracted.
  ##
proc SetScalarsNameVectorsName*(this: var vtkDataReader; _arg: cstring) {.
    importcpp: "SetScalarsNameVectorsName", header: "vtkDataReader.h".}
proc GetInputStringHeaderScalarsNameVectorsName*(this: var vtkDataReader): cstring {.
    importcpp: "GetInputStringHeaderScalarsNameVectorsName",
    header: "vtkDataReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the name of the tensor data to extract. If not specified, first
  ##  tensor data encountered is extracted.
  ##
proc SetScalarsNameVectorsNameTensorsName*(this: var vtkDataReader; _arg: cstring) {.
    importcpp: "SetScalarsNameVectorsNameTensorsName", header: "vtkDataReader.h".}
proc GetInputStringHeaderScalarsNameVectorsNameTensorsName*(
    this: var vtkDataReader): cstring {.importcpp: "GetInputStringHeaderScalarsNameVectorsNameTensorsName",
                                    header: "vtkDataReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the name of the normal data to extract. If not specified, first
  ##  normal data encountered is extracted.
  ##
proc SetScalarsNameVectorsNameTensorsNameNormalsName*(this: var vtkDataReader;
    _arg: cstring) {.importcpp: "SetScalarsNameVectorsNameTensorsNameNormalsName",
                   header: "vtkDataReader.h".}
proc GetInputStringHeaderScalarsNameVectorsNameTensorsNameNormalsName*(
    this: var vtkDataReader): cstring {.importcpp: "GetInputStringHeaderScalarsNameVectorsNameTensorsNameNormalsName",
                                    header: "vtkDataReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the name of the texture coordinate data to extract. If not specified,
  ##  first texture coordinate data encountered is extracted.
  ##
proc SetScalarsNameVectorsNameTensorsNameNormalsNameTCoordsName*(
    this: var vtkDataReader; _arg: cstring) {.
    importcpp: "SetScalarsNameVectorsNameTensorsNameNormalsNameTCoordsName",
    header: "vtkDataReader.h".}
proc GetInputStringHeaderScalarsNameVectorsNameTensorsNameNormalsNameTCoordsName*(
    this: var vtkDataReader): cstring {.importcpp: "GetInputStringHeaderScalarsNameVectorsNameTensorsNameNormalsNameTCoordsName",
                                    header: "vtkDataReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the name of the lookup table data to extract. If not specified, uses
  ##  lookup table named by scalar. Otherwise, this specification supersedes.
  ##
proc SetScalarsNameVectorsNameTensorsNameNormalsNameTCoordsNameLookupTableName*(
    this: var vtkDataReader; _arg: cstring) {.importcpp: "SetScalarsNameVectorsNameTensorsNameNormalsNameTCoordsNameLookupTableName",
    header: "vtkDataReader.h".}
proc GetInputStringHeaderScalarsNameVectorsNameTensorsNameNormalsNameTCoordsNameLookupTableName*(
    this: var vtkDataReader): cstring {.importcpp: "GetInputStringHeaderScalarsNameVectorsNameTensorsNameNormalsNameTCoordsNameLookupTableName",
                                    header: "vtkDataReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the name of the field data to extract. If not specified, uses
  ##  first field data encountered in file.
  ##
proc SetScalarsNameVectorsNameTensorsNameNormalsNameTCoordsNameLookupTableNameFieldDataName*(
    this: var vtkDataReader; _arg: cstring) {.importcpp: "SetScalarsNameVectorsNameTensorsNameNormalsNameTCoordsNameLookupTableNameFieldDataName",
    header: "vtkDataReader.h".}
proc GetInputStringHeaderScalarsNameVectorsNameTensorsNameNormalsNameTCoordsNameLookupTableNameFieldDataName*(
    this: var vtkDataReader): cstring {.importcpp: "GetInputStringHeaderScalarsNameVectorsNameTensorsNameNormalsNameTCoordsNameLookupTableNameFieldDataName",
                                    header: "vtkDataReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Enable reading all scalars.
  ##
proc SetReadFromInputStringReadAllScalars*(this: var vtkDataReader;
    _arg: vtkTypeBool) {.importcpp: "SetReadFromInputStringReadAllScalars",
                       header: "vtkDataReader.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetFileVersionFileMajorVersionFileMinorVersionInputStringLengthReadFromInputStringFileTypeReadAllScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReadAllScalars  of  << this -> ReadAllScalars ) ; return this -> ReadAllScalars ; } ;
## Error: expected ';'!!!

proc ReadAllScalarsOn*(this: var vtkDataReader) {.importcpp: "ReadAllScalarsOn",
    header: "vtkDataReader.h".}
proc ReadAllScalarsOff*(this: var vtkDataReader) {.importcpp: "ReadAllScalarsOff",
    header: "vtkDataReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Enable reading all vectors.
  ##
proc SetReadFromInputStringReadAllScalarsReadAllVectors*(this: var vtkDataReader;
    _arg: vtkTypeBool) {.importcpp: "SetReadFromInputStringReadAllScalarsReadAllVectors",
                       header: "vtkDataReader.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetFileVersionFileMajorVersionFileMinorVersionInputStringLengthReadFromInputStringFileTypeReadAllScalarsReadAllVectors ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReadAllVectors  of  << this -> ReadAllVectors ) ; return this -> ReadAllVectors ; } ;
## Error: expected ';'!!!

proc ReadAllVectorsOn*(this: var vtkDataReader) {.importcpp: "ReadAllVectorsOn",
    header: "vtkDataReader.h".}
proc ReadAllVectorsOff*(this: var vtkDataReader) {.importcpp: "ReadAllVectorsOff",
    header: "vtkDataReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Enable reading all normals.
  ##
proc SetReadFromInputStringReadAllScalarsReadAllVectorsReadAllNormals*(
    this: var vtkDataReader; _arg: vtkTypeBool) {.importcpp: "SetReadFromInputStringReadAllScalarsReadAllVectorsReadAllNormals",
    header: "vtkDataReader.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetFileVersionFileMajorVersionFileMinorVersionInputStringLengthReadFromInputStringFileTypeReadAllScalarsReadAllVectorsReadAllNormals ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReadAllNormals  of  << this -> ReadAllNormals ) ; return this -> ReadAllNormals ; } ;
## Error: expected ';'!!!

proc ReadAllNormalsOn*(this: var vtkDataReader) {.importcpp: "ReadAllNormalsOn",
    header: "vtkDataReader.h".}
proc ReadAllNormalsOff*(this: var vtkDataReader) {.importcpp: "ReadAllNormalsOff",
    header: "vtkDataReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Enable reading all tensors.
  ##
proc SetReadFromInputStringReadAllScalarsReadAllVectorsReadAllNormalsReadAllTensors*(
    this: var vtkDataReader; _arg: vtkTypeBool) {.importcpp: "SetReadFromInputStringReadAllScalarsReadAllVectorsReadAllNormalsReadAllTensors",
    header: "vtkDataReader.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetFileVersionFileMajorVersionFileMinorVersionInputStringLengthReadFromInputStringFileTypeReadAllScalarsReadAllVectorsReadAllNormalsReadAllTensors ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReadAllTensors  of  << this -> ReadAllTensors ) ; return this -> ReadAllTensors ; } ;
## Error: expected ';'!!!

proc ReadAllTensorsOn*(this: var vtkDataReader) {.importcpp: "ReadAllTensorsOn",
    header: "vtkDataReader.h".}
proc ReadAllTensorsOff*(this: var vtkDataReader) {.importcpp: "ReadAllTensorsOff",
    header: "vtkDataReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Enable reading all color scalars.
  ##
proc SetReadFromInputStringReadAllScalarsReadAllVectorsReadAllNormalsReadAllTensorsReadAllColorScalars*(
    this: var vtkDataReader; _arg: vtkTypeBool) {.importcpp: "SetReadFromInputStringReadAllScalarsReadAllVectorsReadAllNormalsReadAllTensorsReadAllColorScalars",
    header: "vtkDataReader.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetFileVersionFileMajorVersionFileMinorVersionInputStringLengthReadFromInputStringFileTypeReadAllScalarsReadAllVectorsReadAllNormalsReadAllTensorsReadAllColorScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReadAllColorScalars  of  << this -> ReadAllColorScalars ) ; return this -> ReadAllColorScalars ; } ;
## Error: expected ';'!!!

proc ReadAllColorScalarsOn*(this: var vtkDataReader) {.
    importcpp: "ReadAllColorScalarsOn", header: "vtkDataReader.h".}
proc ReadAllColorScalarsOff*(this: var vtkDataReader) {.
    importcpp: "ReadAllColorScalarsOff", header: "vtkDataReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Enable reading all tcoords.
  ##
proc SetReadFromInputStringReadAllScalarsReadAllVectorsReadAllNormalsReadAllTensorsReadAllColorScalarsReadAllTCoords*(
    this: var vtkDataReader; _arg: vtkTypeBool) {.importcpp: "SetReadFromInputStringReadAllScalarsReadAllVectorsReadAllNormalsReadAllTensorsReadAllColorScalarsReadAllTCoords",
    header: "vtkDataReader.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetFileVersionFileMajorVersionFileMinorVersionInputStringLengthReadFromInputStringFileTypeReadAllScalarsReadAllVectorsReadAllNormalsReadAllTensorsReadAllColorScalarsReadAllTCoords ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReadAllTCoords  of  << this -> ReadAllTCoords ) ; return this -> ReadAllTCoords ; } ;
## Error: expected ';'!!!

proc ReadAllTCoordsOn*(this: var vtkDataReader) {.importcpp: "ReadAllTCoordsOn",
    header: "vtkDataReader.h".}
proc ReadAllTCoordsOff*(this: var vtkDataReader) {.importcpp: "ReadAllTCoordsOff",
    header: "vtkDataReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Enable reading all fields.
  ##
proc SetReadFromInputStringReadAllScalarsReadAllVectorsReadAllNormalsReadAllTensorsReadAllColorScalarsReadAllTCoordsReadAllFields*(
    this: var vtkDataReader; _arg: vtkTypeBool) {.importcpp: "SetReadFromInputStringReadAllScalarsReadAllVectorsReadAllNormalsReadAllTensorsReadAllColorScalarsReadAllTCoordsReadAllFields",
    header: "vtkDataReader.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetFileVersionFileMajorVersionFileMinorVersionInputStringLengthReadFromInputStringFileTypeReadAllScalarsReadAllVectorsReadAllNormalsReadAllTensorsReadAllColorScalarsReadAllTCoordsReadAllFields ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReadAllFields  of  << this -> ReadAllFields ) ; return this -> ReadAllFields ; } ;
## Error: expected ';'!!!

proc ReadAllFieldsOn*(this: var vtkDataReader) {.importcpp: "ReadAllFieldsOn",
    header: "vtkDataReader.h".}
proc ReadAllFieldsOff*(this: var vtkDataReader) {.importcpp: "ReadAllFieldsOff",
    header: "vtkDataReader.h".}
  ## /@}
  ## *
  ##  Open a vtk data file. Returns zero if error.
  ##
## !!!Ignored construct:  int OpenVTKFile ( VTK_FILEPATH const char * fname = nullptr ) ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  *
##  Read the header of a vtk data file. Returns 0 if error.
##  int ReadHeader ( VTK_FILEPATH const char * fname = nullptr ) ;
## Error: token expected: ) but got: *!!!

proc ReadCellData*(this: var vtkDataReader; ds: ptr vtkDataSet; numCells: vtkIdType): cint {.
    importcpp: "ReadCellData", header: "vtkDataReader.h".}
proc ReadPointData*(this: var vtkDataReader; ds: ptr vtkDataSet; numPts: vtkIdType): cint {.
    importcpp: "ReadPointData", header: "vtkDataReader.h".}
proc ReadPointCoordinates*(this: var vtkDataReader; ps: ptr vtkPointSet;
                          numPts: vtkIdType): cint {.
    importcpp: "ReadPointCoordinates", header: "vtkDataReader.h".}
proc ReadPointCoordinates*(this: var vtkDataReader; g: ptr vtkGraph; numPts: vtkIdType): cint {.
    importcpp: "ReadPointCoordinates", header: "vtkDataReader.h".}
proc ReadVertexData*(this: var vtkDataReader; g: ptr vtkGraph; numVertices: vtkIdType): cint {.
    importcpp: "ReadVertexData", header: "vtkDataReader.h".}
proc ReadEdgeData*(this: var vtkDataReader; g: ptr vtkGraph; numEdges: vtkIdType): cint {.
    importcpp: "ReadEdgeData", header: "vtkDataReader.h".}
proc ReadRowData*(this: var vtkDataReader; t: ptr vtkTable; numEdges: vtkIdType): cint {.
    importcpp: "ReadRowData", header: "vtkDataReader.h".}
proc ReadCells*(this: var vtkDataReader;
               cellArray: var vtkSmartPointer[vtkCellArray]): cint {.
    importcpp: "ReadCells", header: "vtkDataReader.h".}
proc ReadCellsLegacy*(this: var vtkDataReader; size: vtkIdType; data: ptr cint): cint {.
    importcpp: "ReadCellsLegacy", header: "vtkDataReader.h".}
proc ReadCellsLegacy*(this: var vtkDataReader; size: vtkIdType; data: ptr cint;
                     skip1: cint; read2: cint; skip3: cint): cint {.
    importcpp: "ReadCellsLegacy", header: "vtkDataReader.h".}
proc ReadCoordinates*(this: var vtkDataReader; rg: ptr vtkRectilinearGrid; axes: cint;
                     numCoords: cint): cint {.importcpp: "ReadCoordinates",
    header: "vtkDataReader.h".}
proc ReadArray*(this: var vtkDataReader; dataType: cstring; numTuples: vtkIdType;
               numComp: vtkIdType): ptr vtkAbstractArray {.importcpp: "ReadArray",
    header: "vtkDataReader.h".}
proc ReadFieldData*(this: var vtkDataReader;
                   fieldType: vtkDataReaderFieldType = FIELD_DATA): ptr vtkFieldData {.
    importcpp: "ReadFieldData", header: "vtkDataReader.h".}
proc Read*(this: var vtkDataReader; a2: cstring): cint {.importcpp: "Read",
    header: "vtkDataReader.h".}
proc Read*(this: var vtkDataReader; a2: ptr cuchar): cint {.importcpp: "Read",
    header: "vtkDataReader.h".}
proc Read*(this: var vtkDataReader; a2: ptr cshort): cint {.importcpp: "Read",
    header: "vtkDataReader.h".}
proc Read*(this: var vtkDataReader; a2: ptr cushort): cint {.importcpp: "Read",
    header: "vtkDataReader.h".}
proc Read*(this: var vtkDataReader; a2: ptr cint): cint {.importcpp: "Read",
    header: "vtkDataReader.h".}
proc Read*(this: var vtkDataReader; a2: ptr cuint): cint {.importcpp: "Read",
    header: "vtkDataReader.h".}
proc Read*(this: var vtkDataReader; a2: ptr clong): cint {.importcpp: "Read",
    header: "vtkDataReader.h".}
proc Read*(this: var vtkDataReader; a2: ptr culong): cint {.importcpp: "Read",
    header: "vtkDataReader.h".}
proc Read*(this: var vtkDataReader; result: ptr clonglong): cint {.importcpp: "Read",
    header: "vtkDataReader.h".}
proc Read*(this: var vtkDataReader; result: ptr culonglong): cint {.importcpp: "Read",
    header: "vtkDataReader.h".}
proc Read*(this: var vtkDataReader; a2: ptr cfloat): cint {.importcpp: "Read",
    header: "vtkDataReader.h".}
proc Read*(this: var vtkDataReader; a2: ptr cdouble): cint {.importcpp: "Read",
    header: "vtkDataReader.h".}
proc Peek*(this: var vtkDataReader; str: cstring; n: csize_t): csize_t {.
    importcpp: "Peek", header: "vtkDataReader.h".}
proc CloseVTKFile*(this: var vtkDataReader) {.importcpp: "CloseVTKFile",
    header: "vtkDataReader.h".}
proc ReadLine*(this: var vtkDataReader; result: array[256, char]): cint {.
    importcpp: "ReadLine", header: "vtkDataReader.h".}
proc ReadString*(this: var vtkDataReader; result: array[256, char]): cint {.
    importcpp: "ReadString", header: "vtkDataReader.h".}
proc LowerCase*(this: var vtkDataReader; str: cstring; len: csize_t = 256): cstring {.
    importcpp: "LowerCase", header: "vtkDataReader.h".}
proc GetIStream*(this: var vtkDataReader): ptr istream {.importcpp: "GetIStream",
    header: "vtkDataReader.h".}
proc ReadTimeDependentMetaData*(this: var vtkDataReader; timestep: cint;
                               metadata: ptr vtkInformation): cint {.
    importcpp: "ReadTimeDependentMetaData", header: "vtkDataReader.h".}
proc ReadMesh*(this: var vtkDataReader; piece: cint; npieces: cint; nghosts: cint;
              timestep: cint; output: ptr vtkDataObject): cint {.
    importcpp: "ReadMesh", header: "vtkDataReader.h".}
proc ReadPoints*(this: var vtkDataReader; a2: cint; a3: cint; a4: cint; a5: cint; a6: ptr vtkDataObject): cint {.
    importcpp: "ReadPoints", header: "vtkDataReader.h".}
  ## output
proc ReadArrays*(this: var vtkDataReader; a2: cint; a3: cint; a4: cint; a5: cint; a6: ptr vtkDataObject): cint {.
    importcpp: "ReadArrays", header: "vtkDataReader.h".}
  ## output
## !!!Ignored construct:  /@} /@{ *
##  Overridden with default implementation of doing nothing
##  so that subclasses only override what is needed (usually
##  only ReadMesh).
##  int ReadMeshSimple ( VTK_FILEPATH const std :: string & fname , vtkDataObject * output ) override { return 1 ; } int ReadPointsSimple ( VTK_FILEPATH const std :: string & fname , vtkDataObject * output ) override { return 1 ; } int ReadArraysSimple ( VTK_FILEPATH const std :: string & fname , vtkDataObject * output ) override { return 1 ; } /@} protected : vtkDataReader ( ) ;
## Error: token expected: ) but got: ::!!!

proc destroyvtkDataReader*(this: var vtkDataReader) {.
    importcpp: "#.~vtkDataReader()", header: "vtkDataReader.h".}
proc SetScalarLut*(this: var vtkDataReader; lut: cstring) {.importcpp: "SetScalarLut",
    header: "vtkDataReader.h".}
proc GetInputStringHeaderScalarsNameVectorsNameTensorsNameNormalsNameTCoordsNameLookupTableNameFieldDataNameScalarLut*(
    this: var vtkDataReader): cstring {.importcpp: "GetInputStringHeaderScalarsNameVectorsNameTensorsNameNormalsNameTCoordsNameLookupTableNameFieldDataNameScalarLut",
                                    header: "vtkDataReader.h".}
proc ReadScalarData*(this: var vtkDataReader; a: ptr vtkDataSetAttributes;
                    num: vtkIdType): cint {.importcpp: "ReadScalarData",
    header: "vtkDataReader.h".}
proc ReadVectorData*(this: var vtkDataReader; a: ptr vtkDataSetAttributes;
                    num: vtkIdType): cint {.importcpp: "ReadVectorData",
    header: "vtkDataReader.h".}
proc ReadNormalData*(this: var vtkDataReader; a: ptr vtkDataSetAttributes;
                    num: vtkIdType): cint {.importcpp: "ReadNormalData",
    header: "vtkDataReader.h".}
proc ReadTensorData*(this: var vtkDataReader; a: ptr vtkDataSetAttributes;
                    num: vtkIdType; numComp: vtkIdType = 9): cint {.
    importcpp: "ReadTensorData", header: "vtkDataReader.h".}
proc ReadCoScalarData*(this: var vtkDataReader; a: ptr vtkDataSetAttributes;
                      num: vtkIdType): cint {.importcpp: "ReadCoScalarData",
    header: "vtkDataReader.h".}
proc ReadLutData*(this: var vtkDataReader; a: ptr vtkDataSetAttributes): cint {.
    importcpp: "ReadLutData", header: "vtkDataReader.h".}
proc ReadTCoordsData*(this: var vtkDataReader; a: ptr vtkDataSetAttributes;
                     num: vtkIdType): cint {.importcpp: "ReadTCoordsData",
    header: "vtkDataReader.h".}
proc ReadGlobalIds*(this: var vtkDataReader; a: ptr vtkDataSetAttributes;
                   num: vtkIdType): cint {.importcpp: "ReadGlobalIds",
                                        header: "vtkDataReader.h".}
proc ReadPedigreeIds*(this: var vtkDataReader; a: ptr vtkDataSetAttributes;
                     num: vtkIdType): cint {.importcpp: "ReadPedigreeIds",
    header: "vtkDataReader.h".}
proc ReadEdgeFlags*(this: var vtkDataReader; a: ptr vtkDataSetAttributes;
                   num: vtkIdType): cint {.importcpp: "ReadEdgeFlags",
                                        header: "vtkDataReader.h".}
proc ReadInformation*(this: var vtkDataReader; info: ptr vtkInformation;
                     numKeys: vtkIdType): cint {.importcpp: "ReadInformation",
    header: "vtkDataReader.h".}
proc ReadDataSetData*(this: var vtkDataReader; ds: ptr vtkDataSet): cint {.
    importcpp: "ReadDataSetData", header: "vtkDataReader.h".}
proc InitializeCharacteristics*(this: var vtkDataReader) {.
    importcpp: "InitializeCharacteristics", header: "vtkDataReader.h".}
proc CharacterizeFile*(this: var vtkDataReader): cint {.
    importcpp: "CharacterizeFile", header: "vtkDataReader.h".}
proc CheckFor*(this: var vtkDataReader; name: cstring; line: cstring; num: var cint;
              array: cstringArray; allocSize: var cint) {.importcpp: "CheckFor",
    header: "vtkDataReader.h".}
proc DecodeString*(this: var vtkDataReader; resname: cstring; name: cstring): cint {.
    importcpp: "DecodeString", header: "vtkDataReader.h".}