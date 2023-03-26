## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGenericEnSightReader.h
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
##  @class   vtkGenericEnSightReader
##  @brief   class to read any type of EnSight files
##
##  The class vtkGenericEnSightReader allows the user to read an EnSight data
##  set without a priori knowledge of what type of EnSight data set it is.
##

import
  vtkIOEnSightModule, vtkMultiBlockDataSetAlgorithm

discard "forward decl of vtkCallbackCommand"
discard "forward decl of vtkDataArrayCollection"
discard "forward decl of vtkDataArraySelection"
discard "forward decl of vtkIdListCollection"
discard "forward decl of TranslationTableType"
type
  EnsightReaderCellIdMode* {.size: sizeof(cint),
                            importcpp: "EnsightReaderCellIdMode",
                            header: "vtkGenericEnSightReader.h".} = enum
    SINGLE_PROCESS_MODE, SPARSE_MODE, NON_SPARSE_MODE, IMPLICIT_STRUCTURED_MODE


type
  vtkGenericEnSightReader* {.importcpp: "vtkGenericEnSightReader",
                            header: "vtkGenericEnSightReader.h", bycopy.} = object of vtkMultiBlockDataSetAlgorithm
    vtkGenericEnSightReader* {.importc: "vtkGenericEnSightReader".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    ##  array of types (one entry per instance of variable type in case file)
    ##  pointers to lists of descriptions
    ##  number of file names / descriptions per type
    ##  Flag for whether TimeValue has been set.
    ##  The EnSight file version being read.  Valid after
    ##  UpdateInformation.  Value is -1 for unknown version.
    ##  The array selections.  These map over the variables and complex
    ##  variables to hide the details of EnSight behind VTK terminology.
    ##  The observer to modify this object when the array selections are
    ##  modified.
    ##  Whether the SelectionModified callback should invoke Modified.
    ##  This is used when we are copying to/from the internal reader.
    ##  Insert a partId and return the 'realId' that should be used.


proc New*(): ptr vtkGenericEnSightReader {.importcpp: "vtkGenericEnSightReader::New(@)",
                                       header: "vtkGenericEnSightReader.h".}
type
  vtkGenericEnSightReaderSuperclass* = vtkMultiBlockDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGenericEnSightReader::IsTypeOf(@)",
    header: "vtkGenericEnSightReader.h".}
