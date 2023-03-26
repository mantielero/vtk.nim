## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAdjacencyMatrixToEdgeTable.h
##
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
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
##  @class   vtkAdjacencyMatrixToEdgeTable
##
##
##  Treats a dense 2-way array of doubles as an adacency matrix and converts it into a
##  vtkTable suitable for use as an edge table with vtkTableToGraph.
##
##  @par Thanks:
##  Developed by Timothy M. Shead (tshead@sandia.gov) at Sandia National Laboratories.
##

import
  vtkInfovisCoreModule, vtkTableAlgorithm

type
  vtkAdjacencyMatrixToEdgeTable* {.importcpp: "vtkAdjacencyMatrixToEdgeTable",
                                  header: "vtkAdjacencyMatrixToEdgeTable.h",
                                  bycopy.} = object of vtkTableAlgorithm
    vtkAdjacencyMatrixToEdgeTable* {.importc: "vtkAdjacencyMatrixToEdgeTable".}: VTK_NEWINSTANCE


proc New*(): ptr vtkAdjacencyMatrixToEdgeTable {.
    importcpp: "vtkAdjacencyMatrixToEdgeTable::New(@)",
    header: "vtkAdjacencyMatrixToEdgeTable.h".}
type
  vtkAdjacencyMatrixToEdgeTableSuperclass* = vtkTableAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAdjacencyMatrixToEdgeTable::IsTypeOf(@)",
    header: "vtkAdjacencyMatrixToEdgeTable.h".}
proc IsA*(this: var vtkAdjacencyMatrixToEdgeTable; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkAdjacencyMatrixToEdgeTable.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAdjacencyMatrixToEdgeTable {.
    importcpp: "vtkAdjacencyMatrixToEdgeTable::SafeDownCast(@)",
    header: "vtkAdjacencyMatrixToEdgeTable.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAdjacencyMatrixToEdgeTable :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTableAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAdjacencyMatrixToEdgeTable :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAdjacencyMatrixToEdgeTable :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAdjacencyMatrixToEdgeTable; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkAdjacencyMatrixToEdgeTable.h".}
## !!!Ignored construct:  /@{ *
##  Specifies whether rows or columns become the "source" in the output edge table.
##  0 = rows, 1 = columns.  Default: 0
##  virtual vtkIdType GetSourceDimensionSourceDimension ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SourceDimension  of  << this -> SourceDimension ) ; return this -> SourceDimension ; } ;
## Error: expected ';'!!!

proc SetSourceDimension*(this: var vtkAdjacencyMatrixToEdgeTable; _arg: vtkIdType) {.
    importcpp: "SetSourceDimension", header: "vtkAdjacencyMatrixToEdgeTable.h".}
  ## /@}
  ## /@{
  ## *
  ##  Controls the name of the output table column that contains edge weights.
  ##  Default: "value"
  ##
proc GetValueArrayName*(this: var vtkAdjacencyMatrixToEdgeTable): cstring {.
    importcpp: "GetValueArrayName", header: "vtkAdjacencyMatrixToEdgeTable.h".}
proc SetValueArrayName*(this: var vtkAdjacencyMatrixToEdgeTable; _arg: cstring) {.
    importcpp: "SetValueArrayName", header: "vtkAdjacencyMatrixToEdgeTable.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specifies the minimum number of adjacent edges to include for each source vertex.
  ##  Default: 0
  ##
## !!!Ignored construct:  virtual vtkIdType GetSourceDimensionSourceDimensionMinimumCount ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinimumCount  of  << this -> MinimumCount ) ; return this -> MinimumCount ; } ;
## Error: expected ';'!!!

proc SetSourceDimensionMinimumCount*(this: var vtkAdjacencyMatrixToEdgeTable;
                                    _arg: vtkIdType) {.
    importcpp: "SetSourceDimensionMinimumCount",
    header: "vtkAdjacencyMatrixToEdgeTable.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specifies a minimum threshold that an edge weight must exceed to be included in
  ##  the output.
  ##  Default: 0.5
  ##
## !!!Ignored construct:  virtual double GetSourceDimensionSourceDimensionMinimumCountMinimumThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinimumThreshold  of  << this -> MinimumThreshold ) ; return this -> MinimumThreshold ; } ;
## Error: expected ';'!!!

proc SetSourceDimensionMinimumCountMinimumThreshold*(
    this: var vtkAdjacencyMatrixToEdgeTable; _arg: cdouble) {.
    importcpp: "SetSourceDimensionMinimumCountMinimumThreshold",
    header: "vtkAdjacencyMatrixToEdgeTable.h".}
  ## /@}