## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPIOReader.h
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
##  @class   vtkPIOReader
##  @brief   class for reading PIO (Parallel Input Output) data files
##
##  This class reads in dump files generated from xRage, a LANL physics code.
##  The PIO (Parallel Input Output) library is used to create the dump files.
##
##  @sa
##  vtkMultiBlockReader
##

import
  vtkIOPIOModule, vtkMultiBlockDataSetAlgorithm, vtkStdString

discard "forward decl of vtkCallbackCommand"
discard "forward decl of vtkDataArraySelection"
discard "forward decl of vtkFloatArray"
discard "forward decl of vtkInformation"
discard "forward decl of vtkMultiBlockDataSet"
discard "forward decl of vtkMultiProcessController"
discard "forward decl of vtkStringArray"
discard "forward decl of PIOAdaptor"
discard "forward decl of PIO_DATA"
type
  vtkPIOReader* {.importcpp: "vtkPIOReader", header: "vtkPIOReader.h", bycopy.} = object of vtkMultiBlockDataSetAlgorithm
    vtkPIOReader* {.importc: "vtkPIOReader".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    ##  First field part file giving path
    ##  Number of this processor
    ##  Number of processors
    ##  Adapts data format to VTK
    ##  Number of variables to display
    ##  Temporal domain
    ##  Times available for request
    ##  Time currently displayed
    ##  Create HTG rather than UnstructuredGrid
    ##  Create UnstructuredGrid for tracer info
    ##  Load variable data as 64 bit float
    ##  Controls initializing and querrying MPI
    ##  Selected field of interest
    ##  Time array selection
    ##  Active index of array used for time. If no time array is used, value should be -1.
    ##  Observer to modify this object when array selections are modified


proc New*(): ptr vtkPIOReader {.importcpp: "vtkPIOReader::New(@)",
                            header: "vtkPIOReader.h".}
type
  vtkPIOReaderSuperclass* = vtkMultiBlockDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPIOReader::IsTypeOf(@)", header: "vtkPIOReader.h".}
proc IsA*(this: var vtkPIOReader; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkPIOReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPIOReader {.
    importcpp: "vtkPIOReader::SafeDownCast(@)", header: "vtkPIOReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPIOReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMultiBlockDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPIOReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPIOReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPIOReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPIOReader.h".}
## !!!Ignored construct:  /@{ *
##  Specify file name of PIO data file to read.
##  virtual void SetFileNameFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

proc SetCurrentTimeStep*(this: var vtkPIOReader; _arg: cint) {.
    importcpp: "SetCurrentTimeStep", header: "vtkPIOReader.h".}
## !!!Ignored construct:  virtual int GetCurrentTimeStep ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CurrentTimeStep  of  << this -> CurrentTimeStep ) ; return this -> CurrentTimeStep ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Specify the creation of hypertree grid
##  virtual bool GetCurrentTimeStepHyperTreeGridHyperTreeGrid ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HyperTreeGrid  of  << this -> HyperTreeGrid ) ; return this -> HyperTreeGrid ; } ;
## Error: expected ';'!!!

proc SetCurrentTimeStepHyperTreeGrid*(this: var vtkPIOReader; _arg: bool) {.
    importcpp: "SetCurrentTimeStepHyperTreeGrid", header: "vtkPIOReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify the creation of tracer data
  ##
proc SetCurrentTimeStepHyperTreeGridTracers*(this: var vtkPIOReader; _arg: bool) {.
    importcpp: "SetCurrentTimeStepHyperTreeGridTracers", header: "vtkPIOReader.h".}
## !!!Ignored construct:  virtual bool GetCurrentTimeStepHyperTreeGridHyperTreeGridTracers ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tracers  of  << this -> Tracers ) ; return this -> Tracers ; } ;
## Error: expected ';'!!!

proc SetCurrentTimeStepHyperTreeGridTracersFloat64*(this: var vtkPIOReader;
    _arg: bool) {.importcpp: "SetCurrentTimeStepHyperTreeGridTracersFloat64",
                header: "vtkPIOReader.h".}
## !!!Ignored construct:  virtual bool GetCurrentTimeStepHyperTreeGridHyperTreeGridTracersFloat64 ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Float64  of  << this -> Float64 ) ; return this -> Float64 ; } ;
## Error: expected ';'!!!

proc GetOutput*(this: var vtkPIOReader): ptr vtkMultiBlockDataSet {.
    importcpp: "GetOutput", header: "vtkPIOReader.h".}
proc GetOutput*(this: var vtkPIOReader; index: cint): ptr vtkMultiBlockDataSet {.
    importcpp: "GetOutput", header: "vtkPIOReader.h".}
proc GetNumberOfCellArrays*(this: var vtkPIOReader): cint {.
    importcpp: "GetNumberOfCellArrays", header: "vtkPIOReader.h".}
proc GetCellArrayName*(this: var vtkPIOReader; index: cint): cstring {.
    importcpp: "GetCellArrayName", header: "vtkPIOReader.h".}
proc GetCellArrayStatus*(this: var vtkPIOReader; name: cstring): cint {.
    importcpp: "GetCellArrayStatus", header: "vtkPIOReader.h".}
proc SetCellArrayStatus*(this: var vtkPIOReader; name: cstring; status: cint) {.
    importcpp: "SetCellArrayStatus", header: "vtkPIOReader.h".}
proc DisableAllCellArrays*(this: var vtkPIOReader) {.
    importcpp: "DisableAllCellArrays", header: "vtkPIOReader.h".}
proc EnableAllCellArrays*(this: var vtkPIOReader) {.
    importcpp: "EnableAllCellArrays", header: "vtkPIOReader.h".}
proc GetnameCellDataArraySelection*(this: var vtkPIOReader): ptr vtkDataArraySelection {.
    importcpp: "GetnameCellDataArraySelection", header: "vtkPIOReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Getters for time data array candidates.
  ##
proc GetNumberOfTimeDataArrays*(this: vtkPIOReader): cint {.noSideEffect,
    importcpp: "GetNumberOfTimeDataArrays", header: "vtkPIOReader.h".}
proc GetTimeDataArray*(this: vtkPIOReader; idx: cint): cstring {.noSideEffect,
    importcpp: "GetTimeDataArray", header: "vtkPIOReader.h".}
proc GetnameCellDataArraySelectionTimeDataStringArray*(this: var vtkPIOReader): ptr vtkStringArray {.
    importcpp: "GetnameCellDataArraySelectionTimeDataStringArray",
    header: "vtkPIOReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Setter / Getter on ActiveTimeDataArrayName. This string
  ##  holds the selected time array name. If set to `nullptr`,
  ##  time values are the sequence of positive integers starting at zero.
  ##
proc GetActiveTimeDataArrayName*(this: var vtkPIOReader): cstring {.
    importcpp: "GetActiveTimeDataArrayName", header: "vtkPIOReader.h".}
proc SetActiveTimeDataArrayName*(this: var vtkPIOReader; _arg: cstring) {.
    importcpp: "SetActiveTimeDataArrayName", header: "vtkPIOReader.h".}
  ## /@}