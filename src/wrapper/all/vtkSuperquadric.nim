## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSuperquadric.h
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
##  @class   vtkSuperquadric
##  @brief   implicit function for a Superquadric
##
##  vtkSuperquadric computes the implicit function and function gradient
##  for a superquadric. vtkSuperquadric is a concrete implementation of
##  vtkImplicitFunction.  The superquadric is centered at Center and axes
##  of rotation is along the y-axis. (Use the superclass'
##  vtkImplicitFunction transformation matrix if necessary to reposition.)
##  Roundness parameters (PhiRoundness and ThetaRoundness) control
##  the shape of the superquadric.  The Toroidal boolean controls whether
##  a toroidal superquadric is produced.  If so, the Thickness parameter
##  controls the thickness of the toroid:  0 is the thinnest allowable
##  toroid, and 1 has a minimum sized hole.  The Scale parameters allow
##  the superquadric to be scaled in x, y, and z (normal vectors are correctly
##  generated in any case).  The Size parameter controls size of the
##  superquadric.
##
##  This code is based on "Rigid physically based superquadrics", A. H. Barr,
##  in "Graphics Gems III", David Kirk, ed., Academic Press, 1992.
##
##  @warning
##  The Size and Thickness parameters control coefficients of superquadric
##  generation, and may do not exactly describe the size of the superquadric.
##
##

import
  vtkCommonDataModelModule, vtkImplicitFunction

const
  VTK_MIN_SUPERQUADRIC_THICKNESS* = 1e-4

type
  vtkSuperquadric* {.importcpp: "vtkSuperquadric", header: "vtkSuperquadric.h",
                    bycopy.} = object of vtkImplicitFunction ## *
                                                        ##  Construct with superquadric radius of 0.5, toroidal off, center at 0.0,
                                                        ##  scale (1,1,1), size 0.5, phi roundness 1.0, and theta roundness 0.0.
                                                        ##
    vtkSuperquadric* {.importc: "vtkSuperquadric".}: VTK_NEWINSTANCE


proc New*(): ptr vtkSuperquadric {.importcpp: "vtkSuperquadric::New(@)",
                               header: "vtkSuperquadric.h".}
type
  vtkSuperquadricSuperclass* = vtkImplicitFunction

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSuperquadric::IsTypeOf(@)", header: "vtkSuperquadric.h".}
proc IsA*(this: var vtkSuperquadric; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkSuperquadric.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSuperquadric {.
    importcpp: "vtkSuperquadric::SafeDownCast(@)", header: "vtkSuperquadric.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSuperquadric :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImplicitFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSuperquadric :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSuperquadric :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSuperquadric; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSuperquadric.h".}
## using statement

proc EvaluateFunction*(this: var vtkSuperquadric; x: array[3, cdouble]): cdouble {.
    importcpp: "EvaluateFunction", header: "vtkSuperquadric.h".}
proc EvaluateGradient*(this: var vtkSuperquadric; x: array[3, cdouble];
                      g: array[3, cdouble]) {.importcpp: "EvaluateGradient",
    header: "vtkSuperquadric.h".}
proc SetCenter*(this: var vtkSuperquadric; _arg1: cdouble; _arg2: cdouble;
               _arg3: cdouble) {.importcpp: "SetCenter", header: "vtkSuperquadric.h".}
proc SetCenter*(this: var vtkSuperquadric; _arg: array[3, cdouble]) {.
    importcpp: "SetCenter", header: "vtkSuperquadric.h".}
## !!!Ignored construct:  virtual double * GetCenter ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Center  pointer  << this -> Center ) ; return this -> Center ; } VTK_WRAPEXCLUDE virtual void GetCenter ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Center [ i ] ; } } ;
## Error: expected ';'!!!

proc SetCenterScale*(this: var vtkSuperquadric; _arg1: cdouble; _arg2: cdouble;
                    _arg3: cdouble) {.importcpp: "SetCenterScale",
                                    header: "vtkSuperquadric.h".}
proc SetCenterScale*(this: var vtkSuperquadric; _arg: array[3, cdouble]) {.
    importcpp: "SetCenterScale", header: "vtkSuperquadric.h".}
## !!!Ignored construct:  virtual double * GetCenterScale ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Scale  pointer  << this -> Scale ) ; return this -> Scale ; } VTK_WRAPEXCLUDE virtual void GetCenterScale ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Scale [ i ] ; } } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Set/Get Superquadric ring thickness (toroids only).
##  Changing thickness maintains the outside diameter of the toroid.
##  virtual double GetThicknessThickness ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Thickness  of  << this -> Thickness ) ; return this -> Thickness ; } ;
## Error: expected ';'!!!

proc SetThickness*(this: var vtkSuperquadric; _arg: cdouble) {.
    importcpp: "SetThickness", header: "vtkSuperquadric.h".}
proc GetThicknessMinValue*(this: var vtkSuperquadric): cdouble {.
    importcpp: "GetThicknessMinValue", header: "vtkSuperquadric.h".}
proc GetThicknessMaxValue*(this: var vtkSuperquadric): cdouble {.
    importcpp: "GetThicknessMaxValue", header: "vtkSuperquadric.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get Superquadric north/south roundness.
  ##  Values range from 0 (rectangular) to 1 (circular) to higher orders.
  ##
## !!!Ignored construct:  virtual double GetThicknessThicknessPhiRoundness ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PhiRoundness  of  << this -> PhiRoundness ) ; return this -> PhiRoundness ; } ;
## Error: expected ';'!!!

proc SetPhiRoundness*(this: var vtkSuperquadric; e: cdouble) {.
    importcpp: "SetPhiRoundness", header: "vtkSuperquadric.h".}
## !!!Ignored construct:  /@} /@{ *
##  Set/Get Superquadric east/west roundness.
##  Values range from 0 (rectangular) to 1 (circular) to higher orders.
##  virtual double GetThicknessThicknessPhiRoundnessThetaRoundnessThetaRoundness ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ThetaRoundness  of  << this -> ThetaRoundness ) ; return this -> ThetaRoundness ; } ;
## Error: expected ';'!!!

proc SetThetaRoundness*(this: var vtkSuperquadric; e: cdouble) {.
    importcpp: "SetThetaRoundness", header: "vtkSuperquadric.h".}
proc SetSize*(this: var vtkSuperquadric; _arg: cdouble) {.importcpp: "SetSize",
    header: "vtkSuperquadric.h".}
## !!!Ignored construct:  virtual double GetThicknessThicknessPhiRoundnessThetaRoundnessThetaRoundnessSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Size  of  << this -> Size ) ; return this -> Size ; } ;
## Error: expected ';'!!!

proc ToroidalOn*(this: var vtkSuperquadric) {.importcpp: "ToroidalOn",
    header: "vtkSuperquadric.h".}
proc ToroidalOff*(this: var vtkSuperquadric) {.importcpp: "ToroidalOff",
    header: "vtkSuperquadric.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetThicknessThicknessPhiRoundnessThetaRoundnessThetaRoundnessSizeToroidal ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Toroidal  of  << this -> Toroidal ) ; return this -> Toroidal ; } ;
## Error: expected ';'!!!

proc SetSizeToroidal*(this: var vtkSuperquadric; _arg: vtkTypeBool) {.
    importcpp: "SetSizeToroidal", header: "vtkSuperquadric.h".}
  ## /@}