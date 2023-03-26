## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageStencilAlgorithm.h
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
##  @class   vtkImageStencilAlgorithm
##  @brief   producer of vtkImageStencilData
##
##  vtkImageStencilAlgorithm is a superclass for filters that generate
##  the special vtkImageStencilData type.  This data type is a special
##  representation of a binary image that can be used as a mask by
##  several imaging filters.
##  @sa
##  vtkImageStencilData vtkImageStencilSource
##

import
  vtkAlgorithm, vtkImagingCoreModule

discard "forward decl of vtkImageStencilData"
type
  vtkImageStencilAlgorithm* {.importcpp: "vtkImageStencilAlgorithm",
                             header: "vtkImageStencilAlgorithm.h", bycopy.} = object of vtkAlgorithm
    vtkImageStencilAlgorithm* {.importc: "vtkImageStencilAlgorithm".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageStencilAlgorithm {.importcpp: "vtkImageStencilAlgorithm::New(@)",
                                        header: "vtkImageStencilAlgorithm.h".}
type
  vtkImageStencilAlgorithmSuperclass* = vtkAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageStencilAlgorithm::IsTypeOf(@)",
    header: "vtkImageStencilAlgorithm.h".}
proc IsA*(this: var vtkImageStencilAlgorithm; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageStencilAlgorithm.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageStencilAlgorithm {.
    importcpp: "vtkImageStencilAlgorithm::SafeDownCast(@)",
    header: "vtkImageStencilAlgorithm.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageStencilAlgorithm :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageStencilAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageStencilAlgorithm :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageStencilAlgorithm; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageStencilAlgorithm.h".}
proc SetOutput*(this: var vtkImageStencilAlgorithm; output: ptr vtkImageStencilData) {.
    importcpp: "SetOutput", header: "vtkImageStencilAlgorithm.h".}
proc GetOutput*(this: var vtkImageStencilAlgorithm): ptr vtkImageStencilData {.
    importcpp: "GetOutput", header: "vtkImageStencilAlgorithm.h".}
proc ProcessRequest*(this: var vtkImageStencilAlgorithm; a2: ptr vtkInformation;
                    a3: ptr ptr vtkInformationVector; a4: ptr vtkInformationVector): vtkTypeBool {.
    importcpp: "ProcessRequest", header: "vtkImageStencilAlgorithm.h".}