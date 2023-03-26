## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPolyDataPointPlacer.h
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
##  @class   vtkPolyDataPointPlacer
##  @brief   Base class to place points given constraints on polygonal data
##
##
##  vtkPolyDataPointPlacer is a base class to place points on the surface of
##  polygonal data.
##
##  @par Usage:
##  The actors that render polygonal data and wish to be considered
##  for placement by this placer are added to the list as
##  \code
##  placer->AddProp( polyDataActor );
##  \endcode
##
##  @sa
##  vtkPolygonalSurfacePointPlacer
##

import
  vtkInteractionWidgetsModule, vtkPointPlacer

discard "forward decl of vtkRenderer"
discard "forward decl of vtkPropCollection"
discard "forward decl of vtkProp"
discard "forward decl of vtkPropPicker"
type
  vtkPolyDataPointPlacer* {.importcpp: "vtkPolyDataPointPlacer",
                           header: "vtkPolyDataPointPlacer.h", bycopy.} = object of vtkPointPlacer ## *
                                                                                            ##  Instantiate this class.
                                                                                            ##
    vtkPolyDataPointPlacer* {.importc: "vtkPolyDataPointPlacer".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPolyDataPointPlacer {.importcpp: "vtkPolyDataPointPlacer::New(@)",
                                      header: "vtkPolyDataPointPlacer.h".}
type
  vtkPolyDataPointPlacerSuperclass* = vtkPointPlacer

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPolyDataPointPlacer::IsTypeOf(@)",
    header: "vtkPolyDataPointPlacer.h".}
proc IsA*(this: var vtkPolyDataPointPlacer; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPolyDataPointPlacer.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPolyDataPointPlacer {.
    importcpp: "vtkPolyDataPointPlacer::SafeDownCast(@)",
    header: "vtkPolyDataPointPlacer.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPolyDataPointPlacer :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPointPlacer :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPolyDataPointPlacer :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPolyDataPointPlacer :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPolyDataPointPlacer; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPolyDataPointPlacer.h".}
proc AddProp*(this: var vtkPolyDataPointPlacer; a2: ptr vtkProp) {.
    importcpp: "AddProp", header: "vtkPolyDataPointPlacer.h".}
proc RemoveViewProp*(this: var vtkPolyDataPointPlacer; prop: ptr vtkProp) {.
    importcpp: "RemoveViewProp", header: "vtkPolyDataPointPlacer.h".}
proc RemoveAllProps*(this: var vtkPolyDataPointPlacer) {.
    importcpp: "RemoveAllProps", header: "vtkPolyDataPointPlacer.h".}
proc HasProp*(this: var vtkPolyDataPointPlacer; a2: ptr vtkProp): cint {.
    importcpp: "HasProp", header: "vtkPolyDataPointPlacer.h".}
proc GetNumberOfProps*(this: var vtkPolyDataPointPlacer): cint {.
    importcpp: "GetNumberOfProps", header: "vtkPolyDataPointPlacer.h".}
proc ComputeWorldPosition*(this: var vtkPolyDataPointPlacer; ren: ptr vtkRenderer;
                          displayPos: array[2, cdouble];
                          worldPos: array[3, cdouble];
                          worldOrient: array[9, cdouble]): cint {.
    importcpp: "ComputeWorldPosition", header: "vtkPolyDataPointPlacer.h".}
proc ComputeWorldPosition*(this: var vtkPolyDataPointPlacer; ren: ptr vtkRenderer;
                          displayPos: array[2, cdouble];
                          refWorldPos: array[3, cdouble];
                          worldPos: array[3, cdouble];
                          worldOrient: array[9, cdouble]): cint {.
    importcpp: "ComputeWorldPosition", header: "vtkPolyDataPointPlacer.h".}
proc ValidateWorldPosition*(this: var vtkPolyDataPointPlacer;
                           worldPos: array[3, cdouble]): cint {.
    importcpp: "ValidateWorldPosition", header: "vtkPolyDataPointPlacer.h".}
proc ValidateDisplayPosition*(this: var vtkPolyDataPointPlacer; a2: ptr vtkRenderer;
                             displayPos: array[2, cdouble]): cint {.
    importcpp: "ValidateDisplayPosition", header: "vtkPolyDataPointPlacer.h".}
proc ValidateWorldPosition*(this: var vtkPolyDataPointPlacer;
                           worldPos: array[3, cdouble];
                           worldOrient: array[9, cdouble]): cint {.
    importcpp: "ValidateWorldPosition", header: "vtkPolyDataPointPlacer.h".}
proc GetnamePropPicker*(this: var vtkPolyDataPointPlacer): ptr vtkPropPicker {.
    importcpp: "GetnamePropPicker", header: "vtkPolyDataPointPlacer.h".}
  ## /@}