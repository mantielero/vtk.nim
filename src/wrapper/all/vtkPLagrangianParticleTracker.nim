## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPLagrangianParticleTracker.h
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
##  @class   vtkPLagrangianParticleTracker
##  @brief    parallel Lagrangian particle tracker
##
##  This class implements parallel Lagrangian particle tracker.
##  The implementation is as follows:
##  First seeds input is parsed to create particle in each rank
##  Particles which are not contained by the flow in a rank are sent to other ranks
##  which can potentially contain it and will grab only if they actually contain it
##  Then each rank begin integrating.
##  When a particle goes out of domain, the particle will be sent to other ranks
##  the same way.
##  When a rank runs out of particle, it waits for other potential particles
##  from other ranks.
##  When all ranks run out of particles, integration is over.
##  The master rank takes care of communications between rank regarding integration termination
##  particles are directly streamed rank to rank, without going through the master
##
##  @sa
##  vtkStreamTracer
##

import
  vtkFiltersParallelFlowPathsModule, vtkLagrangianParticleTracker, vtkNew

discard "forward decl of ParticleFeedManager"
discard "forward decl of ParticleIdManager"
discard "forward decl of ParticleStreamManager"
discard "forward decl of vtkMPIController"
discard "forward decl of vtkMultiBlockDataSet"
discard "forward decl of vtkUnstructuredGrid"
type
  vtkPLagrangianParticleTracker* {.importcpp: "vtkPLagrangianParticleTracker",
                                  header: "vtkPLagrangianParticleTracker.h",
                                  bycopy.} = object of vtkLagrangianParticleTracker
    vtkPLagrangianParticleTracker* {.importc: "vtkPLagrangianParticleTracker".}: VTK_NEWINSTANCE

  vtkPLagrangianParticleTrackerSuperclass* = vtkLagrangianParticleTracker

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPLagrangianParticleTracker::IsTypeOf(@)",
    header: "vtkPLagrangianParticleTracker.h".}
proc IsA*(this: var vtkPLagrangianParticleTracker; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPLagrangianParticleTracker.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPLagrangianParticleTracker {.
    importcpp: "vtkPLagrangianParticleTracker::SafeDownCast(@)",
    header: "vtkPLagrangianParticleTracker.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPLagrangianParticleTracker :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkLagrangianParticleTracker :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPLagrangianParticleTracker :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPLagrangianParticleTracker :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPLagrangianParticleTracker; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkPLagrangianParticleTracker.h".}
proc New*(): ptr vtkPLagrangianParticleTracker {.
    importcpp: "vtkPLagrangianParticleTracker::New(@)",
    header: "vtkPLagrangianParticleTracker.h".}
## !!!Ignored construct:  *
##  Get the complete number of created particles
##  virtual vtkIdType GetParticleCounterParticleCounter ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ParticleCounter  of  << this -> ParticleCounter ) ; return this -> ParticleCounter ; } ;
## Error: expected ';'!!!
