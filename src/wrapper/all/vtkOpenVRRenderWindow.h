/*=========================================================================

Program:   Visualization Toolkit
Module:    vtkOpenVRRenderWindow.h

Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
All rights reserved.
See Copyright.txt or http://www.kitware.com/Copyright.htm for details.

This software is distributed WITHOUT ANY WARRANTY; without even
the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
PURPOSE.  See the above copyright notice for more information.

=========================================================================*/
/**
 * @class   vtkOpenVRRenderWindow
 * @brief   OpenVR rendering window
 *
 *
 * vtkOpenVRRenderWindow is a concrete implementation of the abstract
 * class vtkVRRenderWindow. vtkOpenVRRenderer interfaces to the
 * OpenVR graphics library
 *
 * This class and its similar classes are designed to be drop in
 * replacements for VTK. If you link to this module and turn on
 * the CMake option VTK_OPENVR_OBJECT_FACTORY, the object
 * factory mechanism should replace the core rendering classes such as
 * RenderWindow with OpenVR specialized versions. The goal is for VTK
 * programs to be able to use the OpenVR library with little to no
 * changes.
 *
 * This class handles the bulk of interfacing to OpenVR. It supports one
 * renderer currently. The renderer is assumed to cover the entire window
 * which is what makes sense to VR. Overlay renderers can probably be
 * made to work with this but consider how overlays will appear in a
 * HMD if they do not track the viewpoint etc. This class is based on
 * sample code from the OpenVR project.
 *
 * OpenVR provides HMD and controller positions in "Physical" coordinate
 * system.
 * Origin: user's eye position at the time of calibration.
 * Axis directions: x = user's right; y = user's up; z = user's back.
 * Unit: meter.
 *
 * Renderer shows actors in World coordinate system. Transformation between
 * Physical and World coordinate systems is defined by PhysicalToWorldMatrix.
 * This matrix determines the user's position and orientation in the rendered
 * scene and scaling (magnification) of rendered actors.
 *
 */

#ifndef vtkOpenVRRenderWindow_h
#define vtkOpenVRRenderWindow_h

#include "vtkEventData.h"             // for enums
#include "vtkOpenVROverlay.h"         // used for ivars
#include "vtkRenderingOpenVRModule.h" // For export macro
#include "vtkSmartPointer.h"          // used for ivars
#include "vtkVRRenderWindow.h"

#include <openvr.h> // for ivars

class vtkMatrix4x4;
class vtkOpenVRModel;

class VTKRENDERINGOPENVR_EXPORT vtkOpenVRRenderWindow : public vtkVRRenderWindow
{
public:
  static vtkOpenVRRenderWindow* New();
  vtkTypeMacro(vtkOpenVRRenderWindow, vtkVRRenderWindow);

  /**
   * Returns true if the system believes that an HMD is present on the system.
   */
  static bool IsHMDPresent();

  /**
   * Initialize the rendering window.
   */
  void Initialize() override;

  /**
   * Free up any graphics resources associated with this window
   * a value of nullptr means the context may already be destroyed
   */
  void ReleaseGraphicsResources(vtkWindow* renWin) override;

  /**
   * Get the system pointer
   */
  vr::IVRSystem* GetHMD() { return this->HMD; }

  /**
   * Create an interactor specific to OpenVR to control renderers in this window.
   */
  vtkRenderWindowInteractor* MakeRenderWindowInteractor() override;

  /**
   * Overridden to not release resources that would interfere with an external
   * application's rendering. Avoiding round trip.
   */
  void Render() override;

  /**
   * Intermediate method performs operations required between the rendering
   * of the left and right eye.
   */
  void StereoMidpoint() override;

  /**
   * Handles work required once both views have been rendered when using
   * stereo rendering.
   */
  void StereoRenderComplete() override;

  /**
   * Draw the overlay
   */
  void RenderOverlay();

  /*
   * Get the overlay to use on the VR dashboard.
   */
  vtkGetSmartPointerMacro(DashboardOverlay, vtkOpenVROverlay);

  /**
   * Update the HMD pose based on hardware pose and physical to world transform.
   * VR camera properties are directly modified based on physical to world to
   * simulate \sa PhysicalTranslation, \sa PhysicalScale, etc.
   */
  void UpdateHMDMatrixPose() override;

  /**
   * Convert an OpenVR pose struct to a vtkMatrix4x4 object.
   */
  void SetMatrixFromOpenVRPose(vtkMatrix4x4* result, const vr::TrackedDevicePose_t& vrPose);

  /**
   * Get the openVR Render Models
   */
  vr::IVRRenderModels* GetOpenVRRenderModels() { return this->OpenVRRenderModels; }

  /**
   * Render the controller and base station models.
   */
  void RenderModels() override;

  uint32_t GetDeviceHandleForOpenVRHandle(vr::TrackedDeviceIndex_t index);
  vtkEventDataDevice GetDeviceForOpenVRHandle(vr::TrackedDeviceIndex_t ohandle);

protected:
  vtkOpenVRRenderWindow();
  ~vtkOpenVRRenderWindow() override = default;

  std::string GetWindowTitleFromAPI() override;
  bool GetSizeFromAPI() override;

  bool CreateFramebuffers(uint32_t viewCount = 2) override;
  bool CreateOneFramebuffer(int nWidth, int nHeight, FramebufferDesc& framebufferDesc);

  /**
   * Convert a device index to a human-readable string.
   */
  std::string GetTrackedDeviceString(vr::IVRSystem* pHmd, vr::TrackedDeviceIndex_t unDevice,
    vr::TrackedDeviceProperty prop, vr::TrackedPropertyError* peError = nullptr);

  /**
   * Find a render model that has already been loaded or load a new one.
   */
  vtkOpenVRModel* FindOrLoadRenderModel(const char* modelName);

  vtkSmartPointer<vtkOpenVROverlay> DashboardOverlay;
  vr::IVRSystem* HMD = nullptr;
  vr::IVRRenderModels* OpenVRRenderModels = nullptr;

private:
  vtkOpenVRRenderWindow(const vtkOpenVRRenderWindow&) = delete;
  void operator=(const vtkOpenVRRenderWindow&) = delete;
};

#endif
