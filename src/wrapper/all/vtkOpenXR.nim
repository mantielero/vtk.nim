##  Needed for WIN32 and VTK_USE_X

import
  vtkRenderingOpenGLConfigure, vtk_glew

when defined(VTK_USE_X):
  ##  X11 defines globally some names that conflict with things in these classes
  ##      X11/Xutil.h contains "#define AllValues 	0x000F"
  ##      X11/Xlib.h contains "#define Status int"
  import
    vtkGenericDataArray

when defined(_WIN32):
  import
    GL/gl, Unknwn, vtkWindows

when defined(VTK_USE_X):
  ##  Required headers for the XrGraphicsBindingOpenGLXlibKHR struct
##  Needed for XR_KHR_OPENGL_ENABLE_EXTENSION_NAME
##  We only supports OpenGL

import
  XrExtensions

const
  HAND_COUNT* = 2
  LEFT_EYE* = 0
  RIGHT_EYE* = 1

##  VTK-HeaderTest-Exclude: vtkOpenXR.h
