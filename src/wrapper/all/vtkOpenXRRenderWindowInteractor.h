/*=========================================================================

  Program:   Visualization Toolkit
  Module:    vtkOpenXRRenderWindowInteractor.h

  Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
  All rights reserved.
  See Copyright.txt or http://www.kitware.com/Copyright.htm for details.

     This software is distributed WITHOUT ANY WARRANTY; without even
     the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
     PURPOSE.  See the above copyright notice for more information.

=========================================================================*/
/**
 * @class   vtkOpenXRRenderWindowInteractor
 * @brief   implements OpenXR specific functions
 * required by vtkRenderWindowInteractor.
 *
 */

#ifndef vtkOpenXRRenderWindowInteractor_h
#define vtkOpenXRRenderWindowInteractor_h

#include "vtkRenderingOpenXRModule.h" // For export macro
#include "vtkVRRenderWindowInteractor.h"

#include "vtkEventData.h"     // for ivar
#include "vtkOpenXRManager.h" //for types

#include <functional> // for std::function
#include <map>        // for std::map

typedef vtkOpenXRManager::Action_t Action_t;

class VTKRENDERINGOPENXR_EXPORT vtkOpenXRRenderWindowInteractor : public vtkVRRenderWindowInteractor
{
public:
  static vtkOpenXRRenderWindowInteractor* New();
  vtkTypeMacro(vtkOpenXRRenderWindowInteractor, vtkVRRenderWindowInteractor);

  /**
   * Initialize the event handler
   */
  void Initialize() override;

  void DoOneEvent(vtkVRRenderWindow* renWin, vtkRenderer* ren) override;

  /**
   * Return the XrPosef for the action named "handpose"
   * and the hand \p hand or return nullptr if "handpose"
   * does not exist in the map.
   */
  XrPosef* GetHandPose(const uint32_t hand);

  //@{
  /**
   * Assign an event or std::function to an event path.
   * Called by the interactor style for specific actions
   */
  void AddAction(const std::string& path, const vtkCommand::EventIds&);
  void AddAction(const std::string& path, const std::function<void(vtkEventData*)>&);
  //@}
  // add an event action

  void ConvertOpenXRPoseToWorldCoordinates(const XrPosef& xrPose,
    double pos[3],   // Output world position
    double wxyz[4],  // Output world orientation quaternion
    double ppos[3],  // Output physical position
    double wdir[3]); // Output world view direction (-Z)

  /**
   * Apply haptic vibration using the provided action
   * \p action to emit vibration on \p hand to emit on \p amplitude 0.0 to 1.0.
   * \p duration nanoseconds, default 25ms \p frequency (hz)
   */
  bool ApplyVibration(const std::string& actionName, const int hand, const float amplitude = 0.5f,
    const float duration = 25000000.0f, const float frequency = XR_FREQUENCY_UNSPECIFIED);

protected:
  vtkOpenXRRenderWindowInteractor();
  ~vtkOpenXRRenderWindowInteractor() override;
  void PrintSelf(ostream& os, vtkIndent indent) override;

  /**
   * Process OpenXR specific events.
   */
  void ProcessXrEvents();

  /**
   * Update tha action states using the OpenXRManager
   * and handle all actions.
   */
  void PollXrActions();

  struct ActionData;

  XrActionType GetActionTypeFromString(const std::string& type);
  bool LoadActions(const std::string& actionFilename);
  bool LoadDefaultBinding(const std::string& bindingFilename);
  ActionData* GetActionDataFromName(const std::string& actionName);

  void HandleAction(const ActionData& actionData, const int hand, vtkEventDataDevice3D* ed);
  void HandleBooleanAction(const ActionData& actionData, const int hand, vtkEventDataDevice3D* ed);
  void HandlePoseAction(const ActionData& actionData, const int hand, vtkEventDataDevice3D* ed);
  void HandleVector2fAction(const ActionData& actionData, const int hand, vtkEventDataDevice3D* ed);
  void ApplyAction(const ActionData& actionData, vtkEventDataDevice3D* ed);

  struct ActionData
  {
    std::string Name;

    vtkEventDataDeviceInput DeviceInput = vtkEventDataDeviceInput::Unknown;

    // This structure is defined in vtkOpenXRManager
    // And hold OpenXR related data
    Action_t ActionStruct{ XR_NULL_HANDLE };

    vtkCommand::EventIds EventId;
    std::function<void(vtkEventData*)> Function;
    bool UseFunction = false;
  };

  using MapAction = std::map<std::string, ActionData*>;
  MapAction MapActionStruct_Name;

  vtkNew<vtkMatrix4x4> PoseToWorldMatrix; // used in calculations

private:
  vtkOpenXRRenderWindowInteractor(const vtkOpenXRRenderWindowInteractor&) = delete;
  void operator=(const vtkOpenXRRenderWindowInteractor&) = delete;
};

#endif
// VTK-HeaderTest-Exclude: vtkOpenXRRenderWindowInteractor.h
