## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPolygonalSurfacePointPlacer.h
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
##  @class   vtkPolygonalSurfacePointPlacer
##  @brief   Place points on the surface of polygonal data.
##
##
##  vtkPolygonalSurfacePointPlacer places points on polygonal data and is
##  meant to be used in conjunction with
##  vtkPolygonalSurfaceContourLineInterpolator.
##
##  @warning
##  You should have computed cell normals for the input polydata if you are
##  specifying a distance offset.
##
##  @sa
##  vtkPointPlacer vtkPolyDataNormals
##

import
  vtkInteractionWidgetsModule, vtkPolyDataPointPlacer

discard "forward decl of vtkPolyDataCollection"
discard "forward decl of vtkCellPicker"
discard "forward decl of vtkPolygonalSurfacePointPlacerInternals"
discard "forward decl of vtkPolyData"
type
  vtkPolygonalSurfacePointPlacerNode* {.importcpp: "vtkPolygonalSurfacePointPlacerNode", header: "vtkPolygonalSurfacePointPlacer.h",
                                       bycopy.} = object
    WorldPosition* {.importc: "WorldPosition".}: array[3, cdouble]
    SurfaceWorldPosition* {.importc: "SurfaceWorldPosition".}: array[3, cdouble]
    CellId* {.importc: "CellId".}: vtkIdType
    PointId* {.importc: "PointId".}: vtkIdType
    ParametricCoords* {.importc: "ParametricCoords".}: array[3, cdouble] ##  parametric coords within cell
    PolyData* {.importc: "PolyData".}: ptr vtkPolyData

  vtkPolygonalSurfacePointPlacer* {.importcpp: "vtkPolygonalSurfacePointPlacer",
                                   header: "vtkPolygonalSurfacePointPlacer.h",
                                   bycopy.} = object of vtkPolyDataPointPlacer ## *
                                                                          ##  Instantiate this class.
                                                                          ##
    vtkPolygonalSurfacePointPlacer* {.importc: "vtkPolygonalSurfacePointPlacer".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPolygonalSurfacePointPlacer {.
    importcpp: "vtkPolygonalSurfacePointPlacer::New(@)",
    header: "vtkPolygonalSurfacePointPlacer.h".}
type
  vtkPolygonalSurfacePointPlacerSuperclass* = vtkPolyDataPointPlacer

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPolygonalSurfacePointPlacer::IsTypeOf(@)",
    header: "vtkPolygonalSurfacePointPlacer.h".}
