## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtk3DLinearGridPlaneCutter.h
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
##  @class   vtk3DLinearGridPlaneCutter
##  @brief   fast plane cutting of vtkUnstructuredGrid containing 3D linear cells
##
##  vtk3DLinearGridPlaneCutter is a specialized filter that cuts an input
##  vtkUnstructuredGrid consisting of 3D linear cells: tetrahedra, hexahedra,
##  voxels, pyramids, and/or wedges. (The cells are linear in the sense that
##  each cell edge is a straight line.)  The filter is designed for
##  high-speed, specialized operation. All other cell types are skipped and
##  produce no output.
##
##  To use this filter you must specify an input unstructured grid or
##  vtkCompositeDataSet (containing unstructured grids) and a plane to cut with.
##
##  The filter performance varies depending on optional output
##  information. Basically if point merging is required (when PointMerging is
##  set) a sorting process is required to eliminate duplicate output points in
##  the cut surface. Otherwise when point merging is not required, a fast path
##  process produces independent triangles representing the cut surface.
##
##  This algorithm is fast because it is threaded, and may perform operations
##  (in a preprocessing step) to accelerate the plane cutting.
##
##  Because this filter may build an initial data structure during a
##  preprocessing step, the first execution of the filter may take longer than
##  subsequent operations. Typically the first execution is still faster than
##  vtkCutter (especially with threading enabled), but for certain types of
##  data this may not be true. However if you are using the filter to cut a
##  dataset multiple times (as in an exploratory or interactive workflow) this
##  filter works well.
##
##  @warning
##  When the input is of type vtkCompositeDataSet the filter will process the
##  unstructured grid(s) contained in the composite data set. As a result the
##  output of this filter is then a vtkMultiBlockDataSet containing multiple
##  vtkPolyData. When a vtkUnstructuredGrid is provided as input the
##  output is a single vtkPolyData.
##
##  @warning
##  Input cells that are not of 3D linear type (tetrahedron, hexahedron,
##  wedge, pyramid, and voxel) are simply skipped and not processed.
##
##  @warning
##  The filter is templated on types of input and output points, and input
##  scalar type. To reduce object file bloat, only real points (float,double) are
##  processed.
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @sa
##  vtkCutter vtkFlyingEdgesPlaneCutter vtkPlaneCutter vtkPlane vtkSphereTree
##  vtkContour3DLinearGrid
##

## !!!Ignored construct:  # vtk3DLinearGridPlaneCutter_h [NewLine] # vtk3DLinearGridPlaneCutter_h [NewLine] # vtkDataObjectAlgorithm.h [NewLine] # vtkFiltersCoreModule.h  For export macro [NewLine] class vtkPlane ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkUnstructuredGrid"
discard "forward decl of vtkSphereTree"
discard "forward decl of vtkPolyData"
## !!!Ignored construct:  class VTKFILTERSCORE_EXPORT vtk3DLinearGridPlaneCutter : public vtkDataObjectAlgorithm { public : /@{ *
##  Standard methods for construction, type info, and printing.
##  static vtk3DLinearGridPlaneCutter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataObjectAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataObjectAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtk3DLinearGridPlaneCutter :: IsTypeOf ( type ) ; } static vtk3DLinearGridPlaneCutter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtk3DLinearGridPlaneCutter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtk3DLinearGridPlaneCutter * NewInstance ( ) const { return vtk3DLinearGridPlaneCutter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObjectAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtk3DLinearGridPlaneCutter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtk3DLinearGridPlaneCutter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Specify the plane (an implicit function) to perform the cutting. The
##  definition of the plane (its origin and normal) is controlled via this
##  instance of vtkPlane.
##  virtual void SetPlane ( vtkPlane * ) ; virtual vtkPlane * GetnamePlane ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Plane  address  << static_cast < vtkPlane * > ( this -> Plane ) ) ; return this -> Plane ; } ; /@} /@{ *
##  Indicate whether to merge coincident points. Merging can take extra time
##  and produces fewer output points, creating a "watertight" output
##  surface. On the other hand, merging reduced output data size and may be
##  just as fast especially for smaller data. By default this is off.
##  virtual void SetMergePoints ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MergePoints  to  << _arg ) ; if ( this -> MergePoints != _arg ) { this -> MergePoints = _arg ; this -> Modified ( ) ; } } ; virtual bool GetMergePoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MergePoints  of  << this -> MergePoints ) ; return this -> MergePoints ; } ; virtual void MergePointsOn ( ) { this -> SetMergePoints ( static_cast < bool > ( 1 ) ) ; } virtual void MergePointsOff ( ) { this -> SetMergePoints ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Indicate whether to interpolate input attributes onto the cut
##  plane. By default this option is on.
##  virtual void SetMergePointsInterpolateAttributes ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  InterpolateAttributes  to  << _arg ) ; if ( this -> InterpolateAttributes != _arg ) { this -> InterpolateAttributes = _arg ; this -> Modified ( ) ; } } ; virtual bool GetMergePointsInterpolateAttributes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InterpolateAttributes  of  << this -> InterpolateAttributes ) ; return this -> InterpolateAttributes ; } ; virtual void InterpolateAttributesOn ( ) { this -> SetMergePointsInterpolateAttributes ( static_cast < bool > ( 1 ) ) ; } virtual void InterpolateAttributesOff ( ) { this -> SetMergePointsInterpolateAttributes ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the computation of normals. The normal generated is simply the
##  cut plane normal. The normal, if generated, is defined by cell data
##  associated with the output polygons. By default computing of normals is
##  off.
##  virtual void SetMergePointsInterpolateAttributesComputeNormals ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeNormals  to  << _arg ) ; if ( this -> ComputeNormals != _arg ) { this -> ComputeNormals = _arg ; this -> Modified ( ) ; } } ; virtual bool GetMergePointsInterpolateAttributesComputeNormals ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeNormals  of  << this -> ComputeNormals ) ; return this -> ComputeNormals ; } ; virtual void ComputeNormalsOn ( ) { this -> SetMergePointsInterpolateAttributesComputeNormals ( static_cast < bool > ( 1 ) ) ; } virtual void ComputeNormalsOff ( ) { this -> SetMergePointsInterpolateAttributesComputeNormals ( static_cast < bool > ( 0 ) ) ; } ; /@} *
##  Overloaded GetMTime() because of delegation to the helper
##  vtkPlane.
##  vtkMTimeType GetMTime ( ) override ; /@{ *
##  Set/get the desired precision for the output points. See the
##  documentation for the vtkAlgorithm::Precision enum for an explanation of
##  the available precision settings.
##  void SetOutputPointsPrecision ( int precision ) ; int GetOutputPointsPrecision ( ) const ; /@} /@{ *
##  Force sequential processing (i.e. single thread) of the contouring
##  process. By default, sequential processing is off. Note this flag only
##  applies if the class has been compiled with VTK_SMP_IMPLEMENTATION_TYPE
##  set to something other than Sequential. (If set to Sequential, then the
##  filter always runs in serial mode.) This flag is typically used for
##  benchmarking purposes.
##  virtual void SetMergePointsInterpolateAttributesComputeNormalsSequentialProcessing ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SequentialProcessing  to  << _arg ) ; if ( this -> SequentialProcessing != _arg ) { this -> SequentialProcessing = _arg ; this -> Modified ( ) ; } } ; virtual bool GetMergePointsInterpolateAttributesComputeNormalsSequentialProcessing ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SequentialProcessing  of  << this -> SequentialProcessing ) ; return this -> SequentialProcessing ; } ; virtual void SequentialProcessingOn ( ) { this -> SetMergePointsInterpolateAttributesComputeNormalsSequentialProcessing ( static_cast < bool > ( 1 ) ) ; } virtual void SequentialProcessingOff ( ) { this -> SetMergePointsInterpolateAttributesComputeNormalsSequentialProcessing ( static_cast < bool > ( 0 ) ) ; } ; /@} *
##   Return the number of threads actually used during execution. This is
##   valid only after algorithm execution.
##  int GetNumberOfThreadsUsed ( ) { return this -> NumberOfThreadsUsed ; } *
##  Inform the user as to whether large ids were used during filter
##  execution. This flag only has meaning after the filter has executed.
##  Large ids are used when the id of the larges cell or point is greater
##  than signed 32-bit precision. (Smaller ids reduce memory usage and speed
##  computation. Note that LargeIds are only available on 64-bit
##  architectures.)
##  bool GetLargeIds ( ) { return this -> LargeIds ; } *
##  Returns true if the data object passed in is fully supported by this
##  filter, i.e., all cell types are linear. For composite datasets, this
##  means all dataset leaves have only linear cell types that can be processed
##  by this filter.
##  static bool CanFullyProcessDataObject ( vtkDataObject * object ) ; protected : vtk3DLinearGridPlaneCutter ( ) ; ~ vtk3DLinearGridPlaneCutter ( ) override ; vtkPlane * Plane ; bool MergePoints ; bool InterpolateAttributes ; bool ComputeNormals ; int OutputPointsPrecision ; bool SequentialProcessing ; int NumberOfThreadsUsed ; bool LargeIds ;  indicate whether integral ids are large(==true) or not  Process the data: input unstructured grid and output polydata int ProcessPiece ( vtkUnstructuredGrid * input , vtkPlane * plane , vtkPolyData * output ) ; int RequestDataObject ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; private : vtk3DLinearGridPlaneCutter ( const vtk3DLinearGridPlaneCutter & ) = delete ; void operator = ( const vtk3DLinearGridPlaneCutter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
