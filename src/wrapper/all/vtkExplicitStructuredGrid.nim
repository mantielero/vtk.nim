## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExplicitStructuredGrid.h
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
##  @class   vtkExplicitStructuredGrid
##  @brief   structured grid with explicit topology and geometry
##
##  vtkExplicitStructuredGrid is a data object that is a concrete implementation
##  of vtkDataSet. vtkExplicitStructuredGrid represents a geometric structure
##  that is a topologically regular array of hexahedron. The topology is that of
##  a cube that has been subdivided into a regular array of smaller cubes.
##  Each cell can be addressed with i-j-k indices, however neighbor hexahedrons
##  does not necessarily share a face and hexahedron can be blanked (turned-off).
##
##  Like unstructured grid, vtkExplicitStructuredGrid has explicit point coordinates
##  and cell to point indexing.
##  Unlike unstructured grid, vtkExplicitStructuredGrid does not keep a cell type
##  list as all visible cells are known to be hexahedra.
##  vtkExplicitStructuredGrid can take advantage of its layout to perform operations
##  based on the i, j, k parameters, similar to structured grid. This makes some
##  operations faster on this class, without losing the flexibility of the
##  cell -> points mapping.
##  The most common use of this class would be in situations where you have all
##  hexahedra but the points used by the cells are not exactly defined by the
##  i, j, k parameters. One example of this is a structured grid with a half voxel
##  shift occurring in the middle of it such as with a geologic fault.
##
##  The order and number of points is arbitrary.
##  The order and number of cells must match that specified by the dimensions
##  of the grid minus 1, because in vtk structured datasets the dimensions
##  correspond to the points.
##  The cells order increases in i fastest (from 0 <= i <= dims[0] - 2),
##  then j (0 <= j <= dims[1] - 2), then k ( 0 <= k <= dims[2] - 2) where dims[]
##  are the dimensions of the grid in the i-j-k topological directions.
##  The number of cells is (dims[0] - 1) * (dims[1] - 1) * (dims[2] - 1).
##
##  In order for an ESG to be usable by most other ESG specific filters,
##  it is needed to call the ComputeFacesConnectivityFlagsArray method.
##  It is also recommended to call CheckAndReorderFaces method to fix any
##  faces issues in the dataset.
##

import
  vtkCommonDataModelModule, vtkNew, vtkPointSet, vtkStructuredData

discard "forward decl of vtkCellArray"
discard "forward decl of vtkAbstractCellLinks"
discard "forward decl of vtkEmptyCell"
discard "forward decl of vtkHexahedron"
type
  vtkExplicitStructuredGrid* {.importcpp: "vtkExplicitStructuredGrid",
                              header: "vtkExplicitStructuredGrid.h", bycopy.} = object of vtkPointSet ## /@{
                                                                                               ## *
                                                                                               ##  Standard methods for instantiation, type information, and printing.
                                                                                               ##
    vtkExplicitStructuredGrid* {.importc: "vtkExplicitStructuredGrid".}: VTK_NEWINSTANCE


proc New*(): ptr vtkExplicitStructuredGrid {.
    importcpp: "vtkExplicitStructuredGrid::New(@)",
    header: "vtkExplicitStructuredGrid.h".}
type
  vtkExplicitStructuredGridSuperclass* = vtkPointSet

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkExplicitStructuredGrid::IsTypeOf(@)",
    header: "vtkExplicitStructuredGrid.h".}
