## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPicker.h
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
##  @class   vtkPicker
##  @brief   superclass for 3D geometric pickers (uses ray cast)
##
##  vtkPicker is used to select instances of vtkProp3D by shooting a ray
##  into a graphics window and intersecting with the actor's bounding box.
##  The ray is defined from a point defined in window (or pixel) coordinates,
##  and a point located from the camera's position.
##
##  vtkPicker may return more than one vtkProp3D, since more than one bounding
##  box may be intersected. vtkPicker returns an unsorted list of props that
##  were hit, and a list of the corresponding world points of the hits.
##  For the vtkProp3D that is closest to the camera, vtkPicker returns the
##  pick coordinates in world and untransformed mapper space, the prop itself,
##  the data set, and the mapper.  For vtkPicker the closest prop is the one
##  whose center point (i.e., center of bounding box) projected on the view
##  ray is closest to the camera.  Subclasses of vtkPicker use other methods
##  for computing the pick point.
##
##  @sa
##  vtkPicker is used for quick geometric picking. If you desire more precise
##  picking of points or cells based on the geometry of any vtkProp3D, use the
##  subclasses vtkPointPicker or vtkCellPicker.  For hardware-accelerated
##  picking of any type of vtkProp, use vtkPropPicker or vtkWorldPointPicker.
##

import
  vtkAbstractPropPicker, vtkRenderingCoreModule

discard "forward decl of vtkAbstractMapper3D"
discard "forward decl of vtkCompositeDataSet"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkTransform"
discard "forward decl of vtkActorCollection"
discard "forward decl of vtkProp3DCollection"
discard "forward decl of vtkPoints"
type
  vtkPicker* {.importcpp: "vtkPicker", header: "vtkPicker.h", bycopy.} = object of vtkAbstractPropPicker
    vtkPicker* {.importc: "vtkPicker".}: VTK_NEWINSTANCE
    ##  tolerance for computation (% of window)
    ##  selection point in untransformed coordinates
    ##  selected mapper (if the prop has a mapper)
    ##  selected dataset (if there is one)
    ##  flat block index, for a composite data set
    ##  parametric coordinate along pick ray where hit occurred
    ##  use to perform ray transformation
    ##  candidate actors (based on bounding box)
    ##  candidate actors (based on bounding box)
    ##  candidate positions


proc New*(): ptr vtkPicker {.importcpp: "vtkPicker::New(@)", header: "vtkPicker.h".}
type
  vtkPickerSuperclass* = vtkAbstractPropPicker

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkPicker::IsTypeOf(@)",
    header: "vtkPicker.h".}
proc IsA*(this: var vtkPicker; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkPicker.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPicker {.
    importcpp: "vtkPicker::SafeDownCast(@)", header: "vtkPicker.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPicker :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractPropPicker :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPicker :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPicker :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPicker; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPicker.h".}
proc SetTolerance*(this: var vtkPicker; _arg: cdouble) {.importcpp: "SetTolerance",
    header: "vtkPicker.h".}
## !!!Ignored construct:  virtual double GetTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tolerance  of  << this -> Tolerance ) ; return this -> Tolerance ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Return position in mapper (i.e., non-transformed) coordinates of
##  pick point.
##  virtual double * GetMapperPositionMapperPosition ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << MapperPosition  pointer  << this -> MapperPosition ) ; return this -> MapperPosition ; } VTK_WRAPEXCLUDE virtual void GetMapperPositionMapperPosition ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> MapperPosition [ i ] ; } } ;
## Error: expected ';'!!!

proc GetnameMapper*(this: var vtkPicker): ptr vtkAbstractMapper3D {.
    importcpp: "GetnameMapper", header: "vtkPicker.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get a pointer to the dataset that was picked (if any). If nothing
  ##  was picked then NULL is returned.
  ##
proc GetnameMapperDataSet*(this: var vtkPicker): ptr vtkDataSet {.
    importcpp: "GetnameMapperDataSet", header: "vtkPicker.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get a pointer to the composite dataset that was picked (if any). If nothing
  ##  was picked or a non-composite data object was picked then NULL is returned.
  ##
proc GetnameMapperDataSetCompositeDataSet*(this: var vtkPicker): ptr vtkCompositeDataSet {.
    importcpp: "GetnameMapperDataSetCompositeDataSet", header: "vtkPicker.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the flat block index of the vtkDataSet in the composite dataset
  ##  that was picked (if any). If nothing
  ##  was picked or a non-composite data object was picked then -1 is returned.
  ##
## !!!Ignored construct:  virtual vtkIdType GetToleranceFlatBlockIndex ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FlatBlockIndex  of  << this -> FlatBlockIndex ) ; return this -> FlatBlockIndex ; } ;
## Error: expected ';'!!!

proc GetProp3Ds*(this: var vtkPicker): ptr vtkProp3DCollection {.
    importcpp: "GetProp3Ds", header: "vtkPicker.h".}
proc GetActors*(this: var vtkPicker): ptr vtkActorCollection {.importcpp: "GetActors",
    header: "vtkPicker.h".}
proc GetPickedPositions*(this: var vtkPicker): ptr vtkPoints {.
    importcpp: "GetPickedPositions", header: "vtkPicker.h".}
proc Pick*(this: var vtkPicker; selectionX: cdouble; selectionY: cdouble;
          selectionZ: cdouble; renderer: ptr vtkRenderer): cint {.importcpp: "Pick",
    header: "vtkPicker.h".}
proc Pick*(this: var vtkPicker; selectionPt: array[3, cdouble]; ren: ptr vtkRenderer): cint {.
    importcpp: "Pick", header: "vtkPicker.h".}
proc Pick3DPoint*(this: var vtkPicker; selectionPt: array[3, cdouble];
                 ren: ptr vtkRenderer): cint {.importcpp: "Pick3DPoint",
    header: "vtkPicker.h".}
proc Pick3DPoint*(this: var vtkPicker; p1World: array[3, cdouble];
                 p2World: array[3, cdouble]; ren: ptr vtkRenderer): cint {.
    importcpp: "Pick3DPoint", header: "vtkPicker.h".}
proc Pick3DRay*(this: var vtkPicker; selectionPt: array[3, cdouble];
               orient: array[4, cdouble]; ren: ptr vtkRenderer): cint {.
    importcpp: "Pick3DRay", header: "vtkPicker.h".}