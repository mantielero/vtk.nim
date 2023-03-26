## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBoundedPlanePointPlacer.h
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
##  @class   vtkBoundedPlanePointPlacer
##  @brief   a placer that constrains a handle to a finite plane
##
##  vtkBoundedPlanePointPlacer is a type of point placer that constrains its
##  points to a finite (i.e., bounded) plance.
##
##  @sa
##  vtkPointPlacer vtkHandleWidget vtkHandleRepresentation
##

import
  vtkInteractionWidgetsModule, vtkPointPlacer

discard "forward decl of vtkPlane"
discard "forward decl of vtkPlaneCollection"
discard "forward decl of vtkPlanes"
discard "forward decl of vtkRenderer"
type
  vtkBoundedPlanePointPlacer* {.importcpp: "vtkBoundedPlanePointPlacer",
                               header: "vtkBoundedPlanePointPlacer.h", bycopy.} = object of vtkPointPlacer ## *
                                                                                                    ##  Instantiate this class.
                                                                                                    ##
    vtkBoundedPlanePointPlacer* {.importc: "vtkBoundedPlanePointPlacer".}: VTK_NEWINSTANCE
    ##  Indicates a distance from the origin of the projection
    ##  normal where the project plane will be placed
    ##  If the ProjectionNormal is oblique, this is the oblique
    ##  plane
    ##  A collection of planes used to bound the projection
    ##  plane
    ##  Internal method for getting the project normal as a vector


proc New*(): ptr vtkBoundedPlanePointPlacer {.
    importcpp: "vtkBoundedPlanePointPlacer::New(@)",
    header: "vtkBoundedPlanePointPlacer.h".}
type
  vtkBoundedPlanePointPlacerSuperclass* = vtkPointPlacer

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkBoundedPlanePointPlacer::IsTypeOf(@)",
    header: "vtkBoundedPlanePointPlacer.h".}
