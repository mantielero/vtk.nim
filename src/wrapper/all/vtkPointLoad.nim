## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPointLoad.h
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
##  @class   vtkPointLoad
##  @brief   compute stress tensors given point load on semi-infinite domain
##
##  vtkPointLoad is a source object that computes stress tensors on a volume.
##  The tensors are computed from the application of a point load on a
##  semi-infinite domain. (The analytical results are adapted from Saada - see
##  text.) It also is possible to compute effective stress scalars if desired.
##  This object serves as a specialized data generator for some of the examples
##  in the text.
##
##  @sa
##  vtkTensorGlyph vtkHyperStreamline vtkGlyphPackingFilter
##

import
  vtkImageAlgorithm, vtkImagingHybridModule

type
  vtkPointLoad* {.importcpp: "vtkPointLoad", header: "vtkPointLoad.h", bycopy.} = object of vtkImageAlgorithm ## /@{
                                                                                                    ## *
                                                                                                    ##  Standard methods for obtaining type information and printing.
                                                                                                    ##
    vtkPointLoad* {.importc: "vtkPointLoad".}: VTK_NEWINSTANCE

  vtkPointLoadSuperclass* = vtkImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPointLoad::IsTypeOf(@)", header: "vtkPointLoad.h".}
proc IsA*(this: var vtkPointLoad; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkPointLoad.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPointLoad {.
    importcpp: "vtkPointLoad::SafeDownCast(@)", header: "vtkPointLoad.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPointLoad :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPointLoad :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPointLoad :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPointLoad; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPointLoad.h".}
proc New*(): ptr vtkPointLoad {.importcpp: "vtkPointLoad::New(@)",
                            header: "vtkPointLoad.h".}
proc SetLoadValue*(this: var vtkPointLoad; _arg: cdouble) {.importcpp: "SetLoadValue",
    header: "vtkPointLoad.h".}
## !!!Ignored construct:  virtual double GetLoadValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LoadValue  of  << this -> LoadValue ) ; return this -> LoadValue ; } ;
## Error: expected ';'!!!

proc SetSampleDimensions*(this: var vtkPointLoad; dim: array[3, cint]) {.
    importcpp: "SetSampleDimensions", header: "vtkPointLoad.h".}
proc SetSampleDimensions*(this: var vtkPointLoad; i: cint; j: cint; k: cint) {.
    importcpp: "SetSampleDimensions", header: "vtkPointLoad.h".}
## !!!Ignored construct:  virtual int * GetSampleDimensions ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << SampleDimensions  pointer  << this -> SampleDimensions ) ; return this -> SampleDimensions ; } VTK_WRAPEXCLUDE virtual void GetSampleDimensions ( int data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> SampleDimensions [ i ] ; } } ;
## Error: expected ';'!!!

proc SetModelBounds*(this: var vtkPointLoad; _arg1: cdouble; _arg2: cdouble;
                    _arg3: cdouble; _arg4: cdouble; _arg5: cdouble; _arg6: cdouble) {.
    importcpp: "SetModelBounds", header: "vtkPointLoad.h".}
proc SetModelBounds*(this: var vtkPointLoad; _arg: array[6, cdouble]) {.
    importcpp: "SetModelBounds", header: "vtkPointLoad.h".}
## !!!Ignored construct:  virtual double * GetSampleDimensionsModelBounds ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ModelBounds  pointer  << this -> ModelBounds ) ; return this -> ModelBounds ; } VTK_WRAPEXCLUDE virtual void GetSampleDimensionsModelBounds ( double data [ 6 ] ) { for ( int i = 0 ; i < 6 ; i ++ ) { data [ i ] = this -> ModelBounds [ i ] ; } } ;
## Error: expected ';'!!!

proc SetLoadValuePoissonsRatio*(this: var vtkPointLoad; _arg: cdouble) {.
    importcpp: "SetLoadValuePoissonsRatio", header: "vtkPointLoad.h".}
## !!!Ignored construct:  virtual double GetLoadValuePoissonsRatio ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PoissonsRatio  of  << this -> PoissonsRatio ) ; return this -> PoissonsRatio ; } ;
## Error: expected ';'!!!

proc SetComputeEffectiveStress*(this: var vtkPointLoad; a2: cint) {.
    importcpp: "SetComputeEffectiveStress", header: "vtkPointLoad.h".}
proc GetComputeEffectiveStress*(this: var vtkPointLoad): cint {.
    importcpp: "GetComputeEffectiveStress", header: "vtkPointLoad.h".}
proc ComputeEffectiveStressOn*(this: var vtkPointLoad) {.
    importcpp: "ComputeEffectiveStressOn", header: "vtkPointLoad.h".}
proc ComputeEffectiveStressOff*(this: var vtkPointLoad) {.
    importcpp: "ComputeEffectiveStressOff", header: "vtkPointLoad.h".}