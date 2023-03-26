## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkClipVolume.h
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
##  @class   vtkClipVolume
##  @brief   clip volume data with user-specified implicit function or input scalar data
##
##  vtkClipVolume is a filter that clips volume data (i.e., vtkImageData)
##  using either: any subclass of vtkImplicitFunction or the input scalar
##  data. The clipping operation cuts through the cells of the
##  dataset--converting 3D image data into a 3D unstructured grid--returning
##  everything inside of the specified implicit function (or greater than the
##  scalar value). During the clipping the filter will produce pieces of a
##  cell. (Compare this with vtkExtractGeometry or vtkGeometryFilter, which
##  produces entire, uncut cells.) The output of this filter is a 3D
##  unstructured grid (e.g., tetrahedra or other 3D cell types).
##
##  To use this filter, you must decide if you will be clipping with an
##  implicit function, or whether you will be using the input scalar data.  If
##  you want to clip with an implicit function, you must first define and then
##  set the implicit function with the SetClipFunction() method. Otherwise,
##  you must make sure input scalar data is available. You can also specify a
##  scalar value, which is used to decide what is inside and outside of the
##  implicit function. You can also reverse the sense of what inside/outside
##  is by setting the InsideOut instance variable. (The cutting algorithm
##  proceeds by computing an implicit function value or using the input scalar
##  data for each point in the dataset. This is compared to the scalar value
##  to determine inside/outside.)
##
##  This filter can be configured to compute a second output. The
##  second output is the portion of the volume that is clipped away. Set the
##  GenerateClippedData boolean on if you wish to access this output data.
##
##  The filter will produce an unstructured grid of entirely tetrahedra or a
##  mixed grid of tetrahedra and other 3D cell types (e.g., wedges). Control
##  this behavior by setting the Mixed3DCellGeneration. By default the
##  Mixed3DCellGeneration is on and a combination of cell types will be
##  produced. Note that producing mixed cell types is a faster than producing
##  only tetrahedra.
##
##  @warning
##  This filter is designed to function with 3D structured points. Clipping
##  2D images should be done by converting the image to polygonal data
##  and using vtkClipPolyData,
##
##  @sa
##  vtkImplicitFunction vtkClipPolyData vtkGeometryFilter vtkExtractGeometry
##

