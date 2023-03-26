## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHardwarePicker.h
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
##  @class   vtkHardwarePicker
##  @brief   pick a point or snap to point of an actor/prop using graphics hardware
##
##  vtkHardwarePicker is used to pick point or snap to point of an actor/prop given a selection
##  point (in display coordinates) and a renderer. This class uses graphics hardware/rendering
##  system to pick rapidly (as compared to using ray casting as does vtkCellPicker and
##  vtkPointPicker). This class determines the actor/prop pick position, and pick normal in world
##  coordinates; pointId is determined if snapping is enabled, otherwise the cellId is determined.
##  if no actor/prop is picked, pick position = camera focal point, and pick normal = camera plane
##  normal.
##
##  @warning This class supports only picking in a screen, and not in VR.
##
##  @sa
##  vtkPropPicker vtkPicker vtkWorldPointPicker vtkCellPicker vtkPointPicker
##

import
  vtkAbstractPropPicker, vtkNew, vtkRenderingCoreModule, vtkSmartPointer

discard "forward decl of vtkAbstractMapper3D"
discard "forward decl of vtkCell"
discard "forward decl of vtkCompositeDataSet"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkSelection"
type
  vtkHardwarePicker* {.importcpp: "vtkHardwarePicker",
                      header: "vtkHardwarePicker.h", bycopy.} = object of vtkAbstractPropPicker
    vtkHardwarePicker* {.importc: "vtkHardwarePicker".}: VTK_NEWINSTANCE
    ##  if true, the pick position is snapped to the closest point on the mesh
    ##  tolerance for picking when snapping the closest point on the mesh
    ##  list of pickable props
    ##  result of the hardware selector
    ##  near ray point
    ##  far ray point
    ##  selected mapper (if the prop has a mapper)
    ##  selected dataset (if there is one)
    ##  selected dataset (if there is one)
    ##  flat block index, for a composite data set
    ##  id of the picked point
    ##  id of the picked cell
    ##  sub id of the picked cell
    ##  parametric coordinates of the picked point
    ##  normal of the picked surface
    ##  Flag to indicate if the normal has been flipped


proc New*(): ptr vtkHardwarePicker {.importcpp: "vtkHardwarePicker::New(@)",
                                 header: "vtkHardwarePicker.h".}
