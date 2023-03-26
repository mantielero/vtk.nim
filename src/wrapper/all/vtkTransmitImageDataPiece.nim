## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTransmitImageDataPiece.h
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
  vtkFiltersParallelImagingModule, vtkTransmitStructuredDataPiece

discard "forward decl of vtkMultiProcessController"
type
  vtkTransmitImageDataPiece* {.importcpp: "vtkTransmitImageDataPiece",
                              header: "vtkTransmitImageDataPiece.h", bycopy.} = object of vtkTransmitStructuredDataPiece
    vtkTransmitImageDataPiece* {.importc: "vtkTransmitImageDataPiece".}: VTK_NEWINSTANCE


proc New*(): ptr vtkTransmitImageDataPiece {.
    importcpp: "vtkTransmitImageDataPiece::New(@)",
    header: "vtkTransmitImageDataPiece.h".}
type
  vtkTransmitImageDataPieceSuperclass* = vtkTransmitStructuredDataPiece

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTransmitImageDataPiece::IsTypeOf(@)",
    header: "vtkTransmitImageDataPiece.h".}
proc IsA*(this: var vtkTransmitImageDataPiece; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTransmitImageDataPiece.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTransmitImageDataPiece {.
    importcpp: "vtkTransmitImageDataPiece::SafeDownCast(@)",
    header: "vtkTransmitImageDataPiece.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTransmitImageDataPiece :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTransmitStructuredDataPiece :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTransmitImageDataPiece :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTransmitImageDataPiece :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTransmitImageDataPiece; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTransmitImageDataPiece.h".}