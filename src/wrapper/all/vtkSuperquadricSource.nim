## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSuperquadricSource.h
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
##  @class   vtkSuperquadricSource
##  @brief   create a polygonal superquadric centered
##  at the origin
##
##  vtkSuperquadricSource creates a superquadric (represented by polygons) of
##  specified size centered at the origin. The alignment of the axis of the
##  superquadric along one of the global axes can be specified. The resolution
##  (polygonal discretization)
##  in both the latitude (phi) and longitude (theta) directions can be
##  specified. Roundness parameters (PhiRoundness and ThetaRoundness) control
##  the shape of the superquadric.  The Toroidal boolean controls whether
##  a toroidal superquadric is produced.  If so, the Thickness parameter
##  controls the thickness of the toroid:  0 is the thinnest allowable
##  toroid, and 1 has a minimum sized hole.  The Scale parameters allow
##  the superquadric to be scaled in x, y, and z (normal vectors are correctly
##  generated in any case).  The Size parameter controls size of the
##  superquadric.
##
##  This code is based on "Rigid physically based superquadrics", A. H. Barr,
##  in "Graphics Gems III", David Kirk, ed., Academic Press, 1992.
##
##  @warning
##  Resolution means the number of latitude or longitude lines for a complete
##  superquadric. The resolution parameters are rounded to the nearest 4
##  in phi and 8 in theta.
##
##  @warning
##  Texture coordinates are not equally distributed around all superquadrics.
##
##  @warning
##  The Size and Thickness parameters control coefficients of superquadric
##  generation, and may do not exactly describe the size of the superquadric.
##
##

import
  vtkFiltersSourcesModule, vtkPolyDataAlgorithm

const
  VTK_MAX_SUPERQUADRIC_RESOLUTION* = 1024
  VTK_MIN_SUPERQUADRIC_THICKNESS* = 1e-4
  VTK_MIN_SUPERQUADRIC_ROUNDNESS* = 1e-24

type
  vtkSuperquadricSource* {.importcpp: "vtkSuperquadricSource",
                          header: "vtkSuperquadricSource.h", bycopy.} = object of vtkPolyDataAlgorithm ## *
                                                                                                ##  Create a default superquadric with a radius of 0.5, non-toroidal,
                                                                                                ##  spherical, and centered at the origin, with a scaling factor of 1 in each
                                                                                                ##  direction, a theta resolution and a phi resolutions of 16.
                                                                                                ##
    vtkSuperquadricSource* {.importc: "vtkSuperquadricSource".}: VTK_NEWINSTANCE


proc New*(): ptr vtkSuperquadricSource {.importcpp: "vtkSuperquadricSource::New(@)",
                                     header: "vtkSuperquadricSource.h".}
type
  vtkSuperquadricSourceSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSuperquadricSource::IsTypeOf(@)",
    header: "vtkSuperquadricSource.h".}
