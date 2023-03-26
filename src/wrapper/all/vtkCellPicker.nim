## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCellPicker.h
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
##  @class   vtkCellPicker
##  @brief   ray-cast cell picker for all kinds of Prop3Ds
##
##  vtkCellPicker will shoot a ray into a 3D scene and return information
##  about the first object that the ray hits.  It works for all Prop3Ds.
##  For vtkVolume objects, it shoots a ray into the volume and returns
##  the point where the ray intersects an isosurface of a chosen opacity.
##  For vtkImage objects, it intersects the ray with the displayed
##  slice. For vtkActor objects, it intersects the actor's polygons.
##  If the object's mapper has ClippingPlanes, then it takes the clipping
##  into account, and will return the Id of the clipping plane that was
##  intersected.
##  For all prop types, it returns point and cell information, plus the
##  normal of the surface that was intersected at the pick position.  For
##  volumes and images, it also returns (i,j,k) coordinates for the point
##  and the cell that were picked.
##
##  @sa
##  vtkPicker vtkPointPicker vtkVolumePicker
##
##  @par Thanks:
##  This class was contributed to VTK by David Gobbi on behalf of Atamai Inc.,
##  as an enhancement to the original vtkCellPicker.
##

import
  vtkPicker, vtkRenderingCoreModule

discard "forward decl of vtkMapper"
discard "forward decl of vtkTexture"
discard "forward decl of vtkAbstractHyperTreeGridMapper"
discard "forward decl of vtkAbstractVolumeMapper"
discard "forward decl of vtkImageMapper3D"
discard "forward decl of vtkPlaneCollection"
discard "forward decl of vtkPiecewiseFunction"
discard "forward decl of vtkDataArray"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkIdList"
discard "forward decl of vtkCell"
discard "forward decl of vtkGenericCell"
discard "forward decl of vtkImageData"
discard "forward decl of vtkAbstractCellLocator"
discard "forward decl of vtkCollection"
discard "forward decl of vtkMatrix4x4"
discard "forward decl of vtkBitArray"
discard "forward decl of vtkHyperTreeGridNonOrientedGeometryCursor"
type
  vtkCellPicker* {.importcpp: "vtkCellPicker", header: "vtkCellPicker.h", bycopy.} = object of vtkPicker
    vtkCellPicker* {.importc: "vtkCellPicker".}: VTK_NEWINSTANCE
    ##  used to accelerate picking
    ##  used to accelerate picking
    ##  used in volume picking


proc New*(): ptr vtkCellPicker {.importcpp: "vtkCellPicker::New(@)",
                             header: "vtkCellPicker.h".}
