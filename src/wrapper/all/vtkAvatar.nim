## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAvatar.h
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
##  @class vtkAvatar
##  @brief Renders head and hands for a user in VR
##
##  Set position and orientation for the head and two hands,
##  shows an observer where the avatar is looking and pointing.
##

import
  vtkActor, vtkRenderingCoreModule

type
  vtkAvatar* {.importcpp: "vtkAvatar", header: "vtkAvatar.h", bycopy.} = object of vtkActor
    vtkAvatar* {.importc: "vtkAvatar".}: VTK_NEWINSTANCE


proc New*(): ptr vtkAvatar {.importcpp: "vtkAvatar::New(@)", header: "vtkAvatar.h".}
type
  vtkAvatarSuperclass* = vtkActor

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkAvatar::IsTypeOf(@)",
    header: "vtkAvatar.h".}
proc IsA*(this: var vtkAvatar; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkAvatar.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAvatar {.
    importcpp: "vtkAvatar::SafeDownCast(@)", header: "vtkAvatar.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAvatar :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkActor :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAvatar :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAvatar :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAvatar; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkAvatar.h".}
## !!!Ignored construct:  *
##  Set/Get the head and hand transforms.
##  virtual double * GetHeadPositionHeadPosition ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << HeadPosition  pointer  << this -> HeadPosition ) ; return this -> HeadPosition ; } VTK_WRAPEXCLUDE virtual void GetHeadPositionHeadPosition ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> HeadPosition [ 0 ] ; _arg2 = this -> HeadPosition [ 1 ] ; _arg3 = this -> HeadPosition [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << HeadPosition  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetHeadPositionHeadPosition ( double _arg [ 3 ] ) { this -> GetHeadPositionHeadPosition ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetHeadPosition*(this: var vtkAvatar; _arg1: cdouble; _arg2: cdouble;
                     _arg3: cdouble) {.importcpp: "SetHeadPosition",
                                     header: "vtkAvatar.h".}
proc SetHeadPosition*(this: var vtkAvatar; _arg: array[3, cdouble]) {.
    importcpp: "SetHeadPosition", header: "vtkAvatar.h".}
## !!!Ignored construct:  virtual double * GetHeadPositionHeadPositionHeadOrientation ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << HeadOrientation  pointer  << this -> HeadOrientation ) ; return this -> HeadOrientation ; } VTK_WRAPEXCLUDE virtual void GetHeadPositionHeadPositionHeadOrientation ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> HeadOrientation [ 0 ] ; _arg2 = this -> HeadOrientation [ 1 ] ; _arg3 = this -> HeadOrientation [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << HeadOrientation  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetHeadPositionHeadPositionHeadOrientation ( double _arg [ 3 ] ) { this -> GetHeadPositionHeadPositionHeadOrientation ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetHeadPositionHeadOrientation*(this: var vtkAvatar; _arg1: cdouble;
                                    _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetHeadPositionHeadOrientation", header: "vtkAvatar.h".}
proc SetHeadPositionHeadOrientation*(this: var vtkAvatar; _arg: array[3, cdouble]) {.
    importcpp: "SetHeadPositionHeadOrientation", header: "vtkAvatar.h".}
## !!!Ignored construct:  virtual double * GetHeadPositionHeadPositionHeadOrientationLeftHandPosition ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << LeftHandPosition  pointer  << this -> LeftHandPosition ) ; return this -> LeftHandPosition ; } VTK_WRAPEXCLUDE virtual void GetHeadPositionHeadPositionHeadOrientationLeftHandPosition ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> LeftHandPosition [ 0 ] ; _arg2 = this -> LeftHandPosition [ 1 ] ; _arg3 = this -> LeftHandPosition [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << LeftHandPosition  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetHeadPositionHeadPositionHeadOrientationLeftHandPosition ( double _arg [ 3 ] ) { this -> GetHeadPositionHeadPositionHeadOrientationLeftHandPosition ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetHeadPositionHeadOrientationLeftHandPosition*(this: var vtkAvatar;
    _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetHeadPositionHeadOrientationLeftHandPosition",
    header: "vtkAvatar.h".}
proc SetHeadPositionHeadOrientationLeftHandPosition*(this: var vtkAvatar;
    _arg: array[3, cdouble]) {.importcpp: "SetHeadPositionHeadOrientationLeftHandPosition",
                            header: "vtkAvatar.h".}
