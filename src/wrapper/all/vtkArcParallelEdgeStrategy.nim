## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkArcParallelEdgeStrategy.h
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
## ----------------------------------------------------------------------------
##  Copyright (c) Sandia Corporation
##  See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
## ----------------------------------------------------------------------------
## *
##  @class   vtkArcParallelEdgeStrategy
##  @brief   routes parallel edges as arcs
##
##
##  Parallel edges are drawn as arcs, and self-loops are drawn as ovals.
##  When only one edge connects two vertices it is drawn as a straight line.
##

import
  vtkEdgeLayoutStrategy, vtkInfovisLayoutModule

discard "forward decl of vtkGraph"
type
  vtkArcParallelEdgeStrategy* {.importcpp: "vtkArcParallelEdgeStrategy",
                               header: "vtkArcParallelEdgeStrategy.h", bycopy.} = object of vtkEdgeLayoutStrategy
    vtkArcParallelEdgeStrategy* {.importc: "vtkArcParallelEdgeStrategy".}: VTK_NEWINSTANCE


proc New*(): ptr vtkArcParallelEdgeStrategy {.
    importcpp: "vtkArcParallelEdgeStrategy::New(@)",
    header: "vtkArcParallelEdgeStrategy.h".}
type
  vtkArcParallelEdgeStrategySuperclass* = vtkEdgeLayoutStrategy

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkArcParallelEdgeStrategy::IsTypeOf(@)",
    header: "vtkArcParallelEdgeStrategy.h".}
proc IsA*(this: var vtkArcParallelEdgeStrategy; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkArcParallelEdgeStrategy.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkArcParallelEdgeStrategy {.
    importcpp: "vtkArcParallelEdgeStrategy::SafeDownCast(@)",
    header: "vtkArcParallelEdgeStrategy.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkArcParallelEdgeStrategy :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkEdgeLayoutStrategy :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkArcParallelEdgeStrategy :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkArcParallelEdgeStrategy :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkArcParallelEdgeStrategy; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkArcParallelEdgeStrategy.h".}
proc Layout*(this: var vtkArcParallelEdgeStrategy) {.importcpp: "Layout",
    header: "vtkArcParallelEdgeStrategy.h".}
## !!!Ignored construct:  /@{ *
##  Get/Set the number of subdivisions on each edge.
##  virtual int GetNumberOfSubdivisionsNumberOfSubdivisions ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfSubdivisions  of  << this -> NumberOfSubdivisions ) ; return this -> NumberOfSubdivisions ; } ;
## Error: expected ';'!!!

proc SetNumberOfSubdivisions*(this: var vtkArcParallelEdgeStrategy; _arg: cint) {.
    importcpp: "SetNumberOfSubdivisions", header: "vtkArcParallelEdgeStrategy.h".}
  ## /@}