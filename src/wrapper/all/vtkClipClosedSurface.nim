## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkClipClosedSurface.h
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
##  @class   vtkClipClosedSurface
##  @brief   Clip a closed surface with a plane collection
##
##  vtkClipClosedSurface will clip a closed polydata surface with a
##  collection of clipping planes.  It will produce a new closed surface
##  by creating new polygonal faces where the input data was clipped.
##
##  Non-manifold surfaces should not be used as input for this filter.
##  The input surface should have no open edges, and must not have any
##  edges that are shared by more than two faces.  The vtkFeatureEdges
##  filter can be used to verify that a data set satisfies these conditions.
##  In addition, the input surface should not self-intersect, meaning
##  that the faces of the surface should only touch at their edges.
##
##  If GenerateOutline is on, this filter will generate an outline wherever
##  the clipping planes intersect the data.  The ScalarMode option
##  will add cell scalars to the output, so that the generated faces
##  can be visualized in a different color from the original surface.
##
##  @warning
##  The triangulation of new faces is done in O(n) time for simple convex
##  inputs, but for non-convex inputs the worst-case time is O(n^2*m^2)
##  where n is the number of points and m is the number of 3D cavities.
##  The best triangulation algorithms, in contrast, are O(n log n).
##  There are also rare cases where the triangulation will fail to produce
##  a watertight output.  Turn on TriangulationErrorDisplay to be notified
##  of these failures.
##
##  @sa
##  vtkOutlineFilter vtkOutlineSource vtkVolumeOutlineSource
##  vtkContourTriangulator
##
##  @par Thanks:
##  Thanks to David Gobbi for contributing this class to VTK.
##

import
  vtkFiltersGeneralModule, vtkPolyDataAlgorithm

discard "forward decl of vtkPlaneCollection"
discard "forward decl of vtkUnsignedCharArray"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkCellArray"
discard "forward decl of vtkPointData"
discard "forward decl of vtkCellData"
discard "forward decl of vtkPolygon"
discard "forward decl of vtkIdList"
discard "forward decl of vtkCCSEdgeLocator"
const
  VTK_CCS_SCALAR_MODE_NONE* = 0
  VTK_CCS_SCALAR_MODE_COLORS* = 1
  VTK_CCS_SCALAR_MODE_LABELS* = 2

type
  vtkClipClosedSurface* {.importcpp: "vtkClipClosedSurface",
                         header: "vtkClipClosedSurface.h", bycopy.} = object of vtkPolyDataAlgorithm ## /@{
                                                                                              ## *
                                                                                              ##  Standard methods for instantiation, obtaining type information, and printing.
                                                                                              ##
    vtkClipClosedSurface* {.importc: "vtkClipClosedSurface".}: VTK_NEWINSTANCE


proc New*(): ptr vtkClipClosedSurface {.importcpp: "vtkClipClosedSurface::New(@)",
                                    header: "vtkClipClosedSurface.h".}
type
  vtkClipClosedSurfaceSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkClipClosedSurface::IsTypeOf(@)",
    header: "vtkClipClosedSurface.h".}
