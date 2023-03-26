## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTensorWidget.h
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
##  @class   vtkTensorWidget
##  @brief   3D widget for manipulating a tensor glyph
##
##  This 3D widget interacts with a vtkTensorRepresentation class (i.e., it
##  handles the events that drive its corresponding representation). The
##  widget is assumed to operate on a single 3x3 real, symmetric tensor
##  located at a specified position. The tensor implicitly defines three
##  orthogonal eigenvectors which indicate the orientation and relative
##  scaling of the widget's representation.
##
##  The widget has the appearance of an oriented box with seven handles: one
##  at the center of the box, and six located at the center of each face. The
##  box can be translated by selecting its center handle; rotated by selecting
##  and rotating one of the box faces around the box center; and scaled (in a
##  particular direction) by selecting the face handles (located on each face)
##  and moving the faces in/out in the direction of the face normal. Uniform
##  scaling is also possible by (default) using the right mouse button (unless
##  the binding has been redefined).
##
##  To use this widget, you generally pair it with a
##  vtkTensorRepresentation (or a subclass). Various options are
##  available in the representation for controlling the widgets' size and
##  position; how the widget appears; and how the widget functions.
##
##  @par Event Bindings:
##  By default, the widget responds to the following VTK events (i.e., it
##  watches the vtkRenderWindowInteractor for these events):
##  <pre>
##  If one of the seven handles are selected:
##    LeftButtonPressEvent - select the appropriate handle
##    LeftButtonReleaseEvent - release the currently selected handle
##    MouseMoveEvent - move the handle
##  If one of the faces is selected:
##    LeftButtonPressEvent - select a box face
##    LeftButtonReleaseEvent - release the box face
##    MouseMoveEvent - rotate the box
##  In all the cases, independent of what is picked, the widget responds to the
##  following VTK events:
##    MiddleButtonPressEvent - translate the widget
##    MiddleButtonReleaseEvent - release the widget
##    RightButtonPressEvent - scale the widget's representation
##    RightButtonReleaseEvent - stop scaling the widget
##    MouseMoveEvent - scale (if right button) or move (if middle button) the widget
##  </pre>
##
##  @par Event Bindings:
##  Note that the event bindings described above can be changed using this
##  class's vtkWidgetEventTranslator. This class translates VTK events
##  into the vtkTensorWidget's widget events:
##  <pre>
##    vtkWidgetEvent::Select -- some part of the widget has been selected
##    vtkWidgetEvent::EndSelect -- the selection process has completed
##    vtkWidgetEvent::Scale -- some part of the widget has been selected
##    vtkWidgetEvent::EndScale -- the selection process has completed
##    vtkWidgetEvent::Translate -- some part of the widget has been selected
##    vtkWidgetEvent::EndTranslate -- the selection process has completed
##    vtkWidgetEvent::Move -- a request for motion has been invoked
##  </pre>
##
##  @par Event Bindings:
##  In turn, when these widget events are processed, the vtkTensorWidget
##  invokes the following VTK events on itself (which observers can listen for):
##  <pre>
##    vtkCommand::StartInteractionEvent (on vtkWidgetEvent::Select)
##    vtkCommand::EndInteractionEvent (on vtkWidgetEvent::EndSelect)
##    vtkCommand::InteractionEvent (on vtkWidgetEvent::Move)
##  </pre>
##
##
##  @sa
##  vtkTensorRepresentation vtkBoxWidget2
##

