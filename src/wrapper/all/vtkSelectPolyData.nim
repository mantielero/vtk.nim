## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSelectPolyData.h
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
##  @class   vtkSelectPolyData
##  @brief   select portion of polygonal mesh; generate selection scalars
##
##  vtkSelectPolyData is a filter that selects polygonal data based on
##  defining a "loop" and indicating the region inside of the loop. The
##  mesh within the loop consists of complete cells (the cells are not
##  cut). Alternatively, this filter can be used to generate scalars.
##  These scalar values, which are a distance measure to the loop, can
##  be used to clip, contour. or extract data (i.e., anything that an
##  implicit function can do).
##
##  The loop is defined by an array of x-y-z point coordinates.
##  (Coordinates should be in the same coordinate space as the input
##  polygonal data.) The loop can be concave and non-planar, but not
##  self-intersecting. The input to the filter is a polygonal mesh
##  (only surface primitives such as triangle strips and polygons); the
##  output is either a) a portion of the original mesh laying within
##  the selection loop (GenerateSelectionScalarsOff); or b) the same
##  polygonal mesh with the addition of scalar values
##  (GenerateSelectionScalarsOn).
##
##  The algorithm works as follows. For each point coordinate in the
##  loop, the closest point in the mesh is found. The result is a loop
##  of closest point ids from the mesh. Then, the edges in the mesh
##  connecting the closest points (and laying along the lines forming
##  the loop) are found. Edges between the points can be searched using
##  one of these methods:
##  A) Greedy edge tracking.
##  At the current point, the mesh edge oriented in the
##  direction of and whose end point is closest to the line is
##  chosen. The edge is followed to the new end point, and the
##  procedure is repeated. This process continues until the entire loop
##  has been created. This method is simple and fast but heuristic,
##  and edge search can randomly fail ("Can't follow edge" error)
##  even for simple, flawless meshes when edge search arrives to a point
##  from where there is no edge pointing towards the next loop point.
##  B) Dijkstra shortest path. This method guarantees to find the shortest
##  path between the loop points.
##
##  By default the greedy edge tracking method is used to preserve
##  backward compatibility, but generally the Dijkstra shortest path
##  method is recommended due to its robustness.
##
##  To determine what portion of the mesh is inside and outside of the
##  loop, three options are possible. 1) the smallest connected region,
##  2) the largest connected region, and 3) the connected region
##  closest to a user specified point. (Set the ivar SelectionMode.)
##
##  Once the loop is computed as above, the GenerateSelectionScalars
##  controls the output of the filter. If on, then scalar values are
##  generated based on distance to the loop lines. Otherwise, the cells
##  laying inside the selection loop are output. By default, the mesh
##  laying within the loop is output; however, if InsideOut is on, then
##  the portion of the mesh laying outside of the loop is output.
##
##  The filter can be configured to generate the unselected portions of
##  the mesh as output by setting GenerateUnselectedOutput. Use the
##  method GetUnselectedOutput to access this output. (Note: this flag
##  is pertinent only when GenerateSelectionScalars is off.)
##
##  @warning
##  Make sure that the points you pick are on a connected surface. If
##  not, then the filter will generate an empty or partial result. Also,
##  self-intersecting loops will generate unpredictable results.
##
##  @warning
##  During processing of the data, non-triangular cells are converted to
##  triangles if GenerateSelectionScalars is off.
##
##  @sa
##  vtkImplicitSelectionLoop
##

