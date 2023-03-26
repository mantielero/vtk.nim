## =========================================================================
##
##   Program:   DICOMParser
##   Module:    DICOMConfig.h
##   Language:  C++
##
##   Copyright (c) 2003 Matt Turek
##   All rights reserved.
##   See Copyright.txt for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================

##
##  CMake Hook
##

import
  DICOMCMakeConfig

##
##  BEGIN Toolkit (ITK,VTK, etc) specific
##

when defined(vtkDICOMParser_EXPORTS):
  discard
##
##  END toolkit (ITK, VTK, etc) specific
##

const
  dicom_stl* = std

when defined(DICOM_ANSI_STDLIB):
  const
    dicom_stream* = std
else:
when defined(DICOM_DLL):
  when defined(DICOMParser_EXPORTS):
  else:
    const
      __declspec* = cast[dllexport](__declspec(dllimport))
      extern* = true
else:
  const
    __declspec* = (dllexport)