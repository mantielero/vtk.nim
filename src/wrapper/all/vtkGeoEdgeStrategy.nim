## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGeoEdgeStrategy.h
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
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkGeoEdgeStrategy
##  @brief   Layout graph edges on a globe as arcs.
##
##
##  vtkGeoEdgeStrategy produces arcs for each edge in the input graph.
##  This is useful for viewing lines on a sphere (e.g. the earth).
##  The arcs may "jump" above the sphere's surface using ExplodeFactor.
##

import
  vtkEdgeLayoutStrategy, vtkInfovisLayoutModule

type
  vtkGeoEdgeStrategy* {.importcpp: "vtkGeoEdgeStrategy",
                       header: "vtkGeoEdgeStrategy.h", bycopy.} = object of vtkEdgeLayoutStrategy
    vtkGeoEdgeStrategy* {.importc: "vtkGeoEdgeStrategy".}: VTK_NEWINSTANCE


proc New*(): ptr vtkGeoEdgeStrategy {.importcpp: "vtkGeoEdgeStrategy::New(@)",
                                  header: "vtkGeoEdgeStrategy.h".}
type
  vtkGeoEdgeStrategySuperclass* = vtkEdgeLayoutStrategy

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGeoEdgeStrategy::IsTypeOf(@)", header: "vtkGeoEdgeStrategy.h".}
proc IsA*(this: var vtkGeoEdgeStrategy; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkGeoEdgeStrategy.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGeoEdgeStrategy {.
    importcpp: "vtkGeoEdgeStrategy::SafeDownCast(@)",
    header: "vtkGeoEdgeStrategy.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGeoEdgeStrategy :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkEdgeLayoutStrategy :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGeoEdgeStrategy :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGeoEdgeStrategy :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGeoEdgeStrategy; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGeoEdgeStrategy.h".}
proc SetGlobeRadius*(this: var vtkGeoEdgeStrategy; _arg: cdouble) {.
    importcpp: "SetGlobeRadius", header: "vtkGeoEdgeStrategy.h".}
## !!!Ignored construct:  virtual double GetGlobeRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GlobeRadius  of  << this -> GlobeRadius ) ; return this -> GlobeRadius ; } ;
## Error: expected ';'!!!

proc SetGlobeRadiusExplodeFactor*(this: var vtkGeoEdgeStrategy; _arg: cdouble) {.
    importcpp: "SetGlobeRadiusExplodeFactor", header: "vtkGeoEdgeStrategy.h".}
## !!!Ignored construct:  virtual double GetGlobeRadiusExplodeFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ExplodeFactor  of  << this -> ExplodeFactor ) ; return this -> ExplodeFactor ; } ;
## Error: expected ';'!!!

proc SetGlobeRadiusExplodeFactorNumberOfSubdivisions*(
    this: var vtkGeoEdgeStrategy; _arg: cint) {.
    importcpp: "SetGlobeRadiusExplodeFactorNumberOfSubdivisions",
    header: "vtkGeoEdgeStrategy.h".}
## !!!Ignored construct:  virtual int GetGlobeRadiusExplodeFactorNumberOfSubdivisions ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfSubdivisions  of  << this -> NumberOfSubdivisions ) ; return this -> NumberOfSubdivisions ; } ;
## Error: expected ';'!!!

proc Layout*(this: var vtkGeoEdgeStrategy) {.importcpp: "Layout",
    header: "vtkGeoEdgeStrategy.h".}