## !!!Ignored construct:  # vtkSelectPolyData_h [NewLine] # vtkSelectPolyData_h [NewLine] # vtkFiltersModelingModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] # VTK_INSIDE_SMALLEST_REGION 0 [NewLine] # VTK_INSIDE_LARGEST_REGION 1 [NewLine] # VTK_INSIDE_CLOSEST_POINT_REGION 2 [NewLine] # VTK_GREEDY_EDGE_SEARCH 0 [NewLine] # VTK_DIJKSTRA_EDGE_SEARCH 1 [NewLine] class vtkCharArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPoints"
discard "forward decl of vtkIdList"
## !!!Ignored construct:  class VTKFILTERSMODELING_EXPORT vtkSelectPolyData : public vtkPolyDataAlgorithm { public : *
##  Instantiate object with InsideOut turned off, and
##  GenerateSelectionScalars turned off. The unselected output
##  is not generated, and the inside mode is the smallest region.
##  static vtkSelectPolyData * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSelectPolyData :: IsTypeOf ( type ) ; } static vtkSelectPolyData * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSelectPolyData * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSelectPolyData * NewInstance ( ) const { return vtkSelectPolyData :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSelectPolyData :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSelectPolyData :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set/Get the flag to control behavior of the filter. If
##  GenerateSelectionScalars is on, then the output of the filter
##  is the same as the input, except that scalars are generated.
##  If off, the filter outputs the cells laying inside the loop, and
##  does not generate scalars.
##  virtual void SetGenerateSelectionScalars ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateSelectionScalars  to  << _arg ) ; if ( this -> GenerateSelectionScalars != _arg ) { this -> GenerateSelectionScalars = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetGenerateSelectionScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateSelectionScalars  of  << this -> GenerateSelectionScalars ) ; return this -> GenerateSelectionScalars ; } ; virtual void GenerateSelectionScalarsOn ( ) { this -> SetGenerateSelectionScalars ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GenerateSelectionScalarsOff ( ) { this -> SetGenerateSelectionScalars ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the InsideOut flag. When off, the mesh within the loop is
##  extracted. When on, the mesh outside the loop is extracted.
##  virtual void SetGenerateSelectionScalarsInsideOut ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  InsideOut  to  << _arg ) ; if ( this -> InsideOut != _arg ) { this -> InsideOut = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetGenerateSelectionScalarsInsideOut ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InsideOut  of  << this -> InsideOut ) ; return this -> InsideOut ; } ; virtual void InsideOutOn ( ) { this -> SetGenerateSelectionScalarsInsideOut ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void InsideOutOff ( ) { this -> SetGenerateSelectionScalarsInsideOut ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set the edge search mode. VTK_GREEDY_EDGE_SEARCH is simple and fast,
##  VTK_DIJKSTRA_EDGE_SEARCH is more robust and guaranteed to provide
##  shortest path between loop points.
##  If the algorithm fails with "Can't follow edge" error then switch to
##  Dijkstra method.
##  The default is VTK_GREEDY_EDGE_SEARCH for backward compatibility.
##  virtual void SetEdgeSearchMode ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << EdgeSearchMode  to  << _arg ) ; if ( this -> EdgeSearchMode != ( _arg < VTK_GREEDY_EDGE_SEARCH ? VTK_GREEDY_EDGE_SEARCH : ( _arg > VTK_DIJKSTRA_EDGE_SEARCH ? VTK_DIJKSTRA_EDGE_SEARCH : _arg ) ) ) { this -> EdgeSearchMode = ( _arg < VTK_GREEDY_EDGE_SEARCH ? VTK_GREEDY_EDGE_SEARCH : ( _arg > VTK_DIJKSTRA_EDGE_SEARCH ? VTK_DIJKSTRA_EDGE_SEARCH : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetEdgeSearchModeMinValue ( ) { return VTK_GREEDY_EDGE_SEARCH ; } virtual int GetEdgeSearchModeMaxValue ( ) { return VTK_DIJKSTRA_EDGE_SEARCH ; } ; virtual int GetGenerateSelectionScalarsInsideOutEdgeSearchMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EdgeSearchMode  of  << this -> EdgeSearchMode ) ; return this -> EdgeSearchMode ; } ; void SetEdgeSearchModeToGreedy ( ) { this -> SetEdgeSearchMode ( VTK_GREEDY_EDGE_SEARCH ) ; } void SetEdgeSearchModeToDijkstra ( ) { this -> SetEdgeSearchMode ( VTK_DIJKSTRA_EDGE_SEARCH ) ; } const char * GetEdgeSearchModeAsString ( ) ; /@} /@{ *
##  Set/Get the array of point coordinates defining the loop. There must
##  be at least three points used to define a loop.
##  virtual void SetLoop ( vtkPoints * ) ; virtual vtkPoints * GetnameLoop ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Loop  address  << static_cast < vtkPoints * > ( this -> Loop ) ) ; return this -> Loop ; } ; /@} /@{ *
##  Set/Get the point used in SelectionModeToClosestPointRegion.
##  virtual void SetClosestPoint ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << ClosestPoint  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> ClosestPoint [ 0 ] != _arg1 ) || ( this -> ClosestPoint [ 1 ] != _arg2 ) || ( this -> ClosestPoint [ 2 ] != _arg3 ) ) { this -> ClosestPoint [ 0 ] = _arg1 ; this -> ClosestPoint [ 1 ] = _arg2 ; this -> ClosestPoint [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetClosestPoint ( const double _arg [ 3 ] ) { this -> SetClosestPoint ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetClosestPoint ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ClosestPoint  pointer  << this -> ClosestPoint ) ; return this -> ClosestPoint ; } VTK_WRAPEXCLUDE virtual void GetClosestPoint ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> ClosestPoint [ 0 ] ; _arg2 = this -> ClosestPoint [ 1 ] ; _arg3 = this -> ClosestPoint [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ClosestPoint  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetClosestPoint ( double _arg [ 3 ] ) { this -> GetClosestPoint ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  Control how inside/outside of loop is defined.
##  virtual void SetEdgeSearchModeSelectionMode ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << SelectionMode  to  << _arg ) ; if ( this -> SelectionMode != ( _arg < VTK_INSIDE_SMALLEST_REGION ? VTK_INSIDE_SMALLEST_REGION : ( _arg > VTK_INSIDE_CLOSEST_POINT_REGION ? VTK_INSIDE_CLOSEST_POINT_REGION : _arg ) ) ) { this -> SelectionMode = ( _arg < VTK_INSIDE_SMALLEST_REGION ? VTK_INSIDE_SMALLEST_REGION : ( _arg > VTK_INSIDE_CLOSEST_POINT_REGION ? VTK_INSIDE_CLOSEST_POINT_REGION : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetEdgeSearchModeMinValueSelectionModeMinValue ( ) { return VTK_INSIDE_SMALLEST_REGION ; } virtual int GetEdgeSearchModeMaxValueSelectionModeMaxValue ( ) { return VTK_INSIDE_CLOSEST_POINT_REGION ; } ; virtual int GetGenerateSelectionScalarsInsideOutEdgeSearchModeSelectionMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SelectionMode  of  << this -> SelectionMode ) ; return this -> SelectionMode ; } ; void SetSelectionModeToSmallestRegion ( ) { this -> SetSelectionMode ( VTK_INSIDE_SMALLEST_REGION ) ; } void SetSelectionModeToLargestRegion ( ) { this -> SetSelectionMode ( VTK_INSIDE_LARGEST_REGION ) ; } void SetSelectionModeToClosestPointRegion ( ) { this -> SetSelectionMode ( VTK_INSIDE_CLOSEST_POINT_REGION ) ; } const char * GetSelectionModeAsString ( ) ; /@} /@{ *
##  Control whether a second output is generated. The second output
##  contains the polygonal data that's not been selected.
##  virtual void SetGenerateSelectionScalarsInsideOutGenerateUnselectedOutput ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateUnselectedOutput  to  << _arg ) ; if ( this -> GenerateUnselectedOutput != _arg ) { this -> GenerateUnselectedOutput = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetGenerateSelectionScalarsInsideOutEdgeSearchModeSelectionModeGenerateUnselectedOutput ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateUnselectedOutput  of  << this -> GenerateUnselectedOutput ) ; return this -> GenerateUnselectedOutput ; } ; virtual void GenerateUnselectedOutputOn ( ) { this -> SetGenerateSelectionScalarsInsideOutGenerateUnselectedOutput ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GenerateUnselectedOutputOff ( ) { this -> SetGenerateSelectionScalarsInsideOutGenerateUnselectedOutput ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} *
##  Return output that hasn't been selected (if GenreateUnselectedOutput is
##  enabled).
##  vtkPolyData * GetUnselectedOutput ( ) ; *
##  Return output port that hasn't been selected (if GenreateUnselectedOutput is
##  enabled).
##  vtkAlgorithmOutput * GetUnselectedOutputPort ( ) ; *
##  Return the (mesh) edges of the selection region.
##  vtkPolyData * GetSelectionEdges ( ) ;  Overload GetMTime() because we depend on Loop vtkMTimeType GetMTime ( ) override ; protected : vtkSelectPolyData ( ) ; ~ vtkSelectPolyData ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ;  Compute point list that forms a continuous loop overy the mesh, void GreedyEdgeSearch ( vtkPolyData * mesh , vtkIdList * edgeIds ) ; void DijkstraEdgeSearch ( vtkPolyData * mesh , vtkIdList * edgeIds ) ;  Returns maximum front cell ID vtkIdType ComputeTopologicalDistance ( vtkPolyData * mesh , vtkIdList * edgeIds , vtkIntArray * pointMarks , vtkIntArray * cellMarks ) ;  Get closest cell to a position that is not at the boundary vtkIdType GetClosestCellId ( vtkPolyData * mesh , vtkIntArray * pointMarks ) ;  Starting from maxFrontCell, without crossing the boundary, set all cell and point marks to -1. void FillMarksInRegion ( vtkPolyData * mesh , vtkIdList * edgePointIds , vtkIntArray * pointMarks , vtkIntArray * cellMarks , vtkIdType cellIdInSelectedRegion ) ; void SetClippedResultToOutput ( vtkPointData * originalPointData , vtkPolyData * mesh , vtkIntArray * cellMarks , vtkPolyData * output ) ; void SetSelectionScalarsToOutput ( vtkPointData * originalPointData , vtkCellData * originalCellData , vtkPolyData * mesh , vtkIdList * edgeIds , vtkIntArray * pointMarks , vtkPolyData * output ) ; vtkTypeBool GenerateSelectionScalars ; vtkTypeBool InsideOut ; int EdgeSearchMode ; vtkPoints * Loop ; int SelectionMode ; double ClosestPoint [ 3 ] ; vtkTypeBool GenerateUnselectedOutput ; private : static void GetPointNeighbors ( vtkPolyData * mesh , vtkIdType ptId , vtkIdList * nei ) ;  Helper function to check if the edge between pointId1 and pointId2 is present in the
##  edgePointIds (as direct neighbors). static bool IsBoundaryEdge ( vtkIdType pointId1 , vtkIdType pointId2 , vtkIdList * edgePointIds ) ; private : vtkSelectPolyData ( const vtkSelectPolyData & ) = delete ; void operator = ( const vtkSelectPolyData & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## *
##  Return the method of determining in/out of loop as a string.
##

proc GetSelectionModeAsString*(): cstring {.
    importcpp: "VTKFILTERSMODELING_EXPORT::GetSelectionModeAsString(@)",
    header: "vtkSelectPolyData.h".}
## *
##  Return the edge search mode as a string.
##

proc GetEdgeSearchModeAsString*(): cstring {.
    importcpp: "VTKFILTERSMODELING_EXPORT::GetEdgeSearchModeAsString(@)",
    header: "vtkSelectPolyData.h".}