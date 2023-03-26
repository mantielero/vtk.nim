## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkParametricPluckerConoid.h
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
##  @class   vtkParametricPluckerConoid
##  @brief   Generate Plucker's conoid surface.
##
##  vtkParametricPluckerConoid generates Plucker's conoid surface parametrically.
##  Plucker's conoid is a ruled surface, named after Julius Plucker. It is
##  possible to set the number of folds in this class via the parameter 'N'.
##
##  For more information, see the Wikipedia page on
##  <a href="https://en.wikipedia.org/wiki/Pl%c3%bccker%27s_conoid">Plucker's Conoid</a>.
##  @warning
##  I haven't done any special checking on the number of folds parameter, N.
##  @par Thanks:
##  Tim Meehan
##

import
  vtkCommonComputationalGeometryModule, vtkParametricFunction

type
  vtkParametricPluckerConoid* {.importcpp: "vtkParametricPluckerConoid",
                               header: "vtkParametricPluckerConoid.h", bycopy.} = object of vtkParametricFunction
    vtkParametricPluckerConoid* {.importc: "vtkParametricPluckerConoid".}: VTK_NEWINSTANCE

  vtkParametricPluckerConoidSuperclass* = vtkParametricFunction

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkParametricPluckerConoid::IsTypeOf(@)",
    header: "vtkParametricPluckerConoid.h".}
proc IsA*(this: var vtkParametricPluckerConoid; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkParametricPluckerConoid.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkParametricPluckerConoid {.
    importcpp: "vtkParametricPluckerConoid::SafeDownCast(@)",
    header: "vtkParametricPluckerConoid.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkParametricPluckerConoid :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkParametricFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkParametricPluckerConoid :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkParametricPluckerConoid :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkParametricPluckerConoid; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkParametricPluckerConoid.h".}
## !!!Ignored construct:  /@{ *
##  This is the number of folds in the conoid.
##  virtual int GetNN ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << N  of  << this -> N ) ; return this -> N ; } ;
## Error: expected ';'!!!

proc SetN*(this: var vtkParametricPluckerConoid; _arg: cint) {.importcpp: "SetN",
    header: "vtkParametricPluckerConoid.h".}
  ## /@}
  ## *
  ##  Construct Plucker's conoid surface with the following parameters:
  ##  (MinimumU, MaximumU) = (0., 3.),
  ##  (MinimumV, MaximumV) = (0., 2*pi),
  ##  JoinU = 0, JoinV = 0,
  ##  TwistU = 0, TwistV = 0;
  ##  ClockwiseOrdering = 0,
  ##  DerivativesAvailable = 1,
  ##
proc New*(): ptr vtkParametricPluckerConoid {.
    importcpp: "vtkParametricPluckerConoid::New(@)",
    header: "vtkParametricPluckerConoid.h".}
proc GetDimension*(this: var vtkParametricPluckerConoid): cint {.
    importcpp: "GetDimension", header: "vtkParametricPluckerConoid.h".}
proc Evaluate*(this: var vtkParametricPluckerConoid; uvw: array[3, cdouble];
              Pt: array[3, cdouble]; Duvw: array[9, cdouble]) {.importcpp: "Evaluate",
    header: "vtkParametricPluckerConoid.h".}
proc EvaluateScalar*(this: var vtkParametricPluckerConoid; uvw: array[3, cdouble];
                    Pt: array[3, cdouble]; Duvw: array[9, cdouble]): cdouble {.
    importcpp: "EvaluateScalar", header: "vtkParametricPluckerConoid.h".}