proc IsA*(this: var vtkClipClosedSurface; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkClipClosedSurface.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkClipClosedSurface {.
    importcpp: "vtkClipClosedSurface::SafeDownCast(@)",
    header: "vtkClipClosedSurface.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkClipClosedSurface :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkClipClosedSurface :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkClipClosedSurface :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkClipClosedSurface; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkClipClosedSurface.h".}
proc SetClippingPlanes*(this: var vtkClipClosedSurface;
                       planes: ptr vtkPlaneCollection) {.
    importcpp: "SetClippingPlanes", header: "vtkClipClosedSurface.h".}
proc GetnameClippingPlanes*(this: var vtkClipClosedSurface): ptr vtkPlaneCollection {.
    importcpp: "GetnameClippingPlanes", header: "vtkClipClosedSurface.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the tolerance for creating new points while clipping.  If the
  ##  tolerance is too small, then degenerate triangles might be produced.
  ##  The default tolerance is 1e-6.
  ##
proc SetTolerance*(this: var vtkClipClosedSurface; _arg: cdouble) {.
    importcpp: "SetTolerance", header: "vtkClipClosedSurface.h".}
## !!!Ignored construct:  virtual double GetTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tolerance  of  << this -> Tolerance ) ; return this -> Tolerance ; } ;
## Error: expected ';'!!!

proc SetTolerancePassPointData*(this: var vtkClipClosedSurface; _arg: vtkTypeBool) {.
    importcpp: "SetTolerancePassPointData", header: "vtkClipClosedSurface.h".}
proc PassPointDataOn*(this: var vtkClipClosedSurface) {.
    importcpp: "PassPointDataOn", header: "vtkClipClosedSurface.h".}
proc PassPointDataOff*(this: var vtkClipClosedSurface) {.
    importcpp: "PassPointDataOff", header: "vtkClipClosedSurface.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetTolerancePassPointData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassPointData  of  << this -> PassPointData ) ; return this -> PassPointData ; } ;
## Error: expected ';'!!!

proc SetTolerancePassPointDataGenerateOutline*(this: var vtkClipClosedSurface;
    _arg: vtkTypeBool) {.importcpp: "SetTolerancePassPointDataGenerateOutline",
                       header: "vtkClipClosedSurface.h".}
proc GenerateOutlineOn*(this: var vtkClipClosedSurface) {.
    importcpp: "GenerateOutlineOn", header: "vtkClipClosedSurface.h".}
proc GenerateOutlineOff*(this: var vtkClipClosedSurface) {.
    importcpp: "GenerateOutlineOff", header: "vtkClipClosedSurface.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetTolerancePassPointDataGenerateOutline ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateOutline  of  << this -> GenerateOutline ) ; return this -> GenerateOutline ; } ;
## Error: expected ';'!!!

proc SetTolerancePassPointDataGenerateOutlineGenerateFaces*(
    this: var vtkClipClosedSurface; _arg: vtkTypeBool) {.
    importcpp: "SetTolerancePassPointDataGenerateOutlineGenerateFaces",
    header: "vtkClipClosedSurface.h".}
proc GenerateFacesOn*(this: var vtkClipClosedSurface) {.
    importcpp: "GenerateFacesOn", header: "vtkClipClosedSurface.h".}
proc GenerateFacesOff*(this: var vtkClipClosedSurface) {.
    importcpp: "GenerateFacesOff", header: "vtkClipClosedSurface.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetTolerancePassPointDataGenerateOutlineGenerateFaces ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateFaces  of  << this -> GenerateFaces ) ; return this -> GenerateFaces ; } ;
## Error: expected ';'!!!

proc SetScalarMode*(this: var vtkClipClosedSurface; _arg: cint) {.
    importcpp: "SetScalarMode", header: "vtkClipClosedSurface.h".}
proc GetScalarModeMinValue*(this: var vtkClipClosedSurface): cint {.
    importcpp: "GetScalarModeMinValue", header: "vtkClipClosedSurface.h".}
proc GetScalarModeMaxValue*(this: var vtkClipClosedSurface): cint {.
    importcpp: "GetScalarModeMaxValue", header: "vtkClipClosedSurface.h".}
proc SetScalarModeToNone*(this: var vtkClipClosedSurface) {.
    importcpp: "SetScalarModeToNone", header: "vtkClipClosedSurface.h".}
proc SetScalarModeToColors*(this: var vtkClipClosedSurface) {.
    importcpp: "SetScalarModeToColors", header: "vtkClipClosedSurface.h".}
proc SetScalarModeToLabels*(this: var vtkClipClosedSurface) {.
    importcpp: "SetScalarModeToLabels", header: "vtkClipClosedSurface.h".}
## !!!Ignored construct:  virtual int GetTolerancePassPointDataGenerateOutlineGenerateFacesScalarMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarMode  of  << this -> ScalarMode ) ; return this -> ScalarMode ; } ;
## Error: expected ';'!!!

proc GetScalarModeAsString*(this: var vtkClipClosedSurface): cstring {.
    importcpp: "GetScalarModeAsString", header: "vtkClipClosedSurface.h".}
proc SetBaseColor*(this: var vtkClipClosedSurface; _arg1: cdouble; _arg2: cdouble;
                  _arg3: cdouble) {.importcpp: "SetBaseColor",
                                  header: "vtkClipClosedSurface.h".}
proc SetBaseColor*(this: var vtkClipClosedSurface; _arg: array[3, cdouble]) {.
    importcpp: "SetBaseColor", header: "vtkClipClosedSurface.h".}
## !!!Ignored construct:  virtual double * GetBaseColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << BaseColor  pointer  << this -> BaseColor ) ; return this -> BaseColor ; } VTK_WRAPEXCLUDE virtual void GetBaseColor ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> BaseColor [ 0 ] ; _arg2 = this -> BaseColor [ 1 ] ; _arg3 = this -> BaseColor [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << BaseColor  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetBaseColor ( double _arg [ 3 ] ) { this -> GetBaseColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetBaseColorClipColor*(this: var vtkClipClosedSurface; _arg1: cdouble;
                           _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetBaseColorClipColor", header: "vtkClipClosedSurface.h".}
proc SetBaseColorClipColor*(this: var vtkClipClosedSurface; _arg: array[3, cdouble]) {.
    importcpp: "SetBaseColorClipColor", header: "vtkClipClosedSurface.h".}
## !!!Ignored construct:  virtual double * GetBaseColorClipColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ClipColor  pointer  << this -> ClipColor ) ; return this -> ClipColor ; } VTK_WRAPEXCLUDE virtual void GetBaseColorClipColor ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> ClipColor [ 0 ] ; _arg2 = this -> ClipColor [ 1 ] ; _arg3 = this -> ClipColor [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ClipColor  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetBaseColorClipColor ( double _arg [ 3 ] ) { this -> GetBaseColorClipColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetTolerancePassPointDataGenerateOutlineGenerateFacesActivePlaneId*(
    this: var vtkClipClosedSurface; _arg: cint) {.importcpp: "SetTolerancePassPointDataGenerateOutlineGenerateFacesActivePlaneId",
    header: "vtkClipClosedSurface.h".}
## !!!Ignored construct:  virtual int GetTolerancePassPointDataGenerateOutlineGenerateFacesScalarModeActivePlaneId ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ActivePlaneId  of  << this -> ActivePlaneId ) ; return this -> ActivePlaneId ; } ;
## Error: expected ';'!!!

proc SetBaseColorClipColorActivePlaneColor*(this: var vtkClipClosedSurface;
    _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetBaseColorClipColorActivePlaneColor",
    header: "vtkClipClosedSurface.h".}
proc SetBaseColorClipColorActivePlaneColor*(this: var vtkClipClosedSurface;
    _arg: array[3, cdouble]) {.importcpp: "SetBaseColorClipColorActivePlaneColor",
                            header: "vtkClipClosedSurface.h".}
## !!!Ignored construct:  virtual double * GetBaseColorClipColorActivePlaneColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ActivePlaneColor  pointer  << this -> ActivePlaneColor ) ; return this -> ActivePlaneColor ; } VTK_WRAPEXCLUDE virtual void GetBaseColorClipColorActivePlaneColor ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> ActivePlaneColor [ 0 ] ; _arg2 = this -> ActivePlaneColor [ 1 ] ; _arg3 = this -> ActivePlaneColor [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ActivePlaneColor  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetBaseColorClipColorActivePlaneColor ( double _arg [ 3 ] ) { this -> GetBaseColorClipColorActivePlaneColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetTolerancePassPointDataGenerateOutlineGenerateFacesActivePlaneIdTriangulationErrorDisplay*(
    this: var vtkClipClosedSurface; _arg: vtkTypeBool) {.importcpp: "SetTolerancePassPointDataGenerateOutlineGenerateFacesActivePlaneIdTriangulationErrorDisplay",
    header: "vtkClipClosedSurface.h".}
proc TriangulationErrorDisplayOn*(this: var vtkClipClosedSurface) {.
    importcpp: "TriangulationErrorDisplayOn", header: "vtkClipClosedSurface.h".}
proc TriangulationErrorDisplayOff*(this: var vtkClipClosedSurface) {.
    importcpp: "TriangulationErrorDisplayOff", header: "vtkClipClosedSurface.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetTolerancePassPointDataGenerateOutlineGenerateFacesScalarModeActivePlaneIdTriangulationErrorDisplay ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TriangulationErrorDisplay  of  << this -> TriangulationErrorDisplay ) ; return this -> TriangulationErrorDisplay ; } ;
## Error: expected ';'!!!
