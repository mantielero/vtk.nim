## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTubeBender.h
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
##  @class vtkTubeBender
##  @brief Rounds corners on lines for better tubes
##
##  vtkTubeBender is designed to generate better tube paths for vtkTubeFilter.
##
##  For points with very sharp inflection point angles, the radius used to determine
##  where surface points are placed becomes more parallel, instead of perpendicular,
##  to the tube path. This causes the tube to become more oblong, as the
##  cross-sectional height and width become increasingly disparate.
##
##  This filter inserts new points along the tube path near acute angles to reduce
##  the amount the point normals will change from point to point. This reduces the
##  cross-sectional height and width variations from over 95% to less than 30%.
##  This gives an impression of a constant diameter tube with nice acute angle bends
##  without adding too many new points (and therefore faces).
##
##
##  @warning
##  Any vtkTubeFilters which use the output of this filter should set UseDefaultNormalOff.
##
##  If the path has a relatively large radius and several acute angles in sequence,
##  the default normal generation can cause tube segments to have a torsional rotation,
##  along the tube's length which renders as an hourglass instead of a tube. Using
##  alternate normals correctly renders these hourglass segments as tubes. This problem
##  may only appear as the radius increases for a given path.
##
##  @sa
##  vtkTubeFilter
##

import
  vtkFiltersCoreModule, vtkPolyDataAlgorithm

type
  vtkTubeBender* {.importcpp: "vtkTubeBender", header: "vtkTubeBender.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkTubeBender* {.importc: "vtkTubeBender".}: VTK_NEWINSTANCE


proc New*(): ptr vtkTubeBender {.importcpp: "vtkTubeBender::New(@)",
                             header: "vtkTubeBender.h".}
type
  vtkTubeBenderSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTubeBender::IsTypeOf(@)", header: "vtkTubeBender.h".}
proc IsA*(this: var vtkTubeBender; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkTubeBender.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTubeBender {.
    importcpp: "vtkTubeBender::SafeDownCast(@)", header: "vtkTubeBender.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTubeBender :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTubeBender :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTubeBender :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTubeBender; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTubeBender.h".}
proc SetRadius*(this: var vtkTubeBender; _arg: cdouble) {.importcpp: "SetRadius",
    header: "vtkTubeBender.h".}
proc GetRadiusMinValue*(this: var vtkTubeBender): cdouble {.
    importcpp: "GetRadiusMinValue", header: "vtkTubeBender.h".}
proc GetRadiusMaxValue*(this: var vtkTubeBender): cdouble {.
    importcpp: "GetRadiusMaxValue", header: "vtkTubeBender.h".}
## !!!Ignored construct:  virtual double GetRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Radius  of  << this -> Radius ) ; return this -> Radius ; } ;
## Error: expected ';'!!!
