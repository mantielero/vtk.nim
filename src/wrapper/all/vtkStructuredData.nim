## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkStructuredData.h
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
##  @class   vtkStructuredData
##  @brief   Singleton class for topologically regular data
##
##
##  vtkStructuredData is a singleton class that provides an interface for
##  topologically regular data. Regular data is data that can be accessed
##  in rectangular fashion using an i-j-k index. A finite difference grid,
##  a volume, or a pixmap are all considered regular.
##
##  @sa
##  vtkStructuredGrid vtkUniformGrid vtkRectilinearGrid vtkRectilinearGrid
##

## !!!Ignored construct:  # vtkStructuredData_h [NewLine] # vtkStructuredData_h [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkObject.h [NewLine] class vtkIdList ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkUnsignedCharArray"
const
  VTK_UNCHANGED* = 0
  VTK_SINGLE_POINT* = 1
  VTK_X_LINE* = 2
  VTK_Y_LINE* = 3
  VTK_Z_LINE* = 4
  VTK_XY_PLANE* = 5
  VTK_YZ_PLANE* = 6
  VTK_XZ_PLANE* = 7
  VTK_XYZ_GRID* = 8
  VTK_EMPTY* = 9

## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkStructuredData : public vtkObject { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkStructuredData :: IsTypeOf ( type ) ; } static vtkStructuredData * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkStructuredData * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkStructuredData * NewInstance ( ) const { return vtkStructuredData :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkStructuredData :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkStructuredData :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Specify the dimensions of a regular, rectangular dataset. The input is
##  the new dimensions (inDim) and the current dimensions (dim). The function
##  returns the dimension of the dataset (0-3D). If the dimensions are
##  improperly specified a -1 is returned. If the dimensions are unchanged, a
##  value of 100 is returned.
##  static int SetDimensions ( int inDim [ 3 ] , int dim [ 3 ] ) ; static int SetExtent ( int inExt [ 6 ] , int ext [ 6 ] ) ; /@} /@{ *
##  Returns the data description given the dimensions (eg. VTK_SINGLE_POINT,
##  VTK_X_LINE, VTK_XY_PLANE etc.)
##  static int GetDataDescription ( int dims [ 3 ] ) ; static int GetDataDescriptionFromExtent ( int ext [ 6 ] ) ; /@} /@{ *
##  Return the topological dimension of the data (e.g., 0, 1, 2, or 3D).
##  static int GetDataDimension ( int dataDescription ) ; static int GetDataDimension ( int ext [ 6 ] ) ; /@} *
##  Given the grid extent, this method returns the total number of points
##  within the extent.
##  The dataDescription field is not used.
##  static vtkIdType GetNumberOfPoints ( const int ext [ 6 ] , int dataDescription = VTK_EMPTY ) ; *
##  Given the grid extent, this method returns the total number of cells
##  within the extent.
##  The dataDescription field is not used.
##  static vtkIdType GetNumberOfCells ( const int ext [ 6 ] , int dataDescription = VTK_EMPTY ) ; *
##  Given the point extent of a grid, this method computes the corresponding
##  cell extent for the grid.
##  The dataDescription field is not used.
##  static void GetCellExtentFromPointExtent ( const int pntExtent [ 6 ] , int cellExtent [ 6 ] , int dataDescription = VTK_EMPTY ) ; *
##  Computes the structured grid dimensions based on the given extent.
##  The dataDescription field is not used.
##  static void GetDimensionsFromExtent ( const int ext [ 6 ] , int dims [ 3 ] , int dataDescription = VTK_EMPTY ) ; *
##  Return non-zero value if specified point is visible.
##  static bool IsPointVisible ( vtkIdType cellId , vtkUnsignedCharArray * ghosts ) ; *
##  Return non-zero value if specified cell is visible.
##  static bool IsCellVisible ( vtkIdType cellId , int dimensions [ 3 ] , int dataDescription , vtkUnsignedCharArray * cellGhostArray , vtkUnsignedCharArray * pointGhostArray = nullptr ) ; *
##  Returns the cell dimensions, i.e., the number of cells along the i,j,k
##  for the grid with the given grid extent. Note, the grid extent is the
##  number of points.
##  The dataDescription field is not used.
##  static void GetCellDimensionsFromExtent ( const int ext [ 6 ] , int celldims [ 3 ] , int dataDescription = VTK_EMPTY ) ; *
##  Given the dimensions of the grid, in pntdims, this method returns
##  the corresponding cell dimensions for the given grid.
##  The dataDescription field is not used.
##  static void GetCellDimensionsFromPointDimensions ( const int pntdims [ 3 ] , int cellDims [ 3 ] ) ; *
##  Given the global structured coordinates for a point or cell, ijk, w.r.t.
##  as well as, the global sub-grid cell or point extent, this method computes
##  the corresponding local structured coordinates, lijk, starting from 0.
##  The dataDescription argument is not used.
##  static void GetLocalStructuredCoordinates ( const int ijk [ 3 ] , const int ext [ 6 ] , int lijk [ 3 ] , int dataDescription = VTK_EMPTY ) ; *
##  Given local structured coordinates, and the corresponding global sub-grid
##  extent, this method computes the global ijk coordinates.
##  The dataDescription parameter is not used.
##  static void GetGlobalStructuredCoordinates ( const int lijk [ 3 ] , const int ext [ 6 ] , int ijk [ 3 ] , int dataDescription = VTK_EMPTY ) ; *
##  Get the points defining a cell. (See vtkDataSet for more info.)
##  static void GetCellPoints ( vtkIdType cellId , vtkIdList * ptIds , int dataDescription , int dim [ 3 ] ) ; *
##  Get the cells using a point. (See vtkDataSet for more info.)
##  static void GetPointCells ( vtkIdType ptId , vtkIdList * cellIds , int dim [ 3 ] ) ; *
##  Get the cells using the points ptIds, exclusive of the cell cellId.
##  (See vtkDataSet for more info.)
##  static void GetCellNeighbors ( vtkIdType cellId , vtkIdList * ptIds , vtkIdList * cellIds , int dim [ 3 ] ) ; static void GetCellNeighbors ( vtkIdType cellId , vtkIdList * ptIds , vtkIdList * cellIds , int dim [ 3 ] , int seedLoc [ 3 ] ) ; *
##  Given a location in structured coordinates (i-j-k), and the extent
##  of the structured dataset, return the point id.
##  The dataDescription argument is not used.
##  static vtkIdType ComputePointIdForExtent ( const int extent [ 6 ] , const int ijk [ 3 ] , int dataDescription = VTK_EMPTY ) ; *
##  Given a location in structured coordinates (i-j-k), and the extent
##  of the structured dataset, return the point id.
##  The dataDescription argument is not used.
##  static vtkIdType ComputeCellIdForExtent ( const int extent [ 6 ] , const int ijk [ 3 ] , int dataDescription = VTK_EMPTY ) ; *
##  Given a location in structured coordinates (i-j-k), and the dimensions
##  of the structured dataset, return the point id.  This method does not
##  adjust for the beginning of the extent.
##  The dataDescription argument is not used.
##  static vtkIdType ComputePointId ( const int dim [ 3 ] , const int ijk [ 3 ] , int dataDescription = VTK_EMPTY ) ; *
##  Given a location in structured coordinates (i-j-k), and the dimensions
##  of the structured dataset, return the cell id.  This method does not
##  adjust for the beginning of the extent.
##  The dataDescription argument is not used.
##  static vtkIdType ComputeCellId ( const int dim [ 3 ] , const int ijk [ 3 ] , int dataDescription = VTK_EMPTY ) ; *
##  Given the global grid extent and the linear index of a cell within the
##  grid extent, this method computes the corresponding structured coordinates
##  of the given cell. This method adjusts for the beginning of the extent.
##  The dataDescription argument is not used.
##  static void ComputeCellStructuredCoordsForExtent ( const vtkIdType cellIdx , const int ext [ 6 ] , int ijk [ 3 ] , int dataDescription = VTK_EMPTY ) ; *
##  Given a cellId and grid dimensions 'dim', get the structured coordinates
##  (i-j-k). This method does not adjust for the beginning of the extent.
##  The dataDescription argument is not used.
##  static void ComputeCellStructuredCoords ( const vtkIdType cellId , const int dim [ 3 ] , int ijk [ 3 ] , int dataDescription = VTK_EMPTY ) ; *
##  Given a pointId and the grid extent ext, get the structured coordinates
##  (i-j-k). This method adjusts for the beginning of the extent.
##  The dataDescription argument is not used.
##  static void ComputePointStructuredCoordsForExtent ( const vtkIdType ptId , const int ext [ 6 ] , int ijk [ 3 ] , int dataDescription = VTK_EMPTY ) ; *
##  Given a pointId and grid dimensions 'dim', get the structured coordinates
##  (i-j-k). This method does not adjust for the beginning of the extent.
##  The dataDescription argument is not used.
##  static void ComputePointStructuredCoords ( const vtkIdType ptId , const int dim [ 3 ] , int ijk [ 3 ] , int dataDescription = VTK_EMPTY ) ; protected : vtkStructuredData ( ) = default ; ~ vtkStructuredData ( ) override = default ; *
##  Computes the linear index for the given i-j-k structured of a grid with
##  of N1 and N2 dimensions along its principal directions. For example, the
##  principal directions of a 3-D grid are Ni and Nj and likewise for a 2-D
##  grid along the XY plane. For a grid in the XZ plane however, the principal
##  directions are Ni and Nk.
##  static vtkIdType GetLinearIndex ( const int i , const int j , const int k , const int N1 , const int N2 ) { return ( ( static_cast < vtkIdType > ( k ) * N2 + j ) * N1 + i ) ; } /@{ *
##  Returns the structured coordinates (i,j,k) for the given linear index of
##  a grid with N1 and N2 dimensions along its principal directions.
##  NOTE: i,j,k are relative to the frame of reference of the grid. For example,
##  if the grid is on the XZ-Plane, then i=>i, j=>k, k=>j.
##  static void GetStructuredCoordinates ( const vtkIdType idx , const int N1 , const int N2 , int & i , int & j , int & k ) { vtkIdType N12 = N1 * N2 ; k = static_cast < int > ( idx / N12 ) ; j = static_cast < int > ( ( idx - k * N12 ) / N1 ) ; i = static_cast < int > ( idx - k * N12 - j * N1 ) ; } /@}  Want to avoid importing <algorithm> in the header... template < typename T > static T Max ( const T & a , const T & b ) { return ( a > b ) ? a : b ; } private : vtkStructuredData ( const vtkStructuredData & ) = delete ; void operator = ( const vtkStructuredData & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## ------------------------------------------------------------------------------

