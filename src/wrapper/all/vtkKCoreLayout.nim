## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkKCoreLayout.h
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
## ----------------------------------------------------------------------------
##  Copyright (c) Sandia Corporation
##  See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
## ----------------------------------------------------------------------------
## *
##  @class   vtkKCoreLayout
##  @brief   Produces a layout for a graph labeled with K-Core
##                         information.
##
##
##  vtkKCoreLayout creates coordinates for each vertex that can be used to
##  perform a layout for a k-core view.
##  Prerequisite:  Vertices must have an attribute array containing their
##                 k-core number.  This layout is based on the algorithm
##                 described in the paper: "k-core decomposition: a tool
##                 for the visualization of large scale networks", by
##                 Ignacio Alvarez-Hamelin et. al.
##
##                 This graph algorithm appends either polar coordinates or cartesian coordinates
##                 as vertex attributes to the graph giving the position of the vertex in a layout.
##                 Input graphs must have the k-core number assigned to each vertex (default
##                 attribute array storing kcore numbers is "kcore").
##
##                 Epsilon - this factor is used to adjust the amount vertices are 'pulled' out of
##                           their default ring radius based on the number of neighbors in higher
##                           cores.  Default=0.2
##                 UnitRadius - Tweaks the base unit radius value.  Default=1.0
##
##                 Still TODO: Still need to work on the connected-components within each shell and
##                             associated layout issues with that.
##
##  Input port 0: graph
##
##  @par Thanks:
##  Thanks to William McLendon from Sandia National Laboratories for providing this
##  implementation.
##

import
  vtkGraphAlgorithm, vtkInfovisLayoutModule

type
  vtkKCoreLayout* {.importcpp: "vtkKCoreLayout", header: "vtkKCoreLayout.h", bycopy.} = object of vtkGraphAlgorithm
    vtkKCoreLayout* {.importc: "vtkKCoreLayout".}: VTK_NEWINSTANCE


proc New*(): ptr vtkKCoreLayout {.importcpp: "vtkKCoreLayout::New(@)",
                              header: "vtkKCoreLayout.h".}
type
  vtkKCoreLayoutSuperclass* = vtkGraphAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkKCoreLayout::IsTypeOf(@)", header: "vtkKCoreLayout.h".}
