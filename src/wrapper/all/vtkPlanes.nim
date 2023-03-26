## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPlanes.h
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
##  @class   vtkPlanes
##  @brief   implicit function for convex set of planes
##
##  vtkPlanes computes the implicit function and function gradient for a set
##  of planes. The planes must define a convex space.
##
##  The function value is the intersection (i.e., maximum value) obtained by
##  evaluating the each of the supplied planes. Hence the value is the maximum
##  distance of a point to the convex region defined by the planes. The
##  function gradient is the plane normal at the function value.  Note that
##  the normals must point outside of the convex region. Thus, a negative
##  function value means that a point is inside the convex region.
##
##  There are several methods to define the set of planes. The most general is
##  to supply an instance of vtkPoints and an instance of vtkDataArray. (The
##  points define a point on the plane, and the normals corresponding plane
##  normals.) Two other specialized ways are to 1) supply six planes defining
##  the view frustrum of a camera, and 2) provide a bounding box.
##
##  @sa
##  vtkImplicitBoolean vtkSpheres vtkFrustrumSource vtkCamera
##

import
  vtkCommonDataModelModule, vtkImplicitFunction

discard "forward decl of vtkPlane"
discard "forward decl of vtkPoints"
discard "forward decl of vtkDataArray"
type
  vtkPlanes* {.importcpp: "vtkPlanes", header: "vtkPlanes.h", bycopy.} = object of vtkImplicitFunction ## /@{
                                                                                             ## *
                                                                                             ##  Standard methods for instantiation, type information, and printing.
                                                                                             ##
    vtkPlanes* {.importc: "vtkPlanes".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPlanes {.importcpp: "vtkPlanes::New(@)", header: "vtkPlanes.h".}
type
  vtkPlanesSuperclass* = vtkImplicitFunction

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkPlanes::IsTypeOf(@)",
    header: "vtkPlanes.h".}
proc IsA*(this: var vtkPlanes; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkPlanes.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPlanes {.
    importcpp: "vtkPlanes::SafeDownCast(@)", header: "vtkPlanes.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPlanes :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImplicitFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPlanes :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPlanes :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPlanes; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPlanes.h".}
## using statement

proc EvaluateFunction*(this: var vtkPlanes; x: array[3, cdouble]): cdouble {.
    importcpp: "EvaluateFunction", header: "vtkPlanes.h".}
proc EvaluateGradient*(this: var vtkPlanes; x: array[3, cdouble]; n: array[3, cdouble]) {.
    importcpp: "EvaluateGradient", header: "vtkPlanes.h".}
proc SetPoints*(this: var vtkPlanes; a2: ptr vtkPoints) {.importcpp: "SetPoints",
    header: "vtkPlanes.h".}
proc GetnamePoints*(this: var vtkPlanes): ptr vtkPoints {.importcpp: "GetnamePoints",
    header: "vtkPlanes.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify a list of normal vectors for the planes. There is a one-to-one
  ##  correspondence between plane points and plane normals.
  ##
proc SetNormals*(this: var vtkPlanes; normals: ptr vtkDataArray) {.
    importcpp: "SetNormals", header: "vtkPlanes.h".}
proc GetnamePointsNormals*(this: var vtkPlanes): ptr vtkDataArray {.
    importcpp: "GetnamePointsNormals", header: "vtkPlanes.h".}
  ## /@}
  ## *
  ##  An alternative method to specify six planes defined by the camera view
  ##  frustrum. See vtkCamera::GetFrustumPlanes() documentation.
  ##
proc SetFrustumPlanes*(this: var vtkPlanes; planes: array[24, cdouble]) {.
    importcpp: "SetFrustumPlanes", header: "vtkPlanes.h".}
proc SetBounds*(this: var vtkPlanes; bounds: array[6, cdouble]) {.
    importcpp: "SetBounds", header: "vtkPlanes.h".}
proc SetBounds*(this: var vtkPlanes; xmin: cdouble; xmax: cdouble; ymin: cdouble;
               ymax: cdouble; zmin: cdouble; zmax: cdouble) {.importcpp: "SetBounds",
    header: "vtkPlanes.h".}
proc GetNumberOfPlanes*(this: var vtkPlanes): cint {.importcpp: "GetNumberOfPlanes",
    header: "vtkPlanes.h".}
proc GetPlane*(this: var vtkPlanes; i: cint): ptr vtkPlane {.importcpp: "GetPlane",
    header: "vtkPlanes.h".}
proc GetPlane*(this: var vtkPlanes; i: cint; plane: ptr vtkPlane) {.
    importcpp: "GetPlane", header: "vtkPlanes.h".}