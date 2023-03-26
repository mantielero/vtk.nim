## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFrustumCoverageCuller.h
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
##  @class   vtkFrustumCoverageCuller
##  @brief   cull props based on frustum coverage
##
##  vtkFrustumCoverageCuller will cull props based on the coverage in
##  the view frustum. The coverage is computed by enclosing the prop in
##  a bounding sphere, projecting that to the viewing coordinate system, then
##  taking a slice through the view frustum at the center of the sphere. This
##  results in a circle on the plane slice through the view frustum. This
##  circle is enclosed in a squared, and the fraction of the plane slice that
##  this square covers is the coverage. This is a number between 0 and 1.
##  If the number is less than the MinimumCoverage, the allocated render time
##  for that prop is set to zero. If it is greater than the MaximumCoverage,
##  the allocated render time is set to 1.0. In between, a linear ramp is used
##  to convert coverage into allocated render time.
##
##  @sa
##  vtkCuller
##

import
  vtkCuller, vtkRenderingCoreModule

const
  VTK_CULLER_SORT_NONE* = 0
  VTK_CULLER_SORT_FRONT_TO_BACK* = 1
  VTK_CULLER_SORT_BACK_TO_FRONT* = 2

discard "forward decl of vtkProp"
discard "forward decl of vtkRenderer"
type
  vtkFrustumCoverageCuller* {.importcpp: "vtkFrustumCoverageCuller",
                             header: "vtkFrustumCoverageCuller.h", bycopy.} = object of vtkCuller
    vtkFrustumCoverageCuller* {.importc: "vtkFrustumCoverageCuller".}: VTK_NEWINSTANCE


proc New*(): ptr vtkFrustumCoverageCuller {.importcpp: "vtkFrustumCoverageCuller::New(@)",
                                        header: "vtkFrustumCoverageCuller.h".}
type
  vtkFrustumCoverageCullerSuperclass* = vtkCuller

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkFrustumCoverageCuller::IsTypeOf(@)",
    header: "vtkFrustumCoverageCuller.h".}
proc IsA*(this: var vtkFrustumCoverageCuller; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkFrustumCoverageCuller.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkFrustumCoverageCuller {.
    importcpp: "vtkFrustumCoverageCuller::SafeDownCast(@)",
    header: "vtkFrustumCoverageCuller.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkFrustumCoverageCuller :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCuller :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFrustumCoverageCuller :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFrustumCoverageCuller :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkFrustumCoverageCuller; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkFrustumCoverageCuller.h".}
proc SetMinimumCoverage*(this: var vtkFrustumCoverageCuller; _arg: cdouble) {.
    importcpp: "SetMinimumCoverage", header: "vtkFrustumCoverageCuller.h".}
## !!!Ignored construct:  virtual double GetMinimumCoverage ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinimumCoverage  of  << this -> MinimumCoverage ) ; return this -> MinimumCoverage ; } ;
## Error: expected ';'!!!

proc SetMinimumCoverageMaximumCoverage*(this: var vtkFrustumCoverageCuller;
                                       _arg: cdouble) {.
    importcpp: "SetMinimumCoverageMaximumCoverage",
    header: "vtkFrustumCoverageCuller.h".}
## !!!Ignored construct:  virtual double GetMinimumCoverageMaximumCoverage ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumCoverage  of  << this -> MaximumCoverage ) ; return this -> MaximumCoverage ; } ;
## Error: expected ';'!!!

proc SetSortingStyle*(this: var vtkFrustumCoverageCuller; _arg: cint) {.
    importcpp: "SetSortingStyle", header: "vtkFrustumCoverageCuller.h".}
proc GetSortingStyleMinValue*(this: var vtkFrustumCoverageCuller): cint {.
    importcpp: "GetSortingStyleMinValue", header: "vtkFrustumCoverageCuller.h".}
proc GetSortingStyleMaxValue*(this: var vtkFrustumCoverageCuller): cint {.
    importcpp: "GetSortingStyleMaxValue", header: "vtkFrustumCoverageCuller.h".}
## !!!Ignored construct:  virtual int GetMinimumCoverageMaximumCoverageSortingStyle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SortingStyle  of  << this -> SortingStyle ) ; return this -> SortingStyle ; } ;
## Error: expected ';'!!!

proc SetSortingStyleToNone*(this: var vtkFrustumCoverageCuller) {.
    importcpp: "SetSortingStyleToNone", header: "vtkFrustumCoverageCuller.h".}
proc SetSortingStyleToBackToFront*(this: var vtkFrustumCoverageCuller) {.
    importcpp: "SetSortingStyleToBackToFront",
    header: "vtkFrustumCoverageCuller.h".}
proc SetSortingStyleToFrontToBack*(this: var vtkFrustumCoverageCuller) {.
    importcpp: "SetSortingStyleToFrontToBack",
    header: "vtkFrustumCoverageCuller.h".}
proc GetSortingStyleAsString*(this: var vtkFrustumCoverageCuller): cstring {.
    importcpp: "GetSortingStyleAsString", header: "vtkFrustumCoverageCuller.h".}
proc Cull*(this: var vtkFrustumCoverageCuller; ren: ptr vtkRenderer;
          propList: ptr ptr vtkProp; listLength: var cint; initialized: var cint): cdouble {.
    importcpp: "Cull", header: "vtkFrustumCoverageCuller.h".}