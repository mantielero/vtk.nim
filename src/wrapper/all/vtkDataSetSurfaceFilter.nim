## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDataSetSurfaceFilter.h
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
##  @class   vtkDataSetSurfaceFilter
##  @brief   Extracts outer surface (as vtkPolyData) of any dataset
##
##  vtkDataSetSurfaceFilter is a general-purpose filter to extract boundary
##  geometry (and associated data) from any type of dataset. Geometry is
##  obtained as follows: all 0D, 1D, and 2D cells are extracted. All 2D faces
##  that are used by only one 3D cell (i.e., boundary faces) are
##  extracted. The filter will handle any type of dataset, including
##  unstructured grids with non-linear cells. (See also vtkGeometryFilter for
##  additional documentation and information - vtkGeometryFilter is the
##  preferred filter to use in most cases and may be deprecated in the
##  future.)
##
##  The filter only has only a few options: methods for passing through
##  point and cell ids (to support picking); and controls for nonlinear cell
##  subdivision. At this time vtkDataSetSurfaceFilter has the distinction of
##  being able to process non-linear cells requiring subdivision. For this
##  reason, vtkDataSetSurfaceFilter should be used with non-linear cells;
##  otherwise vtkGeometryFilter should be used. (Note: by default this filter
##  will delegate processing of linear vtkUnstructuredGrids to
##  vtkGeometryFilter as vtkGeometryFilter is so much faster. And
##  vtkGeometryFilter will delegate to vtkDataSetSurfaceFilter when it
##  encounters nonlinear cells.)
##
##  @section FastMode Fast Mode
##
##  vtkDataSetSurfaceFilter is sometimes used to simply render a 3D
##  dataset. In which case we only are concerned about an approximate
##  representation of the data and not necessarily the true exterior surface. In
##  that case, simply set the FastMode flag to true.
##
##  Currently FastMode is used when extracting surface from a structured dataset
##  or when `Delegation` is true. When Delegation is true, the flag is passed on
##  to `vtkGeometryFilter` (see `vtkGeometryFilter:SetFastMode`).
##
##  @warning
##  At one time, vtkDataSetSurfaceFilter was a faster version of
##  vtkGeometryFilter when processing unstructured grids, however
##  vtkGeometryFilter is now faster. Also, vtkDataSetSurfaceFilter typically
##  uses more memory than vtkGeometryFilter.  Consequently as a convenience to
##  the user, vtkDataSetSurfaceFilter will delegate to vtkGeometryFilter when
##  processing linear vtkUnstructuredGrids. This typically produces a 5-10x
##  speed up. (See vtkGeometryFilter for more information.) This delegation can
##  be disabled by setting the Delegation data member.
##
##  @warning
##  vtkDataSetSurfaceFilter will generally not preserve topological
##  connectivity.  In other words, the output polygonal primitives may not be
##  connected although in the originating dataset the boundary entities (e.g.,
##  faces) may have been connected. This can result in issues for filters that
##  expect proper topological connectivity (e.g., vtkQuadricDecimation or
##  vtkFeatureEdges).
##
##  @warning
##  A key step in this algorithm (for 3D cells) is to count the number times a
##  face is used by a cell. If used only once, then the face is considered a
##  boundary face and sent to the filter output. The filter determines this by
##  creating a hash table of faces: faces that are placed into the hash table
##  a single time are used only once, and therefore sent to the output. Thus
##  large amounts of extra memory is necessary to build the hash table. This
##  obsoleted approach requires a significant amount of memory, and is a
##  significant bottleneck to threading.
##
##  @warning
##  This filter may create duplicate points. Unlike vtkGeometryFilter, it does
##  not have the option to merge points. However it will eliminate points
##  not used by any output polygonal primitive (i.e., not on the boundary).
##
##  @sa
##  vtkGeometryFilter vtkStructuredGridGeometryFilter
##

