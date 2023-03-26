## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtk_libproj.h
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

##  Use the libproj library configured for VTK.

const
  VTK_MODULE_USE_EXTERNAL_vtklibproj* = 1
  VTK_LibPROJ_MAJOR_VERSION* = 9

when VTK_LibPROJ_MAJOR_VERSION < 5:
  const
    PROJ_VERSION_MAJOR* = 9
    proj_list_operations* = pj_get_list_ref
when VTK_MODULE_USE_EXTERNAL_vtklibproj:
  when VTK_LibPROJ_MAJOR_VERSION >= 5:
    discard
  else:
    discard
else:
  discard