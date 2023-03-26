## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGhostCellsGenerator.h
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
##  @class vtkGhostCellsGenerator
##  @brief Computes ghost cells on vtkCompositeDataSet inputs
##
##  This filter computes ghost cells between data sets of same types in a `vtkCompositeDataSet`.
##  For example, a `vtkImageData` inside a `vtkCompositeDataSet` will send and receive ghosts only to
##  and from other `vtkImageData`.
##  The backend used to generate the ghosts is `vtkDIYGhostUtilities::GenerateGhosts`.
##
##  If the input is a `vtkPartitionedDataSetCollection`, then ghosts are computed per partitioned
##  data set. In other words, ghost are not computed between 2 `vtkDataSet` belonging to 2 different
##  `vtkPartitionedDataSet`, even if they are adjacent.
##
##  If `BuildIfRequired` is set to true (which is by default), then the filter will compute ghost
##  based on the value being returned by
##  `vtkStreamingDemandDrivenPipeline::UPDATE_NUMBER_OF_GHOST_LEVELS()` in the downstream streaming
##  pipeline. If not (i.e. `BuildIfRequired` is off), then the max between this latter value and
##  `NumberOfGhostLayers` is being used.
##
##  Ghosts points are generated in addition to ghost cells. The same point exists across multiple
##  partitions at the interface between them. One version of those points is not tagged as ghost,
##  while the others are. As a consequence, there are as many non ghost points as there would be
##  points if the input partitions were all merged into one partition.
##
##  If the input is composed of some data sets already owning ghosts, those ghosts are removed from
##  the output and are recomputed. Ghosts in the input are as if they didn't exist.
##  A ghost cell is to be peeled off if it holds the `CELLDUPLICATE` flag in its ghost bit mask.
##  Similarly, each generated ghost cells from this filter is tagged with `CELLDUPLICATE`, in
##  addition of other tags that could be set (`HIDDENCELL` for instance).
##
##  If the input is a `vtkUnstructuredGrid`, if the input `vtkPointData` has global ids, then the
##  values of those global ids are used instead of point position in 3D to connect 2 partitions.
##  If not, point position of the outer surface are used to connect them. The precision of such
##  connection is done using numeric precision of the input coordinates. Points and cells tagged as
##  hidden ghosts are removed from the output.
##
##  When requesting zero layers of ghost cells, ghost points are still generated. In this instance,
##  the filter will produce a ghost cell array in the output if and only if the input is a structured
##  data set (`vtkImageData`, `vtkRectilinearGrid`, or `vtkStructuredGrid`), and has hidden ghosts
##  within its valid extent (extent when duplicate ghosts are peeled off).
##
##  Points at the interface between 2 partitions are edited depending on the ownership of the point
##  after the ghost points are generated. One can keep track of which process owns a non-ghost copy
##  of the point if an array associating each point with its process id is available in the input.
##
##  @warning If an input already holds ghosts, the input ghost cells should be tagged as
##  `CELLDUPLICATE` in order for this filter to work properly.
##
##  @note Currently,`vtkImageData`, `vtkRectilinearGrid`, `vtkStructuredGrid`,
##  `vtkUnstructuredGrid` and `vtkPolyData` are implemented.
##
##  @warning This warning only applies for `vtkUnstructuredGrid` and `vtkPolyData` inputs. If
##  there are duplicate points in the outer shell of an input partition, then this filter cannot
##  decide on how to connect the cells properly when generating ghosts. The same phenomenon occurs
##  when the outer shell of the partition has 2 points with the same global id. In such
##  circumstances, use the `vtkStaticCleanUnstructuredGrid`
##  or `vtkStaticCleanPolyData` filter first in order to have a clean input.
##
##  @sa vtkDIYGhostUtilities
##

## !!!Ignored construct:  # vtkGhostCellsGenerator_h [NewLine] # vtkGhostCellsGenerator_h [NewLine] # vtkFiltersParallelDIY2Module.h  for export macros # vtkPassInputTypeAlgorithm.h [NewLine] class vtkMultiProcessController ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSPARALLELDIY2_EXPORT vtkGhostCellsGenerator : public vtkPassInputTypeAlgorithm { public : static vtkGhostCellsGenerator * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPassInputTypeAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPassInputTypeAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkGhostCellsGenerator :: IsTypeOf ( type ) ; } static vtkGhostCellsGenerator * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkGhostCellsGenerator * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkGhostCellsGenerator * NewInstance ( ) const { return vtkGhostCellsGenerator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPassInputTypeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGhostCellsGenerator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGhostCellsGenerator :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get/Set the controller to use. By default
##  vtkMultiProcessController::GlobalController will be used.
##  void SetController ( vtkMultiProcessController * ) ; virtual vtkMultiProcessController * GetnameController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Controller  address  << static_cast < vtkMultiProcessController * > ( this -> Controller ) ) ; return this -> Controller ; } ; /@} /@{ *
##  Resets parameter.
##  /@} virtual void Initialize ( ) ; /@{ *
##  Specify if the filter must generate the ghost cells only if required by
##  the pipeline.
##  If false, ghost cells are computed even if they are not required.
##  Default is TRUE.
##  virtual void SetBuildIfRequired ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  BuildIfRequired  to  << _arg ) ; if ( this -> BuildIfRequired != _arg ) { this -> BuildIfRequired = _arg ; this -> Modified ( ) ; } } ; virtual bool GetBuildIfRequired ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BuildIfRequired  of  << this -> BuildIfRequired ) ; return this -> BuildIfRequired ; } ; virtual void BuildIfRequiredOn ( ) { this -> SetBuildIfRequired ( static_cast < bool > ( 1 ) ) ; } virtual void BuildIfRequiredOff ( ) { this -> SetBuildIfRequired ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  When BuildIfRequired is `false`, this can be used to set the number
##  of ghost layers to generate. Note, if the downstream pipeline requests more
##  ghost levels than the number specified here, then the filter will generate
##  those extra ghost levels as needed. Accepted values are in the interval
##  [1, VTK_INT_MAX].
##  virtual int GetBuildIfRequiredNumberOfGhostLayers ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfGhostLayers  of  << this -> NumberOfGhostLayers ) ; return this -> NumberOfGhostLayers ; } ; virtual void SetNumberOfGhostLayers ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << NumberOfGhostLayers  to  << _arg ) ; if ( this -> NumberOfGhostLayers != ( _arg < 0 ? 0 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> NumberOfGhostLayers = ( _arg < 0 ? 0 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetNumberOfGhostLayersMinValue ( ) { return 0 ; } virtual int GetNumberOfGhostLayersMaxValue ( ) { return VTK_INT_MAX ; } ; /@} protected : vtkGhostCellsGenerator ( ) ; ~ vtkGhostCellsGenerator ( ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; *
##  Local controller.
##  vtkMultiProcessController * Controller ; int NumberOfGhostLayers ; bool BuildIfRequired ; private : vtkGhostCellsGenerator ( const vtkGhostCellsGenerator & ) = delete ; void operator = ( const vtkGhostCellsGenerator & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
