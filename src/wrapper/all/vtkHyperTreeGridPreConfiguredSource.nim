## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHyperTreeGridPreConfiguredSource.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyrgight notice for more information.
##
## =========================================================================
## *
##  @class vtkHyperTreeGridPreConfiguredSource
##  @brief Helper class for generating a curated set of HyperTree Grids (HTGs) for testing purposes
##
##  Provides a set of public methods for generating some commonly used HTG setups.
##

import
  vtkFiltersSourcesModule, vtkHyperTreeGridAlgorithm

discard "forward decl of vtkHyperTreeGrid"
discard "forward decl of vtkHyperTreeGridNonOrientedCursor"
discard "forward decl of vtkDoubleArray"
type
  vtkHyperTreeGridPreConfiguredSource* {.importcpp: "vtkHyperTreeGridPreConfiguredSource", header: "vtkHyperTreeGridPreConfiguredSource.h",
                                        bycopy.} = object of vtkHyperTreeGridAlgorithm ## *
                                                                                  ##  Standard object factory setup
                                                                                  ##
                                                                                  ## *
                                                                                  ##  Contructor setup
                                                                                  ##
    vtkHyperTreeGridPreConfiguredSource* {.
        importc: "vtkHyperTreeGridPreConfiguredSource".}: VTK_NEWINSTANCE
    ## *
    ##  All members related to the CUSTOM HTGType
    ##
    ## /@}

  vtkHyperTreeGridPreConfiguredSourceSuperclass* = vtkHyperTreeGridAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkHyperTreeGridPreConfiguredSource::IsTypeOf(@)",
    header: "vtkHyperTreeGridPreConfiguredSource.h".}
