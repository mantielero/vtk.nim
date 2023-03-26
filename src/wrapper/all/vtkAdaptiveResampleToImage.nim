## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAdaptiveResampleToImage.h
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
##  @class vtkAdaptiveResampleToImage
##  @brief samples a dataset with adaptive refinements.
##
##  vtkAdaptiveResampleToImage resamples any dataset to a `vtkPartitionedDataSet`
##  comprising of `vtkImageData`. Each partition may have different spacing thus
##  spanning different spatial regions from the input dataset.
##
##  vtkAdaptiveResampleToImage builds a kd-tree with at least as many leaf nodes
##  as requested using `SetNumberOfImages`. The kd tree is built by splitting the
##  points in the input dataset. The bounds of each leaf are then used to
##  determine the bounds (i.e. spacing and origin) for the image dataset for that
##  leaf which will have the dimensions requested (set using `SetSamplingDimensions`).
##
##  `NumberOfImages` is simply a hint and the tree will have exactly as many
##  leaves as the nearest power of two not less than `NumberOfImages` (see
##  `vtkMath::NearestPowerOfTwo`). If set to 0, the number of images requested is assumed
##  to be same as the number of parallel MPI ranks.
##
##  When running in parallel, the leaf nodes of the kd-tree are assigned to
##  individual ranks. If the leaf nodes is exactly same as the number of MPI
##  ranks, then each rank gets a leaf. If the leaf nodes is less than the MPI
##  ranks, the extra ranks will not be assigned any data and will generate an
##  empty `vtkPartitionedDataSet` in the output. If the number of leaf nodes is
##  greater than the number of ranks, then each rank my be assigned more than 1
##  block. The assignment algorithm, however, preserves the kd-tree across ranks
##  i.e. a rank will always be assigned a complete sub-tree (which may be simply
##  the leaf node). @sa `vtkDIYKdTreeUtilities::CreateAssigner`,
##  `vtkDIYKdTreeUtilities::ComputeAssignments`.
##
##

## !!!Ignored construct:  # vtkAdaptiveResampleToImage_h [NewLine] # vtkAdaptiveResampleToImage_h [NewLine] # vtkDataObjectAlgorithm.h [NewLine] # vtkFiltersParallelDIY2Module.h  For export macro [NewLine] class vtkMultiProcessController ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSPARALLELDIY2_EXPORT vtkAdaptiveResampleToImage : public vtkDataObjectAlgorithm { public : static vtkAdaptiveResampleToImage * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataObjectAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataObjectAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkAdaptiveResampleToImage :: IsTypeOf ( type ) ; } static vtkAdaptiveResampleToImage * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkAdaptiveResampleToImage * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkAdaptiveResampleToImage * NewInstance ( ) const { return vtkAdaptiveResampleToImage :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObjectAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAdaptiveResampleToImage :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAdaptiveResampleToImage :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  By default this filter uses the global controller,
##  but this method can be used to set another instead.
##  virtual void SetController ( vtkMultiProcessController * ) ; virtual vtkMultiProcessController * GetnameController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Controller  address  << static_cast < vtkMultiProcessController * > ( this -> Controller ) ) ; return this -> Controller ; } ; /@} /@{ *
##  Get/Set a hint to use to indicate how many different refinements to split
##  the dataset into. This is just a hint. The actual number of images used to
##  resample the input dataset is the nearest power-of-two not less than the
##  requested value (@sa vtkMath::NearestPowerOfTwo).
##  virtual void SetNumberOfImages ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << NumberOfImages  to  << _arg ) ; if ( this -> NumberOfImages != ( _arg < 0 ? 0 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> NumberOfImages = ( _arg < 0 ? 0 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetNumberOfImagesMinValue ( ) { return 0 ; } virtual int GetNumberOfImagesMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetNumberOfImages ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfImages  of  << this -> NumberOfImages ) ; return this -> NumberOfImages ; } ; /@} /@{ *
##  Set/Get sampling dimensions along each axis. Each partition will be
##  resampled using these dimensions.
##  virtual void SetSamplingDimensions ( int _arg1 , int _arg2 , int _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << SamplingDimensions  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> SamplingDimensions [ 0 ] != _arg1 ) || ( this -> SamplingDimensions [ 1 ] != _arg2 ) || ( this -> SamplingDimensions [ 2 ] != _arg3 ) ) { this -> SamplingDimensions [ 0 ] = _arg1 ; this -> SamplingDimensions [ 1 ] = _arg2 ; this -> SamplingDimensions [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetSamplingDimensions ( const int _arg [ 3 ] ) { this -> SetSamplingDimensions ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual int * GetSamplingDimensions ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << SamplingDimensions  pointer  << this -> SamplingDimensions ) ; return this -> SamplingDimensions ; } VTK_WRAPEXCLUDE virtual void GetSamplingDimensions ( int & _arg1 , int & _arg2 , int & _arg3 ) { _arg1 = this -> SamplingDimensions [ 0 ] ; _arg2 = this -> SamplingDimensions [ 1 ] ; _arg3 = this -> SamplingDimensions [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << SamplingDimensions  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetSamplingDimensions ( int _arg [ 3 ] ) { this -> GetSamplingDimensions ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} protected : vtkAdaptiveResampleToImage ( ) ; ~ vtkAdaptiveResampleToImage ( ) override ; int FillOutputPortInformation ( int port , vtkInformation * info ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; private : vtkAdaptiveResampleToImage ( const vtkAdaptiveResampleToImage & ) = delete ; void operator = ( const vtkAdaptiveResampleToImage & ) = delete ; vtkMultiProcessController * Controller ; int NumberOfImages ; int SamplingDimensions [ 3 ] ; } ;
## Error: token expected: ; but got: [identifier]!!!
