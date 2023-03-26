## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkWarpVector.h
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
##  @class   vtkWarpVector
##  @brief   deform geometry with vector data
##
##  vtkWarpVector is a filter that modifies point coordinates by moving
##  points along vector times the scale factor. Useful for showing flow
##  profiles or mechanical deformation.
##
##  The filter passes both its point data and cell data to its output.
##

import
  vtkFiltersGeneralModule, vtkPointSetAlgorithm

type
  vtkWarpVector* {.importcpp: "vtkWarpVector", header: "vtkWarpVector.h", bycopy.} = object of vtkPointSetAlgorithm ## /@{
                                                                                                          ## *
                                                                                                          ##  Standard methods for instantiation, obtaining type information,
                                                                                                          ##  and printing.
                                                                                                          ##
    vtkWarpVector* {.importc: "vtkWarpVector".}: VTK_NEWINSTANCE


proc New*(): ptr vtkWarpVector {.importcpp: "vtkWarpVector::New(@)",
                             header: "vtkWarpVector.h".}
type
  vtkWarpVectorSuperclass* = vtkPointSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkWarpVector::IsTypeOf(@)", header: "vtkWarpVector.h".}
proc IsA*(this: var vtkWarpVector; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkWarpVector.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkWarpVector {.
    importcpp: "vtkWarpVector::SafeDownCast(@)", header: "vtkWarpVector.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkWarpVector :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPointSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkWarpVector :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkWarpVector :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkWarpVector; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkWarpVector.h".}
proc SetScaleFactor*(this: var vtkWarpVector; _arg: cdouble) {.
    importcpp: "SetScaleFactor", header: "vtkWarpVector.h".}
## !!!Ignored construct:  virtual double GetScaleFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScaleFactor  of  << this -> ScaleFactor ) ; return this -> ScaleFactor ; } ;
## Error: expected ';'!!!

proc SetScaleFactorOutputPointsPrecision*(this: var vtkWarpVector; _arg: cint) {.
    importcpp: "SetScaleFactorOutputPointsPrecision", header: "vtkWarpVector.h".}
## !!!Ignored construct:  virtual int GetScaleFactorOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ;
## Error: expected ';'!!!

proc FillInputPortInformation*(this: var vtkWarpVector; port: cint;
                              info: ptr vtkInformation): cint {.
    importcpp: "FillInputPortInformation", header: "vtkWarpVector.h".}