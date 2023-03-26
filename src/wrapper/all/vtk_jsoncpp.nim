## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtk_jsoncpp.h.in
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

##  Use the jsoncpp library configured for VTK.

const
  VTK_MODULE_USE_EXTERNAL_vtkjsoncpp* = 1
  VTK_JSONCPP_SHARED* = 1

when VTK_MODULE_USE_EXTERNAL_vtkjsoncpp:
  when not defined(JSON_DLL) and defined(_WIN32) and VTK_JSONCPP_SHARED:
    discard
else:
  ##  Needed for Windows declspec import logic