proc IsA*(this: var vtkPolygonalSurfacePointPlacer; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPolygonalSurfacePointPlacer.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPolygonalSurfacePointPlacer {.
    importcpp: "vtkPolygonalSurfacePointPlacer::SafeDownCast(@)",
    header: "vtkPolygonalSurfacePointPlacer.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPolygonalSurfacePointPlacer :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataPointPlacer :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPolygonalSurfacePointPlacer :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPolygonalSurfacePointPlacer :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPolygonalSurfacePointPlacer; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkPolygonalSurfacePointPlacer.h".}
proc AddProp*(this: var vtkPolygonalSurfacePointPlacer; a2: ptr vtkProp) {.
    importcpp: "AddProp", header: "vtkPolygonalSurfacePointPlacer.h".}
proc RemoveViewProp*(this: var vtkPolygonalSurfacePointPlacer; prop: ptr vtkProp) {.
    importcpp: "RemoveViewProp", header: "vtkPolygonalSurfacePointPlacer.h".}
proc RemoveAllProps*(this: var vtkPolygonalSurfacePointPlacer) {.
    importcpp: "RemoveAllProps", header: "vtkPolygonalSurfacePointPlacer.h".}
proc ComputeWorldPosition*(this: var vtkPolygonalSurfacePointPlacer;
                          ren: ptr vtkRenderer; displayPos: array[2, cdouble];
                          worldPos: array[3, cdouble];
                          worldOrient: array[9, cdouble]): cint {.
    importcpp: "ComputeWorldPosition", header: "vtkPolygonalSurfacePointPlacer.h".}
proc ComputeWorldPosition*(this: var vtkPolygonalSurfacePointPlacer;
                          ren: ptr vtkRenderer; displayPos: array[2, cdouble];
                          refWorldPos: array[3, cdouble];
                          worldPos: array[3, cdouble];
                          worldOrient: array[9, cdouble]): cint {.
    importcpp: "ComputeWorldPosition", header: "vtkPolygonalSurfacePointPlacer.h".}
proc ValidateWorldPosition*(this: var vtkPolygonalSurfacePointPlacer;
                           worldPos: array[3, cdouble]): cint {.
    importcpp: "ValidateWorldPosition", header: "vtkPolygonalSurfacePointPlacer.h".}
proc UpdateNodeWorldPosition*(this: var vtkPolygonalSurfacePointPlacer;
                             worldPos: array[3, cdouble]; nodePointId: vtkIdType): cint {.
    importcpp: "UpdateNodeWorldPosition",
    header: "vtkPolygonalSurfacePointPlacer.h".}
proc ValidateDisplayPosition*(this: var vtkPolygonalSurfacePointPlacer;
                             a2: ptr vtkRenderer; displayPos: array[2, cdouble]): cint {.
    importcpp: "ValidateDisplayPosition",
    header: "vtkPolygonalSurfacePointPlacer.h".}
proc ValidateWorldPosition*(this: var vtkPolygonalSurfacePointPlacer;
                           worldPos: array[3, cdouble];
                           worldOrient: array[9, cdouble]): cint {.
    importcpp: "ValidateWorldPosition", header: "vtkPolygonalSurfacePointPlacer.h".}
proc GetnameCellPicker*(this: var vtkPolygonalSurfacePointPlacer): ptr vtkCellPicker {.
    importcpp: "GetnameCellPicker", header: "vtkPolygonalSurfacePointPlacer.h".}
  ## /@}
  ## /@{
  ## *
  ##  Be sure to add polydata on which you wish to place points to this list
  ##  or they will not be considered for placement.
  ##
proc GetnameCellPickerPolys*(this: var vtkPolygonalSurfacePointPlacer): ptr vtkPolyDataCollection {.
    importcpp: "GetnameCellPickerPolys",
    header: "vtkPolygonalSurfacePointPlacer.h".}
  ## /@}
  ## /@{
  ## *
  ##  Height offset at which points may be placed on the polygonal surface.
  ##  If you specify a non-zero value here, be sure to compute cell normals
  ##  on your input polygonal data (easily done with vtkPolyDataNormals).
  ##
proc SetDistanceOffset*(this: var vtkPolygonalSurfacePointPlacer; _arg: cdouble) {.
    importcpp: "SetDistanceOffset", header: "vtkPolygonalSurfacePointPlacer.h".}
## !!!Ignored construct:  virtual double GetDistanceOffset ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DistanceOffset  of  << this -> DistanceOffset ) ; return this -> DistanceOffset ; } ;
## Error: expected ';'!!!

proc SetDistanceOffsetSnapToClosestPoint*(
    this: var vtkPolygonalSurfacePointPlacer; _arg: vtkTypeBool) {.
    importcpp: "SetDistanceOffsetSnapToClosestPoint",
    header: "vtkPolygonalSurfacePointPlacer.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetDistanceOffsetSnapToClosestPoint ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SnapToClosestPoint  of  << this -> SnapToClosestPoint ) ; return this -> SnapToClosestPoint ; } ;
## Error: expected ';'!!!

proc SnapToClosestPointOn*(this: var vtkPolygonalSurfacePointPlacer) {.
    importcpp: "SnapToClosestPointOn", header: "vtkPolygonalSurfacePointPlacer.h".}
proc SnapToClosestPointOff*(this: var vtkPolygonalSurfacePointPlacer) {.
    importcpp: "SnapToClosestPointOff", header: "vtkPolygonalSurfacePointPlacer.h".}
  ## /@}
  ## /@{
  ## *
  ##  Internally used by the interpolator.
  ##
type
  vtkPolygonalSurfacePointPlacerNode* = vtkPolygonalSurfacePointPlacerNode

proc GetNodeAtWorldPosition*(this: var vtkPolygonalSurfacePointPlacer;
                            worldPos: array[3, cdouble]): ptr vtkPolygonalSurfacePointPlacerNode {.
    importcpp: "GetNodeAtWorldPosition",
    header: "vtkPolygonalSurfacePointPlacer.h".}