## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTexturedSphereSource.h
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
##  @class   vtkTexturedSphereSource
##  @brief   create a sphere centered at the origin
##
##  vtkTexturedSphereSource creates a polygonal sphere of specified radius
##  centered at the origin. The resolution (polygonal discretization) in both
##  the latitude (phi) and longitude (theta) directions can be specified.
##  It also is possible to create partial sphere by specifying maximum phi and
##  theta angles.
##

import
  vtkFiltersSourcesModule, vtkPolyDataAlgorithm

type
  vtkTexturedSphereSource* {.importcpp: "vtkTexturedSphereSource",
                            header: "vtkTexturedSphereSource.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkTexturedSphereSource* {.importc: "vtkTexturedSphereSource".}: VTK_NEWINSTANCE

  vtkTexturedSphereSourceSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTexturedSphereSource::IsTypeOf(@)",
    header: "vtkTexturedSphereSource.h".}
proc IsA*(this: var vtkTexturedSphereSource; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTexturedSphereSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTexturedSphereSource {.
    importcpp: "vtkTexturedSphereSource::SafeDownCast(@)",
    header: "vtkTexturedSphereSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTexturedSphereSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTexturedSphereSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTexturedSphereSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTexturedSphereSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTexturedSphereSource.h".}
proc New*(): ptr vtkTexturedSphereSource {.importcpp: "vtkTexturedSphereSource::New(@)",
                                       header: "vtkTexturedSphereSource.h".}
proc SetRadius*(this: var vtkTexturedSphereSource; _arg: cdouble) {.
    importcpp: "SetRadius", header: "vtkTexturedSphereSource.h".}
proc GetRadiusMinValue*(this: var vtkTexturedSphereSource): cdouble {.
    importcpp: "GetRadiusMinValue", header: "vtkTexturedSphereSource.h".}
proc GetRadiusMaxValue*(this: var vtkTexturedSphereSource): cdouble {.
    importcpp: "GetRadiusMaxValue", header: "vtkTexturedSphereSource.h".}
## !!!Ignored construct:  virtual double GetRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Radius  of  << this -> Radius ) ; return this -> Radius ; } ;
## Error: expected ';'!!!

proc SetRadiusThetaResolution*(this: var vtkTexturedSphereSource; _arg: cint) {.
    importcpp: "SetRadiusThetaResolution", header: "vtkTexturedSphereSource.h".}
proc GetRadiusMinValueThetaResolutionMinValue*(this: var vtkTexturedSphereSource): cint {.
    importcpp: "GetRadiusMinValueThetaResolutionMinValue",
    header: "vtkTexturedSphereSource.h".}
proc GetRadiusMaxValueThetaResolutionMaxValue*(this: var vtkTexturedSphereSource): cint {.
    importcpp: "GetRadiusMaxValueThetaResolutionMaxValue",
    header: "vtkTexturedSphereSource.h".}
## !!!Ignored construct:  virtual int GetRadiusThetaResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ThetaResolution  of  << this -> ThetaResolution ) ; return this -> ThetaResolution ; } ;
## Error: expected ';'!!!

proc SetRadiusThetaResolutionPhiResolution*(this: var vtkTexturedSphereSource;
    _arg: cint) {.importcpp: "SetRadiusThetaResolutionPhiResolution",
                header: "vtkTexturedSphereSource.h".}
proc GetRadiusMinValueThetaResolutionMinValuePhiResolutionMinValue*(
    this: var vtkTexturedSphereSource): cint {.
    importcpp: "GetRadiusMinValueThetaResolutionMinValuePhiResolutionMinValue",
    header: "vtkTexturedSphereSource.h".}
proc GetRadiusMaxValueThetaResolutionMaxValuePhiResolutionMaxValue*(
    this: var vtkTexturedSphereSource): cint {.
    importcpp: "GetRadiusMaxValueThetaResolutionMaxValuePhiResolutionMaxValue",
    header: "vtkTexturedSphereSource.h".}
## !!!Ignored construct:  virtual int GetRadiusThetaResolutionPhiResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PhiResolution  of  << this -> PhiResolution ) ; return this -> PhiResolution ; } ;
## Error: expected ';'!!!

proc SetRadiusThetaResolutionPhiResolutionTheta*(
    this: var vtkTexturedSphereSource; _arg: cdouble) {.
    importcpp: "SetRadiusThetaResolutionPhiResolutionTheta",
    header: "vtkTexturedSphereSource.h".}
proc GetRadiusMinValueThetaResolutionMinValuePhiResolutionMinValueThetaMinValue*(
    this: var vtkTexturedSphereSource): cdouble {.importcpp: "GetRadiusMinValueThetaResolutionMinValuePhiResolutionMinValueThetaMinValue",
    header: "vtkTexturedSphereSource.h".}
proc GetRadiusMaxValueThetaResolutionMaxValuePhiResolutionMaxValueThetaMaxValue*(
    this: var vtkTexturedSphereSource): cdouble {.importcpp: "GetRadiusMaxValueThetaResolutionMaxValuePhiResolutionMaxValueThetaMaxValue",
    header: "vtkTexturedSphereSource.h".}
## !!!Ignored construct:  virtual double GetRadiusThetaResolutionPhiResolutionTheta ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Theta  of  << this -> Theta ) ; return this -> Theta ; } ;
## Error: expected ';'!!!

proc SetRadiusThetaResolutionPhiResolutionThetaPhi*(
    this: var vtkTexturedSphereSource; _arg: cdouble) {.
    importcpp: "SetRadiusThetaResolutionPhiResolutionThetaPhi",
    header: "vtkTexturedSphereSource.h".}
proc GetRadiusMinValueThetaResolutionMinValuePhiResolutionMinValueThetaMinValuePhiMinValue*(
    this: var vtkTexturedSphereSource): cdouble {.importcpp: "GetRadiusMinValueThetaResolutionMinValuePhiResolutionMinValueThetaMinValuePhiMinValue",
    header: "vtkTexturedSphereSource.h".}
proc GetRadiusMaxValueThetaResolutionMaxValuePhiResolutionMaxValueThetaMaxValuePhiMaxValue*(
    this: var vtkTexturedSphereSource): cdouble {.importcpp: "GetRadiusMaxValueThetaResolutionMaxValuePhiResolutionMaxValueThetaMaxValuePhiMaxValue",
    header: "vtkTexturedSphereSource.h".}
## !!!Ignored construct:  virtual double GetRadiusThetaResolutionPhiResolutionThetaPhi ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Phi  of  << this -> Phi ) ; return this -> Phi ; } ;
## Error: expected ';'!!!

proc SetOutputPointsPrecision*(this: var vtkTexturedSphereSource; _arg: cint) {.
    importcpp: "SetOutputPointsPrecision", header: "vtkTexturedSphereSource.h".}
## !!!Ignored construct:  virtual int GetRadiusThetaResolutionPhiResolutionThetaPhiOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ;
## Error: expected ';'!!!
