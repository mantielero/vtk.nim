## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSynchronizedTemplates2D.h
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
##  @class   vtkSynchronizedTemplates2D
##  @brief   generate isoline(s) from a structured points set
##
##  vtkSynchronizedTemplates2D is a 2D implementation of the synchronized
##  template algorithm. Note that vtkContourFilter will automatically
##  use this class when appropriate.
##
##  @warning
##  This filter is specialized to 2D images.
##
##  @sa
##  vtkContourFilter vtkFlyingEdges2D vtkMarchingSquares
##  vtkSynchronizedTemplates3D vtkDiscreteFlyingEdges2D
##

import
  vtkFiltersCoreModule, vtkPolyDataAlgorithm, vtkContourValues

discard "forward decl of vtkImageData"
type
  vtkSynchronizedTemplates2D* {.importcpp: "vtkSynchronizedTemplates2D",
                               header: "vtkSynchronizedTemplates2D.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkSynchronizedTemplates2D* {.importc: "vtkSynchronizedTemplates2D".}: VTK_NEWINSTANCE


proc New*(): ptr vtkSynchronizedTemplates2D {.
    importcpp: "vtkSynchronizedTemplates2D::New(@)",
    header: "vtkSynchronizedTemplates2D.h".}
type
  vtkSynchronizedTemplates2DSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSynchronizedTemplates2D::IsTypeOf(@)",
    header: "vtkSynchronizedTemplates2D.h".}
proc IsA*(this: var vtkSynchronizedTemplates2D; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkSynchronizedTemplates2D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSynchronizedTemplates2D {.
    importcpp: "vtkSynchronizedTemplates2D::SafeDownCast(@)",
    header: "vtkSynchronizedTemplates2D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSynchronizedTemplates2D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSynchronizedTemplates2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSynchronizedTemplates2D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSynchronizedTemplates2D; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkSynchronizedTemplates2D.h".}
proc GetMTime*(this: var vtkSynchronizedTemplates2D): vtkMTimeType {.
    importcpp: "GetMTime", header: "vtkSynchronizedTemplates2D.h".}
proc SetValue*(this: var vtkSynchronizedTemplates2D; i: cint; value: cdouble) {.
    importcpp: "SetValue", header: "vtkSynchronizedTemplates2D.h".}
proc GetValue*(this: var vtkSynchronizedTemplates2D; i: cint): cdouble {.
    importcpp: "GetValue", header: "vtkSynchronizedTemplates2D.h".}
proc GetValues*(this: var vtkSynchronizedTemplates2D): ptr cdouble {.
    importcpp: "GetValues", header: "vtkSynchronizedTemplates2D.h".}
proc GetValues*(this: var vtkSynchronizedTemplates2D; contourValues: ptr cdouble) {.
    importcpp: "GetValues", header: "vtkSynchronizedTemplates2D.h".}
proc SetNumberOfContours*(this: var vtkSynchronizedTemplates2D; number: cint) {.
    importcpp: "SetNumberOfContours", header: "vtkSynchronizedTemplates2D.h".}
proc GetNumberOfContours*(this: var vtkSynchronizedTemplates2D): vtkIdType {.
    importcpp: "GetNumberOfContours", header: "vtkSynchronizedTemplates2D.h".}
proc GenerateValues*(this: var vtkSynchronizedTemplates2D; numContours: cint;
                    range: array[2, cdouble]) {.importcpp: "GenerateValues",
    header: "vtkSynchronizedTemplates2D.h".}
proc GenerateValues*(this: var vtkSynchronizedTemplates2D; numContours: cint;
                    rangeStart: cdouble; rangeEnd: cdouble) {.
    importcpp: "GenerateValues", header: "vtkSynchronizedTemplates2D.h".}
proc SetComputeScalars*(this: var vtkSynchronizedTemplates2D; _arg: vtkTypeBool) {.
    importcpp: "SetComputeScalars", header: "vtkSynchronizedTemplates2D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetComputeScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeScalars  of  << this -> ComputeScalars ) ; return this -> ComputeScalars ; } ;
## Error: expected ';'!!!

proc ComputeScalarsOn*(this: var vtkSynchronizedTemplates2D) {.
    importcpp: "ComputeScalarsOn", header: "vtkSynchronizedTemplates2D.h".}
proc ComputeScalarsOff*(this: var vtkSynchronizedTemplates2D) {.
    importcpp: "ComputeScalarsOff", header: "vtkSynchronizedTemplates2D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get which component of the scalar array to contour on; defaults to 0.
  ##
proc SetComputeScalarsArrayComponent*(this: var vtkSynchronizedTemplates2D;
                                     _arg: cint) {.
    importcpp: "SetComputeScalarsArrayComponent",
    header: "vtkSynchronizedTemplates2D.h".}
## !!!Ignored construct:  virtual int GetComputeScalarsArrayComponent ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ArrayComponent  of  << this -> ArrayComponent ) ; return this -> ArrayComponent ; } ;
## Error: expected ';'!!!
