## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDataSetGradient.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##   This software is distributed WITHOUT ANY WARRANTY; without even
##   the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##   PURPOSE.  See the above copyright notice for more information.
##
##   =========================================================================
## *
##  @class   vtkDataSetGradient
##  @brief   computes scalar field gradient
##
##
##  vtkDataSetGradient Computes per cell gradient of point scalar field
##  or per point gradient of cell scalar field.
##
##  @par Thanks:
##  This file is part of the generalized Youngs material interface reconstruction algorithm
##  contributed by CEA/DIF - Commissariat a l'Energie Atomique, Centre DAM Ile-De-France <br> BP12,
##  F-91297 Arpajon, France. <br> Implementation by Thierry Carrard (CEA)
##

import
  vtkDataSetAlgorithm, vtkFiltersGeneralModule

type
  vtkDataSetGradient* {.importcpp: "vtkDataSetGradient",
                       header: "vtkDataSetGradient.h", bycopy.} = object of vtkDataSetAlgorithm
    vtkDataSetGradient* {.importc: "vtkDataSetGradient".}: VTK_NEWINSTANCE


proc New*(): ptr vtkDataSetGradient {.importcpp: "vtkDataSetGradient::New(@)",
                                  header: "vtkDataSetGradient.h".}
type
  vtkDataSetGradientSuperclass* = vtkDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDataSetGradient::IsTypeOf(@)", header: "vtkDataSetGradient.h".}
proc IsA*(this: var vtkDataSetGradient; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkDataSetGradient.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDataSetGradient {.
    importcpp: "vtkDataSetGradient::SafeDownCast(@)",
    header: "vtkDataSetGradient.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDataSetGradient :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDataSetGradient :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDataSetGradient :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDataSetGradient; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkDataSetGradient.h".}
proc SetResultArrayName*(this: var vtkDataSetGradient; _arg: cstring) {.
    importcpp: "SetResultArrayName", header: "vtkDataSetGradient.h".}
proc GetResultArrayName*(this: var vtkDataSetGradient): cstring {.
    importcpp: "GetResultArrayName", header: "vtkDataSetGradient.h".}
  ## /@}