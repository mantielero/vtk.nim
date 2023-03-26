## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTableBasedClipDataSet.h
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
## ****************************************************************************
##
##  Copyright (c) 2000 - 2009, Lawrence Livermore National Security, LLC
##  Produced at the Lawrence Livermore National Laboratory
##  LLNL-CODE-400124
##  All rights reserved.
##
##  This file was adapted from the VisIt clipper (vtkVisItClipper). For  details,
##  see https://visit.llnl.gov/.  The full copyright notice is contained in the
##  file COPYRIGHT located at the root of the VisIt distribution or at
##  http://www.llnl.gov/visit/copyright.html.
##
## ***************************************************************************
## *
##  @class   vtkTableBasedClipDataSet
##  @brief   Clip any dataset with a user-specified
##   implicit function or an input scalar point data array.
##
##
##   vtkTableBasedClipDataSet is a filter that clips any type of dataset using
##   either any subclass of vtkImplicitFunction or an input scalar point data
##   array. Clipping means that it actually "cuts" through the cells of the
##   dataset, returning everything outside the specified implicit function (or
##   greater than the scalar value) including "pieces" of a cell (Note to compare
##   this with vtkExtractGeometry, which pulls out entire, uncut cells). The
##   output of this filter is a vtkUnstructuredGrid data.
##
##   To use this filter, you need to decide whether an implicit function or an
##   input scalar point data array is used for clipping. For the former case,
##   1) define an implicit function
##   2) provide it to this filter via SetClipFunction()
##   If a clipping function is not specified, or GenerateClipScalars is off( the
##   default), the input scalar point data array is then employed for clipping.
##
##   You can also specify a scalar (iso-)value, which is used to decide what is
##   inside and outside the implicit function. You can also reverse the sense of
##   what inside/outside is by setting IVAR InsideOut. The clipping algorithm
##   proceeds by computing an implicit function value or using the input scalar
##   point data value for each point in the dataset. This is compared against the
##   scalar (iso-)value to determine the inside/outside status.
##
##   Although this filter sometimes (but rarely) may resort to the sibling class
##   vtkClipDataSet for handling some special grids (such as cylinders or cones
##   with capping faces in the form of a vtkPolyData), it itself is able to deal
##   with most grids. It is worth mentioning that vtkTableBasedClipDataSet is
##   capable of addressing the artifacts that may occur with vtkClipDataSet due
##   to the possibly inconsistent triangulation modes between neighboring cells.
##   In addition, the former is much faster than the latter. Furthermore, the
##   former produces less cells (with ratio usually being 5~6) than by the latter
##   in the output. In other words, this filter retains the original cells (i.e.,
##   without triangulation / tetrahedralization) wherever possible. All these
##   advantages are gained by adopting the unique clipping and triangulation tables
##   proposed by VisIt.
##
##  @warning
##   vtkTableBasedClipDataSet makes use of a hash table (that is provided by class
##   maintained by internal class vtkTableBasedClipperDataSetFromVolume) to achieve
##   rapid removal of duplicate points. The hash-based mechanism simply compares the
##   point Ids, without considering the actual inter-point distance (vtkClipDataSet
##   adopts vtkMergePoints that though considers the inter-point distance for robust
##   points merging ). As a result, some duplicate points may be present in the output.
##   This problem occurs when some boundary (cut-through cells) happen to have faces
##   EXACTLY aligned with the clipping plane (such as Plane, Box, or other implicit
##   functions with planar shapes). The occurrence (though very rare) of duplicate
##   points produces degenerate cells, which can be fixed by post-processing the
##   output with a filter like vtkCleanGrid.
##
##  @par Thanks:
##   This filter was adapted from the VisIt clipper (vtkVisItClipper).
##
##  @sa
##   vtkClipDataSet vtkClipVolume vtkClipPolyData vtkCutter vtkImplicitFunction
##

