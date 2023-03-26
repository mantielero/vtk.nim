## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkIterativeClosestPointTransform.h
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
##  @class   vtkIterativeClosestPointTransform
##  @brief   Implementation of the ICP algorithm.
##
##  Match two surfaces using the iterative closest point (ICP) algorithm.
##  The core of the algorithm is to match each vertex in one surface with
##  the closest surface point on the other, then apply the transformation
##  that modify one surface to best match the other (in a least square sense).
##  This has to be iterated to get proper convergence of the surfaces.
##  @attention
##  Use vtkTransformPolyDataFilter to apply the resulting ICP transform to
##  your data. You might also set it to your actor's user transform.
##  @attention
##  This class makes use of vtkLandmarkTransform internally to compute the
##  best fit. Use the GetLandmarkTransform member to get a pointer to that
##  transform and set its parameters. You might, for example, constrain the
##  number of degrees of freedom of the solution (i.e. rigid body, similarity,
##  etc.) by checking the vtkLandmarkTransform documentation for its SetMode
##  member.
##  @sa
##  vtkLandmarkTransform
##

## !!!Ignored construct:  # vtkIterativeClosestPointTransform_h [NewLine] # vtkIterativeClosestPointTransform_h [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkLinearTransform.h [NewLine] # VTK_ICP_MODE_RMS 0 [NewLine] # VTK_ICP_MODE_AV 1 [NewLine] class vtkCellLocator ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkLandmarkTransform"
discard "forward decl of vtkDataSet"
## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkIterativeClosestPointTransform : public vtkLinearTransform { public : static vtkIterativeClosestPointTransform * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkLinearTransform Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkLinearTransform :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkIterativeClosestPointTransform :: IsTypeOf ( type ) ; } static vtkIterativeClosestPointTransform * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkIterativeClosestPointTransform * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkIterativeClosestPointTransform * NewInstance ( ) const { return vtkIterativeClosestPointTransform :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkLinearTransform :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkIterativeClosestPointTransform :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkIterativeClosestPointTransform :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Specify the source and target data sets.
##  void SetSource ( vtkDataSet * source ) ; void SetTarget ( vtkDataSet * target ) ; virtual vtkDataSet * GetnameSource ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Source  address  << static_cast < vtkDataSet * > ( this -> Source ) ) ; return this -> Source ; } ; virtual vtkDataSet * GetnameSourceTarget ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Target  address  << static_cast < vtkDataSet * > ( this -> Target ) ) ; return this -> Target ; } ; /@} /@{ *
##  Set/Get a spatial locator for speeding up the search process.
##  An instance of vtkCellLocator is used by default.
##  void SetLocator ( vtkCellLocator * locator ) ; virtual vtkCellLocator * GetnameSourceTargetLocator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Locator  address  << static_cast < vtkCellLocator * > ( this -> Locator ) ) ; return this -> Locator ; } ; /@} /@{ *
##  Set/Get the maximum number of iterations. Default is 50.
##  virtual void SetMaximumNumberOfIterations ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MaximumNumberOfIterations  to  << _arg ) ; if ( this -> MaximumNumberOfIterations != _arg ) { this -> MaximumNumberOfIterations = _arg ; this -> Modified ( ) ; } } ; virtual int GetMaximumNumberOfIterations ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumNumberOfIterations  of  << this -> MaximumNumberOfIterations ) ; return this -> MaximumNumberOfIterations ; } ; /@} /@{ *
##  Get the number of iterations since the last update
##  virtual int GetMaximumNumberOfIterationsNumberOfIterations ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfIterations  of  << this -> NumberOfIterations ) ; return this -> NumberOfIterations ; } ; /@} /@{ *
##  Force the algorithm to check the mean distance between two iterations.
##  Default is Off.
##  virtual void SetMaximumNumberOfIterationsCheckMeanDistance ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CheckMeanDistance  to  << _arg ) ; if ( this -> CheckMeanDistance != _arg ) { this -> CheckMeanDistance = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetMaximumNumberOfIterationsNumberOfIterationsCheckMeanDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CheckMeanDistance  of  << this -> CheckMeanDistance ) ; return this -> CheckMeanDistance ; } ; virtual void CheckMeanDistanceOn ( ) { this -> SetCheckMeanDistance ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void CheckMeanDistanceOff ( ) { this -> SetCheckMeanDistance ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify the mean distance mode. This mode expresses how the mean
##  distance is computed. The RMS mode is the square root of the average
##  of the sum of squares of the closest point distances. The Absolute
##  Value mode is the mean of the sum of absolute values of the closest
##  point distances. The default is VTK_ICP_MODE_RMS
##  virtual void SetMeanDistanceMode ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << MeanDistanceMode  to  << _arg ) ; if ( this -> MeanDistanceMode != ( _arg < VTK_ICP_MODE_RMS ? VTK_ICP_MODE_RMS : ( _arg > VTK_ICP_MODE_AV ? VTK_ICP_MODE_AV : _arg ) ) ) { this -> MeanDistanceMode = ( _arg < VTK_ICP_MODE_RMS ? VTK_ICP_MODE_RMS : ( _arg > VTK_ICP_MODE_AV ? VTK_ICP_MODE_AV : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetMeanDistanceModeMinValue ( ) { return VTK_ICP_MODE_RMS ; } virtual int GetMeanDistanceModeMaxValue ( ) { return VTK_ICP_MODE_AV ; } ; virtual int GetMaximumNumberOfIterationsNumberOfIterationsCheckMeanDistanceMeanDistanceMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MeanDistanceMode  of  << this -> MeanDistanceMode ) ; return this -> MeanDistanceMode ; } ; void SetMeanDistanceModeToRMS ( ) { this -> SetMeanDistanceMode ( VTK_ICP_MODE_RMS ) ; } void SetMeanDistanceModeToAbsoluteValue ( ) { this -> SetMeanDistanceMode ( VTK_ICP_MODE_AV ) ; } const char * GetMeanDistanceModeAsString ( ) ; /@} /@{ *
##  Set/Get the maximum mean distance between two iteration. If the mean
##  distance is lower than this, the convergence stops. The default
##  is 0.01.
##  virtual void SetMaximumNumberOfIterationsCheckMeanDistanceMaximumMeanDistance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MaximumMeanDistance  to  << _arg ) ; if ( this -> MaximumMeanDistance != _arg ) { this -> MaximumMeanDistance = _arg ; this -> Modified ( ) ; } } ; virtual double GetMaximumNumberOfIterationsNumberOfIterationsCheckMeanDistanceMeanDistanceModeMaximumMeanDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumMeanDistance  of  << this -> MaximumMeanDistance ) ; return this -> MaximumMeanDistance ; } ; /@} /@{ *
##  Get the mean distance between the last two iterations.
##  virtual double GetMaximumNumberOfIterationsNumberOfIterationsCheckMeanDistanceMeanDistanceModeMaximumMeanDistanceMeanDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MeanDistance  of  << this -> MeanDistance ) ; return this -> MeanDistance ; } ; /@} /@{ *
##  Set/Get the maximum number of landmarks sampled in your dataset.
##  If your dataset is dense, then you will typically not need all the
##  points to compute the ICP transform. The default is 200.
##  virtual void SetMaximumNumberOfIterationsCheckMeanDistanceMaximumMeanDistanceMaximumNumberOfLandmarks ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MaximumNumberOfLandmarks  to  << _arg ) ; if ( this -> MaximumNumberOfLandmarks != _arg ) { this -> MaximumNumberOfLandmarks = _arg ; this -> Modified ( ) ; } } ; virtual int GetMaximumNumberOfIterationsNumberOfIterationsCheckMeanDistanceMeanDistanceModeMaximumMeanDistanceMeanDistanceMaximumNumberOfLandmarks ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumNumberOfLandmarks  of  << this -> MaximumNumberOfLandmarks ) ; return this -> MaximumNumberOfLandmarks ; } ; /@} /@{ *
##  Starts the process by translating source centroid to target centroid.
##  The default is Off.
##  virtual void SetMaximumNumberOfIterationsCheckMeanDistanceMaximumMeanDistanceMaximumNumberOfLandmarksStartByMatchingCentroids ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  StartByMatchingCentroids  to  << _arg ) ; if ( this -> StartByMatchingCentroids != _arg ) { this -> StartByMatchingCentroids = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetMaximumNumberOfIterationsNumberOfIterationsCheckMeanDistanceMeanDistanceModeMaximumMeanDistanceMeanDistanceMaximumNumberOfLandmarksStartByMatchingCentroids ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << StartByMatchingCentroids  of  << this -> StartByMatchingCentroids ) ; return this -> StartByMatchingCentroids ; } ; virtual void StartByMatchingCentroidsOn ( ) { this -> SetCheckMeanDistanceStartByMatchingCentroids ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void StartByMatchingCentroidsOff ( ) { this -> SetCheckMeanDistanceStartByMatchingCentroids ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Get the internal landmark transform. Use it to constrain the number of
##  degrees of freedom of the solution (i.e. rigid body, similarity, etc.).
##  virtual vtkLandmarkTransform * GetnameSourceTargetLocatorLandmarkTransform ( ) { vtkDebugWithObjectMacro ( this , <<  returning  LandmarkTransform  address  << static_cast < vtkLandmarkTransform * > ( this -> LandmarkTransform ) ) ; return this -> LandmarkTransform ; } ; /@} *
##  Invert the transformation.  This is done by switching the
##  source and target.
##  void Inverse ( ) override ; *
##  Make another transform of the same type.
##  vtkAbstractTransform * MakeTransform ( ) override ; protected : /@{ *
##  Release source and target
##  void ReleaseSource ( void ) ; void ReleaseTarget ( void ) ; /@} *
##  Release locator
##  void ReleaseLocator ( void ) ; *
##  Create default locator. Used to create one when none is specified.
##  void CreateDefaultLocator ( void ) ; *
##  Get the MTime of this object also considering the locator.
##  vtkMTimeType GetMTime ( ) override ; vtkIterativeClosestPointTransform ( ) ; ~ vtkIterativeClosestPointTransform ( ) override ; void InternalUpdate ( ) override ; *
##  This method does no type checking, use DeepCopy instead.
##  void InternalDeepCopy ( vtkAbstractTransform * transform ) override ; vtkDataSet * Source ; vtkDataSet * Target ; vtkCellLocator * Locator ; int MaximumNumberOfIterations ; vtkTypeBool CheckMeanDistance ; int MeanDistanceMode ; double MaximumMeanDistance ; int MaximumNumberOfLandmarks ; vtkTypeBool StartByMatchingCentroids ; int NumberOfIterations ; double MeanDistance ; vtkLandmarkTransform * LandmarkTransform ; private : vtkIterativeClosestPointTransform ( const vtkIterativeClosestPointTransform & ) = delete ; void operator = ( const vtkIterativeClosestPointTransform & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
