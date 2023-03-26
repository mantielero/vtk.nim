## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMergeArrays.h
##
##   Copyright (c) Kitware, Inc.
##   All rights reserved.
##   See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkMergeArrays
##  @brief   Multiple inputs with one output.
##
##  vtkMergeArrays tries to put all arrays from all inputs into one output.
##  The output data object is the same as the first data input.
##  The filter checks for a consistent number of points and cells with
##  respect to the first input, but does not check any more. Any inputs
##  which do not have the correct number of points or cells are ignored
##  for that type of data set attribute. When adding new arrays, if there
##  is an existing array of the same name and attribute type, the new array
##  will have the name mangled to be the original array name plus
##  `_input_<inputid>` where `<inputid>` is the id/index of the input filter
##  that is providing that array.
##

import
  vtkFiltersGeneralModule, vtkPassInputTypeAlgorithm

discard "forward decl of vtkDataSet"
discard "forward decl of vtkFieldData"
type
  vtkMergeArrays* {.importcpp: "vtkMergeArrays", header: "vtkMergeArrays.h", bycopy.} = object of vtkPassInputTypeAlgorithm
    vtkMergeArrays* {.importc: "vtkMergeArrays".}: VTK_NEWINSTANCE


proc New*(): ptr vtkMergeArrays {.importcpp: "vtkMergeArrays::New(@)",
                              header: "vtkMergeArrays.h".}
type
  vtkMergeArraysSuperclass* = vtkPassInputTypeAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMergeArrays::IsTypeOf(@)", header: "vtkMergeArrays.h".}
proc IsA*(this: var vtkMergeArrays; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkMergeArrays.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMergeArrays {.
    importcpp: "vtkMergeArrays::SafeDownCast(@)", header: "vtkMergeArrays.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMergeArrays :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPassInputTypeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMergeArrays :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMergeArrays :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkMergeArrays; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkMergeArrays.h".}