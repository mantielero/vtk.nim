## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkWin32Header.h
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
## *
##  @class   vtkWin32Header
##  @brief   manage Windows system differences
##
##  The vtkWin32Header captures some system differences between Unix and
##  Windows operating systems.
##

when not defined(VTK_SYSTEM_INCLUDES_INSIDE):
  Do_not_include_vtkWin32Header_directly_vtkSystemIncludes_includes_it
import
  vtkABI, vtkBuild, vtkPlatform

##
##  This is a support for files on the disk that are larger than 2GB.
##  Since this is the first place that any include should happen, do this here.
##

when defined(VTK_REQUIRE_LARGE_FILE_SUPPORT):
  when not defined(_FILE_OFFSET_BITS):
    const
      _FILE_OFFSET_BITS* = 64
##
##  Windows specific stuff------------------------------------------

when defined(_WIN32):
  ##  define strict header for windows
when defined(_WIN32):
  ##  Include the windows header here only if requested by user code.
  when defined(VTK_INCLUDE_WINDOWS_H):
    ##  Define types from the windows header file.
    type
      vtkWindowsDWORD* = DWORD
      vtkWindowsPVOID* = PVOID
      vtkWindowsLPVOID* = LPVOID
      vtkWindowsHANDLE* = HANDLE
      vtkWindowsLPTHREAD_START_ROUTINE* = LPTHREAD_START_ROUTINE
  else:
    ##  Define types from the windows header file.
    type
      vtkWindowsDWORD* = culong
      vtkWindowsPVOID* = pointer
      vtkWindowsLPVOID* = vtkWindowsPVOID
      vtkWindowsHANDLE* = vtkWindowsPVOID
      vtkWindowsLPTHREAD_START_ROUTINE* = proc (a1: vtkWindowsLPVOID): vtkWindowsDWORD {.
          stdcall.}
  ##  Enable workaround for windows header name mangling.
  ##  See VTK/Utilities/Upgrading/README.WindowsMangling.txt for details.
  when not defined(__VTK_WRAP__) and not defined(__WRAP_GCCXML__):
    discard
  when defined(_MSC_VER):      ##  Visual studio
  const
    vtkGetWindowLong* = GetWindowLongPtr
    vtkSetWindowLong* = SetWindowLongPtr
    vtkLONG* = LONG_PTR
    vtkGWL_WNDPROC* = GWLP_WNDPROC
    vtkGWL_HINSTANCE* = GWLP_HINSTANCE
    vtkGWL_USERDATA* = GWLP_USERDATA
when defined(_MSC_VER):
  ##  Enable MSVC compiler warning messages that are useful but off by default.
  ##  Disable MSVC compiler warning messages that often occur in valid code.
  when not defined(VTK_DISPLAY_WIN32_WARNINGS):
##  Now set up the generic VTK export macro.

when defined(VTK_BUILD_SHARED_LIBS):
  const
    VTK_EXPORT* = VTK_ABI_EXPORT
else:
  discard
##  VTK-HeaderTest-Exclude: vtkWin32Header.h
