## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkViewDependentErrorMetric.h
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
##  @class   vtkViewDependentErrorMetric
##  @brief   Objects that compute a
##  screen-based error during cell tessellation.
##
##
##  It is a concrete error metric, based on a geometric criterium in
##  the screen space: the variation of the projected edge from a projected
##  straight line
##
##  @sa
##  vtkGenericCellTessellator vtkGenericSubdivisionErrorMetric
##

import
  vtkGenericSubdivisionErrorMetric, vtkRenderingCoreModule

discard "forward decl of vtkViewport"
discard "forward decl of vtkCoordinate"
type
  vtkViewDependentErrorMetric* {.importcpp: "vtkViewDependentErrorMetric",
                                header: "vtkViewDependentErrorMetric.h", bycopy.} = object of vtkGenericSubdivisionErrorMetric ## *
                                                                                                                        ##  Construct the error metric with a default squared screen-based geometric
                                                                                                                        ##  accuracy measured in pixels equal to 0.25 (0.5^2).
                                                                                                                        ##
    vtkViewDependentErrorMetric* {.importc: "vtkViewDependentErrorMetric".}: VTK_NEWINSTANCE
    ##  used to get display coordinates from world coordinates


proc New*(): ptr vtkViewDependentErrorMetric {.
    importcpp: "vtkViewDependentErrorMetric::New(@)",
    header: "vtkViewDependentErrorMetric.h".}
type
  vtkViewDependentErrorMetricSuperclass* = vtkGenericSubdivisionErrorMetric

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkViewDependentErrorMetric::IsTypeOf(@)",
    header: "vtkViewDependentErrorMetric.h".}
proc IsA*(this: var vtkViewDependentErrorMetric; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkViewDependentErrorMetric.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkViewDependentErrorMetric {.
    importcpp: "vtkViewDependentErrorMetric::SafeDownCast(@)",
    header: "vtkViewDependentErrorMetric.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkViewDependentErrorMetric :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGenericSubdivisionErrorMetric :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkViewDependentErrorMetric :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkViewDependentErrorMetric :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkViewDependentErrorMetric; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkViewDependentErrorMetric.h".}
## !!!Ignored construct:  /@} /@{ *
##  Return the squared screen-based geometric accuracy measured in pixels.
##  An accuracy less or equal to 0.25 (0.5^2) ensures that the screen-space
##  interpolation of a mid-point matches exactly with the projection of the
##  mid-point (a value less than 1 but greater than 0.25 is not enough,
##  because of 8-neighbors). Maybe it is useful for lower accuracy in case of
##  anti-aliasing?
##  \post positive_result: result>0
##  virtual double GetPixelTolerancePixelTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PixelTolerance  of  << this -> PixelTolerance ) ; return this -> PixelTolerance ; } ;
## Error: expected ';'!!!

proc SetPixelTolerance*(this: var vtkViewDependentErrorMetric; value: cdouble) {.
    importcpp: "SetPixelTolerance", header: "vtkViewDependentErrorMetric.h".}
proc GetnameViewport*(this: var vtkViewDependentErrorMetric): ptr vtkViewport {.
    importcpp: "GetnameViewport", header: "vtkViewDependentErrorMetric.h".}
proc SetViewport*(this: var vtkViewDependentErrorMetric; viewport: ptr vtkViewport) {.
    importcpp: "SetViewport", header: "vtkViewDependentErrorMetric.h".}
proc RequiresEdgeSubdivision*(this: var vtkViewDependentErrorMetric;
                             leftPoint: ptr cdouble; midPoint: ptr cdouble;
                             rightPoint: ptr cdouble; alpha: cdouble): cint {.
    importcpp: "RequiresEdgeSubdivision", header: "vtkViewDependentErrorMetric.h".}
proc GetError*(this: var vtkViewDependentErrorMetric; leftPoint: ptr cdouble;
              midPoint: ptr cdouble; rightPoint: ptr cdouble; alpha: cdouble): cdouble {.
    importcpp: "GetError", header: "vtkViewDependentErrorMetric.h".}