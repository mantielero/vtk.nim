## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTreeFieldAggregator.h
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
##  @class   vtkTreeFieldAggregator
##  @brief   aggregate field values from the leaves up the tree
##
##
##  vtkTreeFieldAggregator may be used to assign sizes to all the vertices in the
##  tree, based on the sizes of the leaves.  The size of a vertex will equal
##  the sum of the sizes of the child vertices.  If you have a data array with
##  values for all leaves, you may specify that array, and the values will
##  be filled in for interior tree vertices.  If you do not yet have an array,
##  you may tell the filter to create a new array, assuming that the size
##  of each leaf vertex is 1.  You may optionally set a flag to first take the
##  log of all leaf values before aggregating.
##

discard "forward decl of vtkPoints"
discard "forward decl of vtkTree"
import
  vtkInfovisCoreModule, vtkTreeAlgorithm

type
  vtkTreeFieldAggregator* {.importcpp: "vtkTreeFieldAggregator",
                           header: "vtkTreeFieldAggregator.h", bycopy.} = object of vtkTreeAlgorithm
    vtkTreeFieldAggregator* {.importc: "vtkTreeFieldAggregator".}: VTK_NEWINSTANCE


proc New*(): ptr vtkTreeFieldAggregator {.importcpp: "vtkTreeFieldAggregator::New(@)",
                                      header: "vtkTreeFieldAggregator.h".}
type
  vtkTreeFieldAggregatorSuperclass* = vtkTreeAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTreeFieldAggregator::IsTypeOf(@)",
    header: "vtkTreeFieldAggregator.h".}
proc IsA*(this: var vtkTreeFieldAggregator; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTreeFieldAggregator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTreeFieldAggregator {.
    importcpp: "vtkTreeFieldAggregator::SafeDownCast(@)",
    header: "vtkTreeFieldAggregator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTreeFieldAggregator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTreeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTreeFieldAggregator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTreeFieldAggregator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTreeFieldAggregator; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTreeFieldAggregator.h".}
proc GetField*(this: var vtkTreeFieldAggregator): cstring {.importcpp: "GetField",
    header: "vtkTreeFieldAggregator.h".}
proc SetField*(this: var vtkTreeFieldAggregator; _arg: cstring) {.
    importcpp: "SetField", header: "vtkTreeFieldAggregator.h".}
  ## /@}
  ## /@{
  ## *
  ##  If the value of the vertex is less than MinValue then consider it's value to be minVal.
  ##
## !!!Ignored construct:  virtual double GetMinValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinValue  of  << this -> MinValue ) ; return this -> MinValue ; } ;
## Error: expected ';'!!!

proc SetMinValue*(this: var vtkTreeFieldAggregator; _arg: cdouble) {.
    importcpp: "SetMinValue", header: "vtkTreeFieldAggregator.h".}
  ## /@}
  ## /@{
  ## *
  ##  If set, the algorithm will assume a size of 1 for each leaf vertex.
  ##
proc SetMinValueLeafVertexUnitSize*(this: var vtkTreeFieldAggregator; _arg: bool) {.
    importcpp: "SetMinValueLeafVertexUnitSize", header: "vtkTreeFieldAggregator.h".}
## !!!Ignored construct:  virtual bool GetMinValueLeafVertexUnitSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LeafVertexUnitSize  of  << this -> LeafVertexUnitSize ) ; return this -> LeafVertexUnitSize ; } ;
## Error: expected ';'!!!

proc LeafVertexUnitSizeOn*(this: var vtkTreeFieldAggregator) {.
    importcpp: "LeafVertexUnitSizeOn", header: "vtkTreeFieldAggregator.h".}
proc LeafVertexUnitSizeOff*(this: var vtkTreeFieldAggregator) {.
    importcpp: "LeafVertexUnitSizeOff", header: "vtkTreeFieldAggregator.h".}
  ## /@}
  ## /@{
  ## *
  ##  If set, the leaf values in the tree will be logarithmically scaled (base 10).
  ##
proc SetMinValueLeafVertexUnitSizeLogScale*(this: var vtkTreeFieldAggregator;
    _arg: bool) {.importcpp: "SetMinValueLeafVertexUnitSizeLogScale",
                header: "vtkTreeFieldAggregator.h".}
## !!!Ignored construct:  virtual bool GetMinValueLeafVertexUnitSizeLogScale ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LogScale  of  << this -> LogScale ) ; return this -> LogScale ; } ;
## Error: expected ';'!!!

proc LogScaleOn*(this: var vtkTreeFieldAggregator) {.importcpp: "LogScaleOn",
    header: "vtkTreeFieldAggregator.h".}
proc LogScaleOff*(this: var vtkTreeFieldAggregator) {.importcpp: "LogScaleOff",
    header: "vtkTreeFieldAggregator.h".}
  ## /@}