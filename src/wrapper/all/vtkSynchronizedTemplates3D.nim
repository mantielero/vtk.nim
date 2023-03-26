## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSynchronizedTemplates3D.h
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
##  @class   vtkSynchronizedTemplates3D
##  @brief   generate isosurface from structured points
##
##  vtkSynchronizedTemplates3D is a 3D implementation of the synchronized
##  template algorithm. Note that vtkContourFilter will automatically
##  use this class when appropriate.
##
##  @warning
##  This filter is specialized to 3D images (aka volumes).
##
##  @sa
##  vtkContourFilter vtkFlyingEdges3D vtkMarchingCubes
##  vtkSynchronizedTemplates2D vtkDiscreteFlyingEdges3D
##

import
  vtkContourValues, vtkFiltersCoreModule, vtkPolyDataAlgorithm

discard "forward decl of vtkImageData"
type
  vtkSynchronizedTemplates3D* {.importcpp: "vtkSynchronizedTemplates3D",
                               header: "vtkSynchronizedTemplates3D.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkSynchronizedTemplates3D* {.importc: "vtkSynchronizedTemplates3D".}: VTK_NEWINSTANCE


proc New*(): ptr vtkSynchronizedTemplates3D {.
    importcpp: "vtkSynchronizedTemplates3D::New(@)",
    header: "vtkSynchronizedTemplates3D.h".}
type
  vtkSynchronizedTemplates3DSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSynchronizedTemplates3D::IsTypeOf(@)",
    header: "vtkSynchronizedTemplates3D.h".}
