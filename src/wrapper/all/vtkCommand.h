/*=========================================================================

  Program:   Visualization Toolkit
  Module:    vtkCommand.h

  Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
  All rights reserved.
  See Copyright.txt or http://www.kitware.com/Copyright.htm for details.

     This software is distributed WITHOUT ANY WARRANTY; without even
     the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
     PURPOSE.  See the above copyright notice for more information.

=========================================================================*/
/**
 * @class   vtkCommand
 * @brief   superclass for callback/observer methods
 *
 * vtkCommand is an implementation of the observer/command design
 * pattern.  In this design pattern, any instance of vtkObject can be
 * "observed" for any events it might invoke. For example,
 * vtkRenderer invokes a StartEvent as it begins to render and a
 * EndEvent when it finishes rendering. Filters (subclasses of
 * vtkProcessObject) invoke StartEvent, ProgressEvent, and EndEvent as
 * the filter processes data. Observers of events are added with the
 * AddObserver() method found in vtkObject.  AddObserver(), besides
 * requiring an event id or name, also takes an instance of vtkCommand
 * (or a subclasses). Note that vtkCommand is meant to be subclassed,
 * so that you can package the information necessary to support your
 * callback.
 *
 * Event processing can be organized in priority lists, so it is
 * possible to truncate the processing of a particular event by
 * setting the AbortFlag variable. The priority is set using the
 * AddObserver() method.  By default the priority is 0, events of the
 * same priority are processed in last-in-first-processed order. The
 * ordering/aborting of events is important for things like 3D
 * widgets, which handle an event if the widget is selected (and then
 * aborting further processing of that event).  Otherwise. the event
 * is passed along for further processing.
 *
 * When an instance of vtkObject invokes an event, it also passes an optional
 * void pointer to a callData. This callData is nullptr most of the time.
 * The callData is not specific to a type of event but specific to a type
 * of vtkObject invoking a specific event. For instance, vtkCommand::PickEvent
 * is invoked by vtkProp with a nullptr callData but is invoked by
 * vtkInteractorStyleImage with a pointer to the vtkInteractorStyleImage object
 * itself.
 *
 * Here is the list of events that may be invoked with a non-nullptr callData.
 * - vtkCommand::ProgressEvent
 *  - most of the objects return a pointer to a double value ranged between
 * 0.0 and 1.0
 *  - Infovis/vtkFixedWidthTextReader returns a pointer to a float value equal
 * to the number of lines read so far.
 * - vtkCommand::ErrorEvent
 *  - an error message as a const char * string
 * - vtkCommand::WarningEvent
 *  - a warning message as a const char * string
 * - vtkCommand::StartAnimationCueEvent
 *  - a pointer to a vtkAnimationCue::AnimationCueInfo object
 * - vtkCommand::EndAnimationCueEvent
 *  - a pointer to a vtkAnimationCue::AnimationCueInfo object
 * - vtkCommand::AnimationCueTickEvent
 *  - a pointer to a vtkAnimationCue::AnimationCueInfo object
 * - vtkCommand::PickEvent
 *  - Common/vtkProp returns nullptr
 *  - Rendering/vtkInteractorStyleImage returns a pointer to itself
 * - vtkCommand::StartPickEvent
 *  - Rendering/vtkPropPicker returns nullptr
 *  - Rendering/vtkInteractorStyleImage returns a pointer to itself
 * - vtkCommand::EndPickEvent
 *  - Rendering/vtkPropPicker returns nullptr
 *  - Rendering/vtkInteractorStyleImage returns a pointer to itself
 * - vtkCommand::WrongTagEvent
 *  - Parallel/vtkSocketCommunicator returns a received tag as a char *
 * - vtkCommand::SelectionChangedEvent
 *  - Views/vtkView returns nullptr
 *  - Views/vtkDataRepresentation returns a pointer to a vtkSelection
 *  - Rendering/vtkInteractorStyleRubberBand2D returns an array of 5 unsigned
 * integers (p1x, p1y, p2x, p2y, mode), where mode is
 * vtkInteractorStyleRubberBand2D::SELECT_UNION or
 * vtkInteractorStyleRubberBand2D::SELECT_NORMAL
 * - vtkCommand::AnnotationChangedEvent
 *  - GUISupport/Qt/vtkQtAnnotationView returns a pointer to a
 * vtkAnnotationLayers
 * - vtkCommand::PlacePointEvent
 *  - Widgets/vtkSeedWidget returns a pointer to an int, being the current
 * handle number
 * - vtkCommand::DeletePointEvent
 *  - Widgets/vtkSeedWidget returns a pointer to an int, being the
 * handle number of the deleted point
 * - vtkCommand::ResetWindowLevelEvent
 *  - Widgets/vtkImagePlaneWidget returns an array of 2 double values (window
 * and level)
 *  - Rendering/vtkInteractorStyleImage returns a pointer to itself
 * - vtkCommand::StartWindowLevelEvent
 *  - Widgets/vtkImagePlaneWidget returns an array of 2 double values (window
 * and level)
 *  - Rendering/vtkInteractorStyleImage returns a pointer to itself
 * - vtkCommand::EndWindowLevelEvent
 *  - Widgets/vtkImagePlaneWidget returns an array of 2 double values (window
 * and level)
 *  - Rendering/vtkInteractorStyleImage returns a pointer to itself
 * - vtkCommand::WindowLevelEvent
 *  - Widgets/vtkImagePlaneWidget returns an array of 2 double values (window
 * and level)
 *  - Rendering/vtkInteractorStyleImage returns a pointer to itself
 * - vtkCommand::CharEvent
 *  - most of the objects return nullptr
 *  - GUISupport/Qt/QVTKOpenGLStereoWidget returns a QKeyEvent *
 * - vtkCommand::TimerEvent
 *  - most of the objects return a to an int representing a timer id
 *  - Widgets/vtkHoverWidget returns nullptr
 * - vtkCommand::CreateTimerEvent
 *  - Rendering/vtkGenericRenderWindowInteractor returns a to an int
 * representing a timer id
 * - vtkCommand::DestroyTimerEvent
 *  - Rendering/vtkGenericRenderWindowInteractor returns a to an int
 * representing a timer id
 * - vtkCommand::UserEvent
 *  - most of the objects return nullptr
 *  - Infovis/vtkInteractorStyleTreeMapHover returns a pointer to a vtkIdType
 * representing a pedigree id
 * - vtkCommand::KeyPressEvent
 *  - most of the objects return nullptr
 *  - GUISupport/Qt/QVTKOpenGLStereoWidget returns a QKeyEvent*
 * - vtkCommand::KeyReleaseEvent
 *  - most of the objects return nullptr
 *  - GUISupport/Qt/QVTKOpenGLStereoWidget returns a QKeyEvent*
 * - vtkCommand::LeftButtonPressEvent
 *  - most of the objects return nullptr
 *  - GUISupport/Qt/QVTKOpenGLStereoWidget returns a QMouseEvent*
 * - vtkCommand::LeftButtonReleaseEvent
 *  - most of the objects return nullptr
 *  - GUISupport/Qt/QVTKOpenGLStereoWidget returns a QMouseEvent*
 * - vtkCommand::MouseMoveEvent
 *  - most of the objects return nullptr
 *  - GUISupport/Qt/QVTKOpenGLStereoWidget returns a QMouseEvent*
 * - vtkCommand::MouseWheelForwardEvent
 *  - most of the objects return nullptr
 *  - GUISupport/Qt/QVTKOpenGLStereoWidget returns a QWheelEvent*
 * - vtkCommand::MouseWheelBackwardEvent
 *  - most of the objects return nullptr
 *  - GUISupport/Qt/QVTKOpenGLStereoWidget returns a QWheelEvent*
 * - vtkCommand::RightButtonPressEvent
 *  - most of the objects return nullptr
 *  - GUISupport/Qt/QVTKOpenGLStereoWidget returns a QMouseEvent*
 * - vtkCommand::RightButtonReleaseEvent
 *  - most of the objects return nullptr
 *  - GUISupport/Qt/QVTKOpenGLStereoWidget returns a QMouseEvent*
 * - vtkCommand::MiddleButtonPressEvent
 *  - most of the objects return nullptr
 *  - GUISupport/Qt/QVTKOpenGLStereoWidget returns a QMouseEvent*
 * - vtkCommand::MiddleButtonReleaseEvent
 *  - most of the objects return nullptr
 *  - GUISupport/Qt/QVTKOpenGLStereoWidget returns a QMouseEvent*
 * - vtkCommand::CursorChangedEvent
 *  - most of the objects return a pointer to an int representing a shape
 *  - Rendering/vtkInteractorObserver returns nullptr
 * - vtkCommand::ResetCameraEvent
 *  - Rendering/vtkRenderer returns a pointer to itself
 * - vtkCommand::ResetCameraClippingRangeEvent
 *  - Rendering/vtkRenderer returns a pointer to itself
 * - vtkCommand::ActiveCameraEvent
 *  - Rendering/vtkRenderer returns a pointer to the active camera
 * - vtkCommand::CreateCameraEvent
 *  - Rendering/vtkRenderer returns a pointer to the created camera
 * - vtkCommand::EnterEvent
 *  - most of the objects return nullptr
 *  - GUISupport/Qt/QVTKOpenGLStereoWidget returns a QEvent*
 * - vtkCommand::LeaveEvent
 *  - most of the objects return nullptr
 *  - GUISupport/Qt/QVTKOpenGLStereoWidget returns a QEvent*
 * - vtkCommand::RenderWindowMessageEvent
 *  - Rendering/vtkWin32OpenGLRenderWindow return a pointer to a UINT message
 * - vtkCommand::ComputeVisiblePropBoundsEvent
 *  - Rendering/vtkRenderer returns a pointer to itself
 * - QVTKOpenGLStereoWidget::ContextMenuEvent
 *  - GUISupport/Qt/QVTKOpenGLStereoWidget returns a QContextMenuEvent*
 * - QVTKOpenGLStereoWidget::DragEnterEvent
 *  - GUISupport/Qt/QVTKOpenGLStereoWidget returns a QDragEnterEvent*
 * - QVTKOpenGLStereoWidget::DragMoveEvent
 *  - GUISupport/Qt/QVTKOpenGLStereoWidget returns a QDragMoveEvent*
 * - QVTKOpenGLStereoWidget::DragLeaveEvent
 *  - GUISupport/Qt/QVTKOpenGLStereoWidget returns a QDragLeaveEvent*
 * - QVTKOpenGLStereoWidget::DropEvent
 *  - GUISupport/Qt/QVTKOpenGLStereoWidget returns a QDropEvent*
 * - vtkCommand::ViewProgressEvent
 *  - View/vtkView returns a ViewProgressEventCallData*
 * - vtkCommand::VolumeMapperRenderProgressEvent
 *  - A pointer to a double value between 0.0 and 1.0
 * - vtkCommand::VolumeMapperComputeGradientsProgressEvent
 *  - A pointer to a double value between 0.0 and 1.0
 * - vtkCommand::TDxMotionEvent (TDx=3DConnexion)
 *  - A vtkTDxMotionEventInfo*
 * - vtkCommand::TDxButtonPressEvent
 *  - A int* being the number of the button
 * - vtkCommand::TDxButtonReleaseEvent
 *  - A int* being the number of the button
 * - vtkCommand::UpdateShaderEvent
 *  - A vtkOpenGLHelper* currently being used
 * - vtkCommand::FourthButtonPressEvent
 *  - most of the objects return nullptr
 * - vtkCommand::FourthButtonReleaseEvent
 *  - most of the objects return nullptr
 * - vtkCommand::FifthButtonPressEvent
 *  - most of the objects return nullptr
 * - vtkCommand::FifthButtonReleaseEvent
 *  - most of the objects return nullptr
 * - vtkCommand::MouseWheelLeftEvent
 *  - most of the objects return nullptr
 *  - GUISupport/Qt/QVTKOpenGLWidget returns a QWheelEvent*
 * - vtkCommand::MouseWheelRightEvent
 *  - most of the objects return nullptr
 *  - GUISupport/Qt/QVTKOpenGLWidget returns a QWheelEvent*
 * - vtkCommand::ErrorEvent
 *  - vtkOutputWindow fires this with `char char*` for the error message
 * - vtkCommand::WarningEvent
 *  - vtkOutputWindow fires this with `char char*` for the warning message
 * - vtkCommand::MessageEvent
 *  - vtkOutputWindow fires this with `char char*` for the message text
 * - vtkCommand::TextEvent
 *  - vtkOutputWindow fires this with `char char*` for the text
 *
 * @sa
 * vtkObject vtkCallbackCommand vtkOldStyleCallbackCommand
 * vtkInteractorObserver vtk3DWidget
 */

