## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTextRenderer.h
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
##  @class   vtkTextRenderer
##  @brief   Interface for generating images and path data from
##  string data, using multiple backends.
##
##
##  vtkTextRenderer produces images, bounding boxes, and vtkPath
##  objects that represent text. The advantage of using this class is to easily
##  integrate mathematical expressions into renderings by automatically switching
##  between FreeType and MathText backends. If the input string contains at least
##  two "$" symbols separated by text, the MathText backend will be used.
##  Alternatively, the presence of unescaped "|" symbols defines multicolumn lines,
##  which are processed with the MathText backend.
##
##  If the string does not meet these criteria, or if no MathText implementation is
##  available, the faster FreeType rendering facilities are used. Literal $
##  symbols can be used by escaping them with backslashes, "\$" (or "\\$" if the
##  string is set programmatically).
##
##  For example, "Acceleration ($\\frac{m}{s^2}$)" will use MathText, but
##  "\\$500, \\$100" will use FreeType.
##
##  By default, the backend is set to Detect, which determines the backend based
##  on the contents of the string. This can be changed by setting the
##  DefaultBackend ivar.
##
##  Note that this class is abstract -- link to the vtkRenderingFreetype module
##  to get the default implementation.
##

import
  vtkObject, vtkRenderingCoreModule, vtkTuple, vtkVector

discard "forward decl of vtkImageData"
discard "forward decl of vtkPath"
discard "forward decl of vtkStdString"
discard "forward decl of vtkTextProperty"
discard "forward decl of RegularExpression"
type
  vtkTextRendererCleanup* {.importcpp: "vtkTextRendererCleanup",
                           header: "vtkTextRenderer.h", bycopy.} = object


proc constructvtkTextRendererCleanup*(): vtkTextRendererCleanup {.constructor,
    importcpp: "vtkTextRendererCleanup(@)", header: "vtkTextRenderer.h".}
proc destroyvtkTextRendererCleanup*(this: var vtkTextRendererCleanup) {.
    importcpp: "#.~vtkTextRendererCleanup()", header: "vtkTextRenderer.h".}
type
  vtkTextRenderer* {.importcpp: "vtkTextRenderer", header: "vtkTextRenderer.h",
                    bycopy.} = object of vtkObject
    vtkTextRenderer* {.importc: "vtkTextRenderer".}: VTK_NEWINSTANCE
    ## /@{
    ## *
    ##  Replace all instances of "\$" with "$".
    ##

  vtkTextRendererMetrics* {.importcpp: "vtkTextRenderer::Metrics",
                           header: "vtkTextRenderer.h", bycopy.} = object ## *
                                                                     ##  Construct a Metrics object with all members initialized to 0.
                                                                     ##
    BoundingBox* {.importc: "BoundingBox".}: vtkTuple[cint, 4] ## /@{
                                                          ## *
                                                          ##  The corners of the rendered text (or background, if applicable), in pixels.
                                                          ##  Uses the same origin as BoundingBox.
                                                          ##
    TopLeft* {.importc: "TopLeft".}: vtkVector2i
    TopRight* {.importc: "TopRight".}: vtkVector2i
    BottomLeft* {.importc: "BottomLeft".}: vtkVector2i
    BottomRight* {.importc: "BottomRight".}: vtkVector2i ## /@}
                                                     ## *
                                                     ##  Vectors representing the rotated ascent and descent of the text. This is
                                                     ##  the distance above or below the baseline. Not all backends support this,
                                                     ##  and may leave these vectors set to 0.
                                                     ##  @{
                                                     ##
    Ascent* {.importc: "Ascent".}: vtkVector2i
    Descent* {.importc: "Descent".}: vtkVector2i ## *@}


proc constructvtkTextRendererMetrics*(): vtkTextRendererMetrics {.constructor,
    importcpp: "vtkTextRenderer::Metrics(@)", header: "vtkTextRenderer.h".}
type
  vtkTextRendererSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTextRenderer::IsTypeOf(@)", header: "vtkTextRenderer.h".}
proc IsA*(this: var vtkTextRenderer; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkTextRenderer.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTextRenderer {.
    importcpp: "vtkTextRenderer::SafeDownCast(@)", header: "vtkTextRenderer.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTextRenderer :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTextRenderer :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTextRenderer :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTextRenderer; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTextRenderer.h".}
proc New*(): ptr vtkTextRenderer {.importcpp: "vtkTextRenderer::New(@)",
                               header: "vtkTextRenderer.h".}
proc GetInstance*(): ptr vtkTextRenderer {.importcpp: "vtkTextRenderer::GetInstance(@)",
                                       header: "vtkTextRenderer.h".}
type
  vtkTextRendererBackend* {.size: sizeof(cint),
                           importcpp: "vtkTextRenderer::Backend",
                           header: "vtkTextRenderer.h".} = enum
    Default = -1, Detect = 0, FreeType, MathText, UserBackend = 16


proc SetDefaultBackend*(this: var vtkTextRenderer; _arg: cint) {.
    importcpp: "SetDefaultBackend", header: "vtkTextRenderer.h".}
## !!!Ignored construct:  virtual int GetDefaultBackend ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DefaultBackend  of  << this -> DefaultBackend ) ; return this -> DefaultBackend ; } ;
## Error: expected ';'!!!

proc DetectBackend*(this: var vtkTextRenderer; str: vtkStdString): cint {.
    importcpp: "DetectBackend", header: "vtkTextRenderer.h".}
proc FreeTypeIsSupported*(this: var vtkTextRenderer): bool {.
    importcpp: "FreeTypeIsSupported", header: "vtkTextRenderer.h".}
proc MathTextIsSupported*(this: var vtkTextRenderer): bool {.
    importcpp: "MathTextIsSupported", header: "vtkTextRenderer.h".}
proc GetBoundingBox*(this: var vtkTextRenderer; tprop: ptr vtkTextProperty;
                    str: vtkStdString; bbox: array[4, cint]; dpi: cint;
                    backend: cint = Default): bool {.importcpp: "GetBoundingBox",
    header: "vtkTextRenderer.h".}
proc GetMetrics*(this: var vtkTextRenderer; tprop: ptr vtkTextProperty;
                str: vtkStdString; metrics: var vtkTextRendererMetrics; dpi: cint;
                backend: cint = Default): bool {.importcpp: "GetMetrics",
    header: "vtkTextRenderer.h".}
proc RenderString*(this: var vtkTextRenderer; tprop: ptr vtkTextProperty;
                  str: vtkStdString; data: ptr vtkImageData;
                  textDims: array[2, cint]; dpi: cint; backend: cint = Default): bool {.
    importcpp: "RenderString", header: "vtkTextRenderer.h".}
proc GetConstrainedFontSize*(this: var vtkTextRenderer; str: vtkStdString;
                            tprop: ptr vtkTextProperty; targetWidth: cint;
                            targetHeight: cint; dpi: cint; backend: cint = Default): cint {.
    importcpp: "GetConstrainedFontSize", header: "vtkTextRenderer.h".}
proc StringToPath*(this: var vtkTextRenderer; tprop: ptr vtkTextProperty;
                  str: vtkStdString; path: ptr vtkPath; dpi: cint;
                  backend: cint = Default): bool {.importcpp: "StringToPath",
    header: "vtkTextRenderer.h".}
proc SetScaleToPowerOfTwo*(this: var vtkTextRenderer; scale: bool) {.
    importcpp: "SetScaleToPowerOfTwo", header: "vtkTextRenderer.h".}