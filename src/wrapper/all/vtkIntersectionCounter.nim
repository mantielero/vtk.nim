## *
##  @class   vtkIntersectionCounter
##  @brief   Fast simple class for dealing with ray intersections
##
##  vtkIntersectionCounter is used to intersect data and merge coincident
##  points along the intersect ray. It is light-weight and many of the member
##  functions are in-lined so its very fast. It is not derived from vtkObject
##  so it can be allocated on the stack.
##
##  This class makes the finite ray intersection process more robust. It
##  merges intersections that are very close to one another (within a
##  tolerance). Such situations are common when intersection rays pass through
##  the edge or vertex of a mesh.
##
##  @sa
##  vtkBoundingBox
##

import
  vtkCommonDataModelModule, vtkSystemIncludes

##  class VTKCOMMONDATAMODEL_EXPORT vtkIntersectionCounter

type
  vtkIntersectionCounter* {.importcpp: "vtkIntersectionCounter",
                           header: "vtkIntersectionCounter.h", bycopy.} = object ## /@{
                                                                            ## *
                                                                            ##  This tolerance must be converted to parametric space. Here tol is the
                                                                            ##  tolerance in world coordinates; length is the ray length.
                                                                            ##


proc constructvtkIntersectionCounter*(): vtkIntersectionCounter {.constructor,
    importcpp: "vtkIntersectionCounter(@)", header: "vtkIntersectionCounter.h".}
proc constructvtkIntersectionCounter*(tol: cdouble; length: cdouble): vtkIntersectionCounter {.
    constructor, importcpp: "vtkIntersectionCounter(@)",
    header: "vtkIntersectionCounter.h".}
proc SetTolerance*(this: var vtkIntersectionCounter; tol: cdouble) {.
    importcpp: "SetTolerance", header: "vtkIntersectionCounter.h".}
proc GetTolerance*(this: var vtkIntersectionCounter): cdouble {.
    importcpp: "GetTolerance", header: "vtkIntersectionCounter.h".}
proc AddIntersection*(this: var vtkIntersectionCounter; t: cdouble) {.
    importcpp: "AddIntersection", header: "vtkIntersectionCounter.h".}
proc Reset*(this: var vtkIntersectionCounter) {.importcpp: "Reset",
    header: "vtkIntersectionCounter.h".}
proc CountIntersections*(this: var vtkIntersectionCounter): cint {.
    importcpp: "CountIntersections", header: "vtkIntersectionCounter.h".}
##  vtkIntersectionCounter

##  VTK-HeaderTest-Exclude: vtkIntersectionCounter.h
