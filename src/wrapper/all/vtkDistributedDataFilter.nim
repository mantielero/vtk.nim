## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDistributedDataFilter.h
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
##  @class   vtkDistributedDataFilter
##  @brief   Serial stand-in for parallel filter that distributes data among processors
##
##  This filter is a serial implementation of the vtkPDistributedDataFilter
##  filter with the intent that it can be used in non-MPI builds. This filter
##  acts almost as a "pass-through" filter when run in serial, though when the
##  input is a non-composite dataset, the output will be an vtkUnstructuredGrid
##  to be consistent with the parallel filter. The combination of this filter and
##  its parallel counterpart serves to unify the API for serial and parallel
##  builds.
##
##  @sa vtkPDistributedDataFilter
##

## !!!Ignored construct:  # vtkDistributedDataFilter_h [NewLine] # vtkDistributedDataFilter_h [NewLine] # vtkDataObjectAlgorithm.h [NewLine] # vtkFiltersParallelModule.h  For export macro [NewLine] # < vector >  for vector [NewLine] class vtkBSPCuts ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkMultiProcessController"
discard "forward decl of vtkPKdTree"
## !!!Ignored construct:  class VTKFILTERSPARALLEL_EXPORT vtkDistributedDataFilter : public vtkDataObjectAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataObjectAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataObjectAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkDistributedDataFilter :: IsTypeOf ( type ) ; } static vtkDistributedDataFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkDistributedDataFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkDistributedDataFilter * NewInstance ( ) const { return vtkDistributedDataFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObjectAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDistributedDataFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDistributedDataFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkDistributedDataFilter * New ( ) ; /@{ *
##  Set/Get the communicator object
##  void SetController ( vtkMultiProcessController * c ) ; virtual vtkMultiProcessController * GetnameController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Controller  address  << static_cast < vtkMultiProcessController * > ( this -> Controller ) ) ; return this -> Controller ; } ; /@} *
##  Get a pointer to the parallel k-d tree object.  Required for changing
##  default behavior for region assignment, changing default depth of tree,
##  or other tree building default parameters.  See vtkPKdTree and
##  vtkKdTree for more information about these options.
##  NOTE: Changing the tree returned by this method does NOT change
##  the d3 filter. Make sure to call Modified() on the d3 object if
##  you want it to re-execute.
##  vtkPKdTree * GetKdtree ( ) ; *
##  When this filter executes, it creates a vtkPKdTree (K-d tree)
##  data structure in parallel which divides the total distributed
##  data set into spatial regions.  The K-d tree object also creates
##  tables describing which processes have data for which
##  regions.  Only then does this filter redistribute
##  the data according to the region assignment scheme.  By default,
##  the K-d tree structure and it's associated tables are deleted
##  after the filter executes.  If you anticipate changing only the
##  region assignment scheme (input is unchanged) and explicitly
##  re-executing, then RetainKdTreeOn, and the K-d tree structure and
##  tables will be saved.  Then, when you re-execute, this filter will
##  skip the k-d tree build phase and go straight to redistributing
##  the data according to region assignment.  See vtkPKdTree for
##  more information about region assignment.
##  virtual void RetainKdtreeOn ( ) { this -> SetRetainKdtree ( static_cast < int > ( 1 ) ) ; } virtual void RetainKdtreeOff ( ) { this -> SetRetainKdtree ( static_cast < int > ( 0 ) ) ; } ; virtual int GetRetainKdtree ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RetainKdtree  of  << this -> RetainKdtree ) ; return this -> RetainKdtree ; } ; virtual void SetRetainKdtree ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  RetainKdtree  to  << _arg ) ; if ( this -> RetainKdtree != _arg ) { this -> RetainKdtree = _arg ; this -> Modified ( ) ; } } ; *
##  Each cell in the data set is associated with one of the
##  spatial regions of the k-d tree decomposition.  In particular,
##  the cell belongs to the region that it's centroid lies in.
##  When the new vtkUnstructuredGrid is created, by default it
##  is composed of the cells associated with the region(s)
##  assigned to this process.  If you also want it to contain
##  cells that intersect these regions, but have their centroid
##  elsewhere, then set this variable on.  By default it is off.
##  virtual void IncludeAllIntersectingCellsOn ( ) { this -> SetRetainKdtreeIncludeAllIntersectingCells ( static_cast < int > ( 1 ) ) ; } virtual void IncludeAllIntersectingCellsOff ( ) { this -> SetRetainKdtreeIncludeAllIntersectingCells ( static_cast < int > ( 0 ) ) ; } ; virtual int GetRetainKdtreeIncludeAllIntersectingCells ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IncludeAllIntersectingCells  of  << this -> IncludeAllIntersectingCells ) ; return this -> IncludeAllIntersectingCells ; } ; virtual void SetRetainKdtreeIncludeAllIntersectingCells ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  IncludeAllIntersectingCells  to  << _arg ) ; if ( this -> IncludeAllIntersectingCells != _arg ) { this -> IncludeAllIntersectingCells = _arg ; this -> Modified ( ) ; } } ; *
##  Set this variable if you want the cells of the output
##  vtkUnstructuredGrid to be clipped to the spatial region
##  boundaries.  By default this is off.
##  virtual void ClipCellsOn ( ) { this -> SetRetainKdtreeIncludeAllIntersectingCellsClipCells ( static_cast < int > ( 1 ) ) ; } virtual void ClipCellsOff ( ) { this -> SetRetainKdtreeIncludeAllIntersectingCellsClipCells ( static_cast < int > ( 0 ) ) ; } ; virtual int GetRetainKdtreeIncludeAllIntersectingCellsClipCells ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ClipCells  of  << this -> ClipCells ) ; return this -> ClipCells ; } ; virtual void SetRetainKdtreeIncludeAllIntersectingCellsClipCells ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ClipCells  to  << _arg ) ; if ( this -> ClipCells != _arg ) { this -> ClipCells = _arg ; this -> Modified ( ) ; } } ; enum BoundaryModes { ASSIGN_TO_ONE_REGION = 0 , ASSIGN_TO_ALL_INTERSECTING_REGIONS = 1 , SPLIT_BOUNDARY_CELLS = 2 } ; /@{ *
##  Handling of ClipCells and IncludeAllIntersectingCells.
##  void SetBoundaryMode ( int mode ) ; void SetBoundaryModeToAssignToOneRegion ( ) { this -> SetBoundaryMode ( vtkDistributedDataFilter :: ASSIGN_TO_ONE_REGION ) ; } void SetBoundaryModeToAssignToAllIntersectingRegions ( ) { this -> SetBoundaryMode ( vtkDistributedDataFilter :: ASSIGN_TO_ALL_INTERSECTING_REGIONS ) ; } void SetBoundaryModeToSplitBoundaryCells ( ) { this -> SetBoundaryMode ( vtkDistributedDataFilter :: SPLIT_BOUNDARY_CELLS ) ; } int GetBoundaryMode ( ) ; /@} *
##  Ensure previous filters don't send up ghost cells
##  int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; *
##  This class does a great deal of all-to-all communication
##  when exchanging portions of data sets and building new sub
##  grids.
##  By default it will do fast communication.  It can instead
##  use communication routines that use the least possible
##  amount of memory, but these are slower.  Set this option
##  ON to choose these latter routines.
##  virtual void UseMinimalMemoryOn ( ) { this -> SetRetainKdtreeIncludeAllIntersectingCellsClipCellsUseMinimalMemory ( static_cast < int > ( 1 ) ) ; } virtual void UseMinimalMemoryOff ( ) { this -> SetRetainKdtreeIncludeAllIntersectingCellsClipCellsUseMinimalMemory ( static_cast < int > ( 0 ) ) ; } ; virtual int GetRetainKdtreeIncludeAllIntersectingCellsClipCellsUseMinimalMemory ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseMinimalMemory  of  << this -> UseMinimalMemory ) ; return this -> UseMinimalMemory ; } ; virtual void SetRetainKdtreeIncludeAllIntersectingCellsClipCellsUseMinimalMemory ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseMinimalMemory  to  << _arg ) ; if ( this -> UseMinimalMemory != _arg ) { this -> UseMinimalMemory = _arg ; this -> Modified ( ) ; } } ; *
##  The minimum number of ghost levels to add to each processor's output. If
##  the pipeline also requests ghost levels, the larger value will be used.
##  virtual int GetRetainKdtreeIncludeAllIntersectingCellsClipCellsUseMinimalMemoryMinimumGhostLevel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinimumGhostLevel  of  << this -> MinimumGhostLevel ) ; return this -> MinimumGhostLevel ; } ; virtual void SetRetainKdtreeIncludeAllIntersectingCellsClipCellsUseMinimalMemoryMinimumGhostLevel ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MinimumGhostLevel  to  << _arg ) ; if ( this -> MinimumGhostLevel != _arg ) { this -> MinimumGhostLevel = _arg ; this -> Modified ( ) ; } } ; *
##  Turn on collection of timing data
##  virtual void TimingOn ( ) { this -> SetRetainKdtreeIncludeAllIntersectingCellsClipCellsUseMinimalMemoryTiming ( static_cast < int > ( 1 ) ) ; } virtual void TimingOff ( ) { this -> SetRetainKdtreeIncludeAllIntersectingCellsClipCellsUseMinimalMemoryTiming ( static_cast < int > ( 0 ) ) ; } ; virtual void SetRetainKdtreeIncludeAllIntersectingCellsClipCellsUseMinimalMemoryMinimumGhostLevelTiming ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Timing  to  << _arg ) ; if ( this -> Timing != _arg ) { this -> Timing = _arg ; this -> Modified ( ) ; } } ; virtual int GetRetainKdtreeIncludeAllIntersectingCellsClipCellsUseMinimalMemoryMinimumGhostLevelTiming ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Timing  of  << this -> Timing ) ; return this -> Timing ; } ; *
##  You can set the k-d tree decomposition, rather than
##  have D3 compute it.  This allows you to divide a dataset using
##  the decomposition computed for another dataset.  Obtain a description
##  of the k-d tree cuts this way:
##
##  vtkBSPCuts *cuts = D3Object1->GetCuts()
##
##  And set it this way:
##
##  D3Object2->SetCuts(cuts)
##  vtkBSPCuts * GetCuts ( ) { return this -> UserCuts ; } void SetCuts ( vtkBSPCuts * cuts ) ; *
##  vtkBSPCuts doesn't have information about process assignments for the cuts.
##  Typically D3 filter simply reassigns the processes for each cut. However,
##  that may not always work, sometimes the processes have be pre-assigned and
##  we want to preserve that partitioning. In that case, one sets the region
##  assignments explicitly. Look at vtkPKdTree::AssignRegions for details about
##  the arguments. Calling SetUserRegionAssignments(nullptr, 0) will revert to
##  default behavior i.e. letting the KdTree come up with the assignments.
##  void SetUserRegionAssignments ( const int * map , int numRegions ) ; protected : vtkDistributedDataFilter ( ) ; ~ vtkDistributedDataFilter ( ) override ; *
##  Build a vtkUnstructuredGrid to store the input.
##  int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; *
##  Overridden to create the correct type of data output. If input is dataset,
##  output is vtkUnstructuredGrid. If input is composite dataset, output is
##  vtkMultiBlockDataSet.
##  int RequestDataObject ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; vtkPKdTree * Kdtree ; vtkMultiProcessController * Controller ; int NumProcesses ; int MyId ; int * Target ; int * Source ; int NumConvexSubRegions ; double * ConvexSubRegionBounds ;  User-adjustable minimum number of ghost levels. int MinimumGhostLevel ;  Actual number of ghost levels used during execution. int GhostLevel ; int RetainKdtree ; int IncludeAllIntersectingCells ; int ClipCells ; int Timing ; int NextProgressStep ; double ProgressIncrement ; int UseMinimalMemory ; vtkBSPCuts * UserCuts ; std :: vector < int > UserRegionAssignments ; private : vtkDistributedDataFilter ( const vtkDistributedDataFilter & ) = delete ; void operator = ( const vtkDistributedDataFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
