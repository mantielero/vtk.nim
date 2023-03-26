## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImplicitFunctionToImageStencil.h
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
##  @class   vtkImplicitFunctionToImageStencil
##  @brief   clip an image with a function
##
##  vtkImplicitFunctionToImageStencil will convert a vtkImplicitFunction into
##  a stencil that can be used with vtkImageStencil or with other classes
##  that apply a stencil to an image.
##  @sa
##  vtkImplicitFunction vtkImageStencil vtkPolyDataToImageStencil
##

import
  vtkImageStencilSource, vtkImagingStencilModule

discard "forward decl of vtkImplicitFunction"
type
  vtkImplicitFunctionToImageStencil* {.importcpp: "vtkImplicitFunctionToImageStencil", header: "vtkImplicitFunctionToImageStencil.h",
                                      bycopy.} = object of vtkImageStencilSource
    vtkImplicitFunctionToImageStencil* {.importc: "vtkImplicitFunctionToImageStencil".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImplicitFunctionToImageStencil {.
    importcpp: "vtkImplicitFunctionToImageStencil::New(@)",
    header: "vtkImplicitFunctionToImageStencil.h".}
type
  vtkImplicitFunctionToImageStencilSuperclass* = vtkImageStencilSource

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImplicitFunctionToImageStencil::IsTypeOf(@)",
    header: "vtkImplicitFunctionToImageStencil.h".}
proc IsA*(this: var vtkImplicitFunctionToImageStencil; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImplicitFunctionToImageStencil.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImplicitFunctionToImageStencil {.
    importcpp: "vtkImplicitFunctionToImageStencil::SafeDownCast(@)",
    header: "vtkImplicitFunctionToImageStencil.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImplicitFunctionToImageStencil :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageStencilSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImplicitFunctionToImageStencil :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImplicitFunctionToImageStencil :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImplicitFunctionToImageStencil; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkImplicitFunctionToImageStencil.h".}
proc SetInput*(this: var vtkImplicitFunctionToImageStencil;
              a2: ptr vtkImplicitFunction) {.importcpp: "SetInput",
    header: "vtkImplicitFunctionToImageStencil.h".}
proc GetnameInput*(this: var vtkImplicitFunctionToImageStencil): ptr vtkImplicitFunction {.
    importcpp: "GetnameInput", header: "vtkImplicitFunctionToImageStencil.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the threshold value for the implicit function.
  ##
proc SetThreshold*(this: var vtkImplicitFunctionToImageStencil; _arg: cdouble) {.
    importcpp: "SetThreshold", header: "vtkImplicitFunctionToImageStencil.h".}
## !!!Ignored construct:  virtual double GetThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Threshold  of  << this -> Threshold ) ; return this -> Threshold ; } ;
## Error: expected ';'!!!

proc GetMTime*(this: var vtkImplicitFunctionToImageStencil): vtkMTimeType {.
    importcpp: "GetMTime", header: "vtkImplicitFunctionToImageStencil.h".}