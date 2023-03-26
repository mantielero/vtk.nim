## =========================================================================
##
##  Program:   Visualization Toolkit
##  Module:    vtkAMRResampleFilter.h
##
##  Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##  All rights reserved.
##  See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##  This software is distributed WITHOUT ANY WARRANTY; without even
##  the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##  PURPOSE.  See the above copyright notice for more information.
##
##  =========================================================================
## *
##  @class   vtkAMRResampleFilter
##
##
##   This filter is a concrete instance of vtkMultiBlockDataSetAlgorithm and
##   provides functionality for extracting portion of the AMR dataset, specified
##   by a bounding box, in a uniform grid of the desired level of resolution.
##   The resulting uniform grid is stored in a vtkMultiBlockDataSet where the
##   number of blocks correspond to the number of processors utilized for the
##   operation.
##
##  @warning
##   Data of the input AMR dataset is assumed to be cell-centered.
##
##  @sa
##   vtkOverlappingAMR, vtkUniformGrid
##

## !!!Ignored construct:  # vtkAMRResampleFilter_h [NewLine] # vtkAMRResampleFilter_h [NewLine] # vtkFiltersAMRModule.h  For export macro # vtkMultiBlockDataSetAlgorithm.h [NewLine] # < vector >  For STL vector [NewLine] class vtkInformation ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkInformationVector"
discard "forward decl of vtkUniformGrid"
discard "forward decl of vtkOverlappingAMR"
discard "forward decl of vtkMultiBlockDataSet"
discard "forward decl of vtkMultiProcessController"
discard "forward decl of vtkFieldData"
discard "forward decl of vtkCellData"
discard "forward decl of vtkPointData"
discard "forward decl of vtkIndent"
discard "forward decl of vtkAMRBox"
## !!!Ignored construct:  class VTKFILTERSAMR_EXPORT vtkAMRResampleFilter : public vtkMultiBlockDataSetAlgorithm { public : static vtkAMRResampleFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkMultiBlockDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkMultiBlockDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkAMRResampleFilter :: IsTypeOf ( type ) ; } static vtkAMRResampleFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkAMRResampleFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkAMRResampleFilter * NewInstance ( ) const { return vtkAMRResampleFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMultiBlockDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAMRResampleFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAMRResampleFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & oss , vtkIndent indent ) override ; /@{ *
##  Set & Get macro for the number of samples (cells) in each dimension.
##  Nominal value for the number of samples is 10x10x10.
##  virtual void SetNumberOfSamples ( int _arg1 , int _arg2 , int _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << NumberOfSamples  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> NumberOfSamples [ 0 ] != _arg1 ) || ( this -> NumberOfSamples [ 1 ] != _arg2 ) || ( this -> NumberOfSamples [ 2 ] != _arg3 ) ) { this -> NumberOfSamples [ 0 ] = _arg1 ; this -> NumberOfSamples [ 1 ] = _arg2 ; this -> NumberOfSamples [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetNumberOfSamples ( const int _arg [ 3 ] ) { this -> SetNumberOfSamples ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual int * GetNumberOfSamples ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfSamples  pointer  << this -> NumberOfSamples ) ; return this -> NumberOfSamples ; } VTK_WRAPEXCLUDE virtual void GetNumberOfSamples ( int & _arg1 , int & _arg2 , int & _arg3 ) { _arg1 = this -> NumberOfSamples [ 0 ] ; _arg2 = this -> NumberOfSamples [ 1 ] ; _arg3 = this -> NumberOfSamples [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfSamples  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetNumberOfSamples ( int _arg [ 3 ] ) { this -> GetNumberOfSamples ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  Set & Get macro for the TransferToNodes flag
##  virtual void SetTransferToNodes ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  TransferToNodes  to  << _arg ) ; if ( this -> TransferToNodes != _arg ) { this -> TransferToNodes = _arg ; this -> Modified ( ) ; } } ; virtual int GetTransferToNodes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TransferToNodes  of  << this -> TransferToNodes ) ; return this -> TransferToNodes ; } ; /@} /@{ *
##  Set & Get macro to allow the filter to operate in both demand-driven
##  and standard modes
##  virtual void SetTransferToNodesDemandDrivenMode ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  DemandDrivenMode  to  << _arg ) ; if ( this -> DemandDrivenMode != _arg ) { this -> DemandDrivenMode = _arg ; this -> Modified ( ) ; } } ; virtual int GetTransferToNodesDemandDrivenMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DemandDrivenMode  of  << this -> DemandDrivenMode ) ; return this -> DemandDrivenMode ; } ; /@} /@{ *
##  Set & Get macro for the number of subdivisions
##  virtual void SetTransferToNodesDemandDrivenModeNumberOfPartitions ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NumberOfPartitions  to  << _arg ) ; if ( this -> NumberOfPartitions != _arg ) { this -> NumberOfPartitions = _arg ; this -> Modified ( ) ; } } ; virtual int GetTransferToNodesDemandDrivenModeNumberOfPartitions ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfPartitions  of  << this -> NumberOfPartitions ) ; return this -> NumberOfPartitions ; } ; /@} /@{ *
##  Set and Get the min corner
##  virtual void SetNumberOfSamplesMin ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Min  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Min [ 0 ] != _arg1 ) || ( this -> Min [ 1 ] != _arg2 ) || ( this -> Min [ 2 ] != _arg3 ) ) { this -> Min [ 0 ] = _arg1 ; this -> Min [ 1 ] = _arg2 ; this -> Min [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetNumberOfSamplesMin ( const double _arg [ 3 ] ) { this -> SetNumberOfSamplesMin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetNumberOfSamplesMin ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Min  pointer  << this -> Min ) ; return this -> Min ; } VTK_WRAPEXCLUDE virtual void GetNumberOfSamplesMin ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Min [ 0 ] ; _arg2 = this -> Min [ 1 ] ; _arg3 = this -> Min [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Min  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetNumberOfSamplesMin ( double _arg [ 3 ] ) { this -> GetNumberOfSamplesMin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  Set and Get the max corner
##  virtual void SetNumberOfSamplesMinMax ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Max  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Max [ 0 ] != _arg1 ) || ( this -> Max [ 1 ] != _arg2 ) || ( this -> Max [ 2 ] != _arg3 ) ) { this -> Max [ 0 ] = _arg1 ; this -> Max [ 1 ] = _arg2 ; this -> Max [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetNumberOfSamplesMinMax ( const double _arg [ 3 ] ) { this -> SetNumberOfSamplesMinMax ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetNumberOfSamplesMinMax ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Max  pointer  << this -> Max ) ; return this -> Max ; } VTK_WRAPEXCLUDE virtual void GetNumberOfSamplesMinMax ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Max [ 0 ] ; _arg2 = this -> Max [ 1 ] ; _arg3 = this -> Max [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Max  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetNumberOfSamplesMinMax ( double _arg [ 3 ] ) { this -> GetNumberOfSamplesMinMax ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  Set & Get macro for the number of subdivisions
##  virtual void SetTransferToNodesDemandDrivenModeNumberOfPartitionsUseBiasVector ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseBiasVector  to  << _arg ) ; if ( this -> UseBiasVector != _arg ) { this -> UseBiasVector = _arg ; this -> Modified ( ) ; } } ; virtual bool GetTransferToNodesDemandDrivenModeNumberOfPartitionsUseBiasVector ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseBiasVector  of  << this -> UseBiasVector ) ; return this -> UseBiasVector ; } ; /@} /@{ *
##  Set and Get the bias vector.  If UseBiasVector is true
##  then the largest component of this vector can not have
##  the max number of samples
##  virtual void SetNumberOfSamplesMinMaxBiasVector ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << BiasVector  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> BiasVector [ 0 ] != _arg1 ) || ( this -> BiasVector [ 1 ] != _arg2 ) || ( this -> BiasVector [ 2 ] != _arg3 ) ) { this -> BiasVector [ 0 ] = _arg1 ; this -> BiasVector [ 1 ] = _arg2 ; this -> BiasVector [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetNumberOfSamplesMinMaxBiasVector ( const double _arg [ 3 ] ) { this -> SetNumberOfSamplesMinMaxBiasVector ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetNumberOfSamplesMinMaxBiasVector ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << BiasVector  pointer  << this -> BiasVector ) ; return this -> BiasVector ; } VTK_WRAPEXCLUDE virtual void GetNumberOfSamplesMinMaxBiasVector ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> BiasVector [ 0 ] ; _arg2 = this -> BiasVector [ 1 ] ; _arg3 = this -> BiasVector [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << BiasVector  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetNumberOfSamplesMinMaxBiasVector ( double _arg [ 3 ] ) { this -> GetNumberOfSamplesMinMaxBiasVector ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  Set & Get macro for the multi-process controller
##  virtual void SetController ( vtkMultiProcessController * ) ; virtual vtkMultiProcessController * GetnameController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Controller  address  << static_cast < vtkMultiProcessController * > ( this -> Controller ) ) ; return this -> Controller ; } ; /@}  Standard pipeline routines *
##  Gets the metadata from upstream module and determines which blocks
##  should be loaded by this instance.
##  int RequestInformation ( vtkInformation * rqst , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int FillOutputPortInformation ( int port , vtkInformation * info ) override ; *
##  Performs upstream requests to the reader
##  int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; protected : vtkAMRResampleFilter ( ) ; ~ vtkAMRResampleFilter ( ) override ; vtkOverlappingAMR * AMRMetaData ; vtkMultiBlockDataSet * ROI ;  Pointer to the region of interest. int NumberOfSamples [ 3 ] ; int GridNumberOfSamples [ 3 ] ; double Min [ 3 ] ; double Max [ 3 ] ; double GridMin [ 3 ] ; double GridMax [ 3 ] ; int LevelOfResolution ; int NumberOfPartitions ; int TransferToNodes ; int DemandDrivenMode ; vtkMultiProcessController * Controller ; bool UseBiasVector ; double BiasVector [ 3 ] ;  Debugging Stuff int NumberOfBlocksTestedForLevel ; int NumberOfBlocksTested ; int NumberOfBlocksVisSkipped ; int NumberOfTimesFoundOnDonorLevel ; int NumberOfTimesLevelUp ; int NumberOfTimesLevelDown ; int NumberOfFailedPoints ; double AverageLevel ; std :: vector < int > BlocksToLoad ;  Holds the ids of the blocks to load. *
##  Checks if this filter instance is running on more than one processes
##  bool IsParallel ( ) ; *
##  Given the Region ID this function returns whether or not the region
##  belongs to this process or not.
##  bool IsRegionMine ( const int regionIdx ) ; *
##  Given the Region ID, this method computes the corresponding process ID
##  that owns the region based on static block-cyclic distribution.
##  int GetRegionProcessId ( const int regionIdx ) ; *
##  Given a cell index and a grid, this method computes the cell centroid.
##  void ComputeCellCentroid ( vtkUniformGrid * g , const vtkIdType cellIdx , double c [ 3 ] ) ; *
##  Given the source cell data of an AMR grid, this method initializes the
##  field values, i.e., the number of arrays with the prescribed size. Note,
##  the size must correspond to the number of points if node-centered or the
##  the number of cells if cell-centered.
##  void InitializeFields ( vtkFieldData * f , vtkIdType size , vtkCellData * src ) ; *
##  Copies the data to the target from the given source.
##  void CopyData ( vtkFieldData * target , vtkIdType targetIdx , vtkCellData * src , vtkIdType srcIdx ) ; *
##  Given a query point q and a candidate donor grid, this method checks for
##  the corresponding donor cell containing the point in the given grid.
##  bool FoundDonor ( double q [ 3 ] , vtkUniformGrid * & donorGrid , int & cellIdx ) ; *
##  Given a query point q and a target level, this method finds a suitable
##  grid at the given level that contains the point if one exists. If a grid
##  is not found, donorGrid is set to nullptr.
##  bool SearchForDonorGridAtLevel ( double q [ 3 ] , vtkOverlappingAMR * amrds , unsigned int level , unsigned int & gridId , int & donorCellIdx ) ; *
##  Finds the AMR grid that contains the point q. If donorGrid points to a
##  valid AMR grid in the hierarchy, the algorithm will search this grid
##  first. The method returns the ID of the cell w.r.t. the donorGrid that
##  contains the probe point q.
##  int ProbeGridPointInAMR ( double q [ 3 ] , unsigned int & donorLevel , unsigned int & donorGridId , vtkOverlappingAMR * amrds , unsigned int maxLevel , bool hadDonorGrid ) ; *
##  Finds the AMR grid that contains the point q. If donorGrid points to a
##  valid AMR grid in the hierarchy, the algorithm will search this grid
##  first. The method returns the ID of the cell w.r.t. the donorGrid that
##  contains the probe point q. - Makes use of Parent/Child Info
##  int ProbeGridPointInAMRGraph ( double q [ 3 ] , unsigned int & donorLevel , unsigned int & donorGridId , vtkOverlappingAMR * amrds , unsigned int maxLevel , bool useCached ) ; *
##  Transfers the solution from the AMR dataset to the cell-centers of
##  the given uniform grid.
##  void TransferToCellCenters ( vtkUniformGrid * g , vtkOverlappingAMR * amrds ) ; *
##  Transfer the solution from the AMR dataset to the nodes of the
##  given uniform grid.
##  void TransferToGridNodes ( vtkUniformGrid * g , vtkOverlappingAMR * amrds ) ; *
##  Transfers the solution
##  void TransferSolution ( vtkUniformGrid * g , vtkOverlappingAMR * amrds ) ; *
##  Extract the region (as a multiblock) from the given AMR dataset.
##  void ExtractRegion ( vtkOverlappingAMR * amrds , vtkMultiBlockDataSet * mbds , vtkOverlappingAMR * metadata ) ; *
##  Checks if the AMR block, described by a uniform grid, is within the
##  bounds of the ROI perscribed by the user.
##  bool IsBlockWithinBounds ( double * grd ) ; *
##  Given a user-supplied region of interest and the metadata by a module
##  upstream, this method generates the list of linear AMR block indices
##  that need to be loaded.
##  void ComputeAMRBlocksToLoad ( vtkOverlappingAMR * metadata ) ; *
##  Computes the region parameters
##  void ComputeRegionParameters ( vtkOverlappingAMR * amrds , int N [ 3 ] , double min [ 3 ] , double max [ 3 ] , double h [ 3 ] ) ; *
##  This method accesses the domain boundaries
##  void GetDomainParameters ( vtkOverlappingAMR * amr , double domainMin [ 3 ] , double domainMax [ 3 ] , double h [ 3 ] , int dims [ 3 ] , double & rf ) ; *
##  Checks if the domain and requested region intersect.
##  bool RegionIntersectsWithAMR ( double domainMin [ 3 ] , double domainMax [ 3 ] , double regionMin [ 3 ] , double regionMax [ 3 ] ) ; *
##  This method adjust the numbers of samples in the region, N, if the
##  requested region falls outside, but, intersects the domain.
##  void AdjustNumberOfSamplesInRegion ( const double Rh [ 3 ] , const bool outside [ 6 ] , int N [ 3 ] ) ; *
##  This method computes the level of resolution based on the number of
##  samples requested, N, the root level spacing h0, the length of the box,
##  L (actual length after snapping) and the refinement ratio.
##  void ComputeLevelOfResolution ( const int N [ 3 ] , const double h0 [ 3 ] , const double L [ 3 ] , const double rf ) ; *
##  This method snaps the bounds s.t. they are within the interior of the
##  domain described the root level uniform grid with h0, domainMin and
##  domain Max. The method computes and returns the new min/max bounds and
##  the corresponding ijkmin/ijkmax coordinates w.r.t. the root level.
##  void SnapBounds ( const double h0 [ 3 ] , const double domainMin [ 3 ] , const double domainMax [ 3 ] , const int dims [ 3 ] , bool outside [ 6 ] ) ; *
##  This method computes and adjusts the region parameters s.t. the requested
##  region always fall within the AMR region and the number of samples is
##  adjusted if the region of interest moves outsided the domain.
##  void ComputeAndAdjustRegionParameters ( vtkOverlappingAMR * amrds , double h [ 3 ] ) ; *
##  This method gets the region of interest as perscribed by the user.
##  void GetRegion ( double h [ 3 ] ) ; *
##  Checks if two uniform grids intersect.
##  bool GridsIntersect ( double * g1 , double * g2 ) ; *
##  Returns a reference grid from the amrdataset.
##  vtkUniformGrid * GetReferenceGrid ( vtkOverlappingAMR * amrds ) ; *
##  Writes a uniform grid to a file. Used for debugging purposes.
##  void WriteUniformGrid( vtkUniformGrid *g, std::string prefix );
##  void WriteUniformGrid(
##  double origin[3], int dims[3], double h[3],
##  std::string prefix );
##  *
##  Find a descendant of the specified grid that contains the point.
##  If none is found then the original grid information is returned.
##  The search is limited to levels < maxLevel
##  void SearchGridDecendants ( double q [ 3 ] , vtkOverlappingAMR * amrds , unsigned int maxLevel , unsigned int & level , unsigned int & gridId , int & id ) ; *
##  Find an ancestor of the specified grid that contains the point.
##  If none is found then the original grid information is returned
##  bool SearchGridAncestors ( double q [ 3 ] , vtkOverlappingAMR * amrds , unsigned int & level , unsigned int & gridId , int & id ) ; private : vtkAMRResampleFilter ( const vtkAMRResampleFilter & ) = delete ; void operator = ( const vtkAMRResampleFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