## !!!Ignored construct:  # vtkTableBasedClipDataSet_h [NewLine] # vtkTableBasedClipDataSet_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkUnstructuredGridAlgorithm.h [NewLine] class vtkCallbackCommand ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkImplicitFunction"
discard "forward decl of vtkIncrementalPointLocator"
## !!!Ignored construct:  class VTKFILTERSGENERAL_EXPORT vtkTableBasedClipDataSet : public vtkUnstructuredGridAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkUnstructuredGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkUnstructuredGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkTableBasedClipDataSet :: IsTypeOf ( type ) ; } static vtkTableBasedClipDataSet * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkTableBasedClipDataSet * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkTableBasedClipDataSet * NewInstance ( ) const { return vtkTableBasedClipDataSet :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTableBasedClipDataSet :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTableBasedClipDataSet :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Create an instance with a user-specified implicit function, turning off
##  IVARs InsideOut and GenerateClipScalars and setting IVAR Value to 0.0.
##  static vtkTableBasedClipDataSet * New ( ) ; *
##  Get the MTime for which the point locator and clip function are considered.
##  vtkMTimeType GetMTime ( ) override ; /@{ *
##  Set/Get the InsideOut flag. With this flag off, a vertex is considered
##  inside (the implicit function or the isosurface) if the (function or scalar)
##  value is greater than IVAR Value. With this flag on, a vertex is considered
##  inside (the implicit function or the isosurface) if the (function or scalar)
##  value is less than or equal to IVAR Value. This flag is off by default.
##  virtual void SetInsideOut ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  InsideOut  to  << _arg ) ; if ( this -> InsideOut != _arg ) { this -> InsideOut = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetInsideOut ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InsideOut  of  << this -> InsideOut ) ; return this -> InsideOut ; } ; virtual void InsideOutOn ( ) { this -> SetInsideOut ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void InsideOutOff ( ) { this -> SetInsideOut ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the clipping value of the implicit function (if an implicit function
##  is applied) or scalar data array (if a scalar data array is used), with 0.0
##  as the default value. This value is ignored if flag UseValueAsOffset is true
##  AND a clip function is defined.
##  virtual void SetInsideOutValue ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Value  to  << _arg ) ; if ( this -> Value != _arg ) { this -> Value = _arg ; this -> Modified ( ) ; } } ; virtual double GetInsideOutValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Value  of  << this -> Value ) ; return this -> Value ; } ; /@} /@{ *
##  Set/Get flag UseValueAsOffset, with true as the default value. With this flag
##  on, IVAR Value is used as an offset parameter to the implicit function. Value
##  is used only when clipping using a scalar array.
##  virtual void SetInsideOutValueUseValueAsOffset ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseValueAsOffset  to  << _arg ) ; if ( this -> UseValueAsOffset != _arg ) { this -> UseValueAsOffset = _arg ; this -> Modified ( ) ; } } ; virtual bool GetInsideOutValueUseValueAsOffset ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseValueAsOffset  of  << this -> UseValueAsOffset ) ; return this -> UseValueAsOffset ; } ; virtual void UseValueAsOffsetOn ( ) { this -> SetInsideOutUseValueAsOffset ( static_cast < bool > ( 1 ) ) ; } virtual void UseValueAsOffsetOff ( ) { this -> SetInsideOutUseValueAsOffset ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the implicit function with which to perform the clipping operation.
##  Unless an implicit function is defined, the specified input scalar data will
##  be used for clipping.
##  virtual void SetClipFunction ( vtkImplicitFunction * ) ; virtual vtkImplicitFunction * GetnameClipFunction ( ) { vtkDebugWithObjectMacro ( this , <<  returning  ClipFunction  address  << static_cast < vtkImplicitFunction * > ( this -> ClipFunction ) ) ; return this -> ClipFunction ; } ; /@} /@{ *
##  Set/Get flag GenerateClipScalars, with 0 as the default value. With this
##  flag on, the scalar point data values obtained by evaluating the implicit
##  function will be exported to the output. Note that this flag requiries that
##  an implicit function be provided.
##  virtual void SetInsideOutValueUseValueAsOffsetGenerateClipScalars ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateClipScalars  to  << _arg ) ; if ( this -> GenerateClipScalars != _arg ) { this -> GenerateClipScalars = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetInsideOutValueUseValueAsOffsetGenerateClipScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateClipScalars  of  << this -> GenerateClipScalars ) ; return this -> GenerateClipScalars ; } ; virtual void GenerateClipScalarsOn ( ) { this -> SetInsideOutUseValueAsOffsetGenerateClipScalars ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GenerateClipScalarsOff ( ) { this -> SetInsideOutUseValueAsOffsetGenerateClipScalars ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get a point locator locator for merging duplicate points. By default,
##  an instance of vtkMergePoints is used. Note that this IVAR is provided
##  in this class only because this filter may resort to its sibling class
##  vtkClipDataSet when processing some special grids (such as cylinders or
##  cones with capping faces in the form of a vtkPolyData) while the latter
##  requires a point locator. This filter itself does not need a locator.
##  void SetLocator ( vtkIncrementalPointLocator * locator ) ; virtual vtkIncrementalPointLocator * GetnameClipFunctionLocator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Locator  address  << static_cast < vtkIncrementalPointLocator * > ( this -> Locator ) ) ; return this -> Locator ; } ; /@} /@{ *
##  Set/Get the tolerance used for merging duplicate points near the clipping
##  intersection cells. This tolerance may prevent the generation of degenerate
##  primitives. Note that only 3D cells actually use this IVAR.
##  virtual void SetMergeTolerance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << MergeTolerance  to  << _arg ) ; if ( this -> MergeTolerance != ( _arg < 0.0001 ? 0.0001 : ( _arg > 0.25 ? 0.25 : _arg ) ) ) { this -> MergeTolerance = ( _arg < 0.0001 ? 0.0001 : ( _arg > 0.25 ? 0.25 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetMergeToleranceMinValue ( ) { return 0.0001 ; } virtual double GetMergeToleranceMaxValue ( ) { return 0.25 ; } ; virtual double GetInsideOutValueUseValueAsOffsetGenerateClipScalarsMergeTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MergeTolerance  of  << this -> MergeTolerance ) ; return this -> MergeTolerance ; } ; /@} *
##  Create a default point locator when none is specified. The point locator is
##  used to merge coincident points.
##  void CreateDefaultLocator ( ) ; /@{ *
##  Set/Get whether a second output is generated. The second output contains the
##  polygonal data that is clipped away by the iso-surface.
##  virtual void SetInsideOutValueUseValueAsOffsetGenerateClipScalarsGenerateClippedOutput ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateClippedOutput  to  << _arg ) ; if ( this -> GenerateClippedOutput != _arg ) { this -> GenerateClippedOutput = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetInsideOutValueUseValueAsOffsetGenerateClipScalarsMergeToleranceGenerateClippedOutput ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateClippedOutput  of  << this -> GenerateClippedOutput ) ; return this -> GenerateClippedOutput ; } ; virtual void GenerateClippedOutputOn ( ) { this -> SetInsideOutUseValueAsOffsetGenerateClipScalarsGenerateClippedOutput ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GenerateClippedOutputOff ( ) { this -> SetInsideOutUseValueAsOffsetGenerateClipScalarsGenerateClippedOutput ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} *
##  Return the clipped output.
##  vtkUnstructuredGrid * GetClippedOutput ( ) ; /@{ *
##  Set/get the desired precision for the output types. See the documentation
##  for the vtkAlgorithm::Precision enum for an explanation of the available
##  precision settings.
##  virtual void SetMergeToleranceOutputPointsPrecision ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << OutputPointsPrecision  to  << _arg ) ; if ( this -> OutputPointsPrecision != ( _arg < SINGLE_PRECISION ? SINGLE_PRECISION : ( _arg > DEFAULT_PRECISION ? DEFAULT_PRECISION : _arg ) ) ) { this -> OutputPointsPrecision = ( _arg < SINGLE_PRECISION ? SINGLE_PRECISION : ( _arg > DEFAULT_PRECISION ? DEFAULT_PRECISION : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetMergeToleranceMinValueOutputPointsPrecisionMinValue ( ) { return SINGLE_PRECISION ; } virtual int GetMergeToleranceMaxValueOutputPointsPrecisionMaxValue ( ) { return DEFAULT_PRECISION ; } ; virtual int GetInsideOutValueUseValueAsOffsetGenerateClipScalarsMergeToleranceGenerateClippedOutputOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ; /@} protected : vtkTableBasedClipDataSet ( vtkImplicitFunction * cf = nullptr ) ; ~ vtkTableBasedClipDataSet ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; *
##  This function resorts to the sibling class vtkClipDataSet to handle
##  special grids (such as cylinders or cones with capping faces in the
##  form a vtkPolyData).
##  void ClipDataSet ( vtkDataSet * pDataSet , vtkDataArray * clipAray , vtkUnstructuredGrid * unstruct ) ; *
##  This function takes a vtkImageData as a vtkRectilinearGrid, which is then
##  clipped by ClipRectilinearGridData(......).
##  void ClipImageData ( vtkDataSet * inputGrd , vtkDataArray * clipAray , double isoValue , vtkUnstructuredGrid * outputUG ) ; *
##  This function clips a vtkPolyData object based on a specified iso-value
##  (isoValue) using a scalar point data array (clipAray) that is either just an
##  input scalar point data array or the result of evaluating an implicit function
##  (provided via SetClipFunction()). The clipping result is exported to outputUG.
##  void ClipPolyData ( vtkDataSet * inputGrd , vtkDataArray * clipAray , double isoValue , vtkUnstructuredGrid * outputUG ) ; *
##  This function clips a vtkRectilinearGrid based on a specified iso-value
##  (isoValue) using a scalar point data array (clipAray) that is either just an
##  input scalar point data array or the result of evaluating an implicit function
##  (provided via SetClipFunction()). The clipping result is exported to outputUG.
##  void ClipRectilinearGridData ( vtkDataSet * inputGrd , vtkDataArray * clipAray , double isoValue , vtkUnstructuredGrid * outputUG ) ; *
##  This function clips a vtkStructuredGrid based on a specified iso-value
##  (isoValue) using a scalar point data array (clipAray) that is either just an
##  input scalar point data array or the result of evaluating an implicit function
##  (provided via SetClipFunction()). The clipping result is exported to outputUG.
##  void ClipStructuredGridData ( vtkDataSet * inputGrd , vtkDataArray * clipAray , double isoValue , vtkUnstructuredGrid * outputUG ) ; *
##  This function clips a vtkUnstructuredGrid based on a specified iso-value
##  (isoValue) using a scalar point data array (clipAray) that is either just an
##  input scalar point data array or the result of evaluating an implicit function
##  (provided via SetClipFunction()). The clipping result is exported to outputUG.
##  void ClipUnstructuredGridData ( vtkDataSet * inputGrd , vtkDataArray * clipAray , double isoValue , vtkUnstructuredGrid * outputUG ) ; *
##  Register a callback function with the InternalProgressObserver.
##  static void InternalProgressCallbackFunction ( vtkObject * , unsigned long , void * clientdata , void * ) ; *
##  The actual operation executed by the callback function.
##  void InternalProgressCallback ( vtkAlgorithm * algorithm ) ; vtkTypeBool InsideOut ; vtkTypeBool GenerateClipScalars ; vtkTypeBool GenerateClippedOutput ; bool UseValueAsOffset ; double Value ; double MergeTolerance ; vtkCallbackCommand * InternalProgressObserver ; vtkImplicitFunction * ClipFunction ; vtkIncrementalPointLocator * Locator ; int OutputPointsPrecision ; private : vtkTableBasedClipDataSet ( const vtkTableBasedClipDataSet & ) = delete ; void operator = ( const vtkTableBasedClipDataSet & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
