## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkIOVideoConfigure.h
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

##  If defined, `vtkMP4Writer.h` is available.
##  #undef VTK_USE_VIDEO_FOR_WINDOWS_CAPTURE

when defined(VTK_USE_VIDEO_FOR_WINDOWS_CAPTURE):
  ##  The old name for the define.