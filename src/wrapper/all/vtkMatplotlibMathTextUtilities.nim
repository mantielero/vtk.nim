## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMatplotlibMathTextUtilities.h
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
##  @class   vtkMatplotlibMathTextUtilities
##  @brief   Access to MatPlotLib MathText rendering
##
##  vtkMatplotlibMathTextUtilities provides access to the MatPlotLib MathText
##  implementation.
##
##  This class is aware of a number of environment variables that can be used to
##  configure and debug python initialization (all are optional):
##  - VTK_MATPLOTLIB_DEBUG: Enable verbose debugging output during initialization
##  of the python environment.
##
##  This class handles rendering multiline and multicolumn strings into image data.
##  Use '\n' to define a line, and '|' to define a column.
##
##  This class does not support rendering multiline and multicolumn strings into
##  a vtkPath.
##
##  Example :
##
##  str =    "$\\sum_{i=0}^\\infty x_i$ | 2 | 3 | 4 \n"
##         +  1 | 2 | 3";
##
##  The vertical space between two lines can be set with vtkTextProperty::SetLineSpacing and
##  vtkTextProperty::SetLineOffset
##
##  The horizontal space between two cells can be set with vtkTextProperty::SetCellOffset
##
##  Line separators between grid cells can also be drawn.
##

import
  vtkMathTextUtilities, vtkRenderingMatplotlibModule

discard "forward decl of _object"
type
  PyObject* = _object

discard "forward decl of vtkSmartPyObject"
discard "forward decl of vtkImageData"
discard "forward decl of vtkPath"
discard "forward decl of vtkPythonInterpreter"
discard "forward decl of vtkTextProperty"
discard "forward decl of TextColors"
type
  vtkMatplotlibMathTextUtilities* {.importcpp: "vtkMatplotlibMathTextUtilities",
                                   header: "vtkMatplotlibMathTextUtilities.h",
                                   bycopy.} = object of vtkMathTextUtilities
    vtkMatplotlibMathTextUtilities* {.importc: "vtkMatplotlibMathTextUtilities".}: VTK_NEWINSTANCE

  vtkMatplotlibMathTextUtilitiesSuperclass* = vtkMathTextUtilities

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMatplotlibMathTextUtilities::IsTypeOf(@)",
    header: "vtkMatplotlibMathTextUtilities.h".}
proc IsA*(this: var vtkMatplotlibMathTextUtilities; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkMatplotlibMathTextUtilities.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMatplotlibMathTextUtilities {.
    importcpp: "vtkMatplotlibMathTextUtilities::SafeDownCast(@)",
    header: "vtkMatplotlibMathTextUtilities.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMatplotlibMathTextUtilities :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMathTextUtilities :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMatplotlibMathTextUtilities :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMatplotlibMathTextUtilities :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkMatplotlibMathTextUtilities; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkMatplotlibMathTextUtilities.h".}
proc New*(): ptr vtkMatplotlibMathTextUtilities {.
    importcpp: "vtkMatplotlibMathTextUtilities::New(@)",
    header: "vtkMatplotlibMathTextUtilities.h".}
proc IsAvailable*(this: var vtkMatplotlibMathTextUtilities): bool {.
    importcpp: "IsAvailable", header: "vtkMatplotlibMathTextUtilities.h".}
proc GetBoundingBox*(this: var vtkMatplotlibMathTextUtilities;
                    tprop: ptr vtkTextProperty; str: cstring; dpi: cint;
                    bbox: array[4, cint]): bool {.importcpp: "GetBoundingBox",
    header: "vtkMatplotlibMathTextUtilities.h".}
proc GetMetrics*(this: var vtkMatplotlibMathTextUtilities;
                tprop: ptr vtkTextProperty; str: cstring; dpi: cint;
                metrics: var Metrics): bool {.importcpp: "GetMetrics",
    header: "vtkMatplotlibMathTextUtilities.h".}
proc RenderString*(this: var vtkMatplotlibMathTextUtilities; str: cstring;
                  image: ptr vtkImageData; tprop: ptr vtkTextProperty; dpi: cint;
                  textDims: array[2, cint] = nil): bool {.importcpp: "RenderString",
    header: "vtkMatplotlibMathTextUtilities.h".}
proc StringToPath*(this: var vtkMatplotlibMathTextUtilities; str: cstring;
                  path: ptr vtkPath; tprop: ptr vtkTextProperty; dpi: cint): bool {.
    importcpp: "StringToPath", header: "vtkMatplotlibMathTextUtilities.h".}
proc SetScaleToPowerOfTwo*(this: var vtkMatplotlibMathTextUtilities; val: bool) {.
    importcpp: "SetScaleToPowerOfTwo", header: "vtkMatplotlibMathTextUtilities.h".}
proc GetScaleToPowerOfTwo*(this: var vtkMatplotlibMathTextUtilities): bool {.
    importcpp: "GetScaleToPowerOfTwo", header: "vtkMatplotlibMathTextUtilities.h".}