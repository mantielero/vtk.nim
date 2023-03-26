## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMFIXReader.h
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
##  @class   vtkMFIXReader
##  @brief   reads a dataset in MFIX file format
##
##  vtkMFIXReader creates an unstructured grid dataset. It reads a restart
##  file and a set of sp files.  The restart file contains the mesh
##  information.  MFIX meshes are either cylindrical or rectilinear, but
##  this reader will convert them to an unstructured grid.  The sp files
##  contain transient data for the cells.  Each sp file has one or more
##  variables stored inside it.
##
##  @par Thanks:
##  Thanks to Phil Nicoletti and Brian Dotson at the National Energy
##  Technology Laboratory who developed this class.
##  Please address all comments to Brian Dotson (brian.dotson@netl.doe.gov)
##
##  @sa
##  vtkGAMBITReader
##

import
  vtkIOGeometryModule, vtkUnstructuredGridAlgorithm

discard "forward decl of vtkDataArraySelection"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkStringArray"
discard "forward decl of vtkIntArray"
discard "forward decl of vtkFloatArray"
discard "forward decl of vtkXMLUnstructuredGridWriter"
discard "forward decl of vtkWedge"
discard "forward decl of vtkQuad"
discard "forward decl of vtkHexahedron"
discard "forward decl of vtkPoints"
discard "forward decl of vtkStdString"
type
  vtkMFIXReader* {.importcpp: "vtkMFIXReader", header: "vtkMFIXReader.h", bycopy.} = object of vtkUnstructuredGridAlgorithm
    vtkMFIXReader* {.importc: "vtkMFIXReader".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    ##
    ##   MFIX Variables
    ##
    ##  Arrays for variables that will
    ##  attach to mesh
    ##  Points array for building grid
    ##  Unstructured Grid
    ##  Hexahedron type cell
    ##  Wedge type cell
    ##  Quad type cell
    ##  Cell Flag array
    ##  Cell widths in x axis
    ##  Cell widths in y axis
    ##  Cell widths in z axis
    ##  Array to hold number of species per phase
    ##  Array used to parse restart file
    ##  Array used to parse restart file
    ##  Array used to parse restart file
    ##  Array for keeping track of
    ##  what spx files exist.
    ##
    ##   SPX Variables
    ##
    ##  maximum timesteps amongst the variables
    ##  number of records in a single
    ##  timestep for a variable
    ##  number of variables in each spx file
    ##  skip value for each variable, this
    ##  is needed in spx files
    ##  with more than one variable.
    ##  number of timesteps for each variable
    ##  Since the number of timesteps
    ##  vary between variables
    ##   this is a table that looks
    ##   up the appropriate timestep
    ##  for the particular variable.
    ##   This gives the spx file number for the
    ##   particular variable.
    ##   This gives the spx file number for the
    ##   particular variable.
    ##   This a table look up for the index
    ##   into a file for a certain variable.


proc New*(): ptr vtkMFIXReader {.importcpp: "vtkMFIXReader::New(@)",
                             header: "vtkMFIXReader.h".}
type
  vtkMFIXReaderSuperclass* = vtkUnstructuredGridAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMFIXReader::IsTypeOf(@)", header: "vtkMFIXReader.h".}
proc IsA*(this: var vtkMFIXReader; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkMFIXReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMFIXReader {.
    importcpp: "vtkMFIXReader::SafeDownCast(@)", header: "vtkMFIXReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMFIXReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMFIXReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMFIXReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkMFIXReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkMFIXReader.h".}
## !!!Ignored construct:  /@{ *
##  Specify the file name of the MFIX Restart data file to read.
##  virtual void SetFileNameFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get the total number of cells. The number of cells is only valid after a
##  successful read of the data file is performed.
##  virtual int GetNumberOfCellsNumberOfCells ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfCells  of  << this -> NumberOfCells ) ; return this -> NumberOfCells ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get the total number of nodes. The number of nodes is only valid after a
##  successful read of the data file is performed.
##  virtual int GetNumberOfCellsNumberOfCellsNumberOfPointsNumberOfPoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfPoints  of  << this -> NumberOfPoints ) ; return this -> NumberOfPoints ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get the number of data components at the nodes and cells.
##  virtual int GetNumberOfCellsNumberOfCellsNumberOfPointsNumberOfPointsNumberOfCellFieldsNumberOfCellFields ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfCellFields  of  << this -> NumberOfCellFields ) ; return this -> NumberOfCellFields ; } ;
## Error: expected ';'!!!

proc SetTimeStep*(this: var vtkMFIXReader; _arg: cint) {.importcpp: "SetTimeStep",
    header: "vtkMFIXReader.h".}
## !!!Ignored construct:  virtual int GetNumberOfCellsNumberOfCellsNumberOfPointsNumberOfPointsNumberOfCellFieldsNumberOfCellFieldsTimeStep ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TimeStep  of  << this -> TimeStep ) ; return this -> TimeStep ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Returns the number of timesteps.
##  virtual int GetNumberOfCellsNumberOfCellsNumberOfPointsNumberOfPointsNumberOfCellFieldsNumberOfCellFieldsTimeStepNumberOfTimeStepsNumberOfTimeSteps ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfTimeSteps  of  << this -> NumberOfTimeSteps ) ; return this -> NumberOfTimeSteps ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Which TimeStepRange to read
##  virtual int * GetTimeStepRangeTimeStepRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << TimeStepRange  pointer  << this -> TimeStepRange ) ; return this -> TimeStepRange ; } VTK_WRAPEXCLUDE virtual void GetTimeStepRangeTimeStepRange ( int & _arg1 , int & _arg2 ) { _arg1 = this -> TimeStepRange [ 0 ] ; _arg2 = this -> TimeStepRange [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << TimeStepRange  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetTimeStepRangeTimeStepRange ( int _arg [ 2 ] ) { this -> GetTimeStepRangeTimeStepRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetTimeStepRange*(this: var vtkMFIXReader; _arg1: cint; _arg2: cint) {.
    importcpp: "SetTimeStepRange", header: "vtkMFIXReader.h".}
proc SetTimeStepRange*(this: var vtkMFIXReader; _arg: array[2, cint]) {.
    importcpp: "SetTimeStepRange", header: "vtkMFIXReader.h".}
  ## /@}
  ## *
  ##  Get the number of cell arrays available in the input.
  ##
proc GetNumberOfCellArrays*(this: var vtkMFIXReader): cint {.
    importcpp: "GetNumberOfCellArrays", header: "vtkMFIXReader.h".}
proc GetCellArrayName*(this: var vtkMFIXReader; index: cint): cstring {.
    importcpp: "GetCellArrayName", header: "vtkMFIXReader.h".}
proc GetCellArrayStatus*(this: var vtkMFIXReader; name: cstring): cint {.
    importcpp: "GetCellArrayStatus", header: "vtkMFIXReader.h".}
proc SetCellArrayStatus*(this: var vtkMFIXReader; name: cstring; status: cint) {.
    importcpp: "SetCellArrayStatus", header: "vtkMFIXReader.h".}
proc DisableAllCellArrays*(this: var vtkMFIXReader) {.
    importcpp: "DisableAllCellArrays", header: "vtkMFIXReader.h".}
proc EnableAllCellArrays*(this: var vtkMFIXReader) {.
    importcpp: "EnableAllCellArrays", header: "vtkMFIXReader.h".}
proc GetCellDataRange*(this: var vtkMFIXReader; cellComp: cint; min: ptr cfloat;
                      max: ptr cfloat) {.importcpp: "GetCellDataRange",
                                      header: "vtkMFIXReader.h".}