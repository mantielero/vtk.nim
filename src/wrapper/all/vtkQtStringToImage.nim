## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkQtStringToImage.h
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
##  @class   vtkQtStringToImage
##  @brief   uses Qt to render the supplied text to an image.
##
##
##
##

import
  vtkRenderingQtModule, vtkSmartPointer, vtkStringToImage

discard "forward decl of vtkQImageToImageSource"
type
  vtkQtStringToImage* {.importcpp: "vtkQtStringToImage",
                       header: "vtkQtStringToImage.h", bycopy.} = object of vtkStringToImage
    vtkQtStringToImage* {.importc: "vtkQtStringToImage".}: VTK_NEWINSTANCE

  vtkQtStringToImageSuperclass* = vtkStringToImage

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkQtStringToImage::IsTypeOf(@)", header: "vtkQtStringToImage.h".}
proc IsA*(this: var vtkQtStringToImage; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkQtStringToImage.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkQtStringToImage {.
    importcpp: "vtkQtStringToImage::SafeDownCast(@)",
    header: "vtkQtStringToImage.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkQtStringToImage :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkStringToImage :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkQtStringToImage :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkQtStringToImage :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkQtStringToImage; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkQtStringToImage.h".}
proc New*(): ptr vtkQtStringToImage {.importcpp: "vtkQtStringToImage::New(@)",
                                  header: "vtkQtStringToImage.h".}
proc GetBounds*(this: var vtkQtStringToImage; property: ptr vtkTextProperty;
               string: vtkStdString; dpi: cint): vtkVector2i {.
    importcpp: "GetBounds", header: "vtkQtStringToImage.h".}
proc RenderString*(this: var vtkQtStringToImage; property: ptr vtkTextProperty;
                  string: vtkStdString; dpi: cint; data: ptr vtkImageData;
                  textDims: array[2, cint] = nil): cint {.importcpp: "RenderString",
    header: "vtkQtStringToImage.h".}
proc DeepCopy*(this: var vtkQtStringToImage; utility: ptr vtkQtStringToImage) {.
    importcpp: "DeepCopy", header: "vtkQtStringToImage.h".}