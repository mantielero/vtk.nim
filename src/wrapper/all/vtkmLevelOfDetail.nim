## =============================================================================
##
##   Copyright (c) Kitware, Inc.
##   All rights reserved.
##   See LICENSE.txt for details.
##
##   This software is distributed WITHOUT ANY WARRANTY; without even
##   the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##   PURPOSE.  See the above copyright notice for more information.
##
##   Copyright 2012 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
##
## =============================================================================
## *
##  @class   vtkmLevelOfDetail
##  @brief   reduce the number of triangles in a mesh
##
##  vtkmLevelOfDetail is a filter to reduce the number of triangles in a
##  triangle mesh, forming a good approximation to the original geometry. The
##  input to vtkmLevelOfDetail is a vtkPolyData or vtkUnstrcutredGrid object,
##  and only triangles are treated. If you desire to decimate polygonal meshes,
##  first triangulate the polygons with vtkTriangleFilter object.
##
##  The general approach of the algorithm is to cluster vertices in a uniform
##  binning of space, accumulating to an average point within each bin. In
##  more detail, the algorithm first gets the bounds of the input poly data.
##  It then breaks this bounding volume into a user-specified number of
##  spatial bins.  It then reads each triangle from the input and hashes its
##  vertices into these bins. Then, if 2 or more vertices of
##  the triangle fall in the same bin, the triangle is dicarded.  If the
##  triangle is not discarded, it adds the triangle to the list of output
##  triangles as a list of vertex identifiers.  (There is one vertex id per
##  bin.)  After all the triangles have been read, the representative vertex
##  for each bin is computed.  This determines the spatial location of the
##  vertices of each of the triangles in the output.
##
##  To use this filter, specify the divisions defining the spatial subdivision
##  in the x, y, and z directions. Compared to algorithms such as
##  vtkQuadricClustering, a significantly higher bin count is recommended as it
##  doesn't increase the computation or memory of the algorithm and will produce
##  significantly better results.
##
##

import
  vtkAcceleratorsVTKmFiltersModule, vtkPolyDataAlgorithm

type
  vtkmLevelOfDetail* {.importcpp: "vtkmLevelOfDetail",
                      header: "vtkmLevelOfDetail.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkmLevelOfDetail* {.importc: "vtkmLevelOfDetail".}: VTK_NEWINSTANCE

  vtkmLevelOfDetailSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkmLevelOfDetail::IsTypeOf(@)", header: "vtkmLevelOfDetail.h".}
proc IsA*(this: var vtkmLevelOfDetail; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkmLevelOfDetail.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkmLevelOfDetail {.
    importcpp: "vtkmLevelOfDetail::SafeDownCast(@)", header: "vtkmLevelOfDetail.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkmLevelOfDetail :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkmLevelOfDetail :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkmLevelOfDetail :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkmLevelOfDetail; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkmLevelOfDetail.h".}
proc New*(): ptr vtkmLevelOfDetail {.importcpp: "vtkmLevelOfDetail::New(@)",
                                 header: "vtkmLevelOfDetail.h".}
proc SetNumberOfXDivisions*(this: var vtkmLevelOfDetail; num: cint) {.
    importcpp: "SetNumberOfXDivisions", header: "vtkmLevelOfDetail.h".}
proc SetNumberOfYDivisions*(this: var vtkmLevelOfDetail; num: cint) {.
    importcpp: "SetNumberOfYDivisions", header: "vtkmLevelOfDetail.h".}
proc SetNumberOfZDivisions*(this: var vtkmLevelOfDetail; num: cint) {.
    importcpp: "SetNumberOfZDivisions", header: "vtkmLevelOfDetail.h".}
proc GetNumberOfXDivisions*(this: var vtkmLevelOfDetail): cint {.
    importcpp: "GetNumberOfXDivisions", header: "vtkmLevelOfDetail.h".}
proc GetNumberOfYDivisions*(this: var vtkmLevelOfDetail): cint {.
    importcpp: "GetNumberOfYDivisions", header: "vtkmLevelOfDetail.h".}
proc GetNumberOfZDivisions*(this: var vtkmLevelOfDetail): cint {.
    importcpp: "GetNumberOfZDivisions", header: "vtkmLevelOfDetail.h".}
proc SetNumberOfDivisions*(this: var vtkmLevelOfDetail; `div`: array[3, cint]) {.
    importcpp: "SetNumberOfDivisions", header: "vtkmLevelOfDetail.h".}
proc SetNumberOfDivisions*(this: var vtkmLevelOfDetail; div0: cint; div1: cint;
                          div2: cint) {.importcpp: "SetNumberOfDivisions",
                                      header: "vtkmLevelOfDetail.h".}
proc GetNumberOfDivisions*(this: var vtkmLevelOfDetail): ptr cint {.
    importcpp: "GetNumberOfDivisions", header: "vtkmLevelOfDetail.h".}
proc GetNumberOfDivisions*(this: var vtkmLevelOfDetail; `div`: array[3, cint]) {.
    importcpp: "GetNumberOfDivisions", header: "vtkmLevelOfDetail.h".}