proc IsA*(this: var vtkKCoreLayout; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkKCoreLayout.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkKCoreLayout {.
    importcpp: "vtkKCoreLayout::SafeDownCast(@)", header: "vtkKCoreLayout.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkKCoreLayout :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGraphAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkKCoreLayout :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkKCoreLayout :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkKCoreLayout; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkKCoreLayout.h".}
proc SetGraphConnection*(this: var vtkKCoreLayout; a2: ptr vtkAlgorithmOutput) {.
    importcpp: "SetGraphConnection", header: "vtkKCoreLayout.h".}
proc constructvtkKCoreLayout*(): vtkKCoreLayout {.constructor,
    importcpp: "vtkKCoreLayout(@)", header: "vtkKCoreLayout.h".}
proc destroyvtkKCoreLayout*(this: var vtkKCoreLayout) {.
    importcpp: "#.~vtkKCoreLayout()", header: "vtkKCoreLayout.h".}
proc FillInputPortInformation*(this: var vtkKCoreLayout; port: cint;
                              info: ptr vtkInformation): cint {.
    importcpp: "FillInputPortInformation", header: "vtkKCoreLayout.h".}
proc SetKCoreLabelArrayName*(this: var vtkKCoreLayout; _arg: cstring) {.
    importcpp: "SetKCoreLabelArrayName", header: "vtkKCoreLayout.h".}
  ## /@}
  ## /@{
  ## *
  ##  Output polar coordinates for vertices if True.  Default column names are
  ##  coord_radius, coord_angle.
  ##  Default: False
  ##
## !!!Ignored construct:  virtual bool GetPolar ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Polar  of  << this -> Polar ) ; return this -> Polar ; } ;
## Error: expected ';'!!!

proc SetPolar*(this: var vtkKCoreLayout; _arg: bool) {.importcpp: "SetPolar",
    header: "vtkKCoreLayout.h".}
proc PolarOn*(this: var vtkKCoreLayout) {.importcpp: "PolarOn",
                                      header: "vtkKCoreLayout.h".}
proc PolarOff*(this: var vtkKCoreLayout) {.importcpp: "PolarOff",
                                       header: "vtkKCoreLayout.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set whether or not to convert output to cartesian coordinates.  If false, coordinates
  ##  will be returned in polar coordinates (radius, angle).
  ##  Default: True
  ##
## !!!Ignored construct:  virtual bool GetPolarCartesian ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Cartesian  of  << this -> Cartesian ) ; return this -> Cartesian ; } ;
## Error: expected ';'!!!

proc SetPolarCartesian*(this: var vtkKCoreLayout; _arg: bool) {.
    importcpp: "SetPolarCartesian", header: "vtkKCoreLayout.h".}
proc CartesianOn*(this: var vtkKCoreLayout) {.importcpp: "CartesianOn",
    header: "vtkKCoreLayout.h".}
proc CartesianOff*(this: var vtkKCoreLayout) {.importcpp: "CartesianOff",
    header: "vtkKCoreLayout.h".}
  ## /@}
  ## /@{
  ## *
  ##  Polar coordinates array name for radius values.
  ##  This is only used if OutputCartesianCoordinates is False.
  ##  Default: coord_radius
  ##
proc SetKCoreLabelArrayNamePolarCoordsRadiusArrayName*(this: var vtkKCoreLayout;
    _arg: cstring) {.importcpp: "SetKCoreLabelArrayNamePolarCoordsRadiusArrayName",
                   header: "vtkKCoreLayout.h".}
proc GetPolarCoordsRadiusArrayName*(this: var vtkKCoreLayout): cstring {.
    importcpp: "GetPolarCoordsRadiusArrayName", header: "vtkKCoreLayout.h".}
  ## /@}
  ## /@{
  ## *
  ##  Polar coordinates array name for angle values in radians.
  ##  This is only used if OutputCartesianCoordinates is False.
  ##  Default: coord_angle
  ##
proc SetKCoreLabelArrayNamePolarCoordsRadiusArrayNamePolarCoordsAngleArrayName*(
    this: var vtkKCoreLayout; _arg: cstring) {.importcpp: "SetKCoreLabelArrayNamePolarCoordsRadiusArrayNamePolarCoordsAngleArrayName",
    header: "vtkKCoreLayout.h".}
proc GetPolarCoordsRadiusArrayNamePolarCoordsAngleArrayName*(
    this: var vtkKCoreLayout): cstring {.importcpp: "GetPolarCoordsRadiusArrayNamePolarCoordsAngleArrayName",
                                     header: "vtkKCoreLayout.h".}
  ## /@}
  ## /@{
  ## *
  ##  Cartesian coordinates array name for the X coordinates.
  ##  This is only used if OutputCartesianCoordinates is True.
  ##  Default: coord_x
  ##
proc SetKCoreLabelArrayNamePolarCoordsRadiusArrayNamePolarCoordsAngleArrayNameCartesianCoordsXArrayName*(
    this: var vtkKCoreLayout; _arg: cstring) {.importcpp: "SetKCoreLabelArrayNamePolarCoordsRadiusArrayNamePolarCoordsAngleArrayNameCartesianCoordsXArrayName",
    header: "vtkKCoreLayout.h".}
proc GetPolarCoordsRadiusArrayNamePolarCoordsAngleArrayNameCartesianCoordsXArrayName*(
    this: var vtkKCoreLayout): cstring {.importcpp: "GetPolarCoordsRadiusArrayNamePolarCoordsAngleArrayNameCartesianCoordsXArrayName",
                                     header: "vtkKCoreLayout.h".}
  ## /@}
  ## /@{
  ## *
  ##  Cartesian coordinates array name for the Y coordinates.
  ##  This is only used if OutputCartesianCoordinates is True.
  ##  Default: coord_y
  ##
proc SetKCoreLabelArrayNamePolarCoordsRadiusArrayNamePolarCoordsAngleArrayNameCartesianCoordsXArrayNameCartesianCoordsYArrayName*(
    this: var vtkKCoreLayout; _arg: cstring) {.importcpp: "SetKCoreLabelArrayNamePolarCoordsRadiusArrayNamePolarCoordsAngleArrayNameCartesianCoordsXArrayNameCartesianCoordsYArrayName",
    header: "vtkKCoreLayout.h".}
proc GetPolarCoordsRadiusArrayNamePolarCoordsAngleArrayNameCartesianCoordsXArrayNameCartesianCoordsYArrayName*(
    this: var vtkKCoreLayout): cstring {.importcpp: "GetPolarCoordsRadiusArrayNamePolarCoordsAngleArrayNameCartesianCoordsXArrayNameCartesianCoordsYArrayName",
                                     header: "vtkKCoreLayout.h".}
  ## /@}
  ## /@{
  ## *
  ##  Epsilon value used in the algorithm.
  ##  Default = 0.2
  ##
proc SetPolarCartesianEpsilon*(this: var vtkKCoreLayout; _arg: cfloat) {.
    importcpp: "SetPolarCartesianEpsilon", header: "vtkKCoreLayout.h".}
## !!!Ignored construct:  virtual float GetPolarCartesianEpsilon ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Epsilon  of  << this -> Epsilon ) ; return this -> Epsilon ; } ;
## Error: expected ';'!!!

proc SetPolarCartesianEpsilonUnitRadius*(this: var vtkKCoreLayout; _arg: cfloat) {.
    importcpp: "SetPolarCartesianEpsilonUnitRadius", header: "vtkKCoreLayout.h".}
## !!!Ignored construct:  virtual float GetPolarCartesianEpsilonUnitRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UnitRadius  of  << this -> UnitRadius ) ; return this -> UnitRadius ; } ;
## Error: expected ';'!!!

proc RequestData*(this: var vtkKCoreLayout; a2: ptr vtkInformation;
                 a3: ptr ptr vtkInformationVector; a4: ptr vtkInformationVector): cint {.
    importcpp: "RequestData", header: "vtkKCoreLayout.h".}