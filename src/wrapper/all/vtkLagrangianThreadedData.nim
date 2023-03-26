## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLagrangianParticleTracker.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##     This software is distributed WITHOUT ANY WARRANTY; without even
##     the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##     PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @struct   vtkLagrangianThreadedData
##  @brief   struct to hold a user data
##
##  Struct to hold threaded data used by the Lagrangian Particle Tracker.
##  Can be inherited and initialized in custom models.
##

import
  vtkBilinearQuadIntersection, vtkFiltersFlowPathsModule, vtkGenericCell,
  vtkIdList, vtkPolyData

discard "forward decl of vtkDataObject"
discard "forward decl of vtkInitialValueProblemSolver"
type
  vtkLagrangianThreadedData* {.importcpp: "vtkLagrangianThreadedData",
                              header: "vtkLagrangianThreadedData.h", bycopy.} = object
    GenericCell* {.importc: "GenericCell".}: vtkNew[vtkGenericCell]
    IdList* {.importc: "IdList".}: vtkNew[vtkIdList]
    ParticlePathsOutput* {.importc: "ParticlePathsOutput".}: vtkNew[vtkPolyData] ##  FindInLocators cache data
    LastDataSetIndex* {.importc: "LastDataSetIndex".}: cint = -1
    LastCellId* {.importc: "LastCellId".}: vtkIdType = -1
    LastCellPosition* {.importc: "LastCellPosition".}: array[3, cdouble]
    LastWeights* {.importc: "LastWeights".}: vector[cdouble]
    BilinearQuadIntersection* {.importc: "BilinearQuadIntersection".}: ptr vtkBilinearQuadIntersection
    InteractionOutput* {.importc: "InteractionOutput".}: ptr vtkDataObject
    Integrator* {.importc: "Integrator".}: ptr vtkInitialValueProblemSolver


proc constructvtkLagrangianThreadedData*(): vtkLagrangianThreadedData {.
    constructor, importcpp: "vtkLagrangianThreadedData(@)",
    header: "vtkLagrangianThreadedData.h".}
proc destroyvtkLagrangianThreadedData*(this: var vtkLagrangianThreadedData) {.
    importcpp: "#.~vtkLagrangianThreadedData()",
    header: "vtkLagrangianThreadedData.h".}