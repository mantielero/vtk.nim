## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMathTextFreeTypeTextRenderer.h
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
##  @class   vtkMathTextFreeTypeTextRenderer
##  @brief   Default implementation of
##  vtkTextRenderer.
##
##
##  Default implementation of vtkTextRenderer using vtkFreeTypeTools and
##  vtkMathTextUtilities.
##
##  @warning
##  The MathText backend does not currently support UTF16 strings, thus
##  UTF16 strings passed to the MathText renderer will be converted to
##  UTF8.
##

import
  vtkRenderingFreeTypeModule, vtkTextRenderer

discard "forward decl of vtkFreeTypeTools"
discard "forward decl of vtkMathTextUtilities"
type
  vtkMathTextFreeTypeTextRenderer* {.importcpp: "vtkMathTextFreeTypeTextRenderer", header: "vtkMathTextFreeTypeTextRenderer.h",
                                    bycopy.} = object of vtkTextRenderer
    vtkMathTextFreeTypeTextRenderer* {.importc: "vtkMathTextFreeTypeTextRenderer".}: VTK_NEWINSTANCE

  vtkMathTextFreeTypeTextRendererSuperclass* = vtkTextRenderer

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMathTextFreeTypeTextRenderer::IsTypeOf(@)",
    header: "vtkMathTextFreeTypeTextRenderer.h".}
proc IsA*(this: var vtkMathTextFreeTypeTextRenderer; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkMathTextFreeTypeTextRenderer.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMathTextFreeTypeTextRenderer {.
    importcpp: "vtkMathTextFreeTypeTextRenderer::SafeDownCast(@)",
    header: "vtkMathTextFreeTypeTextRenderer.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMathTextFreeTypeTextRenderer :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTextRenderer :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMathTextFreeTypeTextRenderer :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMathTextFreeTypeTextRenderer :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkMathTextFreeTypeTextRenderer; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkMathTextFreeTypeTextRenderer.h".}
proc New*(): ptr vtkMathTextFreeTypeTextRenderer {.
    importcpp: "vtkMathTextFreeTypeTextRenderer::New(@)",
    header: "vtkMathTextFreeTypeTextRenderer.h".}
proc FreeTypeIsSupported*(this: var vtkMathTextFreeTypeTextRenderer): bool {.
    importcpp: "FreeTypeIsSupported", header: "vtkMathTextFreeTypeTextRenderer.h".}
proc MathTextIsSupported*(this: var vtkMathTextFreeTypeTextRenderer): bool {.
    importcpp: "MathTextIsSupported", header: "vtkMathTextFreeTypeTextRenderer.h".}