proc IsA*(this: var vtkHyperTreeGridPreConfiguredSource; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkHyperTreeGridPreConfiguredSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkHyperTreeGridPreConfiguredSource {.
    importcpp: "vtkHyperTreeGridPreConfiguredSource::SafeDownCast(@)",
    header: "vtkHyperTreeGridPreConfiguredSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkHyperTreeGridPreConfiguredSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHyperTreeGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHyperTreeGridPreConfiguredSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHyperTreeGridPreConfiguredSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc New*(): ptr vtkHyperTreeGridPreConfiguredSource {.
    importcpp: "vtkHyperTreeGridPreConfiguredSource::New(@)",
    header: "vtkHyperTreeGridPreConfiguredSource.h".}
proc GenerateUnbalanced*(this: var vtkHyperTreeGridPreConfiguredSource;
                        HTG: ptr vtkHyperTreeGrid; dim: cuint; factor: cuint;
                        depth: cuint; extent: vector[cdouble];
                        subdivisions: vector[cuint]) {.
    importcpp: "GenerateUnbalanced",
    header: "vtkHyperTreeGridPreConfiguredSource.h".}
proc GenerateBalanced*(this: var vtkHyperTreeGridPreConfiguredSource;
                      HTG: ptr vtkHyperTreeGrid; dim: cuint; factor: cuint;
                      depth: cuint; extent: vector[cdouble];
                      subdivisions: vector[cuint]) {.
    importcpp: "GenerateBalanced", header: "vtkHyperTreeGridPreConfiguredSource.h".}
type
  vtkHyperTreeGridPreConfiguredSourceHTGType* {.size: sizeof(cint),
      importcpp: "vtkHyperTreeGridPreConfiguredSource::HTGType",
      header: "vtkHyperTreeGridPreConfiguredSource.h".} = enum
    UNBALANCED_3DEPTH_2BRANCH_2X3, BALANCED_3DEPTH_2BRANCH_2X3,
    UNBALANCED_2DEPTH_3BRANCH_3X3, BALANCED_4DEPTH_3BRANCH_2X2,
    UNBALANCED_3DEPTH_2BRANCH_3X2X3, BALANCED_2DEPTH_3BRANCH_3X3X2, CUSTOM


type
  vtkHyperTreeGridPreConfiguredSourceHTGArchitecture* {.size: sizeof(cint),
      importcpp: "vtkHyperTreeGridPreConfiguredSource::HTGArchitecture",
      header: "vtkHyperTreeGridPreConfiguredSource.h".} = enum
    UNBALANCED, BALANCED


proc GetHTGMode*(this: vtkHyperTreeGridPreConfiguredSource): vtkHyperTreeGridPreConfiguredSourceHTGType {.
    noSideEffect, importcpp: "GetHTGMode",
    header: "vtkHyperTreeGridPreConfiguredSource.h".}
proc SetHTGMode*(this: var vtkHyperTreeGridPreConfiguredSource;
                _arg: vtkHyperTreeGridPreConfiguredSourceHTGType) {.
    importcpp: "SetHTGMode", header: "vtkHyperTreeGridPreConfiguredSource.h".}
  ## /@{
  ## *
  ##  Get/Set for custom architecture
  ##
proc GetHTGModeCustomArchitecture*(this: vtkHyperTreeGridPreConfiguredSource): vtkHyperTreeGridPreConfiguredSourceHTGArchitecture {.
    noSideEffect, importcpp: "GetHTGModeCustomArchitecture",
    header: "vtkHyperTreeGridPreConfiguredSource.h".}
proc SetHTGModeCustomArchitecture*(this: var vtkHyperTreeGridPreConfiguredSource;
    _arg: vtkHyperTreeGridPreConfiguredSourceHTGArchitecture) {.
    importcpp: "SetHTGModeCustomArchitecture",
    header: "vtkHyperTreeGridPreConfiguredSource.h".}
  ## *
  ##  Get/Set for custom dimension
  ##
## !!!Ignored construct:  virtual unsigned int GetCustomDim ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CustomDim  of  << this -> CustomDim ) ; return this -> CustomDim ; } ;
## Error: expected ';'!!!

proc SetCustomDim*(this: var vtkHyperTreeGridPreConfiguredSource; _arg: cuint) {.
    importcpp: "SetCustomDim", header: "vtkHyperTreeGridPreConfiguredSource.h".}
  ## *
  ##  Get/Set for custom branching factor
  ##
## !!!Ignored construct:  virtual unsigned int GetCustomDimCustomFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CustomFactor  of  << this -> CustomFactor ) ; return this -> CustomFactor ; } ;
## Error: expected ';'!!!

proc SetCustomDimCustomFactor*(this: var vtkHyperTreeGridPreConfiguredSource;
                              _arg: cuint) {.
    importcpp: "SetCustomDimCustomFactor",
    header: "vtkHyperTreeGridPreConfiguredSource.h".}
  ## *
  ##  Get/Set for custom depth
  ##
## !!!Ignored construct:  virtual unsigned int GetCustomDimCustomFactorCustomDepth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CustomDepth  of  << this -> CustomDepth ) ; return this -> CustomDepth ; } ;
## Error: expected ';'!!!

proc SetCustomDimCustomFactorCustomDepth*(
    this: var vtkHyperTreeGridPreConfiguredSource; _arg: cuint) {.
    importcpp: "SetCustomDimCustomFactorCustomDepth",
    header: "vtkHyperTreeGridPreConfiguredSource.h".}
  ## *
  ##  Get/Set for custom extent in coordinate space
  ##
## !!!Ignored construct:  virtual double * GetCustomExtent ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << CustomExtent  pointer  << this -> CustomExtent ) ; return this -> CustomExtent ; } VTK_WRAPEXCLUDE virtual void GetCustomExtent ( double & _arg1 , double & _arg2 , double & _arg3 , double & _arg4 , double & _arg5 , double & _arg6 ) { _arg1 = this -> CustomExtent [ 0 ] ; _arg2 = this -> CustomExtent [ 1 ] ; _arg3 = this -> CustomExtent [ 2 ] ; _arg4 = this -> CustomExtent [ 3 ] ; _arg5 = this -> CustomExtent [ 4 ] ; _arg6 = this -> CustomExtent [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << CustomExtent  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCustomExtent ( double _arg [ 6 ] ) { this -> GetCustomExtent ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ;
## Error: expected ';'!!!

proc SetCustomExtent*(this: var vtkHyperTreeGridPreConfiguredSource; _arg1: cdouble;
                     _arg2: cdouble; _arg3: cdouble; _arg4: cdouble; _arg5: cdouble;
                     _arg6: cdouble) {.importcpp: "SetCustomExtent", header: "vtkHyperTreeGridPreConfiguredSource.h".}
proc SetCustomExtent*(this: var vtkHyperTreeGridPreConfiguredSource;
                     _arg: array[6, cdouble]) {.importcpp: "SetCustomExtent",
    header: "vtkHyperTreeGridPreConfiguredSource.h".}
  ## *
  ##  Get/Set for custom subdivisions of the extent
  ##
## !!!Ignored construct:  virtual unsigned int * GetCustomSubdivisions ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << CustomSubdivisions  pointer  << this -> CustomSubdivisions ) ; return this -> CustomSubdivisions ; } VTK_WRAPEXCLUDE virtual void GetCustomSubdivisions ( unsigned int & _arg1 , unsigned int & _arg2 , unsigned int & _arg3 ) { _arg1 = this -> CustomSubdivisions [ 0 ] ; _arg2 = this -> CustomSubdivisions [ 1 ] ; _arg3 = this -> CustomSubdivisions [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << CustomSubdivisions  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCustomSubdivisions ( unsigned int _arg [ 3 ] ) { this -> GetCustomSubdivisions ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetCustomSubdivisions*(this: var vtkHyperTreeGridPreConfiguredSource;
                           _arg1: cuint; _arg2: cuint; _arg3: cuint) {.
    importcpp: "SetCustomSubdivisions",
    header: "vtkHyperTreeGridPreConfiguredSource.h".}
