## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCone.h
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
##  @class   vtkCone
##  @brief   implicit function for a cone
##
##  vtkCone computes the implicit function and function gradient for a cone.
##  vtkCone is a concrete implementation of vtkImplicitFunction. The cone vertex
##  is located at the origin with axis of rotation coincident with x-axis. (Use
##  the superclass' vtkImplicitFunction transformation matrix if necessary to
##  reposition.) The angle specifies the angle between the axis of rotation
##  and the side of the cone.
##
##  @warning
##  The cone is infinite in extent. To truncate the cone use the
##  vtkImplicitBoolean in combination with clipping planes.
##

import
  vtkCommonDataModelModule, vtkImplicitFunction

type
  vtkCone* {.importcpp: "vtkCone", header: "vtkCone.h", bycopy.} = object of vtkImplicitFunction ## *
                                                                                       ##  Construct cone with angle of 45 degrees.
                                                                                       ##
    vtkCone* {.importc: "vtkCone".}: VTK_NEWINSTANCE


proc New*(): ptr vtkCone {.importcpp: "vtkCone::New(@)", header: "vtkCone.h".}
type
  vtkConeSuperclass* = vtkImplicitFunction

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkCone::IsTypeOf(@)",
    header: "vtkCone.h".}
proc IsA*(this: var vtkCone; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkCone.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCone {.
    importcpp: "vtkCone::SafeDownCast(@)", header: "vtkCone.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCone :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImplicitFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCone :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCone :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCone; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCone.h".}
## using statement

proc EvaluateFunction*(this: var vtkCone; x: array[3, cdouble]): cdouble {.
    importcpp: "EvaluateFunction", header: "vtkCone.h".}
proc EvaluateGradient*(this: var vtkCone; x: array[3, cdouble]; g: array[3, cdouble]) {.
    importcpp: "EvaluateGradient", header: "vtkCone.h".}
proc SetAngle*(this: var vtkCone; _arg: cdouble) {.importcpp: "SetAngle",
    header: "vtkCone.h".}
proc GetAngleMinValue*(this: var vtkCone): cdouble {.importcpp: "GetAngleMinValue",
    header: "vtkCone.h".}
proc GetAngleMaxValue*(this: var vtkCone): cdouble {.importcpp: "GetAngleMaxValue",
    header: "vtkCone.h".}
## !!!Ignored construct:  virtual double GetAngle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Angle  of  << this -> Angle ) ; return this -> Angle ; } ;
## Error: expected ';'!!!