proc GetCellDimensionsFromExtent*(ext: array[6, cint]; celldims: array[3, cint];
                                 a3: cint) {.
    importcpp: "VTKCOMMONDATAMODEL_EXPORT::GetCellDimensionsFromExtent(@)",
    header: "vtkStructuredData.h".}
## ------------------------------------------------------------------------------

proc ComputePointId*(dims: array[3, cint]; ijk: array[3, cint]; a3: cint): vtkIdType {.
    importcpp: "VTKCOMMONDATAMODEL_EXPORT::ComputePointId(@)",
    header: "vtkStructuredData.h".}
## ------------------------------------------------------------------------------

proc ComputeCellId*(dims: array[3, cint]; ijk: array[3, cint]; a3: cint): vtkIdType {.
    importcpp: "VTKCOMMONDATAMODEL_EXPORT::ComputeCellId(@)",
    header: "vtkStructuredData.h".}
## ------------------------------------------------------------------------------

proc GetNumberOfPoints*(ext: array[6, cint]; a2: cint): vtkIdType {.
    importcpp: "VTKCOMMONDATAMODEL_EXPORT::GetNumberOfPoints(@)",
    header: "vtkStructuredData.h".}
## ------------------------------------------------------------------------------

proc GetNumberOfCells*(ext: array[6, cint]; a2: cint): vtkIdType {.
    importcpp: "VTKCOMMONDATAMODEL_EXPORT::GetNumberOfCells(@)",
    header: "vtkStructuredData.h".}
