## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkParametricBoy.h
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
##  @class   vtkParametricBoy
##  @brief   Generate Boy's surface.
##
##  vtkParametricBoy generates Boy's surface.
##  This is a Model of the projective plane without singularities.
##  It was found by Werner Boy on assignment from David Hilbert.
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
  vtkParametricBoy* {.importcpp: "vtkParametricBoy", header: "vtkParametricBoy.h",
                     bycopy.} = object of vtkParametricFunction
    vtkParametricBoy* {.importc: "vtkParametricBoy".}: VTK_NEWINSTANCE

  vtkParametricBoySuperclass* = vtkParametricFunction

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkParametricBoy::IsTypeOf(@)", header: "vtkParametricBoy.h".}
proc IsA*(this: var vtkParametricBoy; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkParametricBoy.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkParametricBoy {.
    importcpp: "vtkParametricBoy::SafeDownCast(@)", header: "vtkParametricBoy.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkParametricBoy :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkParametricFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkParametricBoy :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkParametricBoy :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkParametricBoy; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkParametricBoy.h".}
proc New*(): ptr vtkParametricBoy {.importcpp: "vtkParametricBoy::New(@)",
                                header: "vtkParametricBoy.h".}
proc GetDimension*(this: var vtkParametricBoy): cint {.importcpp: "GetDimension",
    header: "vtkParametricBoy.h".}
proc SetZScale*(this: var vtkParametricBoy; _arg: cdouble) {.importcpp: "SetZScale",
    header: "vtkParametricBoy.h".}
## !!!Ignored construct:  virtual double GetZScale ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ZScale  of  << this -> ZScale ) ; return this -> ZScale ; } ;
## Error: expected ';'!!!

proc Evaluate*(this: var vtkParametricBoy; uvw: array[3, cdouble];
              Pt: array[3, cdouble]; Duvw: array[9, cdouble]) {.importcpp: "Evaluate",
    header: "vtkParametricBoy.h".}
proc EvaluateScalar*(this: var vtkParametricBoy; uvw: array[3, cdouble];
                    Pt: array[3, cdouble]; Duvw: array[9, cdouble]): cdouble {.
    importcpp: "EvaluateScalar", header: "vtkParametricBoy.h".}