## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTDxMotionEventInfo.h
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
##  @class   vtkTDxMotionEventInfo
##  @brief   Store motion information from a 3DConnexion input device
##
##  vtkTDxMotionEventInfo is a data structure that stores the information about
##  a motion event from a 3DConnexion input device.
##
##  @sa
##  vtkTDxDevice
##

import
  vtkObject, vtkRenderingCoreModule

type
  vtkTDxMotionEventInfo* {.importcpp: "vtkTDxMotionEventInfo",
                          header: "vtkTDxMotionEventInfo.h", bycopy.} = object ## /@{
                                                                          ## *
                                                                          ##  Translation coordinates
                                                                          ##
    X* {.importc: "X".}: cdouble
    Y* {.importc: "Y".}: cdouble
    Z* {.importc: "Z".}: cdouble ## /@}
                             ## *
                             ##  Rotation angle.
                             ##  The angle is in arbitrary unit.
                             ##  It makes sense to have arbitrary unit
                             ##  because the data comes from a device
                             ##  where the information can be scaled by
                             ##  the end-user.
                             ##
    Angle* {.importc: "Angle".}: cdouble ## /@{
                                     ## *
                                     ##  Rotation axis expressed as a unit vector.
                                     ##
    AxisX* {.importc: "AxisX".}: cdouble
    AxisY* {.importc: "AxisY".}: cdouble
    AxisZ* {.importc: "AxisZ".}: cdouble ## /@}


##  VTK-HeaderTest-Exclude: vtkTDxMotionEventInfo.h
