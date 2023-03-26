## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkContour3DLinearGrid.h
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
##  @class   vtkContour3DLinearGrid
##  @brief   fast generation of isosurface from 3D linear cells
##
##  vtkContour3DLinearGrid is a specialized filter that generates isocontours
##  from an input vtkUnstructuredGrid consisting of 3D linear cells:
##  tetrahedra, hexahedra, voxels, pyramids, and/or wedges. (The cells are
##  linear in the sense that each cell edge is a straight line.) The filter is
##  designed for high-speed, specialized operation. All other cell types are
##  skipped and produce no output. (Note: the filter will also process
##  input vtkCompositeDataSets containing vtkUnstructuredGrids.)
##
##  To use this filter you must specify an input unstructured grid or
##  vtkCompositeDataSet, and one or more contour values.  You can either use
##  the method SetValue() to specify each contour value, or use
##  GenerateValues() to generate a series of evenly spaced contours.
##
##  The filter performance varies depending on optional output
##  information. Basically if point merging is required (when PointMerging,
##  InterpolateAttributes, and/or ComputeNormals is enabled), a sorting
##  process is required to eliminate duplicate output points in the
##  isosurface. Otherwise when point merging is not required, a fast path
##  process produces independent triangles representing the isosurface. In
##  many situations the results of the fast path are quite good and do not
##  require additional processing.
##
##  Note that another performance option exists, using a vtkScalarTree, which
##  is an object that accelerates isosurface extraction, at the initial cost
##  of building the scalar tree. (This feature is useful for exploratory
##  isosurface extraction when the isovalue is frequently changed.) In some
##  cases this can improve performance, however this algorithm is so highly
##  tuned that random memory jumps (due to random access of cells provided by
##  the scalar tree) can actually negatively impact performance, especially if
##  the input dataset type consists of homogeneous cell types.
##
##  @warning
##  When the input is of type vtkCompositeDataSet the filter will process the
##  unstructured grid(s) contained in the composite data set. As a result the
##  output of this filter is then a vtkMultiBlockDataSet containing multiple
##  vtkPolyData. When a vtkUnstructuredGrid is provided as input the
##  output is a single vtkPolyData.
##
##  @warning
##  The fast path simply produces output points and triangles (the fast path
##  executes when MergePoints if off; InterpolateAttributes is off; and
##  ComputeNormals is off). Since the fast path does not merge points, it
##  produces many more output points, typically on the order of 5-6x more than
##  when MergePoints is enabled. Adding in the other options point merging,
##  field interpolation, and normal generation results in additional
##  performance impacts. By default the fast path is enabled.
##
##  @warning
##  When a vtkCompositeDataSet is provided as input, and UseScalarTree is
##  enabled and a ScalarTree specified, then the specified scalar tree is
##  cloned to create new ones for each dataset in the composite
##  dataset. Otherwise (i.e., when vtkUnstructuredGrid input) the specified
##  scalar tree is directly used (no cloning required).
##
##  @warning
##  Internal to this filter, a caching iterator is used to traverse the cells
##  that compose the vtkUnstructuredGrid. Maximum performance is obtained if
##  the cells are all of one type (i.e., input grid of homogeneous cell
##  types); repeated switching from different types may have detrimental
##  effects on performance.
##
##  @warning
##  For unstructured data, gradients are not computed. Normals are computed if
##  requested; they are "pseudo-normals" in that the normals of output
##  triangles that use a common point are averaged at the point. Alternatively
##  use vtkPolyDataNormals to compute the surface normals.
##
##  @warning
##  The output of this filter is subtly different than the more general filter
##  vtkContourGrid. vtkContourGrid eliminates small, degenerate triangles with
##  concident points which are consequently not sent to the output. In
##  practice this makes little impact on visual appearance but may have
##  repercussions if the output is used for modelling and/or analysis.
##
##  @warning
##  Input cells that are not of 3D linear type (tetrahedron, hexahedron,
##  wedge, pyramid, and voxel) are simply skipped and not processed.
##
##  @warning
##  The filter is templated on types of input and output points, and input
##  scalar type. To reduce object file bloat, only real points (float,double) are
##  processed, and a limited subset of scalar types.
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @sa
##  vtkContourGrid vtkContourFilter vtkFlyingEdges3D vtkMarchingCubes
##  vtkPolyDataNormals vtkStaticEdgeLocatorTemplate.h vtkScalarTree
##  vtkSpanSpace
##