## !!!Ignored construct:  virtual double * GetHeadPositionHeadPositionHeadOrientationLeftHandPositionLeftHandOrientation ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << LeftHandOrientation  pointer  << this -> LeftHandOrientation ) ; return this -> LeftHandOrientation ; } VTK_WRAPEXCLUDE virtual void GetHeadPositionHeadPositionHeadOrientationLeftHandPositionLeftHandOrientation ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> LeftHandOrientation [ 0 ] ; _arg2 = this -> LeftHandOrientation [ 1 ] ; _arg3 = this -> LeftHandOrientation [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << LeftHandOrientation  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetHeadPositionHeadPositionHeadOrientationLeftHandPositionLeftHandOrientation ( double _arg [ 3 ] ) { this -> GetHeadPositionHeadPositionHeadOrientationLeftHandPositionLeftHandOrientation ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetHeadPositionHeadOrientationLeftHandPositionLeftHandOrientation*(
    this: var vtkAvatar; _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.importcpp: "SetHeadPositionHeadOrientationLeftHandPositionLeftHandOrientation",
    header: "vtkAvatar.h".}
proc SetHeadPositionHeadOrientationLeftHandPositionLeftHandOrientation*(
    this: var vtkAvatar; _arg: array[3, cdouble]) {.importcpp: "SetHeadPositionHeadOrientationLeftHandPositionLeftHandOrientation",
    header: "vtkAvatar.h".}
## !!!Ignored construct:  virtual double * GetHeadPositionHeadPositionHeadOrientationLeftHandPositionLeftHandOrientationRightHandPosition ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << RightHandPosition  pointer  << this -> RightHandPosition ) ; return this -> RightHandPosition ; } VTK_WRAPEXCLUDE virtual void GetHeadPositionHeadPositionHeadOrientationLeftHandPositionLeftHandOrientationRightHandPosition ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> RightHandPosition [ 0 ] ; _arg2 = this -> RightHandPosition [ 1 ] ; _arg3 = this -> RightHandPosition [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << RightHandPosition  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetHeadPositionHeadPositionHeadOrientationLeftHandPositionLeftHandOrientationRightHandPosition ( double _arg [ 3 ] ) { this -> GetHeadPositionHeadPositionHeadOrientationLeftHandPositionLeftHandOrientationRightHandPosition ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetHeadPositionHeadOrientationLeftHandPositionLeftHandOrientationRightHandPosition*(
    this: var vtkAvatar; _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.importcpp: "SetHeadPositionHeadOrientationLeftHandPositionLeftHandOrientationRightHandPosition",
    header: "vtkAvatar.h".}
proc SetHeadPositionHeadOrientationLeftHandPositionLeftHandOrientationRightHandPosition*(
    this: var vtkAvatar; _arg: array[3, cdouble]) {.importcpp: "SetHeadPositionHeadOrientationLeftHandPositionLeftHandOrientationRightHandPosition",
    header: "vtkAvatar.h".}
## !!!Ignored construct:  virtual double * GetHeadPositionHeadPositionHeadOrientationLeftHandPositionLeftHandOrientationRightHandPositionRightHandOrientation ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << RightHandOrientation  pointer  << this -> RightHandOrientation ) ; return this -> RightHandOrientation ; } VTK_WRAPEXCLUDE virtual void GetHeadPositionHeadPositionHeadOrientationLeftHandPositionLeftHandOrientationRightHandPositionRightHandOrientation ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> RightHandOrientation [ 0 ] ; _arg2 = this -> RightHandOrientation [ 1 ] ; _arg3 = this -> RightHandOrientation [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << RightHandOrientation  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetHeadPositionHeadPositionHeadOrientationLeftHandPositionLeftHandOrientationRightHandPositionRightHandOrientation ( double _arg [ 3 ] ) { this -> GetHeadPositionHeadPositionHeadOrientationLeftHandPositionLeftHandOrientationRightHandPositionRightHandOrientation ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetHeadPositionHeadOrientationLeftHandPositionLeftHandOrientationRightHandPositionRightHandOrientation*(
    this: var vtkAvatar; _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.importcpp: "SetHeadPositionHeadOrientationLeftHandPositionLeftHandOrientationRightHandPositionRightHandOrientation",
    header: "vtkAvatar.h".}
