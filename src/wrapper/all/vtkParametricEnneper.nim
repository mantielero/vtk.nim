## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkParametricEnneper.h
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
##  @class   vtkParametricEnneper
##  @brief   Generate Enneper's surface.
##
##  vtkParametricEnneper generates Enneper's surface.
##  Enneper's surface is a a self-intersecting minimal surface
##  possessing constant negative Gaussian curvature
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
  vtkParametricEnneper* {.importcpp: "vtkParametricEnneper",
                         header: "vtkParametricEnneper.h", bycopy.} = object of vtkParametricFunction
    vtkParametricEnneper* {.importc: "vtkParametricEnneper".}: VTK_NEWINSTANCE

  vtkParametricEnneperSuperclass* = vtkParametricFunction

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkParametricEnneper::IsTypeOf(@)",
    header: "vtkParametricEnneper.h".}
proc IsA*(this: var vtkParametricEnneper; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkParametricEnneper.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkParametricEnneper {.
    importcpp: "vtkParametricEnneper::SafeDownCast(@)",
    header: "vtkParametricEnneper.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkParametricEnneper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkParametricFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkParametricEnneper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkParametricEnneper :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkParametricEnneper; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkParametricEnneper.h".}
proc New*(): ptr vtkParametricEnneper {.importcpp: "vtkParametricEnneper::New(@)",
                                    header: "vtkParametricEnneper.h".}
proc GetDimension*(this: var vtkParametricEnneper): cint {.importcpp: "GetDimension",
    header: "vtkParametricEnneper.h".}
proc Evaluate*(this: var vtkParametricEnneper; uvw: array[3, cdouble];
              Pt: array[3, cdouble]; Duvw: array[9, cdouble]) {.importcpp: "Evaluate",
    header: "vtkParametricEnneper.h".}
proc EvaluateScalar*(this: var vtkParametricEnneper; uvw: array[3, cdouble];
                    Pt: array[3, cdouble]; Duvw: array[9, cdouble]): cdouble {.
    importcpp: "EvaluateScalar", header: "vtkParametricEnneper.h".}