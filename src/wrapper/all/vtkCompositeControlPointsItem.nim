## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCompositeControlPointsItem.h
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
##  @class   vtkCompositeControlPointsItem
##  @brief   Control points for
##  vtkCompositeFunction.
##
##  vtkCompositeControlPointsItem draws the control points of a vtkPiecewiseFunction
##  and a vtkColorTransferFunction.
##  @sa
##  vtkControlPointsItem
##  vtkColorTransferControlPointsItem
##  vtkCompositeTransferFunctionItem
##  vtkPiecewisePointHandleItem
##

## !!!Ignored construct:  # vtkCompositeControlPointsItem_h [NewLine] # vtkCompositeControlPointsItem_h [NewLine] # vtkChartsCoreModule.h  For export macro # vtkColorTransferControlPointsItem.h [NewLine] class vtkPiecewiseFunction ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPiecewisePointHandleItem"
## !!!Ignored construct:  class VTKCHARTSCORE_EXPORT vtkCompositeControlPointsItem : public vtkColorTransferControlPointsItem { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkColorTransferControlPointsItem Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkColorTransferControlPointsItem :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkCompositeControlPointsItem :: IsTypeOf ( type ) ; } static vtkCompositeControlPointsItem * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkCompositeControlPointsItem * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkCompositeControlPointsItem * NewInstance ( ) const { return vtkCompositeControlPointsItem :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkColorTransferControlPointsItem :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCompositeControlPointsItem :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCompositeControlPointsItem :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Creates a piecewise control points object
##  static vtkCompositeControlPointsItem * New ( ) ; *
##  Set the color transfer function to draw its points
##  virtual void SetColorTransferFunction ( vtkColorTransferFunction * function ) ; /@{ *
##  Utility function that calls SetPiecewiseFunction()
##  void SetOpacityFunction ( vtkPiecewiseFunction * opacity ) ; virtual vtkPiecewiseFunction * GetnameOpacityFunction ( ) { vtkDebugWithObjectMacro ( this , <<  returning  OpacityFunction  address  << static_cast < vtkPiecewiseFunction * > ( this -> OpacityFunction ) ) ; return this -> OpacityFunction ; } ; /@} enum PointsFunctionType { ColorPointsFunction = 1 , OpacityPointsFunction = 2 , ColorAndOpacityPointsFunction = 3 } ; /@{ *
##  PointsFunction controls whether the points represent the
##  ColorTransferFunction, OpacityTransferFunction or both.
##  If ColorPointsFunction, only the points of the ColorTransfer function are
##  used.
##  If OpacityPointsFunction, only the points of the Opacity function are used
##  If ColorAndOpacityPointsFunction, the points of both functions are shared
##  by both functions.
##  ColorAndOpacityPointsFunction by default.
##  Note: Set the mode before the functions are set. ColorPointsFunction is
##  not fully supported.
##  virtual void SetPointsFunction ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PointsFunction  to  << _arg ) ; if ( this -> PointsFunction != _arg ) { this -> PointsFunction = _arg ; this -> Modified ( ) ; } } ; virtual int GetPointsFunction ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PointsFunction  of  << this -> PointsFunction ) ; return this -> PointsFunction ; } ; /@} *
##  Add a point to the function. Returns the index of the point (0 based),
##  or -1 on error.
##  Subclasses should reimplement this function to do the actual work.
##  vtkIdType AddPoint ( double * newPos ) override ; using Superclass :: RemovePoint ; *
##  Remove a point of the function. Returns the index of the point (0 based),
##  or -1 on error.
##  Subclasses should reimplement this function to do the actual work.
##  vtkIdType RemovePoint ( double * pos ) override ; /@{ *
##  If UseOpacityPointHandles is true, when the current point is
##  double clicked, a vtkPiecewisePointHandleItem will show up so
##  that the sharpness and mid point can be adjusted in the scene
##  with those handles
##  False by default.
##  virtual void SetPointsFunctionUseOpacityPointHandles ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseOpacityPointHandles  to  << _arg ) ; if ( this -> UseOpacityPointHandles != _arg ) { this -> UseOpacityPointHandles = _arg ; this -> Modified ( ) ; } } ; virtual bool GetPointsFunctionUseOpacityPointHandles ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseOpacityPointHandles  of  << this -> UseOpacityPointHandles ) ; return this -> UseOpacityPointHandles ; } ; /@} /@{ *
##  Mouse move event. To take care of some special Key stroke
##  bool MouseMoveEvent ( const vtkContextMouseEvent & mouse ) override ; bool MouseDoubleClickEvent ( const vtkContextMouseEvent & mouse ) override ; bool MouseButtonPressEvent ( const vtkContextMouseEvent & mouse ) override ; /@} *
##  Returns the total number of points, either from
##  using the superclass implementation or the opacity function
##  when available
##  vtkIdType GetNumberOfPoints ( ) const override ; *
##  Returns the x and y coordinates as well as the midpoint and sharpness
##  of the control point corresponding to the index.
##  point must be a double array of size 4.
##  The values will be recovered from the opacity function when available.
##  void GetControlPoint ( vtkIdType index , double point [ 4 ] ) const override ; *
##  Sets the x and y coordinates as well as the midpoint and sharpness,
##  of the control point corresponding to the index, either using the superclass
##  implementation or the opacity function when available.
##  The provided point should be a double array of size 4.
##  void SetControlPoint ( vtkIdType index , double * point ) override ; protected : vtkCompositeControlPointsItem ( ) ; ~ vtkCompositeControlPointsItem ( ) override ; void emitEvent ( unsigned long event , void * params ) override ; vtkMTimeType GetControlPointsMTime ( ) override ; void DrawPoint ( vtkContext2D * painter , vtkIdType index ) override ; void EditPoint ( float tX , float tY ) override ; virtual void EditPointCurve ( vtkIdType idx ) ; void MergeTransferFunctions ( ) ; void SilentMergeTransferFunctions ( ) ; int PointsFunction = vtkCompositeControlPointsItem :: ColorAndOpacityPointsFunction ; vtkPiecewiseFunction * OpacityFunction = nullptr ; vtkPiecewisePointHandleItem * OpacityPointHandle = nullptr ; bool UseOpacityPointHandles = false ; private : vtkCompositeControlPointsItem ( const vtkCompositeControlPointsItem & ) = delete ; void operator = ( const vtkCompositeControlPointsItem & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
