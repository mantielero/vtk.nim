## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHyperTreeGridSource.h
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
##  @class   vtkHyperTreeGridSource
##  @brief   Create a synthetic grid of hypertrees.
##
##
##  This class uses input parameters, most notably a string descriptor,
##  to generate a vtkHyperTreeGrid instance representing the corresponding
##  tree-based AMR grid. This descriptor uses the following conventions,
##  e.g., to describe a 1-D ternary subdivision with 2 root cells
##  L0    L1        L2
##  RR  | .R. ... | ...
##  For this tree:
##   HTG:       .
##            /   \
##   L0:     .     .
##          /|\   /|\
##   L1:   c . c c c c
##          /|\
##   L2:   c c c
##  The top level of the tree is not considered a grid level
##  NB: For ease of legibility, white spaces are allowed and ignored.
##
##  @par Thanks:
##  This class was written by Philippe Pebay, Joachim Pouderoux, and Charles Law, Kitware 2013
##  This class was modified by Guenole Harel and Jacques-Bernard Lekien 2014
##  This class was modified by Philippe Pebay, 2016
##  This work was supported by Commissariat a l'Energie Atomique (CEA/DIF)
##  CEA, DAM, DIF, F-91297 Arpajon, France.
##

import
  vtkFiltersSourcesModule, vtkHyperTreeGridAlgorithm

discard "forward decl of vtkBitArray"
discard "forward decl of vtkDataArray"
discard "forward decl of vtkHyperTreeGridNonOrientedCursor"
discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkImplicitFunction"
discard "forward decl of vtkHyperTreeGrid"
discard "forward decl of vtkQuadric"
type
  vtkHyperTreeGridSource* {.importcpp: "vtkHyperTreeGridSource",
                           header: "vtkHyperTreeGridSource.h", bycopy.} = object of vtkHyperTreeGridAlgorithm
    vtkHyperTreeGridSource* {.importc: "vtkHyperTreeGridSource".}: VTK_NEWINSTANCE

  vtkHyperTreeGridSourceSuperclass* = vtkHyperTreeGridAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkHyperTreeGridSource::IsTypeOf(@)",
    header: "vtkHyperTreeGridSource.h".}
proc IsA*(this: var vtkHyperTreeGridSource; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkHyperTreeGridSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkHyperTreeGridSource {.
    importcpp: "vtkHyperTreeGridSource::SafeDownCast(@)",
    header: "vtkHyperTreeGridSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkHyperTreeGridSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHyperTreeGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHyperTreeGridSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHyperTreeGridSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkHyperTreeGridSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkHyperTreeGridSource.h".}
proc New*(): ptr vtkHyperTreeGridSource {.importcpp: "vtkHyperTreeGridSource::New(@)",
                                      header: "vtkHyperTreeGridSource.h".}
proc GetMaxDepth*(this: var vtkHyperTreeGridSource): cuint {.
    importcpp: "GetMaxDepth", header: "vtkHyperTreeGridSource.h".}
proc SetMaxDepth*(this: var vtkHyperTreeGridSource; levels: cuint) {.
    importcpp: "SetMaxDepth", header: "vtkHyperTreeGridSource.h".}
proc SetOrigin*(this: var vtkHyperTreeGridSource; _arg1: cdouble; _arg2: cdouble;
               _arg3: cdouble) {.importcpp: "SetOrigin",
                               header: "vtkHyperTreeGridSource.h".}
proc SetOrigin*(this: var vtkHyperTreeGridSource; _arg: array[3, cdouble]) {.
    importcpp: "SetOrigin", header: "vtkHyperTreeGridSource.h".}
## !!!Ignored construct:  virtual double * GetOrigin ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Origin  pointer  << this -> Origin ) ; return this -> Origin ; } VTK_WRAPEXCLUDE virtual void GetOrigin ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Origin [ 0 ] ; _arg2 = this -> Origin [ 1 ] ; _arg3 = this -> Origin [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Origin  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOrigin ( double _arg [ 3 ] ) { this -> GetOrigin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetOriginGridScale*(this: var vtkHyperTreeGridSource; _arg1: cdouble;
                        _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetOriginGridScale", header: "vtkHyperTreeGridSource.h".}
proc SetOriginGridScale*(this: var vtkHyperTreeGridSource; _arg: array[3, cdouble]) {.
    importcpp: "SetOriginGridScale", header: "vtkHyperTreeGridSource.h".}
## !!!Ignored construct:  virtual double * GetOriginGridScale ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << GridScale  pointer  << this -> GridScale ) ; return this -> GridScale ; } VTK_WRAPEXCLUDE virtual void GetOriginGridScale ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> GridScale [ 0 ] ; _arg2 = this -> GridScale [ 1 ] ; _arg3 = this -> GridScale [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << GridScale  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOriginGridScale ( double _arg [ 3 ] ) { this -> GetOriginGridScale ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetGridScale*(this: var vtkHyperTreeGridSource; scale: cdouble) {.
    importcpp: "SetGridScale", header: "vtkHyperTreeGridSource.h".}
