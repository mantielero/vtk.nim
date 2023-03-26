## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkParallelReader.h
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
##  @class   vtkParallelReader
##  @brief   Superclass for algorithms that are parallel aware
##
##  vtkParallelReader is a vtkReaderAlgorithm subclass that provides
##  a specialized API to develop readers that are parallel aware (i.e.
##  can handle piece requests) but do not natively support time series.
##  This reader adds support for file series in order to support time
##  series.
##

import
  vtkCommonExecutionModelModule, vtkReaderAlgorithm

discard "forward decl of vtkParallelReaderInternal"
type
  vtkParallelReader* {.importcpp: "vtkParallelReader",
                      header: "vtkParallelReader.h", bycopy.} = object of vtkReaderAlgorithm
    vtkParallelReader* {.importc: "vtkParallelReader".}: VTK_NEWINSTANCE
    char* {.importc: "char".}: VTK_FILEPATH
    char* {.importc: "char".}: VTK_FILEPATH

  vtkParallelReaderSuperclass* = vtkReaderAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkParallelReader::IsTypeOf(@)", header: "vtkParallelReader.h".}
proc IsA*(this: var vtkParallelReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkParallelReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkParallelReader {.
    importcpp: "vtkParallelReader::SafeDownCast(@)", header: "vtkParallelReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkParallelReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkReaderAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkParallelReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkParallelReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkParallelReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkParallelReader.h".}
## !!!Ignored construct:  *
##  Add a filename to be read. Since this superclass handles
##  file series to support time, multiple filenames can be added.
##  Note that the time values are either integers growing sequentially,
##  or are obtained from individual files as supported by the subclass.
##  void AddFileName ( VTK_FILEPATH const char * fname ) ;
## Error: token expected: ) but got: *!!!

proc ClearFileNames*(this: var vtkParallelReader) {.importcpp: "ClearFileNames",
    header: "vtkParallelReader.h".}
proc GetNumberOfFileNames*(this: vtkParallelReader): cint {.noSideEffect,
    importcpp: "GetNumberOfFileNames", header: "vtkParallelReader.h".}
## !!!Ignored construct:  * GetFileName ( int i ) const ;
## Error: identifier expected, but got: *!!!

## !!!Ignored construct:  * GetCurrentFileName ( ) const ;
## Error: identifier expected, but got: *!!!

proc ReadMetaData*(this: var vtkParallelReader; metadata: ptr vtkInformation): cint {.
    importcpp: "ReadMetaData", header: "vtkParallelReader.h".}
proc ReadMesh*(this: var vtkParallelReader; piece: cint; npieces: cint; nghosts: cint;
              timestep: cint; output: ptr vtkDataObject): cint {.
    importcpp: "ReadMesh", header: "vtkParallelReader.h".}
proc ReadPoints*(this: var vtkParallelReader; piece: cint; npieces: cint; nghosts: cint;
                timestep: cint; output: ptr vtkDataObject): cint {.
    importcpp: "ReadPoints", header: "vtkParallelReader.h".}
proc ReadArrays*(this: var vtkParallelReader; piece: cint; npieces: cint; nghosts: cint;
                timestep: cint; output: ptr vtkDataObject): cint {.
    importcpp: "ReadArrays", header: "vtkParallelReader.h".}