proc IsA*(this: var vtkSynchronizedTemplates3D; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkSynchronizedTemplates3D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSynchronizedTemplates3D {.
    importcpp: "vtkSynchronizedTemplates3D::SafeDownCast(@)",
    header: "vtkSynchronizedTemplates3D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSynchronizedTemplates3D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSynchronizedTemplates3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSynchronizedTemplates3D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSynchronizedTemplates3D; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkSynchronizedTemplates3D.h".}
proc GetMTime*(this: var vtkSynchronizedTemplates3D): vtkMTimeType {.
    importcpp: "GetMTime", header: "vtkSynchronizedTemplates3D.h".}
proc SetComputeNormals*(this: var vtkSynchronizedTemplates3D; _arg: vtkTypeBool) {.
    importcpp: "SetComputeNormals", header: "vtkSynchronizedTemplates3D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetComputeNormals ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeNormals  of  << this -> ComputeNormals ) ; return this -> ComputeNormals ; } ;
## Error: expected ';'!!!

proc ComputeNormalsOn*(this: var vtkSynchronizedTemplates3D) {.
    importcpp: "ComputeNormalsOn", header: "vtkSynchronizedTemplates3D.h".}
proc ComputeNormalsOff*(this: var vtkSynchronizedTemplates3D) {.
    importcpp: "ComputeNormalsOff", header: "vtkSynchronizedTemplates3D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the computation of gradients. Gradient computation is
  ##  fairly expensive in both time and storage. Note that if
  ##  ComputeNormals is on, gradients will have to be calculated, but
  ##  will not be stored in the output dataset.  If the output data
  ##  will be processed by filters that modify topology or geometry, it
  ##  may be wise to turn Normals and Gradients off.
  ##
proc SetComputeNormalsComputeGradients*(this: var vtkSynchronizedTemplates3D;
                                       _arg: vtkTypeBool) {.
    importcpp: "SetComputeNormalsComputeGradients",
    header: "vtkSynchronizedTemplates3D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetComputeNormalsComputeGradients ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeGradients  of  << this -> ComputeGradients ) ; return this -> ComputeGradients ; } ;
## Error: expected ';'!!!

proc ComputeGradientsOn*(this: var vtkSynchronizedTemplates3D) {.
    importcpp: "ComputeGradientsOn", header: "vtkSynchronizedTemplates3D.h".}
proc ComputeGradientsOff*(this: var vtkSynchronizedTemplates3D) {.
    importcpp: "ComputeGradientsOff", header: "vtkSynchronizedTemplates3D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the computation of scalars.
  ##
proc SetComputeNormalsComputeGradientsComputeScalars*(
    this: var vtkSynchronizedTemplates3D; _arg: vtkTypeBool) {.
    importcpp: "SetComputeNormalsComputeGradientsComputeScalars",
    header: "vtkSynchronizedTemplates3D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetComputeNormalsComputeGradientsComputeScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeScalars  of  << this -> ComputeScalars ) ; return this -> ComputeScalars ; } ;
## Error: expected ';'!!!

proc ComputeScalarsOn*(this: var vtkSynchronizedTemplates3D) {.
    importcpp: "ComputeScalarsOn", header: "vtkSynchronizedTemplates3D.h".}
proc ComputeScalarsOff*(this: var vtkSynchronizedTemplates3D) {.
    importcpp: "ComputeScalarsOff", header: "vtkSynchronizedTemplates3D.h".}
  ## /@}
  ## /@{
  ## *
  ##  If this is enabled (by default), the output will be triangles
  ##  otherwise, the output will be the intersection polygons
  ##
proc SetComputeNormalsComputeGradientsComputeScalarsGenerateTriangles*(
    this: var vtkSynchronizedTemplates3D; _arg: vtkTypeBool) {.importcpp: "SetComputeNormalsComputeGradientsComputeScalarsGenerateTriangles",
    header: "vtkSynchronizedTemplates3D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetComputeNormalsComputeGradientsComputeScalarsGenerateTriangles ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateTriangles  of  << this -> GenerateTriangles ) ; return this -> GenerateTriangles ; } ;
## Error: expected ';'!!!

proc GenerateTrianglesOn*(this: var vtkSynchronizedTemplates3D) {.
    importcpp: "GenerateTrianglesOn", header: "vtkSynchronizedTemplates3D.h".}
proc GenerateTrianglesOff*(this: var vtkSynchronizedTemplates3D) {.
    importcpp: "GenerateTrianglesOff", header: "vtkSynchronizedTemplates3D.h".}
  ## /@}
  ## *
  ##  Set a particular contour value at contour number i. The index i ranges
  ##  between 0<=i<NumberOfContours.
  ##
proc SetValue*(this: var vtkSynchronizedTemplates3D; i: cint; value: cdouble) {.
    importcpp: "SetValue", header: "vtkSynchronizedTemplates3D.h".}
proc GetValue*(this: var vtkSynchronizedTemplates3D; i: cint): cdouble {.
    importcpp: "GetValue", header: "vtkSynchronizedTemplates3D.h".}
proc GetValues*(this: var vtkSynchronizedTemplates3D): ptr cdouble {.
    importcpp: "GetValues", header: "vtkSynchronizedTemplates3D.h".}
proc GetValues*(this: var vtkSynchronizedTemplates3D; contourValues: ptr cdouble) {.
    importcpp: "GetValues", header: "vtkSynchronizedTemplates3D.h".}
proc SetNumberOfContours*(this: var vtkSynchronizedTemplates3D; number: cint) {.
    importcpp: "SetNumberOfContours", header: "vtkSynchronizedTemplates3D.h".}
proc GetNumberOfContours*(this: var vtkSynchronizedTemplates3D): vtkIdType {.
    importcpp: "GetNumberOfContours", header: "vtkSynchronizedTemplates3D.h".}
proc GenerateValues*(this: var vtkSynchronizedTemplates3D; numContours: cint;
                    range: array[2, cdouble]) {.importcpp: "GenerateValues",
    header: "vtkSynchronizedTemplates3D.h".}
proc GenerateValues*(this: var vtkSynchronizedTemplates3D; numContours: cint;
                    rangeStart: cdouble; rangeEnd: cdouble) {.
    importcpp: "GenerateValues", header: "vtkSynchronizedTemplates3D.h".}
proc ThreadedExecute*(this: var vtkSynchronizedTemplates3D; data: ptr vtkImageData;
                     inInfo: ptr vtkInformation; outInfo: ptr vtkInformation;
                     inScalars: ptr vtkDataArray) {.importcpp: "ThreadedExecute",
    header: "vtkSynchronizedTemplates3D.h".}
proc SetInputMemoryLimit*(this: var vtkSynchronizedTemplates3D; limit: culong) {.
    importcpp: "SetInputMemoryLimit", header: "vtkSynchronizedTemplates3D.h".}
proc GetInputMemoryLimit*(this: var vtkSynchronizedTemplates3D): culong {.
    importcpp: "GetInputMemoryLimit", header: "vtkSynchronizedTemplates3D.h".}
proc SetComputeNormalsComputeGradientsComputeScalarsGenerateTrianglesArrayComponent*(
    this: var vtkSynchronizedTemplates3D; _arg: cint) {.importcpp: "SetComputeNormalsComputeGradientsComputeScalarsGenerateTrianglesArrayComponent",
    header: "vtkSynchronizedTemplates3D.h".}
## !!!Ignored construct:  virtual int GetComputeNormalsComputeGradientsComputeScalarsGenerateTrianglesArrayComponent ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ArrayComponent  of  << this -> ArrayComponent ) ; return this -> ArrayComponent ; } ;
## Error: expected ';'!!!

##  template table.

var VTK_SYNCHRONIZED_TEMPLATES_3D_TABLE_1* {.
    importcpp: "VTK_SYNCHRONIZED_TEMPLATES_3D_TABLE_1",
    header: "vtkSynchronizedTemplates3D.h".}: UncheckedArray[cint]

var VTK_SYNCHRONIZED_TEMPLATES_3D_TABLE_2* {.
    importcpp: "VTK_SYNCHRONIZED_TEMPLATES_3D_TABLE_2",
    header: "vtkSynchronizedTemplates3D.h".}: UncheckedArray[cint]
