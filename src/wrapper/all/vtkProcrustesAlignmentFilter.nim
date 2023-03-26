## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkProcrustesAlignmentFilter.h
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
##  @class   vtkProcrustesAlignmentFilter
##  @brief   aligns a set of pointsets together
##
##
##  vtkProcrustesAlignmentFilter is a filter that takes a set of pointsets
##  (any object derived from vtkPointSet) and aligns them in a least-squares
##  sense to their mutual mean. The algorithm is iterated until convergence,
##  as the mean must be recomputed after each alignment.
##
##  vtkProcrustesAlignmentFilter requires a vtkMultiBlock input consisting
##  of vtkPointSets as first level children.
##
##  The default (in vtkLandmarkTransform) is for a similarity alignment.
##  For a rigid-body alignment (to build a 'size-and-shape' model) use:
##
##     GetLandmarkTransform()->SetModeToRigidBody().
##
##  Affine alignments are not normally used but are left in for completeness:
##
##     GetLandmarkTransform()->SetModeToAffine().
##
##  vtkProcrustesAlignmentFilter is an implementation of:
##
##     J.C. Gower (1975)
##     Generalized Procrustes Analysis. Psychometrika, 40:33-51.
##
##  @warning
##  All of the input pointsets must have the same number of points.
##
##  @par Thanks:
##  Tim Hutton and Rasmus Paulsen who developed and contributed this class
##
##  @sa
##  vtkLandmarkTransform
##

## !!!Ignored construct:  # vtkProcrustesAlignmentFilter_h [NewLine] # vtkProcrustesAlignmentFilter_h [NewLine] # vtkFiltersHybridModule.h  For export macro # vtkMultiBlockDataSetAlgorithm.h [NewLine] class vtkLandmarkTransform ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPointSet"
discard "forward decl of vtkPoints"
## !!!Ignored construct:  class VTKFILTERSHYBRID_EXPORT vtkProcrustesAlignmentFilter : public vtkMultiBlockDataSetAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkMultiBlockDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkMultiBlockDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkProcrustesAlignmentFilter :: IsTypeOf ( type ) ; } static vtkProcrustesAlignmentFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkProcrustesAlignmentFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkProcrustesAlignmentFilter * NewInstance ( ) const { return vtkProcrustesAlignmentFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMultiBlockDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkProcrustesAlignmentFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkProcrustesAlignmentFilter :: New ( ) ; } public : ; *
##  Prints information about the state of the filter.
##  void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Creates with similarity transform.
##  static vtkProcrustesAlignmentFilter * New ( ) ; /@{ *
##  Get the internal landmark transform. Use it to constrain the number of
##  degrees of freedom of the alignment (i.e. rigid body, similarity, etc.).
##  The default is a similarity alignment.
##  virtual vtkLandmarkTransform * GetnameLandmarkTransform ( ) { vtkDebugWithObjectMacro ( this , <<  returning  LandmarkTransform  address  << static_cast < vtkLandmarkTransform * > ( this -> LandmarkTransform ) ) ; return this -> LandmarkTransform ; } ; /@} /@{ *
##  Get the estimated mean point cloud
##  virtual vtkPoints * GetnameLandmarkTransformMeanPoints ( ) { vtkDebugWithObjectMacro ( this , <<  returning  MeanPoints  address  << static_cast < vtkPoints * > ( this -> MeanPoints ) ) ; return this -> MeanPoints ; } ; /@} /@{ *
##  When on, the initial alignment is to the centroid
##  of the cohort curves.  When off, the alignment is to the
##  centroid of the first input.  Default is off for
##  backward compatibility.
##  virtual void SetStartFromCentroid ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  StartFromCentroid  to  << _arg ) ; if ( this -> StartFromCentroid != _arg ) { this -> StartFromCentroid = _arg ; this -> Modified ( ) ; } } ; virtual bool GetStartFromCentroid ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << StartFromCentroid  of  << this -> StartFromCentroid ) ; return this -> StartFromCentroid ; } ; virtual void StartFromCentroidOn ( ) { this -> SetStartFromCentroid ( static_cast < bool > ( 1 ) ) ; } virtual void StartFromCentroidOff ( ) { this -> SetStartFromCentroid ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/get the desired precision for the output types. See the documentation
##  for the vtkAlgorithm::DesiredOutputPrecision enum for an explanation of
##  the available precision settings. If the desired precision is
##  DEFAULT_PRECISION and any of the inputs are double precision, then the
##  mean points will be double precision. Otherwise, if the desired
##  precision is DEFAULT_PRECISION and all the inputs are single precision,
##  then the mean points will be single precision.
##  virtual void SetStartFromCentroidOutputPointsPrecision ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputPointsPrecision  to  << _arg ) ; if ( this -> OutputPointsPrecision != _arg ) { this -> OutputPointsPrecision = _arg ; this -> Modified ( ) ; } } ; virtual int GetStartFromCentroidOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ; /@} protected : vtkProcrustesAlignmentFilter ( ) ; ~ vtkProcrustesAlignmentFilter ( ) override ; *
##  Usual data generation method.
##  int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; vtkLandmarkTransform * LandmarkTransform ; bool StartFromCentroid ; vtkPoints * MeanPoints ; int OutputPointsPrecision ; private : vtkProcrustesAlignmentFilter ( const vtkProcrustesAlignmentFilter & ) = delete ; void operator = ( const vtkProcrustesAlignmentFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
