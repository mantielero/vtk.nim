## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkProjectPointsToPlane.h
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
##  @class   vtkProjectPointsToPlane
##  @brief   project all input points to a plane
##
##  vtkProjectPointsToPlane is a filter that operates on a vtkPointSet (and
##  its subclasses), projecting all input points to a plane. There are
##  multiple options as to what plane to project to: The user may specify one
##  of the x-y-z planes, the best coordinate plane, a user-defined plane, or
##  the closest fitting plane (using a least-squares method). On output, the
##  points will lie on the specified plane, and any cells connected to the
##  points (if any) will be deformed accordingly. On output, the filter will
##  not modify dataset topology, nor modify point or cell attributes. Only the
##  point coordinates (geometry) will be modified. (Note that the filter will
##  operate on input point sets with or without cells.)
##
##  @warning
##  It is possible that cells connected to the projected points will become
##  invalid after the projection operation.
##
##  @sa
##  vtkPlane
##

import
  vtkFiltersPointsModule, vtkPointSetAlgorithm

type
  vtkProjectPointsToPlane* {.importcpp: "vtkProjectPointsToPlane",
                            header: "vtkProjectPointsToPlane.h", bycopy.} = object of vtkPointSetAlgorithm ## /@{
                                                                                                    ## *
                                                                                                    ##  Standard methods for instantiation, obtaining type information, and
                                                                                                    ##  printing.
                                                                                                    ##
    vtkProjectPointsToPlane* {.importc: "vtkProjectPointsToPlane".}: VTK_NEWINSTANCE


proc New*(): ptr vtkProjectPointsToPlane {.importcpp: "vtkProjectPointsToPlane::New(@)",
                                       header: "vtkProjectPointsToPlane.h".}
type
  vtkProjectPointsToPlaneSuperclass* = vtkPointSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkProjectPointsToPlane::IsTypeOf(@)",
    header: "vtkProjectPointsToPlane.h".}
proc IsA*(this: var vtkProjectPointsToPlane; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkProjectPointsToPlane.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkProjectPointsToPlane {.
    importcpp: "vtkProjectPointsToPlane::SafeDownCast(@)",
    header: "vtkProjectPointsToPlane.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkProjectPointsToPlane :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPointSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkProjectPointsToPlane :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkProjectPointsToPlane :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkProjectPointsToPlane; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkProjectPointsToPlane.h".}
type
  vtkProjectPointsToPlanePlaneProjectionType* {.size: sizeof(cint),
      importcpp: "vtkProjectPointsToPlane::PlaneProjectionType",
      header: "vtkProjectPointsToPlane.h".} = enum
    X_PLANE = 1, Y_PLANE = 2, Z_PLANE = 3, SPECIFIED_PLANE = 4, BEST_COORDINATE_PLANE = 5,
    BEST_FIT_PLANE = 6


proc SetProjectionType*(this: var vtkProjectPointsToPlane; _arg: cint) {.
    importcpp: "SetProjectionType", header: "vtkProjectPointsToPlane.h".}
proc GetProjectionTypeMinValue*(this: var vtkProjectPointsToPlane): cint {.
    importcpp: "GetProjectionTypeMinValue", header: "vtkProjectPointsToPlane.h".}
proc GetProjectionTypeMaxValue*(this: var vtkProjectPointsToPlane): cint {.
    importcpp: "GetProjectionTypeMaxValue", header: "vtkProjectPointsToPlane.h".}
## !!!Ignored construct:  virtual int GetProjectionType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProjectionType  of  << this -> ProjectionType ) ; return this -> ProjectionType ; } ;
## Error: expected ';'!!!

proc SetProjectionTypeToXPlane*(this: var vtkProjectPointsToPlane) {.
    importcpp: "SetProjectionTypeToXPlane", header: "vtkProjectPointsToPlane.h".}
proc SetProjectionTypeToYPlane*(this: var vtkProjectPointsToPlane) {.
    importcpp: "SetProjectionTypeToYPlane", header: "vtkProjectPointsToPlane.h".}
proc SetProjectionTypeToZPlane*(this: var vtkProjectPointsToPlane) {.
    importcpp: "SetProjectionTypeToZPlane", header: "vtkProjectPointsToPlane.h".}
proc SetProjectionTypeToSpecifiedPlane*(this: var vtkProjectPointsToPlane) {.
    importcpp: "SetProjectionTypeToSpecifiedPlane",
    header: "vtkProjectPointsToPlane.h".}
proc SetProjectionTypeToBestCoordinatePlane*(this: var vtkProjectPointsToPlane) {.
    importcpp: "SetProjectionTypeToBestCoordinatePlane",
    header: "vtkProjectPointsToPlane.h".}
proc SetProjectionTypeToBestFitPlane*(this: var vtkProjectPointsToPlane) {.
    importcpp: "SetProjectionTypeToBestFitPlane",
    header: "vtkProjectPointsToPlane.h".}
proc SetOrigin*(this: var vtkProjectPointsToPlane; _arg1: cdouble; _arg2: cdouble;
               _arg3: cdouble) {.importcpp: "SetOrigin",
                               header: "vtkProjectPointsToPlane.h".}
proc SetOrigin*(this: var vtkProjectPointsToPlane; _arg: array[3, cdouble]) {.
    importcpp: "SetOrigin", header: "vtkProjectPointsToPlane.h".}
proc SetOriginNormal*(this: var vtkProjectPointsToPlane; _arg1: cdouble;
                     _arg2: cdouble; _arg3: cdouble) {.importcpp: "SetOriginNormal",
    header: "vtkProjectPointsToPlane.h".}
proc SetOriginNormal*(this: var vtkProjectPointsToPlane; _arg: array[3, cdouble]) {.
    importcpp: "SetOriginNormal", header: "vtkProjectPointsToPlane.h".}
## !!!Ignored construct:  virtual double * GetOrigin ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Origin  pointer  << this -> Origin ) ; return this -> Origin ; } VTK_WRAPEXCLUDE virtual void GetOrigin ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Origin [ 0 ] ; _arg2 = this -> Origin [ 1 ] ; _arg3 = this -> Origin [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Origin  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOrigin ( double _arg [ 3 ] ) { this -> GetOrigin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual double * GetOriginNormal ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Normal  pointer  << this -> Normal ) ; return this -> Normal ; } VTK_WRAPEXCLUDE virtual void GetOriginNormal ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Normal [ 0 ] ; _arg2 = this -> Normal [ 1 ] ; _arg3 = this -> Normal [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Normal  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOriginNormal ( double _arg [ 3 ] ) { this -> GetOriginNormal ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetOutputPointsPrecision*(this: var vtkProjectPointsToPlane; _arg: cint) {.
    importcpp: "SetOutputPointsPrecision", header: "vtkProjectPointsToPlane.h".}
## !!!Ignored construct:  virtual int GetProjectionTypeOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ;
## Error: expected ';'!!!
