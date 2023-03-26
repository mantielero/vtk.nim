## =========================================================================
##
##  Program:   Visualization Toolkit
##  Module:    vtkAMRBaseParticlesReader.h
##
##  Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##  All rights reserved.
##  See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##  This software is distributed WITHOUT ANY WARRANTY; without even
##  the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##  PURPOSE.  See the above copyright notice for more information.
##
##  =========================================================================
## *
##  @class   vtkAMRBaseParticlesReader
##  @brief   An abstract base class that implements all the common functionality for
##   all particle readers.
##

import
  vtkIOAMRModule, vtkMultiBlockDataSetAlgorithm

discard "forward decl of vtkInformation"
discard "forward decl of vtkInformationVector"
discard "forward decl of vtkIndent"
discard "forward decl of vtkMultiProcessController"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkDataArraySelection"
discard "forward decl of vtkCallbackCommand"
type
  vtkAMRBaseParticlesReader* {.importcpp: "vtkAMRBaseParticlesReader",
                              header: "vtkAMRBaseParticlesReader.h", bycopy.} = object of vtkMultiBlockDataSetAlgorithm
    vtkAMRBaseParticlesReader* {.importc: "vtkAMRBaseParticlesReader".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    ## /@}
    ## *
    ##  Initializes the ParticleDataArraySelection object. This method
    ##  only executes for an initial request in which case all arrays are
    ##  deselected.
    ##

  vtkAMRBaseParticlesReaderSuperclass* = vtkMultiBlockDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAMRBaseParticlesReader::IsTypeOf(@)",
    header: "vtkAMRBaseParticlesReader.h".}
proc IsA*(this: var vtkAMRBaseParticlesReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkAMRBaseParticlesReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAMRBaseParticlesReader {.
    importcpp: "vtkAMRBaseParticlesReader::SafeDownCast(@)",
    header: "vtkAMRBaseParticlesReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAMRBaseParticlesReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMultiBlockDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAMRBaseParticlesReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAMRBaseParticlesReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAMRBaseParticlesReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkAMRBaseParticlesReader.h".}
## !!!Ignored construct:  /@{ *
##  Set & Get the frequency.
##  virtual int GetFrequencyFrequency ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Frequency  of  << this -> Frequency ) ; return this -> Frequency ; } ;
## Error: expected ';'!!!

proc SetFrequency*(this: var vtkAMRBaseParticlesReader; _arg: cint) {.
    importcpp: "SetFrequency", header: "vtkAMRBaseParticlesReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set & Get the multi-process controller.
  ##
proc GetnameController*(this: var vtkAMRBaseParticlesReader): ptr vtkMultiProcessController {.
    importcpp: "GetnameController", header: "vtkAMRBaseParticlesReader.h".}
proc SetController*(this: var vtkAMRBaseParticlesReader;
                   a2: ptr vtkMultiProcessController) {.importcpp: "SetController",
    header: "vtkAMRBaseParticlesReader.h".}
proc SetFrequencyFilterLocation*(this: var vtkAMRBaseParticlesReader;
                                _arg: vtkTypeBool) {.
    importcpp: "SetFrequencyFilterLocation", header: "vtkAMRBaseParticlesReader.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetFrequencyFrequencyFilterLocation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FilterLocation  of  << this -> FilterLocation ) ; return this -> FilterLocation ; } ;
## Error: expected ';'!!!

proc FilterLocationOn*(this: var vtkAMRBaseParticlesReader) {.
    importcpp: "FilterLocationOn", header: "vtkAMRBaseParticlesReader.h".}
proc FilterLocationOff*(this: var vtkAMRBaseParticlesReader) {.
    importcpp: "FilterLocationOff", header: "vtkAMRBaseParticlesReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the data array selection tables used to configure which data
  ##  arrays are loaded by the reader.
  ##
proc GetnameControllerParticleDataArraySelection*(
    this: var vtkAMRBaseParticlesReader): ptr vtkDataArraySelection {.
    importcpp: "GetnameControllerParticleDataArraySelection",
    header: "vtkAMRBaseParticlesReader.h".}
  ## /@}
  ## *
  ##  Get the number of particles arrays available in the input.
  ##
proc GetNumberOfParticleArrays*(this: var vtkAMRBaseParticlesReader): cint {.
    importcpp: "GetNumberOfParticleArrays", header: "vtkAMRBaseParticlesReader.h".}
proc GetParticleArrayName*(this: var vtkAMRBaseParticlesReader; index: cint): cstring {.
    importcpp: "GetParticleArrayName", header: "vtkAMRBaseParticlesReader.h".}
proc GetParticleArrayStatus*(this: var vtkAMRBaseParticlesReader; name: cstring): cint {.
    importcpp: "GetParticleArrayStatus", header: "vtkAMRBaseParticlesReader.h".}
proc SetParticleArrayStatus*(this: var vtkAMRBaseParticlesReader; name: cstring;
                            status: cint) {.importcpp: "SetParticleArrayStatus",
    header: "vtkAMRBaseParticlesReader.h".}
## !!!Ignored construct:  /@} virtual void SetFileName ( VTK_FILEPATH const char * fileName ) ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

proc SetMinLocation*(this: var vtkAMRBaseParticlesReader; minx: cdouble;
                    miny: cdouble; minz: cdouble) {.importcpp: "SetMinLocation",
    header: "vtkAMRBaseParticlesReader.h".}
proc SetMaxLocation*(this: var vtkAMRBaseParticlesReader; maxx: cdouble;
                    maxy: cdouble; maxz: cdouble) {.importcpp: "SetMaxLocation",
    header: "vtkAMRBaseParticlesReader.h".}
proc GetTotalNumberOfParticles*(this: var vtkAMRBaseParticlesReader): cint {.
    importcpp: "GetTotalNumberOfParticles", header: "vtkAMRBaseParticlesReader.h".}