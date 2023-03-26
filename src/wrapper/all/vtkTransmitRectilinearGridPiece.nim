## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTransmitRectilinearGridPiece.h
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
  vtkTransmitRectilinearGridPiece* {.importcpp: "vtkTransmitRectilinearGridPiece", header: "vtkTransmitRectilinearGridPiece.h",
                                    bycopy.} = object of vtkTransmitStructuredDataPiece
    vtkTransmitRectilinearGridPiece* {.importc: "vtkTransmitRectilinearGridPiece".}: VTK_NEWINSTANCE


proc New*(): ptr vtkTransmitRectilinearGridPiece {.
    importcpp: "vtkTransmitRectilinearGridPiece::New(@)",
    header: "vtkTransmitRectilinearGridPiece.h".}
type
  vtkTransmitRectilinearGridPieceSuperclass* = vtkTransmitStructuredDataPiece

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTransmitRectilinearGridPiece::IsTypeOf(@)",
    header: "vtkTransmitRectilinearGridPiece.h".}
proc IsA*(this: var vtkTransmitRectilinearGridPiece; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTransmitRectilinearGridPiece.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTransmitRectilinearGridPiece {.
    importcpp: "vtkTransmitRectilinearGridPiece::SafeDownCast(@)",
    header: "vtkTransmitRectilinearGridPiece.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTransmitRectilinearGridPiece :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTransmitStructuredDataPiece :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTransmitRectilinearGridPiece :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTransmitRectilinearGridPiece :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTransmitRectilinearGridPiece; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkTransmitRectilinearGridPiece.h".}