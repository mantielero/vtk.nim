## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAbstractSplineRepresentation.h
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
##  @class   vtkAbstractSplineRepresentation
##  @brief   abstract representation for a spline.
##
##  vtkAbstractSplineRepresentation is a vtkWidgetRepresentation for an abstract spline.
##  This 3D widget defines a spline that can be accessed, set and configured.
##  Deriving classes are then able to combine their own handles using this class.
##

## !!!Ignored construct:  # vtkAbstractSplineRepresentation_h [NewLine] # vtkAbstractSplineRepresentation_h [NewLine] # vtkCurveRepresentation.h [NewLine] # vtkInteractionWidgetsModule.h  For export macro [NewLine] class vtkParametricFunctionSource ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkParametricSpline"
discard "forward decl of vtkPolyDataMapper"
## !!!Ignored construct:  class VTKINTERACTIONWIDGETS_EXPORT vtkAbstractSplineRepresentation : public vtkCurveRepresentation { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkCurveRepresentation Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkCurveRepresentation :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkAbstractSplineRepresentation :: IsTypeOf ( type ) ; } static vtkAbstractSplineRepresentation * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkAbstractSplineRepresentation * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkAbstractSplineRepresentation * NewInstance ( ) const { return vtkAbstractSplineRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCurveRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAbstractSplineRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAbstractSplineRepresentation :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Grab the polydata (including points) that defines the spline.  The
##  polydata consists of points and line segments numbering Resolution + 1
##  and Resolution, respectively. Points are guaranteed to be up-to-date when
##  either the InteractionEvent or EndInteraction events are invoked. The
##  user provides the vtkPolyData and the points and polyline are added to it.
##  void GetPolyData ( vtkPolyData * pd ) override ; /@{ *
##  Set/Get the number of line segments representing the spline for
##  this widget.
##  The default value is 499.
##  void SetResolution ( int resolution ) ; virtual int GetResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Resolution  of  << this -> Resolution ) ; return this -> Resolution ; } ; /@} /@{ *
##  Set the parametric spline object.
##  Can be redefined in the child classes for further updates
##  when a spline is set.
##  The default value is nullptr.
##  virtual vtkParametricSpline * GetnameParametricSpline ( ) { vtkDebugWithObjectMacro ( this , <<  returning  ParametricSpline  address  << static_cast < vtkParametricSpline * > ( this -> ParametricSpline ) ) ; return this -> ParametricSpline ; } ; virtual void SetParametricSpline ( vtkParametricSpline * spline ) ; /@} *
##  Get the position of the spline handles.
##  vtkDoubleArray * GetHandlePositions ( ) override ; *
##  Get the approximate vs. the true arc length of the spline. Calculated as
##  the summed lengths of the individual straight line segments. Use
##  SetResolution to control the accuracy.
##  double GetSummedLength ( ) override ; protected : vtkAbstractSplineRepresentation ( ) ; ~ vtkAbstractSplineRepresentation ( ) override ; void CleanRepresentation ( ) ; void SetParametricSplineInternal ( vtkParametricSpline * spline ) ;  The spline vtkParametricSpline * ParametricSpline = nullptr ; vtkNew < vtkParametricFunctionSource > ParametricFunctionSource ;  The number of line segments used to represent the spline. int Resolution = 499 ;  the mapper supposed to display the spline vtkNew < vtkPolyDataMapper > LineMapper ; private : vtkAbstractSplineRepresentation ( const vtkAbstractSplineRepresentation & ) = delete ; void operator = ( const vtkAbstractSplineRepresentation & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
