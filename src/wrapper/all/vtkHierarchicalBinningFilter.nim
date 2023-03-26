## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHierarchicalBinningFilter.h
##
##   Copyright (c) Kitware, Inc.
##   All rights reserved.
##   See LICENSE file for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkHierarchicalBinningFilter
##  @brief   uniform binning of points into
##  a hierarchical structure
##
##
##  vtkHierarchicalBinningFilter creates a spatial, hierarchical ordering of
##  input points. This hierarchy is suitable for level-of-detail rendering, or
##  multiresolution processing. Each level of the hierarchy is based on
##  uniform binning of space, where deeper levels (and its bins) are
##  repeatedly subdivided by a given branching factor. Points are associated
##  with bins at different levels, with the number of points in each level
##  proportional to the number of bins in that level. The output points are
##  sorted according to a bin number, where the bin number is unique,
##  monotonically increasing number representing the breadth first ordering of
##  all of the levels and their bins. Thus all points in a bin (or even a level)
##  are segmented into contiguous runs.
##
##  Note that points are associated with different bins using a pseudo random
##  process. No points are repeated, and no new points are created, thus the
##  effect of executing this filter is simply to reorder the input points.
##
##  The algorithm proceeds as follows: Given an initial bounding box, the
##  space is uniformally subdivided into bins of (M x N x O) dimensions; in
##  turn each subsequent level in the tree is further divided into (M x N x O)
##  bins (note that level 0 is a single, root bin). Thus the number of bins at
##  level L of the hierarchical tree is: Nbins=(M^L x N^L x O^L). Once the
##  binning is created to a specified depth, then points are placed in the
##  bins using a pseudo-random sampling proportional to the number of bins in each
##  level. All input points are sorted in the order described above, with no
##  points repeated.
##
##  The output of this filter are sorted points and associated point
##  attributes represented by a vtkPolyData. In addition, an offset integral
##  array is associated with the field data of the output, providing offsets
##  into the points list via a breadth-first traversal order. Metadata
##  describing the output is provided in the field data. Convenience functions
##  are also provided here to access the data in a particular bin or across a
##  level. (Using the offset array directly may result in higher performance.)
##
##  While any vtkPointSet type can be provided as input, the output is
##  represented by an explicit representation of points via a
##  vtkPolyData. This output polydata will populate its instance of vtkPoints,
##  but no cells will be defined (i.e., no vtkVertex or vtkPolyVertex are
##  contained in the output).
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @sa
##  vtkPointCloudFilter vtkQuadricClustering vtkStaticPointLocator
##

