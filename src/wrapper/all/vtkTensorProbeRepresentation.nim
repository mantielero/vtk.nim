## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTensorProbeRepresentation.h
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
##  @class   vtkTensorProbeRepresentation
##  @brief   Abstract class that serves as a representation for vtkTensorProbeWidget
##
##  The class serves as an abstract geometrical representation for the
##  vtkTensorProbeWidget. It is left to the concrete implementation to render
##  the tensors as it desires. For instance,
##  vtkEllipsoidTensorProbeRepresentation renders the tensors as ellipsoids.
##
##  @sa
##  vtkTensorProbeWidget
##

## !!!Ignored construct:  # vtkTensorProbeRepresentation_h [NewLine] # vtkTensorProbeRepresentation_h [NewLine] # vtkInteractionWidgetsModule.h  For export macro # vtkWidgetRepresentation.h [NewLine] class vtkActor ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPolyData"
discard "forward decl of vtkPolyDataMapper"
discard "forward decl of vtkGenericCell"
## !!!Ignored construct:  class VTKINTERACTIONWIDGETS_EXPORT vtkTensorProbeRepresentation : public vtkWidgetRepresentation { public : /@{ *
##  Standard methods for instances of this class.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkWidgetRepresentation Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkWidgetRepresentation :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkTensorProbeRepresentation :: IsTypeOf ( type ) ; } static vtkTensorProbeRepresentation * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkTensorProbeRepresentation * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkTensorProbeRepresentation * NewInstance ( ) const { return vtkTensorProbeRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWidgetRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTensorProbeRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTensorProbeRepresentation :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  See vtkWidgetRepresentation for details.
##  void BuildRepresentation ( ) override ; int RenderOpaqueGeometry ( vtkViewport * ) override ; /@} /@{ *
##  Set the position of the Tensor probe.
##  virtual void SetProbePosition ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << ProbePosition  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> ProbePosition [ 0 ] != _arg1 ) || ( this -> ProbePosition [ 1 ] != _arg2 ) || ( this -> ProbePosition [ 2 ] != _arg3 ) ) { this -> ProbePosition [ 0 ] = _arg1 ; this -> ProbePosition [ 1 ] = _arg2 ; this -> ProbePosition [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetProbePosition ( const double _arg [ 3 ] ) { this -> SetProbePosition ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetProbePosition ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ProbePosition  pointer  << this -> ProbePosition ) ; return this -> ProbePosition ; } VTK_WRAPEXCLUDE virtual void GetProbePosition ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> ProbePosition [ 0 ] ; _arg2 = this -> ProbePosition [ 1 ] ; _arg3 = this -> ProbePosition [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ProbePosition  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetProbePosition ( double _arg [ 3 ] ) { this -> GetProbePosition ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual void SetProbeCellId ( vtkIdType _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ProbeCellId  to  << _arg ) ; if ( this -> ProbeCellId != _arg ) { this -> ProbeCellId = _arg ; this -> Modified ( ) ; } } ; virtual vtkIdType GetProbeCellId ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProbeCellId  of  << this -> ProbeCellId ) ; return this -> ProbeCellId ; } ; /@} *
##  Set the trajectory that we are trying to probe tensors on
##  virtual void SetTrajectory ( vtkPolyData * ) ; *
##  Set the probe position to a reasonable location on the trajectory.
##  void Initialize ( ) ; *
##  This method is invoked by the widget during user interaction.
##  Can we pick the tensor glyph at the current cursor pos
##  virtual int SelectProbe ( int pos [ 2 ] ) = 0 ; *
##  INTERNAL - Do not use
##  This method is invoked by the widget during user interaction.
##  Move probe based on the position and the motion vector.
##  virtual int Move ( double motionVector [ 2 ] ) ; /@{ *
##  See vtkProp for details.
##  void GetActors ( vtkPropCollection * ) override ; void ReleaseGraphicsResources ( vtkWindow * ) override ; /@} protected : vtkTensorProbeRepresentation ( ) ; ~ vtkTensorProbeRepresentation ( ) override ; void FindClosestPointOnPolyline ( double displayPos [ 2 ] , double closestWorldPos [ 3 ] , vtkIdType & cellId , int maxSpeed = 10 ) ; vtkActor * TrajectoryActor ; vtkPolyDataMapper * TrajectoryMapper ; vtkPolyData * Trajectory ; double ProbePosition [ 3 ] ; vtkIdType ProbeCellId ; private : vtkTensorProbeRepresentation ( const vtkTensorProbeRepresentation & ) = delete ; void operator = ( const vtkTensorProbeRepresentation & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
