## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkButterflySubdivisionFilter.h
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
##  @class   vtkButterflySubdivisionFilter
##  @brief   generate a subdivision surface using the Butterfly Scheme
##
##  vtkButterflySubdivisionFilter is an interpolating subdivision scheme
##  that creates four new triangles for each triangle in the mesh. The
##  user can specify the NumberOfSubdivisions. This filter implements the
##  8-point butterfly scheme described in: Zorin, D., Schroder, P., and
##  Sweldens, W., "Interpolating Subdivisions for Meshes with Arbitrary
##  Topology," Computer Graphics Proceedings, Annual Conference Series,
##  1996, ACM SIGGRAPH, pp.189-192. This scheme improves previous
##  butterfly subdivisions with special treatment of vertices with valence
##  other than 6.
##
##  Currently, the filter only operates on triangles. Users should use the
##  vtkTriangleFilter to triangulate meshes that contain polygons or
##  triangle strips.
##
##  The filter interpolates point data using the same scheme. New
##  triangles created at a subdivision step will have the cell data of
##  their parent cell.
##
##  @par Thanks:
##  This work was supported by PHS Research Grant No. 1 P41 RR13218-01
##  from the National Center for Research Resources.
##
##  @sa
##  vtkInterpolatingSubdivisionFilter vtkLinearSubdivisionFilter
##

import
  vtkFiltersModelingModule, vtkInterpolatingSubdivisionFilter

discard "forward decl of vtkCellArray"
discard "forward decl of vtkIdList"
discard "forward decl of vtkIntArray"
type
  vtkButterflySubdivisionFilter* {.importcpp: "vtkButterflySubdivisionFilter",
                                  header: "vtkButterflySubdivisionFilter.h",
                                  bycopy.} = object of vtkInterpolatingSubdivisionFilter ## /@{
                                                                                    ## *
                                                                                    ##  Construct object with NumberOfSubdivisions set to 1.
                                                                                    ##
    vtkButterflySubdivisionFilter* {.importc: "vtkButterflySubdivisionFilter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkButterflySubdivisionFilter {.
    importcpp: "vtkButterflySubdivisionFilter::New(@)",
    header: "vtkButterflySubdivisionFilter.h".}
type
  vtkButterflySubdivisionFilterSuperclass* = vtkInterpolatingSubdivisionFilter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkButterflySubdivisionFilter::IsTypeOf(@)",
    header: "vtkButterflySubdivisionFilter.h".}
proc IsA*(this: var vtkButterflySubdivisionFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkButterflySubdivisionFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkButterflySubdivisionFilter {.
    importcpp: "vtkButterflySubdivisionFilter::SafeDownCast(@)",
    header: "vtkButterflySubdivisionFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkButterflySubdivisionFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInterpolatingSubdivisionFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkButterflySubdivisionFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkButterflySubdivisionFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkButterflySubdivisionFilter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkButterflySubdivisionFilter.h".}