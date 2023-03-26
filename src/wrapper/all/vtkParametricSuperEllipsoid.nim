## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkParametricSuperEllipsoid.h
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
##  @class   vtkParametricSuperEllipsoid
##  @brief   Generate a superellipsoid.
##
##  vtkParametricSuperEllipsoid generates a superellipsoid.  A superellipsoid
##  is a versatile primitive that is controlled by two parameters n1 and
##  n2. As special cases it can represent a sphere, square box, and closed
##  cylindrical can.
##
##  For further information about this surface, please consult the
##  technical description "Parametric surfaces" in http://www.vtk.org/publications
##  in the "VTK Technical Documents" section in the VTk.org web pages.
##
##  Also see: http://paulbourke.net/geometry/superellipse/
##
##  @warning
##  Care needs to be taken specifying the bounds correctly. You may need to
##  carefully adjust MinimumU, MinimumV, MaximumU, MaximumV.
##
##  @par Thanks:
##  Andrew Maclean andrew.amaclean@gmail.com for creating and contributing the
##  class.
##
##

import
  vtkCommonComputationalGeometryModule, vtkParametricFunction

type
  vtkParametricSuperEllipsoid* {.importcpp: "vtkParametricSuperEllipsoid",
                                header: "vtkParametricSuperEllipsoid.h", bycopy.} = object of vtkParametricFunction
    vtkParametricSuperEllipsoid* {.importc: "vtkParametricSuperEllipsoid".}: VTK_NEWINSTANCE

  vtkParametricSuperEllipsoidSuperclass* = vtkParametricFunction

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkParametricSuperEllipsoid::IsTypeOf(@)",
    header: "vtkParametricSuperEllipsoid.h".}
proc IsA*(this: var vtkParametricSuperEllipsoid; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkParametricSuperEllipsoid.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkParametricSuperEllipsoid {.
    importcpp: "vtkParametricSuperEllipsoid::SafeDownCast(@)",
    header: "vtkParametricSuperEllipsoid.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkParametricSuperEllipsoid :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkParametricFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkParametricSuperEllipsoid :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkParametricSuperEllipsoid :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkParametricSuperEllipsoid; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkParametricSuperEllipsoid.h".}
proc New*(): ptr vtkParametricSuperEllipsoid {.
    importcpp: "vtkParametricSuperEllipsoid::New(@)",
    header: "vtkParametricSuperEllipsoid.h".}
proc GetDimension*(this: var vtkParametricSuperEllipsoid): cint {.
    importcpp: "GetDimension", header: "vtkParametricSuperEllipsoid.h".}
proc SetXRadius*(this: var vtkParametricSuperEllipsoid; _arg: cdouble) {.
    importcpp: "SetXRadius", header: "vtkParametricSuperEllipsoid.h".}
## !!!Ignored construct:  virtual double GetXRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << XRadius  of  << this -> XRadius ) ; return this -> XRadius ; } ;
## Error: expected ';'!!!

proc SetXRadiusYRadius*(this: var vtkParametricSuperEllipsoid; _arg: cdouble) {.
    importcpp: "SetXRadiusYRadius", header: "vtkParametricSuperEllipsoid.h".}
## !!!Ignored construct:  virtual double GetXRadiusYRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << YRadius  of  << this -> YRadius ) ; return this -> YRadius ; } ;
## Error: expected ';'!!!

proc SetXRadiusYRadiusZRadius*(this: var vtkParametricSuperEllipsoid; _arg: cdouble) {.
    importcpp: "SetXRadiusYRadiusZRadius", header: "vtkParametricSuperEllipsoid.h".}
## !!!Ignored construct:  virtual double GetXRadiusYRadiusZRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ZRadius  of  << this -> ZRadius ) ; return this -> ZRadius ; } ;
## Error: expected ';'!!!

proc SetXRadiusYRadiusZRadiusN1*(this: var vtkParametricSuperEllipsoid;
                                _arg: cdouble) {.
    importcpp: "SetXRadiusYRadiusZRadiusN1",
    header: "vtkParametricSuperEllipsoid.h".}
## !!!Ignored construct:  virtual double GetXRadiusYRadiusZRadiusN1 ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << N1  of  << this -> N1 ) ; return this -> N1 ; } ;
## Error: expected ';'!!!

proc SetXRadiusYRadiusZRadiusN1N2*(this: var vtkParametricSuperEllipsoid;
                                  _arg: cdouble) {.
    importcpp: "SetXRadiusYRadiusZRadiusN1N2",
    header: "vtkParametricSuperEllipsoid.h".}
## !!!Ignored construct:  virtual double GetXRadiusYRadiusZRadiusN1N2 ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << N2  of  << this -> N2 ) ; return this -> N2 ; } ;
## Error: expected ';'!!!

proc Evaluate*(this: var vtkParametricSuperEllipsoid; uvw: array[3, cdouble];
              Pt: array[3, cdouble]; Duvw: array[9, cdouble]) {.importcpp: "Evaluate",
    header: "vtkParametricSuperEllipsoid.h".}
proc EvaluateScalar*(this: var vtkParametricSuperEllipsoid; uvw: array[3, cdouble];
                    Pt: array[3, cdouble]; Duvw: array[9, cdouble]): cdouble {.
    importcpp: "EvaluateScalar", header: "vtkParametricSuperEllipsoid.h".}