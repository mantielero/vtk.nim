## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTextureMapToPlane.h
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
##  @class   vtkTextureMapToPlane
##  @brief   generate texture coordinates by mapping points to plane
##
##  vtkTextureMapToPlane is a filter that generates 2D texture coordinates
##  by mapping input dataset points onto a plane. The plane can either be
##  user specified or generated automatically. (A least squares method is
##  used to generate the plane automatically.)
##
##  There are two ways you can specify the plane. The first is to provide a
##  plane normal. In this case the points are projected to a plane, and the
##  points are then mapped into the user specified s-t coordinate range. For
##  more control, you can specify a plane with three points: an origin and two
##  points defining the two axes of the plane. (This is compatible with the
##  vtkPlaneSource.) Using the second method, the SRange and TRange vectors
##  are ignored, since the presumption is that the user does not want to scale
##  the texture coordinates; and you can adjust the origin and axes points to
##  achieve the texture coordinate scaling you need. Note also that using the
##  three point method the axes do not have to be orthogonal.
##
##  @sa
##   vtkPlaneSource vtkTextureMapToCylinder
##  vtkTextureMapToSphere vtkThresholdTextureCoords
##

import
  vtkDataSetAlgorithm, vtkFiltersTextureModule

type
  vtkTextureMapToPlane* {.importcpp: "vtkTextureMapToPlane",
                         header: "vtkTextureMapToPlane.h", bycopy.} = object of vtkDataSetAlgorithm
    vtkTextureMapToPlane* {.importc: "vtkTextureMapToPlane".}: VTK_NEWINSTANCE

  vtkTextureMapToPlaneSuperclass* = vtkDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTextureMapToPlane::IsTypeOf(@)",
    header: "vtkTextureMapToPlane.h".}
