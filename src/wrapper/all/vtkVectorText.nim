## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkVectorText.h
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
##  @class   vtkVectorText
##  @brief   create polygonal text
##
##
##  vtkVectorText generates vtkPolyData from an input text string. Besides the
##  ASCII alphanumeric characters a-z, A-Z, 0-9, vtkVectorText also supports
##  ASCII punctuation marks. (The supported ASCII character set are the codes
##  (33-126) inclusive.) The only control character supported is the line feed
##  character "\n", which advances to a new line.
##
##  To use this class, you normally couple it with a vtkPolyDataMapper and a
##  vtkActor. In this case you would use the vtkActor's transformation methods
##  to position, orient, and scale the text. You may also wish to use a
##  vtkFollower to orient the text so that it always faces the camera.
##
##  @sa
##  vtkTextMapper vtkCaptionActor2D
##

import
  vtkPolyDataAlgorithm, vtkRenderingFreeTypeModule

type
  vtkVectorText* {.importcpp: "vtkVectorText", header: "vtkVectorText.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkVectorText* {.importc: "vtkVectorText".}: VTK_NEWINSTANCE


proc New*(): ptr vtkVectorText {.importcpp: "vtkVectorText::New(@)",
                             header: "vtkVectorText.h".}
type
  vtkVectorTextSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkVectorText::IsTypeOf(@)", header: "vtkVectorText.h".}
proc IsA*(this: var vtkVectorText; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkVectorText.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkVectorText {.
    importcpp: "vtkVectorText::SafeDownCast(@)", header: "vtkVectorText.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkVectorText :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkVectorText :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkVectorText :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkVectorText; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkVectorText.h".}
proc SetText*(this: var vtkVectorText; _arg: cstring) {.importcpp: "SetText",
    header: "vtkVectorText.h".}
proc GetText*(this: var vtkVectorText): cstring {.importcpp: "GetText",
    header: "vtkVectorText.h".}
  ## /@}