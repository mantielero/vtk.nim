## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRandomHyperTreeGridSource.h
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
##  @class vtkRandomHyperTreeGridSource
##  @brief Builds a randomized but reproducible vtkHyperTreeGrid.
##

import
  vtkFiltersSourcesModule, vtkHyperTreeGridAlgorithm

discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkExtentTranslator"
discard "forward decl of vtkHyperTreeGridNonOrientedCursor"
discard "forward decl of vtkMinimalStandardRandomSequence"
type
  vtkRandomHyperTreeGridSource* {.importcpp: "vtkRandomHyperTreeGridSource",
                                 header: "vtkRandomHyperTreeGridSource.h", bycopy.} = object of vtkHyperTreeGridAlgorithm
    vtkRandomHyperTreeGridSource* {.importc: "vtkRandomHyperTreeGridSource".}: VTK_NEWINSTANCE


proc New*(): ptr vtkRandomHyperTreeGridSource {.
    importcpp: "vtkRandomHyperTreeGridSource::New(@)",
    header: "vtkRandomHyperTreeGridSource.h".}
type
  vtkRandomHyperTreeGridSourceSuperclass* = vtkHyperTreeGridAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkRandomHyperTreeGridSource::IsTypeOf(@)",
    header: "vtkRandomHyperTreeGridSource.h".}
proc IsA*(this: var vtkRandomHyperTreeGridSource; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkRandomHyperTreeGridSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkRandomHyperTreeGridSource {.
    importcpp: "vtkRandomHyperTreeGridSource::SafeDownCast(@)",
    header: "vtkRandomHyperTreeGridSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkRandomHyperTreeGridSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHyperTreeGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRandomHyperTreeGridSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRandomHyperTreeGridSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkRandomHyperTreeGridSource; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkRandomHyperTreeGridSource.h".}
## !!!Ignored construct:  *
##  The Dimensions of the output vtkHyperTreeGrid.
##  Default is 5x5x2.
##  @{
##  virtual unsigned int * GetDimensionsDimensions ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Dimensions  pointer  << this -> Dimensions ) ; return this -> Dimensions ; } VTK_WRAPEXCLUDE virtual void GetDimensionsDimensions ( unsigned int & _arg1 , unsigned int & _arg2 , unsigned int & _arg3 ) { _arg1 = this -> Dimensions [ 0 ] ; _arg2 = this -> Dimensions [ 1 ] ; _arg3 = this -> Dimensions [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Dimensions  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetDimensionsDimensions ( unsigned int _arg [ 3 ] ) { this -> GetDimensionsDimensions ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetDimensions*(this: var vtkRandomHyperTreeGridSource; _arg1: cuint;
                   _arg2: cuint; _arg3: cuint) {.importcpp: "SetDimensions",
    header: "vtkRandomHyperTreeGridSource.h".}
proc SetDimensions*(this: var vtkRandomHyperTreeGridSource; _arg: array[3, cuint]) {.
    importcpp: "SetDimensions", header: "vtkRandomHyperTreeGridSource.h".}
  ## *@}
  ## *
  ##  The bounds of the output vtkHyperTreeGrid.
  ##  The default is {-10, 10, -10, 10, -10, 10}.
  ##
## !!!Ignored construct:  virtual double * GetOutputBounds ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << OutputBounds  pointer  << this -> OutputBounds ) ; return this -> OutputBounds ; } VTK_WRAPEXCLUDE virtual void GetOutputBounds ( double & _arg1 , double & _arg2 , double & _arg3 , double & _arg4 , double & _arg5 , double & _arg6 ) { _arg1 = this -> OutputBounds [ 0 ] ; _arg2 = this -> OutputBounds [ 1 ] ; _arg3 = this -> OutputBounds [ 2 ] ; _arg4 = this -> OutputBounds [ 3 ] ; _arg5 = this -> OutputBounds [ 4 ] ; _arg6 = this -> OutputBounds [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << OutputBounds  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOutputBounds ( double _arg [ 6 ] ) { this -> GetOutputBounds ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ;
## Error: expected ';'!!!

proc SetOutputBounds*(this: var vtkRandomHyperTreeGridSource; _arg1: cdouble;
                     _arg2: cdouble; _arg3: cdouble; _arg4: cdouble; _arg5: cdouble;
                     _arg6: cdouble) {.importcpp: "SetOutputBounds",
                                     header: "vtkRandomHyperTreeGridSource.h".}
proc SetOutputBounds*(this: var vtkRandomHyperTreeGridSource;
                     _arg: array[6, cdouble]) {.importcpp: "SetOutputBounds",
    header: "vtkRandomHyperTreeGridSource.h".}
  ## *
  ##  A seed for the random number generator used to construct the output
  ##  vtkHyperTreeGrid.
  ##  The default is 0.
  ##  @{
  ##
## !!!Ignored construct:  virtual vtkTypeUInt32 GetSeed ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Seed  of  << this -> Seed ) ; return this -> Seed ; } ;
## Error: expected ';'!!!

proc SetSeed*(this: var vtkRandomHyperTreeGridSource; _arg: vtkTypeUInt32) {.
    importcpp: "SetSeed", header: "vtkRandomHyperTreeGridSource.h".}
  ## *@}
  ## *
  ##  The maximum number of levels to allow in the output vtkHyperTreeGrid.
  ##  The default is 5.
  ##  @{
  ##
## !!!Ignored construct:  virtual vtkIdType GetSeedMaxDepth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaxDepth  of  << this -> MaxDepth ) ; return this -> MaxDepth ; } ;
## Error: expected ';'!!!

proc SetMaxDepth*(this: var vtkRandomHyperTreeGridSource; _arg: vtkIdType) {.
    importcpp: "SetMaxDepth", header: "vtkRandomHyperTreeGridSource.h".}
proc GetMaxDepthMinValue*(this: var vtkRandomHyperTreeGridSource): vtkIdType {.
    importcpp: "GetMaxDepthMinValue", header: "vtkRandomHyperTreeGridSource.h".}
proc GetMaxDepthMaxValue*(this: var vtkRandomHyperTreeGridSource): vtkIdType {.
    importcpp: "GetMaxDepthMaxValue", header: "vtkRandomHyperTreeGridSource.h".}
  ## *@}
  ## *
  ##  The target fraction of nodes that will be split during generation.
  ##  Valid range is [0., 1.]. The default is 0.5.
  ##  @{
  ##
## !!!Ignored construct:  virtual double GetSeedMaxDepthSplitFraction ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SplitFraction  of  << this -> SplitFraction ) ; return this -> SplitFraction ; } ;
## Error: expected ';'!!!

proc SetMaxDepthSplitFraction*(this: var vtkRandomHyperTreeGridSource; _arg: cdouble) {.
    importcpp: "SetMaxDepthSplitFraction",
    header: "vtkRandomHyperTreeGridSource.h".}
proc GetMaxDepthMinValueSplitFractionMinValue*(
    this: var vtkRandomHyperTreeGridSource): cdouble {.
    importcpp: "GetMaxDepthMinValueSplitFractionMinValue",
    header: "vtkRandomHyperTreeGridSource.h".}
proc GetMaxDepthMaxValueSplitFractionMaxValue*(
    this: var vtkRandomHyperTreeGridSource): cdouble {.
    importcpp: "GetMaxDepthMaxValueSplitFractionMaxValue",
    header: "vtkRandomHyperTreeGridSource.h".}
  ## *@}