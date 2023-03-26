## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMarkerUtilities.h
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
##  @class   vtkMarkerUtilities
##  @brief   Utilities for generating marker images
##
##
##  This class programmatically generates markers of a specified size
##  for various marker styles.
##
##  @sa
##  vtkPlotLine, vtkPlotPoints
##

import
  vtkRenderingContext2DModule, vtkObject

discard "forward decl of vtkImageData"
type
  vtkMarkerUtilities* {.importcpp: "vtkMarkerUtilities",
                       header: "vtkMarkerUtilities.h", bycopy.} = object of vtkObject
    vtkMarkerUtilities* {.importc: "vtkMarkerUtilities".}: VTK_NEWINSTANCE

  vtkMarkerUtilitiesSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMarkerUtilities::IsTypeOf(@)", header: "vtkMarkerUtilities.h".}
proc IsA*(this: var vtkMarkerUtilities; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkMarkerUtilities.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMarkerUtilities {.
    importcpp: "vtkMarkerUtilities::SafeDownCast(@)",
    header: "vtkMarkerUtilities.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMarkerUtilities :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMarkerUtilities :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMarkerUtilities :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkMarkerUtilities; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkMarkerUtilities.h".}
const
  vtkMarkerUtilitiesNONE* = 0
  vtkMarkerUtilitiesCROSS* = 1
  vtkMarkerUtilitiesPLUS* = 2
  vtkMarkerUtilitiesSQUARE* = 3
  vtkMarkerUtilitiesCIRCLE* = 4
  vtkMarkerUtilitiesDIAMOND* = 5

proc GenerateMarker*(data: ptr vtkImageData; style: cint; width: cint) {.
    importcpp: "vtkMarkerUtilities::GenerateMarker(@)",
    header: "vtkMarkerUtilities.h".}