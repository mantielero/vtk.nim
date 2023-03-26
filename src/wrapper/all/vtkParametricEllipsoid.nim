## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkParametricEllipsoid.h
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
##  @class   vtkParametricEllipsoid
##  @brief   Generate an ellipsoid.
##
##  vtkParametricEllipsoid generates an ellipsoid.
##  If all the radii are the same, we have a sphere.
##  An oblate spheroid occurs if RadiusX = RadiusY > RadiusZ.
##  Here the Z-axis forms the symmetry axis. To a first
##  approximation, this is the shape of the earth.
##  A prolate spheroid occurs if RadiusX = RadiusY < RadiusZ.
##
##  For further information about this surface, please consult the
##  technical description "Parametric surfaces" in http://www.vtk.org/publications
##  in the "VTK Technical Documents" section in the VTk.org web pages.
##
##  @par Thanks:
##  Andrew Maclean andrew.amaclean@gmail.com for creating and contributing the
##  class.
##
##

import
  vtkCommonComputationalGeometryModule, vtkParametricFunction

type
  vtkParametricEllipsoid* {.importcpp: "vtkParametricEllipsoid",
                           header: "vtkParametricEllipsoid.h", bycopy.} = object of vtkParametricFunction
    vtkParametricEllipsoid* {.importc: "vtkParametricEllipsoid".}: VTK_NEWINSTANCE

  vtkParametricEllipsoidSuperclass* = vtkParametricFunction

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkParametricEllipsoid::IsTypeOf(@)",
    header: "vtkParametricEllipsoid.h".}
proc IsA*(this: var vtkParametricEllipsoid; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkParametricEllipsoid.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkParametricEllipsoid {.
    importcpp: "vtkParametricEllipsoid::SafeDownCast(@)",
    header: "vtkParametricEllipsoid.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkParametricEllipsoid :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkParametricFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkParametricEllipsoid :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkParametricEllipsoid :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkParametricEllipsoid; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkParametricEllipsoid.h".}
proc New*(): ptr vtkParametricEllipsoid {.importcpp: "vtkParametricEllipsoid::New(@)",
                                      header: "vtkParametricEllipsoid.h".}
proc GetDimension*(this: var vtkParametricEllipsoid): cint {.
    importcpp: "GetDimension", header: "vtkParametricEllipsoid.h".}
proc SetXRadius*(this: var vtkParametricEllipsoid; _arg: cdouble) {.
    importcpp: "SetXRadius", header: "vtkParametricEllipsoid.h".}
## !!!Ignored construct:  virtual double GetXRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << XRadius  of  << this -> XRadius ) ; return this -> XRadius ; } ;
## Error: expected ';'!!!

proc SetXRadiusYRadius*(this: var vtkParametricEllipsoid; _arg: cdouble) {.
    importcpp: "SetXRadiusYRadius", header: "vtkParametricEllipsoid.h".}
## !!!Ignored construct:  virtual double GetXRadiusYRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << YRadius  of  << this -> YRadius ) ; return this -> YRadius ; } ;
## Error: expected ';'!!!

proc SetXRadiusYRadiusZRadius*(this: var vtkParametricEllipsoid; _arg: cdouble) {.
    importcpp: "SetXRadiusYRadiusZRadius", header: "vtkParametricEllipsoid.h".}
## !!!Ignored construct:  virtual double GetXRadiusYRadiusZRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ZRadius  of  << this -> ZRadius ) ; return this -> ZRadius ; } ;
## Error: expected ';'!!!

proc Evaluate*(this: var vtkParametricEllipsoid; uvw: array[3, cdouble];
              Pt: array[3, cdouble]; Duvw: array[9, cdouble]) {.importcpp: "Evaluate",
    header: "vtkParametricEllipsoid.h".}
proc EvaluateScalar*(this: var vtkParametricEllipsoid; uvw: array[3, cdouble];
                    Pt: array[3, cdouble]; Duvw: array[9, cdouble]): cdouble {.
    importcpp: "EvaluateScalar", header: "vtkParametricEllipsoid.h".}