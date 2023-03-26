## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageDivergence.h
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
##  @class   vtkImageDivergence
##  @brief   Divergence of a vector field.
##
##  vtkImageDivergence takes a 3D vector field
##  and creates a scalar field which
##  which represents the rate of change of the vector field.
##  The definition of Divergence:
##  Given V = P(x,y,z), Q(x,y,z), R(x,y,z),
##  Divergence = dP/dx + dQ/dy + dR/dz.
##

import
  vtkImagingMathModule, vtkThreadedImageAlgorithm

type
  vtkImageDivergence* {.importcpp: "vtkImageDivergence",
                       header: "vtkImageDivergence.h", bycopy.} = object of vtkThreadedImageAlgorithm
    vtkImageDivergence* {.importc: "vtkImageDivergence".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageDivergence {.importcpp: "vtkImageDivergence::New(@)",
                                  header: "vtkImageDivergence.h".}
type
  vtkImageDivergenceSuperclass* = vtkThreadedImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageDivergence::IsTypeOf(@)", header: "vtkImageDivergence.h".}
proc IsA*(this: var vtkImageDivergence; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageDivergence.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageDivergence {.
    importcpp: "vtkImageDivergence::SafeDownCast(@)",
    header: "vtkImageDivergence.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageDivergence :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageDivergence :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageDivergence :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageDivergence; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageDivergence.h".}