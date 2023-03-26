## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOpenGLImageGradient.h
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
##  @class   vtkOpenGLImageGradient
##  @brief   Compute Gradient using the GPU
##

import
  vtkImageGradient, vtkImagingOpenGL2Module

discard "forward decl of vtkOpenGLImageAlgorithmHelper"
discard "forward decl of vtkRenderWindow"
type
  vtkOpenGLImageGradient* {.importcpp: "vtkOpenGLImageGradient",
                           header: "vtkOpenGLImageGradient.h", bycopy.} = object of vtkImageGradient
    vtkOpenGLImageGradient* {.importc: "vtkOpenGLImageGradient".}: VTK_NEWINSTANCE


proc New*(): ptr vtkOpenGLImageGradient {.importcpp: "vtkOpenGLImageGradient::New(@)",
                                      header: "vtkOpenGLImageGradient.h".}
type
  vtkOpenGLImageGradientSuperclass* = vtkImageGradient

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOpenGLImageGradient::IsTypeOf(@)",
    header: "vtkOpenGLImageGradient.h".}
proc IsA*(this: var vtkOpenGLImageGradient; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkOpenGLImageGradient.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOpenGLImageGradient {.
    importcpp: "vtkOpenGLImageGradient::SafeDownCast(@)",
    header: "vtkOpenGLImageGradient.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOpenGLImageGradient :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageGradient :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenGLImageGradient :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenGLImageGradient :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc SetRenderWindow*(this: var vtkOpenGLImageGradient; a2: ptr vtkRenderWindow) {.
    importcpp: "SetRenderWindow", header: "vtkOpenGLImageGradient.h".}