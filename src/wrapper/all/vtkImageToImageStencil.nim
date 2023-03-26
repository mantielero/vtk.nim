## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageToImageStencil.h
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
##  @class   vtkImageToImageStencil
##  @brief   clip an image with a mask image
##
##  vtkImageToImageStencil will convert a vtkImageData into an stencil
##  that can be used with vtkImageStecil or other vtk classes that apply
##  a stencil to an image.
##  @sa
##  vtkImageStencil vtkImplicitFunctionToImageStencil vtkPolyDataToImageStencil
##

import
  vtkImageStencilAlgorithm, vtkImagingStencilModule

discard "forward decl of vtkImageData"
type
  vtkImageToImageStencil* {.importcpp: "vtkImageToImageStencil",
                           header: "vtkImageToImageStencil.h", bycopy.} = object of vtkImageStencilAlgorithm
    vtkImageToImageStencil* {.importc: "vtkImageToImageStencil".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageToImageStencil {.importcpp: "vtkImageToImageStencil::New(@)",
                                      header: "vtkImageToImageStencil.h".}
type
  vtkImageToImageStencilSuperclass* = vtkImageStencilAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageToImageStencil::IsTypeOf(@)",
    header: "vtkImageToImageStencil.h".}
proc IsA*(this: var vtkImageToImageStencil; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageToImageStencil.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageToImageStencil {.
    importcpp: "vtkImageToImageStencil::SafeDownCast(@)",
    header: "vtkImageToImageStencil.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageToImageStencil :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageStencilAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageToImageStencil :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageToImageStencil :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageToImageStencil; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageToImageStencil.h".}
proc SetInputData*(this: var vtkImageToImageStencil; input: ptr vtkImageData) {.
    importcpp: "SetInputData", header: "vtkImageToImageStencil.h".}
proc GetInput*(this: var vtkImageToImageStencil): ptr vtkImageData {.
    importcpp: "GetInput", header: "vtkImageToImageStencil.h".}
proc ThresholdByUpper*(this: var vtkImageToImageStencil; thresh: cdouble) {.
    importcpp: "ThresholdByUpper", header: "vtkImageToImageStencil.h".}
proc ThresholdByLower*(this: var vtkImageToImageStencil; thresh: cdouble) {.
    importcpp: "ThresholdByLower", header: "vtkImageToImageStencil.h".}
proc ThresholdBetween*(this: var vtkImageToImageStencil; lower: cdouble;
                      upper: cdouble) {.importcpp: "ThresholdBetween",
                                      header: "vtkImageToImageStencil.h".}
proc SetUpperThreshold*(this: var vtkImageToImageStencil; _arg: cdouble) {.
    importcpp: "SetUpperThreshold", header: "vtkImageToImageStencil.h".}
## !!!Ignored construct:  virtual double GetUpperThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UpperThreshold  of  << this -> UpperThreshold ) ; return this -> UpperThreshold ; } ;
## Error: expected ';'!!!

proc SetUpperThresholdLowerThreshold*(this: var vtkImageToImageStencil;
                                     _arg: cdouble) {.
    importcpp: "SetUpperThresholdLowerThreshold",
    header: "vtkImageToImageStencil.h".}
## !!!Ignored construct:  virtual double GetUpperThresholdLowerThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LowerThreshold  of  << this -> LowerThreshold ) ; return this -> LowerThreshold ; } ;
## Error: expected ';'!!!
