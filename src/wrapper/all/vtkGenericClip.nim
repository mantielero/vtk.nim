## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGenericClip.h
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
##  @class   vtkGenericClip
##  @brief   clip any dataset with an implicit function or scalar data
##
##  vtkGenericClip is a filter that any type of dataset using either
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
##  This filter has been implemented to operate on generic datasets, rather
##  than the typical vtkDataSet (and subclasses). vtkGenericDataSet is a more
##  complex cousin of vtkDataSet, typically consisting of nonlinear,
##  higher-order cells. To process this type of data, generic cells are
##  automatically tessellated into linear cells prior to isocontouring.
##
##  @sa
##  vtkClipDataSet vtkClipPolyData vtkClipVolume vtkImplicitFunction
##  vtkGenericDataSet
##

## !!!Ignored construct:  # vtkGenericClip_h [NewLine] # vtkGenericClip_h [NewLine] # vtkFiltersGenericModule.h  For export macro # vtkUnstructuredGridAlgorithm.h [NewLine] class vtkImplicitFunction ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPointData"
discard "forward decl of vtkCellData"
discard "forward decl of vtkIncrementalPointLocator"
## !!!Ignored construct:  class VTKFILTERSGENERIC_EXPORT vtkGenericClip : public vtkUnstructuredGridAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkUnstructuredGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkUnstructuredGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkGenericClip :: IsTypeOf ( type ) ; } static vtkGenericClip * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkGenericClip * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkGenericClip * NewInstance ( ) const { return vtkGenericClip :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGenericClip :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGenericClip :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct with user-specified implicit function; InsideOut turned off;
##  value set to 0.0; and generate clip scalars turned off.
##  static vtkGenericClip * New ( ) ; /@{ *
##  Set the clipping value of the implicit function (if clipping with
##  implicit function) or scalar value (if clipping with
##  scalars). The default value is 0.0.
##  virtual void SetValue ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Value  to  << _arg ) ; if ( this -> Value != _arg ) { this -> Value = _arg ; this -> Modified ( ) ; } } ; virtual double GetValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Value  of  << this -> Value ) ; return this -> Value ; } ; /@} /@{ *
##  Set/Get the InsideOut flag. When off, a vertex is considered
##  inside the implicit function if its value is greater than the
##  Value ivar. When InsideOutside is turned on, a vertex is
##  considered inside the implicit function if its implicit function
##  value is less than or equal to the Value ivar.  InsideOut is off
##  by default.
##  virtual void SetValueInsideOut ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  InsideOut  to  << _arg ) ; if ( this -> InsideOut != _arg ) { this -> InsideOut = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetValueInsideOut ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InsideOut  of  << this -> InsideOut ) ; return this -> InsideOut ; } ; virtual void InsideOutOn ( ) { this -> SetInsideOut ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void InsideOutOff ( ) { this -> SetInsideOut ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify the implicit function with which to perform the
##  clipping. If you do not define an implicit function,
##  then the selected input scalar data will be used for clipping.
##  virtual void SetClipFunction ( vtkImplicitFunction * ) ; virtual vtkImplicitFunction * GetnameClipFunction ( ) { vtkDebugWithObjectMacro ( this , <<  returning  ClipFunction  address  << static_cast < vtkImplicitFunction * > ( this -> ClipFunction ) ) ; return this -> ClipFunction ; } ; /@} /@{ *
##  If this flag is enabled, then the output scalar values will be
##  interpolated from the implicit function values, and not the
##  input scalar data. If you enable this flag but do not provide an
##  implicit function an error will be reported.
##  virtual void SetValueInsideOutGenerateClipScalars ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateClipScalars  to  << _arg ) ; if ( this -> GenerateClipScalars != _arg ) { this -> GenerateClipScalars = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetValueInsideOutGenerateClipScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateClipScalars  of  << this -> GenerateClipScalars ) ; return this -> GenerateClipScalars ; } ; virtual void GenerateClipScalarsOn ( ) { this -> SetInsideOutGenerateClipScalars ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GenerateClipScalarsOff ( ) { this -> SetInsideOutGenerateClipScalars ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Control whether a second output is generated. The second output
##  contains the polygonal data that's been clipped away.
##  virtual void SetValueInsideOutGenerateClipScalarsGenerateClippedOutput ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateClippedOutput  to  << _arg ) ; if ( this -> GenerateClippedOutput != _arg ) { this -> GenerateClippedOutput = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetValueInsideOutGenerateClipScalarsGenerateClippedOutput ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateClippedOutput  of  << this -> GenerateClippedOutput ) ; return this -> GenerateClippedOutput ; } ; virtual void GenerateClippedOutputOn ( ) { this -> SetInsideOutGenerateClipScalarsGenerateClippedOutput ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GenerateClippedOutputOff ( ) { this -> SetInsideOutGenerateClipScalarsGenerateClippedOutput ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set the tolerance for merging clip intersection points that are near
##  the vertices of cells. This tolerance is used to prevent the generation
##  of degenerate primitives. Note that only 3D cells actually use this
##  instance variable.
##  virtual void SetMergeTolerance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << MergeTolerance  to  << _arg ) ; if ( this -> MergeTolerance != ( _arg < 0.0001 ? 0.0001 : ( _arg > 0.25 ? 0.25 : _arg ) ) ) { this -> MergeTolerance = ( _arg < 0.0001 ? 0.0001 : ( _arg > 0.25 ? 0.25 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetMergeToleranceMinValue ( ) { return 0.0001 ; } virtual double GetMergeToleranceMaxValue ( ) { return 0.25 ; } ; virtual double GetValueInsideOutGenerateClipScalarsGenerateClippedOutputMergeTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MergeTolerance  of  << this -> MergeTolerance ) ; return this -> MergeTolerance ; } ; /@} /@{ *
##  Return the Clipped output.
##  vtkUnstructuredGrid * GetClippedOutput ( ) ; virtual int GetNumberOfOutputs ( ) ; /@} /@{ *
##  Specify a spatial locator for merging points. By default, an
##  instance of vtkMergePoints is used.
##  void SetLocator ( vtkIncrementalPointLocator * locator ) ; virtual vtkIncrementalPointLocator * GetnameClipFunctionLocator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Locator  address  << static_cast < vtkIncrementalPointLocator * > ( this -> Locator ) ) ; return this -> Locator ; } ; /@} *
##  Create default locator. Used to create one when none is specified. The
##  locator is used to merge coincident points.
##  void CreateDefaultLocator ( ) ; *
##  Return the mtime also considering the locator and clip function.
##  vtkMTimeType GetMTime ( ) override ; /@{ *
##  If you want to clip by an arbitrary array, then set its name here.
##  By default this in nullptr and the filter will use the active scalar array.
##  virtual char * GetInputScalarsSelection ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << InputScalarsSelection  of  << ( this -> InputScalarsSelection ? this -> InputScalarsSelection : (null) ) ) ; return this -> InputScalarsSelection ; } ; void SelectInputScalars ( const char * fieldName ) { this -> SetInputScalarsSelection ( fieldName ) ; } /@} protected : vtkGenericClip ( vtkImplicitFunction * cf = nullptr ) ; ~ vtkGenericClip ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int , vtkInformation * ) override ; vtkImplicitFunction * ClipFunction ; vtkIncrementalPointLocator * Locator ; vtkTypeBool InsideOut ; double Value ; vtkTypeBool GenerateClipScalars ; vtkTypeBool GenerateClippedOutput ; double MergeTolerance ; char * InputScalarsSelection ; virtual void SetInputScalarsSelection ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << InputScalarsSelection  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> InputScalarsSelection == nullptr && _arg == nullptr ) { return ; } if ( this -> InputScalarsSelection && _arg && ( ! strcmp ( this -> InputScalarsSelection , _arg ) ) ) { return ; } delete [ ] this -> InputScalarsSelection ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> InputScalarsSelection = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> InputScalarsSelection = nullptr ; } this -> Modified ( ) ; } ;  Used internal by vtkGenericAdaptorCell::Clip() vtkPointData * InternalPD ; vtkPointData * SecondaryPD ; vtkCellData * SecondaryCD ; private : vtkGenericClip ( const vtkGenericClip & ) = delete ; void operator = ( const vtkGenericClip & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
