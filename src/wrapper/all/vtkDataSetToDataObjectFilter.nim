## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDataSetToDataObjectFilter.h
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
##  @class   vtkDataSetToDataObjectFilter
##  @brief   map dataset into data object (i.e., a field)
##
##  vtkDataSetToDataObjectFilter is an class that transforms a dataset into
##  data object (i.e., a field). The field will have labeled data arrays
##  corresponding to the topology, geometry, field data, and point and cell
##  attribute data.
##
##  You can control what portions of the dataset are converted into the
##  output data object's field data. The instance variables Geometry,
##  Topology, FieldData, PointData, and CellData are flags that control
##  whether the dataset's geometry (e.g., points, spacing, origin);
##  topology (e.g., cell connectivity, dimensions); the field data
##  associated with the dataset's superclass data object; the dataset's
##  point data attributes; and the dataset's cell data attributes. (Note:
##  the data attributes include scalars, vectors, tensors, normals, texture
##  coordinates, and field data.)
##
##  The names used to create the field data are as follows. For vtkPolyData,
##  "Points", "Verts", "Lines", "Polys", and "Strips". For vtkUnstructuredGrid,
##  "Cells" and "CellTypes". For vtkStructuredPoints, "Dimensions", "Spacing",
##  and "Origin". For vtkStructuredGrid, "Points" and "Dimensions". For
##  vtkRectilinearGrid, "XCoordinates", "YCoordinates", and "ZCoordinates".
##  for point attribute data, "PointScalars", "PointVectors", etc. For cell
##  attribute data, "CellScalars", "CellVectors", etc. Field data arrays retain
##  their original name.
##
##  @sa
##  vtkDataObject vtkFieldData vtkDataObjectToDataSetFilter
##

import
  vtkDataObjectAlgorithm, vtkFiltersCoreModule

discard "forward decl of vtkDataSet"
type
  vtkDataSetToDataObjectFilter* {.importcpp: "vtkDataSetToDataObjectFilter",
                                 header: "vtkDataSetToDataObjectFilter.h", bycopy.} = object of vtkDataObjectAlgorithm
    vtkDataSetToDataObjectFilter* {.importc: "vtkDataSetToDataObjectFilter".}: VTK_NEWINSTANCE

  vtkDataSetToDataObjectFilterSuperclass* = vtkDataObjectAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDataSetToDataObjectFilter::IsTypeOf(@)",
    header: "vtkDataSetToDataObjectFilter.h".}