proc IsA*(this: var vtkGenericEnSightReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkGenericEnSightReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGenericEnSightReader {.
    importcpp: "vtkGenericEnSightReader::SafeDownCast(@)",
    header: "vtkGenericEnSightReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGenericEnSightReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMultiBlockDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGenericEnSightReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGenericEnSightReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGenericEnSightReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGenericEnSightReader.h".}
## !!!Ignored construct:  /@{ *
##  Set/Get the Case file name.
##  void SetCaseFileName ( VTK_FILEPATH const char * fileName ) ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetCaseFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CaseFileName  of  << ( this -> CaseFileName ? this -> CaseFileName : (null) ) ) ; return this -> CaseFileName ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Set/Get the file path.
##  virtual void SetFilePathFilePath ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FilePath  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FilePath == nullptr && _arg == nullptr ) { return ; } if ( this -> FilePath && _arg && ( ! strcmp ( this -> FilePath , _arg ) ) ) { return ; } delete [ ] this -> FilePath ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FilePath = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FilePath = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetCaseFileNameFilePath ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FilePath  of  << ( this -> FilePath ? this -> FilePath : (null) ) ) ; return this -> FilePath ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get the EnSight file version being read.
##  virtual int GetEnSightVersionEnSightVersion ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EnSightVersion  of  << this -> EnSightVersion ) ; return this -> EnSightVersion ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get the number of variables listed in the case file.
##  virtual int GetEnSightVersionEnSightVersionNumberOfVariablesNumberOfVariables ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfVariables  of  << this -> NumberOfVariables ) ; return this -> NumberOfVariables ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual int GetEnSightVersionEnSightVersionNumberOfVariablesNumberOfVariablesNumberOfComplexVariables ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfComplexVariables  of  << this -> NumberOfComplexVariables ) ; return this -> NumberOfComplexVariables ; } ;
## Error: expected ';'!!!

proc GetNumberOfVariables*(this: var vtkGenericEnSightReader; `type`: cint): cint {.
    importcpp: "GetNumberOfVariables", header: "vtkGenericEnSightReader.h".}
## !!!Ignored construct:   returns -1 if unknown type specified virtual int GetEnSightVersionEnSightVersionNumberOfVariablesNumberOfVariablesNumberOfComplexVariablesNumberOfScalarsPerNodeNumberOfScalarsPerNode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfScalarsPerNode  of  << this -> NumberOfScalarsPerNode ) ; return this -> NumberOfScalarsPerNode ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual int GetEnSightVersionEnSightVersionNumberOfVariablesNumberOfVariablesNumberOfComplexVariablesNumberOfScalarsPerNodeNumberOfScalarsPerNodeNumberOfVectorsPerNode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfVectorsPerNode  of  << this -> NumberOfVectorsPerNode ) ; return this -> NumberOfVectorsPerNode ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual int GetEnSightVersionEnSightVersionNumberOfVariablesNumberOfVariablesNumberOfComplexVariablesNumberOfScalarsPerNodeNumberOfScalarsPerNodeNumberOfVectorsPerNodeNumberOfTensorsAsymPerNode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfTensorsAsymPerNode  of  << this -> NumberOfTensorsAsymPerNode ) ; return this -> NumberOfTensorsAsymPerNode ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual int GetEnSightVersionEnSightVersionNumberOfVariablesNumberOfVariablesNumberOfComplexVariablesNumberOfScalarsPerNodeNumberOfScalarsPerNodeNumberOfVectorsPerNodeNumberOfTensorsAsymPerNodeNumberOfTensorsSymmPerNode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfTensorsSymmPerNode  of  << this -> NumberOfTensorsSymmPerNode ) ; return this -> NumberOfTensorsSymmPerNode ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual int GetEnSightVersionEnSightVersionNumberOfVariablesNumberOfVariablesNumberOfComplexVariablesNumberOfScalarsPerNodeNumberOfScalarsPerNodeNumberOfVectorsPerNodeNumberOfTensorsAsymPerNodeNumberOfTensorsSymmPerNodeNumberOfScalarsPerElement ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfScalarsPerElement  of  << this -> NumberOfScalarsPerElement ) ; return this -> NumberOfScalarsPerElement ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual int GetEnSightVersionEnSightVersionNumberOfVariablesNumberOfVariablesNumberOfComplexVariablesNumberOfScalarsPerNodeNumberOfScalarsPerNodeNumberOfVectorsPerNodeNumberOfTensorsAsymPerNodeNumberOfTensorsSymmPerNodeNumberOfScalarsPerElementNumberOfVectorsPerElement ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfVectorsPerElement  of  << this -> NumberOfVectorsPerElement ) ; return this -> NumberOfVectorsPerElement ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual int GetEnSightVersionEnSightVersionNumberOfVariablesNumberOfVariablesNumberOfComplexVariablesNumberOfScalarsPerNodeNumberOfScalarsPerNodeNumberOfVectorsPerNodeNumberOfTensorsAsymPerNodeNumberOfTensorsSymmPerNodeNumberOfScalarsPerElementNumberOfVectorsPerElementNumberOfTensorsAsymPerElement ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfTensorsAsymPerElement  of  << this -> NumberOfTensorsAsymPerElement ) ; return this -> NumberOfTensorsAsymPerElement ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual int GetEnSightVersionEnSightVersionNumberOfVariablesNumberOfVariablesNumberOfComplexVariablesNumberOfScalarsPerNodeNumberOfScalarsPerNodeNumberOfVectorsPerNodeNumberOfTensorsAsymPerNodeNumberOfTensorsSymmPerNodeNumberOfScalarsPerElementNumberOfVectorsPerElementNumberOfTensorsAsymPerElementNumberOfTensorsSymmPerElement ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfTensorsSymmPerElement  of  << this -> NumberOfTensorsSymmPerElement ) ; return this -> NumberOfTensorsSymmPerElement ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual int GetEnSightVersionEnSightVersionNumberOfVariablesNumberOfVariablesNumberOfComplexVariablesNumberOfScalarsPerNodeNumberOfScalarsPerNodeNumberOfVectorsPerNodeNumberOfTensorsAsymPerNodeNumberOfTensorsSymmPerNodeNumberOfScalarsPerElementNumberOfVectorsPerElementNumberOfTensorsAsymPerElementNumberOfTensorsSymmPerElementNumberOfScalarsPerMeasuredNode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfScalarsPerMeasuredNode  of  << this -> NumberOfScalarsPerMeasuredNode ) ; return this -> NumberOfScalarsPerMeasuredNode ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual int GetEnSightVersionEnSightVersionNumberOfVariablesNumberOfVariablesNumberOfComplexVariablesNumberOfScalarsPerNodeNumberOfScalarsPerNodeNumberOfVectorsPerNodeNumberOfTensorsAsymPerNodeNumberOfTensorsSymmPerNodeNumberOfScalarsPerElementNumberOfVectorsPerElementNumberOfTensorsAsymPerElementNumberOfTensorsSymmPerElementNumberOfScalarsPerMeasuredNodeNumberOfVectorsPerMeasuredNode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfVectorsPerMeasuredNode  of  << this -> NumberOfVectorsPerMeasuredNode ) ; return this -> NumberOfVectorsPerMeasuredNode ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual int GetEnSightVersionEnSightVersionNumberOfVariablesNumberOfVariablesNumberOfComplexVariablesNumberOfScalarsPerNodeNumberOfScalarsPerNodeNumberOfVectorsPerNodeNumberOfTensorsAsymPerNodeNumberOfTensorsSymmPerNodeNumberOfScalarsPerElementNumberOfVectorsPerElementNumberOfTensorsAsymPerElementNumberOfTensorsSymmPerElementNumberOfScalarsPerMeasuredNodeNumberOfVectorsPerMeasuredNodeNumberOfComplexScalarsPerNode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfComplexScalarsPerNode  of  << this -> NumberOfComplexScalarsPerNode ) ; return this -> NumberOfComplexScalarsPerNode ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual int GetEnSightVersionEnSightVersionNumberOfVariablesNumberOfVariablesNumberOfComplexVariablesNumberOfScalarsPerNodeNumberOfScalarsPerNodeNumberOfVectorsPerNodeNumberOfTensorsAsymPerNodeNumberOfTensorsSymmPerNodeNumberOfScalarsPerElementNumberOfVectorsPerElementNumberOfTensorsAsymPerElementNumberOfTensorsSymmPerElementNumberOfScalarsPerMeasuredNodeNumberOfVectorsPerMeasuredNodeNumberOfComplexScalarsPerNodeNumberOfComplexVectorsPerNode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfComplexVectorsPerNode  of  << this -> NumberOfComplexVectorsPerNode ) ; return this -> NumberOfComplexVectorsPerNode ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual int GetEnSightVersionEnSightVersionNumberOfVariablesNumberOfVariablesNumberOfComplexVariablesNumberOfScalarsPerNodeNumberOfScalarsPerNodeNumberOfVectorsPerNodeNumberOfTensorsAsymPerNodeNumberOfTensorsSymmPerNodeNumberOfScalarsPerElementNumberOfVectorsPerElementNumberOfTensorsAsymPerElementNumberOfTensorsSymmPerElementNumberOfScalarsPerMeasuredNodeNumberOfVectorsPerMeasuredNodeNumberOfComplexScalarsPerNodeNumberOfComplexVectorsPerNodeNumberOfComplexScalarsPerElement ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfComplexScalarsPerElement  of  << this -> NumberOfComplexScalarsPerElement ) ; return this -> NumberOfComplexScalarsPerElement ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual int GetEnSightVersionEnSightVersionNumberOfVariablesNumberOfVariablesNumberOfComplexVariablesNumberOfScalarsPerNodeNumberOfScalarsPerNodeNumberOfVectorsPerNodeNumberOfTensorsAsymPerNodeNumberOfTensorsSymmPerNodeNumberOfScalarsPerElementNumberOfVectorsPerElementNumberOfTensorsAsymPerElementNumberOfTensorsSymmPerElementNumberOfScalarsPerMeasuredNodeNumberOfVectorsPerMeasuredNodeNumberOfComplexScalarsPerNodeNumberOfComplexVectorsPerNodeNumberOfComplexScalarsPerElementNumberOfComplexVectorsPerElement ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfComplexVectorsPerElement  of  << this -> NumberOfComplexVectorsPerElement ) ; return this -> NumberOfComplexVectorsPerElement ; } ;
## Error: expected ';'!!!

proc GetDescription*(this: var vtkGenericEnSightReader; n: cint): cstring {.
    importcpp: "GetDescription", header: "vtkGenericEnSightReader.h".}
proc GetComplexDescription*(this: var vtkGenericEnSightReader; n: cint): cstring {.
    importcpp: "GetComplexDescription", header: "vtkGenericEnSightReader.h".}
proc GetDescription*(this: var vtkGenericEnSightReader; n: cint; `type`: cint): cstring {.
    importcpp: "GetDescription", header: "vtkGenericEnSightReader.h".}
proc GetVariableType*(this: var vtkGenericEnSightReader; n: cint): cint {.
    importcpp: "GetVariableType", header: "vtkGenericEnSightReader.h".}
proc GetComplexVariableType*(this: var vtkGenericEnSightReader; n: cint): cint {.
    importcpp: "GetComplexVariableType", header: "vtkGenericEnSightReader.h".}
proc SetTimeValue*(this: var vtkGenericEnSightReader; value: cfloat) {.
    importcpp: "SetTimeValue", header: "vtkGenericEnSightReader.h".}
## !!!Ignored construct:  virtual float GetEnSightVersionEnSightVersionNumberOfVariablesNumberOfVariablesNumberOfComplexVariablesNumberOfScalarsPerNodeNumberOfScalarsPerNodeNumberOfVectorsPerNodeNumberOfTensorsAsymPerNodeNumberOfTensorsSymmPerNodeNumberOfScalarsPerElementNumberOfVectorsPerElementNumberOfTensorsAsymPerElementNumberOfTensorsSymmPerElementNumberOfScalarsPerMeasuredNodeNumberOfVectorsPerMeasuredNodeNumberOfComplexScalarsPerNodeNumberOfComplexVectorsPerNodeNumberOfComplexScalarsPerElementNumberOfComplexVectorsPerElementTimeValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TimeValue  of  << this -> TimeValue ) ; return this -> TimeValue ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get the minimum or maximum time value for this data set.
##  virtual float GetEnSightVersionEnSightVersionNumberOfVariablesNumberOfVariablesNumberOfComplexVariablesNumberOfScalarsPerNodeNumberOfScalarsPerNodeNumberOfVectorsPerNodeNumberOfTensorsAsymPerNodeNumberOfTensorsSymmPerNodeNumberOfScalarsPerElementNumberOfVectorsPerElementNumberOfTensorsAsymPerElementNumberOfTensorsSymmPerElementNumberOfScalarsPerMeasuredNodeNumberOfVectorsPerMeasuredNodeNumberOfComplexScalarsPerNodeNumberOfComplexVectorsPerNodeNumberOfComplexScalarsPerElementNumberOfComplexVectorsPerElementTimeValueMinimumTimeValueMinimumTimeValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinimumTimeValue  of  << this -> MinimumTimeValue ) ; return this -> MinimumTimeValue ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual float GetEnSightVersionEnSightVersionNumberOfVariablesNumberOfVariablesNumberOfComplexVariablesNumberOfScalarsPerNodeNumberOfScalarsPerNodeNumberOfVectorsPerNodeNumberOfTensorsAsymPerNodeNumberOfTensorsSymmPerNodeNumberOfScalarsPerElementNumberOfVectorsPerElementNumberOfTensorsAsymPerElementNumberOfTensorsSymmPerElementNumberOfScalarsPerMeasuredNodeNumberOfVectorsPerMeasuredNodeNumberOfComplexScalarsPerNodeNumberOfComplexVectorsPerNodeNumberOfComplexScalarsPerElementNumberOfComplexVectorsPerElementTimeValueMinimumTimeValueMinimumTimeValueMaximumTimeValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumTimeValue  of  << this -> MaximumTimeValue ) ; return this -> MaximumTimeValue ; } ;
## Error: expected ';'!!!

proc GetnameTimeSets*(this: var vtkGenericEnSightReader): ptr vtkDataArrayCollection {.
    importcpp: "GetnameTimeSets", header: "vtkGenericEnSightReader.h".}
  ## /@}
  ## *
  ##  Reads the FORMAT part of the case file to determine whether this is an
  ##  EnSight6 or EnSightGold data set.  Returns an identifier listed in
  ##  the FileTypes enum or -1 if an error occurred or the file could not
  ##  be identified as any EnSight type.
  ##
proc DetermineEnSightVersion*(this: var vtkGenericEnSightReader; quiet: cint = 0): cint {.
    importcpp: "DetermineEnSightVersion", header: "vtkGenericEnSightReader.h".}
proc ReadAllVariablesOn*(this: var vtkGenericEnSightReader) {.
    importcpp: "ReadAllVariablesOn", header: "vtkGenericEnSightReader.h".}
proc ReadAllVariablesOff*(this: var vtkGenericEnSightReader) {.
    importcpp: "ReadAllVariablesOff", header: "vtkGenericEnSightReader.h".}
proc SetReadAllVariables*(this: var vtkGenericEnSightReader; _arg: vtkTypeBool) {.
    importcpp: "SetReadAllVariables", header: "vtkGenericEnSightReader.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetEnSightVersionEnSightVersionNumberOfVariablesNumberOfVariablesNumberOfComplexVariablesNumberOfScalarsPerNodeNumberOfScalarsPerNodeNumberOfVectorsPerNodeNumberOfTensorsAsymPerNodeNumberOfTensorsSymmPerNodeNumberOfScalarsPerElementNumberOfVectorsPerElementNumberOfTensorsAsymPerElementNumberOfTensorsSymmPerElementNumberOfScalarsPerMeasuredNodeNumberOfVectorsPerMeasuredNodeNumberOfComplexScalarsPerNodeNumberOfComplexVectorsPerNodeNumberOfComplexScalarsPerElementNumberOfComplexVectorsPerElementTimeValueMinimumTimeValueMinimumTimeValueMaximumTimeValueReadAllVariables ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReadAllVariables  of  << this -> ReadAllVariables ) ; return this -> ReadAllVariables ; } ;
## Error: expected ';'!!!

proc GetnameTimeSetsPointDataArraySelection*(this: var vtkGenericEnSightReader): ptr vtkDataArraySelection {.
    importcpp: "GetnameTimeSetsPointDataArraySelection",
    header: "vtkGenericEnSightReader.h".}
proc GetnameTimeSetsPointDataArraySelectionCellDataArraySelection*(
    this: var vtkGenericEnSightReader): ptr vtkDataArraySelection {.
    importcpp: "GetnameTimeSetsPointDataArraySelectionCellDataArraySelection",
    header: "vtkGenericEnSightReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the number of point or cell arrays available in the input.
  ##
proc GetNumberOfPointArrays*(this: var vtkGenericEnSightReader): cint {.
    importcpp: "GetNumberOfPointArrays", header: "vtkGenericEnSightReader.h".}
proc GetNumberOfCellArrays*(this: var vtkGenericEnSightReader): cint {.
    importcpp: "GetNumberOfCellArrays", header: "vtkGenericEnSightReader.h".}
proc GetPointArrayName*(this: var vtkGenericEnSightReader; index: cint): cstring {.
    importcpp: "GetPointArrayName", header: "vtkGenericEnSightReader.h".}
proc GetCellArrayName*(this: var vtkGenericEnSightReader; index: cint): cstring {.
    importcpp: "GetCellArrayName", header: "vtkGenericEnSightReader.h".}
proc GetPointArrayStatus*(this: var vtkGenericEnSightReader; name: cstring): cint {.
    importcpp: "GetPointArrayStatus", header: "vtkGenericEnSightReader.h".}
proc GetCellArrayStatus*(this: var vtkGenericEnSightReader; name: cstring): cint {.
    importcpp: "GetCellArrayStatus", header: "vtkGenericEnSightReader.h".}
proc SetPointArrayStatus*(this: var vtkGenericEnSightReader; name: cstring;
                         status: cint) {.importcpp: "SetPointArrayStatus",
                                       header: "vtkGenericEnSightReader.h".}
proc SetCellArrayStatus*(this: var vtkGenericEnSightReader; name: cstring;
                        status: cint) {.importcpp: "SetCellArrayStatus",
                                      header: "vtkGenericEnSightReader.h".}
type
  vtkGenericEnSightReaderFileTypes* {.size: sizeof(cint), importcpp: "vtkGenericEnSightReader::FileTypes",
                                     header: "vtkGenericEnSightReader.h".} = enum
    ENSIGHT_6 = 0, ENSIGHT_6_BINARY = 1, ENSIGHT_GOLD = 2, ENSIGHT_GOLD_BINARY = 3,
    ENSIGHT_MASTER_SERVER = 4


proc SetByteOrderToBigEndian*(this: var vtkGenericEnSightReader) {.
    importcpp: "SetByteOrderToBigEndian", header: "vtkGenericEnSightReader.h".}
proc SetByteOrderToLittleEndian*(this: var vtkGenericEnSightReader) {.
    importcpp: "SetByteOrderToLittleEndian", header: "vtkGenericEnSightReader.h".}
proc SetReadAllVariablesByteOrder*(this: var vtkGenericEnSightReader; _arg: cint) {.
    importcpp: "SetReadAllVariablesByteOrder", header: "vtkGenericEnSightReader.h".}
## !!!Ignored construct:  virtual int GetEnSightVersionEnSightVersionNumberOfVariablesNumberOfVariablesNumberOfComplexVariablesNumberOfScalarsPerNodeNumberOfScalarsPerNodeNumberOfVectorsPerNodeNumberOfTensorsAsymPerNodeNumberOfTensorsSymmPerNodeNumberOfScalarsPerElementNumberOfVectorsPerElementNumberOfTensorsAsymPerElementNumberOfTensorsSymmPerElementNumberOfScalarsPerMeasuredNodeNumberOfVectorsPerMeasuredNodeNumberOfComplexScalarsPerNodeNumberOfComplexVectorsPerNodeNumberOfComplexScalarsPerElementNumberOfComplexVectorsPerElementTimeValueMinimumTimeValueMinimumTimeValueMaximumTimeValueReadAllVariablesByteOrder ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ByteOrder  of  << this -> ByteOrder ) ; return this -> ByteOrder ; } ;
## Error: expected ';'!!!

proc GetByteOrderAsString*(this: var vtkGenericEnSightReader): cstring {.
    importcpp: "GetByteOrderAsString", header: "vtkGenericEnSightReader.h".}
const
  vtkGenericEnSightReaderFILE_BIG_ENDIAN* = 0
  vtkGenericEnSightReaderFILE_LITTLE_ENDIAN* = 1
  vtkGenericEnSightReaderFILE_UNKNOWN_ENDIAN* = 2

## !!!Ignored construct:  char * GetCaseFileNameFilePathGeometryFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GeometryFileName  of  << ( this -> GeometryFileName ? this -> GeometryFileName : (null) ) ) ; return this -> GeometryFileName ; } ;
## Error: expected ';'!!!

proc SetReadAllVariablesByteOrderParticleCoordinatesByIndex*(
    this: var vtkGenericEnSightReader; _arg: vtkTypeBool) {.
    importcpp: "SetReadAllVariablesByteOrderParticleCoordinatesByIndex",
    header: "vtkGenericEnSightReader.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetEnSightVersionEnSightVersionNumberOfVariablesNumberOfVariablesNumberOfComplexVariablesNumberOfScalarsPerNodeNumberOfScalarsPerNodeNumberOfVectorsPerNodeNumberOfTensorsAsymPerNodeNumberOfTensorsSymmPerNodeNumberOfScalarsPerElementNumberOfVectorsPerElementNumberOfTensorsAsymPerElementNumberOfTensorsSymmPerElementNumberOfScalarsPerMeasuredNodeNumberOfVectorsPerMeasuredNodeNumberOfComplexScalarsPerNodeNumberOfComplexVectorsPerNodeNumberOfComplexScalarsPerElementNumberOfComplexVectorsPerElementTimeValueMinimumTimeValueMinimumTimeValueMaximumTimeValueReadAllVariablesByteOrderParticleCoordinatesByIndex ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ParticleCoordinatesByIndex  of  << this -> ParticleCoordinatesByIndex ) ; return this -> ParticleCoordinatesByIndex ; } ;
## Error: expected ';'!!!

proc ParticleCoordinatesByIndexOn*(this: var vtkGenericEnSightReader) {.
    importcpp: "ParticleCoordinatesByIndexOn", header: "vtkGenericEnSightReader.h".}
proc ParticleCoordinatesByIndexOff*(this: var vtkGenericEnSightReader) {.
    importcpp: "ParticleCoordinatesByIndexOff",
    header: "vtkGenericEnSightReader.h".}
  ## /@}
  ## *
  ##  Returns true if the file pointed to by casefilename appears to be a
  ##  valid EnSight case file.
  ##
## !!!Ignored construct:  static bool IsEnSightFile ( VTK_FILEPATH const char * casefilename ) ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  *
##  Returns IsEnSightFile() by default, but can be overridden
##  virtual int CanReadFile ( VTK_FILEPATH const char * casefilename ) ;
## Error: token expected: ) but got: *!!!

proc GetReader*(this: var vtkGenericEnSightReader): ptr vtkGenericEnSightReader {.
    importcpp: "GetReader", header: "vtkGenericEnSightReader.h".}
## !!!Ignored construct:  /@{ *
##  Set the geometry file name.
##  virtual void SetFilePathFilePathGeometryFileNameGeometryFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << GeometryFileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> GeometryFileName == nullptr && _arg == nullptr ) { return ; } if ( this -> GeometryFileName && _arg && ( ! strcmp ( this -> GeometryFileName , _arg ) ) ) { return ; } delete [ ] this -> GeometryFileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> GeometryFileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> GeometryFileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!
