## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkUnstructuredGridBunykRayCastFunction.h
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
##  @class   vtkUnstructuredGridBunykRayCastFunction
##  @brief   a superclass for ray casting functions
##
##
##  vtkUnstructuredGridBunykRayCastFunction is a concrete implementation of a
##  ray cast function for unstructured grid data. This class was based on the
##  paper "Simple, Fast, Robust Ray Casting of Irregular Grids" by Paul Bunyk,
##  Arie Kaufmna, and Claudio Silva. This method is quite memory intensive
##  (with extra explicit copies of the data) and therefore should not be used
##  for very large data. This method assumes that the input data is composed
##  entirely of tetras - use vtkDataSetTriangleFilter before setting the input
##  on the mapper.
##
##  The basic idea of this method is as follows:
##
##    1) Enumerate the triangles. At each triangle have space for some
##       information that will be used during rendering. This includes
##       which tetra the triangles belong to, the plane equation and the
##       Barycentric coefficients.
##
##    2) Keep a reference to all four triangles for each tetra.
##
##    3) At the beginning of each render, do the precomputation. This
##       includes creating an array of transformed points (in view
##       coordinates) and computing the view dependent info per triangle
##       (plane equations and barycentric coords in view space)
##
##    4) Find all front facing boundary triangles (a triangle is on the
##       boundary if it belongs to only one tetra). For each triangle,
##       find all pixels in the image that intersect the triangle, and
##       add this to the sorted (by depth) intersection list at each
##       pixel.
##
##    5) For each ray cast, traverse the intersection list. At each
##       intersection, accumulate opacity and color contribution
##       per tetra along the ray until you reach an exiting triangle
##       (on the boundary).
##
##
##  @sa
##  vtkUnstructuredGridVolumeRayCastMapper
##

import
  vtkRenderingVolumeModule, vtkUnstructuredGridVolumeRayCastFunction

discard "forward decl of vtkRenderer"
discard "forward decl of vtkVolume"
discard "forward decl of vtkUnstructuredGridVolumeRayCastMapper"
discard "forward decl of vtkMatrix4x4"
discard "forward decl of vtkPiecewiseFunction"
discard "forward decl of vtkColorTransferFunction"
discard "forward decl of vtkUnstructuredGridBase"
discard "forward decl of vtkIdList"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkDataArray"
const
  VTK_BUNYKRCF_MAX_ARRAYS* = 10000
  VTK_BUNYKRCF_ARRAY_SIZE* = 10000

type
  vtkUnstructuredGridBunykRayCastFunction* {.
      importcpp: "vtkUnstructuredGridBunykRayCastFunction",
      header: "vtkUnstructuredGridBunykRayCastFunction.h", bycopy.} = object of vtkUnstructuredGridVolumeRayCastFunction
    vtkUnstructuredGridBunykRayCastFunction*
        {.importc: "vtkUnstructuredGridBunykRayCastFunction".}: VTK_NEWINSTANCE
    vtkUnstructuredGridVolumeRayCastIterator*
        {.importc: "vtkUnstructuredGridVolumeRayCastIterator".}: VTK_NEWINSTANCE
    ##  Computed during the initialize method - if something is
    ##  wrong (no mapper, no volume, no input, etc.) then no rendering
    ##  will actually be performed.
    ##  These are the transformed points
    ##  This is the matrix that will take a transformed point back
    ##  to world coordinates
    ##  This is the intersection list per pixel in the image
    ##  This is the size of the image we are computing (which does
    ##  not need to match the screen size)
    ##  Since we may only be computing a subregion of the "full" image,
    ##  this is the origin of the region we are computing. We must
    ##  subtract this origin from any pixel (x,y) locations before
    ##  accessing the pixel in this->Image (which represents only the
    ##  subregion)
    ##  This is the full size of the image
    ##  These are values saved for the building of the TriangleList. Basically
    ##  we need to check if the data has changed in some way.
    ##  This is a memory intensive algorithm! For each tetra in the
    ##  input data we create up to 4 triangles (we don't create duplicates)
    ##  This is the TriangleList. Then, for each tetra we keep track of
    ##  the pointer to each of its four triangles - this is the
    ##  TetraTriangles. We also keep a duplicate list of points
    ##  (transformed into view space) - these are the Points.
    ##  Compute whether a boundary triangle is front facing by
    ##  looking at the fourth point in the tetra to see if it is
    ##  in front (triangle is backfacing) or behind (triangle is
    ##  front facing) the plane containing the triangle.
    ##  This method replaces new for creating a new element - it
    ##  returns one from the big block already allocated (it
    ##  allocates another big block if necessary)


proc New*(): ptr vtkUnstructuredGridBunykRayCastFunction {.
    importcpp: "vtkUnstructuredGridBunykRayCastFunction::New(@)",
    header: "vtkUnstructuredGridBunykRayCastFunction.h".}
type
  vtkUnstructuredGridBunykRayCastFunctionSuperclass* = vtkUnstructuredGridVolumeRayCastFunction

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkUnstructuredGridBunykRayCastFunction::IsTypeOf(@)",
    header: "vtkUnstructuredGridBunykRayCastFunction.h".}