proc IsA*(this: var vtkBoundedPlanePointPlacer; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkBoundedPlanePointPlacer.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBoundedPlanePointPlacer {.
    importcpp: "vtkBoundedPlanePointPlacer::SafeDownCast(@)",
    header: "vtkBoundedPlanePointPlacer.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBoundedPlanePointPlacer :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPointPlacer :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBoundedPlanePointPlacer :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBoundedPlanePointPlacer :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkBoundedPlanePointPlacer; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkBoundedPlanePointPlacer.h".}
proc SetProjectionNormal*(this: var vtkBoundedPlanePointPlacer; _arg: cint) {.
    importcpp: "SetProjectionNormal", header: "vtkBoundedPlanePointPlacer.h".}
proc GetProjectionNormalMinValue*(this: var vtkBoundedPlanePointPlacer): cint {.
    importcpp: "GetProjectionNormalMinValue",
    header: "vtkBoundedPlanePointPlacer.h".}
proc GetProjectionNormalMaxValue*(this: var vtkBoundedPlanePointPlacer): cint {.
    importcpp: "GetProjectionNormalMaxValue",
    header: "vtkBoundedPlanePointPlacer.h".}
## !!!Ignored construct:  virtual int GetProjectionNormal ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProjectionNormal  of  << this -> ProjectionNormal ) ; return this -> ProjectionNormal ; } ;
## Error: expected ';'!!!

proc SetProjectionNormalToXAxis*(this: var vtkBoundedPlanePointPlacer) {.
    importcpp: "SetProjectionNormalToXAxis",
    header: "vtkBoundedPlanePointPlacer.h".}
proc SetProjectionNormalToYAxis*(this: var vtkBoundedPlanePointPlacer) {.
    importcpp: "SetProjectionNormalToYAxis",
    header: "vtkBoundedPlanePointPlacer.h".}
proc SetProjectionNormalToZAxis*(this: var vtkBoundedPlanePointPlacer) {.
    importcpp: "SetProjectionNormalToZAxis",
    header: "vtkBoundedPlanePointPlacer.h".}
proc SetProjectionNormalToOblique*(this: var vtkBoundedPlanePointPlacer) {.
    importcpp: "SetProjectionNormalToOblique",
    header: "vtkBoundedPlanePointPlacer.h".}
proc SetObliquePlane*(this: var vtkBoundedPlanePointPlacer; a2: ptr vtkPlane) {.
    importcpp: "SetObliquePlane", header: "vtkBoundedPlanePointPlacer.h".}
proc GetnameObliquePlane*(this: var vtkBoundedPlanePointPlacer): ptr vtkPlane {.
    importcpp: "GetnameObliquePlane", header: "vtkBoundedPlanePointPlacer.h".}
  ## /@}
  ## /@{
  ## *
  ##  The position of the bounding plane from the origin along the
  ##  normal. The origin and normal are defined in the oblique plane
  ##  when the ProjectionNormal is oblique. For the X, Y, and Z
  ##  axes projection normals, the normal is the axis direction, and
  ##  the origin is (0,0,0).
  ##
proc SetProjectionPosition*(this: var vtkBoundedPlanePointPlacer; position: cdouble) {.
    importcpp: "SetProjectionPosition", header: "vtkBoundedPlanePointPlacer.h".}
## !!!Ignored construct:  virtual double GetProjectionNormalProjectionPosition ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProjectionPosition  of  << this -> ProjectionPosition ) ; return this -> ProjectionPosition ; } ;
## Error: expected ';'!!!

proc AddBoundingPlane*(this: var vtkBoundedPlanePointPlacer; plane: ptr vtkPlane) {.
    importcpp: "AddBoundingPlane", header: "vtkBoundedPlanePointPlacer.h".}
proc RemoveBoundingPlane*(this: var vtkBoundedPlanePointPlacer; plane: ptr vtkPlane) {.
    importcpp: "RemoveBoundingPlane", header: "vtkBoundedPlanePointPlacer.h".}
proc RemoveAllBoundingPlanes*(this: var vtkBoundedPlanePointPlacer) {.
    importcpp: "RemoveAllBoundingPlanes", header: "vtkBoundedPlanePointPlacer.h".}
proc SetBoundingPlanes*(this: var vtkBoundedPlanePointPlacer;
                       a2: ptr vtkPlaneCollection) {.
    importcpp: "SetBoundingPlanes", header: "vtkBoundedPlanePointPlacer.h".}
proc GetnameObliquePlaneBoundingPlanes*(this: var vtkBoundedPlanePointPlacer): ptr vtkPlaneCollection {.
    importcpp: "GetnameObliquePlaneBoundingPlanes",
    header: "vtkBoundedPlanePointPlacer.h".}
proc SetBoundingPlanes*(this: var vtkBoundedPlanePointPlacer; planes: ptr vtkPlanes) {.
    importcpp: "SetBoundingPlanes", header: "vtkBoundedPlanePointPlacer.h".}
const
  vtkBoundedPlanePointPlacerXAxis* = 0
  vtkBoundedPlanePointPlacerYAxis* = 1
  vtkBoundedPlanePointPlacerZAxis* = 2
  vtkBoundedPlanePointPlacerOblique* = 3

proc ComputeWorldPosition*(this: var vtkBoundedPlanePointPlacer;
                          ren: ptr vtkRenderer; displayPos: array[2, cdouble];
                          worldPos: array[3, cdouble];
                          worldOrient: array[9, cdouble]): cint {.
    importcpp: "ComputeWorldPosition", header: "vtkBoundedPlanePointPlacer.h".}
proc ComputeWorldPosition*(this: var vtkBoundedPlanePointPlacer;
                          ren: ptr vtkRenderer; displayPos: array[2, cdouble];
                          refWorldPos: array[3, cdouble];
                          worldPos: array[3, cdouble];
                          worldOrient: array[9, cdouble]): cint {.
    importcpp: "ComputeWorldPosition", header: "vtkBoundedPlanePointPlacer.h".}
proc ValidateWorldPosition*(this: var vtkBoundedPlanePointPlacer;
                           worldPos: array[3, cdouble]): cint {.
    importcpp: "ValidateWorldPosition", header: "vtkBoundedPlanePointPlacer.h".}
proc ValidateWorldPosition*(this: var vtkBoundedPlanePointPlacer;
                           worldPos: array[3, cdouble];
                           worldOrient: array[9, cdouble]): cint {.
    importcpp: "ValidateWorldPosition", header: "vtkBoundedPlanePointPlacer.h".}
proc UpdateWorldPosition*(this: var vtkBoundedPlanePointPlacer;
                         ren: ptr vtkRenderer; worldPos: array[3, cdouble];
                         worldOrient: array[9, cdouble]): cint {.
    importcpp: "UpdateWorldPosition", header: "vtkBoundedPlanePointPlacer.h".}