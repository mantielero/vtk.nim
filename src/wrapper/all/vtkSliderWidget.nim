## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSliderWidget.h
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
##  @class   vtkSliderWidget
##  @brief   set a value by manipulating a slider
##
##  The vtkSliderWidget is used to set a scalar value in an application.  This
##  class assumes that a slider is moved along a 1D parameter space (e.g., a
##  spherical bead that can be moved along a tube).  Moving the slider
##  modifies the value of the widget, which can be used to set parameters on
##  other objects. Note that the actual appearance of the widget depends on
##  the specific representation for the widget.
##
##  To use this widget, set the widget representation. The representation is
##  assumed to consist of a tube, two end caps, and a slider (the details may
##  vary depending on the particulars of the representation). Then in the
##  representation you will typically set minimum and maximum value, as well
##  as the current value. The position of the slider must also be set, as well
##  as various properties.
##
##  @par Event Bindings:
##  By default, the widget responds to the following VTK events (i.e., it
##  watches the vtkRenderWindowInteractor for these events):
##  <pre>
##  If the slider bead is selected:
##    LeftButtonPressEvent - select slider (if on slider)
##    LeftButtonReleaseEvent - release slider (if selected)
##    MouseMoveEvent - move slider
##  If the end caps or slider tube are selected:
##    LeftButtonPressEvent - move (or animate) to cap or point on tube;
##  </pre>
##
##  @par Event Bindings:
##  Note that the event bindings described above can be changed using this
##  class's vtkWidgetEventTranslator. This class translates VTK events
##  into the vtkSliderWidget's widget events:
##  <pre>
##    vtkWidgetEvent::Select -- some part of the widget has been selected
##    vtkWidgetEvent::EndSelect -- the selection process has completed
##    vtkWidgetEvent::Move -- a request for slider motion has been invoked
##  </pre>
##
##  @par Event Bindings:
##  In turn, when these widget events are processed, the vtkSliderWidget
##  invokes the following VTK events on itself (which observers can listen for):
##  <pre>
##    vtkCommand::StartInteractionEvent (on vtkWidgetEvent::Select)
##    vtkCommand::EndInteractionEvent (on vtkWidgetEvent::EndSelect)
##    vtkCommand::InteractionEvent (on vtkWidgetEvent::Move)
##  </pre>
##
##

## !!!Ignored construct:  # vtkSliderWidget_h [NewLine] # vtkSliderWidget_h [NewLine] # vtkAbstractWidget.h [NewLine] # vtkDeprecation.h  For VTK_DEPRECATED_IN_9_2_0 # vtkInteractionWidgetsModule.h  For export macro [NewLine] class vtkSliderRepresentation ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKINTERACTIONWIDGETS_EXPORT vtkSliderWidget : public vtkAbstractWidget { public : *
##  Instantiate the class.
##  static vtkSliderWidget * New ( ) ; /@{ *
##  Standard macros.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkAbstractWidget Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkAbstractWidget :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSliderWidget :: IsTypeOf ( type ) ; } static vtkSliderWidget * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSliderWidget * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSliderWidget * NewInstance ( ) const { return vtkSliderWidget :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSliderWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSliderWidget :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  Specify an instance of vtkWidgetRepresentation used to represent this
##  widget in the scene. Note that the representation is a subclass of vtkProp
##  so it can be added to the renderer independent of the widget.
##  void SetRepresentation ( vtkSliderRepresentation * r ) { this -> Superclass :: SetWidgetRepresentation ( reinterpret_cast < vtkWidgetRepresentation * > ( r ) ) ; } *
##  Return the representation as a vtkSliderRepresentation.
##  vtkSliderRepresentation * GetSliderRepresentation ( ) { return reinterpret_cast < vtkSliderRepresentation * > ( this -> WidgetRep ) ; } /@{ *
##  Control the behavior of the slider when selecting the tube or caps. If
##  Jump, then selecting the tube, left cap, or right cap causes the slider to
##  jump to the selection point. If the mode is Animate, the slider moves
##  towards the selection point in NumberOfAnimationSteps number of steps.
##  If Off, then the slider does not move.
##  virtual void SetAnimationMode ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << AnimationMode  to  << _arg ) ; if ( this -> AnimationMode != ( _arg < AnimateOff ? AnimateOff : ( _arg > Animate ? Animate : _arg ) ) ) { this -> AnimationMode = ( _arg < AnimateOff ? AnimateOff : ( _arg > Animate ? Animate : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetAnimationModeMinValue ( ) { return AnimateOff ; } virtual int GetAnimationModeMaxValue ( ) { return Animate ; } ; virtual int GetAnimationMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AnimationMode  of  << this -> AnimationMode ) ; return this -> AnimationMode ; } ; void SetAnimationModeToOff ( ) { this -> SetAnimationMode ( AnimateOff ) ; } void SetAnimationModeToJump ( ) { this -> SetAnimationMode ( Jump ) ; } void SetAnimationModeToAnimate ( ) { this -> SetAnimationMode ( Animate ) ; } /@} /@{ *
##  Specify the number of animation steps to take if the animation mode
##  is set to animate.
##  virtual void SetAnimationModeNumberOfAnimationSteps ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << NumberOfAnimationSteps  to  << _arg ) ; if ( this -> NumberOfAnimationSteps != ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> NumberOfAnimationSteps = ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetAnimationModeMinValueNumberOfAnimationStepsMinValue ( ) { return 1 ; } virtual int GetAnimationModeMaxValueNumberOfAnimationStepsMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetAnimationModeNumberOfAnimationSteps ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfAnimationSteps  of  << this -> NumberOfAnimationSteps ) ; return this -> NumberOfAnimationSteps ; } ; /@} *
##  Create the default widget representation if one is not set.
##  void CreateDefaultRepresentation ( ) override ; protected : vtkSliderWidget ( ) ; ~ vtkSliderWidget ( ) override = default ;  These are the events that are handled static void SelectAction ( vtkAbstractWidget * ) ; static void EndSelectAction ( vtkAbstractWidget * ) ; static void MoveAction ( vtkAbstractWidget * ) ; void AnimateSlider ( int selectionState ) ;  Manage the state of the widget int WidgetState ; enum WidgetStateType { Start = 0 , Sliding , Animating } ; # ! defined ( VTK_LEGACY_REMOVE ) [NewLine] VTK_DEPRECATED_IN_9_2_0 ( because leading underscore is reserved ) typedef WidgetStateType _WidgetState ; # [NewLine] int NumberOfAnimationSteps ; int AnimationMode ; enum AnimationState { AnimateOff , Jump , Animate } ; private : vtkSliderWidget ( const vtkSliderWidget & ) = delete ; void operator = ( const vtkSliderWidget & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