proc IsA*(this: var vtkUnstructuredGridBunykRayCastFunction; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkUnstructuredGridBunykRayCastFunction.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkUnstructuredGridBunykRayCastFunction {.
    importcpp: "vtkUnstructuredGridBunykRayCastFunction::SafeDownCast(@)",
    header: "vtkUnstructuredGridBunykRayCastFunction.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkUnstructuredGridBunykRayCastFunction :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridVolumeRayCastFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkUnstructuredGridBunykRayCastFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkUnstructuredGridBunykRayCastFunction :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkUnstructuredGridBunykRayCastFunction; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkUnstructuredGridBunykRayCastFunction.h".}
proc Initialize*(this: var vtkUnstructuredGridBunykRayCastFunction;
                ren: ptr vtkRenderer; vol: ptr vtkVolume) {.importcpp: "Initialize",
    header: "vtkUnstructuredGridBunykRayCastFunction.h".}
proc Finalize*(this: var vtkUnstructuredGridBunykRayCastFunction) {.
    importcpp: "Finalize", header: "vtkUnstructuredGridBunykRayCastFunction.h".}
## !!!Ignored construct:  * NewIterator ( ) override ;
## Error: identifier expected, but got: *!!!

type
  vtkUnstructuredGridBunykRayCastFunctionTriangle* {.
      importcpp: "vtkUnstructuredGridBunykRayCastFunction::Triangle",
      header: "vtkUnstructuredGridBunykRayCastFunction.h", bycopy.} = object
    PointIndex* {.importc: "PointIndex".}: array[3, vtkIdType]
    ReferredByTetra* {.importc: "ReferredByTetra".}: array[2, vtkIdType]
    P1X* {.importc: "P1X".}: cdouble
    P1Y* {.importc: "P1Y".}: cdouble
    P2X* {.importc: "P2X".}: cdouble
    P2Y* {.importc: "P2Y".}: cdouble
    Denominator* {.importc: "Denominator".}: cdouble
    A* {.importc: "A".}: cdouble
    B* {.importc: "B".}: cdouble
    C* {.importc: "C".}: cdouble
    D* {.importc: "D".}: cdouble
    Next* {.importc: "Next".}: ptr vtkUnstructuredGridBunykRayCastFunctionTriangle

  vtkUnstructuredGridBunykRayCastFunctionIntersection* {.
      importcpp: "vtkUnstructuredGridBunykRayCastFunction::Intersection",
      header: "vtkUnstructuredGridBunykRayCastFunction.h", bycopy.} = object
    TriPtr* {.importc: "TriPtr".}: ptr vtkUnstructuredGridBunykRayCastFunctionTriangle
    Z* {.importc: "Z".}: cdouble
    Next* {.importc: "Next".}: ptr vtkUnstructuredGridBunykRayCastFunctionIntersection


proc InTriangle*(this: var vtkUnstructuredGridBunykRayCastFunction; x: cdouble;
                y: cdouble;
                triPtr: ptr vtkUnstructuredGridBunykRayCastFunctionTriangle): cint {.
    importcpp: "InTriangle", header: "vtkUnstructuredGridBunykRayCastFunction.h".}
proc GetPoints*(this: var vtkUnstructuredGridBunykRayCastFunction): ptr cdouble {.
    importcpp: "GetPoints", header: "vtkUnstructuredGridBunykRayCastFunction.h".}
proc GetnameViewToWorldMatrix*(this: var vtkUnstructuredGridBunykRayCastFunction): ptr vtkMatrix4x4 {.
    importcpp: "GetnameViewToWorldMatrix",
    header: "vtkUnstructuredGridBunykRayCastFunction.h".}
  ## /@}
  ## /@{
  ## *
  ##  Access to an internal structure for the templated method.
  ##
## !!!Ignored construct:  virtual int * GetImageOrigin ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ImageOrigin  pointer  << this -> ImageOrigin ) ; return this -> ImageOrigin ; } VTK_WRAPEXCLUDE virtual void GetImageOrigin ( int data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> ImageOrigin [ i ] ; } } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Access to an internal structure for the templated method.
##  virtual int * GetImageOriginImageViewportSizeImageViewportSize ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ImageViewportSize  pointer  << this -> ImageViewportSize ) ; return this -> ImageViewportSize ; } VTK_WRAPEXCLUDE virtual void GetImageOriginImageViewportSizeImageViewportSize ( int data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> ImageViewportSize [ i ] ; } } ;
## Error: expected ';'!!!

proc GetTetraTriangles*(this: var vtkUnstructuredGridBunykRayCastFunction): ptr ptr vtkUnstructuredGridBunykRayCastFunctionTriangle {.
    importcpp: "GetTetraTriangles",
    header: "vtkUnstructuredGridBunykRayCastFunction.h".}
proc GetIntersectionList*(this: var vtkUnstructuredGridBunykRayCastFunction;
                         x: cint; y: cint): ptr vtkUnstructuredGridBunykRayCastFunctionIntersection {.
    importcpp: "GetIntersectionList",
    header: "vtkUnstructuredGridBunykRayCastFunction.h".}