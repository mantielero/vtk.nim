## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBoostBreadthFirstSearch.h
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
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkBoostBreadthFirstSearch
##  @brief   Boost breadth_first_search on a vtkGraph
##
##
##
##  This vtk class uses the Boost breadth_first_search
##  generic algorithm to perform a breadth first search from a given
##  a 'source' vertex on the input graph (a vtkGraph).
##
##  @sa
##  vtkGraph vtkBoostGraphAdapter
##

import
  vtkInfovisBoostGraphAlgorithmsModule, vtkStdString, vtkVariant, vtkGraphAlgorithm

discard "forward decl of vtkSelection"
type
  vtkBoostBreadthFirstSearch* {.importcpp: "vtkBoostBreadthFirstSearch",
                               header: "vtkBoostBreadthFirstSearch.h", bycopy.} = object of vtkGraphAlgorithm
    vtkBoostBreadthFirstSearch* {.importc: "vtkBoostBreadthFirstSearch".}: VTK_NEWINSTANCE
    ## /@{
    ## *
    ##  Using the convenience function internally
    ##


proc New*(): ptr vtkBoostBreadthFirstSearch {.
    importcpp: "vtkBoostBreadthFirstSearch::New(@)",
    header: "vtkBoostBreadthFirstSearch.h".}
type
  vtkBoostBreadthFirstSearchSuperclass* = vtkGraphAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkBoostBreadthFirstSearch::IsTypeOf(@)",
    header: "vtkBoostBreadthFirstSearch.h".}
proc IsA*(this: var vtkBoostBreadthFirstSearch; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkBoostBreadthFirstSearch.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBoostBreadthFirstSearch {.
    importcpp: "vtkBoostBreadthFirstSearch::SafeDownCast(@)",
    header: "vtkBoostBreadthFirstSearch.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBoostBreadthFirstSearch :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGraphAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBoostBreadthFirstSearch :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBoostBreadthFirstSearch :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkBoostBreadthFirstSearch; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkBoostBreadthFirstSearch.h".}
proc SetOriginSelection*(this: var vtkBoostBreadthFirstSearch; s: ptr vtkSelection) {.
    importcpp: "SetOriginSelection", header: "vtkBoostBreadthFirstSearch.h".}
proc SetOriginSelectionConnection*(this: var vtkBoostBreadthFirstSearch;
                                  algOutput: ptr vtkAlgorithmOutput) {.
    importcpp: "SetOriginSelectionConnection",
    header: "vtkBoostBreadthFirstSearch.h".}
proc SetOriginVertex*(this: var vtkBoostBreadthFirstSearch; index: vtkIdType) {.
    importcpp: "SetOriginVertex", header: "vtkBoostBreadthFirstSearch.h".}
proc SetOriginVertex*(this: var vtkBoostBreadthFirstSearch; arrayName: vtkStdString;
                     value: vtkVariant) {.importcpp: "SetOriginVertex",
                                        header: "vtkBoostBreadthFirstSearch.h".}
proc SetOriginVertexString*(this: var vtkBoostBreadthFirstSearch;
                           arrayName: cstring; value: cstring) {.
    importcpp: "SetOriginVertexString", header: "vtkBoostBreadthFirstSearch.h".}
proc SetOutputArrayName*(this: var vtkBoostBreadthFirstSearch; _arg: cstring) {.
    importcpp: "SetOutputArrayName", header: "vtkBoostBreadthFirstSearch.h".}
  ## /@}
  ## /@{
  ## *
  ##  Use the vtkSelection from input port 1 as the origin vertex.
  ##  The selection should be a IDS selection with field type POINTS.
  ##  The first ID in the selection will be used for the origin vertex.
  ##  Default is off (origin is specified by SetOriginVertex(...)).
  ##
proc SetOriginFromSelection*(this: var vtkBoostBreadthFirstSearch; _arg: bool) {.
    importcpp: "SetOriginFromSelection", header: "vtkBoostBreadthFirstSearch.h".}
## !!!Ignored construct:  virtual bool GetOriginFromSelection ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OriginFromSelection  of  << this -> OriginFromSelection ) ; return this -> OriginFromSelection ; } ;
## Error: expected ';'!!!

proc OriginFromSelectionOn*(this: var vtkBoostBreadthFirstSearch) {.
    importcpp: "OriginFromSelectionOn", header: "vtkBoostBreadthFirstSearch.h".}
proc OriginFromSelectionOff*(this: var vtkBoostBreadthFirstSearch) {.
    importcpp: "OriginFromSelectionOff", header: "vtkBoostBreadthFirstSearch.h".}
  ## /@}
  ## /@{
  ## *
  ##  Create an output selection containing the ID of a vertex based
  ##  on the output selection type. The default is to use the
  ##  the maximum distance from the starting vertex.  Defaults to off.
  ##
## !!!Ignored construct:  virtual bool GetOriginFromSelectionOutputSelection ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputSelection  of  << this -> OutputSelection ) ; return this -> OutputSelection ; } ;
## Error: expected ';'!!!

proc SetOriginFromSelectionOutputSelection*(this: var vtkBoostBreadthFirstSearch;
    _arg: bool) {.importcpp: "SetOriginFromSelectionOutputSelection",
                header: "vtkBoostBreadthFirstSearch.h".}
proc OutputSelectionOn*(this: var vtkBoostBreadthFirstSearch) {.
    importcpp: "OutputSelectionOn", header: "vtkBoostBreadthFirstSearch.h".}
proc OutputSelectionOff*(this: var vtkBoostBreadthFirstSearch) {.
    importcpp: "OutputSelectionOff", header: "vtkBoostBreadthFirstSearch.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the output selection type. The default is to use the
  ##  the maximum distance from the starting vertex "MAX_DIST_FROM_ROOT".
  ##  But you can also specify other things like "ROOT","2D_MAX", etc
  ##
proc SetOutputArrayNameOutputSelectionType*(this: var vtkBoostBreadthFirstSearch;
    _arg: cstring) {.importcpp: "SetOutputArrayNameOutputSelectionType",
                   header: "vtkBoostBreadthFirstSearch.h".}
  ## /@}