## !!!Ignored construct:  # vtkContour3DLinearGrid_h [NewLine] # vtkContour3DLinearGrid_h [NewLine] # vtkContourValues.h  Needed for inline methods # vtkDataObjectAlgorithm.h [NewLine] # vtkFiltersCoreModule.h  For export macro [NewLine] class vtkPolyData ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkUnstructuredGrid"
discard "forward decl of vtkScalarTree"
discard "forward decl of vtkScalarTreeMap"
## !!!Ignored construct:  class VTKFILTERSCORE_EXPORT vtkContour3DLinearGrid : public vtkDataObjectAlgorithm { public : /@{ *
##  Standard methods for construction, type info, and printing.
##  static vtkContour3DLinearGrid * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataObjectAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataObjectAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkContour3DLinearGrid :: IsTypeOf ( type ) ; } static vtkContour3DLinearGrid * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkContour3DLinearGrid * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkContour3DLinearGrid * NewInstance ( ) const { return vtkContour3DLinearGrid :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObjectAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkContour3DLinearGrid :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkContour3DLinearGrid :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Methods to set / get contour values.
##  void SetValue ( int i , double value ) ; double GetValue ( int i ) ; double * GetValues ( ) ; void GetValues ( double * contourValues ) ; void SetNumberOfContours ( int number ) ; vtkIdType GetNumberOfContours ( ) ; void GenerateValues ( int numContours , double range [ 2 ] ) ; void GenerateValues ( int numContours , double rangeStart , double rangeEnd ) ; /@} /@{ *
##  Indicate whether to merge coincident points. This takes extra time and
##  produces fewer output points, creating a "watertight" contour
##  surface. By default this is off.
##  virtual void SetMergePoints ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MergePoints  to  << _arg ) ; if ( this -> MergePoints != _arg ) { this -> MergePoints = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetMergePoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MergePoints  of  << this -> MergePoints ) ; return this -> MergePoints ; } ; virtual void MergePointsOn ( ) { this -> SetMergePoints ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void MergePointsOff ( ) { this -> SetMergePoints ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Indicate whether to interpolate input attributes onto the isosurface. By
##  default this option is off.
##  virtual void SetMergePointsInterpolateAttributes ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  InterpolateAttributes  to  << _arg ) ; if ( this -> InterpolateAttributes != _arg ) { this -> InterpolateAttributes = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetMergePointsInterpolateAttributes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InterpolateAttributes  of  << this -> InterpolateAttributes ) ; return this -> InterpolateAttributes ; } ; virtual void InterpolateAttributesOn ( ) { this -> SetMergePointsInterpolateAttributes ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void InterpolateAttributesOff ( ) { this -> SetMergePointsInterpolateAttributes ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Indicate whether to compute output point normals. An averaging method is
##  used to average shared triangle normals. By default this if off. This is
##  a relatively expensive option so use judiciously.
##  virtual void SetMergePointsInterpolateAttributesComputeNormals ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeNormals  to  << _arg ) ; if ( this -> ComputeNormals != _arg ) { this -> ComputeNormals = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetMergePointsInterpolateAttributesComputeNormals ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeNormals  of  << this -> ComputeNormals ) ; return this -> ComputeNormals ; } ; virtual void ComputeNormalsOn ( ) { this -> SetMergePointsInterpolateAttributesComputeNormals ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ComputeNormalsOff ( ) { this -> SetMergePointsInterpolateAttributesComputeNormals ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} @{ *
##  Set/Get flag to compute scalars. When enabled, and when the
##     InterpolateAttributes option is on, vtkContour3DLinearGrid will add an
##     array corresponding to the array used to compute the contour and
##     populate it with values.
##  virtual void SetMergePointsInterpolateAttributesComputeNormalsComputeScalars ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeScalars  to  << _arg ) ; if ( this -> ComputeScalars != _arg ) { this -> ComputeScalars = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetMergePointsInterpolateAttributesComputeNormalsComputeScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeScalars  of  << this -> ComputeScalars ) ; return this -> ComputeScalars ; } ; virtual void ComputeScalarsOn ( ) { this -> SetMergePointsInterpolateAttributesComputeNormalsComputeScalars ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ComputeScalarsOff ( ) { this -> SetMergePointsInterpolateAttributesComputeNormalsComputeScalars ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; @} /@{ *
##  Set/get the desired precision for the output types. See the documentation
##  for the vtkAlgorithm::Precision enum for an explanation of the available
##  precision settings.
##  void SetOutputPointsPrecision ( int precision ) ; int GetOutputPointsPrecision ( ) const ; /@} *
##  Overloaded GetMTime() because of delegation to the internal
##  vtkContourValues class.
##  vtkMTimeType GetMTime ( ) override ; /@{ *
##  Enable the use of a scalar tree to accelerate contour extraction. By
##  default this is off. If enabled, and a scalar tree is not specified, then
##  a vtkSpanSpace instance will be constructed and used.
##  virtual void SetMergePointsInterpolateAttributesComputeNormalsComputeScalarsUseScalarTree ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseScalarTree  to  << _arg ) ; if ( this -> UseScalarTree != _arg ) { this -> UseScalarTree = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetMergePointsInterpolateAttributesComputeNormalsComputeScalarsUseScalarTree ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseScalarTree  of  << this -> UseScalarTree ) ; return this -> UseScalarTree ; } ; virtual void UseScalarTreeOn ( ) { this -> SetMergePointsInterpolateAttributesComputeNormalsComputeScalarsUseScalarTree ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void UseScalarTreeOff ( ) { this -> SetMergePointsInterpolateAttributesComputeNormalsComputeScalarsUseScalarTree ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify the scalar tree to use. By default a vtkSpanSpace scalar tree is
##  used.
##  virtual void SetScalarTree ( vtkScalarTree * ) ; virtual vtkScalarTree * GetnameScalarTree ( ) { vtkDebugWithObjectMacro ( this , <<  returning  ScalarTree  address  << static_cast < vtkScalarTree * > ( this -> ScalarTree ) ) ; return this -> ScalarTree ; } ; /@} /@{ *
##  Force sequential processing (i.e. single thread) of the contouring
##  process. By default, sequential processing is off. Note this flag only
##  applies if the class has been compiled with VTK_SMP_IMPLEMENTATION_TYPE
##  set to something other than Sequential. (If set to Sequential, then the
##  filter always runs in serial mode.) This flag is typically used for
##  benchmarking purposes.
##  virtual void SetMergePointsInterpolateAttributesComputeNormalsComputeScalarsUseScalarTreeSequentialProcessing ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SequentialProcessing  to  << _arg ) ; if ( this -> SequentialProcessing != _arg ) { this -> SequentialProcessing = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetMergePointsInterpolateAttributesComputeNormalsComputeScalarsUseScalarTreeSequentialProcessing ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SequentialProcessing  of  << this -> SequentialProcessing ) ; return this -> SequentialProcessing ; } ; virtual void SequentialProcessingOn ( ) { this -> SetMergePointsInterpolateAttributesComputeNormalsComputeScalarsUseScalarTreeSequentialProcessing ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void SequentialProcessingOff ( ) { this -> SetMergePointsInterpolateAttributesComputeNormalsComputeScalarsUseScalarTreeSequentialProcessing ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} *
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
##  by this filter. The second array is the name of the array to process.
##  static bool CanFullyProcessDataObject ( vtkDataObject * object , const char * scalarArrayName ) ; protected : vtkContour3DLinearGrid ( ) ; ~ vtkContour3DLinearGrid ( ) override ; vtkContourValues * ContourValues ; int OutputPointsPrecision ; vtkTypeBool MergePoints ; vtkTypeBool InterpolateAttributes ; vtkTypeBool ComputeNormals ; vtkTypeBool ComputeScalars ; vtkTypeBool SequentialProcessing ; int NumberOfThreadsUsed ; bool LargeIds ;  indicate whether integral ids are large(==true) or not  Manage scalar trees, including mapping scalar tree to input dataset vtkTypeBool UseScalarTree ; vtkScalarTree * ScalarTree ; struct vtkScalarTreeMap * ScalarTreeMap ;  Process the data: input unstructured grid and output polydata void ProcessPiece ( vtkUnstructuredGrid * input , vtkDataArray * inScalars , vtkPolyData * output ) ; int RequestDataObject ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; private : vtkContour3DLinearGrid ( const vtkContour3DLinearGrid & ) = delete ; void operator = ( const vtkContour3DLinearGrid & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## *
##  Set a particular contour value at contour number i. The index i ranges
##  between 0<=i<NumberOfContours.
##

