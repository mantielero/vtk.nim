## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtk_glew.h
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

##  Use the glew library configured for VTK.

const
  VTK_MODULE_USE_EXTERNAL_vtkglew* = 1
  GLEW_NO_GLU* = true
  VTK_OPENGL_ES_VERSION* = 30

##  Mobile device support.

const
  VTK_MODULE_vtkglew_GLES3* = 0

when defined(__APPLE__):
  import
    TargetConditionals

const
  VTK_GLEW_SHARED* = 1

when not VTK_GLEW_SHARED and not defined(GLEW_STATIC):
  discard
when VTK_MODULE_vtkglew_GLES3:
  discard
elif TARGET_OS_IPHONE or TARGET_IPHONE_SIMULATOR:
  discard
elif VTK_MODULE_USE_EXTERNAL_vtkglew:
  when defined(_WIN32):
    discard
else:
  when defined(_WIN32):
    discard
##  some fixes for both ES 2 and 3

when defined(GL_ES_VERSION_3_0):
  const
    GL_BACK_LEFT* = 0
    GL_BACK_RIGHT* = 0
    GL_FRONT_LEFT* = 0
    GL_FRONT_RIGHT* = 0
  ##  this sends all the data each time as opposed to allowing a subset
  template glMultiDrawElements*(mode, counts, `type`, indicies, primcount: untyped): void =
    var eCount* {.importcpp: "eCount", header: "vtk_glew.h".}: csize_t
    while eCount < primcount:
      glDrawElements(mode, (counts + eCount)[], `type`,
                     cast[ptr GLvoid]((indicies[eCount])))
      inc(eCount)

## ** deal with some GLES 3.0 specific issues **

when defined(GL_ES_VERSION_3_0):
  const
    GLEW_ARB_vertex_array_object* = 1
    GLEW_ARB_instanced_arrays* = 1