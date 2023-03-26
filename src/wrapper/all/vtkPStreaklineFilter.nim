## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPStreaklineFilter.h
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
##  @class   vtkPStreaklineFilter
##  @brief   A Parallel Particle tracer for unsteady vector fields
##
##  vtkPStreaklineFilter is a filter that integrates a vector field to generate
##
##
##  @sa
##  vtkPStreaklineFilterBase has the details of the algorithms
##

import
  vtkFiltersParallelFlowPathsModule, vtkPParticleTracerBase, vtkSmartPointer,
  vtkStreaklineFilter

type
  vtkPStreaklineFilter* {.importcpp: "vtkPStreaklineFilter",
                         header: "vtkPStreaklineFilter.h", bycopy.} = object of vtkPParticleTracerBase
    vtkPStreaklineFilter* {.importc: "vtkPStreaklineFilter".}: VTK_NEWINSTANCE

  vtkPStreaklineFilterSuperclass* = vtkPParticleTracerBase

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPStreaklineFilter::IsTypeOf(@)",
    header: "vtkPStreaklineFilter.h".}
proc IsA*(this: var vtkPStreaklineFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPStreaklineFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPStreaklineFilter {.
    importcpp: "vtkPStreaklineFilter::SafeDownCast(@)",
    header: "vtkPStreaklineFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPStreaklineFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPParticleTracerBase :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPStreaklineFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPStreaklineFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPStreaklineFilter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPStreaklineFilter.h".}
proc New*(): ptr vtkPStreaklineFilter {.importcpp: "vtkPStreaklineFilter::New(@)",
                                    header: "vtkPStreaklineFilter.h".}