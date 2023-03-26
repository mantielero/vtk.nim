## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkColorSeries.h
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
##  @class   vtkColorSeries
##  @brief   stores a list of colors.
##
##
##  The vtkColorSeries stores palettes of colors. There are several default
##  palettes (or schemes) available and functions to control several aspects
##  of what colors are returned. In essence a color scheme is set and then
##  the number of colors and individual color values may be requested.
##
##  For a web page showcasing the default palettes, see:
##  <a
##  href="https://htmlpreview.github.io/?https://github.com/Kitware/vtk-examples/blob/gh-pages/VTKColorSeriesPatches.html">VTKColorSeriesPatches</a>;
##  <a
##  href="https://kitware.github.io/vtk-examples/site/Python/Visualization/ColorSeriesPatches/">ColorSeriesPatches</a>
##  was used to generate this table.
##
##  It is also possible to add schemes beyond the default palettes.
##  Whenever \a SetColorScheme is called with a string for which no palette
##  already exists, a new, empty palette is created.
##  You may then use \a SetNumberOfColors and \a SetColor to populate the
##  palette.
##  You may not extend default palettes by calling functions that alter
##  a scheme; if called while a predefined palette is in use, they
##  will create a new non-default scheme and populate it with the current
##  palette before continuing.
##
##  The "Brewer" palettes are courtesy of
##  Cynthia A. Brewer (Dept. of Geography, Pennsylvania State University)
##  and under the Apache License. See the source code for details.
##

import
  vtkColor, vtkCommonColorModule, vtkObject, vtkStdString

discard "forward decl of vtkLookupTable"
type
  vtkColorSeries* {.importcpp: "vtkColorSeries", header: "vtkColorSeries.h", bycopy.} = object of vtkObject
    vtkColorSeries* {.importc: "vtkColorSeries".}: VTK_NEWINSTANCE
    vtkLookupTable* {.importc: "vtkLookupTable".}: VTK_NEWINSTANCE
    ## /@}
    ## *
    ##  The color scheme being used.
    ##
    ## / The color scheme being used.

  vtkColorSeriesSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkColorSeries::IsTypeOf(@)", header: "vtkColorSeries.h".}
