## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCell3D.h
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
##  @class   vtkCell3D
##  @brief   abstract class to specify 3D cell interface
##
##  vtkCell3D is an abstract class that extends the interfaces for 3D data
##  cells, and implements methods needed to satisfy the vtkCell API. The
##  3D cells include hexehedra, tetrahedra, wedge, pyramid, and voxel.
##
##  @sa
##  vtkTetra vtkHexahedron vtkVoxel vtkWedge vtkPyramid
##

import
  vtkCell, vtkCommonDataModelModule

discard "forward decl of vtkOrderedTriangulator"
discard "forward decl of vtkTetra"
discard "forward decl of vtkCellArray"
discard "forward decl of vtkDoubleArray"
type
  vtkCell3D* {.importcpp: "vtkCell3D", header: "vtkCell3D.h", bycopy.} = object of vtkCell
    vtkCell3D* {.importc: "vtkCell3D".}: VTK_NEWINSTANCE
    ##  used to support clipping

  vtkCell3DSuperclass* = vtkCell

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkCell3D::IsTypeOf(@)",
    header: "vtkCell3D.h".}
proc IsA*(this: var vtkCell3D; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkCell3D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCell3D {.
    importcpp: "vtkCell3D::SafeDownCast(@)", header: "vtkCell3D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCell3D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCell :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCell3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCell3D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCell3D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCell3D.h".}
proc GetEdgePoints*(this: var vtkCell3D; edgeId: vtkIdType; pts: ptr vtkIdType) {.
    importcpp: "GetEdgePoints", header: "vtkCell3D.h".}
proc GetFacePoints*(this: var vtkCell3D; faceId: vtkIdType; pts: ptr vtkIdType): vtkIdType {.
    importcpp: "GetFacePoints", header: "vtkCell3D.h".}
proc GetEdgeToAdjacentFaces*(this: var vtkCell3D; edgeId: vtkIdType;
                            faceIds: ptr vtkIdType) {.
    importcpp: "GetEdgeToAdjacentFaces", header: "vtkCell3D.h".}
proc GetFaceToAdjacentFaces*(this: var vtkCell3D; faceId: vtkIdType;
                            faceIds: ptr vtkIdType): vtkIdType {.
    importcpp: "GetFaceToAdjacentFaces", header: "vtkCell3D.h".}
proc GetPointToIncidentEdges*(this: var vtkCell3D; pointId: vtkIdType;
                             edgeIds: ptr vtkIdType): vtkIdType {.
    importcpp: "GetPointToIncidentEdges", header: "vtkCell3D.h".}
proc GetPointToIncidentFaces*(this: var vtkCell3D; pointId: vtkIdType;
                             faceIds: ptr vtkIdType): vtkIdType {.
    importcpp: "GetPointToIncidentFaces", header: "vtkCell3D.h".}
proc GetPointToOneRingPoints*(this: var vtkCell3D; pointId: vtkIdType;
                             pts: ptr vtkIdType): vtkIdType {.
    importcpp: "GetPointToOneRingPoints", header: "vtkCell3D.h".}
proc IsInsideOut*(this: var vtkCell3D): bool {.importcpp: "IsInsideOut",
    header: "vtkCell3D.h".}
proc GetCentroid*(this: vtkCell3D; centroid: array[3, cdouble]): bool {.noSideEffect,
    importcpp: "GetCentroid", header: "vtkCell3D.h".}
proc Contour*(this: var vtkCell3D; value: cdouble; cellScalars: ptr vtkDataArray;
             locator: ptr vtkIncrementalPointLocator; verts: ptr vtkCellArray;
             lines: ptr vtkCellArray; polys: ptr vtkCellArray; inPd: ptr vtkPointData;
             outPd: ptr vtkPointData; inCd: ptr vtkCellData; cellId: vtkIdType;
             outCd: ptr vtkCellData) {.importcpp: "Contour", header: "vtkCell3D.h".}
proc Clip*(this: var vtkCell3D; value: cdouble; cellScalars: ptr vtkDataArray;
          locator: ptr vtkIncrementalPointLocator; connectivity: ptr vtkCellArray;
          inPd: ptr vtkPointData; outPd: ptr vtkPointData; inCd: ptr vtkCellData;
          cellId: vtkIdType; outCd: ptr vtkCellData; insideOut: cint) {.
    importcpp: "Clip", header: "vtkCell3D.h".}
proc GetCellDimension*(this: var vtkCell3D): cint {.importcpp: "GetCellDimension",
    header: "vtkCell3D.h".}
proc Inflate*(this: var vtkCell3D; dist: cdouble): cint {.importcpp: "Inflate",
    header: "vtkCell3D.h".}
proc SetMergeTolerance*(this: var vtkCell3D; _arg: cdouble) {.
    importcpp: "SetMergeTolerance", header: "vtkCell3D.h".}
proc GetMergeToleranceMinValue*(this: var vtkCell3D): cdouble {.
    importcpp: "GetMergeToleranceMinValue", header: "vtkCell3D.h".}
proc GetMergeToleranceMaxValue*(this: var vtkCell3D): cdouble {.
    importcpp: "GetMergeToleranceMaxValue", header: "vtkCell3D.h".}
## !!!Ignored construct:  virtual double GetMergeTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MergeTolerance  of  << this -> MergeTolerance ) ; return this -> MergeTolerance ; } ;
## Error: expected ';'!!!
