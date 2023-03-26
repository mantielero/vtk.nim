## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkQtLabelRenderStrategy.h
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
##  @class   vtkQtLabelRenderStrategy
##  @brief   Renders labels with Qt
##
##
##  This class uses Qt to render labels and compute sizes. The labels are
##  rendered to a QImage, then EndFrame() converts that image to a vtkImageData
##  and textures the image onto a quad spanning the render area.
##

import
  vtkLabelRenderStrategy, vtkRenderingQtModule

discard "forward decl of vtkLabelSizeCalculator"
discard "forward decl of vtkLabeledDataMapper"
discard "forward decl of vtkPlaneSource"
discard "forward decl of vtkPolyDataMapper2D"
discard "forward decl of vtkQImageToImageSource"
discard "forward decl of vtkTexture"
discard "forward decl of vtkTexturedActor2D"
discard "forward decl of vtkTextureMapToPlane"
type
  vtkQtLabelRenderStrategy* {.importcpp: "vtkQtLabelRenderStrategy",
                             header: "vtkQtLabelRenderStrategy.h", bycopy.} = object of vtkLabelRenderStrategy
    vtkQtLabelRenderStrategy* {.importc: "vtkQtLabelRenderStrategy".}: VTK_NEWINSTANCE
    ##  Should the text be antialiased, inherited from render window.


proc PrintSelf*(this: var vtkQtLabelRenderStrategy; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkQtLabelRenderStrategy.h".}
type
  vtkQtLabelRenderStrategySuperclass* = vtkLabelRenderStrategy

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkQtLabelRenderStrategy::IsTypeOf(@)",
    header: "vtkQtLabelRenderStrategy.h".}
proc IsA*(this: var vtkQtLabelRenderStrategy; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkQtLabelRenderStrategy.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkQtLabelRenderStrategy {.
    importcpp: "vtkQtLabelRenderStrategy::SafeDownCast(@)",
    header: "vtkQtLabelRenderStrategy.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkQtLabelRenderStrategy :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkLabelRenderStrategy :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkQtLabelRenderStrategy :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkQtLabelRenderStrategy :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc New*(): ptr vtkQtLabelRenderStrategy {.importcpp: "vtkQtLabelRenderStrategy::New(@)",
                                        header: "vtkQtLabelRenderStrategy.h".}
proc ComputeLabelBounds*(this: var vtkQtLabelRenderStrategy;
                        tprop: ptr vtkTextProperty; label: vtkStdString;
                        bds: array[4, cdouble]) {.importcpp: "ComputeLabelBounds",
    header: "vtkQtLabelRenderStrategy.h".}
proc RenderLabel*(this: var vtkQtLabelRenderStrategy; x: array[2, cint];
                 tprop: ptr vtkTextProperty; label: vtkStdString) {.
    importcpp: "RenderLabel", header: "vtkQtLabelRenderStrategy.h".}
proc RenderLabel*(this: var vtkQtLabelRenderStrategy; x: array[2, cint];
                 tprop: ptr vtkTextProperty; label: vtkStdString; maxWidth: cint) {.
    importcpp: "RenderLabel", header: "vtkQtLabelRenderStrategy.h".}
proc StartFrame*(this: var vtkQtLabelRenderStrategy) {.importcpp: "StartFrame",
    header: "vtkQtLabelRenderStrategy.h".}
proc EndFrame*(this: var vtkQtLabelRenderStrategy) {.importcpp: "EndFrame",
    header: "vtkQtLabelRenderStrategy.h".}
proc ReleaseGraphicsResources*(this: var vtkQtLabelRenderStrategy;
                              window: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkQtLabelRenderStrategy.h".}