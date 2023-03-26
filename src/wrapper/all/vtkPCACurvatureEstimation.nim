## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPCACurvatureEstimation.h
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
##  @class   vtkPCACurvatureEstimation
##  @brief   generate curvature estimates using
##  principal component analysis
##
##
##  vtkPCACurvatureEstimation generates point normals using PCA (principal
##  component analysis).  Basically this estimates a local tangent plane
##  around sample point p by considering a small neighborhood of points
##  around p, and fitting a plane to the neighborhood (via PCA). A good
##  introductory reference is Hoppe's "Surface reconstruction from
##  unorganized points."
##
##  To use this filter, specify a neighborhood size. This may have to be set
##  via experimentation. Optionally a point locator can be specified (instead
##  of the default locator), which is used to accelerate searches around a
##  sample point. Finally, the user should specify how to generate
##  consistently-oriented normals. As computed by PCA, normals may point in
##  +/- orientation, which may not be consistent with neighboring normals.
##
##  The output of this filter is the same as the input except that a normal
##  per point is produced. (Note that these are unit normals.) While any
##  vtkPointSet type can be provided as input, the output is represented by an
##  explicit representation of points via a vtkPolyData. This output polydata
##  will populate its instance of vtkPoints, but no cells will be defined
##  (i.e., no vtkVertex or vtkPolyVertex are contained in the output).
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @sa
##  vtkPCANormalEstimation
##

## !!!Ignored construct:  # vtkPCACurvatureEstimation_h [NewLine] # vtkPCACurvatureEstimation_h [NewLine] # vtkFiltersPointsModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class vtkAbstractPointLocator ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSPOINTS_EXPORT vtkPCACurvatureEstimation : public vtkPolyDataAlgorithm { public : /@{ *
##  Standard methods for instantiating, obtaining type information, and
##  printing information.
##  static vtkPCACurvatureEstimation * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPCACurvatureEstimation :: IsTypeOf ( type ) ; } static vtkPCACurvatureEstimation * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPCACurvatureEstimation * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPCACurvatureEstimation * NewInstance ( ) const { return vtkPCACurvatureEstimation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPCACurvatureEstimation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPCACurvatureEstimation :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  For each sampled point, specify the number of the closest, surrounding
##  points used to estimate the normal (the so called k-neighborhood). By
##  default 25 points are used. Smaller numbers may speed performance at the
##  cost of accuracy.
##  virtual void SetSampleSize ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << SampleSize  to  << _arg ) ; if ( this -> SampleSize != ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> SampleSize = ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetSampleSizeMinValue ( ) { return 1 ; } virtual int GetSampleSizeMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetSampleSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SampleSize  of  << this -> SampleSize ) ; return this -> SampleSize ; } ; /@} /@{ *
##  Specify a point locator. By default a vtkStaticPointLocator is
##  used. The locator performs efficient searches to locate points
##  around a sample point.
##  void SetLocator ( vtkAbstractPointLocator * locator ) ; virtual vtkAbstractPointLocator * GetnameLocator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Locator  address  << static_cast < vtkAbstractPointLocator * > ( this -> Locator ) ) ; return this -> Locator ; } ; /@} protected : vtkPCACurvatureEstimation ( ) ; ~ vtkPCACurvatureEstimation ( ) override ;  IVars int SampleSize ; vtkAbstractPointLocator * Locator ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; private : vtkPCACurvatureEstimation ( const vtkPCACurvatureEstimation & ) = delete ; void operator = ( const vtkPCACurvatureEstimation & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
