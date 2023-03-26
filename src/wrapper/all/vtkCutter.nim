## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCutter.h
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
##  @class   vtkCutter
##  @brief   Cut vtkDataSet with user-specified implicit function
##
##  vtkCutter is a filter to cut through data using any subclass of
##  vtkImplicitFunction. That is, a polygonal surface is created
##  corresponding to the implicit function F(x,y,z) = value(s), where
##  you can specify one or more values used to cut with.
##
##  In VTK, cutting means reducing a cell of dimension N to a cut surface
##  of dimension N-1. For example, a tetrahedron when cut by a plane (i.e.,
##  vtkPlane implicit function) will generate triangles. (In comparison,
##  clipping takes a N dimensional cell and creates N dimension primitives.)
##
##  vtkCutter is generally used to "slice-through" a dataset, generating
##  a surface that can be visualized. It is also possible to use vtkCutter
##  to do a form of volume rendering. vtkCutter does this by generating
##  multiple cut surfaces (usually planes) which are ordered (and rendered)
##  from back-to-front. The surfaces are set translucent to give a
##  volumetric rendering effect.
##
##  Note that data can be cut using either 1) the scalar values associated
##  with the dataset or 2) an implicit function associated with this class.
##  By default, if an implicit function is set it is used to clip the data
##  set, otherwise the dataset scalars are used to perform the clipping.
##
##  Note that specialized classes exist when cutting a dataset with a
##  plane. vtkPlenCutter handles any type of vtkDataSet, and will delegate to
##  internal instances of specialized plane cutters (e.g.,
##  vtkFlyingEdgesPlaneCutter for vtkImageData; vtkPolyDataPlaneCutter for
##  vtkPolyData containing convex polygons).
##
##  @sa
##  vtkImplicitFunction vtkClipPolyData vtkPlaneCutter vtkFlyingEdgesPlaneCutter
##  vtkPolyDataPlaneCutter
##

