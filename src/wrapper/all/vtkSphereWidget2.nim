## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSphereWidget2.h
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
##  @class   vtkSphereWidget2
##  @brief   3D widget for manipulating a point on a sphere
##
##  This 3D widget interacts with a vtkSphereRepresentation class (i.e., it
##  handles the events that drive its corresponding representation). It can be
##  used to position a point on a sphere (for example, to place a light or
##  camera), or to position a sphere in a scene, including translating and
##  scaling the sphere.
##
##  A nice feature of vtkSphereWidget2, like any 3D widget, is that it will
##  work in combination with the current interactor style (or any other
##  interactor observer). That is, if vtkSphereWidget2 does not handle an
##  event, then all other registered observers (including the interactor
##  style) have an opportunity to process the event. Otherwise, the
##  vtkSphereWidget2 will terminate the processing of the event that it
##  handles.
##
##  To use this widget, you generally pair it with a vtkSphereRepresentation
##  (or a subclass). Various options are available in the representation for
##  controlling how the widget appears, and how the widget functions.
##
##  @par Event Bindings:
##  By default, the widget responds to the following VTK events (i.e., it
##  watches the vtkRenderWindowInteractor for these events):
##  <pre>
##  If the handle or sphere are selected:
##    LeftButtonPressEvent - select the handle or sphere
##    LeftButtonReleaseEvent - release the handle to sphere
##    MouseMoveEvent - move the handle or translate the sphere
##  In all the cases, independent of what is picked, the widget responds to the
##  following VTK events:
##    MiddleButtonPressEvent - translate the representation
##    MiddleButtonReleaseEvent - stop translating the representation
##    RightButtonPressEvent - scale the widget's representation
##    RightButtonReleaseEvent - stop scaling the representation
##    MouseMoveEvent - scale (if right button) or move (if middle button) the widget
##  </pre>
##
##  @par Event Bindings:
##  Note that the event bindings described above can be changed using this
##  class's vtkWidgetEventTranslator. This class translates VTK events
##  into the vtkSphereWidget2's widget events:
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
##  In turn, when these widget events are processed, the vtkSphereWidget2
##  invokes the following VTK events on itself (which observers can listen for):
##  <pre>
##    vtkCommand::StartInteractionEvent (on vtkWidgetEvent::Select)
##    vtkCommand::EndInteractionEvent (on vtkWidgetEvent::EndSelect)
##    vtkCommand::InteractionEvent (on vtkWidgetEvent::Move)
##  </pre>
##
##
##  @par Event Bindings:
##  This class, and the affiliated vtkSphereRepresentation, are second generation
##  VTK widgets. An earlier version of this functionality was defined in the
##  class vtkSphereWidget.
##
##  @sa
##  vtkSphereRepresentation vtkSphereWidget
##

## !!!Ignored construct:  # vtkSphereWidget2_h [NewLine] # vtkSphereWidget2_h [NewLine] # vtkAbstractWidget.h [NewLine] # vtkDeprecation.h  For VTK_DEPRECATED_IN_9_2_0 # vtkInteractionWidgetsModule.h  For export macro [NewLine] class vtkSphereRepresentation ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkHandleWidget"
## !!!Ignored construct:  class VTKINTERACTIONWIDGETS_EXPORT vtkSphereWidget2 : public vtkAbstractWidget { public : *
##  Instantiate the object.
##  static vtkSphereWidget2 * New ( ) ; /@{ *
##  Standard class methods for type information and printing.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkAbstractWidget Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkAbstractWidget :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSphereWidget2 :: IsTypeOf ( type ) ; } static vtkSphereWidget2 * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSphereWidget2 * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSphereWidget2 * NewInstance ( ) const { return vtkSphereWidget2 :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSphereWidget2 :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSphereWidget2 :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  Specify an instance of vtkWidgetRepresentation used to represent this
##  widget in the scene. Note that the representation is a subclass of
##  vtkProp so it can be added to the renderer independent of the widget.
##  void SetRepresentation ( vtkSphereRepresentation * r ) { this -> Superclass :: SetWidgetRepresentation ( reinterpret_cast < vtkWidgetRepresentation * > ( r ) ) ; } /@{ *
##  Control the behavior of the widget (i.e., how it processes
##  events). Translation, and scaling can all be enabled and disabled.
##  virtual void SetTranslationEnabled ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  TranslationEnabled  to  << _arg ) ; if ( this -> TranslationEnabled != _arg ) { this -> TranslationEnabled = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetTranslationEnabled ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TranslationEnabled  of  << this -> TranslationEnabled ) ; return this -> TranslationEnabled ; } ; virtual void TranslationEnabledOn ( ) { this -> SetTranslationEnabled ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void TranslationEnabledOff ( ) { this -> SetTranslationEnabled ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual void SetTranslationEnabledScalingEnabled ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ScalingEnabled  to  << _arg ) ; if ( this -> ScalingEnabled != _arg ) { this -> ScalingEnabled = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetTranslationEnabledScalingEnabled ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalingEnabled  of  << this -> ScalingEnabled ) ; return this -> ScalingEnabled ; } ; virtual void ScalingEnabledOn ( ) { this -> SetTranslationEnabledScalingEnabled ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ScalingEnabledOff ( ) { this -> SetTranslationEnabledScalingEnabled ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} *
##  Create the default widget representation if one is not set. By default,
##  this is an instance of the vtkSphereRepresentation class.
##  void CreateDefaultRepresentation ( ) override ; *
##  Override superclasses' SetEnabled() method because the line
##  widget must enable its internal handle widgets.
##  void SetEnabled ( int enabling ) override ; protected : vtkSphereWidget2 ( ) ; ~ vtkSphereWidget2 ( ) override ;  Manage the state of the widget int WidgetState ; enum WidgetStateType { Start = 0 , Active } ; # ! defined ( VTK_LEGACY_REMOVE ) [NewLine] VTK_DEPRECATED_IN_9_2_0 ( because leading underscore is reserved ) typedef WidgetStateType _WidgetState ; # [NewLine]  These methods handle events static void SelectAction ( vtkAbstractWidget * ) ; static void EndSelectAction ( vtkAbstractWidget * ) ; static void TranslateAction ( vtkAbstractWidget * ) ; static void ScaleAction ( vtkAbstractWidget * ) ; static void MoveAction ( vtkAbstractWidget * ) ;  Control whether scaling and translation are supported vtkTypeBool TranslationEnabled ; vtkTypeBool ScalingEnabled ; vtkCallbackCommand * KeyEventCallbackCommand ; static void ProcessKeyEvents ( vtkObject * , unsigned long , void * , void * ) ; private : vtkSphereWidget2 ( const vtkSphereWidget2 & ) = delete ; void operator = ( const vtkSphereWidget2 & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!