## !!!Ignored construct:  # vtkDataSetSurfaceFilter_h [NewLine] # vtkDataSetSurfaceFilter_h [NewLine] # vtkFiltersGeometryModule.h  For export macro # vtkGeometryFilter.h  To facilitate delegation # vtkPolyDataAlgorithm.h [NewLine] template < typename ArrayType > [end of template] class vtkSmartPointer ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkCellIterator"
discard "forward decl of vtkPointData"
discard "forward decl of vtkPoints"
discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkImageData"
discard "forward decl of vtkRectilinearGrid"
discard "forward decl of vtkStructuredGrid"
discard "forward decl of vtkUnstructuredGridBase"
type
  VTKFILTERSGEOMETRY_EXPORTvtkFastGeomQuadStruct* {.importcpp: "vtkFastGeomQuadStruct::VTKFILTERSGEOMETRY_EXPORT::vtkFastGeomQuadStruct::vtkFastGeomQuadStruct",
      header: "vtkDataSetSurfaceFilter.h", bycopy.} = object
    SourceId* {.importc: "SourceId".}: vtkIdType
    numPts* {.importc: "numPts".}: cint
    ptArray* {.importc: "ptArray".}: ptr vtkIdType


var Next* {.importcpp: "Next", header: "vtkDataSetSurfaceFilter.h".}: ptr VTKFILTERSGEOMETRY_EXPORTvtkFastGeomQuadStructvtkFastGeomQuadStruct

type
  VTKFILTERSGEOMETRY_EXPORTvtkFastGeomQuad* = VTKFILTERSGEOMETRY_EXPORTvtkFastGeomQuadStruct

