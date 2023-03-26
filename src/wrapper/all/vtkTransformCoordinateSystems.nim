## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTransformCoordinateSystems.h
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
##  @class   vtkTransformCoordinateSystems
##  @brief   transform points into different coordinate systems
##
##  This filter transforms points from one coordinate system to another. The user
##  must specify the coordinate systems in which the input and output are
##  specified. The user must also specify the VTK viewport (i.e., renderer) in
##  which the transformation occurs.
##
##  @sa
##  vtkCoordinate vtkTransformFilter vtkTransformPolyData vtkPolyDataMapper2D
##

import
  vtkCoordinate, vtkPointSetAlgorithm, vtkRenderingCoreModule

type
  vtkTransformCoordinateSystems* {.importcpp: "vtkTransformCoordinateSystems",
                                  header: "vtkTransformCoordinateSystems.h",
                                  bycopy.} = object of vtkPointSetAlgorithm ## /@{
                                                                       ## *
                                                                       ##  Standard methods for type information and printing.
                                                                       ##
    vtkTransformCoordinateSystems* {.importc: "vtkTransformCoordinateSystems".}: VTK_NEWINSTANCE

  vtkTransformCoordinateSystemsSuperclass* = vtkPointSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTransformCoordinateSystems::IsTypeOf(@)",
    header: "vtkTransformCoordinateSystems.h".}
proc IsA*(this: var vtkTransformCoordinateSystems; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTransformCoordinateSystems.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTransformCoordinateSystems {.
    importcpp: "vtkTransformCoordinateSystems::SafeDownCast(@)",
    header: "vtkTransformCoordinateSystems.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTransformCoordinateSystems :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPointSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTransformCoordinateSystems :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTransformCoordinateSystems :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTransformCoordinateSystems; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkTransformCoordinateSystems.h".}
proc New*(): ptr vtkTransformCoordinateSystems {.
    importcpp: "vtkTransformCoordinateSystems::New(@)",
    header: "vtkTransformCoordinateSystems.h".}
proc SetInputCoordinateSystem*(this: var vtkTransformCoordinateSystems; _arg: cint) {.
    importcpp: "SetInputCoordinateSystem",
    header: "vtkTransformCoordinateSystems.h".}
## !!!Ignored construct:  virtual int GetInputCoordinateSystem ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InputCoordinateSystem  of  << this -> InputCoordinateSystem ) ; return this -> InputCoordinateSystem ; } ;
## Error: expected ';'!!!

proc SetInputCoordinateSystemToDisplay*(this: var vtkTransformCoordinateSystems) {.
    importcpp: "SetInputCoordinateSystemToDisplay",
    header: "vtkTransformCoordinateSystems.h".}
proc SetInputCoordinateSystemToViewport*(this: var vtkTransformCoordinateSystems) {.
    importcpp: "SetInputCoordinateSystemToViewport",
    header: "vtkTransformCoordinateSystems.h".}
proc SetInputCoordinateSystemToWorld*(this: var vtkTransformCoordinateSystems) {.
    importcpp: "SetInputCoordinateSystemToWorld",
    header: "vtkTransformCoordinateSystems.h".}
proc SetInputCoordinateSystemOutputCoordinateSystem*(
    this: var vtkTransformCoordinateSystems; _arg: cint) {.
    importcpp: "SetInputCoordinateSystemOutputCoordinateSystem",
    header: "vtkTransformCoordinateSystems.h".}
## !!!Ignored construct:  virtual int GetInputCoordinateSystemOutputCoordinateSystem ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputCoordinateSystem  of  << this -> OutputCoordinateSystem ) ; return this -> OutputCoordinateSystem ; } ;
## Error: expected ';'!!!

proc SetOutputCoordinateSystemToDisplay*(this: var vtkTransformCoordinateSystems) {.
    importcpp: "SetOutputCoordinateSystemToDisplay",
    header: "vtkTransformCoordinateSystems.h".}
proc SetOutputCoordinateSystemToViewport*(this: var vtkTransformCoordinateSystems) {.
    importcpp: "SetOutputCoordinateSystemToViewport",
    header: "vtkTransformCoordinateSystems.h".}
proc SetOutputCoordinateSystemToWorld*(this: var vtkTransformCoordinateSystems) {.
    importcpp: "SetOutputCoordinateSystemToWorld",
    header: "vtkTransformCoordinateSystems.h".}
proc GetMTime*(this: var vtkTransformCoordinateSystems): vtkMTimeType {.
    importcpp: "GetMTime", header: "vtkTransformCoordinateSystems.h".}
proc SetViewport*(this: var vtkTransformCoordinateSystems; viewport: ptr vtkViewport) {.
    importcpp: "SetViewport", header: "vtkTransformCoordinateSystems.h".}
proc GetnameViewport*(this: var vtkTransformCoordinateSystems): ptr vtkViewport {.
    importcpp: "GetnameViewport", header: "vtkTransformCoordinateSystems.h".}
  ## /@}