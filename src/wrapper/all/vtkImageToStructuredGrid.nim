## =========================================================================
##
##  Program:   Visualization Toolkit
##  Module:    vtkImageDataToStructuredGridFilter.h
##
##  Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##  All rights reserved.
##  See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##  This software is distributed WITHOUT ANY WARRANTY; without even
##  the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##  PURPOSE.  See the above copyright notice for more information.
##
##  =========================================================================
## *
##  @class   vtkImageToStructuredGrid
##  a structured grid instance.
##
##
##  A concrete instance of vtkStructuredGridAlgorithm which provides
##  functionality for converting instances of vtkImageData to vtkStructuredGrid.
##

import
  vtkCommonExecutionModelModule, vtkStructuredGridAlgorithm

discard "forward decl of vtkStructuredGrid"
discard "forward decl of vtkImageData"
discard "forward decl of vtkInformation"
discard "forward decl of vtkInformationVector"
type
  vtkImageToStructuredGrid* {.importcpp: "vtkImageToStructuredGrid",
                             header: "vtkImageToStructuredGrid.h", bycopy.} = object of vtkStructuredGridAlgorithm
    vtkImageToStructuredGrid* {.importc: "vtkImageToStructuredGrid".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageToStructuredGrid {.importcpp: "vtkImageToStructuredGrid::New(@)",
                                        header: "vtkImageToStructuredGrid.h".}
type
  vtkImageToStructuredGridSuperclass* = vtkStructuredGridAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageToStructuredGrid::IsTypeOf(@)",
    header: "vtkImageToStructuredGrid.h".}
proc IsA*(this: var vtkImageToStructuredGrid; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageToStructuredGrid.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageToStructuredGrid {.
    importcpp: "vtkImageToStructuredGrid::SafeDownCast(@)",
    header: "vtkImageToStructuredGrid.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageToStructuredGrid :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkStructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageToStructuredGrid :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageToStructuredGrid :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageToStructuredGrid; oss: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageToStructuredGrid.h".}