## !!!Ignored construct:  # vtkHierarchicalBinningFilter_h [NewLine] # vtkHierarchicalBinningFilter_h [NewLine] # vtkFiltersPointsModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] # VTK_MAX_LEVEL 12 [NewLine] struct vtkBinTree ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSPOINTS_EXPORT vtkHierarchicalBinningFilter : public vtkPolyDataAlgorithm { public : /@{ *
##  Standard methods for instantiating, obtaining type information, and
##  printing information.
##  static vtkHierarchicalBinningFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkHierarchicalBinningFilter :: IsTypeOf ( type ) ; } static vtkHierarchicalBinningFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkHierarchicalBinningFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkHierarchicalBinningFilter * NewInstance ( ) const { return vtkHierarchicalBinningFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHierarchicalBinningFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHierarchicalBinningFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Specify the number of levels in the spatial hierarchy. By default, the
##  number of levels is three.
##  virtual void SetNumberOfLevels ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << NumberOfLevels  to  << _arg ) ; if ( this -> NumberOfLevels != ( _arg < 1 ? 1 : ( _arg > VTK_MAX_LEVEL ? VTK_MAX_LEVEL : _arg ) ) ) { this -> NumberOfLevels = ( _arg < 1 ? 1 : ( _arg > VTK_MAX_LEVEL ? VTK_MAX_LEVEL : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetNumberOfLevelsMinValue ( ) { return 1 ; } virtual int GetNumberOfLevelsMaxValue ( ) { return VTK_MAX_LEVEL ; } ; virtual int GetNumberOfLevels ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfLevels  of  << this -> NumberOfLevels ) ; return this -> NumberOfLevels ; } ; /@} /@{ *
##  Specify whether to determine the determine the level divisions, and the bounding
##  box automatically (by default this is on). If off, then the user must specify both
##  the bounding box and bin divisions. (Computing the bounding box can be slow for
##  large point clouds, manual specification can save time.)
##  virtual void SetAutomatic ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Automatic  to  << _arg ) ; if ( this -> Automatic != _arg ) { this -> Automatic = _arg ; this -> Modified ( ) ; } } ; virtual bool GetNumberOfLevelsAutomatic ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Automatic  of  << this -> Automatic ) ; return this -> Automatic ; } ; virtual void AutomaticOn ( ) { this -> SetAutomatic ( static_cast < bool > ( 1 ) ) ; } virtual void AutomaticOff ( ) { this -> SetAutomatic ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Set the number of branching divisions in each binning direction. Each
##  level of the tree is subdivided by this factor. The Divisions[i] must be
##  >= 1. Note: if Automatic subdivision is specified, the Divisions are
##  set by the filter.
##  virtual void SetDivisions ( int _arg1 , int _arg2 , int _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Divisions  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Divisions [ 0 ] != _arg1 ) || ( this -> Divisions [ 1 ] != _arg2 ) || ( this -> Divisions [ 2 ] != _arg3 ) ) { this -> Divisions [ 0 ] = _arg1 ; this -> Divisions [ 1 ] = _arg2 ; this -> Divisions [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetDivisions ( const int _arg [ 3 ] ) { this -> SetDivisions ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual int * GetDivisions ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Divisions  pointer  << this -> Divisions ) ; return this -> Divisions ; } VTK_WRAPEXCLUDE virtual void GetDivisions ( int data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Divisions [ i ] ; } } ; /@} /@{ *
##  Set the bounding box of the point cloud. If Automatic is enabled, then
##  this is computed during filter execution. If manually specified
##  (Automatic is off) then make sure the bounds is represented as
##  (xmin,xmax, ymin,ymax, zmin,zmax). If the bounds specified is does not
##  enclose the points, then points are clamped to lie in the bounding box.
##  virtual void SetBounds ( double _arg1 , double _arg2 , double _arg3 , double _arg4 , double _arg5 , double _arg6 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Bounds  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; if ( ( this -> Bounds [ 0 ] != _arg1 ) || ( this -> Bounds [ 1 ] != _arg2 ) || ( this -> Bounds [ 2 ] != _arg3 ) || ( this -> Bounds [ 3 ] != _arg4 ) || ( this -> Bounds [ 4 ] != _arg5 ) || ( this -> Bounds [ 5 ] != _arg6 ) ) { this -> Bounds [ 0 ] = _arg1 ; this -> Bounds [ 1 ] = _arg2 ; this -> Bounds [ 2 ] = _arg3 ; this -> Bounds [ 3 ] = _arg4 ; this -> Bounds [ 4 ] = _arg5 ; this -> Bounds [ 5 ] = _arg6 ; this -> Modified ( ) ; } } virtual void SetBounds ( const double _arg [ 6 ] ) { this -> SetBounds ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; virtual double * GetDivisionsBounds ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Bounds  pointer  << this -> Bounds ) ; return this -> Bounds ; } VTK_WRAPEXCLUDE virtual void GetDivisionsBounds ( double data [ 6 ] ) { for ( int i = 0 ; i < 6 ; i ++ ) { data [ i ] = this -> Bounds [ i ] ; } } ; /@} *
##  Convenience methods for extracting useful information about this bin
##  tree.  Return the number of total bins across all levels (i.e., the
##  total global bins). Invoke this method after the bin tree has been
##  built.
##  int GetNumberOfGlobalBins ( ) ; *
##  Convenience methods for extracting useful information about this bin
##  tree.  Return the number of bins in a particular level of the
##  tree. Invoke this method after the bin tree has been built.
##  int GetNumberOfBins ( int level ) ; *
##  Convenience methods for extracting useful information about this bin
##  tree.  Given a level, return the beginning point id and number of points
##  that level. Invoke this method after the bin tree has been built.
##  vtkIdType GetLevelOffset ( int level , vtkIdType & npts ) ; *
##  Convenience methods for extracting useful information about this bin
##  tree.  Given a global bin number, return the point id and number of
##  points for that bin. Invoke this method after the bin tree has been
##  built.
##  vtkIdType GetBinOffset ( int globalBin , vtkIdType & npts ) ; *
##  Convenience methods for extracting useful information about this bin
##  tree.  Given a level, and the bin number in that level, return the
##  offset point id and number of points for that bin. Invoke this method
##  after the bin tree has been built.
##  vtkIdType GetLocalBinOffset ( int level , int localBin , vtkIdType & npts ) ; *
##  Convenience methods for extracting useful information about a bin tree.
##  Given a global bin number, return the bounds (xmin,xmax,ymin,ymax,zmin,zmax)
##  for that bin. Invoke this method after the bin tree has been built.
##  void GetBinBounds ( int globalBin , double bounds [ 6 ] ) ; *
##  Convenience methods for extracting useful information about a bin tree.
##  Given a level, and a local bin number, return the bounds
##  (xmin,xmax,ymin,ymax,zmin,zmax) for that bin. Invoke this method after
##  the bin tree has been built.
##  void GetLocalBinBounds ( int level , int localBin , double bounds [ 6 ] ) ; protected : vtkHierarchicalBinningFilter ( ) ; ~ vtkHierarchicalBinningFilter ( ) override ;  IVars int NumberOfLevels ; bool Automatic ; int Divisions [ 3 ] ; double Bounds [ 6 ] ;  Handle to the underlying implementation. The representation is maintained so
##  that the convenience functions can be invoked on the bin tree. vtkBinTree * Tree ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; private : vtkHierarchicalBinningFilter ( const vtkHierarchicalBinningFilter & ) = delete ; void operator = ( const vtkHierarchicalBinningFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