## !!!Ignored construct:  class VTKFILTERSGEOMETRY_EXPORT vtkDataSetSurfaceFilter : public vtkPolyDataAlgorithm { public : /@{ *
##  Statndard methods for object instantiation, type information, and printing.
##  static vtkDataSetSurfaceFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkDataSetSurfaceFilter :: IsTypeOf ( type ) ; } static vtkDataSetSurfaceFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkDataSetSurfaceFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkDataSetSurfaceFilter * NewInstance ( ) const { return vtkDataSetSurfaceFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDataSetSurfaceFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDataSetSurfaceFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Triangle strip support was dropped in 9.1. Please use vtkStripper to
##  generate triangle strips, if needed.
##  VTK_DEPRECATED_IN_9_1_0 ( no longer supported ) vtkTypeBool GetUseStrips ( ) ; VTK_DEPRECATED_IN_9_1_0 ( no longer supported ) void SetUseStrips ( vtkTypeBool ) ; VTK_DEPRECATED_IN_9_1_0 ( no longer supported ) void UseStripsOn ( ) ; VTK_DEPRECATED_IN_9_1_0 ( no longer supported ) void UseStripsOff ( ) ; /@} /@{ *
##  If PieceInvariant is true, vtkDataSetSurfaceFilter requests
##  1 ghost level from input in order to remove internal surface
##  that are between processes. False by default.
##  virtual void SetPieceInvariant ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PieceInvariant  to  << _arg ) ; if ( this -> PieceInvariant != _arg ) { this -> PieceInvariant = _arg ; this -> Modified ( ) ; } } ; virtual int GetPieceInvariant ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PieceInvariant  of  << this -> PieceInvariant ) ; return this -> PieceInvariant ; } ; /@} /@{ *
##  If on, the output polygonal dataset will have a celldata array that
##  holds the cell index of the original 3D cell that produced each output
##  cell. This is useful for cell picking. The default is off to conserve
##  memory.
##  virtual void SetPieceInvariantPassThroughCellIds ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PassThroughCellIds  to  << _arg ) ; if ( this -> PassThroughCellIds != _arg ) { this -> PassThroughCellIds = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetPieceInvariantPassThroughCellIds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassThroughCellIds  of  << this -> PassThroughCellIds ) ; return this -> PassThroughCellIds ; } ; virtual void PassThroughCellIdsOn ( ) { this -> SetPassThroughCellIds ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void PassThroughCellIdsOff ( ) { this -> SetPassThroughCellIds ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual void SetPieceInvariantPassThroughCellIdsPassThroughPointIds ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PassThroughPointIds  to  << _arg ) ; if ( this -> PassThroughPointIds != _arg ) { this -> PassThroughPointIds = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetPieceInvariantPassThroughCellIdsPassThroughPointIds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassThroughPointIds  of  << this -> PassThroughPointIds ) ; return this -> PassThroughPointIds ; } ; virtual void PassThroughPointIdsOn ( ) { this -> SetPassThroughCellIdsPassThroughPointIds ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void PassThroughPointIdsOff ( ) { this -> SetPassThroughCellIdsPassThroughPointIds ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on/off fast mode execution. If enabled, fast mode typically runs
##  much faster (2-3x) than the standard algorithm, however the output is an
##  approximation to the correct result. Also, note that the FastMode
##  depends on the data member Degree for its execution.
##  virtual void SetPieceInvariantPassThroughCellIdsPassThroughPointIdsFastMode ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  FastMode  to  << _arg ) ; if ( this -> FastMode != _arg ) { this -> FastMode = _arg ; this -> Modified ( ) ; } } ; virtual bool GetPieceInvariantPassThroughCellIdsPassThroughPointIdsFastMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FastMode  of  << this -> FastMode ) ; return this -> FastMode ; } ; virtual void FastModeOn ( ) { this -> SetPassThroughCellIdsPassThroughPointIdsFastMode ( static_cast < bool > ( 1 ) ) ; } virtual void FastModeOff ( ) { this -> SetPassThroughCellIdsPassThroughPointIdsFastMode ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  If PassThroughCellIds or PassThroughPointIds is on, then these ivars
##  control the name given to the field in which the ids are written into.  If
##  set to nullptr, then vtkOriginalCellIds or vtkOriginalPointIds (the default)
##  is used, respectively.
##  virtual void SetOriginalCellIdsName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << OriginalCellIdsName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> OriginalCellIdsName == nullptr && _arg == nullptr ) { return ; } if ( this -> OriginalCellIdsName && _arg && ( ! strcmp ( this -> OriginalCellIdsName , _arg ) ) ) { return ; } delete [ ] this -> OriginalCellIdsName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> OriginalCellIdsName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> OriginalCellIdsName = nullptr ; } this -> Modified ( ) ; } ; virtual const char * GetOriginalCellIdsName ( ) { return ( this -> OriginalCellIdsName ? this -> OriginalCellIdsName : vtkOriginalCellIds ) ; } virtual void SetOriginalCellIdsNameOriginalPointIdsName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << OriginalPointIdsName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> OriginalPointIdsName == nullptr && _arg == nullptr ) { return ; } if ( this -> OriginalPointIdsName && _arg && ( ! strcmp ( this -> OriginalPointIdsName , _arg ) ) ) { return ; } delete [ ] this -> OriginalPointIdsName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> OriginalPointIdsName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> OriginalPointIdsName = nullptr ; } this -> Modified ( ) ; } ; virtual const char * GetOriginalPointIdsName ( ) { return ( this -> OriginalPointIdsName ? this -> OriginalPointIdsName : vtkOriginalPointIds ) ; } /@} /@{ *
##  If the input is an unstructured grid with nonlinear faces, this parameter
##  determines how many times the face is subdivided into linear faces.  If 0,
##  the output is the equivalent of its linear counterpart (and the midpoints
##  determining the nonlinear interpolation are discarded).  If 1 (the
##  default), the nonlinear face is triangulated based on the midpoints.  If
##  greater than 1, the triangulated pieces are recursively subdivided to reach
##  the desired subdivision.  Setting the value to greater than 1 may cause
##  some point data to not be passed even if no nonlinear faces exist.  This
##  option has no effect if the input is not an unstructured grid.
##  virtual void SetPieceInvariantPassThroughCellIdsPassThroughPointIdsFastModeNonlinearSubdivisionLevel ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NonlinearSubdivisionLevel  to  << _arg ) ; if ( this -> NonlinearSubdivisionLevel != _arg ) { this -> NonlinearSubdivisionLevel = _arg ; this -> Modified ( ) ; } } ; virtual int GetPieceInvariantPassThroughCellIdsPassThroughPointIdsFastModeNonlinearSubdivisionLevel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NonlinearSubdivisionLevel  of  << this -> NonlinearSubdivisionLevel ) ; return this -> NonlinearSubdivisionLevel ; } ; /@} /@{ *
##  Disable delegation to an internal vtkGeometryFilter. The geometry filter runs
##  much faster (especially for unstructured grids); however the two filters
##  produce slightly different output. Hence by default delegation is disabled.
##  virtual void SetPieceInvariantPassThroughCellIdsPassThroughPointIdsFastModeNonlinearSubdivisionLevelDelegation ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Delegation  to  << _arg ) ; if ( this -> Delegation != _arg ) { this -> Delegation = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetPieceInvariantPassThroughCellIdsPassThroughPointIdsFastModeNonlinearSubdivisionLevelDelegation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Delegation  of  << this -> Delegation ) ; return this -> Delegation ; } ; virtual void DelegationOn ( ) { this -> SetPassThroughCellIdsPassThroughPointIdsFastModeDelegation ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void DelegationOff ( ) { this -> SetPassThroughCellIdsPassThroughPointIdsFastModeDelegation ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Direct access methods so that this class can be used as an
##  algorithm without using it as a filter (i.e., no pipeline updates).
##  virtual int StructuredExecute ( vtkDataSet * input , vtkPolyData * output , vtkIdType * ext , vtkIdType * wholeExt ) ; # VTK_USE_64BIT_IDS [NewLine] virtual int StructuredExecute ( vtkDataSet * input , vtkPolyData * output , const int * ext32 , const int * wholeExt32 ) { vtkIdType ext [ 6 ] ; vtkIdType wholeExt [ 6 ] ; for ( int cc = 0 ; cc < 6 ; cc ++ ) { ext [ cc ] = ext32 [ cc ] ; wholeExt [ cc ] = wholeExt32 [ cc ] ; } return this -> StructuredExecute ( input , output , ext , wholeExt ) ; } # [NewLine] *
##  Execute the filter on \a input and store the result in \a output.
##  The correct function should be used accordingly to the type of the input.
##
##  Input can be any subclass of \a vtkUnstructuredGridBase.
##  In case of a \a vtkUnstructuredGrid or subclass instance, an optimized version
##  of the filter is executed.
##  virtual int UnstructuredGridExecute ( vtkDataSet * input , vtkPolyData * output ) ; /@{ *
##  Execute the filter on \a input and store the result in \a output.
##  The correct function should be used accordingly to the type of the input.
##  virtual int DataSetExecute ( vtkDataSet * input , vtkPolyData * output ) ; virtual int UniformGridExecute ( vtkDataSet * input , vtkPolyData * output , vtkIdType * ext , vtkIdType * wholeExt , bool extractface [ 6 ] ) ; /@} *
##  Optimized \a UnstructuredGridExecute function for vtkUnstructuredGrid and subclass instances
##  only. This function is used in vtkGeometryFilter.
##  int UnstructuredGridExecute ( vtkDataSet * input , vtkPolyData * output , vtkGeometryFilterHelper * info ) ; # VTK_USE_64BIT_IDS [NewLine] virtual int UniformGridExecute ( vtkDataSet * input , vtkPolyData * output , const int * ext32 , const int * wholeExt32 , bool extractface [ 6 ] ) { vtkIdType ext [ 6 ] ; vtkIdType wholeExt [ 6 ] ; for ( int cc = 0 ; cc < 6 ; cc ++ ) { ext [ cc ] = ext32 [ cc ] ; wholeExt [ cc ] = wholeExt32 [ cc ] ; } return this -> UniformGridExecute ( input , output , ext , wholeExt , extractface ) ; } # [NewLine] /@} protected : vtkDataSetSurfaceFilter ( ) ; ~ vtkDataSetSurfaceFilter ( ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ;  Helper methods. *
##  Estimates the total number of points & cells on the surface to render
##  ext -- the extent of the structured data in question (in)
##  wholeExt -- the global extent of the structured data (in)
##  numPoints -- the estimated number of points (out)
##  numCells -- the estimated number of cells (out)
##  void EstimateStructuredDataArraySizes ( vtkIdType * ext , vtkIdType * wholeExt , vtkIdType & numPoints , vtkIdType & numCells ) ; void ExecuteFaceQuads ( vtkDataSet * input , vtkPolyData * output , int maxFlag , vtkIdType * ext , int aAxis , int bAxis , int cAxis , vtkIdType * wholeExt , bool checkVisibility ) ; void ExecuteFaceQuads ( vtkDataSet * input , vtkPolyData * output , int maxFlag , vtkIdType * ext , int aAxis , int bAxis , int cAxis , vtkIdType * wholeExt ) ; void InitializeQuadHash ( vtkIdType numPoints ) ; void DeleteQuadHash ( ) ; virtual void InsertQuadInHash ( vtkIdType a , vtkIdType b , vtkIdType c , vtkIdType d , vtkIdType sourceId ) ; virtual void InsertTriInHash ( vtkIdType a , vtkIdType b , vtkIdType c , vtkIdType sourceId , vtkIdType faceId = - 1 ) ; virtual void InsertPolygonInHash ( const vtkIdType * ids , int numpts , vtkIdType sourceId ) ; void InitQuadHashTraversal ( ) ; vtkFastGeomQuad * GetNextVisibleQuadFromHash ( ) ; vtkFastGeomQuad * * QuadHash ; vtkIdType QuadHashLength ; vtkFastGeomQuad * QuadHashTraversal ; vtkIdType QuadHashTraversalIndex ; vtkIdType * PointMap ; vtkIdType GetOutputPointId ( vtkIdType inPtId , vtkDataSet * input , vtkPoints * outPts , vtkPointData * outPD ) ; vtkIdType GetOutputPointIdAndInterpolate ( vtkIdType inPtId , vtkDataSet * input , vtkCell * cell , double * weights , vtkPoints * outPts , vtkPointData * outPD ) ; class vtkEdgeInterpolationMap ; vtkEdgeInterpolationMap * EdgeMap ; VTK_DEPRECATED_IN_9_1_0 ( Use GetInterpolatedPointId(vtkIdType edgePtA, vtkIdType edgePtB, vtkDataSet* input, vtkCell*  cell, double pcoords[3], double* weights, vtkPoints* outPts, vtkPointData* outPD) instead ) vtkIdType GetInterpolatedPointId ( vtkIdType edgePtA , vtkIdType edgePtB , vtkDataSet * input , vtkCell * cell , double pcoords [ 3 ] , vtkPoints * outPts , vtkPointData * outPD ) ; vtkIdType GetInterpolatedPointId ( vtkIdType edgePtA , vtkIdType edgePtB , vtkDataSet * input , vtkCell * cell , double pcoords [ 3 ] , double * weights , vtkPoints * outPts , vtkPointData * outPD ) ; vtkIdType GetInterpolatedPointId ( vtkDataSet * input , vtkCell * cell , double pcoords [ 3 ] , double * weights , vtkPoints * outPts , vtkPointData * outPD ) ; vtkIdType NumberOfNewCells ;  Better memory allocation for faces (hash) void InitFastGeomQuadAllocation ( vtkIdType numberOfCells ) ; vtkFastGeomQuad * NewFastGeomQuad ( int numPts ) ; void DeleteAllFastGeomQuads ( ) ;  ----- vtkIdType FastGeomQuadArrayLength ; vtkIdType NumberOfFastGeomQuadArrays ; unsigned char * * FastGeomQuadArrays ;  store this data as an array of bytes  These indexes allow us to find the next available face. vtkIdType NextArrayIndex ; vtkIdType NextQuadIndex ; int PieceInvariant ; vtkTypeBool PassThroughCellIds ; void RecordOrigCellId ( vtkIdType newIndex , vtkIdType origId ) ; virtual void RecordOrigCellId ( vtkIdType newIndex , vtkFastGeomQuad * quad ) ; vtkIdTypeArray * OriginalCellIds ; char * OriginalCellIdsName ; vtkTypeBool PassThroughPointIds ; void RecordOrigPointId ( vtkIdType newIndex , vtkIdType origId ) ; vtkIdTypeArray * OriginalPointIds ; char * OriginalPointIdsName ; int NonlinearSubdivisionLevel ; vtkTypeBool Delegation ; bool FastMode ; private : int UnstructuredGridBaseExecute ( vtkDataSet * input , vtkPolyData * output ) ; int UnstructuredGridExecuteInternal ( vtkUnstructuredGridBase * input , vtkPolyData * output , bool handleSubdivision , vtkSmartPointer < vtkCellIterator > cellIter ) ; int StructuredExecuteNoBlanking ( vtkDataSet * input , vtkPolyData * output , vtkIdType * ext , vtkIdType * wholeExt ) ; vtkDataSetSurfaceFilter ( const vtkDataSetSurfaceFilter & ) = delete ; void operator = ( const vtkDataSetSurfaceFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
