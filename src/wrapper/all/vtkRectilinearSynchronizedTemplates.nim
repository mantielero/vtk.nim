## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRectilinearSynchronizedTemplates.h
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
##  @class   vtkRectilinearSynchronizedTemplates
##  @brief   generate isosurface from rectilinear grid
##
##
##  vtkRectilinearSynchronizedTemplates is a 3D implementation (for rectilinear
##  grids) of the synchronized template algorithm. Note that vtkContourFilter
##  will automatically use this class when appropriate.
##
##  @warning
##  This filter is specialized to rectilinear grids.
##
##  @sa
##  vtkContourFilter vtkSynchronizedTemplates2D vtkSynchronizedTemplates3D
##

import
  vtkContourValues, vtkFiltersCoreModule, vtkPolyDataAlgorithm

discard "forward decl of vtkRectilinearGrid"
discard "forward decl of vtkDataArray"
type
  vtkRectilinearSynchronizedTemplates* {.importcpp: "vtkRectilinearSynchronizedTemplates", header: "vtkRectilinearSynchronizedTemplates.h",
                                        bycopy.} = object of vtkPolyDataAlgorithm
    vtkRectilinearSynchronizedTemplates* {.
        importc: "vtkRectilinearSynchronizedTemplates".}: VTK_NEWINSTANCE


proc New*(): ptr vtkRectilinearSynchronizedTemplates {.
    importcpp: "vtkRectilinearSynchronizedTemplates::New(@)",
    header: "vtkRectilinearSynchronizedTemplates.h".}
type
  vtkRectilinearSynchronizedTemplatesSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkRectilinearSynchronizedTemplates::IsTypeOf(@)",
    header: "vtkRectilinearSynchronizedTemplates.h".}
