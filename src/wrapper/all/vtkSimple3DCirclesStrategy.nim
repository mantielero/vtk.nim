## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSimple3DCirclesStrategy.h
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
##  @class   vtkSimple3DCirclesStrategy
##  @brief   places vertices on circles in 3D
##
##
##  Places vertices on circles depending on the graph vertices hierarchy level.
##  The source graph could be vtkDirectedAcyclicGraph or vtkDirectedGraph if MarkedStartPoints array
##  was added. The algorithm collects the standalone points, too and take them to a separated circle.
##  If method is FixedRadiusMethod, the radius of the circles will be equal. If method is
##  FixedDistanceMethod, the distance between the points on circles will be equal.
##
##  In first step initial points are searched. A point is initial, if its in degree equal zero and
##  out degree is greater than zero (or marked by MarkedStartVertices and out degree is greater than
##  zero). Independent vertices (in and out degree equal zero) are collected separatelly. In second
##  step the hierarchical level is generated for every vertex. In third step the hierarchical order
##  is generated. If a vertex has no hierarchical level and it is not independent, the graph has loop
##  so the algorithm exit with error message. Finally the vertices positions are calculated by the
##  hierarchical order and by the vertices hierarchy levels.
##
##  @par Thanks:
##  Ferenc Nasztanovics, naszta@naszta.hu, Budapest University of Technology and Economics,
##  Department of Structural Mechanics
##
##  @par References:
##  in 3D rotation was used: http://en.citizendium.org/wiki/Rotation_matrix
##

import
  vtkGraphLayoutStrategy, vtkInfovisLayoutModule, vtkVariant

discard "forward decl of vtkAbstractArray"
discard "forward decl of vtkDirectedGraph"
discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkIntArray"
discard "forward decl of vtkSimple3DCirclesStrategyInternal"
type
  vtkSimple3DCirclesStrategy* {.importcpp: "vtkSimple3DCirclesStrategy",
                               header: "vtkSimple3DCirclesStrategy.h", bycopy.} = object of vtkGraphLayoutStrategy ## *
                                                                                                            ##  Search and fill in target all zero input degree vertices where the output degree is more than
                                                                                                            ##  zero. The finded vertices hierarchical layer ID will be zero.
                                                                                                            ##
    vtkSimple3DCirclesStrategy* {.importc: "vtkSimple3DCirclesStrategy".}: VTK_NEWINSTANCE


proc New*(): ptr vtkSimple3DCirclesStrategy {.
    importcpp: "vtkSimple3DCirclesStrategy::New(@)",
    header: "vtkSimple3DCirclesStrategy.h".}
type
  vtkSimple3DCirclesStrategySuperclass* = vtkGraphLayoutStrategy

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSimple3DCirclesStrategy::IsTypeOf(@)",
    header: "vtkSimple3DCirclesStrategy.h".}
