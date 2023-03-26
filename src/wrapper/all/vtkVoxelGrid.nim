## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkVoxelGrid.h
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
##  @class   vtkVoxelGrid
##  @brief   subsample points using uniform binning
##
##
##  vtkVoxelGrid is a filter that subsamples a point cloud based on a regular
##  binning of space. Basically the algorithm operates by dividing space into
##  a volume of M x N x O bins, and then for each bin averaging all of the
##  points positions into a single representative point. Several strategies for
##  computing the binning can be used: 1) manual configuration of a requiring
##  specifying bin dimensions (the bounds are calculated from the data); 2) by
##  explicit specification of the bin size in world coordinates (x-y-z
##  lengths); and 3) an automatic process in which the user specifies an
##  approximate, average number of points per bin and dimensions and bin size
##  are computed automatically. (Note that under the hood a
##  vtkStaticPointLocator is used.)
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
##  vtkStaticPointLocator vtkPointCloudFilter vtkQuadricClustering
##

## !!!Ignored construct:  # vtkVoxelGrid_h [NewLine] # vtkVoxelGrid_h [NewLine] # vtkFiltersPointsModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class vtkStaticPointLocator ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkInterpolationKernel"
## !!!Ignored construct:  class VTKFILTERSPOINTS_EXPORT vtkVoxelGrid : public vtkPolyDataAlgorithm { public : /@{ *
##  Standard methods for instantiating, obtaining type information, and
##  printing information.
##  static vtkVoxelGrid * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkVoxelGrid :: IsTypeOf ( type ) ; } static vtkVoxelGrid * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkVoxelGrid * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkVoxelGrid * NewInstance ( ) const { return vtkVoxelGrid :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkVoxelGrid :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkVoxelGrid :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  This enum is used to configure the operation of the filter.
##  enum Style { MANUAL = 0 , SPECIFY_LEAF_SIZE = 1 , AUTOMATIC = 2 } ; /@{ *
##  Configure how the filter is to operate. The user can choose to manually
##  specify the binning volume (by setting its dimensions via MANUAL style); or
##  specify a leaf bin size in the x-y-z directions (SPECIFY_LEAF_SIZE); or
##  in AUTOMATIC style, use a rough average number of points in each bin
##  guide the bin size and binning volume dimensions. By default, AUTOMATIC
##  configuration style is used.
##  virtual void SetConfigurationStyle ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ConfigurationStyle  to  << _arg ) ; if ( this -> ConfigurationStyle != _arg ) { this -> ConfigurationStyle = _arg ; this -> Modified ( ) ; } } ; virtual int GetConfigurationStyle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ConfigurationStyle  of  << this -> ConfigurationStyle ) ; return this -> ConfigurationStyle ; } ; void SetConfigurationStyleToManual ( ) { this -> SetConfigurationStyle ( MANUAL ) ; } void SetConfigurationStyleToLeafSize ( ) { this -> SetConfigurationStyle ( SPECIFY_LEAF_SIZE ) ; } void SetConfigurationStyleToAutomatic ( ) { this -> SetConfigurationStyle ( AUTOMATIC ) ; } /@} /@{ *
##  Set the number of divisions in x-y-z directions (the binning volume
##  dimensions). This data member is used when the configuration style is
##  set to MANUAL. Note that these values may be adjusted if <1 or too
##  large.
##  virtual void SetDivisions ( int _arg1 , int _arg2 , int _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Divisions  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Divisions [ 0 ] != _arg1 ) || ( this -> Divisions [ 1 ] != _arg2 ) || ( this -> Divisions [ 2 ] != _arg3 ) ) { this -> Divisions [ 0 ] = _arg1 ; this -> Divisions [ 1 ] = _arg2 ; this -> Divisions [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetDivisions ( const int _arg [ 3 ] ) { this -> SetDivisions ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual int * GetDivisions ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Divisions  pointer  << this -> Divisions ) ; return this -> Divisions ; } VTK_WRAPEXCLUDE virtual void GetDivisions ( int data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Divisions [ i ] ; } } ; /@} /@{ *
##  Set the bin size in the x-y-z directions. This data member is
##  used when the configuration style is set to SPECIFY_LEAF_SIZE. The class will
##  use these x-y-z lengths, within the bounding box of the point cloud,
##  to determine the binning dimensions.
##  virtual void SetDivisionsLeafSize ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << LeafSize  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> LeafSize [ 0 ] != _arg1 ) || ( this -> LeafSize [ 1 ] != _arg2 ) || ( this -> LeafSize [ 2 ] != _arg3 ) ) { this -> LeafSize [ 0 ] = _arg1 ; this -> LeafSize [ 1 ] = _arg2 ; this -> LeafSize [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetDivisionsLeafSize ( const double _arg [ 3 ] ) { this -> SetDivisionsLeafSize ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetDivisionsLeafSize ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << LeafSize  pointer  << this -> LeafSize ) ; return this -> LeafSize ; } VTK_WRAPEXCLUDE virtual void GetDivisionsLeafSize ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> LeafSize [ i ] ; } } ; /@} /@{ *
##  Specify the average number of points in each bin. Larger values
##  result in higher rates of subsampling. This data member is used when the
##  configuration style is set to AUTOMATIC. The class will automatically
##  determine the binning dimensions in the x-y-z directions.
##  virtual void SetNumberOfPointsPerBin ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << NumberOfPointsPerBin  to  << _arg ) ; if ( this -> NumberOfPointsPerBin != ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> NumberOfPointsPerBin = ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetNumberOfPointsPerBinMinValue ( ) { return 1 ; } virtual int GetNumberOfPointsPerBinMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetConfigurationStyleNumberOfPointsPerBin ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfPointsPerBin  of  << this -> NumberOfPointsPerBin ) ; return this -> NumberOfPointsPerBin ; } ; /@} /@{ *
##  Specify an interpolation kernel to combine the point attributes. By
##  default a vtkLinearKernel is used (i.e., average values). The
##  interpolation kernel changes the basis of the interpolation.
##  void SetKernel ( vtkInterpolationKernel * kernel ) ; virtual vtkInterpolationKernel * GetnameKernel ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Kernel  address  << static_cast < vtkInterpolationKernel * > ( this -> Kernel ) ) ; return this -> Kernel ; } ; /@} protected : vtkVoxelGrid ( ) ; ~ vtkVoxelGrid ( ) override ; vtkStaticPointLocator * Locator ; int ConfigurationStyle ; int Divisions [ 3 ] ; double LeafSize [ 3 ] ; int NumberOfPointsPerBin ; vtkInterpolationKernel * Kernel ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; private : vtkVoxelGrid ( const vtkVoxelGrid & ) = delete ; void operator = ( const vtkVoxelGrid & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
