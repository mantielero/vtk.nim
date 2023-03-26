## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPParticleTracer.h
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
##  @class   vtkPParticleTracer
##  @brief   A Parallel Particle tracer for unsteady vector fields
##
##  vtkPParticleTracer is a filter that integrates a vector field to generate
##
##
##  @sa
##  vtkPParticleTracerBase has the details of the algorithms
##

import
  vtkPParticleTracerBase, vtkSmartPointer, vtkFiltersParallelFlowPathsModule

type
  vtkPParticleTracer* {.importcpp: "vtkPParticleTracer",
                       header: "vtkPParticleTracer.h", bycopy.} = object of vtkPParticleTracerBase
    vtkPParticleTracer* {.importc: "vtkPParticleTracer".}: VTK_NEWINSTANCE

  vtkPParticleTracerSuperclass* = vtkPParticleTracerBase

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPParticleTracer::IsTypeOf(@)", header: "vtkPParticleTracer.h".}
proc IsA*(this: var vtkPParticleTracer; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPParticleTracer.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPParticleTracer {.
    importcpp: "vtkPParticleTracer::SafeDownCast(@)",
    header: "vtkPParticleTracer.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPParticleTracer :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPParticleTracerBase :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPParticleTracer :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPParticleTracer :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPParticleTracer; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPParticleTracer.h".}
proc New*(): ptr vtkPParticleTracer {.importcpp: "vtkPParticleTracer::New(@)",
                                  header: "vtkPParticleTracer.h".}