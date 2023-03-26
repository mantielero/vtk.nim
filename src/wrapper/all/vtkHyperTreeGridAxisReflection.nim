## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHyperTreeGridAxisReflection.h
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
##  @class   vtkHyperTreeGridAxisReflection
##  @brief   Reflect a hyper tree grid
##
##
##  This filter reflect the cells of a hyper tree grid with respect to
##  one of the planes parallel to the bounding box of the data set.
##
##  @sa
##  vtkHyperTreeGrid vtkHyperTreeGridAlgorithm vtkReflectionFilter
##
##  @par Thanks:
##  This class was written by Philippe Pebay based on a idea of Guenole
##  Harel and Jacques-Bernard Lekien, 2016
##  This work was supported by Commissariat a l'Energie Atomique (CEA/DIF)
##

import
  vtkFiltersHyperTreeModule, vtkHyperTreeGridAlgorithm

discard "forward decl of vtkHyperTreeGrid"
type
  vtkHyperTreeGridAxisReflection* {.importcpp: "vtkHyperTreeGridAxisReflection",
                                   header: "vtkHyperTreeGridAxisReflection.h",
                                   bycopy.} = object of vtkHyperTreeGridAlgorithm
    vtkHyperTreeGridAxisReflection* {.importc: "vtkHyperTreeGridAxisReflection".}: VTK_NEWINSTANCE
    ## *
    ##  Position of the plane relative to given axis
    ##  Only used if the reflection plane is X, Y or Z
    ##


proc New*(): ptr vtkHyperTreeGridAxisReflection {.
    importcpp: "vtkHyperTreeGridAxisReflection::New(@)",
    header: "vtkHyperTreeGridAxisReflection.h".}
type
  vtkHyperTreeGridAxisReflectionSuperclass* = vtkHyperTreeGridAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkHyperTreeGridAxisReflection::IsTypeOf(@)",
    header: "vtkHyperTreeGridAxisReflection.h".}
proc IsA*(this: var vtkHyperTreeGridAxisReflection; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkHyperTreeGridAxisReflection.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkHyperTreeGridAxisReflection {.
    importcpp: "vtkHyperTreeGridAxisReflection::SafeDownCast(@)",
    header: "vtkHyperTreeGridAxisReflection.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkHyperTreeGridAxisReflection :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHyperTreeGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHyperTreeGridAxisReflection :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHyperTreeGridAxisReflection :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkHyperTreeGridAxisReflection; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkHyperTreeGridAxisReflection.h".}
type
  vtkHyperTreeGridAxisReflectionAxisReflectionPlane* {.size: sizeof(cint),
      importcpp: "vtkHyperTreeGridAxisReflection::AxisReflectionPlane",
      header: "vtkHyperTreeGridAxisReflection.h".} = enum
    USE_X_MIN = 0, USE_Y_MIN = 1, USE_Z_MIN = 2, USE_X_MAX = 3, USE_Y_MAX = 4, USE_Z_MAX = 5,
    USE_X = 6, USE_Y = 7, USE_Z = 8


proc SetPlane*(this: var vtkHyperTreeGridAxisReflection; _arg: cint) {.
    importcpp: "SetPlane", header: "vtkHyperTreeGridAxisReflection.h".}
proc GetPlaneMinValue*(this: var vtkHyperTreeGridAxisReflection): cint {.
    importcpp: "GetPlaneMinValue", header: "vtkHyperTreeGridAxisReflection.h".}
proc GetPlaneMaxValue*(this: var vtkHyperTreeGridAxisReflection): cint {.
    importcpp: "GetPlaneMaxValue", header: "vtkHyperTreeGridAxisReflection.h".}
## !!!Ignored construct:  virtual int GetPlane ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Plane  of  << this -> Plane ) ; return this -> Plane ; } ;
## Error: expected ';'!!!

proc SetPlaneToX*(this: var vtkHyperTreeGridAxisReflection) {.
    importcpp: "SetPlaneToX", header: "vtkHyperTreeGridAxisReflection.h".}
proc SetPlaneToY*(this: var vtkHyperTreeGridAxisReflection) {.
    importcpp: "SetPlaneToY", header: "vtkHyperTreeGridAxisReflection.h".}
proc SetPlaneToZ*(this: var vtkHyperTreeGridAxisReflection) {.
    importcpp: "SetPlaneToZ", header: "vtkHyperTreeGridAxisReflection.h".}
proc SetPlaneToXMin*(this: var vtkHyperTreeGridAxisReflection) {.
    importcpp: "SetPlaneToXMin", header: "vtkHyperTreeGridAxisReflection.h".}
proc SetPlaneToYMin*(this: var vtkHyperTreeGridAxisReflection) {.
    importcpp: "SetPlaneToYMin", header: "vtkHyperTreeGridAxisReflection.h".}
proc SetPlaneToZMin*(this: var vtkHyperTreeGridAxisReflection) {.
    importcpp: "SetPlaneToZMin", header: "vtkHyperTreeGridAxisReflection.h".}
proc SetPlaneToXMax*(this: var vtkHyperTreeGridAxisReflection) {.
    importcpp: "SetPlaneToXMax", header: "vtkHyperTreeGridAxisReflection.h".}
proc SetPlaneToYMax*(this: var vtkHyperTreeGridAxisReflection) {.
    importcpp: "SetPlaneToYMax", header: "vtkHyperTreeGridAxisReflection.h".}
proc SetPlaneToZMax*(this: var vtkHyperTreeGridAxisReflection) {.
    importcpp: "SetPlaneToZMax", header: "vtkHyperTreeGridAxisReflection.h".}
proc SetCenter*(this: var vtkHyperTreeGridAxisReflection; _arg: cdouble) {.
    importcpp: "SetCenter", header: "vtkHyperTreeGridAxisReflection.h".}
## !!!Ignored construct:  virtual double GetPlaneCenter ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Center  of  << this -> Center ) ; return this -> Center ; } ;
## Error: expected ';'!!!
