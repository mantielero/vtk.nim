## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRenderLargeImage.h
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
##  @class   vtkRenderLargeImage
##  @brief   Use tiling to generate a large rendering
##
##  vtkRenderLargeImage provides methods needed to read a region from a file.
##

import
  vtkAlgorithm, vtkFiltersHybridModule, vtkImageData

discard "forward decl of vtkRenderer"
discard "forward decl of vtkActor2DCollection"
discard "forward decl of vtkCollection"
discard "forward decl of vtkRenderLargeImage2DHelperClass"
type
  vtkRenderLargeImage* {.importcpp: "vtkRenderLargeImage",
                        header: "vtkRenderLargeImage.h", bycopy.} = object of vtkAlgorithm
    vtkRenderLargeImage* {.importc: "vtkRenderLargeImage".}: VTK_NEWINSTANCE


proc New*(): ptr vtkRenderLargeImage {.importcpp: "vtkRenderLargeImage::New(@)",
                                   header: "vtkRenderLargeImage.h".}
type
  vtkRenderLargeImageSuperclass* = vtkAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkRenderLargeImage::IsTypeOf(@)", header: "vtkRenderLargeImage.h".}
proc IsA*(this: var vtkRenderLargeImage; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkRenderLargeImage.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkRenderLargeImage {.
    importcpp: "vtkRenderLargeImage::SafeDownCast(@)",
    header: "vtkRenderLargeImage.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkRenderLargeImage :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRenderLargeImage :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRenderLargeImage :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkRenderLargeImage; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkRenderLargeImage.h".}
proc SetMagnification*(this: var vtkRenderLargeImage; _arg: cint) {.
    importcpp: "SetMagnification", header: "vtkRenderLargeImage.h".}
## !!!Ignored construct:  virtual int GetMagnification ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Magnification  of  << this -> Magnification ) ; return this -> Magnification ; } ;
## Error: expected ';'!!!

proc SetInput*(this: var vtkRenderLargeImage; a2: ptr vtkRenderer) {.
    importcpp: "SetInput", header: "vtkRenderLargeImage.h".}
proc GetnameInput*(this: var vtkRenderLargeImage): ptr vtkRenderer {.
    importcpp: "GetnameInput", header: "vtkRenderLargeImage.h".}
  ## /@}
  ## *
  ##  Get the output data object for a port on this algorithm.
  ##
proc GetOutput*(this: var vtkRenderLargeImage): ptr vtkImageData {.
    importcpp: "GetOutput", header: "vtkRenderLargeImage.h".}
proc ProcessRequest*(this: var vtkRenderLargeImage; a2: ptr vtkInformation;
                    a3: ptr ptr vtkInformationVector; a4: ptr vtkInformationVector): vtkTypeBool {.
    importcpp: "ProcessRequest", header: "vtkRenderLargeImage.h".}