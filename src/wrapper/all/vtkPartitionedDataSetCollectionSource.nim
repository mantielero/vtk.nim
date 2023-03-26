## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPartitionedDataSetCollectionSource.h
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
##  @class vtkPartitionedDataSetCollectionSource
##  @brief a source that produces a vtkPartitionedDataSetCollection.
##
##  vtkPartitionedDataSetCollection generates a vtkPartitionedDataSetCollection
##  for testing purposes. It uses vtkParametricFunctionSource internally to
##  generate different types of surfaces for each partitioned dataset in the
##  collection. Each partitioned dataset is split among ranks in an even fashion.
##  Thus the number of partitions per rank for a partitioned dataset are always
##  different.
##

import
  vtkFiltersSourcesModule, vtkPartitionedDataSetCollectionAlgorithm

type
  vtkPartitionedDataSetCollectionSource* {.
      importcpp: "vtkPartitionedDataSetCollectionSource",
      header: "vtkPartitionedDataSetCollectionSource.h", bycopy.} = object of vtkPartitionedDataSetCollectionAlgorithm
    vtkPartitionedDataSetCollectionSource*
        {.importc: "vtkPartitionedDataSetCollectionSource".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPartitionedDataSetCollectionSource {.
    importcpp: "vtkPartitionedDataSetCollectionSource::New(@)",
    header: "vtkPartitionedDataSetCollectionSource.h".}
type
  vtkPartitionedDataSetCollectionSourceSuperclass* = vtkPartitionedDataSetCollectionAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPartitionedDataSetCollectionSource::IsTypeOf(@)",
    header: "vtkPartitionedDataSetCollectionSource.h".}
proc IsA*(this: var vtkPartitionedDataSetCollectionSource; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPartitionedDataSetCollectionSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPartitionedDataSetCollectionSource {.
    importcpp: "vtkPartitionedDataSetCollectionSource::SafeDownCast(@)",
    header: "vtkPartitionedDataSetCollectionSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPartitionedDataSetCollectionSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPartitionedDataSetCollectionAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPartitionedDataSetCollectionSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPartitionedDataSetCollectionSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPartitionedDataSetCollectionSource; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkPartitionedDataSetCollectionSource.h".}
proc SetNumberOfShapes*(this: var vtkPartitionedDataSetCollectionSource; _arg: cint) {.
    importcpp: "SetNumberOfShapes",
    header: "vtkPartitionedDataSetCollectionSource.h".}
proc GetNumberOfShapesMinValue*(this: var vtkPartitionedDataSetCollectionSource): cint {.
    importcpp: "GetNumberOfShapesMinValue",
    header: "vtkPartitionedDataSetCollectionSource.h".}
proc GetNumberOfShapesMaxValue*(this: var vtkPartitionedDataSetCollectionSource): cint {.
    importcpp: "GetNumberOfShapesMaxValue",
    header: "vtkPartitionedDataSetCollectionSource.h".}
## !!!Ignored construct:  virtual int GetNumberOfShapes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfShapes  of  << this -> NumberOfShapes ) ; return this -> NumberOfShapes ; } ;
## Error: expected ';'!!!