proc IsA*(this: var vtkDataSetToDataObjectFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkDataSetToDataObjectFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDataSetToDataObjectFilter {.
    importcpp: "vtkDataSetToDataObjectFilter::SafeDownCast(@)",
    header: "vtkDataSetToDataObjectFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDataSetToDataObjectFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObjectAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDataSetToDataObjectFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDataSetToDataObjectFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDataSetToDataObjectFilter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkDataSetToDataObjectFilter.h".}
proc New*(): ptr vtkDataSetToDataObjectFilter {.
    importcpp: "vtkDataSetToDataObjectFilter::New(@)",
    header: "vtkDataSetToDataObjectFilter.h".}
proc SetGeometry*(this: var vtkDataSetToDataObjectFilter; _arg: vtkTypeBool) {.
    importcpp: "SetGeometry", header: "vtkDataSetToDataObjectFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetGeometry ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Geometry  of  << this -> Geometry ) ; return this -> Geometry ; } ;
## Error: expected ';'!!!

proc GeometryOn*(this: var vtkDataSetToDataObjectFilter) {.importcpp: "GeometryOn",
    header: "vtkDataSetToDataObjectFilter.h".}
proc GeometryOff*(this: var vtkDataSetToDataObjectFilter) {.
    importcpp: "GeometryOff", header: "vtkDataSetToDataObjectFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off the conversion of dataset topology to a data object.
  ##
proc SetGeometryTopology*(this: var vtkDataSetToDataObjectFilter; _arg: vtkTypeBool) {.
    importcpp: "SetGeometryTopology", header: "vtkDataSetToDataObjectFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetGeometryTopology ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Topology  of  << this -> Topology ) ; return this -> Topology ; } ;
## Error: expected ';'!!!

proc TopologyOn*(this: var vtkDataSetToDataObjectFilter) {.importcpp: "TopologyOn",
    header: "vtkDataSetToDataObjectFilter.h".}
proc TopologyOff*(this: var vtkDataSetToDataObjectFilter) {.
    importcpp: "TopologyOff", header: "vtkDataSetToDataObjectFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  If LegacyTopology and Topology are both true, print out the legacy topology
  ##  arrays. Default is true.
  ##
proc SetGeometryTopologyLegacyTopology*(this: var vtkDataSetToDataObjectFilter;
                                       _arg: vtkTypeBool) {.
    importcpp: "SetGeometryTopologyLegacyTopology",
    header: "vtkDataSetToDataObjectFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetGeometryTopologyLegacyTopology ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LegacyTopology  of  << this -> LegacyTopology ) ; return this -> LegacyTopology ; } ;
## Error: expected ';'!!!

proc LegacyTopologyOn*(this: var vtkDataSetToDataObjectFilter) {.
    importcpp: "LegacyTopologyOn", header: "vtkDataSetToDataObjectFilter.h".}
proc LegacyTopologyOff*(this: var vtkDataSetToDataObjectFilter) {.
    importcpp: "LegacyTopologyOff", header: "vtkDataSetToDataObjectFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  If ModernTopology and Topology are both true, print out the modern topology
  ##  arrays. Default is true.
  ##
proc SetGeometryTopologyLegacyTopologyModernTopology*(
    this: var vtkDataSetToDataObjectFilter; _arg: vtkTypeBool) {.
    importcpp: "SetGeometryTopologyLegacyTopologyModernTopology",
    header: "vtkDataSetToDataObjectFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetGeometryTopologyLegacyTopologyModernTopology ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ModernTopology  of  << this -> ModernTopology ) ; return this -> ModernTopology ; } ;
## Error: expected ';'!!!

proc ModernTopologyOn*(this: var vtkDataSetToDataObjectFilter) {.
    importcpp: "ModernTopologyOn", header: "vtkDataSetToDataObjectFilter.h".}
proc ModernTopologyOff*(this: var vtkDataSetToDataObjectFilter) {.
    importcpp: "ModernTopologyOff", header: "vtkDataSetToDataObjectFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off the conversion of dataset field data to a data object.
  ##
proc SetGeometryTopologyLegacyTopologyModernTopologyFieldData*(
    this: var vtkDataSetToDataObjectFilter; _arg: vtkTypeBool) {.
    importcpp: "SetGeometryTopologyLegacyTopologyModernTopologyFieldData",
    header: "vtkDataSetToDataObjectFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetGeometryTopologyLegacyTopologyModernTopologyFieldData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FieldData  of  << this -> FieldData ) ; return this -> FieldData ; } ;
## Error: expected ';'!!!

proc FieldDataOn*(this: var vtkDataSetToDataObjectFilter) {.
    importcpp: "FieldDataOn", header: "vtkDataSetToDataObjectFilter.h".}
proc FieldDataOff*(this: var vtkDataSetToDataObjectFilter) {.
    importcpp: "FieldDataOff", header: "vtkDataSetToDataObjectFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off the conversion of dataset point data to a data object.
  ##
proc SetGeometryTopologyLegacyTopologyModernTopologyFieldDataPointData*(
    this: var vtkDataSetToDataObjectFilter; _arg: vtkTypeBool) {.importcpp: "SetGeometryTopologyLegacyTopologyModernTopologyFieldDataPointData",
    header: "vtkDataSetToDataObjectFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetGeometryTopologyLegacyTopologyModernTopologyFieldDataPointData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PointData  of  << this -> PointData ) ; return this -> PointData ; } ;
## Error: expected ';'!!!

proc PointDataOn*(this: var vtkDataSetToDataObjectFilter) {.
    importcpp: "PointDataOn", header: "vtkDataSetToDataObjectFilter.h".}
proc PointDataOff*(this: var vtkDataSetToDataObjectFilter) {.
    importcpp: "PointDataOff", header: "vtkDataSetToDataObjectFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off the conversion of dataset cell data to a data object.
  ##
proc SetGeometryTopologyLegacyTopologyModernTopologyFieldDataPointDataCellData*(
    this: var vtkDataSetToDataObjectFilter; _arg: vtkTypeBool) {.importcpp: "SetGeometryTopologyLegacyTopologyModernTopologyFieldDataPointDataCellData",
    header: "vtkDataSetToDataObjectFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetGeometryTopologyLegacyTopologyModernTopologyFieldDataPointDataCellData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CellData  of  << this -> CellData ) ; return this -> CellData ; } ;
## Error: expected ';'!!!

proc CellDataOn*(this: var vtkDataSetToDataObjectFilter) {.importcpp: "CellDataOn",
    header: "vtkDataSetToDataObjectFilter.h".}
proc CellDataOff*(this: var vtkDataSetToDataObjectFilter) {.
    importcpp: "CellDataOff", header: "vtkDataSetToDataObjectFilter.h".}
  ## /@}