proc IsA*(this: var vtkColorSeries; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkColorSeries.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkColorSeries {.
    importcpp: "vtkColorSeries::SafeDownCast(@)", header: "vtkColorSeries.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkColorSeries :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkColorSeries :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkColorSeries :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkColorSeries; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkColorSeries.h".}
proc New*(): ptr vtkColorSeries {.importcpp: "vtkColorSeries::New(@)",
                              header: "vtkColorSeries.h".}
type
  vtkColorSeriesColorSchemes* {.size: sizeof(cint),
                               importcpp: "vtkColorSeries::ColorSchemes",
                               header: "vtkColorSeries.h".} = enum ## / 7 different hues.
    SPECTRUM = 0,               ## / 6 warm colors (red to yellow).
    WARM,                     ## / 7 cool colors (green to purple).
    COOL,                     ## / 7 different blues.
    BLUES,                    ## / 7 colors from blue to magenta.
    WILD_FLOWER,              ## / 6 colors from green to orange.
    CITRUS,                   ## / purple-grey-orange diverging ColorBrewer scheme (11 colors)
    BREWER_DIVERGING_PURPLE_ORANGE_11, ## / purple-grey-orange diverging ColorBrewer scheme (10 colors)
    BREWER_DIVERGING_PURPLE_ORANGE_10, ## / purple-grey-orange diverging ColorBrewer scheme (9 colors)
    BREWER_DIVERGING_PURPLE_ORANGE_9, ## / purple-grey-orange diverging ColorBrewer scheme (8 colors)
    BREWER_DIVERGING_PURPLE_ORANGE_8, ## / purple-grey-orange diverging ColorBrewer scheme (7 colors)
    BREWER_DIVERGING_PURPLE_ORANGE_7, ## / purple-grey-orange diverging ColorBrewer scheme (6 colors)
    BREWER_DIVERGING_PURPLE_ORANGE_6, ## / purple-grey-orange diverging ColorBrewer scheme (5 colors)
    BREWER_DIVERGING_PURPLE_ORANGE_5, ## / purple-grey-orange diverging ColorBrewer scheme (4 colors)
    BREWER_DIVERGING_PURPLE_ORANGE_4, ## / purple-grey-orange diverging ColorBrewer scheme (3 colors)
    BREWER_DIVERGING_PURPLE_ORANGE_3, ## / diverging spectral ColorBrewer scheme (11 colors)
    BREWER_DIVERGING_SPECTRAL_11, ## / diverging spectral ColorBrewer scheme (10 colors)
    BREWER_DIVERGING_SPECTRAL_10, ## / diverging spectral ColorBrewer scheme (9 colors)
    BREWER_DIVERGING_SPECTRAL_9, ## / diverging spectral ColorBrewer scheme (8 colors)
    BREWER_DIVERGING_SPECTRAL_8, ## / diverging spectral ColorBrewer scheme (7 colors)
    BREWER_DIVERGING_SPECTRAL_7, ## / diverging spectral ColorBrewer scheme (6 colors)
    BREWER_DIVERGING_SPECTRAL_6, ## / diverging spectral ColorBrewer scheme (5 colors)
    BREWER_DIVERGING_SPECTRAL_5, ## / diverging spectral ColorBrewer scheme (4 colors)
    BREWER_DIVERGING_SPECTRAL_4, ## / diverging spectral ColorBrewer scheme (3 colors)
    BREWER_DIVERGING_SPECTRAL_3, ## / brown-blue-green diverging ColorBrewer scheme (11 colors)
    BREWER_DIVERGING_BROWN_BLUE_GREEN_11, ## / brown-blue-green diverging ColorBrewer scheme (10 colors)
    BREWER_DIVERGING_BROWN_BLUE_GREEN_10, ## / brown-blue-green diverging ColorBrewer scheme (9 colors)
    BREWER_DIVERGING_BROWN_BLUE_GREEN_9, ## / brown-blue-green diverging ColorBrewer scheme (8 colors)
    BREWER_DIVERGING_BROWN_BLUE_GREEN_8, ## / brown-blue-green diverging ColorBrewer scheme (7 colors)
    BREWER_DIVERGING_BROWN_BLUE_GREEN_7, ## / brown-blue-green diverging ColorBrewer scheme (6 colors)
    BREWER_DIVERGING_BROWN_BLUE_GREEN_6, ## / brown-blue-green diverging ColorBrewer scheme (5 colors)
    BREWER_DIVERGING_BROWN_BLUE_GREEN_5, ## / brown-blue-green diverging ColorBrewer scheme (4 colors)
    BREWER_DIVERGING_BROWN_BLUE_GREEN_4, ## / brown-blue-green diverging ColorBrewer scheme (3 colors)
    BREWER_DIVERGING_BROWN_BLUE_GREEN_3, ## / blue to green sequential ColorBrewer scheme (9 colors)
    BREWER_SEQUENTIAL_BLUE_GREEN_9, ## / blue to green sequential ColorBrewer scheme (8 colors)
    BREWER_SEQUENTIAL_BLUE_GREEN_8, ## / blue to green sequential ColorBrewer scheme (7 colors)
    BREWER_SEQUENTIAL_BLUE_GREEN_7, ## / blue to green sequential ColorBrewer scheme (6 colors)
    BREWER_SEQUENTIAL_BLUE_GREEN_6, ## / blue to green sequential ColorBrewer scheme (5 colors)
    BREWER_SEQUENTIAL_BLUE_GREEN_5, ## / blue to green sequential ColorBrewer scheme (4 colors)
    BREWER_SEQUENTIAL_BLUE_GREEN_4, ## / blue to green sequential ColorBrewer scheme (3 colors)
    BREWER_SEQUENTIAL_BLUE_GREEN_3, ## / yellow-orange-brown sequential ColorBrewer scheme (9 colors)
    BREWER_SEQUENTIAL_YELLOW_ORANGE_BROWN_9, ## / yellow-orange-brown sequential ColorBrewer scheme (8 colors)
    BREWER_SEQUENTIAL_YELLOW_ORANGE_BROWN_8, ## / yellow-orange-brown sequential ColorBrewer scheme (7 colors)
    BREWER_SEQUENTIAL_YELLOW_ORANGE_BROWN_7, ## / yellow-orange-brown sequential ColorBrewer scheme (6 colors)
    BREWER_SEQUENTIAL_YELLOW_ORANGE_BROWN_6, ## / yellow-orange-brown sequential ColorBrewer scheme (5 colors)
    BREWER_SEQUENTIAL_YELLOW_ORANGE_BROWN_5, ## / yellow-orange-brown sequential ColorBrewer scheme (4 colors)
    BREWER_SEQUENTIAL_YELLOW_ORANGE_BROWN_4, ## / yellow-orange-brown sequential ColorBrewer scheme (3 colors)
    BREWER_SEQUENTIAL_YELLOW_ORANGE_BROWN_3, ## / blue to purple sequential ColorBrewer scheme (9 colors)
    BREWER_SEQUENTIAL_BLUE_PURPLE_9, ## / blue to purple sequential ColorBrewer scheme (8 colors)
    BREWER_SEQUENTIAL_BLUE_PURPLE_8, ## / blue to purple sequential ColorBrewer scheme (7 colors)
    BREWER_SEQUENTIAL_BLUE_PURPLE_7, ## / blue to purple sequential ColorBrewer scheme (6 colors)
    BREWER_SEQUENTIAL_BLUE_PURPLE_6, ## / blue to purple sequential ColorBrewer scheme (5 colors)
    BREWER_SEQUENTIAL_BLUE_PURPLE_5, ## / blue to purple sequential ColorBrewer scheme (4 colors)
    BREWER_SEQUENTIAL_BLUE_PURPLE_4, ## / blue to purple sequential ColorBrewer scheme (3 colors)
    BREWER_SEQUENTIAL_BLUE_PURPLE_3, ## / qualitative ColorBrewer scheme good for accenting
    BREWER_QUALITATIVE_ACCENT, ## / a dark set of qualitative colors from ColorBrewer
    BREWER_QUALITATIVE_DARK2, ## / a qualitative ColorBrewer scheme useful for color set members
    BREWER_QUALITATIVE_SET2,  ## / a qualitative ColorBrewer scheme composed of pastel colors
    BREWER_QUALITATIVE_PASTEL2, ## / a qualitative ColorBrewer scheme composed of pastel colors
    BREWER_QUALITATIVE_PASTEL1, ## / a qualitative ColorBrewer scheme useful for color set members
    BREWER_QUALITATIVE_SET1,  ## / a qualitative ColorBrewer scheme with pairs of matching colors
    BREWER_QUALITATIVE_PAIRED, ## / a qualitative ColorBrewer scheme useful for color set members
    BREWER_QUALITATIVE_SET3,  ## / User specified color scheme.
    CUSTOM


type
  vtkColorSeriesLUTMode* {.size: sizeof(cint),
                          importcpp: "vtkColorSeries::LUTMode",
                          header: "vtkColorSeries.h".} = enum ## / indexed lookup is off
    ORDINAL = 0,                ## / indexed lookup is on
    CATEGORICAL


proc SetColorScheme*(this: var vtkColorSeries; scheme: cint) {.
    importcpp: "SetColorScheme", header: "vtkColorSeries.h".}
proc SetColorSchemeByName*(this: var vtkColorSeries; schemeName: vtkStdString): cint {.
    importcpp: "SetColorSchemeByName", header: "vtkColorSeries.h".}
proc GetNumberOfColorSchemes*(this: vtkColorSeries): cint {.noSideEffect,
    importcpp: "GetNumberOfColorSchemes", header: "vtkColorSeries.h".}
proc GetColorSchemeName*(this: vtkColorSeries): vtkStdString {.noSideEffect,
    importcpp: "GetColorSchemeName", header: "vtkColorSeries.h".}
proc SetColorSchemeName*(this: var vtkColorSeries; name: vtkStdString) {.
    importcpp: "SetColorSchemeName", header: "vtkColorSeries.h".}
proc GetColorScheme*(this: vtkColorSeries): cint {.noSideEffect,
    importcpp: "GetColorScheme", header: "vtkColorSeries.h".}
proc GetNumberOfColors*(this: vtkColorSeries): cint {.noSideEffect,
    importcpp: "GetNumberOfColors", header: "vtkColorSeries.h".}
proc SetNumberOfColors*(this: var vtkColorSeries; numColors: cint) {.
    importcpp: "SetNumberOfColors", header: "vtkColorSeries.h".}
proc GetColor*(this: vtkColorSeries; index: cint): vtkColor3ub {.noSideEffect,
    importcpp: "GetColor", header: "vtkColorSeries.h".}
proc GetColorRepeating*(this: vtkColorSeries; index: cint): vtkColor3ub {.
    noSideEffect, importcpp: "GetColorRepeating", header: "vtkColorSeries.h".}
proc SetColor*(this: var vtkColorSeries; index: cint; color: vtkColor3ub) {.
    importcpp: "SetColor", header: "vtkColorSeries.h".}
proc AddColor*(this: var vtkColorSeries; color: vtkColor3ub) {.importcpp: "AddColor",
    header: "vtkColorSeries.h".}
proc InsertColor*(this: var vtkColorSeries; index: cint; color: vtkColor3ub) {.
    importcpp: "InsertColor", header: "vtkColorSeries.h".}
proc RemoveColor*(this: var vtkColorSeries; index: cint) {.importcpp: "RemoveColor",
    header: "vtkColorSeries.h".}
proc ClearColors*(this: var vtkColorSeries) {.importcpp: "ClearColors",
    header: "vtkColorSeries.h".}
proc DeepCopy*(this: var vtkColorSeries; chartColors: ptr vtkColorSeries) {.
    importcpp: "DeepCopy", header: "vtkColorSeries.h".}
proc BuildLookupTable*(this: var vtkColorSeries; lkup: ptr vtkLookupTable;
                      lutIndexing: cint = CATEGORICAL) {.
    importcpp: "BuildLookupTable", header: "vtkColorSeries.h".}
## !!!Ignored construct:  * CreateLookupTable ( int lutIndexing = CATEGORICAL ) ;
## Error: identifier expected, but got: *!!!