#ifndef vtkCommand_h
#define vtkCommand_h

#include "vtkCommonCoreModule.h" // For export macro
#include "vtkObject.h"           // Need vtkTypeMacro
#include "vtkObjectBase.h"

// clang-format off
// Define all types of events here.
// Using this macro makes it possible to avoid mismatches between the event
// enums and their string counterparts.



// The superclass that all commands should be subclasses of
class VTKCOMMONCORE_EXPORT vtkCommand : public vtkObjectBase
{
public:
  vtkBaseTypeMacro(vtkCommand, vtkObjectBase);

  /**
   * Decrease the reference count (release by another object). This has
   * the same effect as invoking Delete() (i.e., it reduces the reference
   * count by 1).
   */
  void UnRegister();
  using Superclass::UnRegister;

  /**
   * All derived classes of vtkCommand must implement this
   * method. This is the method that actually does the work of the
   * callback. The caller argument is the object invoking the event,
   * the eventId parameter is the id of the event, and callData
   * parameter is data that can be passed into the execute
   * method. (Note: vtkObject::InvokeEvent() takes two parameters: the
   * event id (or name) and call data. Typically call data is nullptr,
   * but the user can package data and pass it this
   * way. Alternatively, a derived class of vtkCommand can be used to
   * pass data.)
   */
  virtual void Execute(vtkObject* caller, unsigned long eventId, void* callData) = 0;

