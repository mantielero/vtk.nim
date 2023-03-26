## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkVolume.h
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
##  @class   vtkVolume
##  @brief   represents a volume (data & properties) in a rendered scene
##
##
##  vtkVolume is used to represent a volumetric entity in a rendering scene.
##  It inherits functions related to the volume's position, orientation and
##  origin from vtkProp3D. The volume maintains a reference to the
##  volumetric data (i.e., the volume mapper). The volume also contains a
##  reference to a volume property which contains all common volume rendering
##  parameters.
##
##  @sa
##  vtkAbstractVolumeMapper vtkVolumeProperty vtkProp3D
##

import
  vtkProp3D, vtkRenderingCoreModule

discard "forward decl of vtkRenderer"
discard "forward decl of vtkPropCollection"
discard "forward decl of vtkVolumeCollection"
discard "forward decl of vtkWindow"
discard "forward decl of vtkVolumeProperty"
discard "forward decl of vtkAbstractVolumeMapper"
type
  vtkVolume* {.importcpp: "vtkVolume", header: "vtkVolume.h", bycopy.} = object of vtkProp3D
    vtkVolume* {.importc: "vtkVolume".}: VTK_NEWINSTANCE
    ##  The rgb transfer function array - for unsigned char data this
    ##  is 256 elements, for short or unsigned short it is 65536 elements
    ##  This is a sample at each scalar value of the rgb transfer
    ##  function.  A time stamp is kept to know when it needs rebuilding
    ##  The gray transfer function array - for unsigned char data this
    ##  is 256 elements, for short or unsigned short it is 65536 elements
    ##  This is a sample at each scalar value of the gray transfer
    ##  function.  A time stamp is kept to know when it needs rebuilding
    ##  The scalar opacity transfer function array - for unsigned char data this
    ##  is 256 elements, for short or unsigned short it is 65536 elements
    ##  This is a sample at each scalar value of the opacity transfer
    ##  function.  A time stamp is kept to know when it needs rebuilding
    ##  The corrected scalar opacity transfer function array - this is identical
    ##  to the opacity transfer function array when the step size is 1.
    ##  In other cases, it is corrected to reflect the new material thickness
    ##  modelled by a step size different than 1.
    ##  CorrectedStepSize is the step size currently modelled by
    ##  CorrectedArray.  It is used to determine when the
    ##  CorrectedArray needs to be updated to match SampleDistance
    ##  in the volume mapper.
    ##  Number of elements in the rgb, gray, and opacity transfer function arrays
    ##  The magnitude of gradient opacity transfer function array
    ##  Function to compute screen coverage of this volume

  vtkVolumeSuperclass* = vtkProp3D

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkVolume::IsTypeOf(@)",
    header: "vtkVolume.h".}