## !!!Ignored construct:  # vtkTensorWidget_h [NewLine] # vtkTensorWidget_h [NewLine] # vtkAbstractWidget.h [NewLine] # vtkDeprecation.h  For VTK_DEPRECATED_IN_9_2_0 # vtkInteractionWidgetsModule.h  For export macro [NewLine] class vtkTensorRepresentation ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKINTERACTIONWIDGETS_EXPORT vtkTensorWidget : public vtkAbstractWidget { public : /@{ *
##  Standard methods for instantiation, type information, and printing.
##  static vtkTensorWidget * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkAbstractWidget Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkAbstractWidget :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkTensorWidget :: IsTypeOf ( type ) ; } static vtkTensorWidget * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkTensorWidget * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkTensorWidget * NewInstance ( ) const { return vtkTensorWidget :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTensorWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTensorWidget :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  Specify an instance of vtkWidgetRepresentation used to represent this
##  widget in the scene. Note that the representation is a subclass of vtkProp
##  so it can be added to the renderer independent of the widget.
##  void SetRepresentation ( vtkTensorRepresentation * r ) { this -> Superclass :: SetWidgetRepresentation ( reinterpret_cast < vtkWidgetRepresentation * > ( r ) ) ; } /@{ *
##  Control the behavior of the widget (i.e., how it processes
##  events). Translation, rotation, scaling and face movement can all be
##  enabled and disabled. Scaling refers to scaling of the whole widget at
##  once, (default is through right mouse button) while face movement refers
##  to scaling of the widget one face (axis) at a time (default through
##  grabbing one of the representation spherical handles).
##  virtual void SetTranslationEnabled ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  TranslationEnabled  to  << _arg ) ; if ( this -> TranslationEnabled != _arg ) { this -> TranslationEnabled = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetTranslationEnabled ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TranslationEnabled  of  << this -> TranslationEnabled ) ; return this -> TranslationEnabled ; } ; virtual void TranslationEnabledOn ( ) { this -> SetTranslationEnabled ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void TranslationEnabledOff ( ) { this -> SetTranslationEnabled ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual void SetTranslationEnabledScalingEnabled ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ScalingEnabled  to  << _arg ) ; if ( this -> ScalingEnabled != _arg ) { this -> ScalingEnabled = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetTranslationEnabledScalingEnabled ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalingEnabled  of  << this -> ScalingEnabled ) ; return this -> ScalingEnabled ; } ; virtual void ScalingEnabledOn ( ) { this -> SetTranslationEnabledScalingEnabled ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ScalingEnabledOff ( ) { this -> SetTranslationEnabledScalingEnabled ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual void SetTranslationEnabledScalingEnabledRotationEnabled ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  RotationEnabled  to  << _arg ) ; if ( this -> RotationEnabled != _arg ) { this -> RotationEnabled = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetTranslationEnabledScalingEnabledRotationEnabled ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RotationEnabled  of  << this -> RotationEnabled ) ; return this -> RotationEnabled ; } ; virtual void RotationEnabledOn ( ) { this -> SetTranslationEnabledScalingEnabledRotationEnabled ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void RotationEnabledOff ( ) { this -> SetTranslationEnabledScalingEnabledRotationEnabled ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual void SetTranslationEnabledScalingEnabledRotationEnabledMoveFacesEnabled ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MoveFacesEnabled  to  << _arg ) ; if ( this -> MoveFacesEnabled != _arg ) { this -> MoveFacesEnabled = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetTranslationEnabledScalingEnabledRotationEnabledMoveFacesEnabled ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MoveFacesEnabled  of  << this -> MoveFacesEnabled ) ; return this -> MoveFacesEnabled ; } ; virtual void MoveFacesEnabledOn ( ) { this -> SetTranslationEnabledScalingEnabledRotationEnabledMoveFacesEnabled ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void MoveFacesEnabledOff ( ) { this -> SetTranslationEnabledScalingEnabledRotationEnabledMoveFacesEnabled ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} *
##  Create the default widget representation if one is not set. By default,
##  this is an instance of the vtkTensorRepresentation class.
##  void CreateDefaultRepresentation ( ) override ; *
##  Override superclasses' SetEnabled() method because the line
##  widget must enable its internal handle widgets.
##  void SetEnabled ( int enabling ) override ; protected : vtkTensorWidget ( ) ; ~ vtkTensorWidget ( ) override ;  Manage the state of the widget int WidgetState ; enum WidgetStateType { Start = 0 , Active } ; # ! defined ( VTK_LEGACY_REMOVE ) [NewLine] VTK_DEPRECATED_IN_9_2_0 ( because leading underscore is reserved ) typedef WidgetStateType _WidgetState ; # [NewLine]  These methods handle events static void SelectAction ( vtkAbstractWidget * ) ; static void EndSelectAction ( vtkAbstractWidget * ) ; static void TranslateAction ( vtkAbstractWidget * ) ; static void ScaleAction ( vtkAbstractWidget * ) ; static void MoveAction ( vtkAbstractWidget * ) ; static void SelectAction3D ( vtkAbstractWidget * ) ; static void EndSelectAction3D ( vtkAbstractWidget * ) ; static void MoveAction3D ( vtkAbstractWidget * ) ; static void StepAction3D ( vtkAbstractWidget * ) ;  Control whether scaling, rotation, and translation are supported vtkTypeBool TranslationEnabled ; vtkTypeBool ScalingEnabled ; vtkTypeBool RotationEnabled ; vtkTypeBool MoveFacesEnabled ; vtkCallbackCommand * KeyEventCallbackCommand ; static void ProcessKeyEvents ( vtkObject * , unsigned long , void * , void * ) ; private : vtkTensorWidget ( const vtkTensorWidget & ) = delete ; void operator = ( const vtkTensorWidget & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
