## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCGNSFileSeriesReader.h
##
##   Copyright (c) Kitware, Inc.
##   All rights reserved.
##   See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class vtkCGNSFileSeriesReader
##  @brief Adds support for reading temporal or partitioned CGNS files.
##
##  vtkCGNSFileSeriesReader is a meta-reader that add support for reading
##  CGNS file series using vtkCGNSReader. We encounter two types of file series
##  with CGNS:
##  \li 1. temporal file series - where each file is simply a single timestep.
##  \li 2. partitioned file series - where each file corresponds to data dumped
##         out from a rank but has all timesteps.
##
##   vtkCGNSFileSeriesReader determines the nature of the file series
##   encountered and reads the files accordingly. For partitioned files, the
##   files are distributed among data-processing ranks, while for temporal file
##   series, blocks are distributed among data-processing ranks (using logic in
##   vtkCGNSReader itself).
##
##   @sa vtkFileSeriesHelper
##

import
  vtkIOCGNSReaderModule, vtkMultiBlockDataSetAlgorithm, vtkNew

discard "forward decl of vtkCGNSReader"
discard "forward decl of vtkCGNSSubsetInclusionLattice"
discard "forward decl of vtkFileSeriesHelper"
discard "forward decl of vtkMultiProcessController"
type
  vtkCGNSFileSeriesReader* {.importcpp: "vtkCGNSFileSeriesReader",
                            header: "vtkCGNSFileSeriesReader.h", bycopy.} = object of vtkMultiBlockDataSetAlgorithm
    vtkCGNSFileSeriesReader* {.importc: "vtkCGNSFileSeriesReader".}: VTK_NEWINSTANCE
    char* {.importc: "char".}: VTK_FILEPATH


proc New*(): ptr vtkCGNSFileSeriesReader {.importcpp: "vtkCGNSFileSeriesReader::New(@)",
                                       header: "vtkCGNSFileSeriesReader.h".}
type
  vtkCGNSFileSeriesReaderSuperclass* = vtkMultiBlockDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCGNSFileSeriesReader::IsTypeOf(@)",
    header: "vtkCGNSFileSeriesReader.h".}
proc IsA*(this: var vtkCGNSFileSeriesReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkCGNSFileSeriesReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCGNSFileSeriesReader {.
    importcpp: "vtkCGNSFileSeriesReader::SafeDownCast(@)",
    header: "vtkCGNSFileSeriesReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCGNSFileSeriesReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMultiBlockDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCGNSFileSeriesReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCGNSFileSeriesReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCGNSFileSeriesReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCGNSFileSeriesReader.h".}
proc SetController*(this: var vtkCGNSFileSeriesReader;
                   controller: ptr vtkMultiProcessController) {.
    importcpp: "SetController", header: "vtkCGNSFileSeriesReader.h".}
proc GetnameController*(this: var vtkCGNSFileSeriesReader): ptr vtkMultiProcessController {.
    importcpp: "GetnameController", header: "vtkCGNSFileSeriesReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get/Set the reader.
  ##
proc SetReader*(this: var vtkCGNSFileSeriesReader; reader: ptr vtkCGNSReader) {.
    importcpp: "SetReader", header: "vtkCGNSFileSeriesReader.h".}
proc GetnameControllerReader*(this: var vtkCGNSFileSeriesReader): ptr vtkCGNSReader {.
    importcpp: "GetnameControllerReader", header: "vtkCGNSFileSeriesReader.h".}
  ## /@}
  ## *
  ##  Test a file for readability. Ensure that vtkCGNSFileSeriesReader::SetReader
  ##  is called before using this method.
  ##
## !!!Ignored construct:  int CanReadFile ( VTK_FILEPATH const char * filename ) ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  /@{ *
##  Add/remove files names in the file series.
##  void AddFileName ( VTK_FILEPATH const char * fname ) ;
## Error: token expected: ) but got: *!!!

proc RemoveAllFileNames*(this: var vtkCGNSFileSeriesReader) {.
    importcpp: "RemoveAllFileNames", header: "vtkCGNSFileSeriesReader.h".}
## !!!Ignored construct:  /@} /@{ *
##  If true, then treat file series like it does not contain any time step
##  values. False by default.
##  virtual bool GetIgnoreReaderTimeIgnoreReaderTime ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IgnoreReaderTime  of  << this -> IgnoreReaderTime ) ; return this -> IgnoreReaderTime ; } ;
## Error: expected ';'!!!

proc SetIgnoreReaderTime*(this: var vtkCGNSFileSeriesReader; _arg: bool) {.
    importcpp: "SetIgnoreReaderTime", header: "vtkCGNSFileSeriesReader.h".}
proc IgnoreReaderTimeOn*(this: var vtkCGNSFileSeriesReader) {.
    importcpp: "IgnoreReaderTimeOn", header: "vtkCGNSFileSeriesReader.h".}
proc IgnoreReaderTimeOff*(this: var vtkCGNSFileSeriesReader) {.
    importcpp: "IgnoreReaderTimeOff", header: "vtkCGNSFileSeriesReader.h".}
  ## /@}
  ## *
  ##  Returns the filename being used for current timesteps.
  ##  This is only reasonable for temporal file series. For a partitioned file
  ##  series, this will return the filename being used on the current rank.
  ##
## !!!Ignored construct:  * GetCurrentFileName ( ) const ;
## Error: identifier expected, but got: *!!!

proc ProcessRequest*(this: var vtkCGNSFileSeriesReader; a2: ptr vtkInformation;
                    a3: ptr ptr vtkInformationVector; a4: ptr vtkInformationVector): cint {.
    importcpp: "ProcessRequest", header: "vtkCGNSFileSeriesReader.h".}