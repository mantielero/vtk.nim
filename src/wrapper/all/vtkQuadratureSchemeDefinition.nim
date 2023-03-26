## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkQuadratureSchemeDefinition.h
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
##  @class   vtkQuadratureSchemeDefinition
##
##  An Elemental data type that holds a definition of a
##  numerical quadrature scheme. The definition contains
##  the requisite information to interpolate to the so called
##  quadrature points of the specific scheme. namely:
##
##  <pre>
##  1)
##  A matrix of shape function weights(shape functions evaluated
##  at parametric coordinates of the quadrature points).
##
##  2)
##  The number of quadrature points and cell nodes. These parameters
##  size the matrix, and allow for convenient evaluation by users
##  of the definition.
##  </pre>
##

import
  vtkCommonDataModelModule, vtkObject

discard "forward decl of vtkInformationQuadratureSchemeDefinitionVectorKey"
discard "forward decl of vtkInformationStringKey"
discard "forward decl of vtkXMLDataElement"
type
  vtkQuadratureSchemeDefinition* {.importcpp: "vtkQuadratureSchemeDefinition",
                                  header: "vtkQuadratureSchemeDefinition.h",
                                  bycopy.} = object of vtkObject ##  vtk stuff
                                                            ## *
                                                            ##  Allocate/De-allocate resources that will be used by the definition.
                                                            ##  This must be called after Set*. Caller's responsibility.
                                                            ##
    vtkQuadratureSchemeDefinition* {.importc: "vtkQuadratureSchemeDefinition".}: VTK_NEWINSTANCE

  vtkQuadratureSchemeDefinitionSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkQuadratureSchemeDefinition::IsTypeOf(@)",
    header: "vtkQuadratureSchemeDefinition.h".}
proc IsA*(this: var vtkQuadratureSchemeDefinition; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkQuadratureSchemeDefinition.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkQuadratureSchemeDefinition {.
    importcpp: "vtkQuadratureSchemeDefinition::SafeDownCast(@)",
    header: "vtkQuadratureSchemeDefinition.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkQuadratureSchemeDefinition :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkQuadratureSchemeDefinition :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkQuadratureSchemeDefinition :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkQuadratureSchemeDefinition; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkQuadratureSchemeDefinition.h".}
proc DICTIONARY*(): ptr vtkInformationQuadratureSchemeDefinitionVectorKey {.
    importcpp: "vtkQuadratureSchemeDefinition::DICTIONARY(@)",
    header: "vtkQuadratureSchemeDefinition.h".}
proc QUADRATURE_OFFSET_ARRAY_NAME*(): ptr vtkInformationStringKey {.importcpp: "vtkQuadratureSchemeDefinition::QUADRATURE_OFFSET_ARRAY_NAME(@)",
    header: "vtkQuadratureSchemeDefinition.h".}
proc New*(): ptr vtkQuadratureSchemeDefinition {.
    importcpp: "vtkQuadratureSchemeDefinition::New(@)",
    header: "vtkQuadratureSchemeDefinition.h".}
proc DeepCopy*(this: var vtkQuadratureSchemeDefinition;
              other: ptr vtkQuadratureSchemeDefinition): cint {.
    importcpp: "DeepCopy", header: "vtkQuadratureSchemeDefinition.h".}
proc SaveState*(this: var vtkQuadratureSchemeDefinition; root: ptr vtkXMLDataElement): cint {.
    importcpp: "SaveState", header: "vtkQuadratureSchemeDefinition.h".}
proc RestoreState*(this: var vtkQuadratureSchemeDefinition;
                  root: ptr vtkXMLDataElement): cint {.importcpp: "RestoreState",
    header: "vtkQuadratureSchemeDefinition.h".}
proc Clear*(this: var vtkQuadratureSchemeDefinition) {.importcpp: "Clear",
    header: "vtkQuadratureSchemeDefinition.h".}
proc Initialize*(this: var vtkQuadratureSchemeDefinition; cellType: cint;
                numberOfNodes: cint; numberOfQuadraturePoints: cint;
                shapeFunctionWeights: ptr cdouble) {.importcpp: "Initialize",
    header: "vtkQuadratureSchemeDefinition.h".}
proc Initialize*(this: var vtkQuadratureSchemeDefinition; cellType: cint;
                numberOfNodes: cint; numberOfQuadraturePoints: cint;
                shapeFunctionWeights: ptr cdouble; quadratureWeights: ptr cdouble) {.
    importcpp: "Initialize", header: "vtkQuadratureSchemeDefinition.h".}
proc GetCellType*(this: vtkQuadratureSchemeDefinition): cint {.noSideEffect,
    importcpp: "GetCellType", header: "vtkQuadratureSchemeDefinition.h".}
proc GetQuadratureKey*(this: vtkQuadratureSchemeDefinition): cint {.noSideEffect,
    importcpp: "GetQuadratureKey", header: "vtkQuadratureSchemeDefinition.h".}
proc GetNumberOfNodes*(this: vtkQuadratureSchemeDefinition): cint {.noSideEffect,
    importcpp: "GetNumberOfNodes", header: "vtkQuadratureSchemeDefinition.h".}
proc GetNumberOfQuadraturePoints*(this: vtkQuadratureSchemeDefinition): cint {.
    noSideEffect, importcpp: "GetNumberOfQuadraturePoints",
    header: "vtkQuadratureSchemeDefinition.h".}
proc GetShapeFunctionWeights*(this: vtkQuadratureSchemeDefinition): ptr cdouble {.
    noSideEffect, importcpp: "GetShapeFunctionWeights",
    header: "vtkQuadratureSchemeDefinition.h".}
proc GetShapeFunctionWeights*(this: vtkQuadratureSchemeDefinition;
                             quadraturePointId: cint): ptr cdouble {.noSideEffect,
    importcpp: "GetShapeFunctionWeights",
    header: "vtkQuadratureSchemeDefinition.h".}
proc GetQuadratureWeights*(this: vtkQuadratureSchemeDefinition): ptr cdouble {.
    noSideEffect, importcpp: "GetQuadratureWeights",
    header: "vtkQuadratureSchemeDefinition.h".}