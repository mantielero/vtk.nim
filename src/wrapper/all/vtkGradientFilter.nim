## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGradientFilter.h
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
## ----------------------------------------------------------------------------
##  Copyright (c) Sandia Corporation
##  See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
## ----------------------------------------------------------------------------
## *
##  @class   vtkGradientFilter
##  @brief   A general filter for gradient estimation.
##
##
##  This filter estimates the gradient of a field in a data set.  The gradient
##  calculation is dependent on the input dataset type.  The created gradient
##  array is of the same type as the array it is calculated from (e.g. point
##  data or cell data) but the data type will be either float or double.  At
##  the boundary the gradient does not use central differencing.  The output
##  gradient array has 3*number of components of the input data array.  The
##  ordering for the output gradient tuple will be {du/dx, du/dy, du/dz,
##  dv/dx, dv/dy, dv/dz, dw/dx, dw/dy, dw/dz} for an input array {u, v,
##  w}. There are also the options to additionally compute the vorticity and Q
##  criterion of a vector field.  Unstructured grids and polydata can have
##  cells of different dimensions.  To handle different use cases in this
##  situation, the user can specify which cells contribute to the
##  computation. The options for this are All (default), Patch and
##  DataSetMax. Patch uses only the highest dimension cells attached to a
##  point. DataSetMax uses the highest cell dimension in the entire data
##  set. For Patch or DataSetMax it is possible that some values will not be
##  computed. The ReplacementValueOption specifies what to use for these
##  values.
##
##

## !!!Ignored construct:  # vtkGradientFilter_h [NewLine] # vtkGradientFilter_h [NewLine] # vtkDataSetAlgorithm.h [NewLine] # vtkFiltersGeneralModule.h  For export macro [NewLine] class vtkUnsignedCharArray ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSGENERAL_EXPORT vtkGradientFilter : public vtkDataSetAlgorithm { public : /@{ *
##  Standard methods for instantiation, obtaining type information, and printing.
##  static vtkGradientFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkGradientFilter :: IsTypeOf ( type ) ; } static vtkGradientFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkGradientFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkGradientFilter * NewInstance ( ) const { return vtkGradientFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGradientFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGradientFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} / Options to choose what cells contribute to the gradient calculation enum ContributingCellEnum { All = 0 , !< All cells Patch = 1 , !< Highest dimension cells in the patch of cells contributing to the calculation DataSetMax = 2 !< Highest dimension cells in the data set } ; / The replacement value or entities that don't have any gradient computed over them based on
## / the ContributingCellOption enum ReplacementValueEnum { Zero = 0 , !< 0 NaN = 1 , !< NaN DataTypeMin = 2 , !< The minimum possible value of the input array data type DataTypeMax = 3 !< The maximum possible value of the input array data type } ; /@{ *
##  These are basically a convenience method that calls SetInputArrayToProcess
##  to set the array used as the input scalars.  The fieldAssociation comes
##  from the vtkDataObject::FieldAssociations enum.  The fieldAttributeType
##  comes from the vtkDataSetAttributes::AttributeTypes enum.
##  virtual void SetInputScalars ( int fieldAssociation , const char * name ) ; virtual void SetInputScalars ( int fieldAssociation , int fieldAttributeType ) ; /@} /@{ *
##  Get/Set the name of the gradient array to create.  This is only
##  used if ComputeGradient is non-zero. If nullptr (the
##  default) then the output array will be named "Gradients".
##  virtual char * GetResultArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << ResultArrayName  of  << ( this -> ResultArrayName ? this -> ResultArrayName : (null) ) ) ; return this -> ResultArrayName ; } ; virtual void SetResultArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ResultArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> ResultArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> ResultArrayName && _arg && ( ! strcmp ( this -> ResultArrayName , _arg ) ) ) { return ; } delete [ ] this -> ResultArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> ResultArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> ResultArrayName = nullptr ; } this -> Modified ( ) ; } ; /@} /@{ *
##  Get/Set the name of the divergence array to create. This is only
##  used if ComputeDivergence is non-zero. If nullptr (the
##  default) then the output array will be named "Divergence".
##  virtual char * GetResultArrayNameDivergenceArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << DivergenceArrayName  of  << ( this -> DivergenceArrayName ? this -> DivergenceArrayName : (null) ) ) ; return this -> DivergenceArrayName ; } ; virtual void SetResultArrayNameDivergenceArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << DivergenceArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> DivergenceArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> DivergenceArrayName && _arg && ( ! strcmp ( this -> DivergenceArrayName , _arg ) ) ) { return ; } delete [ ] this -> DivergenceArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> DivergenceArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> DivergenceArrayName = nullptr ; } this -> Modified ( ) ; } ; /@} /@{ *
##  Get/Set the name of the vorticity array to create. This is only
##  used if ComputeVorticity is non-zero. If nullptr (the
##  default) then the output array will be named "Vorticity".
##  virtual char * GetResultArrayNameDivergenceArrayNameVorticityArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << VorticityArrayName  of  << ( this -> VorticityArrayName ? this -> VorticityArrayName : (null) ) ) ; return this -> VorticityArrayName ; } ; virtual void SetResultArrayNameDivergenceArrayNameVorticityArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << VorticityArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> VorticityArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> VorticityArrayName && _arg && ( ! strcmp ( this -> VorticityArrayName , _arg ) ) ) { return ; } delete [ ] this -> VorticityArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> VorticityArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> VorticityArrayName = nullptr ; } this -> Modified ( ) ; } ; /@} /@{ *
##  Get/Set the name of the Q criterion array to create. This is only
##  used if ComputeQCriterion is non-zero. If nullptr (the
##  default) then the output array will be named "Q-criterion".
##  virtual char * GetResultArrayNameDivergenceArrayNameVorticityArrayNameQCriterionArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << QCriterionArrayName  of  << ( this -> QCriterionArrayName ? this -> QCriterionArrayName : (null) ) ) ; return this -> QCriterionArrayName ; } ; virtual void SetResultArrayNameDivergenceArrayNameVorticityArrayNameQCriterionArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << QCriterionArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> QCriterionArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> QCriterionArrayName && _arg && ( ! strcmp ( this -> QCriterionArrayName , _arg ) ) ) { return ; } delete [ ] this -> QCriterionArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> QCriterionArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> QCriterionArrayName = nullptr ; } this -> Modified ( ) ; } ; /@} /@{ *
##  When this flag is on (default is off), the gradient filter will provide a
##  less accurate (but close) algorithm that performs fewer derivative
##  calculations (and is therefore faster).  The error contains some smoothing
##  of the output data and some possible errors on the boundary.  This
##  parameter has no effect when performing the gradient of cell data.
##  This only applies if the input grid is a vtkUnstructuredGrid or a
##  vtkPolyData, and when point gradients are computed.
##  virtual vtkTypeBool GetFasterApproximation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FasterApproximation  of  << this -> FasterApproximation ) ; return this -> FasterApproximation ; } ; virtual void SetFasterApproximation ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  FasterApproximation  to  << _arg ) ; if ( this -> FasterApproximation != _arg ) { this -> FasterApproximation = _arg ; this -> Modified ( ) ; } } ; virtual void FasterApproximationOn ( ) { this -> SetFasterApproximation ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void FasterApproximationOff ( ) { this -> SetFasterApproximation ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Add the gradient to the output field data.  The name of the array
##  will be ResultArrayName and will be the same type as the input
##  array. The default is on.
##  virtual void SetFasterApproximationComputeGradient ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeGradient  to  << _arg ) ; if ( this -> ComputeGradient != _arg ) { this -> ComputeGradient = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetFasterApproximationComputeGradient ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeGradient  of  << this -> ComputeGradient ) ; return this -> ComputeGradient ; } ; virtual void ComputeGradientOn ( ) { this -> SetFasterApproximationComputeGradient ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ComputeGradientOff ( ) { this -> SetFasterApproximationComputeGradient ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Add divergence to the output field data.  The name of the array
##  will be DivergenceArrayName and will be the same type as the input
##  array.  The input array must have 3 components in order to
##  compute this. The default is off.
##  virtual void SetFasterApproximationComputeGradientComputeDivergence ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeDivergence  to  << _arg ) ; if ( this -> ComputeDivergence != _arg ) { this -> ComputeDivergence = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetFasterApproximationComputeGradientComputeDivergence ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeDivergence  of  << this -> ComputeDivergence ) ; return this -> ComputeDivergence ; } ; virtual void ComputeDivergenceOn ( ) { this -> SetFasterApproximationComputeGradientComputeDivergence ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ComputeDivergenceOff ( ) { this -> SetFasterApproximationComputeGradientComputeDivergence ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Add voriticity/curl to the output field data.  The name of the array
##  will be VorticityArrayName and will be the same type as the input
##  array.  The input array must have 3 components in order to
##  compute this. The default is off.
##  virtual void SetFasterApproximationComputeGradientComputeDivergenceComputeVorticity ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeVorticity  to  << _arg ) ; if ( this -> ComputeVorticity != _arg ) { this -> ComputeVorticity = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetFasterApproximationComputeGradientComputeDivergenceComputeVorticity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeVorticity  of  << this -> ComputeVorticity ) ; return this -> ComputeVorticity ; } ; virtual void ComputeVorticityOn ( ) { this -> SetFasterApproximationComputeGradientComputeDivergenceComputeVorticity ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ComputeVorticityOff ( ) { this -> SetFasterApproximationComputeGradientComputeDivergenceComputeVorticity ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Add Q-criterion to the output field data.  The name of the array
##  will be QCriterionArrayName and will be the same type as the input
##  array.  The input array must have 3 components in order to
##  compute this.  Note that Q-citerion is a balance of the rate
##  of vorticity and the rate of strain. The default is off.
##  virtual void SetFasterApproximationComputeGradientComputeDivergenceComputeVorticityComputeQCriterion ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeQCriterion  to  << _arg ) ; if ( this -> ComputeQCriterion != _arg ) { this -> ComputeQCriterion = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetFasterApproximationComputeGradientComputeDivergenceComputeVorticityComputeQCriterion ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeQCriterion  of  << this -> ComputeQCriterion ) ; return this -> ComputeQCriterion ; } ; virtual void ComputeQCriterionOn ( ) { this -> SetFasterApproximationComputeGradientComputeDivergenceComputeVorticityComputeQCriterion ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ComputeQCriterionOff ( ) { this -> SetFasterApproximationComputeGradientComputeDivergenceComputeVorticityComputeQCriterion ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Option to specify what cells to include in the gradient computation.
##  Options are all cells (All, Patch and DataSetMax). The default is All.
##  virtual void SetContributingCellOption ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ContributingCellOption  to  << _arg ) ; if ( this -> ContributingCellOption != ( _arg < 0 ? 0 : ( _arg > 2 ? 2 : _arg ) ) ) { this -> ContributingCellOption = ( _arg < 0 ? 0 : ( _arg > 2 ? 2 : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetContributingCellOptionMinValue ( ) { return 0 ; } virtual int GetContributingCellOptionMaxValue ( ) { return 2 ; } ; virtual int GetFasterApproximationComputeGradientComputeDivergenceComputeVorticityComputeQCriterionContributingCellOption ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ContributingCellOption  of  << this -> ContributingCellOption ) ; return this -> ContributingCellOption ; } ; /@} /@{ *
##  Option to specify what replacement value or entities that don't have any gradient computed
##  over them based on the ContributingCellOption. Options are (Zero, NaN, DataTypeMin,
##  DataTypeMax). The default is Zero.
##  virtual void SetContributingCellOptionReplacementValueOption ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ReplacementValueOption  to  << _arg ) ; if ( this -> ReplacementValueOption != ( _arg < 0 ? 0 : ( _arg > 3 ? 3 : _arg ) ) ) { this -> ReplacementValueOption = ( _arg < 0 ? 0 : ( _arg > 3 ? 3 : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetContributingCellOptionMinValueReplacementValueOptionMinValue ( ) { return 0 ; } virtual int GetContributingCellOptionMaxValueReplacementValueOptionMaxValue ( ) { return 3 ; } ; virtual int GetFasterApproximationComputeGradientComputeDivergenceComputeVorticityComputeQCriterionContributingCellOptionReplacementValueOption ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReplacementValueOption  of  << this -> ReplacementValueOption ) ; return this -> ReplacementValueOption ; } ; /@} protected : vtkGradientFilter ( ) ; ~ vtkGradientFilter ( ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; *
##  Compute the gradients for grids that are not a vtkImageData,
##  vtkRectilinearGrid, or vtkStructuredGrid.
##  Returns non-zero if the operation was successful.
##  virtual int ComputeUnstructuredGridGradient ( vtkDataArray * Array , int fieldAssociation , vtkDataSet * input , bool computeVorticity , bool computeQCriterion , bool computeDivergence , vtkDataSet * output ) ; *
##  Compute the gradients for either a vtkImageData, vtkRectilinearGrid or
##  a vtkStructuredGrid.  Computes the gradient using finite differences.
##  Returns non-zero if the operation was successful.
##  virtual int ComputeRegularGridGradient ( vtkDataArray * Array , int * dims , int fieldAssociation , bool computeVorticity , bool computeQCriterion , bool computeDivergence , vtkDataSet * output , vtkUnsignedCharArray * ghosts , unsigned char hiddenGhost ) ; *
##  Get the proper array type to compute requested derivative quantities for.
##  If the input array is an unsigned type then we switch to a float array
##  for the output but otherwise the output array type is the same as the
##  input array type.
##  int GetOutputArrayType ( vtkDataArray * inputArray ) ; *
##  If non-null then it contains the name of the outputted gradient array.
##  By derault it is "Gradients".
##  char * ResultArrayName ; *
##  If non-null then it contains the name of the outputted divergence array.
##  By derault it is "Divergence".
##  char * DivergenceArrayName ; *
##  If non-null then it contains the name of the outputted vorticity array.
##  By derault it is "Vorticity".
##  char * VorticityArrayName ; *
##  If non-null then it contains the name of the outputted Q criterion array.
##  By derault it is "Q-criterion".
##  char * QCriterionArrayName ; *
##  When this flag is on (default is off), the gradient filter will provide a
##  less accurate (but close) algorithm that performs fewer derivative
##  calculations (and is therefore faster).  The error contains some smoothing
##  of the output data and some possible errors on the boundary.  This
##  parameter has no effect when performing the gradient of cell data.
##  This only applies if the input grid is a vtkUnstructuredGrid or a
##  vtkPolyData.
##  vtkTypeBool FasterApproximation ; *
##  Flag to indicate that the gradient of the input vector is to
##  be computed. By default ComputeDivergence is on.
##  vtkTypeBool ComputeGradient ; *
##  Flag to indicate that the divergence of the input vector is to
##  be computed.  The input array to be processed must have
##  3 components.  By default ComputeDivergence is off.
##  vtkTypeBool ComputeDivergence ; *
##  Flag to indicate that the Q-criterion of the input vector is to
##  be computed.  The input array to be processed must have
##  3 components.  By default ComputeQCriterion is off.
##  vtkTypeBool ComputeQCriterion ; *
##  Flag to indicate that vorticity/curl of the input vector is to
##  be computed.  The input array to be processed must have
##  3 components.  By default ComputeVorticity is off.
##  vtkTypeBool ComputeVorticity ; *
##  Option to specify what cells to include in the gradient computation.
##  Options are all cells (All, Patch and DataSet). The default is all.
##  int ContributingCellOption ; *
##  Option to specify what replacement value or entities that don't have any gradient computed
##  over them based on the ContributingCellOption. Options are (Zero, NaN, DataTypeMin,
##  DataTypeMax). The default is Zero.
##  int ReplacementValueOption ; private : vtkGradientFilter ( const vtkGradientFilter & ) = delete ; void operator = ( const vtkGradientFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
