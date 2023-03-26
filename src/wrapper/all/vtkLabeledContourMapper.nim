## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLabeledContourMapper.h
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
##  @class   vtkLabeledContourMapper
##  @brief   Draw labeled isolines.
##
##  Draw isolines with 3D inline labels.
##
##  The lines in the input polydata will be drawn with labels displaying the
##  scalar value.
##
##  For this mapper to function properly, stenciling must be enabled in the
##  render window (it is disabled by default). Otherwise the lines will be
##  drawn through the labels.
##

import
  vtkRenderingCoreModule, vtkMapper, vtkNew, vtkSmartPointer

discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkTextActor3D"
discard "forward decl of vtkTextProperty"
discard "forward decl of vtkTextPropertyCollection"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkPolyDataMapper"
type
  vtkLabeledContourMapper* {.importcpp: "vtkLabeledContourMapper",
                            header: "vtkLabeledContourMapper.h", bycopy.} = object of vtkMapper
    vtkLabeledContourMapper* {.importc: "vtkLabeledContourMapper".}: VTK_NEWINSTANCE


proc New*(): ptr vtkLabeledContourMapper {.importcpp: "vtkLabeledContourMapper::New(@)",
                                       header: "vtkLabeledContourMapper.h".}
type
  vtkLabeledContourMapperSuperclass* = vtkMapper

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkLabeledContourMapper::IsTypeOf(@)",
    header: "vtkLabeledContourMapper.h".}
proc IsA*(this: var vtkLabeledContourMapper; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkLabeledContourMapper.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkLabeledContourMapper {.
    importcpp: "vtkLabeledContourMapper::SafeDownCast(@)",
    header: "vtkLabeledContourMapper.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkLabeledContourMapper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLabeledContourMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLabeledContourMapper :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkLabeledContourMapper; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkLabeledContourMapper.h".}
proc Render*(this: var vtkLabeledContourMapper; ren: ptr vtkRenderer; act: ptr vtkActor) {.
    importcpp: "Render", header: "vtkLabeledContourMapper.h".}
proc SetInputData*(this: var vtkLabeledContourMapper; `in`: ptr vtkPolyData) {.
    importcpp: "SetInputData", header: "vtkLabeledContourMapper.h".}
proc GetInput*(this: var vtkLabeledContourMapper): ptr vtkPolyData {.
    importcpp: "GetInput", header: "vtkLabeledContourMapper.h".}
proc GetBounds*(this: var vtkLabeledContourMapper): ptr cdouble {.
    importcpp: "GetBounds", header: "vtkLabeledContourMapper.h".}
proc GetBounds*(this: var vtkLabeledContourMapper; bounds: array[6, cdouble]) {.
    importcpp: "GetBounds", header: "vtkLabeledContourMapper.h".}
proc SetTextProperty*(this: var vtkLabeledContourMapper; tprop: ptr vtkTextProperty) {.
    importcpp: "SetTextProperty", header: "vtkLabeledContourMapper.h".}
proc SetTextProperties*(this: var vtkLabeledContourMapper;
                       coll: ptr vtkTextPropertyCollection) {.
    importcpp: "SetTextProperties", header: "vtkLabeledContourMapper.h".}
proc GetTextProperties*(this: var vtkLabeledContourMapper): ptr vtkTextPropertyCollection {.
    importcpp: "GetTextProperties", header: "vtkLabeledContourMapper.h".}
proc GetTextPropertyMapping*(this: var vtkLabeledContourMapper): ptr vtkDoubleArray {.
    importcpp: "GetTextPropertyMapping", header: "vtkLabeledContourMapper.h".}
proc SetTextPropertyMapping*(this: var vtkLabeledContourMapper;
                            mapping: ptr vtkDoubleArray) {.
    importcpp: "SetTextPropertyMapping", header: "vtkLabeledContourMapper.h".}
proc SetLabelVisibility*(this: var vtkLabeledContourMapper; _arg: bool) {.
    importcpp: "SetLabelVisibility", header: "vtkLabeledContourMapper.h".}
## !!!Ignored construct:  virtual bool GetLabelVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LabelVisibility  of  << this -> LabelVisibility ) ; return this -> LabelVisibility ; } ;
## Error: expected ';'!!!

proc LabelVisibilityOn*(this: var vtkLabeledContourMapper) {.
    importcpp: "LabelVisibilityOn", header: "vtkLabeledContourMapper.h".}
proc LabelVisibilityOff*(this: var vtkLabeledContourMapper) {.
    importcpp: "LabelVisibilityOff", header: "vtkLabeledContourMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  Ensure that there are at least SkipDistance pixels between labels. This
  ##  is only enforced on labels along the same line. The default is 0.
  ##
proc SetLabelVisibilitySkipDistance*(this: var vtkLabeledContourMapper;
                                    _arg: cdouble) {.
    importcpp: "SetLabelVisibilitySkipDistance",
    header: "vtkLabeledContourMapper.h".}
## !!!Ignored construct:  virtual double GetLabelVisibilitySkipDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SkipDistance  of  << this -> SkipDistance ) ; return this -> SkipDistance ; } ;
## Error: expected ';'!!!

proc GetPolyDataMapper*(this: var vtkLabeledContourMapper): ptr vtkPolyDataMapper {.
    importcpp: "GetPolyDataMapper", header: "vtkLabeledContourMapper.h".}
  ## /@}
proc ReleaseGraphicsResources*(this: var vtkLabeledContourMapper; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkLabeledContourMapper.h".}