proc SetHeadPositionHeadOrientationLeftHandPositionLeftHandOrientationRightHandPositionRightHandOrientation*(
    this: var vtkAvatar; _arg: array[3, cdouble]) {.importcpp: "SetHeadPositionHeadOrientationLeftHandPositionLeftHandOrientationRightHandPositionRightHandOrientation",
    header: "vtkAvatar.h".}
  ## *
  ##  Up vector, in world coords. Must be normalized.
  ##
## !!!Ignored construct:  virtual double * GetHeadPositionHeadPositionHeadOrientationLeftHandPositionLeftHandOrientationRightHandPositionRightHandOrientationUpVector ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << UpVector  pointer  << this -> UpVector ) ; return this -> UpVector ; } VTK_WRAPEXCLUDE virtual void GetHeadPositionHeadPositionHeadOrientationLeftHandPositionLeftHandOrientationRightHandPositionRightHandOrientationUpVector ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> UpVector [ 0 ] ; _arg2 = this -> UpVector [ 1 ] ; _arg3 = this -> UpVector [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << UpVector  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetHeadPositionHeadPositionHeadOrientationLeftHandPositionLeftHandOrientationRightHandPositionRightHandOrientationUpVector ( double _arg [ 3 ] ) { this -> GetHeadPositionHeadPositionHeadOrientationLeftHandPositionLeftHandOrientationRightHandPositionRightHandOrientationUpVector ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetHeadPositionHeadOrientationLeftHandPositionLeftHandOrientationRightHandPositionRightHandOrientationUpVector*(
    this: var vtkAvatar; _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.importcpp: "SetHeadPositionHeadOrientationLeftHandPositionLeftHandOrientationRightHandPositionRightHandOrientationUpVector",
    header: "vtkAvatar.h".}
proc SetHeadPositionHeadOrientationLeftHandPositionLeftHandOrientationRightHandPositionRightHandOrientationUpVector*(
    this: var vtkAvatar; _arg: array[3, cdouble]) {.importcpp: "SetHeadPositionHeadOrientationLeftHandPositionLeftHandOrientationRightHandPositionRightHandOrientationUpVector",
    header: "vtkAvatar.h".}
  ## /@{
  ## *
  ##  Normally, hand position/orientation is set explicitly.
  ##  If set to false, hand and arm will follow the torso
  ##  in a neutral position.
  ##
proc SetUseLeftHand*(this: var vtkAvatar; _arg: bool) {.importcpp: "SetUseLeftHand",
    header: "vtkAvatar.h".}
## !!!Ignored construct:  virtual bool GetUseLeftHand ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseLeftHand  of  << this -> UseLeftHand ) ; return this -> UseLeftHand ; } ;
## Error: expected ';'!!!

proc UseLeftHandOn*(this: var vtkAvatar) {.importcpp: "UseLeftHandOn",
                                       header: "vtkAvatar.h".}
proc UseLeftHandOff*(this: var vtkAvatar) {.importcpp: "UseLeftHandOff",
                                        header: "vtkAvatar.h".}
proc SetUseLeftHandUseRightHand*(this: var vtkAvatar; _arg: bool) {.
    importcpp: "SetUseLeftHandUseRightHand", header: "vtkAvatar.h".}
## !!!Ignored construct:  virtual bool GetUseLeftHandUseRightHand ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseRightHand  of  << this -> UseRightHand ) ; return this -> UseRightHand ; } ;
## Error: expected ';'!!!

proc UseRightHandOn*(this: var vtkAvatar) {.importcpp: "UseRightHandOn",
                                        header: "vtkAvatar.h".}
proc UseRightHandOff*(this: var vtkAvatar) {.importcpp: "UseRightHandOff",
    header: "vtkAvatar.h".}
  ## /@}
  ## /@{
  ## *
  ##  Show just the hands. Default false.
  ##
proc SetUseLeftHandUseRightHandShowHandsOnly*(this: var vtkAvatar; _arg: bool) {.
    importcpp: "SetUseLeftHandUseRightHandShowHandsOnly", header: "vtkAvatar.h".}
## !!!Ignored construct:  virtual bool GetUseLeftHandUseRightHandShowHandsOnly ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ShowHandsOnly  of  << this -> ShowHandsOnly ) ; return this -> ShowHandsOnly ; } ;
## Error: expected ';'!!!

proc ShowHandsOnlyOn*(this: var vtkAvatar) {.importcpp: "ShowHandsOnlyOn",
    header: "vtkAvatar.h".}
proc ShowHandsOnlyOff*(this: var vtkAvatar) {.importcpp: "ShowHandsOnlyOff",
    header: "vtkAvatar.h".}
  ## /@}