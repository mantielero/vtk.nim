## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTableToStructuredGrid.h
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
##  @class   vtkTableToStructuredGrid
##  @brief   converts vtkTable to a vtkStructuredGrid.
##
##  vtkTableToStructuredGrid is a filter that converts an input
##  vtkTable to a vtkStructuredGrid. It provides API to select columns to use as
##  points in the output structured grid. The specified dimensions of the output
##  (specified using SetWholeExtent()) must match the number of rows in the input
##  table.
##

import
  vtkFiltersGeneralModule, vtkStructuredGridAlgorithm

discard "forward decl of vtkTable"
type
  vtkTableToStructuredGrid* {.importcpp: "vtkTableToStructuredGrid",
                             header: "vtkTableToStructuredGrid.h", bycopy.} = object of vtkStructuredGridAlgorithm
    vtkTableToStructuredGrid* {.importc: "vtkTableToStructuredGrid".}: VTK_NEWINSTANCE


proc New*(): ptr vtkTableToStructuredGrid {.importcpp: "vtkTableToStructuredGrid::New(@)",
                                        header: "vtkTableToStructuredGrid.h".}
type
  vtkTableToStructuredGridSuperclass* = vtkStructuredGridAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTableToStructuredGrid::IsTypeOf(@)",
    header: "vtkTableToStructuredGrid.h".}
proc IsA*(this: var vtkTableToStructuredGrid; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTableToStructuredGrid.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTableToStructuredGrid {.
    importcpp: "vtkTableToStructuredGrid::SafeDownCast(@)",
    header: "vtkTableToStructuredGrid.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTableToStructuredGrid :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkStructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTableToStructuredGrid :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTableToStructuredGrid :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTableToStructuredGrid; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTableToStructuredGrid.h".}
proc SetWholeExtent*(this: var vtkTableToStructuredGrid; _arg1: cint; _arg2: cint;
                    _arg3: cint; _arg4: cint; _arg5: cint; _arg6: cint) {.
    importcpp: "SetWholeExtent", header: "vtkTableToStructuredGrid.h".}
proc SetWholeExtent*(this: var vtkTableToStructuredGrid; _arg: array[6, cint]) {.
    importcpp: "SetWholeExtent", header: "vtkTableToStructuredGrid.h".}
## !!!Ignored construct:  virtual int * GetWholeExtent ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << WholeExtent  pointer  << this -> WholeExtent ) ; return this -> WholeExtent ; } VTK_WRAPEXCLUDE virtual void GetWholeExtent ( int & _arg1 , int & _arg2 , int & _arg3 , int & _arg4 , int & _arg5 , int & _arg6 ) { _arg1 = this -> WholeExtent [ 0 ] ; _arg2 = this -> WholeExtent [ 1 ] ; _arg3 = this -> WholeExtent [ 2 ] ; _arg4 = this -> WholeExtent [ 3 ] ; _arg5 = this -> WholeExtent [ 4 ] ; _arg6 = this -> WholeExtent [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << WholeExtent  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetWholeExtent ( int _arg [ 6 ] ) { this -> GetWholeExtent ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ;
## Error: expected ';'!!!

proc SetXColumn*(this: var vtkTableToStructuredGrid; _arg: cstring) {.
    importcpp: "SetXColumn", header: "vtkTableToStructuredGrid.h".}
proc GetXColumn*(this: var vtkTableToStructuredGrid): cstring {.
    importcpp: "GetXColumn", header: "vtkTableToStructuredGrid.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify the component for the column specified using SetXColumn() to
  ##  use as the xcoordinate in case the column is a multi-component array.
  ##  Default is 0.
  ##
proc SetXComponent*(this: var vtkTableToStructuredGrid; _arg: cint) {.
    importcpp: "SetXComponent", header: "vtkTableToStructuredGrid.h".}
proc GetXComponentMinValue*(this: var vtkTableToStructuredGrid): cint {.
    importcpp: "GetXComponentMinValue", header: "vtkTableToStructuredGrid.h".}
proc GetXComponentMaxValue*(this: var vtkTableToStructuredGrid): cint {.
    importcpp: "GetXComponentMaxValue", header: "vtkTableToStructuredGrid.h".}
## !!!Ignored construct:  virtual int GetXComponent ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << XComponent  of  << this -> XComponent ) ; return this -> XComponent ; } ;
## Error: expected ';'!!!

proc SetXColumnYColumn*(this: var vtkTableToStructuredGrid; _arg: cstring) {.
    importcpp: "SetXColumnYColumn", header: "vtkTableToStructuredGrid.h".}
proc GetXColumnYColumn*(this: var vtkTableToStructuredGrid): cstring {.
    importcpp: "GetXColumnYColumn", header: "vtkTableToStructuredGrid.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify the component for the column specified using SetYColumn() to
  ##  use as the Ycoordinate in case the column is a multi-component array.
  ##
proc SetXComponentYComponent*(this: var vtkTableToStructuredGrid; _arg: cint) {.
    importcpp: "SetXComponentYComponent", header: "vtkTableToStructuredGrid.h".}
proc GetXComponentMinValueYComponentMinValue*(this: var vtkTableToStructuredGrid): cint {.
    importcpp: "GetXComponentMinValueYComponentMinValue",
    header: "vtkTableToStructuredGrid.h".}
proc GetXComponentMaxValueYComponentMaxValue*(this: var vtkTableToStructuredGrid): cint {.
    importcpp: "GetXComponentMaxValueYComponentMaxValue",
    header: "vtkTableToStructuredGrid.h".}
## !!!Ignored construct:  virtual int GetXComponentYComponent ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << YComponent  of  << this -> YComponent ) ; return this -> YComponent ; } ;
## Error: expected ';'!!!

proc SetXColumnYColumnZColumn*(this: var vtkTableToStructuredGrid; _arg: cstring) {.
    importcpp: "SetXColumnYColumnZColumn", header: "vtkTableToStructuredGrid.h".}
proc GetXColumnYColumnZColumn*(this: var vtkTableToStructuredGrid): cstring {.
    importcpp: "GetXColumnYColumnZColumn", header: "vtkTableToStructuredGrid.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify the component for the column specified using SetZColumn() to
  ##  use as the Zcoordinate in case the column is a multi-component array.
  ##
proc SetXComponentYComponentZComponent*(this: var vtkTableToStructuredGrid;
                                       _arg: cint) {.
    importcpp: "SetXComponentYComponentZComponent",
    header: "vtkTableToStructuredGrid.h".}
proc GetXComponentMinValueYComponentMinValueZComponentMinValue*(
    this: var vtkTableToStructuredGrid): cint {.
    importcpp: "GetXComponentMinValueYComponentMinValueZComponentMinValue",
    header: "vtkTableToStructuredGrid.h".}
proc GetXComponentMaxValueYComponentMaxValueZComponentMaxValue*(
    this: var vtkTableToStructuredGrid): cint {.
    importcpp: "GetXComponentMaxValueYComponentMaxValueZComponentMaxValue",
    header: "vtkTableToStructuredGrid.h".}
## !!!Ignored construct:  virtual int GetXComponentYComponentZComponent ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ZComponent  of  << this -> ZComponent ) ; return this -> ZComponent ; } ;
## Error: expected ';'!!!
