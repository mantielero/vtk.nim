## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkContourFilter.h
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
##  @class   vtkContourFilter
##  @brief   generate isosurfaces/isolines from scalar values
##
##  vtkContourFilter is a filter that takes as input any dataset and
##  generates on output isosurfaces and/or isolines. The exact form
##  of the output depends upon the dimensionality of the input data.
##  Data consisting of 3D cells will generate isosurfaces, data
##  consisting of 2D cells will generate isolines, and data with 1D
##  or 0D cells will generate isopoints. Combinations of output type
##  are possible if the input dimension is mixed.
##
##  To use this filter you must specify one or more contour values.
##  You can either use the method SetValue() to specify each contour
##  value, or use GenerateValues() to generate a series of evenly
##  spaced contours. It is also possible to accelerate the operation of
##  this filter (at the cost of extra memory) by using a
##  vtkScalarTree. A scalar tree is used to quickly locate cells that
##  contain a contour surface. This is especially effective if multiple
##  contours are being extracted. If you want to use a scalar tree,
##  invoke the method UseScalarTreeOn().
##
##  @warning
##  For unstructured data or structured grids, normals and gradients
##  are not computed. Use vtkPolyDataNormals to compute the surface
##  normals.
##
##  @sa
##  Much faster implementations for isocontouring are available. In
##  particular, vtkFlyingEdges3D and vtkFlyingEdges2D are much faster
##  and if built with the right options, multithreaded, and scale well
##  with additional processors.
##
##  @sa
##  vtkFlyingEdges3D vtkFlyingEdges2D vtkDiscreteFlyingEdges3D
##  vtkDiscreteFlyingEdges2D vtkMarchingContourFilter vtkMarchingCubes
##  vtkSliceCubes vtkMarchingSquares vtkImageMarchingCubes
##

