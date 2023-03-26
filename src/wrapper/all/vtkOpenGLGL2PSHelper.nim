## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOpenGLGL2PSHelper.h
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
##  @class   vtkOpenGLGL2PSHelper
##  @brief   Access GL2PS functionality.
##
##
##  This class provides convenience functions that can be used to draw into a
##  GL2PS context. Link to vtkRenderingGL2PSOpenGL2 to bring in the
##  vtkOpenGLGL2PSHelperImpl class, the object factory override that implements
##  this interface.
##

import
  vtkObject, vtkRenderingOpenGL2Module

discard "forward decl of vtkActor"
discard "forward decl of vtkImageData"
discard "forward decl of vtkMatrix4x4"
discard "forward decl of vtkPath"
discard "forward decl of vtkRenderer"
discard "forward decl of vtkRenderWindow"
discard "forward decl of vtkTextProperty"
discard "forward decl of vtkTransformFeedback"
type
  vtkOpenGLGL2PSHelper* {.importcpp: "vtkOpenGLGL2PSHelper",
                         header: "vtkOpenGLGL2PSHelper.h", bycopy.} = object of vtkObject
    vtkOpenGLGL2PSHelper* {.importc: "vtkOpenGLGL2PSHelper".}: VTK_NEWINSTANCE


proc New*(): ptr vtkOpenGLGL2PSHelper {.importcpp: "vtkOpenGLGL2PSHelper::New(@)",
                                    header: "vtkOpenGLGL2PSHelper.h".}
type
  vtkOpenGLGL2PSHelperSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOpenGLGL2PSHelper::IsTypeOf(@)",
    header: "vtkOpenGLGL2PSHelper.h".}
