## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkProgrammableSource.h
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
##  @class   vtkProgrammableSource
##  @brief   generate source dataset via a user-specified function
##
##  vtkProgrammableSource is a source object that is programmable by the
##  user. To use this object, you must specify a function that creates the
##  output.  It is possible to generate an output dataset of any (concrete)
##  type; it is up to the function to properly initialize and define the
##  output. Typically, you use one of the methods to get a concrete output
##  type (e.g., GetPolyDataOutput() or GetStructuredPointsOutput()), and
##  then manipulate the output in the user-specified function.
##
##  Example use of this include writing a function to read a data file or
##  interface to another system. (You might want to do this in favor of
##  deriving a new class.) Another important use of this class is that it
##  allows users of interpreters (e.g., Java) the ability to write
##  source objects without having to recompile C++ code or generate new
##  libraries.
##  @sa
##  vtkProgrammableFilter vtkProgrammableAttributeDataFilter
##  vtkProgrammableDataObjectSource
##

import
  vtkDataObjectAlgorithm, vtkFiltersSourcesModule

discard "forward decl of vtkGraph"
discard "forward decl of vtkMolecule"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkRectilinearGrid"
discard "forward decl of vtkStructuredGrid"
discard "forward decl of vtkStructuredPoints"
discard "forward decl of vtkTable"
discard "forward decl of vtkUnstructuredGrid"
type
  vtkProgrammableSource* {.importcpp: "vtkProgrammableSource",
                          header: "vtkProgrammableSource.h", bycopy.} = object of vtkDataObjectAlgorithm
    vtkProgrammableSource* {.importc: "vtkProgrammableSource".}: VTK_NEWINSTANCE
    ##  function to invoke
    ##  function to invoke


proc New*(): ptr vtkProgrammableSource {.importcpp: "vtkProgrammableSource::New(@)",
                                     header: "vtkProgrammableSource.h".}
type
  vtkProgrammableSourceSuperclass* = vtkDataObjectAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkProgrammableSource::IsTypeOf(@)",
    header: "vtkProgrammableSource.h".}
proc IsA*(this: var vtkProgrammableSource; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkProgrammableSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkProgrammableSource {.
    importcpp: "vtkProgrammableSource::SafeDownCast(@)",
    header: "vtkProgrammableSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkProgrammableSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObjectAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkProgrammableSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkProgrammableSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkProgrammableSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkProgrammableSource.h".}
type
  vtkProgrammableSourceProgrammableMethodCallbackType* = proc (arg: pointer)

proc SetExecuteMethod*(this: var vtkProgrammableSource; f: proc (a1: pointer);
                      arg: pointer) {.importcpp: "SetExecuteMethod",
                                    header: "vtkProgrammableSource.h".}
proc SetExecuteMethodArgDelete*(this: var vtkProgrammableSource;
                               f: proc (a1: pointer)) {.
    importcpp: "SetExecuteMethodArgDelete", header: "vtkProgrammableSource.h".}
proc SetRequestInformationMethod*(this: var vtkProgrammableSource;
                                 f: proc (a1: pointer)) {.
    importcpp: "SetRequestInformationMethod", header: "vtkProgrammableSource.h".}
proc GetPolyDataOutput*(this: var vtkProgrammableSource): ptr vtkPolyData {.
    importcpp: "GetPolyDataOutput", header: "vtkProgrammableSource.h".}
proc GetStructuredPointsOutput*(this: var vtkProgrammableSource): ptr vtkStructuredPoints {.
    importcpp: "GetStructuredPointsOutput", header: "vtkProgrammableSource.h".}
proc GetStructuredGridOutput*(this: var vtkProgrammableSource): ptr vtkStructuredGrid {.
    importcpp: "GetStructuredGridOutput", header: "vtkProgrammableSource.h".}
proc GetUnstructuredGridOutput*(this: var vtkProgrammableSource): ptr vtkUnstructuredGrid {.
    importcpp: "GetUnstructuredGridOutput", header: "vtkProgrammableSource.h".}
proc GetRectilinearGridOutput*(this: var vtkProgrammableSource): ptr vtkRectilinearGrid {.
    importcpp: "GetRectilinearGridOutput", header: "vtkProgrammableSource.h".}
proc GetGraphOutput*(this: var vtkProgrammableSource): ptr vtkGraph {.
    importcpp: "GetGraphOutput", header: "vtkProgrammableSource.h".}
proc GetMoleculeOutput*(this: var vtkProgrammableSource): ptr vtkMolecule {.
    importcpp: "GetMoleculeOutput", header: "vtkProgrammableSource.h".}
proc GetTableOutput*(this: var vtkProgrammableSource): ptr vtkTable {.
    importcpp: "GetTableOutput", header: "vtkProgrammableSource.h".}