## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFrustumSource.h
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
##  @class   vtkFrustumSource
##  @brief   create a polygonal representation of a frustum
##
##  vtkFrustumSource creates a frustum defines by a set of planes. The frustum
##  is represented with four-sided polygons. It is possible to specify extra
##  lines to better visualize the field of view.
##
##  @par Usage:
##  Typical use consists of 3 steps:
##  1. get the planes coefficients from a vtkCamera with
##  vtkCamera::GetFrustumPlanes()
##  2. initialize the planes with vtkPlanes::SetFrustumPlanes() with the planes
##  coefficients
##  3. pass the vtkPlanes to a vtkFrustumSource.
##

import
  vtkFiltersSourcesModule, vtkPolyDataAlgorithm

discard "forward decl of vtkPlanes"
type
  vtkFrustumSource* {.importcpp: "vtkFrustumSource", header: "vtkFrustumSource.h",
                     bycopy.} = object of vtkPolyDataAlgorithm ## *
                                                          ##  Default constructor. Planes=nullptr. ShowLines=true. LinesLength=1.0.
                                                          ##
    vtkFrustumSource* {.importc: "vtkFrustumSource".}: VTK_NEWINSTANCE


proc New*(): ptr vtkFrustumSource {.importcpp: "vtkFrustumSource::New(@)",
                                header: "vtkFrustumSource.h".}
type
  vtkFrustumSourceSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkFrustumSource::IsTypeOf(@)", header: "vtkFrustumSource.h".}
proc IsA*(this: var vtkFrustumSource; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkFrustumSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkFrustumSource {.
    importcpp: "vtkFrustumSource::SafeDownCast(@)", header: "vtkFrustumSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkFrustumSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFrustumSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFrustumSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkFrustumSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkFrustumSource.h".}
proc GetnamePlanes*(this: var vtkFrustumSource): ptr vtkPlanes {.
    importcpp: "GetnamePlanes", header: "vtkFrustumSource.h".}
  ## /@}
  ## *
  ##  Set the 6 planes defining the frustum.
  ##
proc SetPlanes*(this: var vtkFrustumSource; planes: ptr vtkPlanes) {.
    importcpp: "SetPlanes", header: "vtkFrustumSource.h".}
## !!!Ignored construct:  /@{ *
##  Tells if some extra lines will be generated. Initial value is true.
##  virtual bool GetShowLinesShowLines ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ShowLines  of  << this -> ShowLines ) ; return this -> ShowLines ; } ;
## Error: expected ';'!!!

proc SetShowLines*(this: var vtkFrustumSource; _arg: bool) {.
    importcpp: "SetShowLines", header: "vtkFrustumSource.h".}
proc ShowLinesOn*(this: var vtkFrustumSource) {.importcpp: "ShowLinesOn",
    header: "vtkFrustumSource.h".}
proc ShowLinesOff*(this: var vtkFrustumSource) {.importcpp: "ShowLinesOff",
    header: "vtkFrustumSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Length of the extra lines. This a stricly positive value.
  ##  Initial value is 1.0.
  ##
## !!!Ignored construct:  virtual double GetShowLinesShowLinesLinesLength ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LinesLength  of  << this -> LinesLength ) ; return this -> LinesLength ; } ;
## Error: expected ';'!!!

proc SetShowLinesLinesLength*(this: var vtkFrustumSource; _arg: cdouble) {.
    importcpp: "SetShowLinesLinesLength", header: "vtkFrustumSource.h".}
  ## /@}
  ## *
  ##  Modified GetMTime because of Planes.
  ##
proc GetMTime*(this: var vtkFrustumSource): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkFrustumSource.h".}
proc SetShowLinesLinesLengthOutputPointsPrecision*(this: var vtkFrustumSource;
    _arg: cint) {.importcpp: "SetShowLinesLinesLengthOutputPointsPrecision",
                header: "vtkFrustumSource.h".}
## !!!Ignored construct:  virtual int GetShowLinesShowLinesLinesLengthOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ;
## Error: expected ';'!!!
