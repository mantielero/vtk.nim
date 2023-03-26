## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGPUInfoListArray.h
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
##  @class   vtkGPUInfoListArray
##  @brief   Internal class vtkGPUInfoList.
##
##  vtkGPUInfoListArray is just a PIMPL mechanism for vtkGPUInfoList.
##

import
  vtkGPUInfo

type
  vtkGPUInfoListArray* {.importcpp: "vtkGPUInfoListArray",
                        header: "vtkGPUInfoListArray.h", bycopy.} = object
    v* {.importc: "v".}: vector[ptr vtkGPUInfo]


##  VTK-HeaderTest-Exclude: vtkGPUInfoListArray.h
