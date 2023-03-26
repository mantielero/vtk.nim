## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAreaLayoutStrategy.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##   This software is distributed WITHOUT ANY WARRANTY; without even
##   the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##   PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkAreaLayoutStrategy
##  @brief   abstract superclass for all area layout strategies
##
##
##  All subclasses of this class perform a area layout on a tree.
##  This involves assigning a region to each vertex in the tree,
##  and placing that information in a data array with four components per
##  tuple representing (innerRadius, outerRadius, startAngle, endAngle).
##
##  Instances of subclasses of this class may be assigned as the layout
##  strategy to vtkAreaLayout
##
##  @par Thanks:
##  Thanks to Jason Shepherd from Sandia National Laboratories
##  for help developing this class.
##

import
  vtkInfovisLayoutModule, vtkObject

discard "forward decl of vtkTree"
discard "forward decl of vtkDataArray"
type
  vtkAreaLayoutStrategy* {.importcpp: "vtkAreaLayoutStrategy",
                          header: "vtkAreaLayoutStrategy.h", bycopy.} = object of vtkObject
    vtkAreaLayoutStrategy* {.importc: "vtkAreaLayoutStrategy".}: VTK_NEWINSTANCE

  vtkAreaLayoutStrategySuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAreaLayoutStrategy::IsTypeOf(@)",
    header: "vtkAreaLayoutStrategy.h".}
proc IsA*(this: var vtkAreaLayoutStrategy; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkAreaLayoutStrategy.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAreaLayoutStrategy {.
    importcpp: "vtkAreaLayoutStrategy::SafeDownCast(@)",
    header: "vtkAreaLayoutStrategy.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAreaLayoutStrategy :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAreaLayoutStrategy :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAreaLayoutStrategy :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAreaLayoutStrategy; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkAreaLayoutStrategy.h".}
proc Layout*(this: var vtkAreaLayoutStrategy; inputTree: ptr vtkTree;
            areaArray: ptr vtkDataArray; sizeArray: ptr vtkDataArray) {.
    importcpp: "Layout", header: "vtkAreaLayoutStrategy.h".}
proc LayoutEdgePoints*(this: var vtkAreaLayoutStrategy; inputTree: ptr vtkTree;
                      areaArray: ptr vtkDataArray; sizeArray: ptr vtkDataArray;
                      edgeRoutingTree: ptr vtkTree) {.
    importcpp: "LayoutEdgePoints", header: "vtkAreaLayoutStrategy.h".}
proc FindVertex*(this: var vtkAreaLayoutStrategy; tree: ptr vtkTree;
                array: ptr vtkDataArray; pnt: array[2, cfloat]): vtkIdType {.
    importcpp: "FindVertex", header: "vtkAreaLayoutStrategy.h".}
proc SetShrinkPercentage*(this: var vtkAreaLayoutStrategy; _arg: cdouble) {.
    importcpp: "SetShrinkPercentage", header: "vtkAreaLayoutStrategy.h".}
proc GetShrinkPercentageMinValue*(this: var vtkAreaLayoutStrategy): cdouble {.
    importcpp: "GetShrinkPercentageMinValue", header: "vtkAreaLayoutStrategy.h".}
proc GetShrinkPercentageMaxValue*(this: var vtkAreaLayoutStrategy): cdouble {.
    importcpp: "GetShrinkPercentageMaxValue", header: "vtkAreaLayoutStrategy.h".}
## !!!Ignored construct:  virtual double GetShrinkPercentage ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ShrinkPercentage  of  << this -> ShrinkPercentage ) ; return this -> ShrinkPercentage ; } ;
## Error: expected ';'!!!
