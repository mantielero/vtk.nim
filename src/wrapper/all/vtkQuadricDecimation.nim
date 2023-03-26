## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkQuadricDecimation.h
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
##  @class   vtkQuadricDecimation
##  @brief   reduce the number of triangles in a mesh
##
##  vtkQuadricDecimation is a filter to reduce the number of triangles in
##  a triangle mesh, forming a good approximation to the original geometry.
##  The input to vtkQuadricDecimation is a vtkPolyData object, and only
##  triangles are treated. If you desire to decimate polygonal meshes, first
##  triangulate the polygons with vtkTriangleFilter.
##
##  The algorithm is based on repeated edge collapses until the requested mesh
##  reduction is achieved. Edges are placed in a priority queue based on the
##  "cost" to delete the edge. The cost is an approximate measure of error
##  (distance to the original surface)--described by the so-called quadric
##  error measure. The quadric error measure is associated with each vertex of
##  the mesh and represents a matrix of planes incident on that vertex. The
##  distance of the planes to the vertex is the error in the position of the
##  vertex (originally the vertex error iz zero). As edges are deleted, the
##  quadric error measure associated with the two end points of the edge are
##  summed (this combines the plane equations) and an optimal collapse point
##  can be computed. Edges connected to the collapse point are then reinserted
##  into the queue after computing the new cost to delete them. The process
##  continues until the desired reduction level is reached or topological
##  constraints prevent further reduction. Note that this basic algorithm can
##  be extended to higher dimensions by
##  taking into account variation in attributes (i.e., scalars, vectors, and
##  so on).
##
##  This paper is based on the work of Garland and Heckbert who first
##  presented the quadric error measure at Siggraph '97 "Surface
##  Simplification Using Quadric Error Metrics". For details of the algorithm
##  Michael Garland's Ph.D. thesis is also recommended. Hughues Hoppe's Vis
##  '99 paper, "New Quadric Metric for Simplifying Meshes with Appearance
##  Attributes" is also a good take on the subject especially as it pertains
##  to the error metric applied to attributes.
##
##  @par Thanks:
##  Thanks to Bradley Lowekamp of the National Library of Medicine/NIH for
##  contributing this class.
##

