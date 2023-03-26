## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAreaPicker.h
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
##  @class   vtkAreaPicker
##  @brief   Picks props behind a selection rectangle on a viewport.
##
##
##  The vtkAreaPicker picks all vtkProp3Ds that lie behind the screen space
##  rectangle from x0,y0 and x1,y1. The selection is based upon the bounding
##  box of the prop and is thus not exact.
##
##  Like vtkPicker, a pick results in a list of Prop3Ds because many props may
##  lie within the pick frustum. You can also get an AssemblyPath, which in this
##  case is defined to be the path to the one particular prop in the Prop3D list
##  that lies nearest to the near plane.
##
##  This picker also returns the selection frustum, defined as either a
##  vtkPlanes, or a set of eight corner vertices in world space. The vtkPlanes
##  version is an ImplicitFunction, which is suitable for use with the
##  vtkExtractGeometry. The six frustum planes are in order: left, right,
##  bottom, top, near, far
##
##  Because this picker picks everything within a volume, the world pick point
##  result is ill-defined. Therefore if you ask this class for the world pick
##  position, you will get the centroid of the pick frustum. This may be outside
##  of all props in the prop list.
##
##  @sa
##  vtkInteractorStyleRubberBandPick, vtkExtractSelectedFrustum.
##

import
  vtkAbstractPropPicker, vtkRenderingCoreModule

discard "forward decl of vtkRenderer"
discard "forward decl of vtkPoints"
discard "forward decl of vtkPlanes"
discard "forward decl of vtkProp3DCollection"
discard "forward decl of vtkAbstractMapper3D"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkExtractSelectedFrustum"
discard "forward decl of vtkProp"
type
  vtkAreaPicker* {.importcpp: "vtkAreaPicker", header: "vtkAreaPicker.h", bycopy.} = object of vtkAbstractPropPicker
    vtkAreaPicker* {.importc: "vtkAreaPicker".}: VTK_NEWINSTANCE
    ##  candidate actors (based on bounding box)
    ##  selected mapper (if the prop has a mapper)
    ##  selected dataset (if there is one)
    ##  used internally to do prop intersection tests


proc New*(): ptr vtkAreaPicker {.importcpp: "vtkAreaPicker::New(@)",
                             header: "vtkAreaPicker.h".}
type
  vtkAreaPickerSuperclass* = vtkAbstractPropPicker

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAreaPicker::IsTypeOf(@)", header: "vtkAreaPicker.h".}
proc IsA*(this: var vtkAreaPicker; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkAreaPicker.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAreaPicker {.
    importcpp: "vtkAreaPicker::SafeDownCast(@)", header: "vtkAreaPicker.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAreaPicker :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractPropPicker :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAreaPicker :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAreaPicker :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAreaPicker; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkAreaPicker.h".}
proc SetPickCoords*(this: var vtkAreaPicker; x0: cdouble; y0: cdouble; x1: cdouble;
                   y1: cdouble) {.importcpp: "SetPickCoords",
                                header: "vtkAreaPicker.h".}
proc SetRenderer*(this: var vtkAreaPicker; a2: ptr vtkRenderer) {.
    importcpp: "SetRenderer", header: "vtkAreaPicker.h".}
proc Pick*(this: var vtkAreaPicker): cint {.importcpp: "Pick",
                                       header: "vtkAreaPicker.h".}
proc AreaPick*(this: var vtkAreaPicker; x0: cdouble; y0: cdouble; x1: cdouble;
              y1: cdouble; renderer: ptr vtkRenderer = nil): cint {.
    importcpp: "AreaPick", header: "vtkAreaPicker.h".}
proc Pick*(this: var vtkAreaPicker; x0: cdouble; y0: cdouble;
          vtkNotUsed: proc (a1: z0): cdouble; renderer: ptr vtkRenderer = nil): cint {.
    importcpp: "Pick", header: "vtkAreaPicker.h".}
proc GetnameMapper*(this: var vtkAreaPicker): ptr vtkAbstractMapper3D {.
    importcpp: "GetnameMapper", header: "vtkAreaPicker.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get a pointer to the dataset that was picked (if any). If nothing
  ##  was picked then NULL is returned.
  ##
proc GetnameMapperDataSet*(this: var vtkAreaPicker): ptr vtkDataSet {.
    importcpp: "GetnameMapperDataSet", header: "vtkAreaPicker.h".}
  ## /@}
  ## *
  ##  Return a collection of all the prop 3D's that were intersected
  ##  by the pick ray. This collection is not sorted.
  ##
proc GetProp3Ds*(this: var vtkAreaPicker): ptr vtkProp3DCollection {.
    importcpp: "GetProp3Ds", header: "vtkAreaPicker.h".}
proc GetnameMapperDataSetFrustum*(this: var vtkAreaPicker): ptr vtkPlanes {.
    importcpp: "GetnameMapperDataSetFrustum", header: "vtkAreaPicker.h".}
  ## /@}
  ## /@{
  ## *
  ##  Return eight points that define the selection frustum.
  ##
proc GetnameMapperDataSetFrustumClipPoints*(this: var vtkAreaPicker): ptr vtkPoints {.
    importcpp: "GetnameMapperDataSetFrustumClipPoints", header: "vtkAreaPicker.h".}
  ## /@}