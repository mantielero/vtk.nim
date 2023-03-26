## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTDxInteractorStyleSettings.h
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
##  @class   vtkTDxInteractorStyleSettings
##  @brief   3DConnexion device settings
##
##
##  vtkTDxInteractorStyleSettings defines settings for 3DConnexion device such
##  as sensitivity, axis filters
##
##  @sa
##  vtkInteractorStyle vtkRenderWindowInteractor
##  vtkTDxInteractorStyle
##

import
  vtkObject, vtkRenderingCoreModule

type
  vtkTDxInteractorStyleSettings* {.importcpp: "vtkTDxInteractorStyleSettings",
                                  header: "vtkTDxInteractorStyleSettings.h",
                                  bycopy.} = object of vtkObject
    vtkTDxInteractorStyleSettings* {.importc: "vtkTDxInteractorStyleSettings".}: VTK_NEWINSTANCE


proc New*(): ptr vtkTDxInteractorStyleSettings {.
    importcpp: "vtkTDxInteractorStyleSettings::New(@)",
    header: "vtkTDxInteractorStyleSettings.h".}
type
  vtkTDxInteractorStyleSettingsSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTDxInteractorStyleSettings::IsTypeOf(@)",
    header: "vtkTDxInteractorStyleSettings.h".}
proc IsA*(this: var vtkTDxInteractorStyleSettings; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTDxInteractorStyleSettings.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTDxInteractorStyleSettings {.
    importcpp: "vtkTDxInteractorStyleSettings::SafeDownCast(@)",
    header: "vtkTDxInteractorStyleSettings.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTDxInteractorStyleSettings :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTDxInteractorStyleSettings :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTDxInteractorStyleSettings :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTDxInteractorStyleSettings; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkTDxInteractorStyleSettings.h".}
proc SetAngleSensitivity*(this: var vtkTDxInteractorStyleSettings; _arg: cdouble) {.
    importcpp: "SetAngleSensitivity", header: "vtkTDxInteractorStyleSettings.h".}
## !!!Ignored construct:  virtual double GetAngleSensitivity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AngleSensitivity  of  << this -> AngleSensitivity ) ; return this -> AngleSensitivity ; } ;
## Error: expected ';'!!!

proc SetAngleSensitivityUseRotationX*(this: var vtkTDxInteractorStyleSettings;
                                     _arg: bool) {.
    importcpp: "SetAngleSensitivityUseRotationX",
    header: "vtkTDxInteractorStyleSettings.h".}
## !!!Ignored construct:  virtual bool GetAngleSensitivityUseRotationX ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseRotationX  of  << this -> UseRotationX ) ; return this -> UseRotationX ; } ;
## Error: expected ';'!!!

proc SetAngleSensitivityUseRotationXUseRotationY*(
    this: var vtkTDxInteractorStyleSettings; _arg: bool) {.
    importcpp: "SetAngleSensitivityUseRotationXUseRotationY",
    header: "vtkTDxInteractorStyleSettings.h".}
## !!!Ignored construct:  virtual bool GetAngleSensitivityUseRotationXUseRotationY ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseRotationY  of  << this -> UseRotationY ) ; return this -> UseRotationY ; } ;
## Error: expected ';'!!!

proc SetAngleSensitivityUseRotationXUseRotationYUseRotationZ*(
    this: var vtkTDxInteractorStyleSettings; _arg: bool) {.
    importcpp: "SetAngleSensitivityUseRotationXUseRotationYUseRotationZ",
    header: "vtkTDxInteractorStyleSettings.h".}
## !!!Ignored construct:  virtual bool GetAngleSensitivityUseRotationXUseRotationYUseRotationZ ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseRotationZ  of  << this -> UseRotationZ ) ; return this -> UseRotationZ ; } ;
## Error: expected ';'!!!

proc SetAngleSensitivityUseRotationXUseRotationYUseRotationZTranslationXSensitivity*(
    this: var vtkTDxInteractorStyleSettings; _arg: cdouble) {.importcpp: "SetAngleSensitivityUseRotationXUseRotationYUseRotationZTranslationXSensitivity",
    header: "vtkTDxInteractorStyleSettings.h".}
## !!!Ignored construct:  virtual double GetAngleSensitivityUseRotationXUseRotationYUseRotationZTranslationXSensitivity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TranslationXSensitivity  of  << this -> TranslationXSensitivity ) ; return this -> TranslationXSensitivity ; } ;
## Error: expected ';'!!!

proc SetAngleSensitivityUseRotationXUseRotationYUseRotationZTranslationXSensitivityTranslationYSensitivity*(
    this: var vtkTDxInteractorStyleSettings; _arg: cdouble) {.importcpp: "SetAngleSensitivityUseRotationXUseRotationYUseRotationZTranslationXSensitivityTranslationYSensitivity",
    header: "vtkTDxInteractorStyleSettings.h".}
## !!!Ignored construct:  virtual double GetAngleSensitivityUseRotationXUseRotationYUseRotationZTranslationXSensitivityTranslationYSensitivity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TranslationYSensitivity  of  << this -> TranslationYSensitivity ) ; return this -> TranslationYSensitivity ; } ;
## Error: expected ';'!!!

proc SetAngleSensitivityUseRotationXUseRotationYUseRotationZTranslationXSensitivityTranslationYSensitivityTranslationZSensitivity*(
    this: var vtkTDxInteractorStyleSettings; _arg: cdouble) {.importcpp: "SetAngleSensitivityUseRotationXUseRotationYUseRotationZTranslationXSensitivityTranslationYSensitivityTranslationZSensitivity",
    header: "vtkTDxInteractorStyleSettings.h".}
## !!!Ignored construct:  virtual double GetAngleSensitivityUseRotationXUseRotationYUseRotationZTranslationXSensitivityTranslationYSensitivityTranslationZSensitivity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TranslationZSensitivity  of  << this -> TranslationZSensitivity ) ; return this -> TranslationZSensitivity ; } ;
## Error: expected ';'!!!