type
  vtkHardwarePickerSuperclass* = vtkAbstractPropPicker

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkHardwarePicker::IsTypeOf(@)", header: "vtkHardwarePicker.h".}
proc IsA*(this: var vtkHardwarePicker; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkHardwarePicker.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkHardwarePicker {.
    importcpp: "vtkHardwarePicker::SafeDownCast(@)", header: "vtkHardwarePicker.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkHardwarePicker :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractPropPicker :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHardwarePicker :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHardwarePicker :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkHardwarePicker; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkHardwarePicker.h".}
proc SetSnapToMeshPoint*(this: var vtkHardwarePicker; _arg: bool) {.
    importcpp: "SetSnapToMeshPoint", header: "vtkHardwarePicker.h".}
## !!!Ignored construct:  virtual bool GetSnapToMeshPoint ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SnapToMeshPoint  of  << this -> SnapToMeshPoint ) ; return this -> SnapToMeshPoint ; } ;
## Error: expected ';'!!!

proc SnapToMeshPointOn*(this: var vtkHardwarePicker) {.
    importcpp: "SnapToMeshPointOn", header: "vtkHardwarePicker.h".}
proc SnapToMeshPointOff*(this: var vtkHardwarePicker) {.
    importcpp: "SnapToMeshPointOff", header: "vtkHardwarePicker.h".}
  ## /@}
  ## /@{
  ## *
  ##  When SnapToMeshPoint is on, this is the pixel tolerance to use when snapping.
  ##  Default is 5.
  ##
proc SetSnapToMeshPointPixelTolerance*(this: var vtkHardwarePicker; _arg: cint) {.
    importcpp: "SetSnapToMeshPointPixelTolerance", header: "vtkHardwarePicker.h".}
## !!!Ignored construct:  virtual int GetSnapToMeshPointPixelTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PixelTolerance  of  << this -> PixelTolerance ) ; return this -> PixelTolerance ; } ;
## Error: expected ';'!!!

proc GetnameMapper*(this: var vtkHardwarePicker): ptr vtkAbstractMapper3D {.
    importcpp: "GetnameMapper", header: "vtkHardwarePicker.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get a pointer to the dataset that was picked (if any). If nothing
  ##  was picked then nullptr is returned.
  ##
  ##  Note: Use vtkWeakPointer. This is because the DataSet may be deleted.
  ##
proc GetnameMapperDataSet*(this: var vtkHardwarePicker): ptr vtkDataSet {.
    importcpp: "GetnameMapperDataSet", header: "vtkHardwarePicker.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get a pointer to the composite dataset that was picked (if any). If nothing
  ##  was picked or a non-composite data object was picked then nullptr is returned.
  ##
  ##  Note: Use vtkWeakPointer. This is because the CompositeDataSet may be deleted.
  ##
proc GetnameMapperDataSetCompositeDataSet*(this: var vtkHardwarePicker): ptr vtkCompositeDataSet {.
    importcpp: "GetnameMapperDataSetCompositeDataSet",
    header: "vtkHardwarePicker.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the flat block index of the vtkDataSet in the composite dataset
  ##  that was picked (if any). If nothing was picked or a non-composite
  ##  data object was picked then -1 is returned.
  ##
## !!!Ignored construct:  virtual vtkIdType GetSnapToMeshPointPixelToleranceFlatBlockIndex ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FlatBlockIndex  of  << this -> FlatBlockIndex ) ; return this -> FlatBlockIndex ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get the id of the picked point.
##
##  If a prop is picked:
##
##  1) if SnapOnMeshPoint is on, the pointId of the prop's dataset will be returned
##  2) If SnapOnMeshPoint is off, PointId = -1;
##
##  If a prop is not picked, PointId = -1;
##  virtual vtkIdType GetSnapToMeshPointPixelToleranceFlatBlockIndexPointIdPointId ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PointId  of  << this -> PointId ) ; return this -> PointId ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get the id of the picked cell.
##
##  If a prop is picked:
##
##  1) If SnapOnMeshPoint is on, CellId = -1.
##  2) If SnapOnMeshPoint is off, the cellId of the prop's dataset will be returned
##
##  if a prop is not picked, CellId = -1.
##  virtual vtkIdType GetSnapToMeshPointPixelToleranceFlatBlockIndexPointIdPointIdCellIdCellId ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CellId  of  << this -> CellId ) ; return this -> CellId ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get the subId of the picked cell. This is useful, for example, if
##  the data is made of triangle strips.
##
##  If a prop is picked:
##
##  1) If SnapOnMeshPoint is on, SubId = -1.
##  2) If SnapOnMeshPoint is off and the picked cell is a triangle strip, the subId of the
##  intersected triangle will be returned, otherwise SubId = -1.
##
##  If a prop is not picked, SubId = -1.
##  virtual int GetSnapToMeshPointPixelToleranceFlatBlockIndexPointIdPointIdCellIdCellIdSubIdSubId ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SubId  of  << this -> SubId ) ; return this -> SubId ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get the parametric coordinates of the picked cell. PCoords can be used to compute the
##  weights that are needed to interpolate data values within the cell.
##
##  If a prop is picked:
##
##  1) If SnapOnMeshPoint is on, PCoords will be a vector of
##  std::numeric_limits<double>::quiet_NaN().
##  2) If SnapOnMeshPoint is off, PCoords will be extracted and the intersection point of the cell.
##
##  if a prop is not picked, PCoords will be a vector of std::numeric_limits<double>::quiet_NaN().
##  virtual double * GetPCoordsPCoords ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << PCoords  pointer  << this -> PCoords ) ; return this -> PCoords ; } VTK_WRAPEXCLUDE virtual void GetPCoordsPCoords ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> PCoords [ 0 ] ; _arg2 = this -> PCoords [ 1 ] ; _arg3 = this -> PCoords [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << PCoords  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetPCoordsPCoords ( double _arg [ 3 ] ) { this -> GetPCoordsPCoords ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get the normal of the point at the PickPosition.
##
##  If a prop is picked:
##
##  1) If SnapOnMeshPoint is on, the picked normal will be extracted from the PointData normals, if
##  they exist, otherwise a vector of std::numeric_limits<double>::quiet_NaN() will be returned.
##  2) If SnapOnMeshPoint is off, the picked normal on the intersected cell will be extracted using
##  ray intersection, if the ray intersections was successful, otherwise a vector of
##  std::numeric_limits<double>::quiet_NaN() will be returned.
##
##  if a prop is not picked, the camera plane normal will be returned will be returned.
##  virtual double * GetPickNormalPickNormal ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << PickNormal  pointer  << this -> PickNormal ) ; return this -> PickNormal ; } VTK_WRAPEXCLUDE virtual void GetPickNormalPickNormal ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> PickNormal [ i ] ; } } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} *
##  Get if normal is flipped.
##
##  The normal will be flipped if point normals don't exist and the angle between the PickedNormal
##  and the camera plane normal is more than pi / 2.
##  virtual bool GetSnapToMeshPointPixelToleranceFlatBlockIndexPointIdPointIdCellIdCellIdSubIdSubIdNormalFlippedNormalFlipped ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NormalFlipped  of  << this -> NormalFlipped ) ; return this -> NormalFlipped ; } ;
## Error: expected ';'!!!

proc Pick*(this: var vtkHardwarePicker; selectionX: cdouble; selectionY: cdouble;
          selectionZ: cdouble; renderer: ptr vtkRenderer): cint {.importcpp: "Pick",
    header: "vtkHardwarePicker.h".}