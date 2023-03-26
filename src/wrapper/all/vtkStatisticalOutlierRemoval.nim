## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkStatisticalOutlierRemoval.h
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
##  @class   vtkStatisticalOutlierRemoval
##  @brief   remove sparse outlier points
##
##
##  The vtkStatisticalOutlierRemoval filter removes sparse outlier points
##  through statistical analysis. The average (mean) distance between points
##  in the point cloud is computed (taking a local sample size around each
##  point); followed by computation of the global standard deviation of
##  distances between points. This global, statistical information is compared
##  against the mean separation distance for each point; those points whose
##  average separation is greater than the user-specified variation in
##  a multiple of standard deviation are removed.
##
##  Note that while any vtkPointSet type can be provided as input, the output is
##  represented by an explicit representation of points via a
##  vtkPolyData. This output polydata will populate its instance of vtkPoints,
##  but no cells will be defined (i.e., no vtkVertex or vtkPolyVertex are
##  contained in the output). Also, after filter execution, the user can
##  request a vtkIdType* map which indicates how the input points were mapped
##  to the output. A value of map[i] (where i is the ith input point) less
##  than 0 means that the ith input point was removed. (See also the
##  superclass documentation for accessing the removed points through the
##  filter's second output.)
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @sa
##  vtkPointCloudFilter vtkRadiusOutlierRemoval vtkExtractPoints
##  vtkThresholdPoints
##

## !!!Ignored construct:  # vtkStatisticalOutlierRemoval_h [NewLine] # vtkStatisticalOutlierRemoval_h [NewLine] # vtkFiltersPointsModule.h  For export macro # vtkPointCloudFilter.h [NewLine] class vtkAbstractPointLocator ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPointSet"
## !!!Ignored construct:  class VTKFILTERSPOINTS_EXPORT vtkStatisticalOutlierRemoval : public vtkPointCloudFilter { public : /@{ *
##  Standard methods for instantiating, obtaining type information, and
##  printing information.
##  static vtkStatisticalOutlierRemoval * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPointCloudFilter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPointCloudFilter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkStatisticalOutlierRemoval :: IsTypeOf ( type ) ; } static vtkStatisticalOutlierRemoval * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkStatisticalOutlierRemoval * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkStatisticalOutlierRemoval * NewInstance ( ) const { return vtkStatisticalOutlierRemoval :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPointCloudFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkStatisticalOutlierRemoval :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkStatisticalOutlierRemoval :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  For each point sampled, specify the number of the closest, surrounding
##  points used to compute statistics. By default 25 points are used. Smaller
##  numbers may speed performance.
##  virtual void SetSampleSize ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << SampleSize  to  << _arg ) ; if ( this -> SampleSize != ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> SampleSize = ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetSampleSizeMinValue ( ) { return 1 ; } virtual int GetSampleSizeMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetSampleSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SampleSize  of  << this -> SampleSize ) ; return this -> SampleSize ; } ; /@} /@{ *
##  The filter uses this specified standard deviation factor to extract
##  points. By default, points within 1.0 standard deviations (i.e., a
##  StandardDeviationFactor=1.0) of the mean distance to neighboring
##  points are retained.
##  virtual void SetSampleSizeStandardDeviationFactor ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << StandardDeviationFactor  to  << _arg ) ; if ( this -> StandardDeviationFactor != ( _arg < 0.0 ? 0.0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ) { this -> StandardDeviationFactor = ( _arg < 0.0 ? 0.0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetSampleSizeMinValueStandardDeviationFactorMinValue ( ) { return 0.0 ; } virtual double GetSampleSizeMaxValueStandardDeviationFactorMaxValue ( ) { return VTK_FLOAT_MAX ; } ; virtual double GetSampleSizeStandardDeviationFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << StandardDeviationFactor  of  << this -> StandardDeviationFactor ) ; return this -> StandardDeviationFactor ; } ; /@} /@{ *
##  Specify a point locator. By default a vtkStaticPointLocator is
##  used. The locator performs efficient searches to locate points
##  surroinding a sample point.
##  void SetLocator ( vtkAbstractPointLocator * locator ) ; virtual vtkAbstractPointLocator * GetnameLocator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Locator  address  << static_cast < vtkAbstractPointLocator * > ( this -> Locator ) ) ; return this -> Locator ; } ; /@} /@{ *
##  After execution, return the value of the computed mean. Before execution
##  the value returned is invalid.
##  virtual void SetSampleSizeStandardDeviationFactorComputedMean ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ComputedMean  to  << _arg ) ; if ( this -> ComputedMean != ( _arg < 0.0 ? 0.0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ) { this -> ComputedMean = ( _arg < 0.0 ? 0.0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetSampleSizeMinValueStandardDeviationFactorMinValueComputedMeanMinValue ( ) { return 0.0 ; } virtual double GetSampleSizeMaxValueStandardDeviationFactorMaxValueComputedMeanMaxValue ( ) { return VTK_FLOAT_MAX ; } ; virtual double GetSampleSizeStandardDeviationFactorComputedMean ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputedMean  of  << this -> ComputedMean ) ; return this -> ComputedMean ; } ; /@} /@{ *
##  After execution, return the value of the computed sigma (standard
##  deviation). Before execution the value returned is invalid.
##  virtual void SetSampleSizeStandardDeviationFactorComputedMeanComputedStandardDeviation ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ComputedStandardDeviation  to  << _arg ) ; if ( this -> ComputedStandardDeviation != ( _arg < 0.0 ? 0.0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ) { this -> ComputedStandardDeviation = ( _arg < 0.0 ? 0.0 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetSampleSizeMinValueStandardDeviationFactorMinValueComputedMeanMinValueComputedStandardDeviationMinValue ( ) { return 0.0 ; } virtual double GetSampleSizeMaxValueStandardDeviationFactorMaxValueComputedMeanMaxValueComputedStandardDeviationMaxValue ( ) { return VTK_FLOAT_MAX ; } ; virtual double GetSampleSizeStandardDeviationFactorComputedMeanComputedStandardDeviation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputedStandardDeviation  of  << this -> ComputedStandardDeviation ) ; return this -> ComputedStandardDeviation ; } ; /@} protected : vtkStatisticalOutlierRemoval ( ) ; ~ vtkStatisticalOutlierRemoval ( ) override ; int SampleSize ; double StandardDeviationFactor ; vtkAbstractPointLocator * Locator ;  Derived quantities double ComputedMean ; double ComputedStandardDeviation ;  All derived classes must implement this method. Note that a side effect of
##  the class is to populate the PointMap. Zero is returned if there is a failure. int FilterPoints ( vtkPointSet * input ) override ; private : vtkStatisticalOutlierRemoval ( const vtkStatisticalOutlierRemoval & ) = delete ; void operator = ( const vtkStatisticalOutlierRemoval & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