## !!!Ignored construct:  # vtkCutter_h [NewLine] # vtkCutter_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] # vtkContourValues.h  Needed for inline methods [NewLine] # VTK_SORT_BY_VALUE 0 [NewLine] # VTK_SORT_BY_CELL 1 [NewLine] class vtkImplicitFunction ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkIncrementalPointLocator"
discard "forward decl of vtkSynchronizedTemplates3D"
discard "forward decl of vtkSynchronizedTemplatesCutter3D"
discard "forward decl of vtkGridSynchronizedTemplates3D"
discard "forward decl of vtkRectilinearSynchronizedTemplates"
## !!!Ignored construct:  class VTKFILTERSCORE_EXPORT vtkCutter : public vtkPolyDataAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkCutter :: IsTypeOf ( type ) ; } static vtkCutter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkCutter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkCutter * NewInstance ( ) const { return vtkCutter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCutter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCutter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct with user-specified implicit function; initial value of 0.0; and
##  generating cut scalars turned off.
##  static vtkCutter * New ( ) ; *
##  Set a particular contour value at contour number i. The index i ranges
##  between 0<=i<NumberOfContours.
##  void SetValue ( int i , double value ) { this -> ContourValues -> SetValue ( i , value ) ; } *
##  Get the ith contour value.
##  double GetValue ( int i ) { return this -> ContourValues -> GetValue ( i ) ; } *
##  Get a pointer to an array of contour values. There will be
##  GetNumberOfContours() values in the list.
##  double * GetValues ( ) { return this -> ContourValues -> GetValues ( ) ; } *
##  Fill a supplied list with contour values. There will be
##  GetNumberOfContours() values in the list. Make sure you allocate
##  enough memory to hold the list.
##  void GetValues ( double * contourValues ) { this -> ContourValues -> GetValues ( contourValues ) ; } *
##  Set the number of contours to place into the list. You only really
##  need to use this method to reduce list size. The method SetValue()
##  will automatically increase list size as needed.
##  void SetNumberOfContours ( int number ) { this -> ContourValues -> SetNumberOfContours ( number ) ; } *
##  Get the number of contours in the list of contour values.
##  vtkIdType GetNumberOfContours ( ) { return this -> ContourValues -> GetNumberOfContours ( ) ; } *
##  Generate numContours equally spaced contour values between specified
##  range. Contour values will include min/max range values.
##  void GenerateValues ( int numContours , double range [ 2 ] ) { this -> ContourValues -> GenerateValues ( numContours , range ) ; } *
##  Generate numContours equally spaced contour values between specified
##  range. Contour values will include min/max range values.
##  void GenerateValues ( int numContours , double rangeStart , double rangeEnd ) { this -> ContourValues -> GenerateValues ( numContours , rangeStart , rangeEnd ) ; } *
##  Override GetMTime because we delegate to vtkContourValues and refer to
##  vtkImplicitFunction.
##  vtkMTimeType GetMTime ( ) override ; /@{ *
##  Specify the implicit function to perform the cutting.
##  virtual void SetCutFunction ( vtkImplicitFunction * ) ; virtual vtkImplicitFunction * GetnameCutFunction ( ) { vtkDebugWithObjectMacro ( this , <<  returning  CutFunction  address  << static_cast < vtkImplicitFunction * > ( this -> CutFunction ) ) ; return this -> CutFunction ; } ; /@} /@{ *
##  If this flag is enabled, then the output scalar values will be
##  interpolated from the implicit function values, and not the input scalar
##  data.
##  virtual void SetGenerateCutScalars ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateCutScalars  to  << _arg ) ; if ( this -> GenerateCutScalars != _arg ) { this -> GenerateCutScalars = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetGenerateCutScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateCutScalars  of  << this -> GenerateCutScalars ) ; return this -> GenerateCutScalars ; } ; virtual void GenerateCutScalarsOn ( ) { this -> SetGenerateCutScalars ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GenerateCutScalarsOff ( ) { this -> SetGenerateCutScalars ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  If this is enabled (by default), the output will be triangles
##  otherwise, the output will be the intersection polygons
##  WARNING: if the cutting function is not a plane, the output
##  will be 3D poygons, which might be nice to look at but hard
##  to compute with downstream.
##  virtual void SetGenerateCutScalarsGenerateTriangles ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateTriangles  to  << _arg ) ; if ( this -> GenerateTriangles != _arg ) { this -> GenerateTriangles = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetGenerateCutScalarsGenerateTriangles ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateTriangles  of  << this -> GenerateTriangles ) ; return this -> GenerateTriangles ; } ; virtual void GenerateTrianglesOn ( ) { this -> SetGenerateCutScalarsGenerateTriangles ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GenerateTrianglesOff ( ) { this -> SetGenerateCutScalarsGenerateTriangles ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify a spatial locator for merging points. By default,
##  an instance of vtkMergePoints is used.
##  void SetLocator ( vtkIncrementalPointLocator * locator ) ; virtual vtkIncrementalPointLocator * GetnameCutFunctionLocator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Locator  address  << static_cast < vtkIncrementalPointLocator * > ( this -> Locator ) ) ; return this -> Locator ; } ; /@} /@{ *
##  Set the sorting order for the generated polydata. There are two
##  possibilities:
##  Sort by value = 0 - This is the most efficient sort. For each cell,
##  all contour values are processed. This is the default.
##  Sort by cell = 1 - For each contour value, all cells are processed.
##  This order should be used if the extracted polygons must be rendered
##  in a back-to-front or front-to-back order. This is very problem
##  dependent.
##  For most applications, the default order is fine (and faster).
##
##  Sort by cell is going to have a problem if the input has 2D and 3D cells.
##  Cell data will be scrambled because with
##  vtkPolyData output, verts and lines have lower cell ids than triangles.
##  virtual void SetSortBy ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << SortBy  to  << _arg ) ; if ( this -> SortBy != ( _arg < VTK_SORT_BY_VALUE ? VTK_SORT_BY_VALUE : ( _arg > VTK_SORT_BY_CELL ? VTK_SORT_BY_CELL : _arg ) ) ) { this -> SortBy = ( _arg < VTK_SORT_BY_VALUE ? VTK_SORT_BY_VALUE : ( _arg > VTK_SORT_BY_CELL ? VTK_SORT_BY_CELL : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetSortByMinValue ( ) { return VTK_SORT_BY_VALUE ; } virtual int GetSortByMaxValue ( ) { return VTK_SORT_BY_CELL ; } ; virtual int GetGenerateCutScalarsGenerateTrianglesSortBy ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SortBy  of  << this -> SortBy ) ; return this -> SortBy ; } ; void SetSortByToSortByValue ( ) { this -> SetSortBy ( VTK_SORT_BY_VALUE ) ; } void SetSortByToSortByCell ( ) { this -> SetSortBy ( VTK_SORT_BY_CELL ) ; } const char * GetSortByAsString ( ) ; /@} *
##  Create default locator. Used to create one when none is specified. The
##  locator is used to merge coincident points.
##  void CreateDefaultLocator ( ) ; *
##  Normally I would put this in a different class, but since
##  This is a temporary fix until we convert this class and contour filter
##  to generate unstructured grid output instead of poly data, I am leaving it here.
##  static void GetCellTypeDimensions ( unsigned char * cellTypeDimensions ) ; /@{ *
##  Set/get the desired precision for the output types. See the documentation
##  for the vtkAlgorithm::DesiredOutputPrecision enum for an explanation of
##  the available precision settings.
##  virtual void SetSortByOutputPointsPrecision ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << OutputPointsPrecision  to  << _arg ) ; if ( this -> OutputPointsPrecision != ( _arg < SINGLE_PRECISION ? SINGLE_PRECISION : ( _arg > DEFAULT_PRECISION ? DEFAULT_PRECISION : _arg ) ) ) { this -> OutputPointsPrecision = ( _arg < SINGLE_PRECISION ? SINGLE_PRECISION : ( _arg > DEFAULT_PRECISION ? DEFAULT_PRECISION : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetSortByMinValueOutputPointsPrecisionMinValue ( ) { return SINGLE_PRECISION ; } virtual int GetSortByMaxValueOutputPointsPrecisionMaxValue ( ) { return DEFAULT_PRECISION ; } ; virtual int GetGenerateCutScalarsGenerateTrianglesSortByOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ; /@} protected : vtkCutter ( vtkImplicitFunction * cf = nullptr ) ; ~ vtkCutter ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; void UnstructuredGridCutter ( vtkDataSet * input , vtkPolyData * output ) ; void DataSetCutter ( vtkDataSet * input , vtkPolyData * output ) ; void StructuredPointsCutter ( vtkDataSet * , vtkPolyData * , vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) ; void StructuredGridCutter ( vtkDataSet * , vtkPolyData * ) ; void RectilinearGridCutter ( vtkDataSet * , vtkPolyData * ) ; vtkImplicitFunction * CutFunction ; vtkTypeBool GenerateTriangles ; vtkSynchronizedTemplates3D * SynchronizedTemplates3D ; vtkSynchronizedTemplatesCutter3D * SynchronizedTemplatesCutter3D ; vtkGridSynchronizedTemplates3D * GridSynchronizedTemplates ; vtkRectilinearSynchronizedTemplates * RectilinearSynchronizedTemplates ; vtkIncrementalPointLocator * Locator ; int SortBy ; vtkContourValues * ContourValues ; vtkTypeBool GenerateCutScalars ; int OutputPointsPrecision ; private : vtkCutter ( const vtkCutter & ) = delete ; void operator = ( const vtkCutter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## *
##  Return the sorting procedure as a descriptive character string.
##

proc GetSortByAsString*(): cstring {.importcpp: "VTKFILTERSCORE_EXPORT::GetSortByAsString(@)",
                                  header: "vtkCutter.h".}