## !!!Ignored construct:  # vtkContourFilter_h [NewLine] # vtkContourFilter_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] # vtkContourValues.h  Needed for inline methods [NewLine] class vtkIncrementalPointLocator ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkScalarTree"
discard "forward decl of vtkSynchronizedTemplates2D"
discard "forward decl of vtkSynchronizedTemplates3D"
discard "forward decl of vtkGridSynchronizedTemplates3D"
discard "forward decl of vtkRectilinearSynchronizedTemplates"
discard "forward decl of vtkCallbackCommand"
## !!!Ignored construct:  class VTKFILTERSCORE_EXPORT vtkContourFilter : public vtkPolyDataAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkContourFilter :: IsTypeOf ( type ) ; } static vtkContourFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkContourFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkContourFilter * NewInstance ( ) const { return vtkContourFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkContourFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkContourFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct object with initial range (0,1) and single contour value
##  of 0.0.
##  static vtkContourFilter * New ( ) ; /@{ *
##  Methods to set / get contour values.
##  void SetValue ( int i , double value ) ; double GetValue ( int i ) ; double * GetValues ( ) ; void GetValues ( double * contourValues ) ; void SetNumberOfContours ( int number ) ; vtkIdType GetNumberOfContours ( ) ; void GenerateValues ( int numContours , double range [ 2 ] ) ; void GenerateValues ( int numContours , double rangeStart , double rangeEnd ) ; /@} *
##  Modified GetMTime Because we delegate to vtkContourValues
##  vtkMTimeType GetMTime ( ) override ; /@{ *
##  Set/Get the computation of normals. Normal computation is fairly
##  expensive in both time and storage. If the output data will be
##  processed by filters that modify topology or geometry, it may be
##  wise to turn Normals and Gradients off.
##  This setting defaults to On for vtkImageData, vtkRectilinearGrid,
##  vtkStructuredGrid, and vtkUnstructuredGrid inputs, and Off for all others.
##  This default behavior is to preserve the behavior of an older version of
##  this filter, which would ignore this setting for certain inputs.
##  virtual void SetComputeNormals ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeNormals  to  << _arg ) ; if ( this -> ComputeNormals != _arg ) { this -> ComputeNormals = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetComputeNormals ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeNormals  of  << this -> ComputeNormals ) ; return this -> ComputeNormals ; } ; virtual void ComputeNormalsOn ( ) { this -> SetComputeNormals ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ComputeNormalsOff ( ) { this -> SetComputeNormals ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the computation of gradients. Gradient computation is
##  fairly expensive in both time and storage. Note that if
##  ComputeNormals is on, gradients will have to be calculated, but
##  will not be stored in the output dataset.  If the output data
##  will be processed by filters that modify topology or geometry, it
##  may be wise to turn Normals and Gradients off.
##  virtual void SetComputeNormalsComputeGradients ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeGradients  to  << _arg ) ; if ( this -> ComputeGradients != _arg ) { this -> ComputeGradients = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetComputeNormalsComputeGradients ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeGradients  of  << this -> ComputeGradients ) ; return this -> ComputeGradients ; } ; virtual void ComputeGradientsOn ( ) { this -> SetComputeNormalsComputeGradients ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ComputeGradientsOff ( ) { this -> SetComputeNormalsComputeGradients ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the computation of scalars.
##  virtual void SetComputeNormalsComputeGradientsComputeScalars ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeScalars  to  << _arg ) ; if ( this -> ComputeScalars != _arg ) { this -> ComputeScalars = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetComputeNormalsComputeGradientsComputeScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeScalars  of  << this -> ComputeScalars ) ; return this -> ComputeScalars ; } ; virtual void ComputeScalarsOn ( ) { this -> SetComputeNormalsComputeGradientsComputeScalars ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ComputeScalarsOff ( ) { this -> SetComputeNormalsComputeGradientsComputeScalars ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Enable the use of a scalar tree to accelerate contour extraction. By
##  default, an instance of vtkSpanSpace is created when needed.
##  virtual void SetComputeNormalsComputeGradientsComputeScalarsUseScalarTree ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseScalarTree  to  << _arg ) ; if ( this -> UseScalarTree != _arg ) { this -> UseScalarTree = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetComputeNormalsComputeGradientsComputeScalarsUseScalarTree ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseScalarTree  of  << this -> UseScalarTree ) ; return this -> UseScalarTree ; } ; virtual void UseScalarTreeOn ( ) { this -> SetComputeNormalsComputeGradientsComputeScalarsUseScalarTree ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void UseScalarTreeOff ( ) { this -> SetComputeNormalsComputeGradientsComputeScalarsUseScalarTree ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Enable the use of a scalar tree to accelerate contour extraction.
##  virtual void SetScalarTree ( vtkScalarTree * ) ; virtual vtkScalarTree * GetnameScalarTree ( ) { vtkDebugWithObjectMacro ( this , <<  returning  ScalarTree  address  << static_cast < vtkScalarTree * > ( this -> ScalarTree ) ) ; return this -> ScalarTree ; } ; /@} /@{ *
##  Set / get a spatial locator for merging points. By default,
##  an instance of vtkMergePoints is used.
##  void SetLocator ( vtkIncrementalPointLocator * locator ) ; virtual vtkIncrementalPointLocator * GetnameScalarTreeLocator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Locator  address  << static_cast < vtkIncrementalPointLocator * > ( this -> Locator ) ) ; return this -> Locator ; } ; /@} *
##  Create default locator. Used to create one when none is
##  specified. The locator is used to merge coincident points.
##  void CreateDefaultLocator ( ) ; /@{ *
##  Set/get which component of the scalar array to contour on; defaults to 0.
##  Currently this feature only works if the input is a vtkImageData.
##  void SetArrayComponent ( int ) ; int GetArrayComponent ( ) ; /@} /@{ *
##  If this is enabled (by default), the output will be triangles
##  otherwise, the output will be the intersection polygon
##  WARNING: if the contour surface is not planar, the output
##  polygon will not be planar, which might be nice to look at but hard
##  to compute with downstream.
##  virtual void SetComputeNormalsComputeGradientsComputeScalarsUseScalarTreeGenerateTriangles ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateTriangles  to  << _arg ) ; if ( this -> GenerateTriangles != _arg ) { this -> GenerateTriangles = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetComputeNormalsComputeGradientsComputeScalarsUseScalarTreeGenerateTriangles ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateTriangles  of  << this -> GenerateTriangles ) ; return this -> GenerateTriangles ; } ; virtual void GenerateTrianglesOn ( ) { this -> SetComputeNormalsComputeGradientsComputeScalarsUseScalarTreeGenerateTriangles ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GenerateTrianglesOff ( ) { this -> SetComputeNormalsComputeGradientsComputeScalarsUseScalarTreeGenerateTriangles ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/get the desired precision for the output types. See the documentation
##  for the vtkAlgorithm::Precision enum for an explanation of the available
##  precision settings.
##  void SetOutputPointsPrecision ( int precision ) ; int GetOutputPointsPrecision ( ) const ; /@} protected : vtkContourFilter ( ) ; ~ vtkContourFilter ( ) override ; void ReportReferences ( vtkGarbageCollector * ) override ; int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; vtkContourValues * ContourValues ; vtkTypeBool ComputeNormals ; vtkTypeBool ComputeGradients ; vtkTypeBool ComputeScalars ; vtkIncrementalPointLocator * Locator ; vtkTypeBool UseScalarTree ; vtkScalarTree * ScalarTree ; int OutputPointsPrecision ; vtkTypeBool GenerateTriangles ; vtkSynchronizedTemplates2D * SynchronizedTemplates2D ; vtkSynchronizedTemplates3D * SynchronizedTemplates3D ; vtkGridSynchronizedTemplates3D * GridSynchronizedTemplates ; vtkRectilinearSynchronizedTemplates * RectilinearSynchronizedTemplates ; vtkCallbackCommand * InternalProgressCallbackCommand ; static void InternalProgressCallbackFunction ( vtkObject * caller , unsigned long eid , void * clientData , void * callData ) ; private : vtkContourFilter ( const vtkContourFilter & ) = delete ; void operator = ( const vtkContourFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## *
##  Set a particular contour value at contour number i. The index i ranges
##  between 0<=i<NumberOfContours.
##

