## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkStringToImage.h
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
##  @class   vtkStringToImage
##  @brief   base class for classes that render supplied text
##  to an image.
##
##
##
##

import
  vtkObject, vtkRenderingCoreModule

discard "forward decl of vtkStdString"
discard "forward decl of vtkTextProperty"
discard "forward decl of vtkImageData"
discard "forward decl of vtkVector2i"
type
  vtkStringToImage* {.importcpp: "vtkStringToImage", header: "vtkStringToImage.h",
                     bycopy.} = object of vtkObject
    vtkStringToImage* {.importc: "vtkStringToImage".}: VTK_NEWINSTANCE

  vtkStringToImageSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkStringToImage::IsTypeOf(@)", header: "vtkStringToImage.h".}
proc IsA*(this: var vtkStringToImage; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkStringToImage.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkStringToImage {.
    importcpp: "vtkStringToImage::SafeDownCast(@)", header: "vtkStringToImage.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkStringToImage :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkStringToImage :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkStringToImage :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkStringToImage; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkStringToImage.h".}
proc GetBounds*(this: var vtkStringToImage; property: ptr vtkTextProperty;
               string: vtkStdString; dpi: cint): vtkVector2i {.
    importcpp: "GetBounds", header: "vtkStringToImage.h".}
proc RenderString*(this: var vtkStringToImage; property: ptr vtkTextProperty;
                  string: vtkStdString; dpi: cint; data: ptr vtkImageData;
                  text_dims: array[2, cint] = nil): cint {.importcpp: "RenderString",
    header: "vtkStringToImage.h".}
proc SetScaleToPowerOfTwo*(this: var vtkStringToImage; scale: bool) {.
    importcpp: "SetScaleToPowerOfTwo", header: "vtkStringToImage.h".}
## !!!Ignored construct:  virtual bool GetScaleToPowerOfTwo ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScaleToPowerOfTwo  of  << this -> ScaleToPowerOfTwo ) ; return this -> ScaleToPowerOfTwo ; } ;
## Error: expected ';'!!!