proc IsA*(this: var vtkSimple3DCirclesStrategy; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkSimple3DCirclesStrategy.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSimple3DCirclesStrategy {.
    importcpp: "vtkSimple3DCirclesStrategy::SafeDownCast(@)",
    header: "vtkSimple3DCirclesStrategy.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSimple3DCirclesStrategy :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGraphLayoutStrategy :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSimple3DCirclesStrategy :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSimple3DCirclesStrategy :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSimple3DCirclesStrategy; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkSimple3DCirclesStrategy.h".}
const
  vtkSimple3DCirclesStrategyFixedRadiusMethod* = 0
  vtkSimple3DCirclesStrategyFixedDistanceMethod* = 1

proc SetMethod*(this: var vtkSimple3DCirclesStrategy; _arg: cint) {.
    importcpp: "SetMethod", header: "vtkSimple3DCirclesStrategy.h".}
## !!!Ignored construct:  virtual int GetMethod ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Method  of  << this -> Method ) ; return this -> Method ; } ;
## Error: expected ';'!!!

proc SetMethodRadius*(this: var vtkSimple3DCirclesStrategy; _arg: cdouble) {.
    importcpp: "SetMethodRadius", header: "vtkSimple3DCirclesStrategy.h".}
## !!!Ignored construct:  virtual double GetMethodRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Radius  of  << this -> Radius ) ; return this -> Radius ; } ;
## Error: expected ';'!!!

proc SetMethodRadiusHeight*(this: var vtkSimple3DCirclesStrategy; _arg: cdouble) {.
    importcpp: "SetMethodRadiusHeight", header: "vtkSimple3DCirclesStrategy.h".}
## !!!Ignored construct:  virtual double GetMethodRadiusHeight ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Height  of  << this -> Height ) ; return this -> Height ; } ;
## Error: expected ';'!!!

proc SetOrigin*(this: var vtkSimple3DCirclesStrategy; _arg1: cdouble; _arg2: cdouble;
               _arg3: cdouble) {.importcpp: "SetOrigin",
                               header: "vtkSimple3DCirclesStrategy.h".}
proc SetOrigin*(this: var vtkSimple3DCirclesStrategy; _arg: array[3, cdouble]) {.
    importcpp: "SetOrigin", header: "vtkSimple3DCirclesStrategy.h".}
## !!!Ignored construct:  virtual double * GetOrigin ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Origin  pointer  << this -> Origin ) ; return this -> Origin ; } VTK_WRAPEXCLUDE virtual void GetOrigin ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Origin [ 0 ] ; _arg2 = this -> Origin [ 1 ] ; _arg3 = this -> Origin [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Origin  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOrigin ( double _arg [ 3 ] ) { this -> GetOrigin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetDirection*(this: var vtkSimple3DCirclesStrategy; dx: cdouble; dy: cdouble;
                  dz: cdouble) {.importcpp: "SetDirection",
                               header: "vtkSimple3DCirclesStrategy.h".}
proc SetDirection*(this: var vtkSimple3DCirclesStrategy; d: array[3, cdouble]) {.
    importcpp: "SetDirection", header: "vtkSimple3DCirclesStrategy.h".}
## !!!Ignored construct:  virtual double * GetOriginDirection ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Direction  pointer  << this -> Direction ) ; return this -> Direction ; } VTK_WRAPEXCLUDE virtual void GetOriginDirection ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Direction [ 0 ] ; _arg2 = this -> Direction [ 1 ] ; _arg3 = this -> Direction [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Direction  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOriginDirection ( double _arg [ 3 ] ) { this -> GetOriginDirection ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetMarkedStartVertices*(this: var vtkSimple3DCirclesStrategy;
                            _arg: ptr vtkAbstractArray) {.
    importcpp: "SetMarkedStartVertices", header: "vtkSimple3DCirclesStrategy.h".}
