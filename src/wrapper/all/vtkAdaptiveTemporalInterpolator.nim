## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTemporalInterpolator.h
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
##  @class   vtkAdaptiveTemporalInterpolator
##  @brief   interpolate datasets between time steps to produce a new dataset
##
##  vtkAdaptiveTemporalInterpolator extends vtkTemporalInterpolator to
##  interpolate between timesteps when mesh topology appears to be different.
##

import
  vtkFiltersParallelModule, vtkTemporalInterpolator

discard "forward decl of vtkDataSet"
discard "forward decl of vtkPointSet"
type
  vtkAdaptiveTemporalInterpolator* {.importcpp: "vtkAdaptiveTemporalInterpolator", header: "vtkAdaptiveTemporalInterpolator.h",
                                    bycopy.} = object of vtkTemporalInterpolator
    vtkAdaptiveTemporalInterpolator* {.importc: "vtkAdaptiveTemporalInterpolator".}: VTK_NEWINSTANCE


proc New*(): ptr vtkAdaptiveTemporalInterpolator {.
    importcpp: "vtkAdaptiveTemporalInterpolator::New(@)",
    header: "vtkAdaptiveTemporalInterpolator.h".}
type
  vtkAdaptiveTemporalInterpolatorSuperclass* = vtkTemporalInterpolator

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAdaptiveTemporalInterpolator::IsTypeOf(@)",
    header: "vtkAdaptiveTemporalInterpolator.h".}
proc IsA*(this: var vtkAdaptiveTemporalInterpolator; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkAdaptiveTemporalInterpolator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAdaptiveTemporalInterpolator {.
    importcpp: "vtkAdaptiveTemporalInterpolator::SafeDownCast(@)",
    header: "vtkAdaptiveTemporalInterpolator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAdaptiveTemporalInterpolator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTemporalInterpolator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAdaptiveTemporalInterpolator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAdaptiveTemporalInterpolator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAdaptiveTemporalInterpolator; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkAdaptiveTemporalInterpolator.h".}