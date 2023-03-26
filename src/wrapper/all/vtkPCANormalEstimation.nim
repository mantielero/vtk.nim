## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPCANormalEstimation.h
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
##  @class   vtkPCANormalEstimation
##  @brief   generate point normals using local tangent planes
##
##
##  vtkPCANormalEstimation generates point normals using PCA (principal
##  component analysis).  Basically this estimates a local tangent plane
##  around each sample point p by considering a small neighborhood of points
##  around p, and fitting a plane to the neighborhood (via PCA). A good
##  introductory reference is Hoppe's "Surface reconstruction from
##  unorganized points."
##
##  To use this filter, specify a neighborhood size. This may have to be set
##  via experimentation. In addition, the user may optionally specify a point
##  locator (instead of the default locator), which is used to accelerate
##  searches around the sample point. Finally, the user should specify how to
##  generate consistently-oriented normals. As computed by PCA, normals may
##  point in arbitrary +/- orientation, which may not be consistent with
##  neighboring normals. There are three methods to address normal
##  consistency: 1) leave the normals as computed, 2) adjust the +/- sign of
##  the normals so that the normals all point towards a specified point, and
##  3) perform a traversal of the point cloud and flip neighboring normals so
##  that they are mutually consistent.
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
##  vtkPCACurvatureEstimation
##

## !!!Ignored construct:  # vtkPCANormalEstimation_h [NewLine] # vtkPCANormalEstimation_h [NewLine] # vtkFiltersPointsModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class vtkAbstractPointLocator ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkIdList"
## !!!Ignored construct:  class VTKFILTERSPOINTS_EXPORT vtkPCANormalEstimation : public vtkPolyDataAlgorithm { public : /@{ *
##  Standard methods for instantiating, obtaining type information, and
##  printing information.
##  static vtkPCANormalEstimation * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPCANormalEstimation :: IsTypeOf ( type ) ; } static vtkPCANormalEstimation * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPCANormalEstimation * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPCANormalEstimation * NewInstance ( ) const { return vtkPCANormalEstimation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPCANormalEstimation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPCANormalEstimation :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  For each sampled point, specify the number of the closest, surrounding
##  points used to estimate the normal (the so called k-neighborhood). By
##  default 25 points are used. Smaller numbers may speed performance at the
##  cost of accuracy.
##  virtual void SetSampleSize ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << SampleSize  to  << _arg ) ; if ( this -> SampleSize != ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> SampleSize = ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetSampleSizeMinValue ( ) { return 1 ; } virtual int GetSampleSizeMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetSampleSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SampleSize  of  << this -> SampleSize ) ; return this -> SampleSize ; } ; /@} *
##  This enum is used to control how normals oriented is controlled.
##  enum Style { AS_COMPUTED = 0 , POINT = 1 , GRAPH_TRAVERSAL = 3 } ; /@{ *
##  Configure how the filter addresses consistency in normal
##  oreientation. When initially computed using PCA, a point normal may
##  point in the + or - direction, which may not be consistent with
##  neighboring points. To address this, various strategies have been used
##  to create consistent normals. The simplest approach is to do nothing
##  (AsComputed). Another simple approach is to flip the normal based on its
##  direction with respect to a specified point (i.e., point normals will
##  point towrads the specified point). Finally, a full traversal of points
##  across the graph of neighboring, connected points produces the best
##  results but is computationally expensive.
##  virtual void SetNormalOrientation ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NormalOrientation  to  << _arg ) ; if ( this -> NormalOrientation != _arg ) { this -> NormalOrientation = _arg ; this -> Modified ( ) ; } } ; virtual int GetSampleSizeNormalOrientation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NormalOrientation  of  << this -> NormalOrientation ) ; return this -> NormalOrientation ; } ; void SetNormalOrientationToAsComputed ( ) { this -> SetNormalOrientation ( AS_COMPUTED ) ; } void SetNormalOrientationToPoint ( ) { this -> SetNormalOrientation ( POINT ) ; } void SetNormalOrientationToGraphTraversal ( ) { this -> SetNormalOrientation ( GRAPH_TRAVERSAL ) ; } /@} /@{ *
##  If the normal orientation is to be consistent with a specified
##  direction, then an orientation point should be set. The sign of the
##  normals will be modified so that they point towards this point. By
##  default, the specified orientation point is (0,0,0).
##  virtual void SetOrientationPoint ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << OrientationPoint  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> OrientationPoint [ 0 ] != _arg1 ) || ( this -> OrientationPoint [ 1 ] != _arg2 ) || ( this -> OrientationPoint [ 2 ] != _arg3 ) ) { this -> OrientationPoint [ 0 ] = _arg1 ; this -> OrientationPoint [ 1 ] = _arg2 ; this -> OrientationPoint [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetOrientationPoint ( const double _arg [ 3 ] ) { this -> SetOrientationPoint ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetOrientationPoint ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << OrientationPoint  pointer  << this -> OrientationPoint ) ; return this -> OrientationPoint ; } VTK_WRAPEXCLUDE virtual void GetOrientationPoint ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> OrientationPoint [ i ] ; } } ; /@} /@{ *
##  The normal orientation can be flipped by enabling this flag.
##  virtual void SetNormalOrientationFlipNormals ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  FlipNormals  to  << _arg ) ; if ( this -> FlipNormals != _arg ) { this -> FlipNormals = _arg ; this -> Modified ( ) ; } } ; virtual bool GetSampleSizeNormalOrientationFlipNormals ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FlipNormals  of  << this -> FlipNormals ) ; return this -> FlipNormals ; } ; virtual void FlipNormalsOn ( ) { this -> SetFlipNormals ( static_cast < bool > ( 1 ) ) ; } virtual void FlipNormalsOff ( ) { this -> SetFlipNormals ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify a point locator. By default a vtkStaticPointLocator is
##  used. The locator performs efficient searches to locate points
##  around a sample point.
##  void SetLocator ( vtkAbstractPointLocator * locator ) ; virtual vtkAbstractPointLocator * GetnameLocator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Locator  address  << static_cast < vtkAbstractPointLocator * > ( this -> Locator ) ) ; return this -> Locator ; } ; /@} protected : vtkPCANormalEstimation ( ) ; ~ vtkPCANormalEstimation ( ) override ;  IVars int SampleSize ; vtkAbstractPointLocator * Locator ; int NormalOrientation ; double OrientationPoint [ 3 ] ; bool FlipNormals ;  Methods used to produce consistent normal orientations void TraverseAndFlip ( vtkPoints * inPts , float * normals , char * pointMap , vtkIdList * wave , vtkIdList * wave2 ) ;  Pipeline management int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; private : vtkPCANormalEstimation ( const vtkPCANormalEstimation & ) = delete ; void operator = ( const vtkPCANormalEstimation & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