## !!!Ignored construct:  # vtkQuadricDecimation_h [NewLine] # vtkQuadricDecimation_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class vtkEdgeTable ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkIdList"
discard "forward decl of vtkPointData"
discard "forward decl of vtkPriorityQueue"
discard "forward decl of vtkDoubleArray"
## !!!Ignored construct:  class VTKFILTERSCORE_EXPORT vtkQuadricDecimation : public vtkPolyDataAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkQuadricDecimation :: IsTypeOf ( type ) ; } static vtkQuadricDecimation * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkQuadricDecimation * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkQuadricDecimation * NewInstance ( ) const { return vtkQuadricDecimation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkQuadricDecimation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkQuadricDecimation :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkQuadricDecimation * New ( ) ; /@{ *
##  Set/Get the desired reduction (expressed as a fraction of the original
##  number of triangles). The actual reduction may be less depending on
##  triangulation and topological constraints.
##  virtual void SetTargetReduction ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << TargetReduction  to  << _arg ) ; if ( this -> TargetReduction != ( _arg < 0.0 ? 0.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ) { this -> TargetReduction = ( _arg < 0.0 ? 0.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetTargetReductionMinValue ( ) { return 0.0 ; } virtual double GetTargetReductionMaxValue ( ) { return 1.0 ; } ; virtual double GetTargetReduction ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TargetReduction  of  << this -> TargetReduction ) ; return this -> TargetReduction ; } ; /@} /@{ *
##  Decide whether to include data attributes in the error metric. If off,
##  then only geometric error is used to control the decimation. By default
##  the attribute errors are off.
##  virtual void SetAttributeErrorMetric ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AttributeErrorMetric  to  << _arg ) ; if ( this -> AttributeErrorMetric != _arg ) { this -> AttributeErrorMetric = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetTargetReductionAttributeErrorMetric ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AttributeErrorMetric  of  << this -> AttributeErrorMetric ) ; return this -> AttributeErrorMetric ; } ; virtual void AttributeErrorMetricOn ( ) { this -> SetAttributeErrorMetric ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void AttributeErrorMetricOff ( ) { this -> SetAttributeErrorMetric ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Decide whether to activate volume preservation which greatly reduces errors
##  in triangle normal direction. If off, volume preservation is disabled and
##  if AttributeErrorMetric is active, these errors can be large.
##  By default VolumePreservation is off
##  the attribute errors are off.
##  virtual void SetAttributeErrorMetricVolumePreservation ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  VolumePreservation  to  << _arg ) ; if ( this -> VolumePreservation != _arg ) { this -> VolumePreservation = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetTargetReductionAttributeErrorMetricVolumePreservation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VolumePreservation  of  << this -> VolumePreservation ) ; return this -> VolumePreservation ; } ; virtual void VolumePreservationOn ( ) { this -> SetAttributeErrorMetricVolumePreservation ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void VolumePreservationOff ( ) { this -> SetAttributeErrorMetricVolumePreservation ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  If attribute errors are to be included in the metric (i.e.,
##  AttributeErrorMetric is on), then the following flags control which
##  attributes are to be included in the error calculation. By default all
##  of these are on.
##  virtual void SetAttributeErrorMetricVolumePreservationScalarsAttribute ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ScalarsAttribute  to  << _arg ) ; if ( this -> ScalarsAttribute != _arg ) { this -> ScalarsAttribute = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetTargetReductionAttributeErrorMetricVolumePreservationScalarsAttribute ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarsAttribute  of  << this -> ScalarsAttribute ) ; return this -> ScalarsAttribute ; } ; virtual void ScalarsAttributeOn ( ) { this -> SetAttributeErrorMetricVolumePreservationScalarsAttribute ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ScalarsAttributeOff ( ) { this -> SetAttributeErrorMetricVolumePreservationScalarsAttribute ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual void SetAttributeErrorMetricVolumePreservationScalarsAttributeVectorsAttribute ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  VectorsAttribute  to  << _arg ) ; if ( this -> VectorsAttribute != _arg ) { this -> VectorsAttribute = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetTargetReductionAttributeErrorMetricVolumePreservationScalarsAttributeVectorsAttribute ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VectorsAttribute  of  << this -> VectorsAttribute ) ; return this -> VectorsAttribute ; } ; virtual void VectorsAttributeOn ( ) { this -> SetAttributeErrorMetricVolumePreservationScalarsAttributeVectorsAttribute ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void VectorsAttributeOff ( ) { this -> SetAttributeErrorMetricVolumePreservationScalarsAttributeVectorsAttribute ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual void SetAttributeErrorMetricVolumePreservationScalarsAttributeVectorsAttributeNormalsAttribute ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NormalsAttribute  to  << _arg ) ; if ( this -> NormalsAttribute != _arg ) { this -> NormalsAttribute = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetTargetReductionAttributeErrorMetricVolumePreservationScalarsAttributeVectorsAttributeNormalsAttribute ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NormalsAttribute  of  << this -> NormalsAttribute ) ; return this -> NormalsAttribute ; } ; virtual void NormalsAttributeOn ( ) { this -> SetAttributeErrorMetricVolumePreservationScalarsAttributeVectorsAttributeNormalsAttribute ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void NormalsAttributeOff ( ) { this -> SetAttributeErrorMetricVolumePreservationScalarsAttributeVectorsAttributeNormalsAttribute ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual void SetAttributeErrorMetricVolumePreservationScalarsAttributeVectorsAttributeNormalsAttributeTCoordsAttribute ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  TCoordsAttribute  to  << _arg ) ; if ( this -> TCoordsAttribute != _arg ) { this -> TCoordsAttribute = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetTargetReductionAttributeErrorMetricVolumePreservationScalarsAttributeVectorsAttributeNormalsAttributeTCoordsAttribute ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TCoordsAttribute  of  << this -> TCoordsAttribute ) ; return this -> TCoordsAttribute ; } ; virtual void TCoordsAttributeOn ( ) { this -> SetAttributeErrorMetricVolumePreservationScalarsAttributeVectorsAttributeNormalsAttributeTCoordsAttribute ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void TCoordsAttributeOff ( ) { this -> SetAttributeErrorMetricVolumePreservationScalarsAttributeVectorsAttributeNormalsAttributeTCoordsAttribute ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual void SetAttributeErrorMetricVolumePreservationScalarsAttributeVectorsAttributeNormalsAttributeTCoordsAttributeTensorsAttribute ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  TensorsAttribute  to  << _arg ) ; if ( this -> TensorsAttribute != _arg ) { this -> TensorsAttribute = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetTargetReductionAttributeErrorMetricVolumePreservationScalarsAttributeVectorsAttributeNormalsAttributeTCoordsAttributeTensorsAttribute ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TensorsAttribute  of  << this -> TensorsAttribute ) ; return this -> TensorsAttribute ; } ; virtual void TensorsAttributeOn ( ) { this -> SetAttributeErrorMetricVolumePreservationScalarsAttributeVectorsAttributeNormalsAttributeTCoordsAttributeTensorsAttribute ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void TensorsAttributeOff ( ) { this -> SetAttributeErrorMetricVolumePreservationScalarsAttributeVectorsAttributeNormalsAttributeTCoordsAttributeTensorsAttribute ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the scaling weight contribution of the attribute. These
##  values are used to weight the contribution of the attributes
##  towards the error metric.
##  virtual void SetAttributeErrorMetricVolumePreservationScalarsAttributeVectorsAttributeNormalsAttributeTCoordsAttributeTensorsAttributeScalarsWeight ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ScalarsWeight  to  << _arg ) ; if ( this -> ScalarsWeight != _arg ) { this -> ScalarsWeight = _arg ; this -> Modified ( ) ; } } ; virtual void SetAttributeErrorMetricVolumePreservationScalarsAttributeVectorsAttributeNormalsAttributeTCoordsAttributeTensorsAttributeScalarsWeightVectorsWeight ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  VectorsWeight  to  << _arg ) ; if ( this -> VectorsWeight != _arg ) { this -> VectorsWeight = _arg ; this -> Modified ( ) ; } } ; virtual void SetAttributeErrorMetricVolumePreservationScalarsAttributeVectorsAttributeNormalsAttributeTCoordsAttributeTensorsAttributeScalarsWeightVectorsWeightNormalsWeight ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NormalsWeight  to  << _arg ) ; if ( this -> NormalsWeight != _arg ) { this -> NormalsWeight = _arg ; this -> Modified ( ) ; } } ; virtual void SetAttributeErrorMetricVolumePreservationScalarsAttributeVectorsAttributeNormalsAttributeTCoordsAttributeTensorsAttributeScalarsWeightVectorsWeightNormalsWeightTCoordsWeight ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  TCoordsWeight  to  << _arg ) ; if ( this -> TCoordsWeight != _arg ) { this -> TCoordsWeight = _arg ; this -> Modified ( ) ; } } ; virtual void SetAttributeErrorMetricVolumePreservationScalarsAttributeVectorsAttributeNormalsAttributeTCoordsAttributeTensorsAttributeScalarsWeightVectorsWeightNormalsWeightTCoordsWeightTensorsWeight ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  TensorsWeight  to  << _arg ) ; if ( this -> TensorsWeight != _arg ) { this -> TensorsWeight = _arg ; this -> Modified ( ) ; } } ; virtual double GetTargetReductionAttributeErrorMetricVolumePreservationScalarsAttributeVectorsAttributeNormalsAttributeTCoordsAttributeTensorsAttributeScalarsWeight ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarsWeight  of  << this -> ScalarsWeight ) ; return this -> ScalarsWeight ; } ; virtual double GetTargetReductionAttributeErrorMetricVolumePreservationScalarsAttributeVectorsAttributeNormalsAttributeTCoordsAttributeTensorsAttributeScalarsWeightVectorsWeight ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VectorsWeight  of  << this -> VectorsWeight ) ; return this -> VectorsWeight ; } ; virtual double GetTargetReductionAttributeErrorMetricVolumePreservationScalarsAttributeVectorsAttributeNormalsAttributeTCoordsAttributeTensorsAttributeScalarsWeightVectorsWeightNormalsWeight ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NormalsWeight  of  << this -> NormalsWeight ) ; return this -> NormalsWeight ; } ; virtual double GetTargetReductionAttributeErrorMetricVolumePreservationScalarsAttributeVectorsAttributeNormalsAttributeTCoordsAttributeTensorsAttributeScalarsWeightVectorsWeightNormalsWeightTCoordsWeight ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TCoordsWeight  of  << this -> TCoordsWeight ) ; return this -> TCoordsWeight ; } ; virtual double GetTargetReductionAttributeErrorMetricVolumePreservationScalarsAttributeVectorsAttributeNormalsAttributeTCoordsAttributeTensorsAttributeScalarsWeightVectorsWeightNormalsWeightTCoordsWeightTensorsWeight ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TensorsWeight  of  << this -> TensorsWeight ) ; return this -> TensorsWeight ; } ; /@} /@{ *
##  Get the actual reduction. This value is only valid after the
##  filter has executed.
##  virtual double GetTargetReductionAttributeErrorMetricVolumePreservationScalarsAttributeVectorsAttributeNormalsAttributeTCoordsAttributeTensorsAttributeScalarsWeightVectorsWeightNormalsWeightTCoordsWeightTensorsWeightActualReduction ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ActualReduction  of  << this -> ActualReduction ) ; return this -> ActualReduction ; } ; /@} protected : vtkQuadricDecimation ( ) ; ~ vtkQuadricDecimation ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; *
##  Do the dirty work of eliminating the edge; return the number of
##  triangles deleted.
##  int CollapseEdge ( vtkIdType pt0Id , vtkIdType pt1Id ) ; *
##  Compute quadric for all vertices
##  void InitializeQuadrics ( vtkIdType numPts ) ; *
##  Free boundary edges are weighted
##  void AddBoundaryConstraints ( void ) ; *
##  Compute quadric for this vertex.
##  void ComputeQuadric ( vtkIdType pointId ) ; *
##  Add the quadrics for these 2 points since the edge between them has
##  been collapsed.
##  void AddQuadric ( vtkIdType oldPtId , vtkIdType newPtId ) ; /@{ *
##  Compute cost for contracting this edge and the point that gives us this
##  cost.
##  double ComputeCost ( vtkIdType edgeId , double * x ) ; double ComputeCost2 ( vtkIdType edgeId , double * x ) ; /@} *
##  Find all edges that will have an endpoint change ids because of an edge
##  collapse.  p1Id and p2Id are the endpoints of the edge.  p2Id is the
##  pointId being removed.
##  void FindAffectedEdges ( vtkIdType p1Id , vtkIdType p2Id , vtkIdList * edges ) ; *
##  Find a cell that uses this edge.
##  vtkIdType GetEdgeCellId ( vtkIdType p1Id , vtkIdType p2Id ) ; int IsGoodPlacement ( vtkIdType pt0Id , vtkIdType pt1Id , const double * x ) ; int TrianglePlaneCheck ( const double t0 [ 3 ] , const double t1 [ 3 ] , const double t2 [ 3 ] , const double * x ) ; void ComputeNumberOfComponents ( void ) ; void UpdateEdgeData ( vtkIdType pt0Id , vtkIdType pt1Id ) ; /@{ *
##  Helper function to set and get the point and it's attributes as an array
##  void SetPointAttributeArray ( vtkIdType ptId , const double * x ) ; void GetPointAttributeArray ( vtkIdType ptId , double * x ) ; /@} *
##  Find out how many components there are for each attribute for this
##  poly data.
##  void GetAttributeComponents ( ) ; double TargetReduction ; double ActualReduction ; vtkTypeBool AttributeErrorMetric ; vtkTypeBool VolumePreservation ; vtkTypeBool ScalarsAttribute ; vtkTypeBool VectorsAttribute ; vtkTypeBool NormalsAttribute ; vtkTypeBool TCoordsAttribute ; vtkTypeBool TensorsAttribute ; double ScalarsWeight ; double VectorsWeight ; double NormalsWeight ; double TCoordsWeight ; double TensorsWeight ; int NumberOfEdgeCollapses ; vtkEdgeTable * Edges ; vtkIdList * EndPoint1List ; vtkIdList * EndPoint2List ; vtkPriorityQueue * EdgeCosts ; vtkDoubleArray * TargetPoints ; int NumberOfComponents ; vtkPolyData * Mesh ; struct ErrorQuadric { double * Quadric ; } ;  One ErrorQuadric per point ErrorQuadric * ErrorQuadrics ;  Contains 4 doubles per point. Length = nPoints * 4 double * VolumeConstraints ; int AttributeComponents [ 6 ] ; double AttributeScale [ 6 ] ;  Temporary variables for performance vtkIdList * CollapseCellIds ; double * TempX ; double * TempQuad ; double * TempB ; double * * TempA ; double * TempData ; private : vtkQuadricDecimation ( const vtkQuadricDecimation & ) = delete ; void operator = ( const vtkQuadricDecimation & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