  ///@{
  /**
   * Convenience methods for translating between event names and event
   * ids.
   */
  static const char* GetStringFromEventId(unsigned long event);
  static unsigned long GetEventIdFromString(const char* event);
  ///@}

  /**
   * Does this event type contain vtkEventData
   */
  static bool EventHasData(unsigned long event);

  /**
   * Set/Get the abort flag. If this is set to true no further
   * commands are executed.
   */
  void SetAbortFlag(int f) { this->AbortFlag = f; }
  int GetAbortFlag() { return this->AbortFlag; }
  void AbortFlagOn() { this->SetAbortFlag(1); }
  void AbortFlagOff() { this->SetAbortFlag(0); }

  /**
   * Set/Get the passive observer flag. If this is set to true, this
   * indicates that this command does not change the state of the
   * system in any way. Passive observers are processed first, and
   * are not called even when another command has focus.
   */
  void SetPassiveObserver(int f) { this->PassiveObserver = f; }
  int GetPassiveObserver() { return this->PassiveObserver; }
  void PassiveObserverOn() { this->SetPassiveObserver(1); }
  void PassiveObserverOff() { this->SetPassiveObserver(0); }

  /**
   * All the currently defined events are listed here.  Developers can
   * use -- vtkCommand::UserEvent + int to specify their own event
   * ids.
   * Add new events by updating vtkAllEventsMacro.
   */
#define _vtk_add_event(Enum) Enum,
  vtkEventDeclarationMacro(EventIds);
#undef _vtk_add_event

protected:
  int AbortFlag;
  int PassiveObserver;

  vtkCommand();
  ~vtkCommand() override = default;

  friend class vtkSubjectHelper;

  vtkCommand(const vtkCommand& c)
    : vtkObjectBase(c)
  {
  }
  void operator=(const vtkCommand&) {}

private:
  const char* GetDebugClassName() const final;
};

#endif /* vtkCommand_h */

// VTK-HeaderTest-Exclude: vtkCommand.h
