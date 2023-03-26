## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTransmitUnstructuredGridPiece.h
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
##  @class   vtkTransmitRectilinearGridPiece
##  @brief   Redistributes data produced
##  by serial readers
##
##
##  This filter can be used to redistribute data from producers that can't
##  produce data in parallel. All data is produced on first process and
##  the distributed to others using the multiprocess controller.
##

import
  vtkFiltersParallelModule, vtkUnstructuredGridAlgorithm

discard "forward decl of vtkMultiProcessController"
type
  vtkTransmitUnstructuredGridPiece* {.importcpp: "vtkTransmitUnstructuredGridPiece", header: "vtkTransmitUnstructuredGridPiece.h",
                                     bycopy.} = object of vtkUnstructuredGridAlgorithm
    vtkTransmitUnstructuredGridPiece* {.importc: "vtkTransmitUnstructuredGridPiece".}: VTK_NEWINSTANCE


proc New*(): ptr vtkTransmitUnstructuredGridPiece {.
    importcpp: "vtkTransmitUnstructuredGridPiece::New(@)",
    header: "vtkTransmitUnstructuredGridPiece.h".}
type
  vtkTransmitUnstructuredGridPieceSuperclass* = vtkUnstructuredGridAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTransmitUnstructuredGridPiece::IsTypeOf(@)",
    header: "vtkTransmitUnstructuredGridPiece.h".}
proc IsA*(this: var vtkTransmitUnstructuredGridPiece; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTransmitUnstructuredGridPiece.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTransmitUnstructuredGridPiece {.
    importcpp: "vtkTransmitUnstructuredGridPiece::SafeDownCast(@)",
    header: "vtkTransmitUnstructuredGridPiece.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTransmitUnstructuredGridPiece :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTransmitUnstructuredGridPiece :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTransmitUnstructuredGridPiece :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTransmitUnstructuredGridPiece; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkTransmitUnstructuredGridPiece.h".}
proc SetController*(this: var vtkTransmitUnstructuredGridPiece;
                   a2: ptr vtkMultiProcessController) {.importcpp: "SetController",
    header: "vtkTransmitUnstructuredGridPiece.h".}
proc GetnameController*(this: var vtkTransmitUnstructuredGridPiece): ptr vtkMultiProcessController {.
    importcpp: "GetnameController", header: "vtkTransmitUnstructuredGridPiece.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off creating ghost cells (on by default).
  ##
proc SetCreateGhostCells*(this: var vtkTransmitUnstructuredGridPiece;
                         _arg: vtkTypeBool) {.importcpp: "SetCreateGhostCells",
    header: "vtkTransmitUnstructuredGridPiece.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetCreateGhostCells ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CreateGhostCells  of  << this -> CreateGhostCells ) ; return this -> CreateGhostCells ; } ;
## Error: expected ';'!!!

proc CreateGhostCellsOn*(this: var vtkTransmitUnstructuredGridPiece) {.
    importcpp: "CreateGhostCellsOn", header: "vtkTransmitUnstructuredGridPiece.h".}
proc CreateGhostCellsOff*(this: var vtkTransmitUnstructuredGridPiece) {.
    importcpp: "CreateGhostCellsOff", header: "vtkTransmitUnstructuredGridPiece.h".}
  ## /@}