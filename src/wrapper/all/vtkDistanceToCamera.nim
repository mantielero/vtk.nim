## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDistanceToCamera.h
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
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkDistanceToCamera
##  @brief   calculates distance from points to the camera.
##
##
##  This filter adds a double array containing the distance from each point
##  to the camera. If Scaling is on, it will use the values in the input
##  array to process in order to scale the size of the points. ScreenSize
##  sets the size in screen pixels that you would want a rendered rectangle
##  at that point to be, if it was scaled by the output array.
##

import
  vtkPointSetAlgorithm, vtkRenderingCoreModule

discard "forward decl of vtkRenderer"
type
  vtkDistanceToCamera* {.importcpp: "vtkDistanceToCamera",
                        header: "vtkDistanceToCamera.h", bycopy.} = object of vtkPointSetAlgorithm
    vtkDistanceToCamera* {.importc: "vtkDistanceToCamera".}: VTK_NEWINSTANCE


proc New*(): ptr vtkDistanceToCamera {.importcpp: "vtkDistanceToCamera::New(@)",
                                   header: "vtkDistanceToCamera.h".}
type
  vtkDistanceToCameraSuperclass* = vtkPointSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDistanceToCamera::IsTypeOf(@)", header: "vtkDistanceToCamera.h".}
proc IsA*(this: var vtkDistanceToCamera; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkDistanceToCamera.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDistanceToCamera {.
    importcpp: "vtkDistanceToCamera::SafeDownCast(@)",
    header: "vtkDistanceToCamera.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDistanceToCamera :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPointSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDistanceToCamera :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDistanceToCamera :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDistanceToCamera; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkDistanceToCamera.h".}
proc SetRenderer*(this: var vtkDistanceToCamera; ren: ptr vtkRenderer) {.
    importcpp: "SetRenderer", header: "vtkDistanceToCamera.h".}
proc GetnameRenderer*(this: var vtkDistanceToCamera): ptr vtkRenderer {.
    importcpp: "GetnameRenderer", header: "vtkDistanceToCamera.h".}
  ## /@}
  ## /@{
  ## *
  ##  The desired screen size obtained by scaling glyphs by the distance
  ##  array. It assumes the glyph at each point will be unit size.
  ##
proc SetScreenSize*(this: var vtkDistanceToCamera; _arg: cdouble) {.
    importcpp: "SetScreenSize", header: "vtkDistanceToCamera.h".}
## !!!Ignored construct:  virtual double GetScreenSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScreenSize  of  << this -> ScreenSize ) ; return this -> ScreenSize ; } ;
## Error: expected ';'!!!

proc SetScreenSizeScaling*(this: var vtkDistanceToCamera; _arg: bool) {.
    importcpp: "SetScreenSizeScaling", header: "vtkDistanceToCamera.h".}
## !!!Ignored construct:  virtual bool GetScreenSizeScaling ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Scaling  of  << this -> Scaling ) ; return this -> Scaling ; } ;
## Error: expected ';'!!!

proc ScalingOn*(this: var vtkDistanceToCamera) {.importcpp: "ScalingOn",
    header: "vtkDistanceToCamera.h".}
proc ScalingOff*(this: var vtkDistanceToCamera) {.importcpp: "ScalingOff",
    header: "vtkDistanceToCamera.h".}
  ## /@}
  ## /@{
  ## *
  ##  The name of the distance array. If not set, the array is
  ##  named 'DistanceToCamera'.
  ##
proc SetDistanceArrayName*(this: var vtkDistanceToCamera; _arg: cstring) {.
    importcpp: "SetDistanceArrayName", header: "vtkDistanceToCamera.h".}
proc GetDistanceArrayName*(this: var vtkDistanceToCamera): cstring {.
    importcpp: "GetDistanceArrayName", header: "vtkDistanceToCamera.h".}
  ## /@}
  ## *
  ##  The modified time of this filter.
  ##
proc GetMTime*(this: var vtkDistanceToCamera): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkDistanceToCamera.h".}