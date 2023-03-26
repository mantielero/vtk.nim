## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkParametricCatalanMinimal.h
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
##  @class   vtkParametricCatalanMinimal
##  @brief   Generate Catalan's minimal surface.
##
##  vtkParametricCatalanMinimal generates Catalan's minimal surface
##  parametrically. This minimal surface contains the cycloid as a geodesic.
##  More information about it can be found at
##  <a href="https://en.wikipedia.org/wiki/Catalan%27s_minimal_surface">Wikipedia</a>.
##  @par Thanks:
##  Tim Meehan
##

import
  vtkCommonComputationalGeometryModule, vtkParametricFunction

type
  vtkParametricCatalanMinimal* {.importcpp: "vtkParametricCatalanMinimal",
                                header: "vtkParametricCatalanMinimal.h", bycopy.} = object of vtkParametricFunction
    vtkParametricCatalanMinimal* {.importc: "vtkParametricCatalanMinimal".}: VTK_NEWINSTANCE

  vtkParametricCatalanMinimalSuperclass* = vtkParametricFunction

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkParametricCatalanMinimal::IsTypeOf(@)",
    header: "vtkParametricCatalanMinimal.h".}
proc IsA*(this: var vtkParametricCatalanMinimal; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkParametricCatalanMinimal.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkParametricCatalanMinimal {.
    importcpp: "vtkParametricCatalanMinimal::SafeDownCast(@)",
    header: "vtkParametricCatalanMinimal.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkParametricCatalanMinimal :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkParametricFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkParametricCatalanMinimal :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkParametricCatalanMinimal :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkParametricCatalanMinimal; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkParametricCatalanMinimal.h".}
proc New*(): ptr vtkParametricCatalanMinimal {.
    importcpp: "vtkParametricCatalanMinimal::New(@)",
    header: "vtkParametricCatalanMinimal.h".}
proc GetDimension*(this: var vtkParametricCatalanMinimal): cint {.
    importcpp: "GetDimension", header: "vtkParametricCatalanMinimal.h".}
proc Evaluate*(this: var vtkParametricCatalanMinimal; uvw: array[3, cdouble];
              Pt: array[3, cdouble]; Duvw: array[9, cdouble]) {.importcpp: "Evaluate",
    header: "vtkParametricCatalanMinimal.h".}
proc EvaluateScalar*(this: var vtkParametricCatalanMinimal; uvw: array[3, cdouble];
                    Pt: array[3, cdouble]; Duvw: array[9, cdouble]): cdouble {.
    importcpp: "EvaluateScalar", header: "vtkParametricCatalanMinimal.h".}