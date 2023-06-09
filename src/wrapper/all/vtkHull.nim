## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHull.h
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
##  @class   vtkHull
##  @brief   produce an n-sided convex hull
##
##  vtkHull is a filter which will produce an n-sided convex hull given a
##  set of n planes. (The convex hull bounds the input vtkPointSet data.)
##  The hull is generated by squeezing the planes towards the input
##  vtkPointSet, until the planes just touch the points. Then,
##  the resulting planes are used to generate a polyhedron (i.e., hull)
##  that is represented by triangles.
##
##  The n planes can be defined in a number of ways including 1) manually
##  specifying each plane; 2) choosing the six face planes of the input's
##  bounding box; 3) choosing the eight vertex planes of the input's
##  bounding box; 4) choosing the twelve edge planes of the input's
##  bounding box; and/or 5) using a recursively subdivided octahedron.
##  Note that when specifying planes, the plane normals should point
##  outside of the convex region.
##
##  The output of this filter can be used in combination with vtkLODActor
##  to represent a levels-of-detail in the LOD hierarchy. Another use of
##  this class is to manually specify the planes, and then generate the
##  polyhedron from the planes (without squeezing the planes towards the
##  input). The method GenerateHull() is used to do this.
##

import
  vtkFiltersCoreModule, vtkPointSetAlgorithm

discard "forward decl of vtkCellArray"
discard "forward decl of vtkPlanes"
discard "forward decl of vtkPoints"
discard "forward decl of vtkPolyData"
type
  vtkHull* {.importcpp: "vtkHull", header: "vtkHull.h", bycopy.} = object of vtkPointSetAlgorithm ## /@{
                                                                                        ## *
                                                                                        ##  Standard methods to instantiate, obtain type information, and print
                                                                                        ##  information about the class.
                                                                                        ##
    vtkHull* {.importc: "vtkHull".}: VTK_NEWINSTANCE
    ##  Internal method used to find the position of each plane


proc New*(): ptr vtkHull {.importcpp: "vtkHull::New(@)", header: "vtkHull.h".}
type
  vtkHullSuperclass* = vtkPointSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkHull::IsTypeOf(@)",
    header: "vtkHull.h".}
proc IsA*(this: var vtkHull; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkHull.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkHull {.
    importcpp: "vtkHull::SafeDownCast(@)", header: "vtkHull.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkHull :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPointSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHull :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHull :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkHull; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkHull.h".}
proc RemoveAllPlanes*(this: var vtkHull) {.importcpp: "RemoveAllPlanes",
                                       header: "vtkHull.h".}
proc AddPlane*(this: var vtkHull; A: cdouble; B: cdouble; C: cdouble): cint {.
    importcpp: "AddPlane", header: "vtkHull.h".}
proc AddPlane*(this: var vtkHull; plane: array[3, cdouble]): cint {.
    importcpp: "AddPlane", header: "vtkHull.h".}
proc SetPlane*(this: var vtkHull; i: cint; A: cdouble; B: cdouble; C: cdouble) {.
    importcpp: "SetPlane", header: "vtkHull.h".}
proc SetPlane*(this: var vtkHull; i: cint; plane: array[3, cdouble]) {.
    importcpp: "SetPlane", header: "vtkHull.h".}
proc AddPlane*(this: var vtkHull; A: cdouble; B: cdouble; C: cdouble; D: cdouble): cint {.
    importcpp: "AddPlane", header: "vtkHull.h".}
proc AddPlane*(this: var vtkHull; plane: array[3, cdouble]; D: cdouble): cint {.
    importcpp: "AddPlane", header: "vtkHull.h".}
proc SetPlane*(this: var vtkHull; i: cint; A: cdouble; B: cdouble; C: cdouble; D: cdouble) {.
    importcpp: "SetPlane", header: "vtkHull.h".}
proc SetPlane*(this: var vtkHull; i: cint; plane: array[3, cdouble]; D: cdouble) {.
    importcpp: "SetPlane", header: "vtkHull.h".}
proc SetPlanes*(this: var vtkHull; planes: ptr vtkPlanes) {.importcpp: "SetPlanes",
    header: "vtkHull.h".}
proc GetNumberOfPlanes*(this: var vtkHull): cint {.importcpp: "GetNumberOfPlanes",
    header: "vtkHull.h".}
proc AddCubeVertexPlanes*(this: var vtkHull) {.importcpp: "AddCubeVertexPlanes",
    header: "vtkHull.h".}
proc AddCubeEdgePlanes*(this: var vtkHull) {.importcpp: "AddCubeEdgePlanes",
    header: "vtkHull.h".}
proc AddCubeFacePlanes*(this: var vtkHull) {.importcpp: "AddCubeFacePlanes",
    header: "vtkHull.h".}
proc AddRecursiveSpherePlanes*(this: var vtkHull; level: cint) {.
    importcpp: "AddRecursiveSpherePlanes", header: "vtkHull.h".}
proc GenerateHull*(this: var vtkHull; pd: ptr vtkPolyData; bounds: ptr cdouble) {.
    importcpp: "GenerateHull", header: "vtkHull.h".}
proc GenerateHull*(this: var vtkHull; pd: ptr vtkPolyData; xmin: cdouble; xmax: cdouble;
                  ymin: cdouble; ymax: cdouble; zmin: cdouble; zmax: cdouble) {.
    importcpp: "GenerateHull", header: "vtkHull.h".}