type
  vtkCellPickerSuperclass* = vtkPicker

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCellPicker::IsTypeOf(@)", header: "vtkCellPicker.h".}
proc IsA*(this: var vtkCellPicker; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkCellPicker.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCellPicker {.
    importcpp: "vtkCellPicker::SafeDownCast(@)", header: "vtkCellPicker.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCellPicker :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPicker :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCellPicker :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCellPicker :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCellPicker; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCellPicker.h".}
proc Pick*(this: var vtkCellPicker; selectionX: cdouble; selectionY: cdouble;
          selectionZ: cdouble; renderer: ptr vtkRenderer): cint {.importcpp: "Pick",
    header: "vtkCellPicker.h".}
proc Pick3DRay*(this: var vtkCellPicker; selectionPt: array[3, cdouble];
               orient: array[4, cdouble]; ren: ptr vtkRenderer): cint {.
    importcpp: "Pick3DRay", header: "vtkCellPicker.h".}
proc AddLocator*(this: var vtkCellPicker; locator: ptr vtkAbstractCellLocator) {.
    importcpp: "AddLocator", header: "vtkCellPicker.h".}
proc RemoveLocator*(this: var vtkCellPicker; locator: ptr vtkAbstractCellLocator) {.
    importcpp: "RemoveLocator", header: "vtkCellPicker.h".}
proc RemoveAllLocators*(this: var vtkCellPicker) {.importcpp: "RemoveAllLocators",
    header: "vtkCellPicker.h".}
proc SetVolumeOpacityIsovalue*(this: var vtkCellPicker; _arg: cdouble) {.
    importcpp: "SetVolumeOpacityIsovalue", header: "vtkCellPicker.h".}
## !!!Ignored construct:  virtual double GetVolumeOpacityIsovalue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VolumeOpacityIsovalue  of  << this -> VolumeOpacityIsovalue ) ; return this -> VolumeOpacityIsovalue ; } ;
## Error: expected ';'!!!

proc SetVolumeOpacityIsovalueUseVolumeGradientOpacity*(this: var vtkCellPicker;
    _arg: vtkTypeBool) {.importcpp: "SetVolumeOpacityIsovalueUseVolumeGradientOpacity",
                       header: "vtkCellPicker.h".}
proc UseVolumeGradientOpacityOn*(this: var vtkCellPicker) {.
    importcpp: "UseVolumeGradientOpacityOn", header: "vtkCellPicker.h".}
proc UseVolumeGradientOpacityOff*(this: var vtkCellPicker) {.
    importcpp: "UseVolumeGradientOpacityOff", header: "vtkCellPicker.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetVolumeOpacityIsovalueUseVolumeGradientOpacity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseVolumeGradientOpacity  of  << this -> UseVolumeGradientOpacity ) ; return this -> UseVolumeGradientOpacity ; } ;
## Error: expected ';'!!!

proc SetVolumeOpacityIsovalueUseVolumeGradientOpacityPickClippingPlanes*(
    this: var vtkCellPicker; _arg: vtkTypeBool) {.importcpp: "SetVolumeOpacityIsovalueUseVolumeGradientOpacityPickClippingPlanes",
    header: "vtkCellPicker.h".}
proc PickClippingPlanesOn*(this: var vtkCellPicker) {.
    importcpp: "PickClippingPlanesOn", header: "vtkCellPicker.h".}
proc PickClippingPlanesOff*(this: var vtkCellPicker) {.
    importcpp: "PickClippingPlanesOff", header: "vtkCellPicker.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetVolumeOpacityIsovalueUseVolumeGradientOpacityPickClippingPlanes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PickClippingPlanes  of  << this -> PickClippingPlanes ) ; return this -> PickClippingPlanes ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get the index of the clipping plane that was intersected during
##  the pick.  This will be set regardless of whether PickClippingPlanes
##  is On, all that is required is that the pick intersected a clipping
##  plane of the Prop3D that was picked.  The result will be -1 if the
##  Prop3D that was picked has no clipping planes, or if the ray didn't
##  intersect the planes.
##  virtual int GetVolumeOpacityIsovalueUseVolumeGradientOpacityPickClippingPlanesClippingPlaneIdClippingPlaneId ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ClippingPlaneId  of  << this -> ClippingPlaneId ) ; return this -> ClippingPlaneId ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Return the normal of the picked surface at the PickPosition.  If no
##  surface was picked, then a vector pointing back at the camera is
##  returned.
##  virtual double * GetPickNormalPickNormal ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << PickNormal  pointer  << this -> PickNormal ) ; return this -> PickNormal ; } VTK_WRAPEXCLUDE virtual void GetPickNormalPickNormal ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> PickNormal [ i ] ; } } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Return the normal of the surface at the PickPosition in mapper
##  coordinates.  The result is undefined if no prop was picked.
##  virtual double * GetMapperNormalMapperNormal ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << MapperNormal  pointer  << this -> MapperNormal ) ; return this -> MapperNormal ; } VTK_WRAPEXCLUDE virtual void GetMapperNormalMapperNormal ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> MapperNormal [ 0 ] ; _arg2 = this -> MapperNormal [ 1 ] ; _arg3 = this -> MapperNormal [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << MapperNormal  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetMapperNormalMapperNormal ( double _arg [ 3 ] ) { this -> GetMapperNormalMapperNormal ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get the structured coordinates of the point at the PickPosition.
##  Only valid for image actors and volumes with vtkImageData.
##  virtual int * GetMapperNormalMapperNormalPointIJKPointIJK ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << PointIJK  pointer  << this -> PointIJK ) ; return this -> PointIJK ; } VTK_WRAPEXCLUDE virtual void GetMapperNormalMapperNormalPointIJKPointIJK ( int & _arg1 , int & _arg2 , int & _arg3 ) { _arg1 = this -> PointIJK [ 0 ] ; _arg2 = this -> PointIJK [ 1 ] ; _arg3 = this -> PointIJK [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << PointIJK  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetMapperNormalMapperNormalPointIJKPointIJK ( int _arg [ 3 ] ) { this -> GetMapperNormalMapperNormalPointIJKPointIJK ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get the structured coordinates of the cell at the PickPosition.
##  Only valid for image actors and volumes with vtkImageData.
##  Combine this with the PCoords to get the position within the cell.
##  virtual int * GetMapperNormalMapperNormalPointIJKPointIJKCellIJKCellIJK ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << CellIJK  pointer  << this -> CellIJK ) ; return this -> CellIJK ; } VTK_WRAPEXCLUDE virtual void GetMapperNormalMapperNormalPointIJKPointIJKCellIJKCellIJK ( int & _arg1 , int & _arg2 , int & _arg3 ) { _arg1 = this -> CellIJK [ 0 ] ; _arg2 = this -> CellIJK [ 1 ] ; _arg3 = this -> CellIJK [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << CellIJK  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetMapperNormalMapperNormalPointIJKPointIJKCellIJKCellIJK ( int _arg [ 3 ] ) { this -> GetMapperNormalMapperNormalPointIJKPointIJKCellIJKCellIJK ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get the id of the picked point. If PointId = -1, nothing was picked.
##  This point will be a member of any cell that is picked.
##  virtual vtkIdType GetVolumeOpacityIsovalueUseVolumeGradientOpacityPickClippingPlanesClippingPlaneIdClippingPlaneIdPointIdPointId ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PointId  of  << this -> PointId ) ; return this -> PointId ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get the id of the picked cell. If CellId = -1, nothing was picked.
##  virtual vtkIdType GetVolumeOpacityIsovalueUseVolumeGradientOpacityPickClippingPlanesClippingPlaneIdClippingPlaneIdPointIdPointIdCellIdCellId ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CellId  of  << this -> CellId ) ; return this -> CellId ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get the subId of the picked cell. This is useful, for example, if
##  the data is made of triangle strips. If SubId = -1, nothing was picked.
##  virtual int GetVolumeOpacityIsovalueUseVolumeGradientOpacityPickClippingPlanesClippingPlaneIdClippingPlaneIdPointIdPointIdCellIdCellIdSubIdSubId ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SubId  of  << this -> SubId ) ; return this -> SubId ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get the parametric coordinates of the picked cell. Only valid if
##  a prop was picked.  The PCoords can be used to compute the weights
##  that are needed to interpolate data values within the cell.
##  virtual double * GetMapperNormalMapperNormalPointIJKPointIJKCellIJKCellIJKPCoordsPCoords ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << PCoords  pointer  << this -> PCoords ) ; return this -> PCoords ; } VTK_WRAPEXCLUDE virtual void GetMapperNormalMapperNormalPointIJKPointIJKCellIJKCellIJKPCoordsPCoords ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> PCoords [ 0 ] ; _arg2 = this -> PCoords [ 1 ] ; _arg3 = this -> PCoords [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << PCoords  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetMapperNormalMapperNormalPointIJKPointIJKCellIJKCellIJKPCoordsPCoords ( double _arg [ 3 ] ) { this -> GetMapperNormalMapperNormalPointIJKPointIJKCellIJKCellIJKPCoordsPCoords ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc GetTexture*(this: var vtkCellPicker): ptr vtkTexture {.importcpp: "GetTexture",
    header: "vtkCellPicker.h".}
proc SetVolumeOpacityIsovalueUseVolumeGradientOpacityPickClippingPlanesPickTextureData*(
    this: var vtkCellPicker; _arg: vtkTypeBool) {.importcpp: "SetVolumeOpacityIsovalueUseVolumeGradientOpacityPickClippingPlanesPickTextureData",
    header: "vtkCellPicker.h".}
proc PickTextureDataOn*(this: var vtkCellPicker) {.importcpp: "PickTextureDataOn",
    header: "vtkCellPicker.h".}
proc PickTextureDataOff*(this: var vtkCellPicker) {.importcpp: "PickTextureDataOff",
    header: "vtkCellPicker.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetVolumeOpacityIsovalueUseVolumeGradientOpacityPickClippingPlanesClippingPlaneIdClippingPlaneIdPointIdPointIdCellIdCellIdSubIdSubIdPickTextureData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PickTextureData  of  << this -> PickTextureData ) ; return this -> PickTextureData ; } ;
## Error: expected ';'!!!
