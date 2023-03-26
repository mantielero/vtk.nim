## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDeflectNormals.h
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
##  @class   vtkDeflectNormals
##  @brief   deflect normals using a 3 component vector field
##
##  vtkDeflectNormals is a filter that modifies the normals using a vector field.
##  It is useful to give a 3D perception of a flat surface using shading of the mapper.
##
##  The filter passes both its point data and cell data to its output.
##

import
  vtkDataSetAlgorithm, vtkFiltersGeneralModule

type
  vtkDeflectNormals* {.importcpp: "vtkDeflectNormals",
                      header: "vtkDeflectNormals.h", bycopy.} = object of vtkDataSetAlgorithm
    vtkDeflectNormals* {.importc: "vtkDeflectNormals".}: VTK_NEWINSTANCE


proc New*(): ptr vtkDeflectNormals {.importcpp: "vtkDeflectNormals::New(@)",
                                 header: "vtkDeflectNormals.h".}
type
  vtkDeflectNormalsSuperclass* = vtkDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDeflectNormals::IsTypeOf(@)", header: "vtkDeflectNormals.h".}
proc IsA*(this: var vtkDeflectNormals; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkDeflectNormals.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDeflectNormals {.
    importcpp: "vtkDeflectNormals::SafeDownCast(@)", header: "vtkDeflectNormals.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDeflectNormals :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDeflectNormals :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDeflectNormals :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDeflectNormals; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkDeflectNormals.h".}
proc SetScaleFactor*(this: var vtkDeflectNormals; _arg: cdouble) {.
    importcpp: "SetScaleFactor", header: "vtkDeflectNormals.h".}
## !!!Ignored construct:  virtual double GetScaleFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScaleFactor  of  << this -> ScaleFactor ) ; return this -> ScaleFactor ; } ;
## Error: expected ';'!!!

proc SetUserNormal*(this: var vtkDeflectNormals; _arg1: cdouble; _arg2: cdouble;
                   _arg3: cdouble) {.importcpp: "SetUserNormal",
                                   header: "vtkDeflectNormals.h".}
proc SetUserNormal*(this: var vtkDeflectNormals; _arg: array[3, cdouble]) {.
    importcpp: "SetUserNormal", header: "vtkDeflectNormals.h".}
## !!!Ignored construct:  virtual double * GetUserNormal ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << UserNormal  pointer  << this -> UserNormal ) ; return this -> UserNormal ; } VTK_WRAPEXCLUDE virtual void GetUserNormal ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> UserNormal [ 0 ] ; _arg2 = this -> UserNormal [ 1 ] ; _arg3 = this -> UserNormal [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << UserNormal  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetUserNormal ( double _arg [ 3 ] ) { this -> GetUserNormal ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetScaleFactorUseUserNormal*(this: var vtkDeflectNormals; _arg: bool) {.
    importcpp: "SetScaleFactorUseUserNormal", header: "vtkDeflectNormals.h".}
## !!!Ignored construct:  virtual bool GetScaleFactorUseUserNormal ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseUserNormal  of  << this -> UseUserNormal ) ; return this -> UseUserNormal ; } ;
## Error: expected ';'!!!

proc UseUserNormalOn*(this: var vtkDeflectNormals) {.importcpp: "UseUserNormalOn",
    header: "vtkDeflectNormals.h".}
proc UseUserNormalOff*(this: var vtkDeflectNormals) {.importcpp: "UseUserNormalOff",
    header: "vtkDeflectNormals.h".}
  ## /@}