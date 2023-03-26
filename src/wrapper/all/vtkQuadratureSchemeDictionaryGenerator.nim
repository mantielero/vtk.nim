## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkQuadratureSchemeDictionaryGenerator.h
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
##  @class   vtkQuadratureSchemeDictionaryGenerator
##
##
##  Given an unstructured grid on its input this filter generates
##  for each data array in point data dictionary (ie an instance of
##  vtkInformationQuadratureSchemeDefinitionVectorKey). This filter
##  has been introduced to facilitate testing of the vtkQuadrature*
##  classes as these cannot operate with the dictionary. This class
##  is for testing and should not be used for application development.
##
##  @sa
##  vtkQuadraturePointInterpolator, vtkQuadraturePointsGenerator, vtkQuadratureSchemeDefinition
##

import
  vtkDataSetAlgorithm, vtkFiltersGeneralModule

discard "forward decl of vtkPolyData"
discard "forward decl of vtkUnstructuredGrid"
discard "forward decl of vtkInformation"
discard "forward decl of vtkInformationVector"
type
  vtkQuadratureSchemeDictionaryGenerator* {.
      importcpp: "vtkQuadratureSchemeDictionaryGenerator",
      header: "vtkQuadratureSchemeDictionaryGenerator.h", bycopy.} = object of vtkDataSetAlgorithm
    vtkQuadratureSchemeDictionaryGenerator*
        {.importc: "vtkQuadratureSchemeDictionaryGenerator".}: VTK_NEWINSTANCE

  vtkQuadratureSchemeDictionaryGeneratorSuperclass* = vtkDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkQuadratureSchemeDictionaryGenerator::IsTypeOf(@)",
    header: "vtkQuadratureSchemeDictionaryGenerator.h".}
proc IsA*(this: var vtkQuadratureSchemeDictionaryGenerator; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkQuadratureSchemeDictionaryGenerator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkQuadratureSchemeDictionaryGenerator {.
    importcpp: "vtkQuadratureSchemeDictionaryGenerator::SafeDownCast(@)",
    header: "vtkQuadratureSchemeDictionaryGenerator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkQuadratureSchemeDictionaryGenerator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkQuadratureSchemeDictionaryGenerator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkQuadratureSchemeDictionaryGenerator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkQuadratureSchemeDictionaryGenerator; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkQuadratureSchemeDictionaryGenerator.h".}
proc New*(): ptr vtkQuadratureSchemeDictionaryGenerator {.
    importcpp: "vtkQuadratureSchemeDictionaryGenerator::New(@)",
    header: "vtkQuadratureSchemeDictionaryGenerator.h".}