proc IsA*(this: var vtkOpenGLGL2PSHelper; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkOpenGLGL2PSHelper.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOpenGLGL2PSHelper {.
    importcpp: "vtkOpenGLGL2PSHelper::SafeDownCast(@)",
    header: "vtkOpenGLGL2PSHelper.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOpenGLGL2PSHelper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( vtkOpenGLGL2PSHelper , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenGLGL2PSHelper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOpenGLGL2PSHelper; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkOpenGLGL2PSHelper.h".}
proc GetInstance*(): ptr vtkOpenGLGL2PSHelper {.
    importcpp: "vtkOpenGLGL2PSHelper::GetInstance(@)",
    header: "vtkOpenGLGL2PSHelper.h".}
proc SetInstance*(a1: ptr vtkOpenGLGL2PSHelper) {.
    importcpp: "vtkOpenGLGL2PSHelper::SetInstance(@)",
    header: "vtkOpenGLGL2PSHelper.h".}
proc GetnameRenderWindow*(this: var vtkOpenGLGL2PSHelper): ptr vtkRenderWindow {.
    importcpp: "GetnameRenderWindow", header: "vtkOpenGLGL2PSHelper.h".}
  ## /@}
type
  vtkOpenGLGL2PSHelperState* {.size: sizeof(cint),
                              importcpp: "vtkOpenGLGL2PSHelper::State",
                              header: "vtkOpenGLGL2PSHelper.h".} = enum
    Inactive = 0,               ## ! No export active
    Background,               ## ! Rendering rasterized props for the background.
    Capture                   ## ! Capturing vectorized objects.


## !!!Ignored construct:  /@{ *
##  Get the current export state. Vector images are rendered in two passes:
##  First, all non-vectorizable props are rendered, and the resulting image
##  is inserted as a raster image into the background of the exported file
##  (ActiveState == Background). Next, all vectorizable props are drawn
##  and captured into GL2PS, where they are drawn over the background image.
##  Vectorizable props should not draw themselves during the background pass,
##  and use the vtkOpenGLGL2PSHelper API to draw themselves during the capture
##  pass.
##  virtual State GetActiveStateActiveState ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ActiveState  of  << this -> ActiveState ) ; return this -> ActiveState ; } ;
## Error: expected ';'!!!

proc SetPointSize*(this: var vtkOpenGLGL2PSHelper; _arg: cfloat) {.
    importcpp: "SetPointSize", header: "vtkOpenGLGL2PSHelper.h".}
## !!!Ignored construct:  virtual float GetActiveStateActiveStatePointSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PointSize  of  << this -> PointSize ) ; return this -> PointSize ; } ;
## Error: expected ';'!!!

proc SetPointSizeLineWidth*(this: var vtkOpenGLGL2PSHelper; _arg: cfloat) {.
    importcpp: "SetPointSizeLineWidth", header: "vtkOpenGLGL2PSHelper.h".}
## !!!Ignored construct:  virtual float GetActiveStateActiveStatePointSizeLineWidth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LineWidth  of  << this -> LineWidth ) ; return this -> LineWidth ; } ;
## Error: expected ';'!!!

proc SetPointSizeLineWidthLineStipple*(this: var vtkOpenGLGL2PSHelper; _arg: cushort) {.
    importcpp: "SetPointSizeLineWidthLineStipple",
    header: "vtkOpenGLGL2PSHelper.h".}
## !!!Ignored construct:  virtual unsigned short GetActiveStateActiveStatePointSizeLineWidthLineStipple ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LineStipple  of  << this -> LineStipple ) ; return this -> LineStipple ; } ;
## Error: expected ';'!!!

proc ProcessTransformFeedback*(this: var vtkOpenGLGL2PSHelper;
                              tfc: ptr vtkTransformFeedback; ren: ptr vtkRenderer;
                              act: ptr vtkActor) {.
    importcpp: "ProcessTransformFeedback", header: "vtkOpenGLGL2PSHelper.h".}
proc ProcessTransformFeedback*(this: var vtkOpenGLGL2PSHelper;
                              tfc: ptr vtkTransformFeedback; ren: ptr vtkRenderer;
                              col: array[4, cuchar]) {.
    importcpp: "ProcessTransformFeedback", header: "vtkOpenGLGL2PSHelper.h".}
proc ProcessTransformFeedback*(this: var vtkOpenGLGL2PSHelper;
                              tfc: ptr vtkTransformFeedback; ren: ptr vtkRenderer;
                              col: array[4, cfloat]) {.
    importcpp: "ProcessTransformFeedback", header: "vtkOpenGLGL2PSHelper.h".}
proc DrawString*(this: var vtkOpenGLGL2PSHelper; str: string;
                tprop: ptr vtkTextProperty; pos: array[3, cdouble];
                backgroundDepth: cdouble; ren: ptr vtkRenderer) {.
    importcpp: "DrawString", header: "vtkOpenGLGL2PSHelper.h".}
proc DrawPath*(this: var vtkOpenGLGL2PSHelper; path: ptr vtkPath;
              rasterPos: array[3, cdouble]; windowPos: array[2, cdouble];
              rgba: array[4, cuchar]; scale: array[2, cdouble] = nil;
              rotateAngle: cdouble = 0.0; strokeWidth: cfloat = -1; label: cstring = nil) {.
    importcpp: "DrawPath", header: "vtkOpenGLGL2PSHelper.h".}
proc Draw3DPath*(this: var vtkOpenGLGL2PSHelper; path: ptr vtkPath;
                actorMatrix: ptr vtkMatrix4x4; rasterPos: array[3, cdouble];
                actorColor: array[4, cuchar]; ren: ptr vtkRenderer;
                label: cstring = nil) {.importcpp: "Draw3DPath",
                                    header: "vtkOpenGLGL2PSHelper.h".}
proc DrawImage*(this: var vtkOpenGLGL2PSHelper; image: ptr vtkImageData;
               pos: array[3, cdouble]) {.importcpp: "DrawImage",
                                      header: "vtkOpenGLGL2PSHelper.h".}