proc SetValue*(i: cint; value: cdouble) {.importcpp: "VTKFILTERSCORE_EXPORT::SetValue(@)",
                                     header: "vtkContourFilter.h".}
## *
##  Get the ith contour value.
##

proc GetValue*(i: cint): cdouble {.importcpp: "VTKFILTERSCORE_EXPORT::GetValue(@)",
                               header: "vtkContourFilter.h".}
## *
##  Get a pointer to an array of contour values. There will be
##  GetNumberOfContours() values in the list.
##

proc GetValues*(): ptr cdouble {.importcpp: "VTKFILTERSCORE_EXPORT::GetValues(@)",
                             header: "vtkContourFilter.h".}
## *
##  Fill a supplied list with contour values. There will be
##  GetNumberOfContours() values in the list. Make sure you allocate
##  enough memory to hold the list.
##

proc GetValues*(contourValues: ptr cdouble) {.
    importcpp: "VTKFILTERSCORE_EXPORT::GetValues(@)", header: "vtkContourFilter.h".}
## *
##  Set the number of contours to place into the list. You only really
##  need to use this method to reduce list size. The method SetValue()
##  will automatically increase list size as needed.
##

proc SetNumberOfContours*(number: cint) {.importcpp: "VTKFILTERSCORE_EXPORT::SetNumberOfContours(@)",
                                       header: "vtkContourFilter.h".}
## *
##  Get the number of contours in the list of contour values.
##

proc GetNumberOfContours*(): vtkIdType {.importcpp: "VTKFILTERSCORE_EXPORT::GetNumberOfContours(@)",
                                      header: "vtkContourFilter.h".}
## *
##  Generate numContours equally spaced contour values between specified
##  range. Contour values will include min/max range values.
##

proc GenerateValues*(numContours: cint; range: array[2, cdouble]) {.
    importcpp: "VTKFILTERSCORE_EXPORT::GenerateValues(@)",
    header: "vtkContourFilter.h".}
## *
##  Generate numContours equally spaced contour values between specified
##  range. Contour values will include min/max range values.
##

proc GenerateValues*(numContours: cint; rangeStart: cdouble; rangeEnd: cdouble) {.
    importcpp: "VTKFILTERSCORE_EXPORT::GenerateValues(@)",
    header: "vtkContourFilter.h".}