## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAffineWidget.h
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
##  @class   vtkAffineWidget
##  @brief   perform affine transformations
##
##  The vtkAffineWidget is used to perform affine transformations on objects.
##  (Affine transformations are transformations that keep parallel lines parallel.
##  Affine transformations include translation, scaling, rotation, and shearing.)
##
##  To use this widget, set the widget representation. The representation
##  maintains a transformation matrix and other instance variables consistent
##  with the transformations applied by this widget.
##
##  @par Event Bindings:
##  By default, the widget responds to the following VTK events (i.e., it
##  watches the vtkRenderWindowInteractor for these events):
##  <pre>
##    LeftButtonPressEvent - select widget: depending on which part is selected
##                           translation, rotation, scaling, or shearing may follow.
##    LeftButtonReleaseEvent - end selection of widget.
##    MouseMoveEvent - interactive movement across widget
##  </pre>
##
##  @par Event Bindings:
##  Note that the event bindings described above can be changed using this
##  class's vtkWidgetEventTranslator. This class translates VTK events
##  into the vtkAffineWidget's widget events:
##  <pre>
##    vtkWidgetEvent::Select -- focal point is being selected
##    vtkWidgetEvent::EndSelect -- the selection process has completed
##    vtkWidgetEvent::Move -- a request for widget motion
##  </pre>
##
##  @par Event Bindings:
##  In turn, when these widget events are processed, the vtkAffineWidget
##  invokes the following VTK events on itself (which observers can listen for):
##  <pre>
##    vtkCommand::StartInteractionEvent (on vtkWidgetEvent::Select)
##    vtkCommand::EndInteractionEvent (on vtkWidgetEvent::EndSelect)
##    vtkCommand::InteractionEvent (on vtkWidgetEvent::Move)
##  </pre>
##
##

## !!!Ignored construct:  # vtkAffineWidget_h [NewLine] # vtkAffineWidget_h [NewLine] # vtkAbstractWidget.h [NewLine] # vtkDeprecation.h  For VTK_DEPRECATED_IN_9_2_0 # vtkInteractionWidgetsModule.h  For export macro [NewLine] class vtkAffineRepresentation ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKINTERACTIONWIDGETS_EXPORT vtkAffineWidget : public vtkAbstractWidget { public : *
##  Instantiate this class.
##  static vtkAffineWidget * New ( ) ; /@{ *
##  Standard VTK class macros.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkAbstractWidget Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkAbstractWidget :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkAffineWidget :: IsTypeOf ( type ) ; } static vtkAffineWidget * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkAffineWidget * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkAffineWidget * NewInstance ( ) const { return vtkAffineWidget :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAffineWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAffineWidget :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  Specify an instance of vtkWidgetRepresentation used to represent this
##  widget in the scene. Note that the representation is a subclass of vtkProp
##  so it can be added to the renderer independent of the widget.
##  void SetRepresentation ( vtkAffineRepresentation * r ) { this -> Superclass :: SetWidgetRepresentation ( reinterpret_cast < vtkWidgetRepresentation * > ( r ) ) ; } *
##  Return the representation as a vtkAffineRepresentation.
##  vtkAffineRepresentation * GetAffineRepresentation ( ) { return reinterpret_cast < vtkAffineRepresentation * > ( this -> WidgetRep ) ; } *
##  Create the default widget representation if one is not set.
##  void CreateDefaultRepresentation ( ) override ; *
##  Methods for activating this widget. This implementation extends the
##  superclasses' in order to resize the widget handles due to a render
##  start event.
##  void SetEnabled ( int ) override ; protected : vtkAffineWidget ( ) ; ~ vtkAffineWidget ( ) override ;  These are the callbacks for this widget static void SelectAction ( vtkAbstractWidget * ) ; static void EndSelectAction ( vtkAbstractWidget * ) ; static void MoveAction ( vtkAbstractWidget * ) ; static void ModifyEventAction ( vtkAbstractWidget * ) ;  helper methods for cursor management void SetCursor ( int state ) override ;  Manage the state of the widget int WidgetState ; enum WidgetStateType { Start = 0 , Active } ; # ! defined ( VTK_LEGACY_REMOVE ) [NewLine] VTK_DEPRECATED_IN_9_2_0 ( because leading underscore is reserved ) typedef WidgetStateType _WidgetState ; # [NewLine]  Keep track whether key modifier key is pressed int ModifierActive ; private : vtkAffineWidget ( const vtkAffineWidget & ) = delete ; void operator = ( const vtkAffineWidget & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
