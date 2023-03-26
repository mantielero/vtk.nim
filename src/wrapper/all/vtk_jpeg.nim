## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtk_jpeg.h
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

##  Use the jpeg library configured for VTK.

const
  VTK_MODULE_USE_EXTERNAL_vtkjpeg* = 1

when VTK_MODULE_USE_EXTERNAL_vtkjpeg:
  ##  Work-around for a conflict between windows.h and jpeglib.h in cygwin.
  ##      If ADDRESS_TAG_BIT is defined then BaseTsd.h has been included and
  ##      INT32 has been defined with a typedef, so we must define XMD_H to
  ##      prevent the jpeg header from defining it again.
  when defined(__CYGWIN__) and defined(ADDRESS_TAG_BIT) and not defined(XMD_H):
else:
  ##  Ensure jpeglib.h does not include jconfig.h nor jmorecfg.h from another include directory.