proc IsA*(this: var vtkExplicitStructuredGrid; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkExplicitStructuredGrid.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkExplicitStructuredGrid {.
    importcpp: "vtkExplicitStructuredGrid::SafeDownCast(@)",
    header: "vtkExplicitStructuredGrid.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkExplicitStructuredGrid :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPointSet :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExplicitStructuredGrid :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExplicitStructuredGrid :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkExplicitStructuredGrid; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkExplicitStructuredGrid.h".}
proc GetDataObjectType*(this: var vtkExplicitStructuredGrid): cint {.
    importcpp: "GetDataObjectType", header: "vtkExplicitStructuredGrid.h".}
proc Initialize*(this: var vtkExplicitStructuredGrid) {.importcpp: "Initialize",
    header: "vtkExplicitStructuredGrid.h".}
## using statement

proc GetCell*(this: var vtkExplicitStructuredGrid; cellId: vtkIdType): ptr vtkCell {.
    importcpp: "GetCell", header: "vtkExplicitStructuredGrid.h".}
proc GetCell*(this: var vtkExplicitStructuredGrid; cellId: vtkIdType;
             cell: ptr vtkGenericCell) {.importcpp: "GetCell",
                                      header: "vtkExplicitStructuredGrid.h".}
proc GetCellBounds*(this: var vtkExplicitStructuredGrid; cellId: vtkIdType;
                   bounds: array[6, cdouble]) {.importcpp: "GetCellBounds",
    header: "vtkExplicitStructuredGrid.h".}
proc GetCellType*(this: var vtkExplicitStructuredGrid; cellId: vtkIdType): cint {.
    importcpp: "GetCellType", header: "vtkExplicitStructuredGrid.h".}
proc GetCellSize*(this: var vtkExplicitStructuredGrid; cellId: vtkIdType): vtkIdType {.
    importcpp: "GetCellSize", header: "vtkExplicitStructuredGrid.h".}
proc GetNumberOfCells*(this: var vtkExplicitStructuredGrid): vtkIdType {.
    importcpp: "GetNumberOfCells", header: "vtkExplicitStructuredGrid.h".}
proc GetCellPoints*(this: var vtkExplicitStructuredGrid; cellId: vtkIdType;
                   ptIds: ptr vtkIdList) {.importcpp: "GetCellPoints",
                                        header: "vtkExplicitStructuredGrid.h".}
proc GetPointCells*(this: var vtkExplicitStructuredGrid; ptId: vtkIdType;
                   cellIds: ptr vtkIdList) {.importcpp: "GetPointCells",
    header: "vtkExplicitStructuredGrid.h".}
proc GetMaxCellSize*(this: var vtkExplicitStructuredGrid): cint {.
    importcpp: "GetMaxCellSize", header: "vtkExplicitStructuredGrid.h".}
proc GetCellNeighbors*(this: var vtkExplicitStructuredGrid; cellId: vtkIdType;
                      ptIds: ptr vtkIdList; cellIds: ptr vtkIdList) {.
    importcpp: "GetCellNeighbors", header: "vtkExplicitStructuredGrid.h".}
proc CopyStructure*(this: var vtkExplicitStructuredGrid; ds: ptr vtkDataSet) {.
    importcpp: "CopyStructure", header: "vtkExplicitStructuredGrid.h".}
proc ShallowCopy*(this: var vtkExplicitStructuredGrid; src: ptr vtkDataObject) {.
    importcpp: "ShallowCopy", header: "vtkExplicitStructuredGrid.h".}
proc DeepCopy*(this: var vtkExplicitStructuredGrid; src: ptr vtkDataObject) {.
    importcpp: "DeepCopy", header: "vtkExplicitStructuredGrid.h".}
proc GetDataDimension*(this: var vtkExplicitStructuredGrid): cint {.
    importcpp: "GetDataDimension", header: "vtkExplicitStructuredGrid.h".}
proc SetDimensions*(this: var vtkExplicitStructuredGrid; i: cint; j: cint; k: cint) {.
    importcpp: "SetDimensions", header: "vtkExplicitStructuredGrid.h".}
proc SetDimensions*(this: var vtkExplicitStructuredGrid; dim: array[3, cint]) {.
    importcpp: "SetDimensions", header: "vtkExplicitStructuredGrid.h".}
proc GetDimensions*(this: var vtkExplicitStructuredGrid; dim: array[3, cint]) {.
    importcpp: "GetDimensions", header: "vtkExplicitStructuredGrid.h".}
proc GetCellDims*(this: var vtkExplicitStructuredGrid; cellDims: array[3, cint]) {.
    importcpp: "GetCellDims", header: "vtkExplicitStructuredGrid.h".}
proc GetExtentType*(this: var vtkExplicitStructuredGrid): cint {.
    importcpp: "GetExtentType", header: "vtkExplicitStructuredGrid.h".}
proc SetExtent*(this: var vtkExplicitStructuredGrid; x0: cint; x1: cint; y0: cint;
               y1: cint; z0: cint; z1: cint) {.importcpp: "SetExtent",
    header: "vtkExplicitStructuredGrid.h".}
proc SetExtent*(this: var vtkExplicitStructuredGrid; extent: array[6, cint]) {.
    importcpp: "SetExtent", header: "vtkExplicitStructuredGrid.h".}
## !!!Ignored construct:  virtual int * GetExtent ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Extent  pointer  << this -> Extent ) ; return this -> Extent ; } VTK_WRAPEXCLUDE virtual void GetExtent ( int & _arg1 , int & _arg2 , int & _arg3 , int & _arg4 , int & _arg5 , int & _arg6 ) { _arg1 = this -> Extent [ 0 ] ; _arg2 = this -> Extent [ 1 ] ; _arg3 = this -> Extent [ 2 ] ; _arg4 = this -> Extent [ 3 ] ; _arg5 = this -> Extent [ 4 ] ; _arg6 = this -> Extent [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Extent  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetExtent ( int _arg [ 6 ] ) { this -> GetExtent ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ;
## Error: expected ';'!!!

proc SetCells*(this: var vtkExplicitStructuredGrid; cells: ptr vtkCellArray) {.
    importcpp: "SetCells", header: "vtkExplicitStructuredGrid.h".}
proc GetnameCells*(this: var vtkExplicitStructuredGrid): ptr vtkCellArray {.
    importcpp: "GetnameCells", header: "vtkExplicitStructuredGrid.h".}
  ## /@}
  ## /@{
  ## *
  ##  Create/Get upward links from points to cells that use each point.
  ##  Enables topologically complex queries.
  ##
proc BuildLinks*(this: var vtkExplicitStructuredGrid) {.importcpp: "BuildLinks",
    header: "vtkExplicitStructuredGrid.h".}
proc GetnameCellsLinks*(this: var vtkExplicitStructuredGrid): ptr vtkAbstractCellLinks {.
    importcpp: "GetnameCellsLinks", header: "vtkExplicitStructuredGrid.h".}
  ## /@}
  ## *
  ##  Get direct raw pointer to the 8 points indices of an hexahedra.
  ##
  ##  Note: This method MAY NOT be thread-safe. (See GetCellAtId at vtkCellArray)
  ##
proc GetCellPoints*(this: var vtkExplicitStructuredGrid; cellId: vtkIdType): ptr vtkIdType {.
    importcpp: "GetCellPoints", header: "vtkExplicitStructuredGrid.h".}
proc GetCellPoints*(this: var vtkExplicitStructuredGrid; cellId: vtkIdType;
                   npts: var vtkIdType; pts: ptr vtkIdType) {.
    importcpp: "GetCellPoints", header: "vtkExplicitStructuredGrid.h".}
proc GetCellPoints*(this: var vtkExplicitStructuredGrid; cellId: vtkIdType;
                   npts: var vtkIdType; pts: ptr vtkIdType; ptIds: ptr vtkIdList) {.
    importcpp: "GetCellPoints", header: "vtkExplicitStructuredGrid.h".}
proc GetCellNeighbors*(this: var vtkExplicitStructuredGrid; cellId: vtkIdType;
                      neighbors: array[6, vtkIdType]; wholeExtent: ptr cint = nil) {.
    importcpp: "GetCellNeighbors", header: "vtkExplicitStructuredGrid.h".}
proc ComputeCellStructuredCoords*(this: var vtkExplicitStructuredGrid;
                                 cellId: vtkIdType; i: var cint; j: var cint;
                                 k: var cint; adjustForExtent: bool = true) {.
    importcpp: "ComputeCellStructuredCoords",
    header: "vtkExplicitStructuredGrid.h".}
proc ComputeCellId*(this: var vtkExplicitStructuredGrid; i: cint; j: cint; k: cint;
                   adjustForExtent: bool = true): vtkIdType {.
    importcpp: "ComputeCellId", header: "vtkExplicitStructuredGrid.h".}
proc ComputeFacesConnectivityFlagsArray*(this: var vtkExplicitStructuredGrid) {.
    importcpp: "ComputeFacesConnectivityFlagsArray",
    header: "vtkExplicitStructuredGrid.h".}
proc SetFacesConnectivityFlagsArrayName*(this: var vtkExplicitStructuredGrid;
                                        _arg: cstring) {.
    importcpp: "SetFacesConnectivityFlagsArrayName",
    header: "vtkExplicitStructuredGrid.h".}
proc GetFacesConnectivityFlagsArrayName*(this: var vtkExplicitStructuredGrid): cstring {.
    importcpp: "GetFacesConnectivityFlagsArrayName",
    header: "vtkExplicitStructuredGrid.h".}
  ## /@}
  ## /@{
  ## *
  ##  Methods for supporting blanking of cells. Blanking turns on or off
  ##  cells in the structured grid.
  ##  These methods should be called only after the dimensions of the
  ##  grid are set.
  ##
proc BlankCell*(this: var vtkExplicitStructuredGrid; cellId: vtkIdType) {.
    importcpp: "BlankCell", header: "vtkExplicitStructuredGrid.h".}
proc UnBlankCell*(this: var vtkExplicitStructuredGrid; cellId: vtkIdType) {.
    importcpp: "UnBlankCell", header: "vtkExplicitStructuredGrid.h".}
proc HasAnyBlankCells*(this: var vtkExplicitStructuredGrid): bool {.
    importcpp: "HasAnyBlankCells", header: "vtkExplicitStructuredGrid.h".}
proc IsCellVisible*(this: var vtkExplicitStructuredGrid; cellId: vtkIdType): cuchar {.
    importcpp: "IsCellVisible", header: "vtkExplicitStructuredGrid.h".}
proc IsCellGhost*(this: var vtkExplicitStructuredGrid; cellId: vtkIdType): cuchar {.
    importcpp: "IsCellGhost", header: "vtkExplicitStructuredGrid.h".}
proc HasAnyGhostCells*(this: var vtkExplicitStructuredGrid): bool {.
    importcpp: "HasAnyGhostCells", header: "vtkExplicitStructuredGrid.h".}
proc Crop*(this: var vtkExplicitStructuredGrid; updateExtent: ptr cint) {.
    importcpp: "Crop", header: "vtkExplicitStructuredGrid.h".}
proc Crop*(this: var vtkExplicitStructuredGrid;
          input: ptr vtkExplicitStructuredGrid; updateExtent: ptr cint;
          generateOriginalCellIds: bool) {.importcpp: "Crop",
    header: "vtkExplicitStructuredGrid.h".}
proc GetData*(info: ptr vtkInformation): ptr vtkExplicitStructuredGrid {.
    importcpp: "vtkExplicitStructuredGrid::GetData(@)",
    header: "vtkExplicitStructuredGrid.h".}
proc GetData*(v: ptr vtkInformationVector; i: cint = 0): ptr vtkExplicitStructuredGrid {.
    importcpp: "vtkExplicitStructuredGrid::GetData(@)",
    header: "vtkExplicitStructuredGrid.h".}
proc GetActualMemorySize*(this: var vtkExplicitStructuredGrid): culong {.
    importcpp: "GetActualMemorySize", header: "vtkExplicitStructuredGrid.h".}
proc CheckAndReorderFaces*(this: var vtkExplicitStructuredGrid) {.
    importcpp: "CheckAndReorderFaces", header: "vtkExplicitStructuredGrid.h".}
## using statement

proc GenerateGhostArray*(this: var vtkExplicitStructuredGrid;
                        zeroExt: array[6, cint]; cellOnly: bool) {.
    importcpp: "GenerateGhostArray", header: "vtkExplicitStructuredGrid.h".}
## ----------------------------------------------------------------------------

proc GetDimensions*(this: var vtkExplicitStructuredGrid; dim: array[3, cint]) {.
    importcpp: "GetDimensions", header: "vtkExplicitStructuredGrid.h".}
## ----------------------------------------------------------------------------

proc GetCellDims*(this: var vtkExplicitStructuredGrid; cellDims: array[3, cint]) {.
    importcpp: "GetCellDims", header: "vtkExplicitStructuredGrid.h".}
## ----------------------------------------------------------------------------

proc ComputeCellStructuredCoords*(this: var vtkExplicitStructuredGrid;
                                 cellId: vtkIdType; i: var cint; j: var cint;
                                 k: var cint; adjustForExtent: bool) {.
    importcpp: "ComputeCellStructuredCoords",
    header: "vtkExplicitStructuredGrid.h".}
## ----------------------------------------------------------------------------

proc ComputeCellId*(this: var vtkExplicitStructuredGrid; i: cint; j: cint; k: cint;
                   adjustForExtent: bool): vtkIdType {.importcpp: "ComputeCellId",
    header: "vtkExplicitStructuredGrid.h".}