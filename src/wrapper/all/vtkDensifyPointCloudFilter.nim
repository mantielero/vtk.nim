## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDensifyPointCloudFilter.h
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
##  @class   vtkDensifyPointCloudFilter
##  @brief   add points to a point cloud to make it denser
##
##  vtkDensifyPointCloudFilter adds new points to an input point cloud. The
##  new points are created in such a way that all points in any local
##  neighborhood are within a target distance of one another. Optionally,
##  attribute data can be interpolated from the input point cloud as well.
##
##  A high-level overview of the algorithm is as follows. For each input
##  point, the distance to all points in its neighborhood is computed. If any
##  of its neighbors is further than the target distance, the edge connecting
##  the point and its neighbor is bisected and a new point is inserted at the
##  bisection point (optionally the attribute data is interpolated as well). A
##  single pass is completed once all the input points are visited. Then the
##  process repeats to the limit of the maximum number of iterations.
##
##  @warning
##  This class can generate a lot of points very quickly. The maximum number
##  of iterations is by default set to =1.0 for this reason. Increase the
##  number of iterations very carefully. Also the MaximumNumberOfPoints
##  data member can be set to limit the explosion of points. It is also
##  recommended that a N closest neighborhood is used.
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @sa
##  vtkVoxelGridFilter vtkEuclideanClusterExtraction vtkBoundedPointSource
##

## !!!Ignored construct:  # vtkDensifyPointCloudFilter_h [NewLine] # vtkDensifyPointCloudFilter_h [NewLine] # vtkFiltersPointsModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class VTKFILTERSPOINTS_EXPORT vtkDensifyPointCloudFilter : public vtkPolyDataAlgorithm { public : /@{ *
##  Standard methods for instantiating, obtaining type information, and
##  printing information.
##  static vtkDensifyPointCloudFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkDensifyPointCloudFilter :: IsTypeOf ( type ) ; } static vtkDensifyPointCloudFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkDensifyPointCloudFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkDensifyPointCloudFilter * NewInstance ( ) const { return vtkDensifyPointCloudFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDensifyPointCloudFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDensifyPointCloudFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  This enum is used to specify how the local point neighborhood is
##  defined.  A radius-based neighborhood in one where all points inside a
##  specified radius is part of the neighborhood. A N closest neighborhood is
##  one in which the N closest points are part of the neighborhood. (Note that
##  in some cases, if points are precisely the same distance apart, the N closest
##  may not return all points within an expected radius.)
##  enum NeighborhoodType { RADIUS = 0 , N_CLOSEST = 1 } ; /@{ *
##  Specify how the local point neighborhood is defined. By default an N
##  closest neighborhood is used. This tends to avoid explosive point
##  creation.
##  virtual void SetNeighborhoodType ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NeighborhoodType  to  << _arg ) ; if ( this -> NeighborhoodType != _arg ) { this -> NeighborhoodType = _arg ; this -> Modified ( ) ; } } ; virtual int GetNeighborhoodType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NeighborhoodType  of  << this -> NeighborhoodType ) ; return this -> NeighborhoodType ; } ; void SetNeighborhoodTypeToRadius ( ) { this -> SetNeighborhoodType ( RADIUS ) ; } void SetNeighborhoodTypeToNClosest ( ) { this -> SetNeighborhoodType ( N_CLOSEST ) ; } /@} /@{ *
##  Define a local neighborhood for each point in terms of a local
##  radius. By default, the radius is 1.0. This data member is relevant only
##  if the neighborhood type is RADIUS.
##  virtual void SetRadius ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Radius  to  << _arg ) ; if ( this -> Radius != ( _arg < 1 ? 1 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ) { this -> Radius = ( _arg < 1 ? 1 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetRadiusMinValue ( ) { return 1 ; } virtual double GetRadiusMaxValue ( ) { return VTK_DOUBLE_MAX ; } ; virtual double GetNeighborhoodTypeRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Radius  of  << this -> Radius ) ; return this -> Radius ; } ; /@} /@{ *
##  Define a local neighborhood in terms of the N closest points. By default
##  the number of the closest points is =6. This data member is relevant
##  only if the neighborhood type is N_CLOSEST.
##  virtual void SetRadiusNumberOfClosestPoints ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << NumberOfClosestPoints  to  << _arg ) ; if ( this -> NumberOfClosestPoints != ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> NumberOfClosestPoints = ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetRadiusMinValueNumberOfClosestPointsMinValue ( ) { return 1 ; } virtual int GetRadiusMaxValueNumberOfClosestPointsMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetNeighborhoodTypeRadiusNumberOfClosestPoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfClosestPoints  of  << this -> NumberOfClosestPoints ) ; return this -> NumberOfClosestPoints ; } ; /@} /@{ *
##  Set / get the target point distance. Points will be created in an
##  iterative fashion until all points in their local neighborhood are the
##  target distance apart or less. Note that the process may terminate early
##  due to the limit on the maximum number of iterations. By default the target
##  distance is set to 0.5. Note that the TargetDistance should be less than
##  the Radius or nothing will change on output.
##  virtual void SetRadiusNumberOfClosestPointsTargetDistance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << TargetDistance  to  << _arg ) ; if ( this -> TargetDistance != ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ) { this -> TargetDistance = ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetRadiusMinValueNumberOfClosestPointsMinValueTargetDistanceMinValue ( ) { return 0.0 ; } virtual double GetRadiusMaxValueNumberOfClosestPointsMaxValueTargetDistanceMaxValue ( ) { return VTK_DOUBLE_MAX ; } ; virtual double GetNeighborhoodTypeRadiusNumberOfClosestPointsTargetDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TargetDistance  of  << this -> TargetDistance ) ; return this -> TargetDistance ; } ; /@} /@{ *
##  The maximum number of iterations to run. By default the maximum is
##  one.
##  virtual void SetRadiusNumberOfClosestPointsTargetDistanceMaximumNumberOfIterations ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << MaximumNumberOfIterations  to  << _arg ) ; if ( this -> MaximumNumberOfIterations != ( _arg < 1 ? 1 : ( _arg > VTK_SHORT_MAX ? VTK_SHORT_MAX : _arg ) ) ) { this -> MaximumNumberOfIterations = ( _arg < 1 ? 1 : ( _arg > VTK_SHORT_MAX ? VTK_SHORT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetRadiusMinValueNumberOfClosestPointsMinValueTargetDistanceMinValueMaximumNumberOfIterationsMinValue ( ) { return 1 ; } virtual int GetRadiusMaxValueNumberOfClosestPointsMaxValueTargetDistanceMaxValueMaximumNumberOfIterationsMaxValue ( ) { return VTK_SHORT_MAX ; } ; virtual int GetNeighborhoodTypeRadiusNumberOfClosestPointsTargetDistanceMaximumNumberOfIterations ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumNumberOfIterations  of  << this -> MaximumNumberOfIterations ) ; return this -> MaximumNumberOfIterations ; } ; /@} /@{ *
##  Set a limit on the maximum number of points that can be created. This
##  data member serves as a crude barrier to explosive point creation; it does
##  not guarantee that precisely these many points will be created. Once this
##  limit is hit, it may result in premature termination of the
##  algorithm. Consider it a pressure relief valve.
##  virtual void SetRadiusNumberOfClosestPointsTargetDistanceMaximumNumberOfIterationsMaximumNumberOfPoints ( vtkIdType _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << MaximumNumberOfPoints  to  << _arg ) ; if ( this -> MaximumNumberOfPoints != ( _arg < 1 ? 1 : ( _arg > VTK_ID_MAX ? VTK_ID_MAX : _arg ) ) ) { this -> MaximumNumberOfPoints = ( _arg < 1 ? 1 : ( _arg > VTK_ID_MAX ? VTK_ID_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual vtkIdType GetRadiusMinValueNumberOfClosestPointsMinValueTargetDistanceMinValueMaximumNumberOfIterationsMinValueMaximumNumberOfPointsMinValue ( ) { return 1 ; } virtual vtkIdType GetRadiusMaxValueNumberOfClosestPointsMaxValueTargetDistanceMaxValueMaximumNumberOfIterationsMaxValueMaximumNumberOfPointsMaxValue ( ) { return VTK_ID_MAX ; } ; virtual vtkIdType GetNeighborhoodTypeRadiusNumberOfClosestPointsTargetDistanceMaximumNumberOfIterationsMaximumNumberOfPoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumNumberOfPoints  of  << this -> MaximumNumberOfPoints ) ; return this -> MaximumNumberOfPoints ; } ; /@} /@{ *
##  Turn on/off the interpolation of attribute data from the input point
##  cloud to new, added points.
##  virtual void SetNeighborhoodTypeInterpolateAttributeData ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  InterpolateAttributeData  to  << _arg ) ; if ( this -> InterpolateAttributeData != _arg ) { this -> InterpolateAttributeData = _arg ; this -> Modified ( ) ; } } ; virtual bool GetNeighborhoodTypeRadiusNumberOfClosestPointsTargetDistanceMaximumNumberOfIterationsMaximumNumberOfPointsInterpolateAttributeData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InterpolateAttributeData  of  << this -> InterpolateAttributeData ) ; return this -> InterpolateAttributeData ; } ; virtual void InterpolateAttributeDataOn ( ) { this -> SetInterpolateAttributeData ( static_cast < bool > ( 1 ) ) ; } virtual void InterpolateAttributeDataOff ( ) { this -> SetInterpolateAttributeData ( static_cast < bool > ( 0 ) ) ; } ; /@} protected : vtkDensifyPointCloudFilter ( ) ; ~ vtkDensifyPointCloudFilter ( ) override ;  Data members int NeighborhoodType ; double Radius ; int NumberOfClosestPoints ; double TargetDistance ; int MaximumNumberOfIterations ; bool InterpolateAttributeData ; vtkIdType MaximumNumberOfPoints ;  Pipeline management int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; private : vtkDensifyPointCloudFilter ( const vtkDensifyPointCloudFilter & ) = delete ; void operator = ( const vtkDensifyPointCloudFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
