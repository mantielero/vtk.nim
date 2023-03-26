## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBridgeCell.h
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
##  @class   vtkBridgeCell
##  @brief   Implementation of vtkGenericAdaptorCell
##
##  It is just an example that show how to implement the Generic. It is also
##  used for testing and evaluating the Generic.
##  @sa
##  vtkGenericAdaptorCell, vtkBridgeDataSet
##

import
  vtkBridgeExport, vtkGenericAdaptorCell

discard "forward decl of vtkCell"
discard "forward decl of vtkBridgeDataSet"
discard "forward decl of vtkBridgeCellIterator"
type
  vtkBridgeCell* {.importcpp: "vtkBridgeCell", header: "vtkBridgeCell.h", bycopy.} = object of vtkGenericAdaptorCell
    vtkBridgeCell* {.importc: "vtkBridgeCell".}: VTK_NEWINSTANCE
    ##  what does it mean for boundary cells?
    ##  used in Contour
    ##  interpolation functions


proc New*(): ptr vtkBridgeCell {.importcpp: "vtkBridgeCell::New(@)",
                             header: "vtkBridgeCell.h".}
type
  vtkBridgeCellSuperclass* = vtkGenericAdaptorCell

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkBridgeCell::IsTypeOf(@)", header: "vtkBridgeCell.h".}
proc IsA*(this: var vtkBridgeCell; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkBridgeCell.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBridgeCell {.
    importcpp: "vtkBridgeCell::SafeDownCast(@)", header: "vtkBridgeCell.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBridgeCell :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGenericAdaptorCell :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBridgeCell :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBridgeCell :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkBridgeCell; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkBridgeCell.h".}
proc GetId*(this: var vtkBridgeCell): vtkIdType {.importcpp: "GetId",
    header: "vtkBridgeCell.h".}
proc IsInDataSet*(this: var vtkBridgeCell): cint {.importcpp: "IsInDataSet",
    header: "vtkBridgeCell.h".}
proc GetType*(this: var vtkBridgeCell): cint {.importcpp: "GetType",
    header: "vtkBridgeCell.h".}
proc GetDimension*(this: var vtkBridgeCell): cint {.importcpp: "GetDimension",
    header: "vtkBridgeCell.h".}
proc GetGeometryOrder*(this: var vtkBridgeCell): cint {.
    importcpp: "GetGeometryOrder", header: "vtkBridgeCell.h".}
proc IsGeometryLinear*(this: var vtkBridgeCell): cint {.
    importcpp: "IsGeometryLinear", header: "vtkBridgeCell.h".}
proc GetAttributeOrder*(this: var vtkBridgeCell; a: ptr vtkGenericAttribute): cint {.
    importcpp: "GetAttributeOrder", header: "vtkBridgeCell.h".}
proc IsAttributeLinear*(this: var vtkBridgeCell; a: ptr vtkGenericAttribute): vtkTypeBool {.
    importcpp: "IsAttributeLinear", header: "vtkBridgeCell.h".}
proc IsPrimary*(this: var vtkBridgeCell): cint {.importcpp: "IsPrimary",
    header: "vtkBridgeCell.h".}
proc GetNumberOfPoints*(this: var vtkBridgeCell): cint {.
    importcpp: "GetNumberOfPoints", header: "vtkBridgeCell.h".}
proc GetNumberOfBoundaries*(this: var vtkBridgeCell; dim: cint = -1): cint {.
    importcpp: "GetNumberOfBoundaries", header: "vtkBridgeCell.h".}
proc GetNumberOfDOFNodes*(this: var vtkBridgeCell): cint {.
    importcpp: "GetNumberOfDOFNodes", header: "vtkBridgeCell.h".}
proc GetPointIterator*(this: var vtkBridgeCell; it: ptr vtkGenericPointIterator) {.
    importcpp: "GetPointIterator", header: "vtkBridgeCell.h".}
proc NewCellIterator*(this: var vtkBridgeCell): ptr vtkGenericCellIterator {.
    importcpp: "NewCellIterator", header: "vtkBridgeCell.h".}
proc GetBoundaryIterator*(this: var vtkBridgeCell;
                         boundaries: ptr vtkGenericCellIterator; dim: cint = -1) {.
    importcpp: "GetBoundaryIterator", header: "vtkBridgeCell.h".}
proc CountNeighbors*(this: var vtkBridgeCell; boundary: ptr vtkGenericAdaptorCell): cint {.
    importcpp: "CountNeighbors", header: "vtkBridgeCell.h".}
proc CountEdgeNeighbors*(this: var vtkBridgeCell; sharing: ptr cint) {.
    importcpp: "CountEdgeNeighbors", header: "vtkBridgeCell.h".}
proc GetNeighbors*(this: var vtkBridgeCell; boundary: ptr vtkGenericAdaptorCell;
                  neighbors: ptr vtkGenericCellIterator) {.
    importcpp: "GetNeighbors", header: "vtkBridgeCell.h".}
proc FindClosestBoundary*(this: var vtkBridgeCell; subId: cint;
                         pcoords: array[3, cdouble];
                         boundary: ptr vtkGenericCellIterator): cint {.
    importcpp: "FindClosestBoundary", header: "vtkBridgeCell.h".}
proc EvaluatePosition*(this: var vtkBridgeCell; x: array[3, cdouble];
                      closestPoint: ptr cdouble; subId: var cint;
                      pcoords: array[3, cdouble]; dist2: var cdouble): cint {.
    importcpp: "EvaluatePosition", header: "vtkBridgeCell.h".}
proc EvaluateLocation*(this: var vtkBridgeCell; subId: cint;
                      pcoords: array[3, cdouble]; x: array[3, cdouble]) {.
    importcpp: "EvaluateLocation", header: "vtkBridgeCell.h".}
proc InterpolateTuple*(this: var vtkBridgeCell; a: ptr vtkGenericAttribute;
                      pcoords: array[3, cdouble]; val: ptr cdouble) {.
    importcpp: "InterpolateTuple", header: "vtkBridgeCell.h".}
proc InterpolateTuple*(this: var vtkBridgeCell;
                      c: ptr vtkGenericAttributeCollection;
                      pcoords: array[3, cdouble]; val: ptr cdouble) {.
    importcpp: "InterpolateTuple", header: "vtkBridgeCell.h".}
## !!!Ignored construct:  # 0 [NewLine] *
##  Generate a contour (contouring primitives) for each `values' or with
##  respect to an implicit function `f'. Contouring
##  is performed on the scalar attribute (`attributes->GetActiveAttribute()',
##  `attributes->GetActiveComponent()').
##  Contouring interpolates the
##  `attributes->GetNumberOfattributesToInterpolate()' attributes
##  `attributes->GetAttributesToInterpolate()'.
##  `locator', `verts', `lines', `polys', `outPd' and `outCd' are cumulative
##  data arrays over cell iterations: they store the result of each call
##  to Contour():
##  - `locator' is points list that merges points as they are inserted (i.e.,
##  prevents duplicates).
##  - `verts' is an array of generated vertices
##  - `lines' is an array of generated lines
##  - `polys' is an array of generated polygons
##  - `outPd' is an array of interpolated point data along the edge (if
##  not-NULL)
##  - `outCd' is an array of copied cell data of the current cell (if
##  not-NULL)
##  Note: the CopyAllocate() method must be invoked on both the output cell
##  and point data.
##
##  NOTE: `vtkGenericAttributeCollection *attributes' will be replaced by a
##  `vtkInformation'.
##
##  \pre values_exist: (values!=0 && f==0) || (values==0 && f!=0)
##  \pre attributes_exist: attributes!=0
##  \pre locator_exists: locator!=0
##  \pre verts_exist: verts!=0
##  \pre lines_exist: lines!=0
##  \pre polys_exist: polys!=0
##  virtual void Contour ( vtkContourValues * values , vtkImplicitFunction * f , vtkGenericAttributeCollection * attributes , vtkPointLocator * locator , vtkCellArray * verts , vtkCellArray * lines , vtkCellArray * polys , vtkPointData * outPd , vtkCellData * outCd ) ;
## Error: identifier expected, but got: *
##  Generate a contour (contouring primitives) for each `values' or with
##  respect to an implicit function `f'. Contouring
##  is performed on the scalar attribute (`attributes->GetActiveAttribute()',
##  `attributes->GetActiveComponent()').
##  Contouring interpolates the
##  `attributes->GetNumberOfattributesToInterpolate()' attributes
##  `attributes->GetAttributesToInterpolate()'.
##  `locator', `verts', `lines', `polys', `outPd' and `outCd' are cumulative
##  data arrays over cell iterations: they store the result of each call
##  to Contour():
##  - `locator' is points list that merges points as they are inserted (i.e.,
##  prevents duplicates).
##  - `verts' is an array of generated vertices
##  - `lines' is an array of generated lines
##  - `polys' is an array of generated polygons
##  - `outPd' is an array of interpolated point data along the edge (if
##  not-NULL)
##  - `outCd' is an array of copied cell data of the current cell (if
##  not-NULL)
##  Note: the CopyAllocate() method must be invoked on both the output cell
##  and point data.
##
##  NOTE: `vtkGenericAttributeCollection *attributes' will be replaced by a
##  `vtkInformation'.
##
##  \pre values_exist: (values!=0 && f==0) || (values==0 && f!=0)
##  \pre attributes_exist: attributes!=0
##  \pre locator_exists: locator!=0
##  \pre verts_exist: verts!=0
##  \pre lines_exist: lines!=0
##  \pre polys_exist: polys!=0
## !!!

## !!!Ignored construct:  # 0 [NewLine] *
##  Cut (or clip) the current cell with respect to the contour defined by the
##  `value' or the implicit function `f' of the scalar attribute
##  (`attributes->GetActiveAttribute()',`attributes->GetActiveComponent()').
##  If `f' exists, `value' is not used. The output is the part
##  of the current cell which is inside the contour.
##  The output is a set of zero, one or more cells of the same topological
##  dimension as the current cell. Normally, cell points whose scalar value
##  is greater than "value" are considered inside. If `insideOut' is on, this
##  is reversed.
##  Clipping interpolates the
##  `attributes->GetNumberOfattributesToInterpolate()' attributes
##  `attributes->GetAttributesToInterpolate()'.
##  `locator', `connectivity', `outPd' and `outCd' are cumulative
##  data arrays over cell iterations: they store the result of each call
##  to Clip():
##  - `locator' is points list that merges points as they are inserted (i.e.,
##  prevents duplicates).
##  - `connectivity' is an array of generated cells
##  - `outPd' is an array of interpolated point data along the edge (if
##  not-NULL)
##  - `outCd' is an array of copied cell data of the current cell (if
##  not-NULL)
##  Note: the CopyAllocate() method must be invoked on both the output cell
##  and point data.
##  Also, if the output cell data is
##  non-NULL, the cell data from the clipped cell is passed to the generated
##  contouring primitives. (Note: the CopyAllocate() method must be invoked on
##  both the output cell and point data.)
##
##  NOTE: `vtkGenericAttributeCollection *attributes' will be replaced by a
##  `vtkInformation'.
##
##  \pre attributes_exist: attributes!=0
##  \pre tess_exists: tess!=0
##  \pre locator_exists: locator!=0
##  \pre connectivity_exists: connectivity!=0
##  virtual void Clip ( double value , vtkImplicitFunction * f , vtkGenericAttributeCollection * attributes , vtkGenericCellTessellator * tess , int insideOut , vtkPointLocator * locator , vtkCellArray * connectivity , vtkPointData * outPd , vtkCellData * outCd ) ;
## Error: identifier expected, but got: *
##  Cut (or clip) the current cell with respect to the contour defined by the
##  `value' or the implicit function `f' of the scalar attribute
##  (`attributes->GetActiveAttribute()',`attributes->GetActiveComponent()').
##  If `f' exists, `value' is not used. The output is the part
##  of the current cell which is inside the contour.
##  The output is a set of zero, one or more cells of the same topological
##  dimension as the current cell. Normally, cell points whose scalar value
##  is greater than "value" are considered inside. If `insideOut' is on, this
##  is reversed.
##  Clipping interpolates the
##  `attributes->GetNumberOfattributesToInterpolate()' attributes
##  `attributes->GetAttributesToInterpolate()'.
##  `locator', `connectivity', `outPd' and `outCd' are cumulative
##  data arrays over cell iterations: they store the result of each call
##  to Clip():
##  - `locator' is points list that merges points as they are inserted (i.e.,
##  prevents duplicates).
##  - `connectivity' is an array of generated cells
##  - `outPd' is an array of interpolated point data along the edge (if
##  not-NULL)
##  - `outCd' is an array of copied cell data of the current cell (if
##  not-NULL)
##  Note: the CopyAllocate() method must be invoked on both the output cell
##  and point data.
##  Also, if the output cell data is
##  non-NULL, the cell data from the clipped cell is passed to the generated
##  contouring primitives. (Note: the CopyAllocate() method must be invoked on
##  both the output cell and point data.)
##
##  NOTE: `vtkGenericAttributeCollection *attributes' will be replaced by a
##  `vtkInformation'.
##
##  \pre attributes_exist: attributes!=0
##  \pre tess_exists: tess!=0
##  \pre locator_exists: locator!=0
##  \pre connectivity_exists: connectivity!=0
## !!!

proc IntersectWithLine*(this: var vtkBridgeCell; p1: array[3, cdouble];
                       p2: array[3, cdouble]; tol: cdouble; t: var cdouble;
                       x: array[3, cdouble]; pcoords: array[3, cdouble];
                       subId: var cint): cint {.importcpp: "IntersectWithLine",
    header: "vtkBridgeCell.h".}
proc Derivatives*(this: var vtkBridgeCell; subId: cint; pcoords: array[3, cdouble];
                 attribute: ptr vtkGenericAttribute; derivs: ptr cdouble) {.
    importcpp: "Derivatives", header: "vtkBridgeCell.h".}
proc GetBounds*(this: var vtkBridgeCell; bounds: array[6, cdouble]) {.
    importcpp: "GetBounds", header: "vtkBridgeCell.h".}
proc GetBounds*(this: var vtkBridgeCell): ptr cdouble {.importcpp: "GetBounds",
    header: "vtkBridgeCell.h".}
proc GetLength2*(this: var vtkBridgeCell): cdouble {.importcpp: "GetLength2",
    header: "vtkBridgeCell.h".}
proc GetParametricCenter*(this: var vtkBridgeCell; pcoords: array[3, cdouble]): cint {.
    importcpp: "GetParametricCenter", header: "vtkBridgeCell.h".}
proc GetParametricDistance*(this: var vtkBridgeCell; pcoords: array[3, cdouble]): cdouble {.
    importcpp: "GetParametricDistance", header: "vtkBridgeCell.h".}
proc GetParametricCoords*(this: var vtkBridgeCell): ptr cdouble {.
    importcpp: "GetParametricCoords", header: "vtkBridgeCell.h".}
## !!!Ignored construct:  # 0 [NewLine] /@{ *
##  Tessellate the cell if it is not linear or if at least one attribute of
##  `attributes' is not linear. The output are linear cells of the same
##  dimension than than cell. If the cell is linear and all attributes are
##  linear, the output is just a copy of the current cell.
##  `points', `cellArray', `pd' and `cd' are cumulative output data arrays
##  over cell iterations: they store the result of each call to Tessellate().
##  \pre attributes_exist: attributes!=0
##  \pre points_exist: points!=0
##  \pre cellArray_exists: cellArray!=0
##  \pre pd_exist: pd!=0
##  \pre cd_exists: cd!=0
##  virtual void Tessellate ( vtkGenericAttributeCollection * attributes , vtkPoints * points , vtkCellArray * cellArray , vtkPointData * pd , vtkCellData * cd ) ;
## Error: identifier expected, but got: /@{!!!

proc IsFaceOnBoundary*(this: var vtkBridgeCell; faceId: vtkIdType): cint {.
    importcpp: "IsFaceOnBoundary", header: "vtkBridgeCell.h".}
proc IsOnBoundary*(this: var vtkBridgeCell): cint {.importcpp: "IsOnBoundary",
    header: "vtkBridgeCell.h".}
proc GetPointIds*(this: var vtkBridgeCell; id: ptr vtkIdType) {.
    importcpp: "GetPointIds", header: "vtkBridgeCell.h".}
when 0:
  proc TriangulateFace*(this: var vtkBridgeCell;
                       attributes: ptr vtkGenericAttributeCollection;
                       tess: ptr vtkGenericCellTessellator; index: cint;
                       pts: ptr vtkPoints; cellArray: ptr vtkCellArray;
                       pd: ptr vtkPointData; cd: ptr vtkCellData) {.
      importcpp: "TriangulateFace", header: "vtkBridgeCell.h".}
proc GetFaceArray*(this: var vtkBridgeCell; faceId: vtkIdType): ptr vtkIdType {.
    importcpp: "GetFaceArray", header: "vtkBridgeCell.h".}
proc GetNumberOfVerticesOnFace*(this: var vtkBridgeCell; faceId: cint): cint {.
    importcpp: "GetNumberOfVerticesOnFace", header: "vtkBridgeCell.h".}
proc GetEdgeArray*(this: var vtkBridgeCell; edgeId: vtkIdType): ptr vtkIdType {.
    importcpp: "GetEdgeArray", header: "vtkBridgeCell.h".}
proc Init*(this: var vtkBridgeCell; ds: ptr vtkBridgeDataSet; cellid: vtkIdType) {.
    importcpp: "Init", header: "vtkBridgeCell.h".}
proc InitWithCell*(this: var vtkBridgeCell; c: ptr vtkCell; id: vtkIdType) {.
    importcpp: "InitWithCell", header: "vtkBridgeCell.h".}
proc DeepCopy*(this: var vtkBridgeCell; other: ptr vtkBridgeCell) {.
    importcpp: "DeepCopy", header: "vtkBridgeCell.h".}