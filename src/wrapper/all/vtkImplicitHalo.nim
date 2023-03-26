## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImplicitHalo.h
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
##  @class   vtkImplicitHalo
##  @brief   implicit function for an halo
##
##  vtkImplicitHalo evaluates to 1.0 for each position in the sphere of a
##  given center and radius Radius*(1-FadeOut). It evaluates to 0.0 for each
##  position out the sphere of a given Center and radius Radius. It fades out
##  linearly from 1.0 to 0.0 for points in a radius from Radius*(1-FadeOut) to
##  Radius.
##  vtkImplicitHalo is a concrete implementation of vtkImplicitFunction.
##  It is useful as an input to
##  vtkSampleFunction to generate an 2D image of an halo. It is used this way by
##  vtkShadowMapPass.
##  @warning
##  It does not implement the gradient.
##

import
  vtkCommonDataModelModule, vtkImplicitFunction

type
  vtkImplicitHalo* {.importcpp: "vtkImplicitHalo", header: "vtkImplicitHalo.h",
                    bycopy.} = object of vtkImplicitFunction ## *
                                                        ##  Center=(0.0,0.0,0.0), Radius=1.0, FadeOut=0.01
                                                        ##
    vtkImplicitHalo* {.importc: "vtkImplicitHalo".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImplicitHalo {.importcpp: "vtkImplicitHalo::New(@)",
                               header: "vtkImplicitHalo.h".}
type
  vtkImplicitHaloSuperclass* = vtkImplicitFunction

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImplicitHalo::IsTypeOf(@)", header: "vtkImplicitHalo.h".}
proc IsA*(this: var vtkImplicitHalo; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkImplicitHalo.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImplicitHalo {.
    importcpp: "vtkImplicitHalo::SafeDownCast(@)", header: "vtkImplicitHalo.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImplicitHalo :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImplicitFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImplicitHalo :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImplicitHalo :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImplicitHalo; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImplicitHalo.h".}
## using statement

proc EvaluateFunction*(this: var vtkImplicitHalo; x: array[3, cdouble]): cdouble {.
    importcpp: "EvaluateFunction", header: "vtkImplicitHalo.h".}
proc EvaluateGradient*(this: var vtkImplicitHalo; x: array[3, cdouble];
                      g: array[3, cdouble]) {.importcpp: "EvaluateGradient",
    header: "vtkImplicitHalo.h".}
proc SetRadius*(this: var vtkImplicitHalo; _arg: cdouble) {.importcpp: "SetRadius",
    header: "vtkImplicitHalo.h".}
## !!!Ignored construct:  virtual double GetRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Radius  of  << this -> Radius ) ; return this -> Radius ; } ;
## Error: expected ';'!!!

proc SetCenter*(this: var vtkImplicitHalo; _arg1: cdouble; _arg2: cdouble;
               _arg3: cdouble) {.importcpp: "SetCenter", header: "vtkImplicitHalo.h".}
proc SetCenter*(this: var vtkImplicitHalo; _arg: array[3, cdouble]) {.
    importcpp: "SetCenter", header: "vtkImplicitHalo.h".}
## !!!Ignored construct:  virtual double * GetCenter ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Center  pointer  << this -> Center ) ; return this -> Center ; } VTK_WRAPEXCLUDE virtual void GetCenter ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Center [ 0 ] ; _arg2 = this -> Center [ 1 ] ; _arg3 = this -> Center [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Center  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCenter ( double _arg [ 3 ] ) { this -> GetCenter ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetRadiusFadeOut*(this: var vtkImplicitHalo; _arg: cdouble) {.
    importcpp: "SetRadiusFadeOut", header: "vtkImplicitHalo.h".}
## !!!Ignored construct:  virtual double GetRadiusFadeOut ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FadeOut  of  << this -> FadeOut ) ; return this -> FadeOut ; } ;
## Error: expected ';'!!!
