## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkWindows.h
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

##  This header is useless when not on windows or when the windows
##    header has already been included at the top of VTK.  Block the
##    whole thing on this condition.

when defined(_WIN32) and not defined(VTK_INCLUDE_WINDOWS_H):
  ##
  ## Define some macros to shorten the windows header.  Record which ones
  ## we defined here so that we can undefine them later.
  ##
  ## See this page for details:
  ## http://msdn.microsoft.com/library/en-us/vccore/html/_core_faster_builds_and_smaller_header_files.asp
  ##
  when not defined(VTK_WINDOWS_FULL):
    when not defined(VC_EXTRALEAN):
    when not defined(WIN32_LEAN_AND_MEAN):
    when not defined(NOSERVICE):
    when not defined(NOMCX):
    when not defined(NOIME):
    when not defined(NONLS):
  ##  Include the real windows header.
  ##  Undefine any macros we defined to shorten the windows header.
  ##    Leave the VTK_WINDOWS_* versions defined so that user code can tell
  ##    what parts of the windows header were included.
  when not defined(VTK_WINDOWS_FULL):
##  VTK-HeaderTest-Exclude: vtkWindows.h
