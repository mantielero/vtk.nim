## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkReaderAlgorithm.h
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
##  @class   vtkReaderAlgorithm
##  @brief   Superclass for readers that implement a simplified API.
##
##  This class and associated subclasses were created to make it easier to
##  develop readers. When directly subclassing from other algorithm classes
##  one has to learn a general purpose API that somewhat obfuscates pipeline
##  functionality behind information keys. One has to know how to find
##  time and pieces requests using keys for example. Furthermore, these
##  classes together with specialized executives can implement common
##  reader functionality for things such as file series (for time and/or
##  partitions), caching, mapping time requests to indices etc.
##  This class implements the most basic API which is specialized as
##  needed by subclasses (for file series for example).
##

import
  vtkAlgorithm, vtkCommonExecutionModelModule

type
  vtkReaderAlgorithm* {.importcpp: "vtkReaderAlgorithm",
                       header: "vtkReaderAlgorithm.h", bycopy.} = object of vtkAlgorithm
    vtkReaderAlgorithm* {.importc: "vtkReaderAlgorithm".}: VTK_NEWINSTANCE

  vtkReaderAlgorithmSuperclass* = vtkAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkReaderAlgorithm::IsTypeOf(@)", header: "vtkReaderAlgorithm.h".}
proc IsA*(this: var vtkReaderAlgorithm; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkReaderAlgorithm.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkReaderAlgorithm {.
    importcpp: "vtkReaderAlgorithm::SafeDownCast(@)",
    header: "vtkReaderAlgorithm.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkReaderAlgorithm :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkReaderAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkReaderAlgorithm :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkReaderAlgorithm; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkReaderAlgorithm.h".}
proc ProcessRequest*(this: var vtkReaderAlgorithm; request: ptr vtkInformation;
                    inInfo: ptr ptr vtkInformationVector;
                    outInfo: ptr vtkInformationVector): vtkTypeBool {.
    importcpp: "ProcessRequest", header: "vtkReaderAlgorithm.h".}
proc CreateOutput*(this: var vtkReaderAlgorithm; currentOutput: ptr vtkDataObject): ptr vtkDataObject {.
    importcpp: "CreateOutput", header: "vtkReaderAlgorithm.h".}
proc ReadMetaData*(this: var vtkReaderAlgorithm; metadata: ptr vtkInformation): cint {.
    importcpp: "ReadMetaData", header: "vtkReaderAlgorithm.h".}
proc ReadTimeDependentMetaData*(this: var vtkReaderAlgorithm; a2: cint; a3: ptr vtkInformation): cint {.
    importcpp: "ReadTimeDependentMetaData", header: "vtkReaderAlgorithm.h".}
  ## metadata
proc ReadMesh*(this: var vtkReaderAlgorithm; piece: cint; npieces: cint; nghosts: cint;
              timestep: cint; output: ptr vtkDataObject): cint {.
    importcpp: "ReadMesh", header: "vtkReaderAlgorithm.h".}
proc ReadPoints*(this: var vtkReaderAlgorithm; piece: cint; npieces: cint;
                nghosts: cint; timestep: cint; output: ptr vtkDataObject): cint {.
    importcpp: "ReadPoints", header: "vtkReaderAlgorithm.h".}
proc ReadArrays*(this: var vtkReaderAlgorithm; piece: cint; npieces: cint;
                nghosts: cint; timestep: cint; output: ptr vtkDataObject): cint {.
    importcpp: "ReadArrays", header: "vtkReaderAlgorithm.h".}