## !!!Ignored construct:  # vtkClipVolume_h [NewLine] # vtkClipVolume_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkUnstructuredGridAlgorithm.h [NewLine] class vtkCellData ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDataArray"
discard "forward decl of vtkIdList"
discard "forward decl of vtkImplicitFunction"
discard "forward decl of vtkMergePoints"
discard "forward decl of vtkOrderedTriangulator"
discard "forward decl of vtkPointData"
discard "forward decl of vtkIncrementalPointLocator"
discard "forward decl of vtkPoints"
discard "forward decl of vtkUnstructuredGrid"
discard "forward decl of vtkCell"
discard "forward decl of vtkTetra"
discard "forward decl of vtkCellArray"
discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkUnsignedCharArray"
## !!!Ignored construct:  class VTKFILTERSGENERAL_EXPORT vtkClipVolume : public vtkUnstructuredGridAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkUnstructuredGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkUnstructuredGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkClipVolume :: IsTypeOf ( type ) ; } static vtkClipVolume * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkClipVolume * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkClipVolume * NewInstance ( ) const { return vtkClipVolume :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkClipVolume :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkClipVolume :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct with user-specified implicit function; InsideOut turned off;
##  value set to 0.0; and generate clip scalars turned off.
##  static vtkClipVolume * New ( ) ; /@{ *
##  Set the clipping value of the implicit function (if clipping with
##  implicit function) or scalar value (if clipping with scalars). The
##  default value is 0.0.
##  virtual void SetValue ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Value  to  << _arg ) ; if ( this -> Value != _arg ) { this -> Value = _arg ; this -> Modified ( ) ; } } ; virtual double GetValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Value  of  << this -> Value ) ; return this -> Value ; } ; /@} /@{ *
##  Set/Get the InsideOut flag. When off, a vertex is considered inside the
##  implicit function if its value is greater than the Value ivar. When
##  InsideOutside is turned on, a vertex is considered inside the implicit
##  function if its implicit function value is less than or equal to the
##  Value ivar.  InsideOut is off by default.
##  virtual void SetValueInsideOut ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  InsideOut  to  << _arg ) ; if ( this -> InsideOut != _arg ) { this -> InsideOut = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetValueInsideOut ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InsideOut  of  << this -> InsideOut ) ; return this -> InsideOut ; } ; virtual void InsideOutOn ( ) { this -> SetInsideOut ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void InsideOutOff ( ) { this -> SetInsideOut ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify the implicit function with which to perform the clipping. If you
##  do not define an implicit function, then the input scalar data will be
##  used for clipping.
##  virtual void SetClipFunction ( vtkImplicitFunction * ) ; virtual vtkImplicitFunction * GetnameClipFunction ( ) { vtkDebugWithObjectMacro ( this , <<  returning  ClipFunction  address  << static_cast < vtkImplicitFunction * > ( this -> ClipFunction ) ) ; return this -> ClipFunction ; } ; /@} /@{ *
##  If this flag is enabled, then the output scalar values will be
##  interpolated from the implicit function values, and not the
##  input scalar data. If you enable this flag but do not provide an
##  implicit function an error will be reported.
##  virtual void SetValueInsideOutGenerateClipScalars ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateClipScalars  to  << _arg ) ; if ( this -> GenerateClipScalars != _arg ) { this -> GenerateClipScalars = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetValueInsideOutGenerateClipScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateClipScalars  of  << this -> GenerateClipScalars ) ; return this -> GenerateClipScalars ; } ; virtual void GenerateClipScalarsOn ( ) { this -> SetInsideOutGenerateClipScalars ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GenerateClipScalarsOff ( ) { this -> SetInsideOutGenerateClipScalars ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Control whether a second output is generated. The second output
##  contains the unstructured grid that's been clipped away.
##  virtual void SetValueInsideOutGenerateClipScalarsGenerateClippedOutput ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateClippedOutput  to  << _arg ) ; if ( this -> GenerateClippedOutput != _arg ) { this -> GenerateClippedOutput = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetValueInsideOutGenerateClipScalarsGenerateClippedOutput ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateClippedOutput  of  << this -> GenerateClippedOutput ) ; return this -> GenerateClippedOutput ; } ; virtual void GenerateClippedOutputOn ( ) { this -> SetInsideOutGenerateClipScalarsGenerateClippedOutput ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GenerateClippedOutputOff ( ) { this -> SetInsideOutGenerateClipScalarsGenerateClippedOutput ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} *
##  Return the clipped output.
##  vtkUnstructuredGrid * GetClippedOutput ( ) ; /@{ *
##  Control whether the filter produces a mix of 3D cell types on output, or
##  whether the output cells are all tetrahedra. By default, a mixed set of
##  cells (e.g., tetrahedra and wedges) is produced. (Note: mixed type
##  generation is faster and less overall data is generated.)
##  virtual void SetValueInsideOutGenerateClipScalarsGenerateClippedOutputMixed3DCellGeneration ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Mixed3DCellGeneration  to  << _arg ) ; if ( this -> Mixed3DCellGeneration != _arg ) { this -> Mixed3DCellGeneration = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetValueInsideOutGenerateClipScalarsGenerateClippedOutputMixed3DCellGeneration ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Mixed3DCellGeneration  of  << this -> Mixed3DCellGeneration ) ; return this -> Mixed3DCellGeneration ; } ; virtual void Mixed3DCellGenerationOn ( ) { this -> SetInsideOutGenerateClipScalarsGenerateClippedOutputMixed3DCellGeneration ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void Mixed3DCellGenerationOff ( ) { this -> SetInsideOutGenerateClipScalarsGenerateClippedOutputMixed3DCellGeneration ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set the tolerance for merging clip intersection points that are near
##  the corners of voxels. This tolerance is used to prevent the generation
##  of degenerate tetrahedra.
##  virtual void SetMergeTolerance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << MergeTolerance  to  << _arg ) ; if ( this -> MergeTolerance != ( _arg < 0.0001 ? 0.0001 : ( _arg > 0.25 ? 0.25 : _arg ) ) ) { this -> MergeTolerance = ( _arg < 0.0001 ? 0.0001 : ( _arg > 0.25 ? 0.25 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetMergeToleranceMinValue ( ) { return 0.0001 ; } virtual double GetMergeToleranceMaxValue ( ) { return 0.25 ; } ; virtual double GetValueInsideOutGenerateClipScalarsGenerateClippedOutputMixed3DCellGenerationMergeTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MergeTolerance  of  << this -> MergeTolerance ) ; return this -> MergeTolerance ; } ; /@} /@{ *
##  Set / Get a spatial locator for merging points. By default,
##  an instance of vtkMergePoints is used.
##  void SetLocator ( vtkIncrementalPointLocator * locator ) ; virtual vtkIncrementalPointLocator * GetnameClipFunctionLocator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Locator  address  << static_cast < vtkIncrementalPointLocator * > ( this -> Locator ) ) ; return this -> Locator ; } ; /@} *
##  Create default locator. Used to create one when none is specified. The
##  locator is used to merge coincident points.
##  void CreateDefaultLocator ( ) ; *
##  Return the mtime also considering the locator and clip function.
##  vtkMTimeType GetMTime ( ) override ; protected : vtkClipVolume ( vtkImplicitFunction * cf = nullptr ) ; ~ vtkClipVolume ( ) override ; void ReportReferences ( vtkGarbageCollector * ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; void ClipTets ( double value , vtkTetra * clipTetra , vtkDataArray * clipScalars , vtkDataArray * cellScalars , vtkIdList * tetraIds , vtkPoints * tetraPts , vtkPointData * inPD , vtkPointData * outPD , vtkCellData * inCD , vtkIdType cellId , vtkCellData * outCD , vtkCellData * clippedCD , int insideOut ) ; void ClipVoxel ( double value , vtkDataArray * cellScalars , int flip , double origin [ 3 ] , double spacing [ 3 ] , vtkIdList * cellIds , vtkPoints * cellPts , vtkPointData * inPD , vtkPointData * outPD , vtkCellData * inCD , vtkIdType cellId , vtkCellData * outCD , vtkCellData * clippedCD ) ; vtkImplicitFunction * ClipFunction ; vtkIncrementalPointLocator * Locator ; vtkTypeBool InsideOut ; double Value ; vtkTypeBool GenerateClipScalars ; double MergeTolerance ; vtkTypeBool Mixed3DCellGeneration ; vtkTypeBool GenerateClippedOutput ; vtkUnstructuredGrid * ClippedOutput ; private : vtkOrderedTriangulator * Triangulator ;  Used temporarily to pass data around vtkIdType NumberOfCells ; vtkCellArray * Connectivity ; vtkUnsignedCharArray * Types ; vtkIdType NumberOfClippedCells ; vtkCellArray * ClippedConnectivity ; vtkUnsignedCharArray * ClippedTypes ; private : vtkClipVolume ( const vtkClipVolume & ) = delete ; void operator = ( const vtkClipVolume & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
