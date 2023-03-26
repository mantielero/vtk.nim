## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkParticleTracer.h
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
##  @class   vtkParticleTracer
##  @brief   A Parallel Particle tracer for unsteady vector fields
##
##  vtkParticleTracer is a filter that integrates a vector field to advect particles
##
##
##  @sa
##  vtkParticleTracerBase has the details of the algorithms
##

import
  vtkFiltersFlowPathsModule, vtkParticleTracerBase, vtkSmartPointer

type
  vtkParticleTracer* {.importcpp: "vtkParticleTracer",
                      header: "vtkParticleTracer.h", bycopy.} = object of vtkParticleTracerBase
    vtkParticleTracer* {.importc: "vtkParticleTracer".}: VTK_NEWINSTANCE

  vtkParticleTracerSuperclass* = vtkParticleTracerBase

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkParticleTracer::IsTypeOf(@)", header: "vtkParticleTracer.h".}
proc IsA*(this: var vtkParticleTracer; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkParticleTracer.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkParticleTracer {.
    importcpp: "vtkParticleTracer::SafeDownCast(@)", header: "vtkParticleTracer.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkParticleTracer :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkParticleTracerBase :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkParticleTracer :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkParticleTracer :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkParticleTracer; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkParticleTracer.h".}
proc New*(): ptr vtkParticleTracer {.importcpp: "vtkParticleTracer::New(@)",
                                 header: "vtkParticleTracer.h".}