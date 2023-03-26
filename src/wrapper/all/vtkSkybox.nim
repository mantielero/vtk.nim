## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSkybox.h
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
##  @class vtkSkybox
##  @brief Renders a skybox environment
##
##  You must provide a texture cube map using the SetTexture method.
##

import
  vtkActor, vtkRenderingCoreModule

type
  vtkSkybox* {.importcpp: "vtkSkybox", header: "vtkSkybox.h", bycopy.} = object of vtkActor
    vtkSkybox* {.importc: "vtkSkybox".}: VTK_NEWINSTANCE


proc New*(): ptr vtkSkybox {.importcpp: "vtkSkybox::New(@)", header: "vtkSkybox.h".}
type
  vtkSkyboxSuperclass* = vtkActor

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkSkybox::IsTypeOf(@)",
    header: "vtkSkybox.h".}
proc IsA*(this: var vtkSkybox; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkSkybox.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSkybox {.
    importcpp: "vtkSkybox::SafeDownCast(@)", header: "vtkSkybox.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSkybox :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkActor :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSkybox :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSkybox :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSkybox; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSkybox.h".}
## using statement

proc GetBounds*(this: var vtkSkybox): ptr cdouble {.importcpp: "GetBounds",
    header: "vtkSkybox.h".}
type
  vtkSkyboxProjection* {.size: sizeof(cint), importcpp: "vtkSkybox::Projection",
                        header: "vtkSkybox.h".} = enum
    Cube, Sphere, Floor, StereoSphere


## !!!Ignored construct:  virtual int GetProjection ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Projection  of  << this -> Projection ) ; return this -> Projection ; } ;
## Error: expected ';'!!!

proc SetProjection*(this: var vtkSkybox; _arg: cint) {.importcpp: "SetProjection",
    header: "vtkSkybox.h".}
proc SetProjectionToCube*(this: var vtkSkybox) {.importcpp: "SetProjectionToCube",
    header: "vtkSkybox.h".}
proc SetProjectionToSphere*(this: var vtkSkybox) {.
    importcpp: "SetProjectionToSphere", header: "vtkSkybox.h".}
proc SetProjectionToStereoSphere*(this: var vtkSkybox) {.
    importcpp: "SetProjectionToStereoSphere", header: "vtkSkybox.h".}
proc SetProjectionToFloor*(this: var vtkSkybox) {.importcpp: "SetProjectionToFloor",
    header: "vtkSkybox.h".}
proc SetFloorPlane*(this: var vtkSkybox; _arg1: cfloat; _arg2: cfloat; _arg3: cfloat;
                   _arg4: cfloat) {.importcpp: "SetFloorPlane",
                                  header: "vtkSkybox.h".}
proc SetFloorPlane*(this: var vtkSkybox; _arg: array[4, cfloat]) {.
    importcpp: "SetFloorPlane", header: "vtkSkybox.h".}
## !!!Ignored construct:  virtual float * GetFloorPlane ( ) VTK_SIZEHINT ( 4 ) { vtkDebugWithObjectMacro ( this , <<  returning  << FloorPlane  pointer  << this -> FloorPlane ) ; return this -> FloorPlane ; } VTK_WRAPEXCLUDE virtual void GetFloorPlane ( float & _arg1 , float & _arg2 , float & _arg3 , float & _arg4 ) { _arg1 = this -> FloorPlane [ 0 ] ; _arg2 = this -> FloorPlane [ 1 ] ; _arg3 = this -> FloorPlane [ 2 ] ; _arg4 = this -> FloorPlane [ 3 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << FloorPlane  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetFloorPlane ( float _arg [ 4 ] ) { this -> GetFloorPlane ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ;
## Error: expected ';'!!!

proc SetFloorRight*(this: var vtkSkybox; _arg1: cfloat; _arg2: cfloat; _arg3: cfloat) {.
    importcpp: "SetFloorRight", header: "vtkSkybox.h".}
proc SetFloorRight*(this: var vtkSkybox; _arg: array[3, cfloat]) {.
    importcpp: "SetFloorRight", header: "vtkSkybox.h".}
## !!!Ignored construct:  virtual float * GetFloorRight ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << FloorRight  pointer  << this -> FloorRight ) ; return this -> FloorRight ; } VTK_WRAPEXCLUDE virtual void GetFloorRight ( float & _arg1 , float & _arg2 , float & _arg3 ) { _arg1 = this -> FloorRight [ 0 ] ; _arg2 = this -> FloorRight [ 1 ] ; _arg3 = this -> FloorRight [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << FloorRight  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetFloorRight ( float _arg [ 3 ] ) { this -> GetFloorRight ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Define if the colors should be gamma corrected.
##  This is generally required if the input texture is in linear color space.
##  Default is off.
##  virtual bool GetProjectionGammaCorrectGammaCorrect ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GammaCorrect  of  << this -> GammaCorrect ) ; return this -> GammaCorrect ; } ;
## Error: expected ';'!!!

proc SetProjectionGammaCorrect*(this: var vtkSkybox; _arg: bool) {.
    importcpp: "SetProjectionGammaCorrect", header: "vtkSkybox.h".}
proc GammaCorrectOn*(this: var vtkSkybox) {.importcpp: "GammaCorrectOn",
                                        header: "vtkSkybox.h".}
proc GammaCorrectOff*(this: var vtkSkybox) {.importcpp: "GammaCorrectOff",
    header: "vtkSkybox.h".}
  ## /@}