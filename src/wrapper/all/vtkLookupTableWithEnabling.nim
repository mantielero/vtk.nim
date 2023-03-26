## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLookupTableWithEnabling.h
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
##  @class   vtkLookupTableWithEnabling
##  @brief   A lookup table that allows for an
##  optional array to be provided that specifies which scalars to "enable" and
##  which to "disable".
##
##
##  vtkLookupTableWithEnabling "disables" or "grays out" output colors
##  based on whether the given value in EnabledArray is "0" or not.
##
##
##  @warning
##  You must set the EnabledArray before MapScalars() is called.
##  Indices of EnabledArray must map directly to those of the array passed
##  to MapScalars().
##
##

import
  vtkLookupTable, vtkRenderingCoreModule

discard "forward decl of vtkDataArray"
type
  vtkLookupTableWithEnabling* {.importcpp: "vtkLookupTableWithEnabling",
                               header: "vtkLookupTableWithEnabling.h", bycopy.} = object of vtkLookupTable
    vtkLookupTableWithEnabling* {.importc: "vtkLookupTableWithEnabling".}: VTK_NEWINSTANCE


proc New*(): ptr vtkLookupTableWithEnabling {.
    importcpp: "vtkLookupTableWithEnabling::New(@)",
    header: "vtkLookupTableWithEnabling.h".}
type
  vtkLookupTableWithEnablingSuperclass* = vtkLookupTable

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkLookupTableWithEnabling::IsTypeOf(@)",
    header: "vtkLookupTableWithEnabling.h".}
proc IsA*(this: var vtkLookupTableWithEnabling; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkLookupTableWithEnabling.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkLookupTableWithEnabling {.
    importcpp: "vtkLookupTableWithEnabling::SafeDownCast(@)",
    header: "vtkLookupTableWithEnabling.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkLookupTableWithEnabling :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkLookupTable :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLookupTableWithEnabling :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLookupTableWithEnabling :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkLookupTableWithEnabling; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkLookupTableWithEnabling.h".}
proc GetnameEnabledArray*(this: var vtkLookupTableWithEnabling): ptr vtkDataArray {.
    importcpp: "GetnameEnabledArray", header: "vtkLookupTableWithEnabling.h".}
proc SetEnabledArray*(this: var vtkLookupTableWithEnabling;
                     enabledArray: ptr vtkDataArray) {.
    importcpp: "SetEnabledArray", header: "vtkLookupTableWithEnabling.h".}
proc MapScalarsThroughTable2*(this: var vtkLookupTableWithEnabling; input: pointer;
                             output: ptr cuchar; inputDataType: cint;
                             numberOfValues: cint; inputIncrement: cint;
                             outputFormat: cint) {.
    importcpp: "MapScalarsThroughTable2", header: "vtkLookupTableWithEnabling.h".}
proc DisableColor*(this: var vtkLookupTableWithEnabling; r: cuchar; g: cuchar;
                  b: cuchar; rd: ptr cuchar; gd: ptr cuchar; bd: ptr cuchar) {.
    importcpp: "DisableColor", header: "vtkLookupTableWithEnabling.h".}