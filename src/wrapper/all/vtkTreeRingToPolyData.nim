## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTreeRingToPolyData.h
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
##  @class   vtkTreeRingToPolyData
##  @brief   converts a tree to a polygonal data
##  representing radial space filling tree.
##
##
##  This algorithm requires that the vtkTreeRingLayout filter has already
##  been applied to the data in order to create the quadruple array
##  (start angle, end angle, inner radius, outer radius) of bounds
##  for each vertex of the tree.
##

import
  vtkInfovisLayoutModule, vtkPolyDataAlgorithm

type
  vtkTreeRingToPolyData* {.importcpp: "vtkTreeRingToPolyData",
                          header: "vtkTreeRingToPolyData.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkTreeRingToPolyData* {.importc: "vtkTreeRingToPolyData".}: VTK_NEWINSTANCE


proc New*(): ptr vtkTreeRingToPolyData {.importcpp: "vtkTreeRingToPolyData::New(@)",
                                     header: "vtkTreeRingToPolyData.h".}
type
  vtkTreeRingToPolyDataSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTreeRingToPolyData::IsTypeOf(@)",
    header: "vtkTreeRingToPolyData.h".}
proc IsA*(this: var vtkTreeRingToPolyData; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTreeRingToPolyData.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTreeRingToPolyData {.
    importcpp: "vtkTreeRingToPolyData::SafeDownCast(@)",
    header: "vtkTreeRingToPolyData.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTreeRingToPolyData :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTreeRingToPolyData :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTreeRingToPolyData :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTreeRingToPolyData; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTreeRingToPolyData.h".}
proc SetSectorsArrayName*(this: var vtkTreeRingToPolyData; name: cstring) {.
    importcpp: "SetSectorsArrayName", header: "vtkTreeRingToPolyData.h".}
proc SetShrinkPercentage*(this: var vtkTreeRingToPolyData; _arg: cdouble) {.
    importcpp: "SetShrinkPercentage", header: "vtkTreeRingToPolyData.h".}
## !!!Ignored construct:  virtual double GetShrinkPercentage ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ShrinkPercentage  of  << this -> ShrinkPercentage ) ; return this -> ShrinkPercentage ; } ;
## Error: expected ';'!!!

proc FillInputPortInformation*(this: var vtkTreeRingToPolyData; port: cint;
                              info: ptr vtkInformation): cint {.
    importcpp: "FillInputPortInformation", header: "vtkTreeRingToPolyData.h".}