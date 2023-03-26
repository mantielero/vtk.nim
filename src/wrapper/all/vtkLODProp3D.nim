## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLODProp3D.h
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
##  @class   vtkLODProp3D
##  @brief   level of detail 3D prop
##
##  vtkLODProp3D is a class to support level of detail rendering for Prop3D.
##  Any number of mapper/property/texture items can be added to this object.
##  Render time will be measured, and will be used to select a LOD based on
##  the AllocatedRenderTime of this Prop3D. Depending on the type of the
##  mapper/property, a vtkActor or a vtkVolume will be created behind the
##  scenes.
##
##  @sa
##  vtkProp3D vtkActor vtkVolume vtkLODActor
##

import
  vtkProp3D, vtkRenderingCoreModule

discard "forward decl of vtkRenderer"
discard "forward decl of vtkMapper"
discard "forward decl of vtkAbstractVolumeMapper"
discard "forward decl of vtkAbstractMapper3D"
discard "forward decl of vtkImageMapper3D"
discard "forward decl of vtkProperty"
discard "forward decl of vtkVolumeProperty"
discard "forward decl of vtkImageProperty"
discard "forward decl of vtkTexture"
discard "forward decl of vtkLODProp3DCallback"
type
  vtkLODProp3DEntry_t* {.importcpp: "vtkLODProp3DEntry_t",
                        header: "vtkLODProp3D.h", bycopy.} = object
    Prop3D* {.importc: "Prop3D".}: ptr vtkProp3D
    Prop3DType* {.importc: "Prop3DType".}: cint
    ID* {.importc: "ID".}: cint
    EstimatedTime* {.importc: "EstimatedTime".}: cdouble
    State* {.importc: "State".}: cint
    Level* {.importc: "Level".}: cdouble

  vtkLODProp3DEntry* = vtkLODProp3DEntry_t

## ignored statement

type
  vtkLODProp3D* {.importcpp: "vtkLODProp3D", header: "vtkLODProp3D.h", bycopy.} = object of vtkProp3D ## *
                                                                                            ##  Create an instance of this class.
                                                                                            ##
    vtkLODProp3D* {.importc: "vtkLODProp3D".}: VTK_NEWINSTANCE


proc New*(): ptr vtkLODProp3D {.importcpp: "vtkLODProp3D::New(@)",
                            header: "vtkLODProp3D.h".}
