## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtractSelectedFrustum.h
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
##  @class   vtkExtractSelectedFrustum
##  @brief   Returns the portion of the input dataset that
##  lies within a selection frustum.
##
##
##  This class intersects the input DataSet with a frustum and determines which
##  cells and points lie within the frustum. The frustum is defined with a
##  vtkPlanes containing six cutting planes. The output is a DataSet that is
##  either a shallow copy of the input dataset with two new "vtkInsidedness"
##  attribute arrays, or a completely new UnstructuredGrid that contains only
##  the cells and points of the input that are inside the frustum. The
##  PreserveTopology flag controls which occurs. When PreserveTopology is off
##  this filter adds a scalar array called vtkOriginalCellIds that says what
##  input cell produced each output cell. This is an example of a Pedigree ID
##  which helps to trace back results.
##
##  @sa
##  vtkExtractGeometry, vtkAreaPicker, vtkExtractSelection, vtkSelection
##

import
  vtkExtractSelectionBase, vtkFiltersGeneralModule

discard "forward decl of vtkPlanes"
discard "forward decl of vtkInformation"
discard "forward decl of vtkInformationVector"
discard "forward decl of vtkCell"
discard "forward decl of vtkPoints"
discard "forward decl of vtkDoubleArray"
type
  vtkExtractSelectedFrustum* {.importcpp: "vtkExtractSelectedFrustum",
                              header: "vtkExtractSelectedFrustum.h", bycopy.} = object of vtkExtractSelectionBase
    vtkExtractSelectedFrustum* {.importc: "vtkExtractSelectedFrustum".}: VTK_NEWINSTANCE
    ##  used internally
    ##  for debugging


proc New*(): ptr vtkExtractSelectedFrustum {.
    importcpp: "vtkExtractSelectedFrustum::New(@)",
    header: "vtkExtractSelectedFrustum.h".}
type
  vtkExtractSelectedFrustumSuperclass* = vtkExtractSelectionBase

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkExtractSelectedFrustum::IsTypeOf(@)",
    header: "vtkExtractSelectedFrustum.h".}
proc IsA*(this: var vtkExtractSelectedFrustum; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkExtractSelectedFrustum.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkExtractSelectedFrustum {.
    importcpp: "vtkExtractSelectedFrustum::SafeDownCast(@)",
    header: "vtkExtractSelectedFrustum.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkExtractSelectedFrustum :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkExtractSelectionBase :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtractSelectedFrustum :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtractSelectedFrustum :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkExtractSelectedFrustum; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkExtractSelectedFrustum.h".}
proc GetMTime*(this: var vtkExtractSelectedFrustum): vtkMTimeType {.
    importcpp: "GetMTime", header: "vtkExtractSelectedFrustum.h".}
proc SetFrustum*(this: var vtkExtractSelectedFrustum; a2: ptr vtkPlanes) {.
    importcpp: "SetFrustum", header: "vtkExtractSelectedFrustum.h".}
proc GetnameFrustum*(this: var vtkExtractSelectedFrustum): ptr vtkPlanes {.
    importcpp: "GetnameFrustum", header: "vtkExtractSelectedFrustum.h".}
  ## /@}
  ## *
  ##  Given eight vertices, creates a frustum.
  ##  each pt is x,y,z,1
  ##  in the following order
  ##  near lower left, far lower left
  ##  near upper left, far upper left
  ##  near lower right, far lower right
  ##  near upper right, far upper right
  ##
proc CreateFrustum*(this: var vtkExtractSelectedFrustum;
                   vertices: array[32, cdouble]) {.importcpp: "CreateFrustum",
    header: "vtkExtractSelectedFrustum.h".}
proc GetnameFrustumClipPoints*(this: var vtkExtractSelectedFrustum): ptr vtkPoints {.
    importcpp: "GetnameFrustumClipPoints", header: "vtkExtractSelectedFrustum.h".}
  ## /@}
  ## /@{
  ## *
  ##  Sets/gets the intersection test type.
  ##
proc SetFieldType*(this: var vtkExtractSelectedFrustum; _arg: cint) {.
    importcpp: "SetFieldType", header: "vtkExtractSelectedFrustum.h".}
## !!!Ignored construct:  virtual int GetFieldType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FieldType  of  << this -> FieldType ) ; return this -> FieldType ; } ;
## Error: expected ';'!!!

proc SetFieldTypeContainingCells*(this: var vtkExtractSelectedFrustum; _arg: cint) {.
    importcpp: "SetFieldTypeContainingCells",
    header: "vtkExtractSelectedFrustum.h".}
## !!!Ignored construct:  virtual int GetFieldTypeContainingCells ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ContainingCells  of  << this -> ContainingCells ) ; return this -> ContainingCells ; } ;
## Error: expected ';'!!!

proc OverallBoundsTest*(this: var vtkExtractSelectedFrustum; bounds: ptr cdouble): cint {.
    importcpp: "OverallBoundsTest", header: "vtkExtractSelectedFrustum.h".}
proc SetFieldTypeContainingCellsShowBounds*(this: var vtkExtractSelectedFrustum;
    _arg: vtkTypeBool) {.importcpp: "SetFieldTypeContainingCellsShowBounds",
                       header: "vtkExtractSelectedFrustum.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetFieldTypeContainingCellsShowBounds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ShowBounds  of  << this -> ShowBounds ) ; return this -> ShowBounds ; } ;
## Error: expected ';'!!!

proc ShowBoundsOn*(this: var vtkExtractSelectedFrustum) {.importcpp: "ShowBoundsOn",
    header: "vtkExtractSelectedFrustum.h".}
proc ShowBoundsOff*(this: var vtkExtractSelectedFrustum) {.
    importcpp: "ShowBoundsOff", header: "vtkExtractSelectedFrustum.h".}
  ## /@}
  ## /@{
  ## *
  ##  When on, extracts cells outside the frustum instead of inside.
  ##
proc SetFieldTypeContainingCellsShowBoundsInsideOut*(
    this: var vtkExtractSelectedFrustum; _arg: vtkTypeBool) {.
    importcpp: "SetFieldTypeContainingCellsShowBoundsInsideOut",
    header: "vtkExtractSelectedFrustum.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetFieldTypeContainingCellsShowBoundsInsideOut ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InsideOut  of  << this -> InsideOut ) ; return this -> InsideOut ; } ;
## Error: expected ';'!!!

proc InsideOutOn*(this: var vtkExtractSelectedFrustum) {.importcpp: "InsideOutOn",
    header: "vtkExtractSelectedFrustum.h".}
proc InsideOutOff*(this: var vtkExtractSelectedFrustum) {.importcpp: "InsideOutOff",
    header: "vtkExtractSelectedFrustum.h".}
  ## /@}