## ------------------------------------------------------------------------------

proc GetCellExtentFromPointExtent*(nodeExtent: array[6, cint];
                                  cellExtent: array[6, cint]; a3: cint) {.
    importcpp: "VTKCOMMONDATAMODEL_EXPORT::GetCellExtentFromPointExtent(@)",
    header: "vtkStructuredData.h".}
## ------------------------------------------------------------------------------

proc GetDimensionsFromExtent*(ext: array[6, cint]; dims: array[3, cint]; a3: cint) {.
    importcpp: "VTKCOMMONDATAMODEL_EXPORT::GetDimensionsFromExtent(@)",
    header: "vtkStructuredData.h".}
## ------------------------------------------------------------------------------

proc GetCellDimensionsFromPointDimensions*(nodeDims: array[3, cint];
    cellDims: array[3, cint]) {.importcpp: "VTKCOMMONDATAMODEL_EXPORT::GetCellDimensionsFromPointDimensions(@)",
                             header: "vtkStructuredData.h".}
## ------------------------------------------------------------------------------

proc GetLocalStructuredCoordinates*(ijk: array[3, cint]; ext: array[6, cint];
                                   lijk: array[3, cint]; a4: cint) {.
    importcpp: "VTKCOMMONDATAMODEL_EXPORT::GetLocalStructuredCoordinates(@)",
    header: "vtkStructuredData.h".}
