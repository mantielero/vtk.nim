## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkStereoCompositor.h
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
##  @class vtkStereoCompositor
##  @brief helper class to generate composited stereo images.
##
##  vtkStereoCompositor is used by vtkRenderWindow to composite left and right
##  eye rendering results into a single color buffer.
##
##  Note that all methods on vtkStereoCompositor take in pointers to the left and
##  right rendering results and generate the result in the buffer passed for the
##  left eye.
##

import
  vtkObject, vtkRenderingCoreModule

discard "forward decl of vtkUnsignedCharArray"
type
  vtkStereoCompositor* {.importcpp: "vtkStereoCompositor",
                        header: "vtkStereoCompositor.h", bycopy.} = object of vtkObject
    vtkStereoCompositor* {.importc: "vtkStereoCompositor".}: VTK_NEWINSTANCE


proc New*(): ptr vtkStereoCompositor {.importcpp: "vtkStereoCompositor::New(@)",
                                   header: "vtkStereoCompositor.h".}
type
  vtkStereoCompositorSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkStereoCompositor::IsTypeOf(@)", header: "vtkStereoCompositor.h".}
proc IsA*(this: var vtkStereoCompositor; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkStereoCompositor.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkStereoCompositor {.
    importcpp: "vtkStereoCompositor::SafeDownCast(@)",
    header: "vtkStereoCompositor.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkStereoCompositor :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkStereoCompositor :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkStereoCompositor :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkStereoCompositor; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkStereoCompositor.h".}
proc RedBlue*(this: var vtkStereoCompositor;
             rgbLeftNResult: ptr vtkUnsignedCharArray;
             rgbRight: ptr vtkUnsignedCharArray): bool {.importcpp: "RedBlue",
    header: "vtkStereoCompositor.h".}
proc Anaglyph*(this: var vtkStereoCompositor;
              rgbLeftNResult: ptr vtkUnsignedCharArray;
              rgbRight: ptr vtkUnsignedCharArray; colorSaturation: cfloat;
              colorMask: array[2, cint]): bool {.importcpp: "Anaglyph",
    header: "vtkStereoCompositor.h".}
proc Interlaced*(this: var vtkStereoCompositor;
                rgbLeftNResult: ptr vtkUnsignedCharArray;
                rgbRight: ptr vtkUnsignedCharArray; size: array[2, cint]): bool {.
    importcpp: "Interlaced", header: "vtkStereoCompositor.h".}
proc Dresden*(this: var vtkStereoCompositor;
             rgbLeftNResult: ptr vtkUnsignedCharArray;
             rgbRight: ptr vtkUnsignedCharArray; size: array[2, cint]): bool {.
    importcpp: "Dresden", header: "vtkStereoCompositor.h".}
proc Checkerboard*(this: var vtkStereoCompositor;
                  rgbLeftNResult: ptr vtkUnsignedCharArray;
                  rgbRight: ptr vtkUnsignedCharArray; size: array[2, cint]): bool {.
    importcpp: "Checkerboard", header: "vtkStereoCompositor.h".}
proc SplitViewportHorizontal*(this: var vtkStereoCompositor;
                             rgbLeftNResult: ptr vtkUnsignedCharArray;
                             rgbRight: ptr vtkUnsignedCharArray;
                             size: array[2, cint]): bool {.
    importcpp: "SplitViewportHorizontal", header: "vtkStereoCompositor.h".}