proc GetnameMarkedStartVertices*(this: var vtkSimple3DCirclesStrategy): ptr vtkAbstractArray {.
    importcpp: "GetnameMarkedStartVertices",
    header: "vtkSimple3DCirclesStrategy.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set or get MarkedValue. See: MarkedStartVertices.
  ##
proc SetMarkedValue*(this: var vtkSimple3DCirclesStrategy; _arg: vtkVariant) {.
    importcpp: "SetMarkedValue", header: "vtkSimple3DCirclesStrategy.h".}
proc GetMarkedValue*(this: var vtkSimple3DCirclesStrategy): vtkVariant {.
    importcpp: "GetMarkedValue", header: "vtkSimple3DCirclesStrategy.h".}
proc SetMethodRadiusHeightForceToUseUniversalStartPointsFinder*(
    this: var vtkSimple3DCirclesStrategy; _arg: vtkTypeBool) {.
    importcpp: "SetMethodRadiusHeightForceToUseUniversalStartPointsFinder",
    header: "vtkSimple3DCirclesStrategy.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetMethodRadiusHeightForceToUseUniversalStartPointsFinder ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ForceToUseUniversalStartPointsFinder  of  << this -> ForceToUseUniversalStartPointsFinder ) ; return this -> ForceToUseUniversalStartPointsFinder ; } ;
## Error: expected ';'!!!

proc ForceToUseUniversalStartPointsFinderOn*(this: var vtkSimple3DCirclesStrategy) {.
    importcpp: "ForceToUseUniversalStartPointsFinderOn",
    header: "vtkSimple3DCirclesStrategy.h".}
proc ForceToUseUniversalStartPointsFinderOff*(
    this: var vtkSimple3DCirclesStrategy) {.
    importcpp: "ForceToUseUniversalStartPointsFinderOff",
    header: "vtkSimple3DCirclesStrategy.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set or get auto height (Default: false). If AutoHeight is true, (r(i+1) - r(i-1))/Height will
  ##  be smaller than tan(MinimumRadian). If you want equal distances and parallel circles, you
  ##  should turn off AutoHeight.
  ##
proc SetMethodRadiusHeightForceToUseUniversalStartPointsFinderAutoHeight*(
    this: var vtkSimple3DCirclesStrategy; _arg: vtkTypeBool) {.importcpp: "SetMethodRadiusHeightForceToUseUniversalStartPointsFinderAutoHeight",
    header: "vtkSimple3DCirclesStrategy.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetMethodRadiusHeightForceToUseUniversalStartPointsFinderAutoHeight ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AutoHeight  of  << this -> AutoHeight ) ; return this -> AutoHeight ; } ;
## Error: expected ';'!!!

proc AutoHeightOn*(this: var vtkSimple3DCirclesStrategy) {.
    importcpp: "AutoHeightOn", header: "vtkSimple3DCirclesStrategy.h".}
proc AutoHeightOff*(this: var vtkSimple3DCirclesStrategy) {.
    importcpp: "AutoHeightOff", header: "vtkSimple3DCirclesStrategy.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set or get minimum radian (used by auto height).
  ##
proc SetMethodRadiusHeightForceToUseUniversalStartPointsFinderAutoHeightMinimumRadian*(
    this: var vtkSimple3DCirclesStrategy; _arg: cdouble) {.importcpp: "SetMethodRadiusHeightForceToUseUniversalStartPointsFinderAutoHeightMinimumRadian",
    header: "vtkSimple3DCirclesStrategy.h".}
## !!!Ignored construct:  virtual double GetMethodRadiusHeightForceToUseUniversalStartPointsFinderAutoHeightMinimumRadian ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinimumRadian  of  << this -> MinimumRadian ) ; return this -> MinimumRadian ; } ;
## Error: expected ';'!!!

proc SetMinimumDegree*(this: var vtkSimple3DCirclesStrategy; degree: cdouble) {.
    importcpp: "SetMinimumDegree", header: "vtkSimple3DCirclesStrategy.h".}
proc GetMinimumDegree*(this: var vtkSimple3DCirclesStrategy): cdouble {.
    importcpp: "GetMinimumDegree", header: "vtkSimple3DCirclesStrategy.h".}
proc SetHierarchicalLayers*(this: var vtkSimple3DCirclesStrategy;
                           _arg: ptr vtkIntArray) {.
    importcpp: "SetHierarchicalLayers", header: "vtkSimple3DCirclesStrategy.h".}
proc GetnameMarkedStartVerticesHierarchicalLayers*(
    this: var vtkSimple3DCirclesStrategy): ptr vtkIntArray {.
    importcpp: "GetnameMarkedStartVerticesHierarchicalLayers",
    header: "vtkSimple3DCirclesStrategy.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set or get hierarchical ordering of vertices (The array starts from the first vertex's id. All
  ##  id must be greater or equal to zero!) If no HierarchicalOrder is defined,
  ##  vtkSimple3DCirclesStrategy will generate it automatically (default).
  ##
proc SetHierarchicalOrder*(this: var vtkSimple3DCirclesStrategy;
                          _arg: ptr vtkIdTypeArray) {.
    importcpp: "SetHierarchicalOrder", header: "vtkSimple3DCirclesStrategy.h".}
proc GetnameMarkedStartVerticesHierarchicalLayersHierarchicalOrder*(
    this: var vtkSimple3DCirclesStrategy): ptr vtkIdTypeArray {.
    importcpp: "GetnameMarkedStartVerticesHierarchicalLayersHierarchicalOrder",
    header: "vtkSimple3DCirclesStrategy.h".}
  ## /@}
  ## *
  ##  Standard layout method
  ##
proc Layout*(this: var vtkSimple3DCirclesStrategy) {.importcpp: "Layout",
    header: "vtkSimple3DCirclesStrategy.h".}
proc SetGraph*(this: var vtkSimple3DCirclesStrategy; graph: ptr vtkGraph) {.
    importcpp: "SetGraph", header: "vtkSimple3DCirclesStrategy.h".}