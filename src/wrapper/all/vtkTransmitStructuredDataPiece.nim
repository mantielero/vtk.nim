## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTransmitStructuredDataPiece.h
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
  vtkDataSetAlgorithm, vtkFiltersParallelModule

discard "forward decl of vtkMultiProcessController"
type
  vtkTransmitStructuredDataPiece* {.importcpp: "vtkTransmitStructuredDataPiece",
                                   header: "vtkTransmitStructuredDataPiece.h",
                                   bycopy.} = object of vtkDataSetAlgorithm
    vtkTransmitStructuredDataPiece* {.importc: "vtkTransmitStructuredDataPiece".}: VTK_NEWINSTANCE


proc New*(): ptr vtkTransmitStructuredDataPiece {.
    importcpp: "vtkTransmitStructuredDataPiece::New(@)",
    header: "vtkTransmitStructuredDataPiece.h".}
type
  vtkTransmitStructuredDataPieceSuperclass* = vtkDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTransmitStructuredDataPiece::IsTypeOf(@)",
    header: "vtkTransmitStructuredDataPiece.h".}
proc IsA*(this: var vtkTransmitStructuredDataPiece; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTransmitStructuredDataPiece.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTransmitStructuredDataPiece {.
    importcpp: "vtkTransmitStructuredDataPiece::SafeDownCast(@)",
    header: "vtkTransmitStructuredDataPiece.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTransmitStructuredDataPiece :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTransmitStructuredDataPiece :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTransmitStructuredDataPiece :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTransmitStructuredDataPiece; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkTransmitStructuredDataPiece.h".}
proc SetController*(this: var vtkTransmitStructuredDataPiece;
                   a2: ptr vtkMultiProcessController) {.importcpp: "SetController",
    header: "vtkTransmitStructuredDataPiece.h".}
proc GetnameController*(this: var vtkTransmitStructuredDataPiece): ptr vtkMultiProcessController {.
    importcpp: "GetnameController", header: "vtkTransmitStructuredDataPiece.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off creating ghost cells (on by default).
  ##
proc SetCreateGhostCells*(this: var vtkTransmitStructuredDataPiece;
                         _arg: vtkTypeBool) {.importcpp: "SetCreateGhostCells",
    header: "vtkTransmitStructuredDataPiece.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetCreateGhostCells ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CreateGhostCells  of  << this -> CreateGhostCells ) ; return this -> CreateGhostCells ; } ;
## Error: expected ';'!!!

proc CreateGhostCellsOn*(this: var vtkTransmitStructuredDataPiece) {.
    importcpp: "CreateGhostCellsOn", header: "vtkTransmitStructuredDataPiece.h".}
proc CreateGhostCellsOff*(this: var vtkTransmitStructuredDataPiece) {.
    importcpp: "CreateGhostCellsOff", header: "vtkTransmitStructuredDataPiece.h".}
  ## /@}