## ------------------------------------------------------------------------------

proc GetGlobalStructuredCoordinates*(lijk: array[3, cint]; ext: array[6, cint];
                                    ijk: array[3, cint]; a4: cint) {.
    importcpp: "VTKCOMMONDATAMODEL_EXPORT::GetGlobalStructuredCoordinates(@)",
    header: "vtkStructuredData.h".}
## ------------------------------------------------------------------------------

proc ComputePointIdForExtent*(extent: array[6, cint]; ijk: array[3, cint]; a3: cint): vtkIdType {.
    importcpp: "VTKCOMMONDATAMODEL_EXPORT::ComputePointIdForExtent(@)",
    header: "vtkStructuredData.h".}
## ------------------------------------------------------------------------------

proc ComputeCellIdForExtent*(extent: array[6, cint]; ijk: array[3, cint]; a3: cint): vtkIdType {.
    importcpp: "VTKCOMMONDATAMODEL_EXPORT::ComputeCellIdForExtent(@)",
    header: "vtkStructuredData.h".}
## ------------------------------------------------------------------------------

proc ComputeCellStructuredCoords*(cellId: vtkIdType; dims: array[3, cint];
                                 ijk: array[3, cint]; a4: cint) {.
    importcpp: "VTKCOMMONDATAMODEL_EXPORT::ComputeCellStructuredCoords(@)",
    header: "vtkStructuredData.h".}
## ------------------------------------------------------------------------------

proc ComputeCellStructuredCoordsForExtent*(cellIdx: vtkIdType; ext: array[6, cint];
    ijk: array[3, cint]; a4: cint) {.importcpp: "VTKCOMMONDATAMODEL_EXPORT::ComputeCellStructuredCoordsForExtent(@)",
                                header: "vtkStructuredData.h".}
## ------------------------------------------------------------------------------

proc ComputePointStructuredCoords*(ptId: vtkIdType; dim: array[3, cint];
                                  ijk: array[3, cint]; a4: cint) {.
    importcpp: "VTKCOMMONDATAMODEL_EXPORT::ComputePointStructuredCoords(@)",
    header: "vtkStructuredData.h".}
## ------------------------------------------------------------------------------

proc ComputePointStructuredCoordsForExtent*(ptId: vtkIdType; ext: array[6, cint];
    ijk: array[3, cint]; a4: cint) {.importcpp: "VTKCOMMONDATAMODEL_EXPORT::ComputePointStructuredCoordsForExtent(@)",
                                header: "vtkStructuredData.h".}