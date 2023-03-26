## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtractSelectedRows.h
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
##  @class   vtkExtractSelectedRows
##  @brief   return selected rows of a table
##
##
##  The first input is a vtkTable to extract rows from.
##  The second input is a vtkSelection containing the selected indices.
##  The third input is a vtkAnnotationLayers containing selected indices.
##  The field type of the input selection is ignored when converted to row
##  indices.
##

import
  vtkFiltersExtractionModule, vtkTableAlgorithm

type
  vtkExtractSelectedRows* {.importcpp: "vtkExtractSelectedRows",
                           header: "vtkExtractSelectedRows.h", bycopy.} = object of vtkTableAlgorithm
    vtkExtractSelectedRows* {.importc: "vtkExtractSelectedRows".}: VTK_NEWINSTANCE


proc New*(): ptr vtkExtractSelectedRows {.importcpp: "vtkExtractSelectedRows::New(@)",
                                      header: "vtkExtractSelectedRows.h".}
type
  vtkExtractSelectedRowsSuperclass* = vtkTableAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkExtractSelectedRows::IsTypeOf(@)",
    header: "vtkExtractSelectedRows.h".}
proc IsA*(this: var vtkExtractSelectedRows; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkExtractSelectedRows.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkExtractSelectedRows {.
    importcpp: "vtkExtractSelectedRows::SafeDownCast(@)",
    header: "vtkExtractSelectedRows.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkExtractSelectedRows :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTableAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtractSelectedRows :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtractSelectedRows :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkExtractSelectedRows; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkExtractSelectedRows.h".}
proc SetSelectionConnection*(this: var vtkExtractSelectedRows;
                            `in`: ptr vtkAlgorithmOutput) {.
    importcpp: "SetSelectionConnection", header: "vtkExtractSelectedRows.h".}
proc SetAnnotationLayersConnection*(this: var vtkExtractSelectedRows;
                                   `in`: ptr vtkAlgorithmOutput) {.
    importcpp: "SetAnnotationLayersConnection", header: "vtkExtractSelectedRows.h".}
proc FillInputPortInformation*(this: var vtkExtractSelectedRows; port: cint;
                              info: ptr vtkInformation): cint {.
    importcpp: "FillInputPortInformation", header: "vtkExtractSelectedRows.h".}
proc SetAddOriginalRowIdsArray*(this: var vtkExtractSelectedRows; _arg: bool) {.
    importcpp: "SetAddOriginalRowIdsArray", header: "vtkExtractSelectedRows.h".}
## !!!Ignored construct:  virtual bool GetAddOriginalRowIdsArray ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AddOriginalRowIdsArray  of  << this -> AddOriginalRowIdsArray ) ; return this -> AddOriginalRowIdsArray ; } ;
## Error: expected ';'!!!

proc AddOriginalRowIdsArrayOn*(this: var vtkExtractSelectedRows) {.
    importcpp: "AddOriginalRowIdsArrayOn", header: "vtkExtractSelectedRows.h".}
proc AddOriginalRowIdsArrayOff*(this: var vtkExtractSelectedRows) {.
    importcpp: "AddOriginalRowIdsArrayOff", header: "vtkExtractSelectedRows.h".}
  ## /@}