proc IsA*(this: var vtkRectilinearSynchronizedTemplates; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkRectilinearSynchronizedTemplates.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkRectilinearSynchronizedTemplates {.
    importcpp: "vtkRectilinearSynchronizedTemplates::SafeDownCast(@)",
    header: "vtkRectilinearSynchronizedTemplates.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkRectilinearSynchronizedTemplates :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRectilinearSynchronizedTemplates :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRectilinearSynchronizedTemplates :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkRectilinearSynchronizedTemplates; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkRectilinearSynchronizedTemplates.h".}
proc GetMTime*(this: var vtkRectilinearSynchronizedTemplates): vtkMTimeType {.
    importcpp: "GetMTime", header: "vtkRectilinearSynchronizedTemplates.h".}
proc SetComputeNormals*(this: var vtkRectilinearSynchronizedTemplates;
                       _arg: vtkTypeBool) {.importcpp: "SetComputeNormals",
    header: "vtkRectilinearSynchronizedTemplates.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetComputeNormals ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeNormals  of  << this -> ComputeNormals ) ; return this -> ComputeNormals ; } ;
## Error: expected ';'!!!

proc ComputeNormalsOn*(this: var vtkRectilinearSynchronizedTemplates) {.
    importcpp: "ComputeNormalsOn", header: "vtkRectilinearSynchronizedTemplates.h".}
proc ComputeNormalsOff*(this: var vtkRectilinearSynchronizedTemplates) {.
    importcpp: "ComputeNormalsOff",
    header: "vtkRectilinearSynchronizedTemplates.h".}
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
proc SetComputeNormalsComputeGradients*(this: var vtkRectilinearSynchronizedTemplates;
                                       _arg: vtkTypeBool) {.
    importcpp: "SetComputeNormalsComputeGradients",
    header: "vtkRectilinearSynchronizedTemplates.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetComputeNormalsComputeGradients ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeGradients  of  << this -> ComputeGradients ) ; return this -> ComputeGradients ; } ;
## Error: expected ';'!!!

proc ComputeGradientsOn*(this: var vtkRectilinearSynchronizedTemplates) {.
    importcpp: "ComputeGradientsOn",
    header: "vtkRectilinearSynchronizedTemplates.h".}
proc ComputeGradientsOff*(this: var vtkRectilinearSynchronizedTemplates) {.
    importcpp: "ComputeGradientsOff",
    header: "vtkRectilinearSynchronizedTemplates.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the computation of scalars.
  ##
proc SetComputeNormalsComputeGradientsComputeScalars*(
    this: var vtkRectilinearSynchronizedTemplates; _arg: vtkTypeBool) {.
    importcpp: "SetComputeNormalsComputeGradientsComputeScalars",
    header: "vtkRectilinearSynchronizedTemplates.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetComputeNormalsComputeGradientsComputeScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeScalars  of  << this -> ComputeScalars ) ; return this -> ComputeScalars ; } ;
## Error: expected ';'!!!

proc ComputeScalarsOn*(this: var vtkRectilinearSynchronizedTemplates) {.
    importcpp: "ComputeScalarsOn", header: "vtkRectilinearSynchronizedTemplates.h".}
proc ComputeScalarsOff*(this: var vtkRectilinearSynchronizedTemplates) {.
    importcpp: "ComputeScalarsOff",
    header: "vtkRectilinearSynchronizedTemplates.h".}
  ## /@}
  ## *
  ##  Set a particular contour value at contour number i. The index i ranges
  ##  between 0<=i<NumberOfContours.
  ##
proc SetValue*(this: var vtkRectilinearSynchronizedTemplates; i: cint; value: cdouble) {.
    importcpp: "SetValue", header: "vtkRectilinearSynchronizedTemplates.h".}
proc GetValue*(this: var vtkRectilinearSynchronizedTemplates; i: cint): cdouble {.
    importcpp: "GetValue", header: "vtkRectilinearSynchronizedTemplates.h".}
proc GetValues*(this: var vtkRectilinearSynchronizedTemplates): ptr cdouble {.
    importcpp: "GetValues", header: "vtkRectilinearSynchronizedTemplates.h".}
proc GetValues*(this: var vtkRectilinearSynchronizedTemplates;
               contourValues: ptr cdouble) {.importcpp: "GetValues",
    header: "vtkRectilinearSynchronizedTemplates.h".}
proc SetNumberOfContours*(this: var vtkRectilinearSynchronizedTemplates;
                         number: cint) {.importcpp: "SetNumberOfContours", header: "vtkRectilinearSynchronizedTemplates.h".}
proc GetNumberOfContours*(this: var vtkRectilinearSynchronizedTemplates): vtkIdType {.
    importcpp: "GetNumberOfContours",
    header: "vtkRectilinearSynchronizedTemplates.h".}
proc GenerateValues*(this: var vtkRectilinearSynchronizedTemplates;
                    numContours: cint; range: array[2, cdouble]) {.
    importcpp: "GenerateValues", header: "vtkRectilinearSynchronizedTemplates.h".}
proc GenerateValues*(this: var vtkRectilinearSynchronizedTemplates;
                    numContours: cint; rangeStart: cdouble; rangeEnd: cdouble) {.
    importcpp: "GenerateValues", header: "vtkRectilinearSynchronizedTemplates.h".}
proc SetComputeNormalsComputeGradientsComputeScalarsArrayComponent*(
    this: var vtkRectilinearSynchronizedTemplates; _arg: cint) {.
    importcpp: "SetComputeNormalsComputeGradientsComputeScalarsArrayComponent",
    header: "vtkRectilinearSynchronizedTemplates.h".}
## !!!Ignored construct:  virtual int GetComputeNormalsComputeGradientsComputeScalarsArrayComponent ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ArrayComponent  of  << this -> ArrayComponent ) ; return this -> ArrayComponent ; } ;
## Error: expected ';'!!!

proc SetComputeNormalsComputeGradientsComputeScalarsArrayComponentGenerateTriangles*(
    this: var vtkRectilinearSynchronizedTemplates; _arg: vtkTypeBool) {.importcpp: "SetComputeNormalsComputeGradientsComputeScalarsArrayComponentGenerateTriangles",
    header: "vtkRectilinearSynchronizedTemplates.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetComputeNormalsComputeGradientsComputeScalarsArrayComponentGenerateTriangles ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateTriangles  of  << this -> GenerateTriangles ) ; return this -> GenerateTriangles ; } ;
## Error: expected ';'!!!

proc GenerateTrianglesOn*(this: var vtkRectilinearSynchronizedTemplates) {.
    importcpp: "GenerateTrianglesOn",
    header: "vtkRectilinearSynchronizedTemplates.h".}
proc GenerateTrianglesOff*(this: var vtkRectilinearSynchronizedTemplates) {.
    importcpp: "GenerateTrianglesOff",
    header: "vtkRectilinearSynchronizedTemplates.h".}
  ## /@}
  ## *
  ##  Compute the spacing between this point and its 6 neighbors.  This method
  ##  needs to be public so it can be accessed from a templated function.
  ##
proc ComputeSpacing*(this: var vtkRectilinearSynchronizedTemplates;
                    data: ptr vtkRectilinearGrid; i: cint; j: cint; k: cint;
                    extent: array[6, cint]; spacing: array[6, cdouble]) {.
    importcpp: "ComputeSpacing", header: "vtkRectilinearSynchronizedTemplates.h".}
##  template table.

var VTK_RECTILINEAR_SYNCHONIZED_TEMPLATES_TABLE_1* {.
    importcpp: "VTK_RECTILINEAR_SYNCHONIZED_TEMPLATES_TABLE_1",
    header: "vtkRectilinearSynchronizedTemplates.h".}: UncheckedArray[cint]

var VTK_RECTILINEAR_SYNCHONIZED_TEMPLATES_TABLE_2* {.
    importcpp: "VTK_RECTILINEAR_SYNCHONIZED_TEMPLATES_TABLE_2",
    header: "vtkRectilinearSynchronizedTemplates.h".}: UncheckedArray[cint]