proc SetDimensions*(this: var vtkHyperTreeGridSource; dims: ptr cuint) {.
    importcpp: "SetDimensions", header: "vtkHyperTreeGridSource.h".}
proc SetDimensions*(this: var vtkHyperTreeGridSource; a2: cuint; a3: cuint; a4: cuint) {.
    importcpp: "SetDimensions", header: "vtkHyperTreeGridSource.h".}
## !!!Ignored construct:  virtual unsigned int * GetOriginGridScaleDimensions ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Dimensions  pointer  << this -> Dimensions ) ; return this -> Dimensions ; } VTK_WRAPEXCLUDE virtual void GetOriginGridScaleDimensions ( unsigned int & _arg1 , unsigned int & _arg2 , unsigned int & _arg3 ) { _arg1 = this -> Dimensions [ 0 ] ; _arg2 = this -> Dimensions [ 1 ] ; _arg3 = this -> Dimensions [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Dimensions  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOriginGridScaleDimensions ( unsigned int _arg [ 3 ] ) { this -> GetOriginGridScaleDimensions ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetTransposedRootIndexing*(this: var vtkHyperTreeGridSource; _arg: bool) {.
    importcpp: "SetTransposedRootIndexing", header: "vtkHyperTreeGridSource.h".}
## !!!Ignored construct:  virtual bool GetTransposedRootIndexing ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TransposedRootIndexing  of  << this -> TransposedRootIndexing ) ; return this -> TransposedRootIndexing ; } ;
## Error: expected ';'!!!

proc SetIndexingModeToKJI*(this: var vtkHyperTreeGridSource) {.
    importcpp: "SetIndexingModeToKJI", header: "vtkHyperTreeGridSource.h".}
proc SetIndexingModeToIJK*(this: var vtkHyperTreeGridSource) {.
    importcpp: "SetIndexingModeToIJK", header: "vtkHyperTreeGridSource.h".}
## !!!Ignored construct:  /@} /@{ *
##  Set/Get the orientation of the grid (in 1D and 2D)
##  virtual unsigned int GetTransposedRootIndexingOrientationOrientation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Orientation  of  << this -> Orientation ) ; return this -> Orientation ; } ;
## Error: expected ';'!!!

proc SetBranchFactor*(this: var vtkHyperTreeGridSource; _arg: cuint) {.
    importcpp: "SetBranchFactor", header: "vtkHyperTreeGridSource.h".}
proc GetBranchFactorMinValue*(this: var vtkHyperTreeGridSource): cuint {.
    importcpp: "GetBranchFactorMinValue", header: "vtkHyperTreeGridSource.h".}
proc GetBranchFactorMaxValue*(this: var vtkHyperTreeGridSource): cuint {.
    importcpp: "GetBranchFactorMaxValue", header: "vtkHyperTreeGridSource.h".}
## !!!Ignored construct:  virtual unsigned int GetTransposedRootIndexingOrientationOrientationBranchFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BranchFactor  of  << this -> BranchFactor ) ; return this -> BranchFactor ; } ;
## Error: expected ';'!!!

proc SetTransposedRootIndexingUseDescriptor*(this: var vtkHyperTreeGridSource;
    _arg: bool) {.importcpp: "SetTransposedRootIndexingUseDescriptor",
                header: "vtkHyperTreeGridSource.h".}
## !!!Ignored construct:  virtual bool GetTransposedRootIndexingOrientationOrientationBranchFactorUseDescriptor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseDescriptor  of  << this -> UseDescriptor ) ; return this -> UseDescriptor ; } ;
## Error: expected ';'!!!

proc UseDescriptorOn*(this: var vtkHyperTreeGridSource) {.
    importcpp: "UseDescriptorOn", header: "vtkHyperTreeGridSource.h".}
