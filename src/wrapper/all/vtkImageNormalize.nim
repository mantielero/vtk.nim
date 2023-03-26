## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageNormalize.h
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
##  @class   vtkImageNormalize
##  @brief   Normalizes that scalar components for each point.
##
##  For each point, vtkImageNormalize normalizes the vector defined by the
##  scalar components.  If the magnitude of this vector is zero, the output
##  vector is zero also.
##

import
  vtkImagingGeneralModule, vtkThreadedImageAlgorithm

type
  vtkImageNormalize* {.importcpp: "vtkImageNormalize",
                      header: "vtkImageNormalize.h", bycopy.} = object of vtkThreadedImageAlgorithm
    vtkImageNormalize* {.importc: "vtkImageNormalize".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageNormalize {.importcpp: "vtkImageNormalize::New(@)",
                                 header: "vtkImageNormalize.h".}
type
  vtkImageNormalizeSuperclass* = vtkThreadedImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageNormalize::IsTypeOf(@)", header: "vtkImageNormalize.h".}
proc IsA*(this: var vtkImageNormalize; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageNormalize.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageNormalize {.
    importcpp: "vtkImageNormalize::SafeDownCast(@)", header: "vtkImageNormalize.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageNormalize :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageNormalize :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageNormalize :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageNormalize; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageNormalize.h".}