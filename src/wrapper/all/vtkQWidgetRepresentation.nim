## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkQWidgetRepresentation.h
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
##  @class   vtkQWidgetRepresentation
##  @brief   a class defining the representation for a vtkQWidgetWidget
##
##  This class renders a QWidget as a simple vtkPlaneSource with a vtkTexture
##  that contains a vtkQWidgetTexture which imports the OpenGL texture handle
##  from Qt into the vtk scene. Qt and VTK may need to be useing the same
##  graphics context.
##

import
  vtkDeprecation, vtkGUISupportQtModule, vtkWidgetRepresentation

discard "forward decl of QWidget"
discard "forward decl of vtkActor"
discard "forward decl of vtkCellPicker"
discard "forward decl of vtkOpenGLTexture"
discard "forward decl of vtkPlaneSource"
discard "forward decl of vtkPolyDataAlgorithm"
discard "forward decl of vtkPolyDataMapper"
discard "forward decl of vtkQWidgetTexture"
type
  vtkQWidgetRepresentation* {.importcpp: "vtkQWidgetRepresentation",
                             header: "vtkQWidgetRepresentation.h", bycopy.} = object of vtkWidgetRepresentation ## *
                                                                                                         ##  Instantiate the class.
                                                                                                         ##
    vtkQWidgetRepresentation* {.importc: "vtkQWidgetRepresentation".}: VTK_NEWINSTANCE
    ##  Register internal Pickers within PickingManager


proc New*(): ptr vtkQWidgetRepresentation {.importcpp: "vtkQWidgetRepresentation::New(@)",
                                        header: "vtkQWidgetRepresentation.h".}
type
  vtkQWidgetRepresentationSuperclass* = vtkWidgetRepresentation

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkQWidgetRepresentation::IsTypeOf(@)",
    header: "vtkQWidgetRepresentation.h".}
proc IsA*(this: var vtkQWidgetRepresentation; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkQWidgetRepresentation.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkQWidgetRepresentation {.
    importcpp: "vtkQWidgetRepresentation::SafeDownCast(@)",
    header: "vtkQWidgetRepresentation.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkQWidgetRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWidgetRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkQWidgetRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkQWidgetRepresentation :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkQWidgetRepresentation; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkQWidgetRepresentation.h".}
proc GetPolyDataAlgorithm*(this: var vtkQWidgetRepresentation): ptr vtkPolyDataAlgorithm {.
    importcpp: "GetPolyDataAlgorithm", header: "vtkQWidgetRepresentation.h".}
proc UpdatePlacement*(this: var vtkQWidgetRepresentation) {.
    importcpp: "UpdatePlacement", header: "vtkQWidgetRepresentation.h".}
proc PlaceWidget*(this: var vtkQWidgetRepresentation; bounds: array[6, cdouble]) {.
    importcpp: "PlaceWidget", header: "vtkQWidgetRepresentation.h".}
proc BuildRepresentation*(this: var vtkQWidgetRepresentation) {.
    importcpp: "BuildRepresentation", header: "vtkQWidgetRepresentation.h".}
proc ComputeComplexInteractionState*(this: var vtkQWidgetRepresentation;
                                    iren: ptr vtkRenderWindowInteractor;
                                    widget: ptr vtkAbstractWidget; event: culong;
                                    calldata: pointer; modify: cint = 0): cint {.
    importcpp: "ComputeComplexInteractionState",
    header: "vtkQWidgetRepresentation.h".}
## !!!Ignored construct:  /@} /@{ *
##  Methods supporting the rendering process.
##  double * GetBounds ( ) VTK_SIZEHINT ( 6 ) override ;
## Error: expected ';'!!!

proc GetActors*(this: var vtkQWidgetRepresentation; pc: ptr vtkPropCollection) {.
    importcpp: "GetActors", header: "vtkQWidgetRepresentation.h".}
proc ReleaseGraphicsResources*(this: var vtkQWidgetRepresentation; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkQWidgetRepresentation.h".}
proc RenderOpaqueGeometry*(this: var vtkQWidgetRepresentation; a2: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkQWidgetRepresentation.h".}
proc RenderTranslucentPolygonalGeometry*(this: var vtkQWidgetRepresentation;
                                        a2: ptr vtkViewport): cint {.
    importcpp: "RenderTranslucentPolygonalGeometry",
    header: "vtkQWidgetRepresentation.h".}
proc HasTranslucentPolygonalGeometry*(this: var vtkQWidgetRepresentation): vtkTypeBool {.
    importcpp: "HasTranslucentPolygonalGeometry",
    header: "vtkQWidgetRepresentation.h".}
type
  vtkQWidgetRepresentationInteractionStateType* {.size: sizeof(cint),
      importcpp: "vtkQWidgetRepresentation::InteractionStateType",
      header: "vtkQWidgetRepresentation.h".} = enum
    Outside = 0, Inside


## !!!Ignored construct:  # ! defined ( VTK_LEGACY_REMOVE ) [NewLine] VTK_DEPRECATED_IN_9_2_0 ( because leading underscore is reserved ) typedef InteractionStateType _InteractionState ;
## Error: identifier expected, but got: because leading underscore is reserved!!!

proc SetInteractionState*(this: var vtkQWidgetRepresentation; _arg: cint) {.
    importcpp: "SetInteractionState", header: "vtkQWidgetRepresentation.h".}
proc GetInteractionStateMinValue*(this: var vtkQWidgetRepresentation): cint {.
    importcpp: "GetInteractionStateMinValue", header: "vtkQWidgetRepresentation.h".}
proc GetInteractionStateMaxValue*(this: var vtkQWidgetRepresentation): cint {.
    importcpp: "GetInteractionStateMaxValue", header: "vtkQWidgetRepresentation.h".}
  ## /@}
  ## *
  ##  Set the QWidget this representation will render
  ##
proc SetWidget*(this: var vtkQWidgetRepresentation; w: ptr QWidget) {.
    importcpp: "SetWidget", header: "vtkQWidgetRepresentation.h".}
proc GetnameQWidgetTexture*(this: var vtkQWidgetRepresentation): ptr vtkQWidgetTexture {.
    importcpp: "GetnameQWidgetTexture", header: "vtkQWidgetRepresentation.h".}
  ## *
  ##  Get the vtkPlaneSouce used by this representation. This can be useful
  ##  to set the Origin, Point1, Point2 of the plane source directly.
  ##
proc GetnameQWidgetTexturePlaneSource*(this: var vtkQWidgetRepresentation): ptr vtkPlaneSource {.
    importcpp: "GetnameQWidgetTexturePlaneSource",
    header: "vtkQWidgetRepresentation.h".}
  ## *
  ##  Get the widget coordinates as computed in the last call to
  ##  ComputeComplexInteractionState.
  ##
## !!!Ignored construct:  virtual float * GetWidgetCoordinates ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << WidgetCoordinates  pointer  << this -> WidgetCoordinates ) ; return this -> WidgetCoordinates ; } VTK_WRAPEXCLUDE virtual void GetWidgetCoordinates ( float & _arg1 , float & _arg2 ) { _arg1 = this -> WidgetCoordinates [ 0 ] ; _arg2 = this -> WidgetCoordinates [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << WidgetCoordinates  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetWidgetCoordinates ( float _arg [ 2 ] ) { this -> GetWidgetCoordinates ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!