proc UseDescriptorOff*(this: var vtkHyperTreeGridSource) {.
    importcpp: "UseDescriptorOff", header: "vtkHyperTreeGridSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get whether the material mask should be used.
  ##  NB: This is only used when UseDescriptor is ON
  ##  Default: false
  ##
proc SetTransposedRootIndexingUseDescriptorUseMask*(
    this: var vtkHyperTreeGridSource; _arg: bool) {.
    importcpp: "SetTransposedRootIndexingUseDescriptorUseMask",
    header: "vtkHyperTreeGridSource.h".}
## !!!Ignored construct:  virtual bool GetTransposedRootIndexingOrientationOrientationBranchFactorUseDescriptorUseMask ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseMask  of  << this -> UseMask ) ; return this -> UseMask ; } ;
## Error: expected ';'!!!

proc UseMaskOn*(this: var vtkHyperTreeGridSource) {.importcpp: "UseMaskOn",
    header: "vtkHyperTreeGridSource.h".}
proc UseMaskOff*(this: var vtkHyperTreeGridSource) {.importcpp: "UseMaskOff",
    header: "vtkHyperTreeGridSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get whether cell-centered interface fields
  ##  should be generated.
  ##  Default: false
  ##
proc SetTransposedRootIndexingUseDescriptorUseMaskGenerateInterfaceFields*(
    this: var vtkHyperTreeGridSource; _arg: bool) {.importcpp: "SetTransposedRootIndexingUseDescriptorUseMaskGenerateInterfaceFields",
    header: "vtkHyperTreeGridSource.h".}
## !!!Ignored construct:  virtual bool GetTransposedRootIndexingOrientationOrientationBranchFactorUseDescriptorUseMaskGenerateInterfaceFields ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateInterfaceFields  of  << this -> GenerateInterfaceFields ) ; return this -> GenerateInterfaceFields ; } ;
## Error: expected ';'!!!

proc GenerateInterfaceFieldsOn*(this: var vtkHyperTreeGridSource) {.
    importcpp: "GenerateInterfaceFieldsOn", header: "vtkHyperTreeGridSource.h".}
proc GenerateInterfaceFieldsOff*(this: var vtkHyperTreeGridSource) {.
    importcpp: "GenerateInterfaceFieldsOff", header: "vtkHyperTreeGridSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the string used to describe the grid.
  ##
proc SetDescriptor*(this: var vtkHyperTreeGridSource; _arg: cstring) {.
    importcpp: "SetDescriptor", header: "vtkHyperTreeGridSource.h".}
proc GetDescriptor*(this: var vtkHyperTreeGridSource): cstring {.
    importcpp: "GetDescriptor", header: "vtkHyperTreeGridSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the string used to as a material mask.
  ##
proc SetDescriptorMask*(this: var vtkHyperTreeGridSource; _arg: cstring) {.
    importcpp: "SetDescriptorMask", header: "vtkHyperTreeGridSource.h".}
proc GetDescriptorMask*(this: var vtkHyperTreeGridSource): cstring {.
    importcpp: "GetDescriptorMask", header: "vtkHyperTreeGridSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the bitarray used to describe the grid.
  ##
proc SetDescriptorBits*(this: var vtkHyperTreeGridSource; a2: ptr vtkBitArray) {.
    importcpp: "SetDescriptorBits", header: "vtkHyperTreeGridSource.h".}
proc GetnameDescriptorBits*(this: var vtkHyperTreeGridSource): ptr vtkBitArray {.
    importcpp: "GetnameDescriptorBits", header: "vtkHyperTreeGridSource.h".}
  ## /@}
  ## *
  ##  Set the index array used to as a material mask.
  ##
proc SetLevelZeroMaterialIndex*(this: var vtkHyperTreeGridSource;
                               a2: ptr vtkIdTypeArray) {.
    importcpp: "SetLevelZeroMaterialIndex", header: "vtkHyperTreeGridSource.h".}
proc SetMaskBits*(this: var vtkHyperTreeGridSource; a2: ptr vtkBitArray) {.
    importcpp: "SetMaskBits", header: "vtkHyperTreeGridSource.h".}
proc GetnameDescriptorBitsMaskBits*(this: var vtkHyperTreeGridSource): ptr vtkBitArray {.
    importcpp: "GetnameDescriptorBitsMaskBits", header: "vtkHyperTreeGridSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the quadric function.
  ##
proc SetQuadric*(this: var vtkHyperTreeGridSource; a2: ptr vtkQuadric) {.
    importcpp: "SetQuadric", header: "vtkHyperTreeGridSource.h".}
proc GetnameDescriptorBitsMaskBitsQuadric*(this: var vtkHyperTreeGridSource): ptr vtkQuadric {.
    importcpp: "GetnameDescriptorBitsMaskBitsQuadric",
    header: "vtkHyperTreeGridSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Helpers to set/get the 10 coefficients of the quadric function
  ##
proc SetQuadricCoefficients*(this: var vtkHyperTreeGridSource;
                            a2: array[10, cdouble]) {.
    importcpp: "SetQuadricCoefficients", header: "vtkHyperTreeGridSource.h".}
proc GetQuadricCoefficients*(this: var vtkHyperTreeGridSource;
                            a2: array[10, cdouble]) {.
    importcpp: "GetQuadricCoefficients", header: "vtkHyperTreeGridSource.h".}
proc GetQuadricCoefficients*(this: var vtkHyperTreeGridSource): ptr cdouble {.
    importcpp: "GetQuadricCoefficients", header: "vtkHyperTreeGridSource.h".}
proc GetMTime*(this: var vtkHyperTreeGridSource): vtkMTimeType {.
    importcpp: "GetMTime", header: "vtkHyperTreeGridSource.h".}
proc ConvertDescriptorStringToBitArray*(this: var vtkHyperTreeGridSource; a2: string): ptr vtkBitArray {.
    importcpp: "ConvertDescriptorStringToBitArray",
    header: "vtkHyperTreeGridSource.h".}
proc ConvertMaskStringToBitArray*(this: var vtkHyperTreeGridSource; a2: string): ptr vtkBitArray {.
    importcpp: "ConvertMaskStringToBitArray", header: "vtkHyperTreeGridSource.h".}