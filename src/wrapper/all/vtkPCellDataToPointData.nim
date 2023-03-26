## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPCellDataToPointData.h
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
##  @class   vtkPCellDataToPointData
##  @brief   Compute point arrays from cell arrays.
##
##  Like it super class, this filter averages the cell data around
##  a point to get new point data.  This subclass requests a layer of
##  ghost cells to make the results invariant to pieces.  There is a
##  "PieceInvariant" flag that lets the user change the behavior
##  of the filter to that of its superclass.
##

import
  vtkCellDataToPointData, vtkFiltersParallelModule

type
  vtkPCellDataToPointData* {.importcpp: "vtkPCellDataToPointData",
                            header: "vtkPCellDataToPointData.h", bycopy.} = object of vtkCellDataToPointData
    vtkPCellDataToPointData* {.importc: "vtkPCellDataToPointData".}: VTK_NEWINSTANCE

  vtkPCellDataToPointDataSuperclass* = vtkCellDataToPointData

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPCellDataToPointData::IsTypeOf(@)",
    header: "vtkPCellDataToPointData.h".}
proc IsA*(this: var vtkPCellDataToPointData; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPCellDataToPointData.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPCellDataToPointData {.
    importcpp: "vtkPCellDataToPointData::SafeDownCast(@)",
    header: "vtkPCellDataToPointData.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPCellDataToPointData :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCellDataToPointData :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPCellDataToPointData :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPCellDataToPointData :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPCellDataToPointData; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPCellDataToPointData.h".}
proc New*(): ptr vtkPCellDataToPointData {.importcpp: "vtkPCellDataToPointData::New(@)",
                                       header: "vtkPCellDataToPointData.h".}
proc SetPieceInvariant*(this: var vtkPCellDataToPointData; _arg: vtkTypeBool) {.
    importcpp: "SetPieceInvariant", header: "vtkPCellDataToPointData.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetPieceInvariant ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PieceInvariant  of  << this -> PieceInvariant ) ; return this -> PieceInvariant ; } ;
## Error: expected ';'!!!

proc PieceInvariantOn*(this: var vtkPCellDataToPointData) {.
    importcpp: "PieceInvariantOn", header: "vtkPCellDataToPointData.h".}
proc PieceInvariantOff*(this: var vtkPCellDataToPointData) {.
    importcpp: "PieceInvariantOff", header: "vtkPCellDataToPointData.h".}
  ## /@}