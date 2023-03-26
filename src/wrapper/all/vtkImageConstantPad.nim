## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageConstantPad.h
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
##  @class   vtkImageConstantPad
##  @brief   Makes image larger by padding with constant.
##
##  vtkImageConstantPad changes the image extent of its input.
##  Any pixels outside of the original image extent are filled with
##  a constant value (default is 0.0).
##
##  @sa
##  vtkImageWrapPad vtkImageMirrorPad
##

import
  vtkImagePadFilter, vtkImagingCoreModule

type
  vtkImageConstantPad* {.importcpp: "vtkImageConstantPad",
                        header: "vtkImageConstantPad.h", bycopy.} = object of vtkImagePadFilter
    vtkImageConstantPad* {.importc: "vtkImageConstantPad".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageConstantPad {.importcpp: "vtkImageConstantPad::New(@)",
                                   header: "vtkImageConstantPad.h".}
type
  vtkImageConstantPadSuperclass* = vtkImagePadFilter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageConstantPad::IsTypeOf(@)", header: "vtkImageConstantPad.h".}
proc IsA*(this: var vtkImageConstantPad; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageConstantPad.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageConstantPad {.
    importcpp: "vtkImageConstantPad::SafeDownCast(@)",
    header: "vtkImageConstantPad.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageConstantPad :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImagePadFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageConstantPad :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageConstantPad :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageConstantPad; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageConstantPad.h".}
proc SetConstant*(this: var vtkImageConstantPad; _arg: cdouble) {.
    importcpp: "SetConstant", header: "vtkImageConstantPad.h".}
## !!!Ignored construct:  virtual double GetConstant ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Constant  of  << this -> Constant ) ; return this -> Constant ; } ;
## Error: expected ';'!!!
