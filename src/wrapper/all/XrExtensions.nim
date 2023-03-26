##  Copyright (c) Microsoft Corporation.
##  Licensed under the MIT License.
##  File took from :
##  https://github.com/microsoft/OpenXR-MixedReality/blob/main/shared/XrUtility/XrExtensions.h
##  This file is useful to load OpenXR extension function pointers

when defined(XR_USE_PLATFORM_WIN32):
  template FOR_EACH_WIN32_EXTENSION_FUNCTION*(_: untyped): untyped =
    _(xrConvertWin32PerformanceCounterToTimeKHR)

else:
  discard
when defined(XR_USE_GRAPHICS_API_D3D11):
  template FOR_EACH_D3D11_EXTENSION_FUNCTION*(_: untyped): untyped =
    _(xrGetD3D11GraphicsRequirementsKHR)

else:
  discard
when defined(XR_USE_GRAPHICS_API_OPENGL):
  template FOR_EACH_OPENGL_EXTENSION_FUNCTION*(_: untyped): untyped =
    _(xrGetOpenGLGraphicsRequirementsKHR)

else:
  discard
when XR_KHR_visibility_mask:
  template FOR_EACH_VISIBILITY_MASK_FUNCTION*(_: untyped): untyped =
    _(xrGetVisibilityMaskKHR)

else:
  discard
## !!!Ignored construct:  # XR_MSFT_controller_model [NewLine] # FOR_EACH_CONTROLLER_MODEL_EXTENSION_FUNCTION ( _ ) _ ( xrGetControllerModelKeyMSFT ) _ ( xrLoadControllerModelMSFT ) _ ( xrGetControllerModelPropertiesMSFT ) _ ( xrGetControllerModelStateMSFT ) [NewLine] # [NewLine] # FOR_EACH_CONTROLLER_MODEL_EXTENSION_FUNCTION ( _ ) [NewLine] # [NewLine] # XR_MSFT_perception_anchor_interop && defined ( XR_USE_PLATFORM_WIN32 ) [NewLine] # FOR_EACH_PERCEPTION_ANCHOR_INTEROP_FUNCTION ( _ ) _ ( xrCreateSpatialAnchorFromPerceptionAnchorMSFT ) _ ( xrTryGetPerceptionAnchorFromSpatialAnchorMSFT ) [NewLine] # [NewLine] # FOR_EACH_PERCEPTION_ANCHOR_INTEROP_FUNCTION ( _ ) [NewLine] # [NewLine] # XR_MSFT_spatial_anchor [NewLine] # FOR_EACH_SPATIAL_ANCHOR_FUNCTION ( _ ) _ ( xrCreateSpatialAnchorMSFT ) _ ( xrCreateSpatialAnchorSpaceMSFT ) _ ( xrDestroySpatialAnchorMSFT ) [NewLine] # [NewLine] # FOR_EACH_SPATIAL_ANCHOR_FUNCTION ( _ ) [NewLine] # [NewLine] # XR_EXT_hand_tracking [NewLine] # FOR_EACH_HAND_TRACKING_FUNCTION ( _ ) _ ( xrCreateHandTrackerEXT ) _ ( xrDestroyHandTrackerEXT ) _ ( xrLocateHandJointsEXT ) [NewLine] # [NewLine] # FOR_EACH_HAND_TRACKING_FUNCTION ( _ ) [NewLine] # [NewLine] # XR_MSFT_hand_tracking_mesh [NewLine] # FOR_EACH_HAND_TRACKING_MESH_FUNCTION ( _ ) _ ( xrCreateHandMeshSpaceMSFT ) _ ( xrUpdateHandMeshMSFT ) [NewLine] # [NewLine] # FOR_EACH_HAND_TRACKING_MESH_FUNCTION ( _ ) [NewLine] # [NewLine] # XR_MSFT_spatial_graph_bridge [NewLine] # FOR_EACH_SPATIAL_GRAPH_BRIDGE_FUNCTION ( _ ) _ ( xrCreateSpatialGraphNodeSpaceMSFT ) [NewLine] # [NewLine] # FOR_EACH_SPATIAL_GRAPH_BRIDGE_FUNCTION ( _ ) [NewLine] # [NewLine] # XR_MSFT_scene_understanding_preview2 [NewLine] # FOR_EACH_SCENE_UNDERSTANDING_FUNCTION ( _ ) _ ( xrCreateSceneObserverMSFT ) _ ( xrDestroySceneObserverMSFT ) _ ( xrCreateSceneMSFT ) _ ( xrDestroySceneMSFT ) _ ( xrComputeNewSceneMSFT ) _ ( xrGetSceneComputeStateMSFT ) _ ( xrGetSceneComponentsMSFT ) _ ( xrLocateSceneComponentsMSFT ) _ ( xrGetSceneMeshBuffersMSFT ) [NewLine] # [NewLine] # FOR_EACH_SCENE_UNDERSTANDING_FUNCTION ( _ ) [NewLine] # [NewLine] # XR_MSFT_scene_understanding_serialization_preview [NewLine] # FOR_EACH_SCENE_UNDERSTANDING_SERIALIZATION_FUNCTION ( _ ) _ ( xrDeserializeSceneMSFT ) _ ( xrGetSceneSerializedDataMSFT ) [NewLine] # [NewLine] # FOR_EACH_SCENE_UNDERSTANDING_SERIALIZATION_FUNCTION ( _ ) [NewLine] # [NewLine] # FOR_EACH_EXTENSION_FUNCTION ( _ ) FOR_EACH_HAND_TRACKING_FUNCTION ( _ ) FOR_EACH_HAND_TRACKING_MESH_FUNCTION ( _ ) FOR_EACH_SPATIAL_GRAPH_BRIDGE_FUNCTION ( _ ) FOR_EACH_SPATIAL_ANCHOR_FUNCTION ( _ ) FOR_EACH_CONTROLLER_MODEL_EXTENSION_FUNCTION ( _ ) FOR_EACH_PERCEPTION_ANCHOR_INTEROP_FUNCTION ( _ ) FOR_EACH_SCENE_UNDERSTANDING_FUNCTION ( _ ) FOR_EACH_SCENE_UNDERSTANDING_SERIALIZATION_FUNCTION ( _ ) [NewLine] # GET_INSTANCE_PROC_ADDRESS ( name ) ( void ) xrGetInstanceProcAddr ( instance , # , reinterpret_cast < PFN_xrVoidFunction * > ( const_cast < PFN_ ## name * > ( & name ) ) ) ;
## Error: expected ';'!!!

## !!!Ignored construct:  [NewLine] # DEFINE_PROC_MEMBER ( name ) PFN_ ## name name { nullptr } ;
## Error: did not expect [NewLine]!!!

## !!!Ignored construct:  [NewLine] namespace xr { struct ExtensionDispatchTable { FOR_EACH_EXTENSION_FUNCTION ( DEFINE_PROC_MEMBER ) ; ExtensionDispatchTable ( ) = default ; void PopulateDispatchTable ( XrInstance instance ) { FOR_EACH_EXTENSION_FUNCTION ( GET_INSTANCE_PROC_ADDRESS ) ; } } ; }  namespace xr # DEFINE_PROC_MEMBER [NewLine] # GET_INSTANCE_PROC_ADDRESS [NewLine] # FOR_EACH_EXTENSION_FUNCTION [NewLine]
## Error: did not expect [NewLine]!!!
