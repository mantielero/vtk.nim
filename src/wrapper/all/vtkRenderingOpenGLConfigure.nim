## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRenderingOpenGLConfigure.h.in
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

##  This header contains build settings for the vtkRenderingOpenGL2 module.
##  It provides some compatibility with the vtkRenderingOpenGL module.

##  Whether VTK was built to support Cocoa on the Mac.
##  #undef VTK_USE_COCOA
## --------------------------------------------------------------------------
##  Rendering Configuration

##  #undef VTK_OPENGL_HAS_OSMESA
##  #undef VTK_OPENGL_HAS_EGL
##  #undef VTK_DEFAULT_RENDER_WINDOW_OFFSCREEN
##  #undef VTK_OPENGL_ENABLE_STREAM_ANNOTATIONS
##  for legacy codes (don't use these in new codes)

when defined(VTK_DEFAULT_RENDER_WINDOW_OFFSCREEN):
  discard
when defined(VTK_OPENGL_HAS_OSMESA):
  discard
##  Options for GPUInfo
##  #undef VTK_USE_DIRECTX
##  #undef VTK_USE_CORE_GRAPHICS
##  #undef VTK_USE_NVCONTROL
## --------------------------------------------------------------------------
##  Setup VTK based on platform features and configuration.
##  OGLR
##  OGLR is for GLX. It can be on Unix, Mac or Windows

when ((defined(VTK_USE_OPENGL_LIBRARY) and defined(VTK_USE_X) and
    not defined(_WIN32)) or (defined(VTK_USE_X) and defined(_WIN32))) and
    not defined(VTK_USE_COCOA):
  discard