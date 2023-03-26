## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkParametricRoman.h
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
##  @class   vtkParametricRoman
##  @brief   Generate Steiner's Roman Surface.
##
##  vtkParametricRoman generates Steiner's Roman Surface.
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
  vtkParametricRoman* {.importcpp: "vtkParametricRoman",
                       header: "vtkParametricRoman.h", bycopy.} = object of vtkParametricFunction
    vtkParametricRoman* {.importc: "vtkParametricRoman".}: VTK_NEWINSTANCE

  vtkParametricRomanSuperclass* = vtkParametricFunction

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkParametricRoman::IsTypeOf(@)", header: "vtkParametricRoman.h".}
proc IsA*(this: var vtkParametricRoman; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkParametricRoman.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkParametricRoman {.
    importcpp: "vtkParametricRoman::SafeDownCast(@)",
    header: "vtkParametricRoman.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkParametricRoman :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkParametricFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkParametricRoman :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkParametricRoman :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkParametricRoman; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkParametricRoman.h".}
proc GetDimension*(this: var vtkParametricRoman): cint {.importcpp: "GetDimension",
    header: "vtkParametricRoman.h".}
proc New*(): ptr vtkParametricRoman {.importcpp: "vtkParametricRoman::New(@)",
                                  header: "vtkParametricRoman.h".}
proc SetRadius*(this: var vtkParametricRoman; _arg: cdouble) {.importcpp: "SetRadius",
    header: "vtkParametricRoman.h".}
## !!!Ignored construct:  virtual double GetRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Radius  of  << this -> Radius ) ; return this -> Radius ; } ;
## Error: expected ';'!!!

proc Evaluate*(this: var vtkParametricRoman; uvw: array[3, cdouble];
              Pt: array[3, cdouble]; Duvw: array[9, cdouble]) {.importcpp: "Evaluate",
    header: "vtkParametricRoman.h".}
proc EvaluateScalar*(this: var vtkParametricRoman; uvw: array[3, cdouble];
                    Pt: array[3, cdouble]; Duvw: array[9, cdouble]): cdouble {.
    importcpp: "EvaluateScalar", header: "vtkParametricRoman.h".}