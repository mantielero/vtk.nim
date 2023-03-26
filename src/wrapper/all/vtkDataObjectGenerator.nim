## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDataObjectGenerator.h
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
##  @class   vtkDataObjectGenerator
##  @brief   produces simple (composite or atomic) data
##  sets for testing.
##
##  vtkDataObjectGenerator parses a string and produces dataobjects from the
##  dataobject template names it sees in the string. For example, if the string
##  contains "ID1" the generator will create a vtkImageData. "UF1", "RG1",
##  "SG1", "PD1", and "UG1" will produce vtkUniformGrid, vtkRectilinearGrid,
##  vtkStructuredGrid, vtkPolyData and vtkUnstructuredGrid respectively.
##  "PD2" will produce an alternate vtkPolyData. You
##  can compose composite datasets from the atomic ones listed above
##  by placing them within one of the two composite dataset identifiers
##  - "MB{}" or "HB[]". "MB{ ID1 PD1 MB{} }" for example will create a
##  vtkMultiBlockDataSet consisting of three blocks: image data, poly data,
##  multi-block (empty). Hierarchical Box data sets additionally require
##  the notion of groups, declared within "()" braces, to specify AMR depth.
##  "HB[ (UF1)(UF1)(UF1) ]" will create a vtkHierarchicalBoxDataSet representing
##  an octree that is three levels deep, in which the firstmost cell in each level
##  is refined.
##

import
  vtkDataObjectAlgorithm, vtkFiltersCoreModule

discard "forward decl of vtkInternalStructureCache"
type
  vtkDataObjectGenerator* {.importcpp: "vtkDataObjectGenerator",
                           header: "vtkDataObjectGenerator.h", bycopy.} = object of vtkDataObjectAlgorithm
    vtkDataObjectGenerator* {.importc: "vtkDataObjectGenerator".}: VTK_NEWINSTANCE
    ##  a record of the structure
    ##  Helper for RequestDataObject
    ##  create the templated atomic data sets
    ##  increases for each dataset index
    ##  increases for each sub data set
    ##  increases for each group index
    ##  used to filling in point and cell values with unique Ids
    ##  assign point and cell values to each point and cell


proc New*(): ptr vtkDataObjectGenerator {.importcpp: "vtkDataObjectGenerator::New(@)",
                                      header: "vtkDataObjectGenerator.h".}
type
  vtkDataObjectGeneratorSuperclass* = vtkDataObjectAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDataObjectGenerator::IsTypeOf(@)",
    header: "vtkDataObjectGenerator.h".}
proc IsA*(this: var vtkDataObjectGenerator; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkDataObjectGenerator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDataObjectGenerator {.
    importcpp: "vtkDataObjectGenerator::SafeDownCast(@)",
    header: "vtkDataObjectGenerator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDataObjectGenerator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObjectAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDataObjectGenerator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDataObjectGenerator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDataObjectGenerator; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkDataObjectGenerator.h".}
proc SetProgram*(this: var vtkDataObjectGenerator; _arg: cstring) {.
    importcpp: "SetProgram", header: "vtkDataObjectGenerator.h".}
proc GetProgram*(this: var vtkDataObjectGenerator): cstring {.
    importcpp: "GetProgram", header: "vtkDataObjectGenerator.h".}
  ## /@}