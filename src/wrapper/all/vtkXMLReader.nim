## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLReader.h
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
##  @class   vtkXMLReader
##  @brief   Superclass for VTK's XML format readers.
##
##  vtkXMLReader uses vtkXMLDataParser to parse a
##  <a href="http://www.vtk.org/Wiki/VTK_XML_Formats">VTK XML</a> input file.
##  Concrete subclasses then traverse the parsed file structure and extract data.
##

import
  vtkAlgorithm, vtkIOXMLModule, vtkSmartPointer

discard "forward decl of vtkAbstractArray"
discard "forward decl of vtkCallbackCommand"
discard "forward decl of vtkCommand"
discard "forward decl of vtkDataArray"
discard "forward decl of vtkDataArraySelection"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkDataSetAttributes"
discard "forward decl of vtkXMLDataElement"
discard "forward decl of vtkXMLDataParser"
discard "forward decl of vtkInformationVector"
discard "forward decl of vtkInformation"
discard "forward decl of vtkStringArray"
type
  vtkXMLReader* {.importcpp: "vtkXMLReader", header: "vtkXMLReader.h", bycopy.} = object of vtkAlgorithm ##  The stream used to read the input if it is in a file.
    vtkXMLReader* {.importc: "vtkXMLReader".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    ##  The FieldData element representation.
    ##  The input file's name.
    ##  The stream used to read the input.
    ##  Whether this object is reading from a string or a file.
    ##  Default is 0: read from file.
    ##  The input string.
    ##  The array selections.
    ## *
    ##  Name of the field-data array used to determine the time for the dataset
    ##  being read.
    ##
    ## *
    ##  Populated in `ReadXMLInformation` from the field data for the array chosen
    ##  using ActiveTimeDataArrayName, if any. `nullptr` otherwise.
    ##
    ##  The observer to modify this object when the array selections are
    ##  modified.
    ##  Whether there was an error reading the file in RequestInformation.
    ##  Whether there was an error reading the file in RequestData.
    ##  incrementally fine-tuned progress updates.
    ##  Whether there was an error reading the XML.
    ##  For structured data keep track of dimensions empty of cells.  For
    ##  unstructured data these are always zero.  This is used to support
    ##  1-D and 2-D cell data.
    ##  The timestep currently being read.
    ##  Store the range of time steps
    ##  Now we need to save what was the last time read for each kind of
    ##  data to avoid rereading it that is to say we need a var for
    ##  e.g. PointData/CellData/Points/Cells...
    ##  See SubClass for details with member vars like PointsTimeStep/PointsOffset
    ##  Helper function useful to know if a timestep is found in an array of timestep
    ##  The stream used to read the input if it is in a string.

  vtkXMLReaderSuperclass* = vtkAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkXMLReader::IsTypeOf(@)", header: "vtkXMLReader.h".}
proc IsA*(this: var vtkXMLReader; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkXMLReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkXMLReader {.
    importcpp: "vtkXMLReader::SafeDownCast(@)", header: "vtkXMLReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkXMLReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkXMLReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkXMLReader.h".}
type
  vtkXMLReaderFieldType* {.size: sizeof(cint),
                          importcpp: "vtkXMLReader::FieldType",
                          header: "vtkXMLReader.h".} = enum
    POINT_DATA, CELL_DATA, OTHER


## !!!Ignored construct:  /@{ *
##  Get/Set the name of the input file.
##  virtual void SetFileNameFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

proc SetReadFromInputString*(this: var vtkXMLReader; _arg: vtkTypeBool) {.
    importcpp: "SetReadFromInputString", header: "vtkXMLReader.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetReadFromInputString ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReadFromInputString  of  << this -> ReadFromInputString ) ; return this -> ReadFromInputString ; } ;
## Error: expected ';'!!!

proc ReadFromInputStringOn*(this: var vtkXMLReader) {.
    importcpp: "ReadFromInputStringOn", header: "vtkXMLReader.h".}
proc ReadFromInputStringOff*(this: var vtkXMLReader) {.
    importcpp: "ReadFromInputStringOff", header: "vtkXMLReader.h".}
proc SetInputString*(this: var vtkXMLReader; s: string) {.importcpp: "SetInputString",
    header: "vtkXMLReader.h".}
## !!!Ignored construct:  /@} *
##  Test whether the file (type) with the given name can be read by this
##  reader. If the file has a newer version than the reader, we still say
##  we can read the file type and we fail later, when we try to read the file.
##  This enables clients (ParaView) to distinguish between failures when we
##  need to look for another reader and failures when we don't.
##  virtual int CanReadFile ( VTK_FILEPATH const char * name ) ;
## Error: token expected: ) but got: *!!!

proc GetOutputAsDataSet*(this: var vtkXMLReader): ptr vtkDataSet {.
    importcpp: "GetOutputAsDataSet", header: "vtkXMLReader.h".}
proc GetOutputAsDataSet*(this: var vtkXMLReader; index: cint): ptr vtkDataSet {.
    importcpp: "GetOutputAsDataSet", header: "vtkXMLReader.h".}
proc GetnamePointDataArraySelection*(this: var vtkXMLReader): ptr vtkDataArraySelection {.
    importcpp: "GetnamePointDataArraySelection", header: "vtkXMLReader.h".}
proc GetnamePointDataArraySelectionCellDataArraySelection*(this: var vtkXMLReader): ptr vtkDataArraySelection {.
    importcpp: "GetnamePointDataArraySelectionCellDataArraySelection",
    header: "vtkXMLReader.h".}
proc GetnamePointDataArraySelectionCellDataArraySelectionColumnArraySelection*(
    this: var vtkXMLReader): ptr vtkDataArraySelection {.importcpp: "GetnamePointDataArraySelectionCellDataArraySelectionColumnArraySelection",
    header: "vtkXMLReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the number of point, cell or column arrays available in the input.
  ##
proc GetNumberOfPointArrays*(this: var vtkXMLReader): cint {.
    importcpp: "GetNumberOfPointArrays", header: "vtkXMLReader.h".}
proc GetNumberOfCellArrays*(this: var vtkXMLReader): cint {.
    importcpp: "GetNumberOfCellArrays", header: "vtkXMLReader.h".}
proc GetNumberOfColumnArrays*(this: var vtkXMLReader): cint {.
    importcpp: "GetNumberOfColumnArrays", header: "vtkXMLReader.h".}
proc GetNumberOfTimeDataArrays*(this: vtkXMLReader): cint {.noSideEffect,
    importcpp: "GetNumberOfTimeDataArrays", header: "vtkXMLReader.h".}
proc GetTimeDataArray*(this: vtkXMLReader; idx: cint): cstring {.noSideEffect,
    importcpp: "GetTimeDataArray", header: "vtkXMLReader.h".}
proc GetnamePointDataArraySelectionCellDataArraySelectionColumnArraySelectionTimeDataStringArray*(
    this: var vtkXMLReader): ptr vtkStringArray {.importcpp: "GetnamePointDataArraySelectionCellDataArraySelectionColumnArraySelectionTimeDataStringArray",
    header: "vtkXMLReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Setter / Getter on ActiveTimeDataArrayName. This string
  ##  holds the selected time array name. If set to `nullptr`,
  ##  time values are the sequence of positive integers starting at zero.
  ##  Default value is `TimeValue` for legacy reasons.
  ##
proc GetActiveTimeDataArrayName*(this: var vtkXMLReader): cstring {.
    importcpp: "GetActiveTimeDataArrayName", header: "vtkXMLReader.h".}
proc SetActiveTimeDataArrayName*(this: var vtkXMLReader; _arg: cstring) {.
    importcpp: "SetActiveTimeDataArrayName", header: "vtkXMLReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the name of the point, cell, column or time array with the given index in
  ##  the input.
  ##
proc GetPointArrayName*(this: var vtkXMLReader; index: cint): cstring {.
    importcpp: "GetPointArrayName", header: "vtkXMLReader.h".}
proc GetCellArrayName*(this: var vtkXMLReader; index: cint): cstring {.
    importcpp: "GetCellArrayName", header: "vtkXMLReader.h".}
proc GetColumnArrayName*(this: var vtkXMLReader; index: cint): cstring {.
    importcpp: "GetColumnArrayName", header: "vtkXMLReader.h".}
proc GetPointArrayStatus*(this: var vtkXMLReader; name: cstring): cint {.
    importcpp: "GetPointArrayStatus", header: "vtkXMLReader.h".}
proc GetCellArrayStatus*(this: var vtkXMLReader; name: cstring): cint {.
    importcpp: "GetCellArrayStatus", header: "vtkXMLReader.h".}
proc SetPointArrayStatus*(this: var vtkXMLReader; name: cstring; status: cint) {.
    importcpp: "SetPointArrayStatus", header: "vtkXMLReader.h".}
proc SetCellArrayStatus*(this: var vtkXMLReader; name: cstring; status: cint) {.
    importcpp: "SetCellArrayStatus", header: "vtkXMLReader.h".}
proc GetColumnArrayStatus*(this: var vtkXMLReader; name: cstring): cint {.
    importcpp: "GetColumnArrayStatus", header: "vtkXMLReader.h".}
proc SetColumnArrayStatus*(this: var vtkXMLReader; name: cstring; status: cint) {.
    importcpp: "SetColumnArrayStatus", header: "vtkXMLReader.h".}
proc CopyOutputInformation*(this: var vtkXMLReader;
                           vtkNotUsed: proc (a1: outInfo): ptr vtkInformation;
                           vtkNotUsed: proc (a1: port): cint) {.
    importcpp: "CopyOutputInformation", header: "vtkXMLReader.h".}
proc SetReadFromInputStringTimeStep*(this: var vtkXMLReader; _arg: cint) {.
    importcpp: "SetReadFromInputStringTimeStep", header: "vtkXMLReader.h".}
## !!!Ignored construct:  virtual int GetReadFromInputStringTimeStep ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TimeStep  of  << this -> TimeStep ) ; return this -> TimeStep ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} virtual int GetReadFromInputStringTimeStepNumberOfTimeStepsNumberOfTimeSteps ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfTimeSteps  of  << this -> NumberOfTimeSteps ) ; return this -> NumberOfTimeSteps ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@{ *
##  Which TimeStepRange to read
##  virtual int * GetTimeStepRangeTimeStepRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << TimeStepRange  pointer  << this -> TimeStepRange ) ; return this -> TimeStepRange ; } VTK_WRAPEXCLUDE virtual void GetTimeStepRangeTimeStepRange ( int & _arg1 , int & _arg2 ) { _arg1 = this -> TimeStepRange [ 0 ] ; _arg2 = this -> TimeStepRange [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << TimeStepRange  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetTimeStepRangeTimeStepRange ( int _arg [ 2 ] ) { this -> GetTimeStepRangeTimeStepRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetTimeStepRange*(this: var vtkXMLReader; _arg1: cint; _arg2: cint) {.
    importcpp: "SetTimeStepRange", header: "vtkXMLReader.h".}
proc SetTimeStepRange*(this: var vtkXMLReader; _arg: array[2, cint]) {.
    importcpp: "SetTimeStepRange", header: "vtkXMLReader.h".}
  ## /@}
  ## *
  ##  Returns the internal XML parser. This can be used to access
  ##  the XML DOM after RequestInformation() was called.
  ##
proc GetXMLParser*(this: var vtkXMLReader): ptr vtkXMLDataParser {.
    importcpp: "GetXMLParser", header: "vtkXMLReader.h".}
proc ProcessRequest*(this: var vtkXMLReader; request: ptr vtkInformation;
                    inputVector: ptr ptr vtkInformationVector;
                    outputVector: ptr vtkInformationVector): vtkTypeBool {.
    importcpp: "ProcessRequest", header: "vtkXMLReader.h".}
proc SetReaderErrorObserver*(this: var vtkXMLReader; a2: ptr vtkCommand) {.
    importcpp: "SetReaderErrorObserver", header: "vtkXMLReader.h".}
proc GetnamePointDataArraySelectionCellDataArraySelectionColumnArraySelectionTimeDataStringArrayReaderErrorObserver*(
    this: var vtkXMLReader): ptr vtkCommand {.importcpp: "GetnamePointDataArraySelectionCellDataArraySelectionColumnArraySelectionTimeDataStringArrayReaderErrorObserver",
    header: "vtkXMLReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get the ErrorObserver for the internal xml parser
  ##  This is useful for applications that want to catch error messages.
  ##
proc SetParserErrorObserver*(this: var vtkXMLReader; a2: ptr vtkCommand) {.
    importcpp: "SetParserErrorObserver", header: "vtkXMLReader.h".}
proc GetnamePointDataArraySelectionCellDataArraySelectionColumnArraySelectionTimeDataStringArrayReaderErrorObserverParserErrorObserver*(
    this: var vtkXMLReader): ptr vtkCommand {.importcpp: "GetnamePointDataArraySelectionCellDataArraySelectionColumnArraySelectionTimeDataStringArrayReaderErrorObserverParserErrorObserver",
    header: "vtkXMLReader.h".}
  ## /@}
## !!!Ignored construct:   Returns the major version for the file being read. -1 when invalid. virtual int GetReadFromInputStringTimeStepNumberOfTimeStepsNumberOfTimeStepsFileMajorVersionFileMajorVersion ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileMajorVersion  of  << this -> FileMajorVersion ) ; return this -> FileMajorVersion ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:   Returns the minor version for the file being read. -1 when invalid. virtual int GetReadFromInputStringTimeStepNumberOfTimeStepsNumberOfTimeStepsFileMajorVersionFileMajorVersionFileMinorVersionFileMinorVersion ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileMinorVersion  of  << this -> FileMinorVersion ) ; return this -> FileMinorVersion ; } ;
## Error: expected ';'!!!
