## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTessellatedBoxSource.h
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
##  @class   vtkTessellatedBoxSource
##  @brief   Create a polygonal representation of a box
##  with a given level of subdivision.
##
##  vtkTessellatedBoxSource creates a axis-aligned box defined by its bounds
##  and a level of subdivision. Connectivity is strong: points of the vertices
##  and inside the edges are shared between faces. In other words, faces are
##  connected. Each face looks like a grid of quads, each quad is composed of
##  2 triangles.
##  Given a level of subdivision `l', each edge has `l'+2 points, `l' of them
##  are internal edge points, the 2 other ones are the vertices.
##  Each face has a total of (`l'+2)*(`l'+2) points, 4 of them are vertices,
##  4*`l' are internal edge points, it remains `l'^2 internal face points.
##
##  This source only generate geometry, no DataArrays like normals or texture
##  coordinates.
##

import
  vtkFiltersSourcesModule, vtkPolyDataAlgorithm

type
  vtkTessellatedBoxSource* {.importcpp: "vtkTessellatedBoxSource",
                            header: "vtkTessellatedBoxSource.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkTessellatedBoxSource* {.importc: "vtkTessellatedBoxSource".}: VTK_NEWINSTANCE


proc New*(): ptr vtkTessellatedBoxSource {.importcpp: "vtkTessellatedBoxSource::New(@)",
                                       header: "vtkTessellatedBoxSource.h".}
type
  vtkTessellatedBoxSourceSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTessellatedBoxSource::IsTypeOf(@)",
    header: "vtkTessellatedBoxSource.h".}
proc IsA*(this: var vtkTessellatedBoxSource; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTessellatedBoxSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTessellatedBoxSource {.
    importcpp: "vtkTessellatedBoxSource::SafeDownCast(@)",
    header: "vtkTessellatedBoxSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTessellatedBoxSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTessellatedBoxSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTessellatedBoxSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTessellatedBoxSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTessellatedBoxSource.h".}
proc SetBounds*(this: var vtkTessellatedBoxSource; _arg1: cdouble; _arg2: cdouble;
               _arg3: cdouble; _arg4: cdouble; _arg5: cdouble; _arg6: cdouble) {.
    importcpp: "SetBounds", header: "vtkTessellatedBoxSource.h".}
proc SetBounds*(this: var vtkTessellatedBoxSource; _arg: array[6, cdouble]) {.
    importcpp: "SetBounds", header: "vtkTessellatedBoxSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Bounds of the box in world coordinates. This a 6-uple of xmin,xmax,ymin,
  ##  ymax,zmin and zmax. Initial value is (-0.5,0.5,-0.5,0.5,-0.5,0.5), bounds
  ##  of a cube of length 1 centered at (0,0,0). Bounds are defined such that
  ##  xmin<=xmax, ymin<=ymax and zmin<zmax.
  ##  \post xmin<=xmax && ymin<=ymax && zmin<zmax
  ##
## !!!Ignored construct:  virtual double * GetBounds ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Bounds  pointer  << this -> Bounds ) ; return this -> Bounds ; } VTK_WRAPEXCLUDE virtual void GetBounds ( double & _arg1 , double & _arg2 , double & _arg3 , double & _arg4 , double & _arg5 , double & _arg6 ) { _arg1 = this -> Bounds [ 0 ] ; _arg2 = this -> Bounds [ 1 ] ; _arg3 = this -> Bounds [ 2 ] ; _arg4 = this -> Bounds [ 3 ] ; _arg5 = this -> Bounds [ 4 ] ; _arg6 = this -> Bounds [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Bounds  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetBounds ( double _arg [ 6 ] ) { this -> GetBounds ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ;
## Error: expected ';'!!!

proc SetLevel*(this: var vtkTessellatedBoxSource; _arg: cint) {.importcpp: "SetLevel",
    header: "vtkTessellatedBoxSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Level of subdivision of the faces. Initial value is 0.
  ##  \post positive_level: level>=0
  ##
## !!!Ignored construct:  virtual int GetLevel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Level  of  << this -> Level ) ; return this -> Level ; } ;
## Error: expected ';'!!!

proc SetLevelDuplicateSharedPoints*(this: var vtkTessellatedBoxSource;
                                   _arg: vtkTypeBool) {.
    importcpp: "SetLevelDuplicateSharedPoints",
    header: "vtkTessellatedBoxSource.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetLevelDuplicateSharedPoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DuplicateSharedPoints  of  << this -> DuplicateSharedPoints ) ; return this -> DuplicateSharedPoints ; } ;
## Error: expected ';'!!!

proc DuplicateSharedPointsOn*(this: var vtkTessellatedBoxSource) {.
    importcpp: "DuplicateSharedPointsOn", header: "vtkTessellatedBoxSource.h".}
proc DuplicateSharedPointsOff*(this: var vtkTessellatedBoxSource) {.
    importcpp: "DuplicateSharedPointsOff", header: "vtkTessellatedBoxSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Flag to tell the source to generate either a quad or two triangle for a
  ##  set of four points. Initial value is false (generate triangles).
  ##
proc SetLevelDuplicateSharedPointsQuads*(this: var vtkTessellatedBoxSource;
                                        _arg: vtkTypeBool) {.
    importcpp: "SetLevelDuplicateSharedPointsQuads",
    header: "vtkTessellatedBoxSource.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetLevelDuplicateSharedPointsQuads ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Quads  of  << this -> Quads ) ; return this -> Quads ; } ;
## Error: expected ';'!!!

proc QuadsOn*(this: var vtkTessellatedBoxSource) {.importcpp: "QuadsOn",
    header: "vtkTessellatedBoxSource.h".}
proc QuadsOff*(this: var vtkTessellatedBoxSource) {.importcpp: "QuadsOff",
    header: "vtkTessellatedBoxSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get the desired precision for the output points.
  ##  vtkAlgorithm::SINGLE_PRECISION - Output single-precision floating point.
  ##  vtkAlgorithm::DOUBLE_PRECISION - Output double-precision floating point.
  ##
proc SetLevelDuplicateSharedPointsQuadsOutputPointsPrecision*(
    this: var vtkTessellatedBoxSource; _arg: cint) {.
    importcpp: "SetLevelDuplicateSharedPointsQuadsOutputPointsPrecision",
    header: "vtkTessellatedBoxSource.h".}
## !!!Ignored construct:  virtual int GetLevelDuplicateSharedPointsQuadsOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ;
## Error: expected ';'!!!
