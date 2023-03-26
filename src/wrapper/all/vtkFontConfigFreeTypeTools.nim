## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFontConfigFreeTypeTools.h
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
##  @class   vtkFontConfigFreeTypeTools
##  @brief   Subclass of vtkFreeTypeTools that uses
##  system installed fonts.
##
##
##  vtkFontConfigFreeTypeTools defers to vtkFreeTypeTools for rendering and
##  rasterization, but sources fonts from a FontConfig system lookup. If the
##  lookup fails, the compiled fonts of vtkFreeType are used instead.
##
##  @warning
##  Do not instantiate this class directly. Rather, call
##  vtkFreeTypeTools::GetInstance() to ensure that the singleton design is
##  correctly applied.
##  Be aware that FontConfig lookup is disabled by default. To enable, call
##  vtkFreeTypeTools::GetInstance()->ForceCompiledFontsOff();
##

import
  vtkFreeTypeTools, vtkRenderingFreeTypeFontConfigModule

type
  vtkFontConfigFreeTypeTools* {.importcpp: "vtkFontConfigFreeTypeTools",
                               header: "vtkFontConfigFreeTypeTools.h", bycopy.} = object of vtkFreeTypeTools
    vtkFontConfigFreeTypeTools* {.importc: "vtkFontConfigFreeTypeTools".}: VTK_NEWINSTANCE

  vtkFontConfigFreeTypeToolsSuperclass* = vtkFreeTypeTools

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkFontConfigFreeTypeTools::IsTypeOf(@)",
    header: "vtkFontConfigFreeTypeTools.h".}
proc IsA*(this: var vtkFontConfigFreeTypeTools; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkFontConfigFreeTypeTools.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkFontConfigFreeTypeTools {.
    importcpp: "vtkFontConfigFreeTypeTools::SafeDownCast(@)",
    header: "vtkFontConfigFreeTypeTools.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkFontConfigFreeTypeTools :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkFreeTypeTools :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFontConfigFreeTypeTools :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFontConfigFreeTypeTools :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkFontConfigFreeTypeTools; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkFontConfigFreeTypeTools.h".}
proc New*(): ptr vtkFontConfigFreeTypeTools {.
    importcpp: "vtkFontConfigFreeTypeTools::New(@)",
    header: "vtkFontConfigFreeTypeTools.h".}
proc LookupFaceFontConfig*(tprop: ptr vtkTextProperty; lib: FT_Library;
                          face: ptr FT_Face): bool {.
    importcpp: "vtkFontConfigFreeTypeTools::LookupFaceFontConfig(@)",
    header: "vtkFontConfigFreeTypeTools.h".}