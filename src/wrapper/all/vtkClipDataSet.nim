## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkClipDataSet.h
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
##  @class   vtkClipDataSet
##  @brief   clip any dataset with user-specified implicit function or input scalar data
##
##  vtkClipDataSet is a filter that clips any type of dataset using either
##  any subclass of vtkImplicitFunction, or the input scalar
##  data. Clipping means that it actually "cuts" through the cells of
##  the dataset, returning everything inside of the specified implicit
##  function (or greater than the scalar value) including "pieces" of
##  a cell. (Compare this with vtkExtractGeometry, which pulls out
##  entire, uncut cells.) The output of this filter is an unstructured
##  grid.
##
##  To use this filter, you must decide if you will be clipping with an
##  implicit function, or whether you will be using the input scalar
##  data.  If you want to clip with an implicit function, you must:
##  1) define an implicit function
##  2) set it with the SetClipFunction method
##  3) apply the GenerateClipScalarsOn method
##  If a ClipFunction is not specified, or GenerateClipScalars is off
##  (the default), then the input's scalar data will be used to clip
##  the polydata.
##
##  You can also specify a scalar value, which is used to decide what is
##  inside and outside of the implicit function. You can also reverse the
##  sense of what inside/outside is by setting the InsideOut instance
##  variable. (The clipping algorithm proceeds by computing an implicit
##  function value or using the input scalar data for each point in the
##  dataset. This is compared to the scalar value to determine
##  inside/outside.)
##
##  This filter can be configured to compute a second output. The
##  second output is the part of the cell that is clipped away. Set the
##  GenerateClippedData boolean on if you wish to access this output data.
##
##  @warning
##  vtkClipDataSet will triangulate all types of 3D cells (i.e., create
##  tetrahedra). This is true even if the cell is not actually cut. This
##  is necessary to preserve compatibility across face neighbors. 2D cells
##  will only be triangulated if the cutting function passes through them.
##
##  @sa
##  vtkImplicitFunction vtkCutter vtkClipVolume vtkClipPolyData
##

