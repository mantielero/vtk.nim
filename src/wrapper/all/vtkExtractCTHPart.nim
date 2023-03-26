## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtractCTHPart.h
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
##  @class   vtkExtractCTHPart
##  @brief   Generates surface of a CTH volume fraction.
##
##  vtkExtractCTHPart is a filter that is specialized for creating
##  visualizations for a CTH simulation. CTH datasets comprise of either
##  vtkNonOverlappingAMR or a multiblock of non-overlapping rectilinear grids
##  with cell-data. Certain cell-arrays in the dataset identify the fraction of
##  a particular material present in a given cell. This goal with this filter is
##  to extract a surface contour demarcating the surface where the volume
##  fraction for a particular material is equal to the user chosen value.
##
##  To achieve that, this filter first converts the cell-data to point-data and
##  then simply apply vtkContourFilter filter to extract the contour.
##
##  vtkExtractCTHPart also provides the user with an option to clip the resultant
##  contour using a vtkPlane. Internally, it uses vtkClipClosedSurface to clip
##  the contour using the vtkPlane provided.
##
##  The output of this filter is a vtkMultiBlockDataSet with one block
##  corresponding to each volume-fraction array requested. Each block itself is a
##  vtkPolyData for the contour generated on the current process (which may be
##  null, for processes where no contour is generated).
##