proc IsA*(this: var vtkVolume; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkVolume.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkVolume {.
    importcpp: "vtkVolume::SafeDownCast(@)", header: "vtkVolume.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkVolume :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkProp3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkVolume :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkVolume :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkVolume; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkVolume.h".}
proc New*(): ptr vtkVolume {.importcpp: "vtkVolume::New(@)", header: "vtkVolume.h".}
proc SetMapper*(this: var vtkVolume; mapper: ptr vtkAbstractVolumeMapper) {.
    importcpp: "SetMapper", header: "vtkVolume.h".}
proc GetnameMapper*(this: var vtkVolume): ptr vtkAbstractVolumeMapper {.
    importcpp: "GetnameMapper", header: "vtkVolume.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the volume property.
  ##
proc SetProperty*(this: var vtkVolume; property: ptr vtkVolumeProperty) {.
    importcpp: "SetProperty", header: "vtkVolume.h".}
proc GetProperty*(this: var vtkVolume): ptr vtkVolumeProperty {.
    importcpp: "GetProperty", header: "vtkVolume.h".}
proc GetVolumes*(this: var vtkVolume; vc: ptr vtkPropCollection) {.
    importcpp: "GetVolumes", header: "vtkVolume.h".}
proc Update*(this: var vtkVolume) {.importcpp: "Update", header: "vtkVolume.h".}
## !!!Ignored construct:  /@{ *
##  Get the bounds - either all six at once
##  (xmin, xmax, ymin, ymax, zmin, zmax) or one at a time.
##  double * GetBounds ( ) VTK_SIZEHINT ( 6 ) override ;
## Error: expected ';'!!!

proc GetBounds*(this: var vtkVolume; bounds: array[6, cdouble]) {.
    importcpp: "GetBounds", header: "vtkVolume.h".}
proc GetMinXBound*(this: var vtkVolume): cdouble {.importcpp: "GetMinXBound",
    header: "vtkVolume.h".}
proc GetMaxXBound*(this: var vtkVolume): cdouble {.importcpp: "GetMaxXBound",
    header: "vtkVolume.h".}
proc GetMinYBound*(this: var vtkVolume): cdouble {.importcpp: "GetMinYBound",
    header: "vtkVolume.h".}
proc GetMaxYBound*(this: var vtkVolume): cdouble {.importcpp: "GetMaxYBound",
    header: "vtkVolume.h".}
proc GetMinZBound*(this: var vtkVolume): cdouble {.importcpp: "GetMinZBound",
    header: "vtkVolume.h".}
proc GetMaxZBound*(this: var vtkVolume): cdouble {.importcpp: "GetMaxZBound",
    header: "vtkVolume.h".}
proc GetMTime*(this: var vtkVolume): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkVolume.h".}
proc GetRedrawMTime*(this: var vtkVolume): vtkMTimeType {.
    importcpp: "GetRedrawMTime", header: "vtkVolume.h".}
proc ShallowCopy*(this: var vtkVolume; prop: ptr vtkProp) {.importcpp: "ShallowCopy",
    header: "vtkVolume.h".}
proc RenderVolumetricGeometry*(this: var vtkVolume; viewport: ptr vtkViewport): cint {.
    importcpp: "RenderVolumetricGeometry", header: "vtkVolume.h".}
proc ReleaseGraphicsResources*(this: var vtkVolume; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkVolume.h".}
proc GetCorrectedScalarOpacityArray*(this: var vtkVolume; a2: cint): ptr cfloat {.
    importcpp: "GetCorrectedScalarOpacityArray", header: "vtkVolume.h".}
proc GetCorrectedScalarOpacityArray*(this: var vtkVolume): ptr cfloat {.
    importcpp: "GetCorrectedScalarOpacityArray", header: "vtkVolume.h".}
proc GetScalarOpacityArray*(this: var vtkVolume; a2: cint): ptr cfloat {.
    importcpp: "GetScalarOpacityArray", header: "vtkVolume.h".}
proc GetScalarOpacityArray*(this: var vtkVolume): ptr cfloat {.
    importcpp: "GetScalarOpacityArray", header: "vtkVolume.h".}
proc GetGradientOpacityArray*(this: var vtkVolume; a2: cint): ptr cfloat {.
    importcpp: "GetGradientOpacityArray", header: "vtkVolume.h".}
proc GetGradientOpacityArray*(this: var vtkVolume): ptr cfloat {.
    importcpp: "GetGradientOpacityArray", header: "vtkVolume.h".}
proc GetGrayArray*(this: var vtkVolume; a2: cint): ptr cfloat {.
    importcpp: "GetGrayArray", header: "vtkVolume.h".}
proc GetGrayArray*(this: var vtkVolume): ptr cfloat {.importcpp: "GetGrayArray",
    header: "vtkVolume.h".}
proc GetRGBArray*(this: var vtkVolume; a2: cint): ptr cfloat {.importcpp: "GetRGBArray",
    header: "vtkVolume.h".}
proc GetRGBArray*(this: var vtkVolume): ptr cfloat {.importcpp: "GetRGBArray",
    header: "vtkVolume.h".}
proc GetGradientOpacityConstant*(this: var vtkVolume; a2: cint): cfloat {.
    importcpp: "GetGradientOpacityConstant", header: "vtkVolume.h".}
proc GetGradientOpacityConstant*(this: var vtkVolume): cfloat {.
    importcpp: "GetGradientOpacityConstant", header: "vtkVolume.h".}
proc GetArraySize*(this: var vtkVolume): cfloat {.importcpp: "GetArraySize",
    header: "vtkVolume.h".}
proc UpdateTransferFunctions*(this: var vtkVolume; ren: ptr vtkRenderer) {.
    importcpp: "UpdateTransferFunctions", header: "vtkVolume.h".}
proc UpdateScalarOpacityforSampleSize*(this: var vtkVolume; ren: ptr vtkRenderer;
                                      sample_distance: cfloat) {.
    importcpp: "UpdateScalarOpacityforSampleSize", header: "vtkVolume.h".}
proc GetSupportsSelection*(this: var vtkVolume): bool {.
    importcpp: "GetSupportsSelection", header: "vtkVolume.h".}