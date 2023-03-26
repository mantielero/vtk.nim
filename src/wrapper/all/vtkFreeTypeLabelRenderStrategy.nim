## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFreeTypeLabelRenderStrategy.h
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
##  @class   vtkFreeTypeLabelRenderStrategy
##  @brief   Renders labels with freetype
##
##
##  Uses the FreeType to render labels and compute label sizes.
##  This strategy may be used with vtkLabelPlacementMapper.
##

import
  vtkLabelRenderStrategy, vtkRenderingLabelModule

discard "forward decl of vtkActor2D"
discard "forward decl of vtkTextRenderer"
discard "forward decl of vtkTextMapper"
type
  vtkFreeTypeLabelRenderStrategy* {.importcpp: "vtkFreeTypeLabelRenderStrategy",
                                   header: "vtkFreeTypeLabelRenderStrategy.h",
                                   bycopy.} = object of vtkLabelRenderStrategy
    vtkFreeTypeLabelRenderStrategy* {.importc: "vtkFreeTypeLabelRenderStrategy".}: VTK_NEWINSTANCE


proc PrintSelf*(this: var vtkFreeTypeLabelRenderStrategy; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkFreeTypeLabelRenderStrategy.h".}
type
  vtkFreeTypeLabelRenderStrategySuperclass* = vtkLabelRenderStrategy

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkFreeTypeLabelRenderStrategy::IsTypeOf(@)",
    header: "vtkFreeTypeLabelRenderStrategy.h".}
proc IsA*(this: var vtkFreeTypeLabelRenderStrategy; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkFreeTypeLabelRenderStrategy.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkFreeTypeLabelRenderStrategy {.
    importcpp: "vtkFreeTypeLabelRenderStrategy::SafeDownCast(@)",
    header: "vtkFreeTypeLabelRenderStrategy.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkFreeTypeLabelRenderStrategy :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkLabelRenderStrategy :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFreeTypeLabelRenderStrategy :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFreeTypeLabelRenderStrategy :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc New*(): ptr vtkFreeTypeLabelRenderStrategy {.
    importcpp: "vtkFreeTypeLabelRenderStrategy::New(@)",
    header: "vtkFreeTypeLabelRenderStrategy.h".}
proc SupportsRotation*(this: var vtkFreeTypeLabelRenderStrategy): bool {.
    importcpp: "SupportsRotation", header: "vtkFreeTypeLabelRenderStrategy.h".}
proc SupportsBoundedSize*(this: var vtkFreeTypeLabelRenderStrategy): bool {.
    importcpp: "SupportsBoundedSize", header: "vtkFreeTypeLabelRenderStrategy.h".}
proc ComputeLabelBounds*(this: var vtkFreeTypeLabelRenderStrategy;
                        tprop: ptr vtkTextProperty; label: vtkStdString;
                        bds: array[4, cdouble]) {.importcpp: "ComputeLabelBounds",
    header: "vtkFreeTypeLabelRenderStrategy.h".}
proc RenderLabel*(this: var vtkFreeTypeLabelRenderStrategy; x: array[2, cint];
                 tprop: ptr vtkTextProperty; label: vtkStdString) {.
    importcpp: "RenderLabel", header: "vtkFreeTypeLabelRenderStrategy.h".}
proc ReleaseGraphicsResources*(this: var vtkFreeTypeLabelRenderStrategy;
                              window: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources",
    header: "vtkFreeTypeLabelRenderStrategy.h".}