proc SetValue*(i: cint; value: cdouble) {.importcpp: "VTKFILTERSCORE_EXPORT::SetValue(@)",
                                     header: "vtkContour3DLinearGrid.h".}
## *
##  Get the ith contour value.
##

proc GetValue*(i: cint): cdouble {.importcpp: "VTKFILTERSCORE_EXPORT::GetValue(@)",
                               header: "vtkContour3DLinearGrid.h".}
## *
##  Get a pointer to an array of contour values. There will be
##  GetNumberOfContours() values in the list.
##

proc GetValues*(): ptr cdouble {.importcpp: "VTKFILTERSCORE_EXPORT::GetValues(@)",
                             header: "vtkContour3DLinearGrid.h".}
## *
##  Fill a supplied list with contour values. There will be
##  GetNumberOfContours() values in the list. Make sure you allocate
##  enough memory to hold the list.
##

proc GetValues*(contourValues: ptr cdouble) {.
    importcpp: "VTKFILTERSCORE_EXPORT::GetValues(@)",
    header: "vtkContour3DLinearGrid.h".}
## *
##  Set the number of contours to place into the list. You only really
##  need to use this method to reduce list size. The method SetValue()
##  will automatically increase list size as needed.
##

proc SetNumberOfContours*(number: cint) {.importcpp: "VTKFILTERSCORE_EXPORT::SetNumberOfContours(@)",
                                       header: "vtkContour3DLinearGrid.h".}
## *
##  Get the number of contours in the list of contour values.
##

proc GetNumberOfContours*(): vtkIdType {.importcpp: "VTKFILTERSCORE_EXPORT::GetNumberOfContours(@)",
                                      header: "vtkContour3DLinearGrid.h".}
## *
##  Generate numContours equally spaced contour values between specified
##  range. Contour values will include min/max range values.
##

proc GenerateValues*(numContours: cint; range: array[2, cdouble]) {.
    importcpp: "VTKFILTERSCORE_EXPORT::GenerateValues(@)",
    header: "vtkContour3DLinearGrid.h".}
## *
##  Generate numContours equally spaced contour values between specified
##  range. Contour values will include min/max range values.
##

proc GenerateValues*(numContours: cint; rangeStart: cdouble; rangeEnd: cdouble) {.
    importcpp: "VTKFILTERSCORE_EXPORT::GenerateValues(@)",
    header: "vtkContour3DLinearGrid.h".}