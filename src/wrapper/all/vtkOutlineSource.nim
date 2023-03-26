## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOutlineSource.h
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
##  @class   vtkOutlineSource
##  @brief   create wireframe outline around bounding box
##
##  vtkOutlineSource creates a wireframe outline around a
##  user-specified bounding box.  The outline may be created aligned
##  with the {x,y,z} axis - in which case it is defined by the 6 bounds
##  {xmin,xmax,ymin,ymax,zmin,zmax} via SetBounds(). Alternatively, the
##  box may be arbitrarily aligned, in which case it should be set via
##  the SetCorners() member.
##

import
  vtkFiltersSourcesModule, vtkPolyDataAlgorithm

const
  VTK_BOX_TYPE_AXIS_ALIGNED* = 0
  VTK_BOX_TYPE_ORIENTED* = 1

type
  vtkOutlineSource* {.importcpp: "vtkOutlineSource", header: "vtkOutlineSource.h",
                     bycopy.} = object of vtkPolyDataAlgorithm ## /@{
                                                          ## *
                                                          ##  Standard methods for instantiation. type information, and printing.
                                                          ##
    vtkOutlineSource* {.importc: "vtkOutlineSource".}: VTK_NEWINSTANCE


proc New*(): ptr vtkOutlineSource {.importcpp: "vtkOutlineSource::New(@)",
                                header: "vtkOutlineSource.h".}
type
  vtkOutlineSourceSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOutlineSource::IsTypeOf(@)", header: "vtkOutlineSource.h".}
proc IsA*(this: var vtkOutlineSource; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkOutlineSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOutlineSource {.
    importcpp: "vtkOutlineSource::SafeDownCast(@)", header: "vtkOutlineSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOutlineSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOutlineSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOutlineSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOutlineSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkOutlineSource.h".}
proc SetBoxType*(this: var vtkOutlineSource; _arg: cint) {.importcpp: "SetBoxType",
    header: "vtkOutlineSource.h".}
## !!!Ignored construct:  virtual int GetBoxType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BoxType  of  << this -> BoxType ) ; return this -> BoxType ; } ;
## Error: expected ';'!!!

proc SetBoxTypeToAxisAligned*(this: var vtkOutlineSource) {.
    importcpp: "SetBoxTypeToAxisAligned", header: "vtkOutlineSource.h".}
proc SetBoxTypeToOriented*(this: var vtkOutlineSource) {.
    importcpp: "SetBoxTypeToOriented", header: "vtkOutlineSource.h".}
proc SetBounds*(this: var vtkOutlineSource; _arg1: cdouble; _arg2: cdouble;
               _arg3: cdouble; _arg4: cdouble; _arg5: cdouble; _arg6: cdouble) {.
    importcpp: "SetBounds", header: "vtkOutlineSource.h".}
proc SetBounds*(this: var vtkOutlineSource; _arg: array[6, cdouble]) {.
    importcpp: "SetBounds", header: "vtkOutlineSource.h".}
## !!!Ignored construct:  virtual double * GetBounds ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Bounds  pointer  << this -> Bounds ) ; return this -> Bounds ; } VTK_WRAPEXCLUDE virtual void GetBounds ( double data [ 6 ] ) { for ( int i = 0 ; i < 6 ; i ++ ) { data [ i ] = this -> Bounds [ i ] ; } } ;
## Error: expected ';'!!!

proc SetCorners*(this: var vtkOutlineSource; data: ptr cdouble) {.
    importcpp: "SetCorners", header: "vtkOutlineSource.h".}
## !!!Ignored construct:  virtual double * GetBoundsCorners ( ) VTK_SIZEHINT ( 24 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Corners  pointer  << this -> Corners ) ; return this -> Corners ; } VTK_WRAPEXCLUDE virtual void GetBoundsCorners ( double data [ 24 ] ) { for ( int i = 0 ; i < 24 ; i ++ ) { data [ i ] = this -> Corners [ i ] ; } } ;
## Error: expected ';'!!!

proc SetBoxTypeGenerateFaces*(this: var vtkOutlineSource; _arg: vtkTypeBool) {.
    importcpp: "SetBoxTypeGenerateFaces", header: "vtkOutlineSource.h".}
proc GenerateFacesOn*(this: var vtkOutlineSource) {.importcpp: "GenerateFacesOn",
    header: "vtkOutlineSource.h".}
proc GenerateFacesOff*(this: var vtkOutlineSource) {.importcpp: "GenerateFacesOff",
    header: "vtkOutlineSource.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetBoxTypeGenerateFaces ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateFaces  of  << this -> GenerateFaces ) ; return this -> GenerateFaces ; } ;
## Error: expected ';'!!!

proc SetBoxTypeGenerateFacesOutputPointsPrecision*(this: var vtkOutlineSource;
    _arg: cint) {.importcpp: "SetBoxTypeGenerateFacesOutputPointsPrecision",
                header: "vtkOutlineSource.h".}
## !!!Ignored construct:  virtual int GetBoxTypeGenerateFacesOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ;
## Error: expected ';'!!!