proc IsA*(this: var vtkTextureMapToPlane; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTextureMapToPlane.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTextureMapToPlane {.
    importcpp: "vtkTextureMapToPlane::SafeDownCast(@)",
    header: "vtkTextureMapToPlane.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTextureMapToPlane :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTextureMapToPlane :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTextureMapToPlane :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTextureMapToPlane; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTextureMapToPlane.h".}
proc New*(): ptr vtkTextureMapToPlane {.importcpp: "vtkTextureMapToPlane::New(@)",
                                    header: "vtkTextureMapToPlane.h".}
proc SetOrigin*(this: var vtkTextureMapToPlane; _arg1: cdouble; _arg2: cdouble;
               _arg3: cdouble) {.importcpp: "SetOrigin",
                               header: "vtkTextureMapToPlane.h".}
proc SetOrigin*(this: var vtkTextureMapToPlane; _arg: array[3, cdouble]) {.
    importcpp: "SetOrigin", header: "vtkTextureMapToPlane.h".}
## !!!Ignored construct:  virtual double * GetOrigin ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Origin  pointer  << this -> Origin ) ; return this -> Origin ; } VTK_WRAPEXCLUDE virtual void GetOrigin ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Origin [ i ] ; } } ;
## Error: expected ';'!!!

proc SetOriginPoint1*(this: var vtkTextureMapToPlane; _arg1: cdouble; _arg2: cdouble;
                     _arg3: cdouble) {.importcpp: "SetOriginPoint1",
                                     header: "vtkTextureMapToPlane.h".}
proc SetOriginPoint1*(this: var vtkTextureMapToPlane; _arg: array[3, cdouble]) {.
    importcpp: "SetOriginPoint1", header: "vtkTextureMapToPlane.h".}
## !!!Ignored construct:  virtual double * GetOriginPoint1 ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Point1  pointer  << this -> Point1 ) ; return this -> Point1 ; } VTK_WRAPEXCLUDE virtual void GetOriginPoint1 ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Point1 [ i ] ; } } ;
## Error: expected ';'!!!

proc SetOriginPoint1Point2*(this: var vtkTextureMapToPlane; _arg1: cdouble;
                           _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetOriginPoint1Point2", header: "vtkTextureMapToPlane.h".}
proc SetOriginPoint1Point2*(this: var vtkTextureMapToPlane; _arg: array[3, cdouble]) {.
    importcpp: "SetOriginPoint1Point2", header: "vtkTextureMapToPlane.h".}
## !!!Ignored construct:  virtual double * GetOriginPoint1Point2 ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Point2  pointer  << this -> Point2 ) ; return this -> Point2 ; } VTK_WRAPEXCLUDE virtual void GetOriginPoint1Point2 ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Point2 [ i ] ; } } ;
## Error: expected ';'!!!

proc SetOriginPoint1Point2Normal*(this: var vtkTextureMapToPlane; _arg1: cdouble;
                                 _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetOriginPoint1Point2Normal", header: "vtkTextureMapToPlane.h".}
proc SetOriginPoint1Point2Normal*(this: var vtkTextureMapToPlane;
                                 _arg: array[3, cdouble]) {.
    importcpp: "SetOriginPoint1Point2Normal", header: "vtkTextureMapToPlane.h".}
## !!!Ignored construct:  virtual double * GetOriginPoint1Point2Normal ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Normal  pointer  << this -> Normal ) ; return this -> Normal ; } VTK_WRAPEXCLUDE virtual void GetOriginPoint1Point2Normal ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Normal [ i ] ; } } ;
## Error: expected ';'!!!

proc SetSRange*(this: var vtkTextureMapToPlane; _arg1: cdouble; _arg2: cdouble) {.
    importcpp: "SetSRange", header: "vtkTextureMapToPlane.h".}
proc SetSRange*(this: var vtkTextureMapToPlane; _arg: array[2, cdouble]) {.
    importcpp: "SetSRange", header: "vtkTextureMapToPlane.h".}
## !!!Ignored construct:  virtual double * GetOriginPoint1Point2NormalSRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << SRange  pointer  << this -> SRange ) ; return this -> SRange ; } VTK_WRAPEXCLUDE virtual void GetOriginPoint1Point2NormalSRange ( double data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> SRange [ i ] ; } } ;
## Error: expected ';'!!!

proc SetSRangeTRange*(this: var vtkTextureMapToPlane; _arg1: cdouble; _arg2: cdouble) {.
    importcpp: "SetSRangeTRange", header: "vtkTextureMapToPlane.h".}
proc SetSRangeTRange*(this: var vtkTextureMapToPlane; _arg: array[2, cdouble]) {.
    importcpp: "SetSRangeTRange", header: "vtkTextureMapToPlane.h".}
## !!!Ignored construct:  virtual double * GetOriginPoint1Point2NormalSRangeTRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << TRange  pointer  << this -> TRange ) ; return this -> TRange ; } VTK_WRAPEXCLUDE virtual void GetOriginPoint1Point2NormalSRangeTRange ( double data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> TRange [ i ] ; } } ;
## Error: expected ';'!!!

proc SetAutomaticPlaneGeneration*(this: var vtkTextureMapToPlane; _arg: vtkTypeBool) {.
    importcpp: "SetAutomaticPlaneGeneration", header: "vtkTextureMapToPlane.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetAutomaticPlaneGeneration ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AutomaticPlaneGeneration  of  << this -> AutomaticPlaneGeneration ) ; return this -> AutomaticPlaneGeneration ; } ;
## Error: expected ';'!!!

proc AutomaticPlaneGenerationOn*(this: var vtkTextureMapToPlane) {.
    importcpp: "AutomaticPlaneGenerationOn", header: "vtkTextureMapToPlane.h".}
proc AutomaticPlaneGenerationOff*(this: var vtkTextureMapToPlane) {.
    importcpp: "AutomaticPlaneGenerationOff", header: "vtkTextureMapToPlane.h".}
  ## /@}