## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFidesReader.h
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
##  @class   vtkFidesReader
##  @brief   Read ADIOS2 streams using Fides data model
##
##  vtkFidesReader is a data source that reads ADIOS2 files or data
##  streams (SST engine, inline engine etc.). The data model in these
##  data streams is defined by the Fides library:
##  (https://gitlab.kitware.com/vtk/fides/)
##  See the Fides documentation for the details of the schema used to
##  represent VTK/VTK-m data models.
##  The reader can create partitioned datasets containing
##  native VTK dataset or  VTK VTK-m datasets.
##  Time and time streaming is supported. Note that the interface for
##  time streaming is different. It requires calling PrepareNextStep()
##  and Update() for each new step.
##  Partitioned (in ADIOS2 terminology blocks) data is supported.
##
##

import
  vtkAlgorithm, vtkIOFidesModule

discard "forward decl of vtkDataArraySelection"
discard "forward decl of vtkInformationIntegerKey"
type
  vtkFidesReader* {.importcpp: "vtkFidesReader", header: "vtkFidesReader.h", bycopy.} = object of vtkAlgorithm ## *
                                                                                                     ##  When using streaming mode instead of random access,
                                                                                                     ##  PrepareNextStep receives a step status from Fides/ADIOS
                                                                                                     ##
    vtkFidesReader* {.importc: "vtkFidesReader".}: VTK_NEWINSTANCE

  vtkFidesReaderStepStatus* {.size: sizeof(cint),
                             importcpp: "vtkFidesReader::StepStatus",
                             header: "vtkFidesReader.h".} = enum
    OK, NotReady, EndOfStream


type
  vtkFidesReaderSuperclass* = vtkAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkFidesReader::IsTypeOf(@)", header: "vtkFidesReader.h".}
proc IsA*(this: var vtkFidesReader; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkFidesReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkFidesReader {.
    importcpp: "vtkFidesReader::SafeDownCast(@)", header: "vtkFidesReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkFidesReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFidesReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFidesReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkFidesReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkFidesReader.h".}
proc New*(): ptr vtkFidesReader {.importcpp: "vtkFidesReader::New(@)",
                              header: "vtkFidesReader.h".}
## !!!Ignored construct:  *
##  Test whether or not a given file should even be attempted for use with this
##  reader.
##  int CanReadFile ( VTK_FILEPATH const std :: string & name ) ;
## Error: token expected: ) but got: ::!!!

## !!!Ignored construct:  *
##  Set the filename to be read
##  void SetFileName ( VTK_FILEPATH const std :: string & fname ) ;
## Error: token expected: ) but got: ::!!!

## !!!Ignored construct:  /@{ *
##  Given a json filename, parse and internally store a data
##  model. Has to be called before any data input can take place.
##  See the Fides documentation for the description of the schema.
##  void ParseDataModel ( VTK_FILEPATH const std :: string & fname ) ;
## Error: token expected: ) but got: ::!!!

proc ParseDataModel*(this: var vtkFidesReader) {.importcpp: "ParseDataModel",
    header: "vtkFidesReader.h".}
## !!!Ignored construct:  /@} *
##  Set the path for a Fides data source. This can be a file, an
##  SST stream or an inline data source. The name of the data source
##  corresponds to what is in the data model.
##  void SetDataSourcePath ( const std :: string & name , VTK_FILEPATH const std :: string & path ) ;
## Error: token expected: ) but got: ::!!!

proc SetDataSourceIO*(this: var vtkFidesReader; name: string; ioAddress: string) {.
    importcpp: "SetDataSourceIO", header: "vtkFidesReader.h".}
proc ProcessRequest*(this: var vtkFidesReader; a2: ptr vtkInformation;
                    a3: ptr ptr vtkInformationVector; a4: ptr vtkInformationVector): cint {.
    importcpp: "ProcessRequest", header: "vtkFidesReader.h".}
proc PrepareNextStep*(this: var vtkFidesReader) {.importcpp: "PrepareNextStep",
    header: "vtkFidesReader.h".}
proc GetNextStepStatus*(this: var vtkFidesReader): cint {.
    importcpp: "GetNextStepStatus", header: "vtkFidesReader.h".}
proc GetTimeOfCurrentStep*(this: var vtkFidesReader): cdouble {.
    importcpp: "GetTimeOfCurrentStep", header: "vtkFidesReader.h".}
proc ConvertToVTKOn*(this: var vtkFidesReader) {.importcpp: "ConvertToVTKOn",
    header: "vtkFidesReader.h".}
proc ConvertToVTKOff*(this: var vtkFidesReader) {.importcpp: "ConvertToVTKOff",
    header: "vtkFidesReader.h".}
proc SetConvertToVTK*(this: var vtkFidesReader; _arg: bool) {.
    importcpp: "SetConvertToVTK", header: "vtkFidesReader.h".}
## !!!Ignored construct:  virtual bool GetConvertToVTK ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ConvertToVTK  of  << this -> ConvertToVTK ) ; return this -> ConvertToVTK ; } ;
## Error: expected ';'!!!

proc GetnamePointDataArraySelection*(this: var vtkFidesReader): ptr vtkDataArraySelection {.
    importcpp: "GetnamePointDataArraySelection", header: "vtkFidesReader.h".}
  ## *
  ##  Object to perform cell array selection before update.
  ##
proc GetnamePointDataArraySelectionCellDataArraySelection*(
    this: var vtkFidesReader): ptr vtkDataArraySelection {.
    importcpp: "GetnamePointDataArraySelectionCellDataArraySelection",
    header: "vtkFidesReader.h".}