proc IsA*(this: var vtkSuperquadricSource; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkSuperquadricSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSuperquadricSource {.
    importcpp: "vtkSuperquadricSource::SafeDownCast(@)",
    header: "vtkSuperquadricSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSuperquadricSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSuperquadricSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSuperquadricSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSuperquadricSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSuperquadricSource.h".}
proc SetCenter*(this: var vtkSuperquadricSource; _arg1: cdouble; _arg2: cdouble;
               _arg3: cdouble) {.importcpp: "SetCenter",
                               header: "vtkSuperquadricSource.h".}
proc SetCenter*(this: var vtkSuperquadricSource; _arg: array[3, cdouble]) {.
    importcpp: "SetCenter", header: "vtkSuperquadricSource.h".}
## !!!Ignored construct:  virtual double * GetCenter ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Center  pointer  << this -> Center ) ; return this -> Center ; } VTK_WRAPEXCLUDE virtual void GetCenter ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Center [ i ] ; } } ;
## Error: expected ';'!!!

proc SetCenterScale*(this: var vtkSuperquadricSource; _arg1: cdouble; _arg2: cdouble;
                    _arg3: cdouble) {.importcpp: "SetCenterScale",
                                    header: "vtkSuperquadricSource.h".}
proc SetCenterScale*(this: var vtkSuperquadricSource; _arg: array[3, cdouble]) {.
    importcpp: "SetCenterScale", header: "vtkSuperquadricSource.h".}
## !!!Ignored construct:  virtual double * GetCenterScale ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Scale  pointer  << this -> Scale ) ; return this -> Scale ; } VTK_WRAPEXCLUDE virtual void GetCenterScale ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Scale [ i ] ; } } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Set the number of points in the longitude direction. Initial value is 16.
##  virtual int GetThetaResolutionThetaResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ThetaResolution  of  << this -> ThetaResolution ) ; return this -> ThetaResolution ; } ;
## Error: expected ';'!!!

proc SetThetaResolution*(this: var vtkSuperquadricSource; i: cint) {.
    importcpp: "SetThetaResolution", header: "vtkSuperquadricSource.h".}
## !!!Ignored construct:  /@} /@{ *
##  Set the number of points in the latitude direction. Initial value is 16.
##  virtual int GetThetaResolutionThetaResolutionPhiResolutionPhiResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PhiResolution  of  << this -> PhiResolution ) ; return this -> PhiResolution ; } ;
## Error: expected ';'!!!

proc SetPhiResolution*(this: var vtkSuperquadricSource; i: cint) {.
    importcpp: "SetPhiResolution", header: "vtkSuperquadricSource.h".}
## !!!Ignored construct:  /@} /@{ *
##  Set/Get Superquadric ring thickness (toroids only).
##  Changing thickness maintains the outside diameter of the toroid.
##  Initial value is 0.3333.
##  virtual double GetThetaResolutionThetaResolutionPhiResolutionPhiResolutionThicknessThickness ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Thickness  of  << this -> Thickness ) ; return this -> Thickness ; } ;
## Error: expected ';'!!!

proc SetThickness*(this: var vtkSuperquadricSource; _arg: cdouble) {.
    importcpp: "SetThickness", header: "vtkSuperquadricSource.h".}
proc GetThicknessMinValue*(this: var vtkSuperquadricSource): cdouble {.
    importcpp: "GetThicknessMinValue", header: "vtkSuperquadricSource.h".}
proc GetThicknessMaxValue*(this: var vtkSuperquadricSource): cdouble {.
    importcpp: "GetThicknessMaxValue", header: "vtkSuperquadricSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get Superquadric north/south roundness.
  ##  Values range from 0 (rectangular) to 1 (circular) to higher orders.
  ##  Initial value is 1.0.
  ##
## !!!Ignored construct:  virtual double GetThetaResolutionThetaResolutionPhiResolutionPhiResolutionThicknessThicknessPhiRoundness ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PhiRoundness  of  << this -> PhiRoundness ) ; return this -> PhiRoundness ; } ;
## Error: expected ';'!!!

proc SetPhiRoundness*(this: var vtkSuperquadricSource; e: cdouble) {.
    importcpp: "SetPhiRoundness", header: "vtkSuperquadricSource.h".}
## !!!Ignored construct:  /@} /@{ *
##  Set/Get Superquadric east/west roundness.
##  Values range from 0 (rectangular) to 1 (circular) to higher orders.
##  Initial value is 1.0.
##  virtual double GetThetaResolutionThetaResolutionPhiResolutionPhiResolutionThicknessThicknessPhiRoundnessThetaRoundnessThetaRoundness ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ThetaRoundness  of  << this -> ThetaRoundness ) ; return this -> ThetaRoundness ; } ;
## Error: expected ';'!!!

proc SetThetaRoundness*(this: var vtkSuperquadricSource; e: cdouble) {.
    importcpp: "SetThetaRoundness", header: "vtkSuperquadricSource.h".}
proc SetSize*(this: var vtkSuperquadricSource; _arg: cdouble) {.importcpp: "SetSize",
    header: "vtkSuperquadricSource.h".}
## !!!Ignored construct:  virtual double GetThetaResolutionThetaResolutionPhiResolutionPhiResolutionThicknessThicknessPhiRoundnessThetaRoundnessThetaRoundnessSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Size  of  << this -> Size ) ; return this -> Size ; } ;
## Error: expected ';'!!!

proc SetSizeAxisOfSymmetry*(this: var vtkSuperquadricSource; _arg: cint) {.
    importcpp: "SetSizeAxisOfSymmetry", header: "vtkSuperquadricSource.h".}
## !!!Ignored construct:  virtual int GetThetaResolutionThetaResolutionPhiResolutionPhiResolutionThicknessThicknessPhiRoundnessThetaRoundnessThetaRoundnessSizeAxisOfSymmetry ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AxisOfSymmetry  of  << this -> AxisOfSymmetry ) ; return this -> AxisOfSymmetry ; } ;
## Error: expected ';'!!!

proc SetXAxisOfSymmetry*(this: var vtkSuperquadricSource) {.
    importcpp: "SetXAxisOfSymmetry", header: "vtkSuperquadricSource.h".}
proc SetYAxisOfSymmetry*(this: var vtkSuperquadricSource) {.
    importcpp: "SetYAxisOfSymmetry", header: "vtkSuperquadricSource.h".}
proc SetZAxisOfSymmetry*(this: var vtkSuperquadricSource) {.
    importcpp: "SetZAxisOfSymmetry", header: "vtkSuperquadricSource.h".}
proc ToroidalOn*(this: var vtkSuperquadricSource) {.importcpp: "ToroidalOn",
    header: "vtkSuperquadricSource.h".}
proc ToroidalOff*(this: var vtkSuperquadricSource) {.importcpp: "ToroidalOff",
    header: "vtkSuperquadricSource.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetThetaResolutionThetaResolutionPhiResolutionPhiResolutionThicknessThicknessPhiRoundnessThetaRoundnessThetaRoundnessSizeAxisOfSymmetryToroidal ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Toroidal  of  << this -> Toroidal ) ; return this -> Toroidal ; } ;
## Error: expected ';'!!!

proc SetSizeAxisOfSymmetryToroidal*(this: var vtkSuperquadricSource;
                                   _arg: vtkTypeBool) {.
    importcpp: "SetSizeAxisOfSymmetryToroidal", header: "vtkSuperquadricSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get the desired precision for the output points.
  ##  vtkAlgorithm::SINGLE_PRECISION - Output single-precision floating point.
  ##  vtkAlgorithm::DOUBLE_PRECISION - Output double-precision floating point.
  ##
proc SetSizeAxisOfSymmetryToroidalOutputPointsPrecision*(
    this: var vtkSuperquadricSource; _arg: cint) {.
    importcpp: "SetSizeAxisOfSymmetryToroidalOutputPointsPrecision",
    header: "vtkSuperquadricSource.h".}
## !!!Ignored construct:  virtual int GetThetaResolutionThetaResolutionPhiResolutionPhiResolutionThicknessThicknessPhiRoundnessThetaRoundnessThetaRoundnessSizeAxisOfSymmetryToroidalOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ;
## Error: expected ';'!!!