proc SetCustomSubdivisions*(this: var vtkHyperTreeGridPreConfiguredSource;
                           _arg: array[3, cuint]) {.
    importcpp: "SetCustomSubdivisions",
    header: "vtkHyperTreeGridPreConfiguredSource.h".}
  ## /@}
  ## /@{
  ## *
  ##   Helper functions for generating the different types of HTGs
  ##
proc GenerateUnbalanced3DepthQuadTree2x3*(
    this: var vtkHyperTreeGridPreConfiguredSource; HTG: ptr vtkHyperTreeGrid) {.
    importcpp: "GenerateUnbalanced3DepthQuadTree2x3",
    header: "vtkHyperTreeGridPreConfiguredSource.h".}
proc GenerateBalanced3DepthQuadTree2x3*(this: var vtkHyperTreeGridPreConfiguredSource;
                                       HTG: ptr vtkHyperTreeGrid) {.
    importcpp: "GenerateBalanced3DepthQuadTree2x3",
    header: "vtkHyperTreeGridPreConfiguredSource.h".}
proc GenerateUnbalanced2Depth3BranchTree3x3*(
    this: var vtkHyperTreeGridPreConfiguredSource; HTG: ptr vtkHyperTreeGrid) {.
    importcpp: "GenerateUnbalanced2Depth3BranchTree3x3",
    header: "vtkHyperTreeGridPreConfiguredSource.h".}
proc GenerateBalanced4Depth3BranchTree2x2*(
    this: var vtkHyperTreeGridPreConfiguredSource; HTG: ptr vtkHyperTreeGrid) {.
    importcpp: "GenerateBalanced4Depth3BranchTree2x2",
    header: "vtkHyperTreeGridPreConfiguredSource.h".}
proc GenerateUnbalanced3DepthOctTree3x2x3*(
    this: var vtkHyperTreeGridPreConfiguredSource; HTG: ptr vtkHyperTreeGrid) {.
    importcpp: "GenerateUnbalanced3DepthOctTree3x2x3",
    header: "vtkHyperTreeGridPreConfiguredSource.h".}
proc GenerateBalanced2Depth3BranchTree3x3x2*(
    this: var vtkHyperTreeGridPreConfiguredSource; HTG: ptr vtkHyperTreeGrid) {.
    importcpp: "GenerateBalanced2Depth3BranchTree3x3x2",
    header: "vtkHyperTreeGridPreConfiguredSource.h".}
proc GenerateCustom*(this: var vtkHyperTreeGridPreConfiguredSource;
                    HTG: ptr vtkHyperTreeGrid): cint {.importcpp: "GenerateCustom",
    header: "vtkHyperTreeGridPreConfiguredSource.h".}
##  vtkHyperTreeGridPreConfiguredSource
