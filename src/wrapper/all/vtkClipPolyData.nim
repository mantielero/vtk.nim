## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkClipPolyData.h
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
##  @class   vtkClipPolyData
##  @brief   clip polygonal data with user-specified implicit function or input scalar data
##
##  vtkClipPolyData is a filter that clips polygonal data using either
##  any subclass of vtkImplicitFunction, or the input scalar
##  data. Clipping means that it actually "cuts" through the cells of
##  the dataset, returning everything inside of the specified implicit
##  function (or greater than the scalar value) including "pieces" of
##  a cell. (Compare this with vtkExtractGeometry, which pulls out
##  entire, uncut cells.) The output of this filter is polygonal data.
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
##  You can also specify a scalar value, which is used to
##  decide what is inside and outside of the implicit function. You can
##  also reverse the sense of what inside/outside is by setting the
##  InsideOut instance variable. (The cutting algorithm proceeds by
##  computing an implicit function value or using the input scalar data
##  for each point in the dataset. This is compared to the scalar value
##  to determine inside/outside.)
##
##  This filter can be configured to compute a second output. The
##  second output is the polygonal data that is clipped away. Set the
##  GenerateClippedData boolean on if you wish to access this output data.
##
##  @warning
##  In order to cut all types of cells in polygonal data, vtkClipPolyData
##  triangulates some cells, and then cuts the resulting simplices
##  (i.e., points, lines, and triangles). This means that the resulting
##  output may consist of different cell types than the input data.
##
##  @sa
##  vtkImplicitFunction vtkCutter vtkClipVolume vtkExtractGeometry
##

## !!!Ignored construct:  # vtkClipPolyData_h [NewLine] # vtkClipPolyData_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class vtkImplicitFunction ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkIncrementalPointLocator"
## !!!Ignored construct:  class VTKFILTERSCORE_EXPORT vtkClipPolyData : public vtkPolyDataAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkClipPolyData :: IsTypeOf ( type ) ; } static vtkClipPolyData * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkClipPolyData * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkClipPolyData * NewInstance ( ) const { return vtkClipPolyData :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkClipPolyData :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkClipPolyData :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct with user-specified implicit function; InsideOut turned off;
##  value set to 0.0; GenerateClipScalars turned off; GenerateClippedOutput
##  turned off.
##  static vtkClipPolyData * New ( ) ; /@{ *
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
##  clipping. If you do not define an implicit function, then the input
##  scalar data will be used for clipping.
##  virtual void SetClipFunction ( vtkImplicitFunction * ) ; virtual vtkImplicitFunction * GetnameClipFunction ( ) { vtkDebugWithObjectMacro ( this , <<  returning  ClipFunction  address  << static_cast < vtkImplicitFunction * > ( this -> ClipFunction ) ) ; return this -> ClipFunction ; } ; /@} /@{ *
##  If this flag is enabled, then the output scalar values will be
##  interpolated from the implicit function values, and not the
##  input scalar data. If you enable this flag but do not provide an
##  implicit function an error will be reported.
##  GenerateClipScalars is off by default.
##  virtual void SetValueInsideOutGenerateClipScalars ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateClipScalars  to  << _arg ) ; if ( this -> GenerateClipScalars != _arg ) { this -> GenerateClipScalars = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetValueInsideOutGenerateClipScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateClipScalars  of  << this -> GenerateClipScalars ) ; return this -> GenerateClipScalars ; } ; virtual void GenerateClipScalarsOn ( ) { this -> SetInsideOutGenerateClipScalars ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GenerateClipScalarsOff ( ) { this -> SetInsideOutGenerateClipScalars ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Control whether a second output is generated. The second output
##  contains the polygonal data that's been clipped away.
##  GenerateClippedOutput is off by default.
##  virtual void SetValueInsideOutGenerateClipScalarsGenerateClippedOutput ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateClippedOutput  to  << _arg ) ; if ( this -> GenerateClippedOutput != _arg ) { this -> GenerateClippedOutput = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetValueInsideOutGenerateClipScalarsGenerateClippedOutput ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateClippedOutput  of  << this -> GenerateClippedOutput ) ; return this -> GenerateClippedOutput ; } ; virtual void GenerateClippedOutputOn ( ) { this -> SetInsideOutGenerateClipScalarsGenerateClippedOutput ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GenerateClippedOutputOff ( ) { this -> SetInsideOutGenerateClipScalarsGenerateClippedOutput ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} *
##  Return the Clipped output.
##  vtkPolyData * GetClippedOutput ( ) ; *
##  Return the output port (a vtkAlgorithmOutput) of the clipped output.
##  vtkAlgorithmOutput * GetClippedOutputPort ( ) { return this -> GetOutputPort ( 1 ) ; } /@{ *
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
##  the available precision settings. OutputPointsPrecision is DEFAULT_PRECISION
##  by default.
##  virtual void SetValueInsideOutGenerateClipScalarsGenerateClippedOutputOutputPointsPrecision ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputPointsPrecision  to  << _arg ) ; if ( this -> OutputPointsPrecision != _arg ) { this -> OutputPointsPrecision = _arg ; this -> Modified ( ) ; } } ; virtual int GetValueInsideOutGenerateClipScalarsGenerateClippedOutputOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ; /@} protected : vtkClipPolyData ( vtkImplicitFunction * cf = nullptr ) ; ~ vtkClipPolyData ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; vtkImplicitFunction * ClipFunction ; vtkIncrementalPointLocator * Locator ; vtkTypeBool InsideOut ; double Value ; vtkTypeBool GenerateClipScalars ; vtkTypeBool GenerateClippedOutput ; int OutputPointsPrecision ; private : vtkClipPolyData ( const vtkClipPolyData & ) = delete ; void operator = ( const vtkClipPolyData & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