## !!!Ignored construct:  # vtkClipDataSet_h [NewLine] # vtkClipDataSet_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkUnstructuredGridAlgorithm.h [NewLine] class vtkCallbackCommand ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkImplicitFunction"
discard "forward decl of vtkIncrementalPointLocator"
## !!!Ignored construct:  class VTKFILTERSGENERAL_EXPORT vtkClipDataSet : public vtkUnstructuredGridAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkUnstructuredGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkUnstructuredGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkClipDataSet :: IsTypeOf ( type ) ; } static vtkClipDataSet * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkClipDataSet * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkClipDataSet * NewInstance ( ) const { return vtkClipDataSet :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkClipDataSet :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkClipDataSet :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct with user-specified implicit function; InsideOut turned off;
##  value set to 0.0; and generate clip scalars turned off.
##  static vtkClipDataSet * New ( ) ; /@{ *
##  Set the clipping value of the implicit function (if clipping with
##  implicit function) or scalar value (if clipping with
##  scalars). The default value is 0.0. This value is ignored if
##  UseValueAsOffset is true and a clip function is defined.
##  virtual void SetValue ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Value  to  << _arg ) ; if ( this -> Value != _arg ) { this -> Value = _arg ; this -> Modified ( ) ; } } ; virtual double GetValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Value  of  << this -> Value ) ; return this -> Value ; } ; /@} /@{ *
##  If UseValueAsOffset is true, Value is used as an offset parameter to
##  the implicit function. Otherwise, Value is used only when clipping
##  using a scalar array. Default is true.
##  virtual void SetValueUseValueAsOffset ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseValueAsOffset  to  << _arg ) ; if ( this -> UseValueAsOffset != _arg ) { this -> UseValueAsOffset = _arg ; this -> Modified ( ) ; } } ; virtual bool GetValueUseValueAsOffset ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseValueAsOffset  of  << this -> UseValueAsOffset ) ; return this -> UseValueAsOffset ; } ; virtual void UseValueAsOffsetOn ( ) { this -> SetUseValueAsOffset ( static_cast < bool > ( 1 ) ) ; } virtual void UseValueAsOffsetOff ( ) { this -> SetUseValueAsOffset ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the InsideOut flag. When off, a vertex is considered
##  inside the implicit function if its value is greater than the
##  Value ivar. When InsideOutside is turned on, a vertex is
##  considered inside the implicit function if its implicit function
##  value is less than or equal to the Value ivar.  InsideOut is off
##  by default.
##  virtual void SetValueUseValueAsOffsetInsideOut ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  InsideOut  to  << _arg ) ; if ( this -> InsideOut != _arg ) { this -> InsideOut = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetValueUseValueAsOffsetInsideOut ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InsideOut  of  << this -> InsideOut ) ; return this -> InsideOut ; } ; virtual void InsideOutOn ( ) { this -> SetUseValueAsOffsetInsideOut ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void InsideOutOff ( ) { this -> SetUseValueAsOffsetInsideOut ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify the implicit function with which to perform the
##  clipping. If you do not define an implicit function,
##  then the selected input scalar data will be used for clipping.
##  virtual void SetClipFunction ( vtkImplicitFunction * ) ; virtual vtkImplicitFunction * GetnameClipFunction ( ) { vtkDebugWithObjectMacro ( this , <<  returning  ClipFunction  address  << static_cast < vtkImplicitFunction * > ( this -> ClipFunction ) ) ; return this -> ClipFunction ; } ; /@} /@{ *
##  If this flag is enabled, then the output scalar values will be
##  interpolated from the implicit function values, and not the
##  input scalar data. If you enable this flag but do not provide an
##  implicit function an error will be reported.
##  virtual void SetValueUseValueAsOffsetInsideOutGenerateClipScalars ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateClipScalars  to  << _arg ) ; if ( this -> GenerateClipScalars != _arg ) { this -> GenerateClipScalars = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetValueUseValueAsOffsetInsideOutGenerateClipScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateClipScalars  of  << this -> GenerateClipScalars ) ; return this -> GenerateClipScalars ; } ; virtual void GenerateClipScalarsOn ( ) { this -> SetUseValueAsOffsetInsideOutGenerateClipScalars ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GenerateClipScalarsOff ( ) { this -> SetUseValueAsOffsetInsideOutGenerateClipScalars ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Control whether a second output is generated. The second output
##  contains the polygonal data that's been clipped away.
##  virtual void SetValueUseValueAsOffsetInsideOutGenerateClipScalarsGenerateClippedOutput ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateClippedOutput  to  << _arg ) ; if ( this -> GenerateClippedOutput != _arg ) { this -> GenerateClippedOutput = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetValueUseValueAsOffsetInsideOutGenerateClipScalarsGenerateClippedOutput ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateClippedOutput  of  << this -> GenerateClippedOutput ) ; return this -> GenerateClippedOutput ; } ; virtual void GenerateClippedOutputOn ( ) { this -> SetUseValueAsOffsetInsideOutGenerateClipScalarsGenerateClippedOutput ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GenerateClippedOutputOff ( ) { this -> SetUseValueAsOffsetInsideOutGenerateClipScalarsGenerateClippedOutput ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set the tolerance for merging clip intersection points that are near
##  the vertices of cells. This tolerance is used to prevent the generation
##  of degenerate primitives. Note that only 3D cells actually use this
##  instance variable.
##  virtual void SetMergeTolerance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << MergeTolerance  to  << _arg ) ; if ( this -> MergeTolerance != ( _arg < 0.0001 ? 0.0001 : ( _arg > 0.25 ? 0.25 : _arg ) ) ) { this -> MergeTolerance = ( _arg < 0.0001 ? 0.0001 : ( _arg > 0.25 ? 0.25 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetMergeToleranceMinValue ( ) { return 0.0001 ; } virtual double GetMergeToleranceMaxValue ( ) { return 0.25 ; } ; virtual double GetValueUseValueAsOffsetInsideOutGenerateClipScalarsGenerateClippedOutputMergeTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MergeTolerance  of  << this -> MergeTolerance ) ; return this -> MergeTolerance ; } ; /@} *
##  Return the Clipped output.
##  vtkUnstructuredGrid * GetClippedOutput ( ) ; /@{ *
##  Specify a spatial locator for merging points. By default, an
##  instance of vtkMergePoints is used.
##  void SetLocator ( vtkIncrementalPointLocator * locator ) ; virtual vtkIncrementalPointLocator * GetnameClipFunctionLocator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Locator  address  << static_cast < vtkIncrementalPointLocator * > ( this -> Locator ) ) ; return this -> Locator ; } ; /@} *
##  Create default locator. Used to create one when none is specified. The
##  locator is used to merge coincident points.
##  void CreateDefaultLocator ( ) ; *
##  Return the mtime also considering the locator and clip function.
##  vtkMTimeType GetMTime ( ) override ; /@{ *
##  Set/get the desired precision for the output types. See the documentation
##  for the vtkAlgorithm::DesiredOutputPrecision enum for an explanation of
##  the available precision settings.
##  virtual void SetMergeToleranceOutputPointsPrecision ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << OutputPointsPrecision  to  << _arg ) ; if ( this -> OutputPointsPrecision != ( _arg < SINGLE_PRECISION ? SINGLE_PRECISION : ( _arg > DEFAULT_PRECISION ? DEFAULT_PRECISION : _arg ) ) ) { this -> OutputPointsPrecision = ( _arg < SINGLE_PRECISION ? SINGLE_PRECISION : ( _arg > DEFAULT_PRECISION ? DEFAULT_PRECISION : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetMergeToleranceMinValueOutputPointsPrecisionMinValue ( ) { return SINGLE_PRECISION ; } virtual int GetMergeToleranceMaxValueOutputPointsPrecisionMaxValue ( ) { return DEFAULT_PRECISION ; } ; virtual int GetValueUseValueAsOffsetInsideOutGenerateClipScalarsGenerateClippedOutputMergeToleranceOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ; /@} protected : vtkClipDataSet ( vtkImplicitFunction * cf = nullptr ) ; ~ vtkClipDataSet ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; vtkImplicitFunction * ClipFunction ; vtkIncrementalPointLocator * Locator ; vtkTypeBool InsideOut ; double Value ; vtkTypeBool GenerateClipScalars ; vtkTypeBool GenerateClippedOutput ; double MergeTolerance ;  Callback registered with the InternalProgressObserver. static void InternalProgressCallbackFunction ( vtkObject * , unsigned long , void * clientdata , void * ) ; void InternalProgressCallback ( vtkAlgorithm * algorithm ) ;  The observer to report progress from the internal readers. vtkCallbackCommand * InternalProgressObserver ;  helper functions void ClipVolume ( vtkDataSet * input , vtkUnstructuredGrid * output ) ; int ClipPoints ( vtkDataSet * input , vtkUnstructuredGrid * output , vtkInformationVector * * inputVector ) ; bool UseValueAsOffset ; int OutputPointsPrecision ; private : vtkClipDataSet ( const vtkClipDataSet & ) = delete ; void operator = ( const vtkClipDataSet & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