## !!!Ignored construct:  # vtkExtractCTHPart_h [NewLine] # vtkExtractCTHPart_h [NewLine] # vtkFiltersParallelModule.h  For export macro # vtkMultiBlockDataSetAlgorithm.h [NewLine] # vtkSmartPointer.h  for using smartpointer [NewLine] class vtkAppendPolyData ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkContourFilter"
discard "forward decl of vtkDataArray"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkDataSetSurfaceFilter"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkExtractCTHPartInternal"
discard "forward decl of vtkImageData"
discard "forward decl of vtkCompositeDataSet"
discard "forward decl of vtkMultiProcessController"
discard "forward decl of vtkPlane"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkRectilinearGrid"
discard "forward decl of vtkUniformGrid"
discard "forward decl of vtkUnsignedCharArray"
discard "forward decl of vtkUnstructuredGrid"
discard "forward decl of vtkExtractCTHPartFragments"
## !!!Ignored construct:  class VTKFILTERSPARALLEL_EXPORT vtkExtractCTHPart : public vtkMultiBlockDataSetAlgorithm { public : static vtkExtractCTHPart * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkMultiBlockDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkMultiBlockDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkExtractCTHPart :: IsTypeOf ( type ) ; } static vtkExtractCTHPart * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkExtractCTHPart * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkExtractCTHPart * NewInstance ( ) const { return vtkExtractCTHPart :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMultiBlockDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtractCTHPart :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtractCTHPart :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Select cell-data arrays (volume-fraction arrays) to contour with.
##  void AddVolumeArrayName ( const char * ) ; void RemoveVolumeArrayNames ( ) ; int GetNumberOfVolumeArrayNames ( ) ; const char * GetVolumeArrayName ( int idx ) ; /@} /@{ *
##  Get/Set the parallel controller. By default, the value returned by
##  vtkMultiBlockDataSetAlgorithm::GetGlobalController() when the object is
##  instantiated is used.
##  void SetController ( vtkMultiProcessController * controller ) ; virtual vtkMultiProcessController * GetnameController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Controller  address  << static_cast < vtkMultiProcessController * > ( this -> Controller ) ) ; return this -> Controller ; } ; /@} /@{ *
##  On by default, enables logic to cap the material volume.
##  virtual void SetCapping ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Capping  to  << _arg ) ; if ( this -> Capping != _arg ) { this -> Capping = _arg ; this -> Modified ( ) ; } } ; virtual bool GetCapping ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Capping  of  << this -> Capping ) ; return this -> Capping ; } ; virtual void CappingOn ( ) { this -> SetCapping ( static_cast < bool > ( 1 ) ) ; } virtual void CappingOff ( ) { this -> SetCapping ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Triangulate results. When set to false, the internal cut and contour filters
##  are told not to triangulate results if possible. true by default.
##  virtual void SetCappingGenerateTriangles ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateTriangles  to  << _arg ) ; if ( this -> GenerateTriangles != _arg ) { this -> GenerateTriangles = _arg ; this -> Modified ( ) ; } } ; virtual bool GetCappingGenerateTriangles ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateTriangles  of  << this -> GenerateTriangles ) ; return this -> GenerateTriangles ; } ; virtual void GenerateTrianglesOn ( ) { this -> SetCappingGenerateTriangles ( static_cast < bool > ( 1 ) ) ; } virtual void GenerateTrianglesOff ( ) { this -> SetCappingGenerateTriangles ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Generate solid geometry as results instead of 2D contours.
##  When set to true, GenerateTriangles flag will be ignored.
##  False by default.
##  virtual void SetCappingGenerateTrianglesGenerateSolidGeometry ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateSolidGeometry  to  << _arg ) ; if ( this -> GenerateSolidGeometry != _arg ) { this -> GenerateSolidGeometry = _arg ; this -> Modified ( ) ; } } ; virtual bool GetCappingGenerateTrianglesGenerateSolidGeometry ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateSolidGeometry  of  << this -> GenerateSolidGeometry ) ; return this -> GenerateSolidGeometry ; } ; virtual void GenerateSolidGeometryOn ( ) { this -> SetCappingGenerateTrianglesGenerateSolidGeometry ( static_cast < bool > ( 1 ) ) ; } virtual void GenerateSolidGeometryOff ( ) { this -> SetCappingGenerateTrianglesGenerateSolidGeometry ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  When set to false, the output surfaces will not hide contours extracted from
##  ghost cells. This results in overlapping contours but overcomes holes.
##  Default is set to true.
##  virtual void SetCappingGenerateTrianglesGenerateSolidGeometryRemoveGhostCells ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  RemoveGhostCells  to  << _arg ) ; if ( this -> RemoveGhostCells != _arg ) { this -> RemoveGhostCells = _arg ; this -> Modified ( ) ; } } ; virtual bool GetCappingGenerateTrianglesGenerateSolidGeometryRemoveGhostCells ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RemoveGhostCells  of  << this -> RemoveGhostCells ) ; return this -> RemoveGhostCells ; } ; virtual void RemoveGhostCellsOn ( ) { this -> SetCappingGenerateTrianglesGenerateSolidGeometryRemoveGhostCells ( static_cast < bool > ( 1 ) ) ; } virtual void RemoveGhostCellsOff ( ) { this -> SetCappingGenerateTrianglesGenerateSolidGeometryRemoveGhostCells ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Set, get or manipulate the implicit clipping plane.
##  void SetClipPlane ( vtkPlane * clipPlane ) ; virtual vtkPlane * GetnameControllerClipPlane ( ) { vtkDebugWithObjectMacro ( this , <<  returning  ClipPlane  address  << static_cast < vtkPlane * > ( this -> ClipPlane ) ) ; return this -> ClipPlane ; } ; /@} *
##  Look at clip plane to compute MTime.
##  vtkMTimeType GetMTime ( ) override ; /@{ *
##  Set and get the volume fraction surface value. This value should be
##  between 0 and 1
##  virtual void SetVolumeFractionSurfaceValue ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << VolumeFractionSurfaceValue  to  << _arg ) ; if ( this -> VolumeFractionSurfaceValue != ( _arg < 0.0 ? 0.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ) { this -> VolumeFractionSurfaceValue = ( _arg < 0.0 ? 0.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetVolumeFractionSurfaceValueMinValue ( ) { return 0.0 ; } virtual double GetVolumeFractionSurfaceValueMaxValue ( ) { return 1.0 ; } ; virtual double GetCappingGenerateTrianglesGenerateSolidGeometryRemoveGhostCellsVolumeFractionSurfaceValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VolumeFractionSurfaceValue  of  << this -> VolumeFractionSurfaceValue ) ; return this -> VolumeFractionSurfaceValue ; } ; /@} protected : vtkExtractCTHPart ( ) ; ~ vtkExtractCTHPart ( ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; *
##  Compute the bounds over the composite dataset, some sub-dataset
##  can be on other processors. Returns false of communication failure.
##  bool ComputeGlobalBounds ( vtkCompositeDataSet * input ) ; *
##  Extract contour for a particular array over the entire input dataset.
##  Returns false on error.
##  vtkSmartPointer < vtkDataSet > ExtractContour ( vtkCompositeDataSet * input , const char * arrayName ) ; *
##  Extract solids (unstructuredGrids) for a particular array
##  over the entire input dataset. Returns false on error.
##  vtkSmartPointer < vtkDataSet > ExtractSolid ( vtkCompositeDataSet * input , const char * arrayName ) ; void ExecuteFaceQuads ( vtkDataSet * input , vtkPolyData * output , int maxFlag , int originExtents [ 3 ] , int ext [ 6 ] , int aAxis , int bAxis , int cAxis ) ; *
##  Is block face on axis0 (either min or max depending on the maxFlag)
##  composed of only ghost cells?
##  \pre valid_axis0: axis0>=0 && axis0<=2
##  int IsGhostFace ( int axis0 , int maxFlag , int dims [ 3 ] , vtkUnsignedCharArray * ghostArray ) ; void TriggerProgressEvent ( double val ) ; int VolumeFractionType ; double VolumeFractionSurfaceValue ; double VolumeFractionSurfaceValueInternal ; bool GenerateTriangles ; bool GenerateSolidGeometry ; bool Capping ; bool RemoveGhostCells ; vtkPlane * ClipPlane ; vtkMultiProcessController * Controller ; private : vtkExtractCTHPart ( const vtkExtractCTHPart & ) = delete ; void operator = ( const vtkExtractCTHPart & ) = delete ; class VectorOfFragments ; class VectorOfSolids ; *
##  Determine the true value to use for clipping based on the data-type.
##  inline void DetermineSurfaceValue ( int dataType ) ; *
##  Extract contour for a particular array over a particular block in the input
##  dataset.  Returns false on error.
##  template < class T > bool ExtractClippedContourOnBlock ( vtkExtractCTHPart :: VectorOfFragments & fragments , T * input , const char * arrayName ) ; *
##  Extract contour for a particular array over a particular block in the input
##  dataset.  Returns false on error.
##  template < class T > bool ExtractContourOnBlock ( vtkExtractCTHPart :: VectorOfFragments & fragments , T * input , const char * arrayName ) ; *
##  Append quads for faces of the block that actually on the bounds
##  of the hierarchical dataset. Deals with ghost cells.
##  template < class T > void ExtractExteriorSurface ( vtkExtractCTHPart :: VectorOfFragments & fragments , T * input ) ; *
##  Extract clipped volume for a particular array over a particular block in the input
##  dataset.  Returns false on error.
##  template < class T > bool ExtractClippedVolumeOnBlock ( VectorOfSolids & solids , T * input , const char * arrayName ) ; *
##  Fast cell-data-2-point-data implementation.
##  void ExecuteCellDataToPointData ( vtkDataArray * cellVolumeFraction , vtkDoubleArray * pointVolumeFraction , const int * dims ) ; double ProgressShift ; double ProgressScale ; class ScaledProgress ; friend class ScaledProgress ; vtkExtractCTHPartInternal * Internals ; } ;
## Error: token expected: ; but got: [identifier]!!!
