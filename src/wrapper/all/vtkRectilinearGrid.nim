## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRectilinearGrid.h
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
##  @class   vtkRectilinearGrid
##  @brief   a dataset that is topologically regular with variable spacing in the three coordinate
##  directions
##
##  vtkRectilinearGrid is a data object that is a concrete implementation of
##  vtkDataSet. vtkRectilinearGrid represents a geometric structure that is
##  topologically regular with variable spacing in the three coordinate
##  directions x-y-z.
##
##  To define a vtkRectilinearGrid, you must specify the dimensions of the
##  data and provide three arrays of values specifying the coordinates
##  along the x-y-z axes. The coordinate arrays are specified using three
##  vtkDataArray objects (one for x, one for y, one for z).
##
##  @warning
##  Make sure that the dimensions of the grid match the number of coordinates
##  in the x-y-z directions. If not, unpredictable results (including
##  program failure) may result. Also, you must supply coordinates in all
##  three directions, even if the dataset topology is 2D, 1D, or 0D.
##

## !!!Ignored construct:  # vtkRectilinearGrid_h [NewLine] # vtkRectilinearGrid_h [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkDataSet.h [NewLine] # vtkStructuredData.h  For inline methods [NewLine] class vtkVertex ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkLine"
discard "forward decl of vtkPixel"
discard "forward decl of vtkVoxel"
discard "forward decl of vtkDataArray"
discard "forward decl of vtkPoints"
## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkRectilinearGrid : public vtkDataSet { public : static vtkRectilinearGrid * New ( ) ; static vtkRectilinearGrid * ExtendedNew ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataSet Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataSet :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkRectilinearGrid :: IsTypeOf ( type ) ; } static vtkRectilinearGrid * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkRectilinearGrid * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkRectilinearGrid * NewInstance ( ) const { return vtkRectilinearGrid :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSet :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRectilinearGrid :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRectilinearGrid :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Return what type of dataset this is.
##  int GetDataObjectType ( ) override { return VTK_RECTILINEAR_GRID ; } *
##  Copy the geometric and topological structure of an input rectilinear grid
##  object.
##  void CopyStructure ( vtkDataSet * ds ) override ; *
##  Restore object to initial state. Release memory back to system.
##  void Initialize ( ) override ; /@{ *
##  Standard vtkDataSet API methods. See vtkDataSet for more information.
##  vtkIdType GetNumberOfCells ( ) override ; vtkIdType GetNumberOfPoints ( ) override ; double * GetPoint ( vtkIdType ptId ) VTK_SIZEHINT ( 3 ) override ; void GetPoint ( vtkIdType id , double x [ 3 ] ) override ; vtkCell * GetCell ( vtkIdType cellId ) override ; vtkCell * GetCell ( int i , int j , int k ) override ; void GetCell ( vtkIdType cellId , vtkGenericCell * cell ) override ; void GetCellBounds ( vtkIdType cellId , double bounds [ 6 ] ) override ; vtkIdType FindPoint ( double x , double y , double z ) { return this -> vtkDataSet :: FindPoint ( x , y , z ) ; } vtkIdType FindPoint ( double x [ 3 ] ) override ; vtkIdType FindCell ( double x [ 3 ] , vtkCell * cell , vtkIdType cellId , double tol2 , int & subId , double pcoords [ 3 ] , double * weights ) override ; vtkIdType FindCell ( double x [ 3 ] , vtkCell * cell , vtkGenericCell * gencell , vtkIdType cellId , double tol2 , int & subId , double pcoords [ 3 ] , double * weights ) override ; vtkCell * FindAndGetCell ( double x [ 3 ] , vtkCell * cell , vtkIdType cellId , double tol2 , int & subId , double pcoords [ 3 ] , double * weights ) override ; int GetCellType ( vtkIdType cellId ) override ; vtkIdType GetCellSize ( vtkIdType cellId ) override ; using vtkDataSet :: GetCellPoints ; void GetCellPoints ( vtkIdType cellId , vtkIdList * ptIds ) override { vtkStructuredData :: GetCellPoints ( cellId , ptIds , this -> DataDescription , this -> Dimensions ) ; } void GetPointCells ( vtkIdType ptId , vtkIdList * cellIds ) override { vtkStructuredData :: GetPointCells ( ptId , cellIds , this -> Dimensions ) ; } void ComputeBounds ( ) override ; int GetMaxCellSize ( ) override { return 8 ; }  voxel is the largest void GetCellNeighbors ( vtkIdType cellId , vtkIdList * ptIds , vtkIdList * cellIds ) override ; void GetCellNeighbors ( vtkIdType cellId , vtkIdList * ptIds , vtkIdList * cellIds , int * seedLoc ) ; /@} *
##  Return non-zero value if specified point is visible.
##  These methods should be called only after the dimensions of the
##  grid are set.
##  unsigned char IsPointVisible ( vtkIdType ptId ) ; *
##  Return non-zero value if specified point is visible.
##  These methods should be called only after the dimensions of the
##  grid are set.
##  unsigned char IsCellVisible ( vtkIdType cellId ) ; *
##  Returns 1 if there is any visibility constraint on the points,
##  0 otherwise.
##  bool HasAnyBlankPoints ( ) override ; *
##  Returns 1 if there is any visibility constraint on the cells,
##  0 otherwise.
##  bool HasAnyBlankCells ( ) override ; *
##  Given the node dimensions of this grid instance, this method computes the
##  node dimensions. The value in each dimension can will have a lowest value
##  of "1" such that computing the total number of cells can be achieved by
##  simply by cellDims[0]*cellDims[1]*cellDims[2].
##  void GetCellDims ( int cellDims [ 3 ] ) ; *
##  Given a user-supplied vtkPoints container object, this method fills in all
##  the points of the RectilinearGrid.
##  void GetPoints ( vtkPoints * pnts ) ; /@{ *
##  Set dimensions of rectilinear grid dataset.
##  This also sets the extent.
##  void SetDimensions ( int i , int j , int k ) ; void SetDimensions ( const int dim [ 3 ] ) ; /@} /@{ *
##  Get dimensions of this rectilinear grid dataset.
##  virtual int * GetDimensions ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Dimensions  pointer  << this -> Dimensions ) ; return this -> Dimensions ; } VTK_WRAPEXCLUDE virtual void GetDimensions ( int data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Dimensions [ i ] ; } } ; /@} *
##  Return the dimensionality of the data.
##  int GetDataDimension ( ) ; *
##  Convenience function computes the structured coordinates for a point x[3].
##  The cell is specified by the array ijk[3], and the parametric coordinates
##  in the cell are specified with pcoords[3]. The function returns a 0 if the
##  point x is outside of the grid, and a 1 if inside the grid.
##  int ComputeStructuredCoordinates ( double x [ 3 ] , int ijk [ 3 ] , double pcoords [ 3 ] ) ; *
##  Given a location in structured coordinates (i-j-k), return the point id.
##  vtkIdType ComputePointId ( int ijk [ 3 ] ) ; *
##  Given a location in structured coordinates (i-j-k), return the cell id.
##  vtkIdType ComputeCellId ( int ijk [ 3 ] ) ; *
##  Given the IJK-coordinates of the point, it returns the corresponding
##  xyz-coordinates. The xyz coordinates are stored in the user-supplied
##  array p.
##  void GetPoint ( const int i , const int j , const int k , double p [ 3 ] ) ; /@{ *
##  Specify the grid coordinates in the x-direction.
##  virtual void SetXCoordinates ( vtkDataArray * ) ; virtual vtkDataArray * GetnameXCoordinates ( ) { vtkDebugWithObjectMacro ( this , <<  returning  XCoordinates  address  << static_cast < vtkDataArray * > ( this -> XCoordinates ) ) ; return this -> XCoordinates ; } ; /@} /@{ *
##  Specify the grid coordinates in the y-direction.
##  virtual void SetYCoordinates ( vtkDataArray * ) ; virtual vtkDataArray * GetnameXCoordinatesYCoordinates ( ) { vtkDebugWithObjectMacro ( this , <<  returning  YCoordinates  address  << static_cast < vtkDataArray * > ( this -> YCoordinates ) ) ; return this -> YCoordinates ; } ; /@} /@{ *
##  Specify the grid coordinates in the z-direction.
##  virtual void SetZCoordinates ( vtkDataArray * ) ; virtual vtkDataArray * GetnameXCoordinatesYCoordinatesZCoordinates ( ) { vtkDebugWithObjectMacro ( this , <<  returning  ZCoordinates  address  << static_cast < vtkDataArray * > ( this -> ZCoordinates ) ) ; return this -> ZCoordinates ; } ; /@} /@{ *
##  Different ways to set the extent of the data array.  The extent
##  should be set before the "Scalars" are set or allocated.
##  The Extent is stored in the order (X, Y, Z).
##  void SetExtent ( int extent [ 6 ] ) ; void SetExtent ( int xMin , int xMax , int yMin , int yMax , int zMin , int zMax ) ; virtual int * GetExtent ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Extent  pointer  << this -> Extent ) ; return this -> Extent ; } VTK_WRAPEXCLUDE virtual void GetExtent ( int & _arg1 , int & _arg2 , int & _arg3 , int & _arg4 , int & _arg5 , int & _arg6 ) { _arg1 = this -> Extent [ 0 ] ; _arg2 = this -> Extent [ 1 ] ; _arg3 = this -> Extent [ 2 ] ; _arg4 = this -> Extent [ 3 ] ; _arg5 = this -> Extent [ 4 ] ; _arg6 = this -> Extent [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Extent  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetExtent ( int _arg [ 6 ] ) { this -> GetExtent ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; /@} *
##  Return the actual size of the data in kibibytes (1024 bytes). This number
##  is valid only after the pipeline has updated. The memory size
##  returned is guaranteed to be greater than or equal to the
##  memory required to represent the data (e.g., extra space in
##  arrays, etc. are not included in the return value). THIS METHOD
##  IS THREAD SAFE.
##  unsigned long GetActualMemorySize ( ) override ; /@{ *
##  Shallow and Deep copy.
##  void ShallowCopy ( vtkDataObject * src ) override ; void DeepCopy ( vtkDataObject * src ) override ; /@} *
##  Structured extent. The extent type is a 3D extent
##  int GetExtentType ( ) override { return VTK_3D_EXTENT ; } *
##  Reallocates and copies to set the Extent to the UpdateExtent.
##  This is used internally when the exact extent is requested,
##  and the source generated more than the update extent.
##  void Crop ( const int * updateExtent ) override ; /@{ *
##  Retrieve an instance of this class from an information object.
##  static vtkRectilinearGrid * GetData ( vtkInformation * info ) ; static vtkRectilinearGrid * GetData ( vtkInformationVector * v , int i = 0 ) ; /@} /@{ *
##  Set/Get the scalar data type for the points. This is setting pipeline info.
##  static void SetScalarType ( int , vtkInformation * meta_data ) ; static int GetScalarType ( vtkInformation * meta_data ) ; static bool HasScalarType ( vtkInformation * meta_data ) ; int GetScalarType ( ) ; const char * GetScalarTypeAsString ( ) { return ( ( ( this -> GetScalarType ( ) ) == VTK_VOID ) ? void : ( ( ( this -> GetScalarType ( ) ) == VTK_BIT ) ? bit : ( ( ( this -> GetScalarType ( ) ) == VTK_CHAR ) ? char : ( ( ( this -> GetScalarType ( ) ) == VTK_SIGNED_CHAR ) ? signed char : ( ( ( this -> GetScalarType ( ) ) == VTK_UNSIGNED_CHAR ) ? unsigned char : ( ( ( this -> GetScalarType ( ) ) == VTK_SHORT ) ? short : ( ( ( this -> GetScalarType ( ) ) == VTK_UNSIGNED_SHORT ) ? unsigned short : ( ( ( this -> GetScalarType ( ) ) == VTK_INT ) ? int : ( ( ( this -> GetScalarType ( ) ) == VTK_UNSIGNED_INT ) ? unsigned int : ( ( ( this -> GetScalarType ( ) ) == VTK_LONG ) ? long : ( ( ( this -> GetScalarType ( ) ) == VTK_UNSIGNED_LONG ) ? unsigned long : ( ( ( this -> GetScalarType ( ) ) == VTK_LONG_LONG ) ? long long : ( ( ( this -> GetScalarType ( ) ) == VTK_UNSIGNED_LONG_LONG ) ? unsigned long long : ( ( ( this -> GetScalarType ( ) ) == VTK_FLOAT ) ? float : ( ( ( this -> GetScalarType ( ) ) == VTK_DOUBLE ) ? double : ( ( ( this -> GetScalarType ( ) ) == VTK_ID_TYPE ) ? idtype : ( ( ( this -> GetScalarType ( ) ) == VTK_STRING ) ? string : ( ( ( this -> GetScalarType ( ) ) == VTK_VARIANT ) ? variant : ( ( ( this -> GetScalarType ( ) ) == VTK_OBJECT ) ? object : Undefined ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ; } /@} /@{ *
##  Set/Get the number of scalar components for points. As with the
##  SetScalarType method this is setting pipeline info.
##  static void SetNumberOfScalarComponents ( int n , vtkInformation * meta_data ) ; static int GetNumberOfScalarComponents ( vtkInformation * meta_data ) ; static bool HasNumberOfScalarComponents ( vtkInformation * meta_data ) ; int GetNumberOfScalarComponents ( ) ; /@} protected : vtkRectilinearGrid ( ) ; ~ vtkRectilinearGrid ( ) override ;  for the GetCell method vtkVertex * Vertex ; vtkLine * Line ; vtkPixel * Pixel ; vtkVoxel * Voxel ; int Dimensions [ 3 ] ; int DataDescription ; int Extent [ 6 ] ; vtkDataArray * XCoordinates ; vtkDataArray * YCoordinates ; vtkDataArray * ZCoordinates ;  Hang on to some space for returning points when GetPoint(id) is called. double PointReturn [ 3 ] ; private : void Cleanup ( ) ; private : vtkRectilinearGrid ( const vtkRectilinearGrid & ) = delete ; void operator = ( const vtkRectilinearGrid & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## ----------------------------------------------------------------------------

proc GetNumberOfCells*(): vtkIdType {.importcpp: "VTKCOMMONDATAMODEL_EXPORT::GetNumberOfCells(@)",
                                   header: "vtkRectilinearGrid.h".}
## ----------------------------------------------------------------------------

proc GetNumberOfPoints*(): vtkIdType {.importcpp: "VTKCOMMONDATAMODEL_EXPORT::GetNumberOfPoints(@)",
                                    header: "vtkRectilinearGrid.h".}
## ----------------------------------------------------------------------------

proc GetDataDimension*(): cint {.importcpp: "VTKCOMMONDATAMODEL_EXPORT::GetDataDimension(@)",
                              header: "vtkRectilinearGrid.h".}
## ----------------------------------------------------------------------------

proc ComputePointId*(ijk: array[3, cint]): vtkIdType {.
    importcpp: "VTKCOMMONDATAMODEL_EXPORT::ComputePointId(@)",
    header: "vtkRectilinearGrid.h".}
## ----------------------------------------------------------------------------

proc ComputeCellId*(ijk: array[3, cint]): vtkIdType {.
    importcpp: "VTKCOMMONDATAMODEL_EXPORT::ComputeCellId(@)",
    header: "vtkRectilinearGrid.h".}