## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRectilinearGridGeometryFilter.h
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
##  @class   vtkRectilinearGridGeometryFilter
##  @brief   extract geometry for a rectilinear grid
##
##  vtkRectilinearGridGeometryFilter is a filter that extracts geometry from a
##  rectilinear grid. By specifying appropriate i-j-k indices, it is possible
##  to extract a point, a curve, a surface, or a "volume". The volume
##  is actually a (n x m x o) region of points.
##
##  The extent specification is zero-offset. That is, the first k-plane in
##  a 50x50x50 rectilinear grid is given by (0,49, 0,49, 0,0).
##
##  @warning
##  If you don't know the dimensions of the input dataset, you can use a large
##  number to specify extent (the number will be clamped appropriately). For
##  example, if the dataset dimensions are 50x50x50, and you want a the fifth
##  k-plane, you can use the extents (0,100, 0,100, 4,4). The 100 will
##  automatically be clamped to 49.
##
##  @sa
##  vtkGeometryFilter vtkExtractGrid
##

import
  vtkFiltersGeometryModule, vtkPolyDataAlgorithm

type
  vtkRectilinearGridGeometryFilter* {.importcpp: "vtkRectilinearGridGeometryFilter", header: "vtkRectilinearGridGeometryFilter.h",
                                     bycopy.} = object of vtkPolyDataAlgorithm
    vtkRectilinearGridGeometryFilter* {.importc: "vtkRectilinearGridGeometryFilter".}: VTK_NEWINSTANCE

  vtkRectilinearGridGeometryFilterSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkRectilinearGridGeometryFilter::IsTypeOf(@)",
    header: "vtkRectilinearGridGeometryFilter.h".}
proc IsA*(this: var vtkRectilinearGridGeometryFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkRectilinearGridGeometryFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkRectilinearGridGeometryFilter {.
    importcpp: "vtkRectilinearGridGeometryFilter::SafeDownCast(@)",
    header: "vtkRectilinearGridGeometryFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkRectilinearGridGeometryFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRectilinearGridGeometryFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRectilinearGridGeometryFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkRectilinearGridGeometryFilter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkRectilinearGridGeometryFilter.h".}
proc New*(): ptr vtkRectilinearGridGeometryFilter {.
    importcpp: "vtkRectilinearGridGeometryFilter::New(@)",
    header: "vtkRectilinearGridGeometryFilter.h".}
## !!!Ignored construct:  /@{ *
##  Get the extent in topological coordinate range (imin,imax, jmin,jmax,
##  kmin,kmax).
##  virtual int * GetExtentExtent ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Extent  pointer  << this -> Extent ) ; return this -> Extent ; } VTK_WRAPEXCLUDE virtual void GetExtentExtent ( int data [ 6 ] ) { for ( int i = 0 ; i < 6 ; i ++ ) { data [ i ] = this -> Extent [ i ] ; } } ;
## Error: expected ';'!!!

proc SetExtent*(this: var vtkRectilinearGridGeometryFilter; iMin: cint; iMax: cint;
               jMin: cint; jMax: cint; kMin: cint; kMax: cint) {.importcpp: "SetExtent",
    header: "vtkRectilinearGridGeometryFilter.h".}
proc SetExtent*(this: var vtkRectilinearGridGeometryFilter; extent: array[6, cint]) {.
    importcpp: "SetExtent", header: "vtkRectilinearGridGeometryFilter.h".}