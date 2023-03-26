## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtractPiece.h
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
##  @class   vtkExtractPiece
##
##  vtkExtractPiece returns the appropriate piece of each
##  sub-dataset in the vtkCompositeDataSet.
##  This filter can handle sub-datasets of type vtkImageData, vtkPolyData,
##  vtkRectilinearGrid, vtkStructuredGrid, and vtkUnstructuredGrid; it does
##  not handle sub-grids of type vtkCompositeDataSet.
##

import
  vtkCompositeDataSetAlgorithm, vtkFiltersParallelImagingModule

discard "forward decl of vtkImageData"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkRectilinearGrid"
discard "forward decl of vtkStructuredGrid"
discard "forward decl of vtkUnstructuredGrid"
discard "forward decl of vtkCompositeDataIterator"
type
  vtkExtractPiece* {.importcpp: "vtkExtractPiece", header: "vtkExtractPiece.h",
                    bycopy.} = object of vtkCompositeDataSetAlgorithm
    vtkExtractPiece* {.importc: "vtkExtractPiece".}: VTK_NEWINSTANCE


proc New*(): ptr vtkExtractPiece {.importcpp: "vtkExtractPiece::New(@)",
                               header: "vtkExtractPiece.h".}
type
  vtkExtractPieceSuperclass* = vtkCompositeDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkExtractPiece::IsTypeOf(@)", header: "vtkExtractPiece.h".}
proc IsA*(this: var vtkExtractPiece; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkExtractPiece.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkExtractPiece {.
    importcpp: "vtkExtractPiece::SafeDownCast(@)", header: "vtkExtractPiece.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkExtractPiece :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCompositeDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtractPiece :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtractPiece :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkExtractPiece; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkExtractPiece.h".}