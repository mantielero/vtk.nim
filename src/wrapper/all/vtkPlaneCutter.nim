## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPlaneCutter.h
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
##  @class   vtkPlaneCutter
##  @brief   cut any dataset with a plane and generate a
##  polygonal cut surface
##
##  vtkPlaneCutter is a specialization of the vtkCutter algorithm to cut a
##  dataset grid with a single plane. It is designed for performance and an
##  exploratory, fast workflow. It produces output polygons that result from
##  cutting the input dataset with the specified plane.
##
##  This algorithm is fast because it is threaded, it may delegate to a
##  high-performance cutting algorithm, and/or it may build (in a
##  preprocessing step) a spatial search structure that accelerates the plane
##  cuts. The search structure, which is typically a sphere tree, is used to
##  quickly cull candidate cells.  As mentioned, certain types of input data
##  are delegated to other, internal classes--for example image data is
##  delegated to vtkFlyingEdgesPlaneCutter, and convex vtkPolyData is
##  delegated to vtkPolyDataPlaneCutter.
##
##  Because this filter may build an initial data structure during a
##  preprocessing step, the first execution of the filter may take longer than
##  subsequent operations. Typically the first execution is still faster than
##  vtkCutter (especially with threading enabled), but for certain types of
##  data this may not be true. However if you are using the filter to cut a
##  dataset multiple times (as in an exploratory or interactive workflow) this
##  filter typically works well.
##
##  @warning
##  This filter chooses the output type based on the input type.
##  1) if input is vtkDataSet, output is vtkPolyData.
##  2) if input is vtkPartitionedDataSet, output is vtkPartitionedDataSet.
##  3) if input is vtkPartitionedDataSetCollection, output is vtkPartitionedDataSetCollection.
##  4) if input is vtkUniformGridAMR, output is vtkPartitionedDataSetCollection.
##  5) if input is vtkMultiBlockDataSet, output is vtkMultiBlockDataSet.
##
##  @warning
##  This filter produces may produce non-merged, potentially coincident points
##  for all input dataset types except 1) vtkImageData (which uses
##  vtkFlyingEdgesPlaneCutter under the hood - which does merge points); and
##  2) vtkPolyData if all input cells are convex polygons.
##
##  @warning
##  This filter delegates to vtkFlyingEdgesPlaneCutter to process image
##  data, but output and input have been standardized when possible.
##
##  @warning
##  This filter delegates to vtkPolyDataPlaneCutter to process input
##  vtkPolyData if all the input cells are convex polygons.
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @sa
##  vtkFlyingEdgesPlaneCutter vtk3DLinearGridPlaneCutter vtkCutter vtkPlane
##  vtkPolyDataPlaneCutter
##

## !!!Ignored construct:  # vtkPlaneCutter_h [NewLine] # vtkPlaneCutter_h [NewLine] # vtkDataObjectAlgorithm.h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkSmartPointer.h  For SmartPointer # < map >  For std::map [NewLine] class vtkCellArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkCellData"
discard "forward decl of vtkImageData"
discard "forward decl of vtkMultiBlockDataSet"
discard "forward decl of vtkMultiPieceDataSet"
discard "forward decl of vtkPartitionedDataSet"
discard "forward decl of vtkPartitionedDataSetCollection"
discard "forward decl of vtkPlane"
discard "forward decl of vtkPointData"
discard "forward decl of vtkPoints"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkSphereTree"
discard "forward decl of vtkStructuredGrid"
discard "forward decl of vtkUniformGridAMR"
discard "forward decl of vtkUnstructuredGrid"
## !!!Ignored construct:  class VTKFILTERSCORE_EXPORT vtkPlaneCutter : public vtkDataObjectAlgorithm { public : /@{ *
##  Standard construction and print methods.
##  static vtkPlaneCutter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataObjectAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataObjectAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPlaneCutter :: IsTypeOf ( type ) ; } static vtkPlaneCutter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPlaneCutter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPlaneCutter * NewInstance ( ) const { return vtkPlaneCutter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObjectAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPlaneCutter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPlaneCutter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  The modified time depends on the delegated cut plane.
##  vtkMTimeType GetMTime ( ) override ; /@{ *
##  Specify the plane (an implicit function) to perform the cutting. The
##  definition of the plane (its origin and normal) is controlled via this
##  instance of vtkPlane.
##  virtual void SetPlane ( vtkPlane * ) ; virtual vtkPlane * GetnamePlane ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Plane  address  << static_cast < vtkPlane * > ( this -> Plane ) ) ; return this -> Plane ; } ; /@} /@{ *
##  Set/Get the computation of normals. The normal generated is simply the
##  cut plane normal. The normal, if generated, is defined by cell data
##  associated with the output polygons. By default computing of normals is
##  disabled.
##  virtual void SetComputeNormals ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeNormals  to  << _arg ) ; if ( this -> ComputeNormals != _arg ) { this -> ComputeNormals = _arg ; this -> Modified ( ) ; } } ; virtual bool GetComputeNormals ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeNormals  of  << this -> ComputeNormals ) ; return this -> ComputeNormals ; } ; virtual void ComputeNormalsOn ( ) { this -> SetComputeNormals ( static_cast < bool > ( 1 ) ) ; } virtual void ComputeNormalsOff ( ) { this -> SetComputeNormals ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Indicate whether to interpolate attribute data. By default this is
##  enabled. Note that both cell data and point data is interpolated and
##  output, except for image data input where only point data are output.
##  virtual void SetComputeNormalsInterpolateAttributes ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  InterpolateAttributes  to  << _arg ) ; if ( this -> InterpolateAttributes != _arg ) { this -> InterpolateAttributes = _arg ; this -> Modified ( ) ; } } ; virtual bool GetComputeNormalsInterpolateAttributes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InterpolateAttributes  of  << this -> InterpolateAttributes ) ; return this -> InterpolateAttributes ; } ; virtual void InterpolateAttributesOn ( ) { this -> SetComputeNormalsInterpolateAttributes ( static_cast < bool > ( 1 ) ) ; } virtual void InterpolateAttributesOff ( ) { this -> SetComputeNormalsInterpolateAttributes ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Indicate whether to generate polygons instead of triangles when cutting
##  structured and rectilinear grid.
##  No effect with other kinds of inputs, enabled by default.
##  virtual void SetComputeNormalsInterpolateAttributesGeneratePolygons ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GeneratePolygons  to  << _arg ) ; if ( this -> GeneratePolygons != _arg ) { this -> GeneratePolygons = _arg ; this -> Modified ( ) ; } } ; virtual bool GetComputeNormalsInterpolateAttributesGeneratePolygons ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GeneratePolygons  of  << this -> GeneratePolygons ) ; return this -> GeneratePolygons ; } ; virtual void GeneratePolygonsOn ( ) { this -> SetComputeNormalsInterpolateAttributesGeneratePolygons ( static_cast < bool > ( 1 ) ) ; } virtual void GeneratePolygonsOff ( ) { this -> SetComputeNormalsInterpolateAttributesGeneratePolygons ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Indicate whether to build the sphere tree. Computing the sphere
##  will take some time on the first computation
##  but if the input does not change, the computation of all further
##  slice will be much faster. Default is on.
##  virtual void SetComputeNormalsInterpolateAttributesGeneratePolygonsBuildTree ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  BuildTree  to  << _arg ) ; if ( this -> BuildTree != _arg ) { this -> BuildTree = _arg ; this -> Modified ( ) ; } } ; virtual bool GetComputeNormalsInterpolateAttributesGeneratePolygonsBuildTree ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BuildTree  of  << this -> BuildTree ) ; return this -> BuildTree ; } ; virtual void BuildTreeOn ( ) { this -> SetComputeNormalsInterpolateAttributesGeneratePolygonsBuildTree ( static_cast < bool > ( 1 ) ) ; } virtual void BuildTreeOff ( ) { this -> SetComputeNormalsInterpolateAttributesGeneratePolygonsBuildTree ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Indicate whether to build tree hierarchy. Computing the tree
##  hierarchy can take some time on the first computation but if
##  the input does not change, the computation of all further
##  slice will be faster. Default is on.
##  virtual void SetComputeNormalsInterpolateAttributesGeneratePolygonsBuildTreeBuildHierarchy ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  BuildHierarchy  to  << _arg ) ; if ( this -> BuildHierarchy != _arg ) { this -> BuildHierarchy = _arg ; this -> Modified ( ) ; } } ; virtual bool GetComputeNormalsInterpolateAttributesGeneratePolygonsBuildTreeBuildHierarchy ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BuildHierarchy  of  << this -> BuildHierarchy ) ; return this -> BuildHierarchy ; } ; virtual void BuildHierarchyOn ( ) { this -> SetComputeNormalsInterpolateAttributesGeneratePolygonsBuildTreeBuildHierarchy ( static_cast < bool > ( 1 ) ) ; } virtual void BuildHierarchyOff ( ) { this -> SetComputeNormalsInterpolateAttributesGeneratePolygonsBuildTreeBuildHierarchy ( static_cast < bool > ( 0 ) ) ; } ; /@} protected : vtkPlaneCutter ( ) ; ~ vtkPlaneCutter ( ) override ; vtkPlane * Plane ; bool ComputeNormals ; bool InterpolateAttributes ; bool GeneratePolygons ; bool BuildTree ; bool BuildHierarchy ;  Helpers
##  Support delegation to vtkPolyDataPlaneCutter. Checking convexity can be
##  time consuming. bool DataChanged ; bool IsPolyDataConvex ; vtkSphereTree * GetSphereTree ( vtkDataSet * ) ; std :: map < vtkDataSet * , vtkSmartPointer < vtkSphereTree >> SphereTrees ; struct vtkInputInfo { vtkDataObject * Input ; vtkMTimeType LastMTime ; vtkInputInfo ( ) : Input ( nullptr ) , LastMTime ( 0 ) { } vtkInputInfo ( vtkDataObject * input , vtkMTimeType mtime ) : Input ( input ) , LastMTime ( mtime ) { } } ; vtkInputInfo InputInfo ;  Pipeline-related methods int RequestDataObject ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int FillOutputPortInformation ( int port , vtkInformation * info ) override ; int ExecuteMultiBlockDataSet ( vtkMultiBlockDataSet * input , vtkMultiBlockDataSet * output ) ; int ExecuteUniformGridAMR ( vtkUniformGridAMR * input , vtkPartitionedDataSetCollection * output ) ; int ExecutePartitionedDataCollection ( vtkPartitionedDataSetCollection * input , vtkPartitionedDataSetCollection * output ) ; int ExecutePartitionedData ( vtkPartitionedDataSet * input , vtkPartitionedDataSet * output , bool copyStructure ) ; int ExecuteDataSet ( vtkDataSet * input , vtkSphereTree * tree , vtkPolyData * output ) ; static void AddNormalArray ( double * planeNormal , vtkPolyData * polyData ) ; private : vtkPlaneCutter ( const vtkPlaneCutter & ) = delete ; void operator = ( const vtkPlaneCutter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
