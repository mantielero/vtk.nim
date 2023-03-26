## =========================================================================
##
## Program:   Visualization Toolkit
## Module:    vtkLinearSelector.h
##
## Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
## All rights reserved.
## See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
## This software is distributed WITHOUT ANY WARRANTY; without even
## the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
## PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkLinearSelector
##  @brief   select cells intersecting a line (possibly broken)
##
##
##  This filter takes a vtkCompositeDataSet as input and a line segment as parameter.
##  It outputs a vtkSelection identifying all the cells intersecting the given line segment.
##
##  @par Thanks:
##  This class has been initially developed in the frame of CEA's Love visualization software
##  development <br> CEA/DIF - Commissariat a l'Energie Atomique, Centre DAM Ile-De-France <br> BP12,
##  F-91297 Arpajon, France. <br> Modified and integrated into VTK, Kitware SAS 2012 This class was
##  implemented by Thierry Carrard, Charles Pignerol, and Philippe Pebay.
##

import
  vtkFiltersSelectionModule, vtkSelectionAlgorithm

discard "forward decl of vtkAlgorithmOutput"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkPoints"
type
  vtkLinearSelector* {.importcpp: "vtkLinearSelector",
                      header: "vtkLinearSelector.h", bycopy.} = object of vtkSelectionAlgorithm
    vtkLinearSelector* {.importc: "vtkLinearSelector".}: VTK_NEWINSTANCE
    ## /@}
    ## *
    ##  The list of points defining the intersecting broken line
    ##  NB: The Start/EndPoint definition of a single line segment is used by default
    ##
    ## *
    ##  Tolerance to be used by intersection algorithm
    ##
    ## *
    ##  Decide whether lines vertice are included in selection
    ##  Default: true
    ##
    ## /@{
    ## *
    ##  Relative tolerance for vertex elimination
    ##  Default: 1e-6
    ##
    ## /@}

  vtkLinearSelectorSuperclass* = vtkSelectionAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkLinearSelector::IsTypeOf(@)", header: "vtkLinearSelector.h".}
proc IsA*(this: var vtkLinearSelector; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkLinearSelector.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkLinearSelector {.
    importcpp: "vtkLinearSelector::SafeDownCast(@)", header: "vtkLinearSelector.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkLinearSelector :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkSelectionAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLinearSelector :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLinearSelector :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkLinearSelector; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkLinearSelector.h".}
proc New*(): ptr vtkLinearSelector {.importcpp: "vtkLinearSelector::New(@)",
                                 header: "vtkLinearSelector.h".}
proc SetStartPoint*(this: var vtkLinearSelector; _arg1: cdouble; _arg2: cdouble;
                   _arg3: cdouble) {.importcpp: "SetStartPoint",
                                   header: "vtkLinearSelector.h".}
proc SetStartPoint*(this: var vtkLinearSelector; _arg: array[3, cdouble]) {.
    importcpp: "SetStartPoint", header: "vtkLinearSelector.h".}
## !!!Ignored construct:  virtual double * GetStartPoint ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << StartPoint  pointer  << this -> StartPoint ) ; return this -> StartPoint ; } VTK_WRAPEXCLUDE virtual void GetStartPoint ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> StartPoint [ i ] ; } } ;
## Error: expected ';'!!!

proc SetStartPointEndPoint*(this: var vtkLinearSelector; _arg1: cdouble;
                           _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetStartPointEndPoint", header: "vtkLinearSelector.h".}
proc SetStartPointEndPoint*(this: var vtkLinearSelector; _arg: array[3, cdouble]) {.
    importcpp: "SetStartPointEndPoint", header: "vtkLinearSelector.h".}
## !!!Ignored construct:  virtual double * GetStartPointEndPoint ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << EndPoint  pointer  << this -> EndPoint ) ; return this -> EndPoint ; } VTK_WRAPEXCLUDE virtual void GetStartPointEndPoint ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> EndPoint [ i ] ; } } ;
## Error: expected ';'!!!

proc SetPoints*(this: var vtkLinearSelector; a2: ptr vtkPoints) {.
    importcpp: "SetPoints", header: "vtkLinearSelector.h".}
proc GetnamePoints*(this: var vtkLinearSelector): ptr vtkPoints {.
    importcpp: "GetnamePoints", header: "vtkLinearSelector.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get tolerance to be used by intersection algorithm
  ##
proc SetTolerance*(this: var vtkLinearSelector; _arg: cdouble) {.
    importcpp: "SetTolerance", header: "vtkLinearSelector.h".}
## !!!Ignored construct:  virtual double GetTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tolerance  of  << this -> Tolerance ) ; return this -> Tolerance ; } ;
## Error: expected ';'!!!

proc SetToleranceIncludeVertices*(this: var vtkLinearSelector; _arg: bool) {.
    importcpp: "SetToleranceIncludeVertices", header: "vtkLinearSelector.h".}
## !!!Ignored construct:  virtual bool GetToleranceIncludeVertices ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IncludeVertices  of  << this -> IncludeVertices ) ; return this -> IncludeVertices ; } ;
## Error: expected ';'!!!

proc IncludeVerticesOn*(this: var vtkLinearSelector) {.
    importcpp: "IncludeVerticesOn", header: "vtkLinearSelector.h".}
proc IncludeVerticesOff*(this: var vtkLinearSelector) {.
    importcpp: "IncludeVerticesOff", header: "vtkLinearSelector.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get relative tolerance for vertex elimination
  ##
proc SetVertexEliminationTolerance*(this: var vtkLinearSelector; _arg: cdouble) {.
    importcpp: "SetVertexEliminationTolerance", header: "vtkLinearSelector.h".}
proc GetVertexEliminationToleranceMinValue*(this: var vtkLinearSelector): cdouble {.
    importcpp: "GetVertexEliminationToleranceMinValue",
    header: "vtkLinearSelector.h".}
proc GetVertexEliminationToleranceMaxValue*(this: var vtkLinearSelector): cdouble {.
    importcpp: "GetVertexEliminationToleranceMaxValue",
    header: "vtkLinearSelector.h".}
## !!!Ignored construct:  virtual double GetToleranceIncludeVerticesVertexEliminationTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VertexEliminationTolerance  of  << this -> VertexEliminationTolerance ) ; return this -> VertexEliminationTolerance ; } ;
## Error: expected ';'!!!