type
  vtkLODProp3DSuperclass* = vtkProp3D

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkLODProp3D::IsTypeOf(@)", header: "vtkLODProp3D.h".}
proc IsA*(this: var vtkLODProp3D; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkLODProp3D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkLODProp3D {.
    importcpp: "vtkLODProp3D::SafeDownCast(@)", header: "vtkLODProp3D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkLODProp3D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkProp3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLODProp3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLODProp3D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkLODProp3D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkLODProp3D.h".}
## !!!Ignored construct:  *
##  Standard vtkProp method to get 3D bounds of a 3D prop
##  double * GetBounds ( ) VTK_SIZEHINT ( 6 ) override ;
## Error: expected ';'!!!

proc GetBounds*(this: var vtkLODProp3D; bounds: array[6, cdouble]) {.
    importcpp: "GetBounds", header: "vtkLODProp3D.h".}
proc AddLOD*(this: var vtkLODProp3D; m: ptr vtkMapper; p: ptr vtkProperty;
            back: ptr vtkProperty; t: ptr vtkTexture; time: cdouble): cint {.
    importcpp: "AddLOD", header: "vtkLODProp3D.h".}
proc AddLOD*(this: var vtkLODProp3D; m: ptr vtkMapper; p: ptr vtkProperty;
            t: ptr vtkTexture; time: cdouble): cint {.importcpp: "AddLOD",
    header: "vtkLODProp3D.h".}
proc AddLOD*(this: var vtkLODProp3D; m: ptr vtkMapper; p: ptr vtkProperty;
            back: ptr vtkProperty; time: cdouble): cint {.importcpp: "AddLOD",
    header: "vtkLODProp3D.h".}
proc AddLOD*(this: var vtkLODProp3D; m: ptr vtkMapper; p: ptr vtkProperty; time: cdouble): cint {.
    importcpp: "AddLOD", header: "vtkLODProp3D.h".}
proc AddLOD*(this: var vtkLODProp3D; m: ptr vtkMapper; t: ptr vtkTexture; time: cdouble): cint {.
    importcpp: "AddLOD", header: "vtkLODProp3D.h".}
proc AddLOD*(this: var vtkLODProp3D; m: ptr vtkMapper; time: cdouble): cint {.
    importcpp: "AddLOD", header: "vtkLODProp3D.h".}
proc AddLOD*(this: var vtkLODProp3D; m: ptr vtkAbstractVolumeMapper;
            p: ptr vtkVolumeProperty; time: cdouble): cint {.importcpp: "AddLOD",
    header: "vtkLODProp3D.h".}
proc AddLOD*(this: var vtkLODProp3D; m: ptr vtkAbstractVolumeMapper; time: cdouble): cint {.
    importcpp: "AddLOD", header: "vtkLODProp3D.h".}
proc AddLOD*(this: var vtkLODProp3D; m: ptr vtkImageMapper3D; p: ptr vtkImageProperty;
            time: cdouble): cint {.importcpp: "AddLOD", header: "vtkLODProp3D.h".}
proc AddLOD*(this: var vtkLODProp3D; m: ptr vtkImageMapper3D; time: cdouble): cint {.
    importcpp: "AddLOD", header: "vtkLODProp3D.h".}
## !!!Ignored construct:  /@} /@{ *
##  Get the current number of LODs.
##  virtual int GetNumberOfLODsNumberOfLODs ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfLODs  of  << this -> NumberOfLODs ) ; return this -> NumberOfLODs ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get the current index, used to determine the ID of the next LOD that is
##  added.  Useful for guessing what IDs have been used (with NumberOfLODs,
##  without depending on the constructor initialization to 1000.
##  virtual int GetNumberOfLODsNumberOfLODsCurrentIndexCurrentIndex ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CurrentIndex  of  << this -> CurrentIndex ) ; return this -> CurrentIndex ; } ;
## Error: expected ';'!!!

proc RemoveLOD*(this: var vtkLODProp3D; id: cint) {.importcpp: "RemoveLOD",
    header: "vtkLODProp3D.h".}
proc SetLODProperty*(this: var vtkLODProp3D; id: cint; p: ptr vtkProperty) {.
    importcpp: "SetLODProperty", header: "vtkLODProp3D.h".}
proc GetLODProperty*(this: var vtkLODProp3D; id: cint; p: ptr ptr vtkProperty) {.
    importcpp: "GetLODProperty", header: "vtkLODProp3D.h".}
proc SetLODProperty*(this: var vtkLODProp3D; id: cint; p: ptr vtkVolumeProperty) {.
    importcpp: "SetLODProperty", header: "vtkLODProp3D.h".}
proc GetLODProperty*(this: var vtkLODProp3D; id: cint; p: ptr ptr vtkVolumeProperty) {.
    importcpp: "GetLODProperty", header: "vtkLODProp3D.h".}
proc SetLODProperty*(this: var vtkLODProp3D; id: cint; p: ptr vtkImageProperty) {.
    importcpp: "SetLODProperty", header: "vtkLODProp3D.h".}
proc GetLODProperty*(this: var vtkLODProp3D; id: cint; p: ptr ptr vtkImageProperty) {.
    importcpp: "GetLODProperty", header: "vtkLODProp3D.h".}
proc SetLODMapper*(this: var vtkLODProp3D; id: cint; m: ptr vtkMapper) {.
    importcpp: "SetLODMapper", header: "vtkLODProp3D.h".}
proc GetLODMapper*(this: var vtkLODProp3D; id: cint; m: ptr ptr vtkMapper) {.
    importcpp: "GetLODMapper", header: "vtkLODProp3D.h".}
proc SetLODMapper*(this: var vtkLODProp3D; id: cint; m: ptr vtkAbstractVolumeMapper) {.
    importcpp: "SetLODMapper", header: "vtkLODProp3D.h".}
proc GetLODMapper*(this: var vtkLODProp3D; id: cint;
                  m: ptr ptr vtkAbstractVolumeMapper) {.importcpp: "GetLODMapper",
    header: "vtkLODProp3D.h".}
proc SetLODMapper*(this: var vtkLODProp3D; id: cint; m: ptr vtkImageMapper3D) {.
    importcpp: "SetLODMapper", header: "vtkLODProp3D.h".}
proc GetLODMapper*(this: var vtkLODProp3D; id: cint; m: ptr ptr vtkImageMapper3D) {.
    importcpp: "GetLODMapper", header: "vtkLODProp3D.h".}
proc GetLODMapper*(this: var vtkLODProp3D; id: cint): ptr vtkAbstractMapper3D {.
    importcpp: "GetLODMapper", header: "vtkLODProp3D.h".}
proc SetLODBackfaceProperty*(this: var vtkLODProp3D; id: cint; t: ptr vtkProperty) {.
    importcpp: "SetLODBackfaceProperty", header: "vtkLODProp3D.h".}
proc GetLODBackfaceProperty*(this: var vtkLODProp3D; id: cint; t: ptr ptr vtkProperty) {.
    importcpp: "GetLODBackfaceProperty", header: "vtkLODProp3D.h".}
proc SetLODTexture*(this: var vtkLODProp3D; id: cint; t: ptr vtkTexture) {.
    importcpp: "SetLODTexture", header: "vtkLODProp3D.h".}
proc GetLODTexture*(this: var vtkLODProp3D; id: cint; t: ptr ptr vtkTexture) {.
    importcpp: "GetLODTexture", header: "vtkLODProp3D.h".}
proc EnableLOD*(this: var vtkLODProp3D; id: cint) {.importcpp: "EnableLOD",
    header: "vtkLODProp3D.h".}
proc DisableLOD*(this: var vtkLODProp3D; id: cint) {.importcpp: "DisableLOD",
    header: "vtkLODProp3D.h".}
proc IsLODEnabled*(this: var vtkLODProp3D; id: cint): cint {.importcpp: "IsLODEnabled",
    header: "vtkLODProp3D.h".}
proc SetLODLevel*(this: var vtkLODProp3D; id: cint; level: cdouble) {.
    importcpp: "SetLODLevel", header: "vtkLODProp3D.h".}
proc GetLODLevel*(this: var vtkLODProp3D; id: cint): cdouble {.
    importcpp: "GetLODLevel", header: "vtkLODProp3D.h".}
proc GetLODIndexLevel*(this: var vtkLODProp3D; index: cint): cdouble {.
    importcpp: "GetLODIndexLevel", header: "vtkLODProp3D.h".}
proc GetLODEstimatedRenderTime*(this: var vtkLODProp3D; id: cint): cdouble {.
    importcpp: "GetLODEstimatedRenderTime", header: "vtkLODProp3D.h".}
proc GetLODIndexEstimatedRenderTime*(this: var vtkLODProp3D; index: cint): cdouble {.
    importcpp: "GetLODIndexEstimatedRenderTime", header: "vtkLODProp3D.h".}
proc SetAutomaticLODSelection*(this: var vtkLODProp3D; _arg: vtkTypeBool) {.
    importcpp: "SetAutomaticLODSelection", header: "vtkLODProp3D.h".}
proc GetAutomaticLODSelectionMinValue*(this: var vtkLODProp3D): vtkTypeBool {.
    importcpp: "GetAutomaticLODSelectionMinValue", header: "vtkLODProp3D.h".}
proc GetAutomaticLODSelectionMaxValue*(this: var vtkLODProp3D): vtkTypeBool {.
    importcpp: "GetAutomaticLODSelectionMaxValue", header: "vtkLODProp3D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetNumberOfLODsNumberOfLODsCurrentIndexCurrentIndexAutomaticLODSelection ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AutomaticLODSelection  of  << this -> AutomaticLODSelection ) ; return this -> AutomaticLODSelection ; } ;
## Error: expected ';'!!!

proc AutomaticLODSelectionOn*(this: var vtkLODProp3D) {.
    importcpp: "AutomaticLODSelectionOn", header: "vtkLODProp3D.h".}
proc AutomaticLODSelectionOff*(this: var vtkLODProp3D) {.
    importcpp: "AutomaticLODSelectionOff", header: "vtkLODProp3D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the id of the LOD that is to be drawn when automatic LOD selection
  ##  is turned off.
  ##
proc SetSelectedLODID*(this: var vtkLODProp3D; _arg: cint) {.
    importcpp: "SetSelectedLODID", header: "vtkLODProp3D.h".}
## !!!Ignored construct:  virtual int GetNumberOfLODsNumberOfLODsCurrentIndexCurrentIndexAutomaticLODSelectionSelectedLODID ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SelectedLODID  of  << this -> SelectedLODID ) ; return this -> SelectedLODID ; } ;
## Error: expected ';'!!!

proc GetLastRenderedLODID*(this: var vtkLODProp3D): cint {.
    importcpp: "GetLastRenderedLODID", header: "vtkLODProp3D.h".}
proc GetPickLODID*(this: var vtkLODProp3D): cint {.importcpp: "GetPickLODID",
    header: "vtkLODProp3D.h".}
proc GetActors*(this: var vtkLODProp3D; a2: ptr vtkPropCollection) {.
    importcpp: "GetActors", header: "vtkLODProp3D.h".}
proc GetVolumes*(this: var vtkLODProp3D; a2: ptr vtkPropCollection) {.
    importcpp: "GetVolumes", header: "vtkLODProp3D.h".}
proc SetSelectedPickLODID*(this: var vtkLODProp3D; id: cint) {.
    importcpp: "SetSelectedPickLODID", header: "vtkLODProp3D.h".}
## !!!Ignored construct:  virtual int GetNumberOfLODsNumberOfLODsCurrentIndexCurrentIndexAutomaticLODSelectionSelectedLODIDSelectedPickLODID ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SelectedPickLODID  of  << this -> SelectedPickLODID ) ; return this -> SelectedPickLODID ; } ;
## Error: expected ';'!!!

proc SetAutomaticLODSelectionAutomaticPickLODSelection*(this: var vtkLODProp3D;
    _arg: vtkTypeBool) {.importcpp: "SetAutomaticLODSelectionAutomaticPickLODSelection",
                       header: "vtkLODProp3D.h".}
proc GetAutomaticLODSelectionMinValueAutomaticPickLODSelectionMinValue*(
    this: var vtkLODProp3D): vtkTypeBool {.importcpp: "GetAutomaticLODSelectionMinValueAutomaticPickLODSelectionMinValue",
                                       header: "vtkLODProp3D.h".}
proc GetAutomaticLODSelectionMaxValueAutomaticPickLODSelectionMaxValue*(
    this: var vtkLODProp3D): vtkTypeBool {.importcpp: "GetAutomaticLODSelectionMaxValueAutomaticPickLODSelectionMaxValue",
                                       header: "vtkLODProp3D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetNumberOfLODsNumberOfLODsCurrentIndexCurrentIndexAutomaticLODSelectionSelectedLODIDSelectedPickLODIDAutomaticPickLODSelection ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AutomaticPickLODSelection  of  << this -> AutomaticPickLODSelection ) ; return this -> AutomaticPickLODSelection ; } ;
## Error: expected ';'!!!

proc AutomaticPickLODSelectionOn*(this: var vtkLODProp3D) {.
    importcpp: "AutomaticPickLODSelectionOn", header: "vtkLODProp3D.h".}
proc AutomaticPickLODSelectionOff*(this: var vtkLODProp3D) {.
    importcpp: "AutomaticPickLODSelectionOff", header: "vtkLODProp3D.h".}
  ## /@}
  ## *
  ##  Shallow copy of this vtkLODProp3D.
  ##
proc ShallowCopy*(this: var vtkLODProp3D; prop: ptr vtkProp) {.
    importcpp: "ShallowCopy", header: "vtkLODProp3D.h".}
proc RenderOpaqueGeometry*(this: var vtkLODProp3D; viewport: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkLODProp3D.h".}
proc RenderTranslucentPolygonalGeometry*(this: var vtkLODProp3D;
                                        viewport: ptr vtkViewport): cint {.
    importcpp: "RenderTranslucentPolygonalGeometry", header: "vtkLODProp3D.h".}
proc RenderVolumetricGeometry*(this: var vtkLODProp3D; viewport: ptr vtkViewport): cint {.
    importcpp: "RenderVolumetricGeometry", header: "vtkLODProp3D.h".}
proc HasTranslucentPolygonalGeometry*(this: var vtkLODProp3D): vtkTypeBool {.
    importcpp: "HasTranslucentPolygonalGeometry", header: "vtkLODProp3D.h".}
proc ReleaseGraphicsResources*(this: var vtkLODProp3D; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkLODProp3D.h".}
proc SetAllocatedRenderTime*(this: var vtkLODProp3D; t: cdouble; vp: ptr vtkViewport) {.
    importcpp: "SetAllocatedRenderTime", header: "vtkLODProp3D.h".}
proc RestoreEstimatedRenderTime*(this: var vtkLODProp3D) {.
    importcpp: "RestoreEstimatedRenderTime", header: "vtkLODProp3D.h".}
proc AddEstimatedRenderTime*(this: var vtkLODProp3D; t: cdouble; vp: ptr vtkViewport) {.
    importcpp: "AddEstimatedRenderTime", header: "vtkLODProp3D.h".}