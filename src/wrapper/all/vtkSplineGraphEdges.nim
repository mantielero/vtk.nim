## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSplineGraphEdges.h
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
##  @class   vtkSplineGraphEdges
##  @brief   subsample graph edges to make smooth curves
##
##
##  vtkSplineGraphEdges uses a vtkSpline to make edges into nicely sampled
##  splines. By default, the filter will use an optimized b-spline.
##  Otherwise, it will use a custom vtkSpline instance set by the user.
##

import
  vtkGraphAlgorithm, vtkInfovisLayoutModule, vtkSmartPointer

discard "forward decl of vtkSpline"
type
  vtkSplineGraphEdges* {.importcpp: "vtkSplineGraphEdges",
                        header: "vtkSplineGraphEdges.h", bycopy.} = object of vtkGraphAlgorithm
    vtkSplineGraphEdges* {.importc: "vtkSplineGraphEdges".}: VTK_NEWINSTANCE


proc New*(): ptr vtkSplineGraphEdges {.importcpp: "vtkSplineGraphEdges::New(@)",
                                   header: "vtkSplineGraphEdges.h".}
type
  vtkSplineGraphEdgesSuperclass* = vtkGraphAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSplineGraphEdges::IsTypeOf(@)", header: "vtkSplineGraphEdges.h".}
proc IsA*(this: var vtkSplineGraphEdges; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkSplineGraphEdges.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSplineGraphEdges {.
    importcpp: "vtkSplineGraphEdges::SafeDownCast(@)",
    header: "vtkSplineGraphEdges.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSplineGraphEdges :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGraphAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSplineGraphEdges :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSplineGraphEdges :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSplineGraphEdges; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSplineGraphEdges.h".}
proc SetSpline*(this: var vtkSplineGraphEdges; s: ptr vtkSpline) {.
    importcpp: "SetSpline", header: "vtkSplineGraphEdges.h".}
proc GetnameSpline*(this: var vtkSplineGraphEdges): ptr vtkSpline {.
    importcpp: "GetnameSpline", header: "vtkSplineGraphEdges.h".}
  ## /@}
const
  vtkSplineGraphEdgesBSPLINE* = 0
  vtkSplineGraphEdgesCUSTOM* = 1

proc SetSplineType*(this: var vtkSplineGraphEdges; _arg: cint) {.
    importcpp: "SetSplineType", header: "vtkSplineGraphEdges.h".}
## !!!Ignored construct:  virtual int GetSplineType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SplineType  of  << this -> SplineType ) ; return this -> SplineType ; } ;
## Error: expected ';'!!!

proc SetSplineTypeNumberOfSubdivisions*(this: var vtkSplineGraphEdges;
                                       _arg: vtkIdType) {.
    importcpp: "SetSplineTypeNumberOfSubdivisions",
    header: "vtkSplineGraphEdges.h".}
## !!!Ignored construct:  virtual vtkIdType GetSplineTypeNumberOfSubdivisions ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfSubdivisions  of  << this -> NumberOfSubdivisions ) ; return this -> NumberOfSubdivisions ; } ;
## Error: expected ';'!!!
