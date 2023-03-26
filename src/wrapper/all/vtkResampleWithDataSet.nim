## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkResampleWithDataSet.h
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
##  @class   vtkResampleWithDataSet
##  @brief   sample point and cell data of a dataset on
##  points from another dataset.
##
##  Similar to vtkCompositeDataProbeFilter, vtkResampleWithDataSet takes two
##  inputs - Input and Source, and samples the point and cell values of Source
##  on to the point locations of Input. The output has the same structure as
##  Input but its point data have the resampled values from Source. Unlike
##  vtkCompositeDataProbeFilter, this filter support composite datasets for both
##  Input and Source.
##  @sa
##  vtkCompositeDataProbeFilter vtkResampleToImage
##

## !!!Ignored construct:  # vtkResampleWithDataSet_h [NewLine] # vtkResampleWithDataSet_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkNew.h  For vtkCompositeDataProbeFilter member variable # vtkPassInputTypeAlgorithm.h [NewLine] class vtkAbstractCellLocator ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkCompositeDataProbeFilter"
discard "forward decl of vtkDataSet"
## !!!Ignored construct:  class VTKFILTERSCORE_EXPORT vtkResampleWithDataSet : public vtkPassInputTypeAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPassInputTypeAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPassInputTypeAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkResampleWithDataSet :: IsTypeOf ( type ) ; } static vtkResampleWithDataSet * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkResampleWithDataSet * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkResampleWithDataSet * NewInstance ( ) const { return vtkResampleWithDataSet :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPassInputTypeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkResampleWithDataSet :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkResampleWithDataSet :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkResampleWithDataSet * New ( ) ; *
##  Specify the data set that will be probed at the input points.
##  The Input gives the geometry (the points and cells) for the output,
##  while the Source is probed (interpolated) to generate the scalars,
##  vectors, etc. for the output points based on the point locations.
##  void SetSourceData ( vtkDataObject * source ) ; *
##  Specify the data set that will be probed at the input points.
##  The Input gives the geometry (the points and cells) for the output,
##  while the Source is probed (interpolated) to generate the scalars,
##  vectors, etc. for the output points based on the point locations.
##  void SetSourceConnection ( vtkAlgorithmOutput * algOutput ) ; /@{ *
##  Control whether the source point data is to be treated as categorical. If
##  the data is categorical, then the resultant data will be determined by
##  a nearest neighbor interpolation scheme.
##  void SetCategoricalData ( bool arg ) ; bool GetCategoricalData ( ) ; /@} /@{ *
##  Shallow copy the input cell data arrays to the output.
##  Off by default.
##  void SetPassCellArrays ( bool arg ) ; bool GetPassCellArrays ( ) ; virtual void PassCellArraysOn ( ) { this -> SetPassCellArrays ( static_cast < bool > ( 1 ) ) ; } virtual void PassCellArraysOff ( ) { this -> SetPassCellArrays ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Shallow copy the input point data arrays to the output
##  Off by default.
##  void SetPassPointArrays ( bool arg ) ; bool GetPassPointArrays ( ) ; virtual void PassPointArraysOn ( ) { this -> SetPassCellArraysPassPointArrays ( static_cast < bool > ( 1 ) ) ; } virtual void PassPointArraysOff ( ) { this -> SetPassCellArraysPassPointArrays ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Set whether to pass the field-data arrays from the Input i.e. the input
##  providing the geometry to the output. On by default.
##  void SetPassFieldArrays ( bool arg ) ; bool GetPassFieldArrays ( ) ; virtual void PassFieldArraysOn ( ) { this -> SetPassCellArraysPassPointArraysPassFieldArrays ( static_cast < bool > ( 1 ) ) ; } virtual void PassFieldArraysOff ( ) { this -> SetPassCellArraysPassPointArraysPassFieldArrays ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  When sampling from composite datasets, partial arrays are common i.e.
##  data-arrays that are not available in all of the blocks. By default, this
##  filter only passes those point and cell data-arrays that are available in
##  all the blocks i.e. partial arrays are removed.  When PassPartialArrays is
##  turned on, this behavior is changed to take a union of all arrays present
##  thus partial arrays are passed as well. However, for composite dataset
##  input, this filter still produces a non-composite output. For all those
##  locations in a block of where a particular data array is missing, this
##  filter uses vtkMath::Nan() for double and float arrays, and 0 for all
##  other types of arrays e.g. int, char, etc. Off by default.
##  void SetPassPartialArrays ( bool arg ) ; bool GetPassPartialArrays ( ) ; virtual void PassPartialArraysOn ( ) { this -> SetPassCellArraysPassPointArraysPassFieldArraysPassPartialArrays ( static_cast < bool > ( 1 ) ) ; } virtual void PassPartialArraysOff ( ) { this -> SetPassCellArraysPassPointArraysPassFieldArraysPassPartialArrays ( static_cast < bool > ( 0 ) ) ; } ; @} @{ *
##  Set the tolerance used to compute whether a point in the
##  source is in a cell of the input.  This value is only used
##  if ComputeTolerance is off.
##  void SetTolerance ( double arg ) ; double GetTolerance ( ) ; /@} /@{ *
##  Set whether to use the Tolerance field or precompute the tolerance.
##  When on, the tolerance will be computed and the field
##  value is ignored. Off by default.
##  void SetComputeTolerance ( bool arg ) ; bool GetComputeTolerance ( ) ; virtual void ComputeToleranceOn ( ) { this -> SetPassCellArraysPassPointArraysPassFieldArraysPassPartialArraysComputeTolerance ( static_cast < bool > ( 1 ) ) ; } virtual void ComputeToleranceOff ( ) { this -> SetPassCellArraysPassPointArraysPassFieldArraysPassPartialArraysComputeTolerance ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Set whether points without resampled values, and their corresponding cells,
##  should be marked as Blank. Default is On.
##  virtual void SetMarkBlankPointsAndCells ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MarkBlankPointsAndCells  to  << _arg ) ; if ( this -> MarkBlankPointsAndCells != _arg ) { this -> MarkBlankPointsAndCells = _arg ; this -> Modified ( ) ; } } ; virtual bool GetMarkBlankPointsAndCells ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MarkBlankPointsAndCells  of  << this -> MarkBlankPointsAndCells ) ; return this -> MarkBlankPointsAndCells ; } ; virtual void MarkBlankPointsAndCellsOn ( ) { this -> SetPassCellArraysPassPointArraysPassFieldArraysPassPartialArraysComputeToleranceMarkBlankPointsAndCells ( static_cast < bool > ( 1 ) ) ; } virtual void MarkBlankPointsAndCellsOff ( ) { this -> SetPassCellArraysPassPointArraysPassFieldArraysPassPartialArraysComputeToleranceMarkBlankPointsAndCells ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{
##  Set/Get the prototype cell locator to use for probing the source dataset.
##  The value is forwarded to the underlying probe filter.
##  virtual void SetCellLocatorPrototype ( vtkAbstractCellLocator * ) ; virtual vtkAbstractCellLocator * GetCellLocatorPrototype ( ) const ; /@} vtkMTimeType GetMTime ( ) override ; protected : vtkResampleWithDataSet ( ) ; ~ vtkResampleWithDataSet ( ) override ;  Usual data generation method int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int , vtkInformation * ) override ; int FillOutputPortInformation ( int , vtkInformation * ) override ; *
##  Get the name of the valid-points mask array.
##  const char * GetMaskArrayName ( ) const ; *
##  Mark invalid points and cells of output DataSet as hidden
##  void SetBlankPointsAndCells ( vtkDataSet * data ) ; vtkNew < vtkCompositeDataProbeFilter > Prober ; bool MarkBlankPointsAndCells ; private : vtkResampleWithDataSet ( const vtkResampleWithDataSet & ) = delete ; void operator = ( const vtkResampleWithDataSet & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
