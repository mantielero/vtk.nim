## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPOutlineCornerFilter.h
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
##  @class   vtkPOutlineCornerFilter
##  @brief   create wireframe outline corners for arbitrary data set
##
##  vtkPOutlineCornerFilter works like vtkOutlineCornerFilter,
##  but it looks for data
##  partitions in other processes.  It assumes the filter is operated
##  in a data parallel pipeline.
##

import
  vtkFiltersParallelModule, vtkPolyDataAlgorithm

discard "forward decl of vtkOutlineCornerSource"
discard "forward decl of vtkMultiProcessController"
discard "forward decl of vtkAppendPolyData"
discard "forward decl of vtkPOutlineFilterInternals"
type
  vtkPOutlineCornerFilter* {.importcpp: "vtkPOutlineCornerFilter",
                            header: "vtkPOutlineCornerFilter.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkPOutlineCornerFilter* {.importc: "vtkPOutlineCornerFilter".}: VTK_NEWINSTANCE

  vtkPOutlineCornerFilterSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPOutlineCornerFilter::IsTypeOf(@)",
    header: "vtkPOutlineCornerFilter.h".}
proc IsA*(this: var vtkPOutlineCornerFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPOutlineCornerFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPOutlineCornerFilter {.
    importcpp: "vtkPOutlineCornerFilter::SafeDownCast(@)",
    header: "vtkPOutlineCornerFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPOutlineCornerFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPOutlineCornerFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPOutlineCornerFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPOutlineCornerFilter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPOutlineCornerFilter.h".}
proc New*(): ptr vtkPOutlineCornerFilter {.importcpp: "vtkPOutlineCornerFilter::New(@)",
                                       header: "vtkPOutlineCornerFilter.h".}
proc SetCornerFactor*(this: var vtkPOutlineCornerFilter; cornerFactor: cdouble) {.
    importcpp: "SetCornerFactor", header: "vtkPOutlineCornerFilter.h".}
proc GetCornerFactorMinValue*(this: var vtkPOutlineCornerFilter): cdouble {.
    importcpp: "GetCornerFactorMinValue", header: "vtkPOutlineCornerFilter.h".}
proc GetCornerFactorMaxValue*(this: var vtkPOutlineCornerFilter): cdouble {.
    importcpp: "GetCornerFactorMaxValue", header: "vtkPOutlineCornerFilter.h".}
## !!!Ignored construct:  virtual double GetCornerFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CornerFactor  of  << this -> CornerFactor ) ; return this -> CornerFactor ; } ;
## Error: expected ';'!!!

proc SetController*(this: var vtkPOutlineCornerFilter;
                   a2: ptr vtkMultiProcessController) {.importcpp: "SetController",
    header: "vtkPOutlineCornerFilter.h".}
proc GetnameController*(this: var vtkPOutlineCornerFilter): ptr vtkMultiProcessController {.
    importcpp: "GetnameController", header: "vtkPOutlineCornerFilter.h".}
  ## /@}