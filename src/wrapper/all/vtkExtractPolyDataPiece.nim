## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtractPolyDataPiece.h
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
##  @class   vtkExtractPolyDataPiece
##  @brief   Return specified piece, including specified
##  number of ghost levels.
##

import
  vtkFiltersParallelModule, vtkPolyDataAlgorithm

discard "forward decl of vtkIdList"
discard "forward decl of vtkIntArray"
type
  vtkExtractPolyDataPiece* {.importcpp: "vtkExtractPolyDataPiece",
                            header: "vtkExtractPolyDataPiece.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkExtractPolyDataPiece* {.importc: "vtkExtractPolyDataPiece".}: VTK_NEWINSTANCE


proc New*(): ptr vtkExtractPolyDataPiece {.importcpp: "vtkExtractPolyDataPiece::New(@)",
                                       header: "vtkExtractPolyDataPiece.h".}
type
  vtkExtractPolyDataPieceSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkExtractPolyDataPiece::IsTypeOf(@)",
    header: "vtkExtractPolyDataPiece.h".}
proc IsA*(this: var vtkExtractPolyDataPiece; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkExtractPolyDataPiece.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkExtractPolyDataPiece {.
    importcpp: "vtkExtractPolyDataPiece::SafeDownCast(@)",
    header: "vtkExtractPolyDataPiece.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkExtractPolyDataPiece :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtractPolyDataPiece :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtractPolyDataPiece :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkExtractPolyDataPiece; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkExtractPolyDataPiece.h".}
proc SetCreateGhostCells*(this: var vtkExtractPolyDataPiece; _arg: vtkTypeBool) {.
    importcpp: "SetCreateGhostCells", header: "vtkExtractPolyDataPiece.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetCreateGhostCells ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CreateGhostCells  of  << this -> CreateGhostCells ) ; return this -> CreateGhostCells ; } ;
## Error: expected ';'!!!

proc CreateGhostCellsOn*(this: var vtkExtractPolyDataPiece) {.
    importcpp: "CreateGhostCellsOn", header: "vtkExtractPolyDataPiece.h".}
proc CreateGhostCellsOff*(this: var vtkExtractPolyDataPiece) {.
    importcpp: "CreateGhostCellsOff", header: "vtkExtractPolyDataPiece.h".}
  ## /@}