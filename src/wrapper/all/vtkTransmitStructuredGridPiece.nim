## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTransmitStructuredGridPiece.h
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
##  Note that this class is legacy. The superclass does all the work and
##  can be used directly instead.
##

import
  vtkFiltersParallelModule, vtkTransmitStructuredDataPiece

discard "forward decl of vtkMultiProcessController"
type
  vtkTransmitStructuredGridPiece* {.importcpp: "vtkTransmitStructuredGridPiece",
                                   header: "vtkTransmitStructuredGridPiece.h",
                                   bycopy.} = object of vtkTransmitStructuredDataPiece
    vtkTransmitStructuredGridPiece* {.importc: "vtkTransmitStructuredGridPiece".}: VTK_NEWINSTANCE


proc New*(): ptr vtkTransmitStructuredGridPiece {.
    importcpp: "vtkTransmitStructuredGridPiece::New(@)",
    header: "vtkTransmitStructuredGridPiece.h".}
type
  vtkTransmitStructuredGridPieceSuperclass* = vtkTransmitStructuredDataPiece

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTransmitStructuredGridPiece::IsTypeOf(@)",
    header: "vtkTransmitStructuredGridPiece.h".}
proc IsA*(this: var vtkTransmitStructuredGridPiece; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTransmitStructuredGridPiece.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTransmitStructuredGridPiece {.
    importcpp: "vtkTransmitStructuredGridPiece::SafeDownCast(@)",
    header: "vtkTransmitStructuredGridPiece.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTransmitStructuredGridPiece :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTransmitStructuredDataPiece :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTransmitStructuredGridPiece :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTransmitStructuredGridPiece :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTransmitStructuredGridPiece; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkTransmitStructuredGridPiece.h".}