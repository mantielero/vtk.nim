## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkProgrammableDataObjectSource.h
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
##  @class   vtkProgrammableDataObjectSource
##  @brief   generate source data object via a user-specified function
##
##  vtkProgrammableDataObjectSource is a source object that is programmable by
##  the user. The output of the filter is a data object (vtkDataObject) which
##  represents data via an instance of field data. To use this object, you
##  must specify a function that creates the output.
##
##  Example use of this filter includes reading tabular data and encoding it
##  as vtkFieldData. You can then use filters like vtkDataObjectToDataSetFilter
##  to convert the data object to a dataset and then visualize it.  Another
##  important use of this class is that it allows users of interpreters (e.g.,
##  Java) the ability to write source objects without having to
##  recompile C++ code or generate new libraries.
##
##  @sa
##  vtkProgrammableFilter vtkProgrammableAttributeDataFilter
##  vtkProgrammableSource vtkDataObjectToDataSetFilter
##

import
  vtkDataObjectAlgorithm, vtkFiltersSourcesModule

type
  vtkProgrammableDataObjectSource* {.importcpp: "vtkProgrammableDataObjectSource", header: "vtkProgrammableDataObjectSource.h",
                                    bycopy.} = object of vtkDataObjectAlgorithm
    vtkProgrammableDataObjectSource* {.importc: "vtkProgrammableDataObjectSource".}: VTK_NEWINSTANCE
    ##  function to invoke


proc New*(): ptr vtkProgrammableDataObjectSource {.
    importcpp: "vtkProgrammableDataObjectSource::New(@)",
    header: "vtkProgrammableDataObjectSource.h".}
type
  vtkProgrammableDataObjectSourceSuperclass* = vtkDataObjectAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkProgrammableDataObjectSource::IsTypeOf(@)",
    header: "vtkProgrammableDataObjectSource.h".}
proc IsA*(this: var vtkProgrammableDataObjectSource; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkProgrammableDataObjectSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkProgrammableDataObjectSource {.
    importcpp: "vtkProgrammableDataObjectSource::SafeDownCast(@)",
    header: "vtkProgrammableDataObjectSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkProgrammableDataObjectSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObjectAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkProgrammableDataObjectSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkProgrammableDataObjectSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkProgrammableDataObjectSource; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkProgrammableDataObjectSource.h".}
type
  vtkProgrammableDataObjectSourceProgrammableMethodCallbackType* = proc (
      arg: pointer)

proc SetExecuteMethod*(this: var vtkProgrammableDataObjectSource;
                      f: proc (a1: pointer); arg: pointer) {.
    importcpp: "SetExecuteMethod", header: "vtkProgrammableDataObjectSource.h".}
proc SetExecuteMethodArgDelete*(this: var vtkProgrammableDataObjectSource;
                               f: proc (a1: pointer)) {.
    importcpp: "SetExecuteMethodArgDelete",
    header: "vtkProgrammableDataObjectSource.h".}