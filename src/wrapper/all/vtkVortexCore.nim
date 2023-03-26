## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkVortexCore.h
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
##  @class   vtkVortexCore
##  @brief   Compute vortex core lines using the parallel vectors method
##
##  vtkVortexCore computes vortex core lines using the parallel vectors method,
##  as described in
##
##  Roth, Martin and Ronald Peikert. “A higher-order method for finding vortex
##  core lines.” Proceedings Visualization '98 (Cat. No.98CB36276) (1998):
##  143-150.
##
##  By default, the "Higher-Order" approach of computing the parallel vector
##  lines between the flow field's velocity and jerk is disabled in favor of
##  computing the parallel vector lines between the velocity and acceleration,
##  as suggested in
##
##  Haimes, Robert and David N. Kenwright. “On the velocity gradient tensor and
##  fluid feature extraction.” (1999).
##
##  To further discriminate against spurious vortex cores, at each potential point
##  value the Q-criterion, delta-criterion, and lambda_2-criterion are checked as
##  defined in
##
##  Haller, G. (2005). An objective definition of a vortex. Journal of Fluid
##  Mechanics, 525, 1-26.
##
##  Additionally, the lambda_ci criterion is computed as defined in
##
##  Chakraborty, P., Balachandar, S., & Adran, R. (2005). On the relationships
##  between local vortex identification schemes. Journal of Fluid Mechanics, 535,
##  189-214.
##
##  The Q-criterion and delta-criterion are used to prefilter cells
##  prior to the execution of the parallel lines algorithm, and all criteria
##  values are stored as point values on the output polylines.
##
##  The FasterApproximation option uses a faster approximate gradient calculation
##  to accelerate the vortex core calculation.
##
##  @sa
##  vtkParallelVectors
##

## !!!Ignored construct:  # vtkVortexCore_h [NewLine] # vtkVortexCore_h [NewLine] # vtkFiltersFlowPathsModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class VTKFILTERSFLOWPATHS_EXPORT vtkVortexCore : public vtkPolyDataAlgorithm { public : static vtkVortexCore * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkVortexCore :: IsTypeOf ( type ) ; } static vtkVortexCore * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkVortexCore * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkVortexCore * NewInstance ( ) const { return vtkVortexCore :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkVortexCore :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkVortexCore :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  When this flag is on, the flow field's jerk is used instead of acceleration as the
##  second vector field during the parallel vector operation. The default is off.
##  virtual void SetHigherOrderMethod ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  HigherOrderMethod  to  << _arg ) ; if ( this -> HigherOrderMethod != _arg ) { this -> HigherOrderMethod = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetHigherOrderMethod ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HigherOrderMethod  of  << this -> HigherOrderMethod ) ; return this -> HigherOrderMethod ; } ; virtual void HigherOrderMethodOn ( ) { this -> SetHigherOrderMethod ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void HigherOrderMethodOff ( ) { this -> SetHigherOrderMethod ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  When this flag is on, the gradient filter will provide a less accurate (but close)
##  algorithm that performs fewer derivative calculations (and is therefore faster).
##  The default is off.
##  virtual bool GetHigherOrderMethodFasterApproximation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FasterApproximation  of  << this -> FasterApproximation ) ; return this -> FasterApproximation ; } ; virtual void SetHigherOrderMethodFasterApproximation ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  FasterApproximation  to  << _arg ) ; if ( this -> FasterApproximation != _arg ) { this -> FasterApproximation = _arg ; this -> Modified ( ) ; } } ; virtual void FasterApproximationOn ( ) { this -> SetHigherOrderMethodFasterApproximation ( static_cast < bool > ( 1 ) ) ; } virtual void FasterApproximationOff ( ) { this -> SetHigherOrderMethodFasterApproximation ( static_cast < bool > ( 0 ) ) ; } ; /@} protected : vtkVortexCore ( ) ; ~ vtkVortexCore ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int , vtkInformation * ) override ; vtkTypeBool HigherOrderMethod ; bool FasterApproximation ; private : vtkVortexCore ( const vtkVortexCore & ) = delete ; void operator = ( const vtkVortexCore & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
