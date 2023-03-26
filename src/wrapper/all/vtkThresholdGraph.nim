## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCollapseVerticesByArray.h
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
##  @class   vtkThresholdGraph
##  @brief   Returns a subgraph of a vtkGraph.
##
##
##  Requires input array, lower and upper threshold. This filter than
##  extracts the subgraph based on these three parameters.
##

import
  vtkGraphAlgorithm, vtkInfovisCoreModule

type
  vtkThresholdGraph* {.importcpp: "vtkThresholdGraph",
                      header: "vtkThresholdGraph.h", bycopy.} = object of vtkGraphAlgorithm
    vtkThresholdGraph* {.importc: "vtkThresholdGraph".}: VTK_NEWINSTANCE


proc New*(): ptr vtkThresholdGraph {.importcpp: "vtkThresholdGraph::New(@)",
                                 header: "vtkThresholdGraph.h".}
type
  vtkThresholdGraphSuperclass* = vtkGraphAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkThresholdGraph::IsTypeOf(@)", header: "vtkThresholdGraph.h".}
proc IsA*(this: var vtkThresholdGraph; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkThresholdGraph.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkThresholdGraph {.
    importcpp: "vtkThresholdGraph::SafeDownCast(@)", header: "vtkThresholdGraph.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkThresholdGraph :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGraphAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkThresholdGraph :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkThresholdGraph :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkThresholdGraph; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkThresholdGraph.h".}
## !!!Ignored construct:  /@{ *
##  Get/Set lower threshold. This would be the value against which
##  edge or vertex data array value will be compared.
##  virtual double GetLowerThresholdLowerThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LowerThreshold  of  << this -> LowerThreshold ) ; return this -> LowerThreshold ; } ;
## Error: expected ';'!!!

proc SetLowerThreshold*(this: var vtkThresholdGraph; _arg: cdouble) {.
    importcpp: "SetLowerThreshold", header: "vtkThresholdGraph.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get/Set upper threshold. This would be the value against which
  ##  edge or vertex data array value will be compared.
  ##
## !!!Ignored construct:  virtual double GetLowerThresholdLowerThresholdUpperThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UpperThreshold  of  << this -> UpperThreshold ) ; return this -> UpperThreshold ; } ;
## Error: expected ';'!!!

proc SetLowerThresholdUpperThreshold*(this: var vtkThresholdGraph; _arg: cdouble) {.
    importcpp: "SetLowerThresholdUpperThreshold", header: "vtkThresholdGraph.h".}
  ## /@}