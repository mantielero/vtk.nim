## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkParametricPseudosphere.h
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
##  @class   vtkParametricPseudosphere
##  @brief   Generate a pseudosphere.
##
##  vtkParametricPseudosphere generates a parametric pseudosphere. The
##  pseudosphere is generated as a surface of revolution of the tractrix about
##  it's asymptote, and is a surface of constant negative Gaussian curvature.
##  You can find out more about this interesting surface at
##  <a href="http://mathworld.wolfram.com/Pseudosphere.html">Math World</a>.
##  @par Thanks:
##  Tim Meehan
##

import
  vtkCommonComputationalGeometryModule, vtkParametricFunction

type
  vtkParametricPseudosphere* {.importcpp: "vtkParametricPseudosphere",
                              header: "vtkParametricPseudosphere.h", bycopy.} = object of vtkParametricFunction
    vtkParametricPseudosphere* {.importc: "vtkParametricPseudosphere".}: VTK_NEWINSTANCE

  vtkParametricPseudosphereSuperclass* = vtkParametricFunction

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkParametricPseudosphere::IsTypeOf(@)",
    header: "vtkParametricPseudosphere.h".}
proc IsA*(this: var vtkParametricPseudosphere; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkParametricPseudosphere.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkParametricPseudosphere {.
    importcpp: "vtkParametricPseudosphere::SafeDownCast(@)",
    header: "vtkParametricPseudosphere.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkParametricPseudosphere :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkParametricFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkParametricPseudosphere :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkParametricPseudosphere :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkParametricPseudosphere; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkParametricPseudosphere.h".}
proc New*(): ptr vtkParametricPseudosphere {.
    importcpp: "vtkParametricPseudosphere::New(@)",
    header: "vtkParametricPseudosphere.h".}
proc GetDimension*(this: var vtkParametricPseudosphere): cint {.
    importcpp: "GetDimension", header: "vtkParametricPseudosphere.h".}
proc Evaluate*(this: var vtkParametricPseudosphere; uvw: array[3, cdouble];
              Pt: array[3, cdouble]; Duvw: array[9, cdouble]) {.importcpp: "Evaluate",
    header: "vtkParametricPseudosphere.h".}
proc EvaluateScalar*(this: var vtkParametricPseudosphere; uvw: array[3, cdouble];
                    Pt: array[3, cdouble]; Duvw: array[9, cdouble]): cdouble {.
    importcpp: "EvaluateScalar", header: "vtkParametricPseudosphere.h".}