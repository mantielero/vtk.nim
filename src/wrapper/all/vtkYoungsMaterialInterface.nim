## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkYoungsMaterialInterface.h
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
##  @class   vtkYoungsMaterialInterface
##  @brief   reconstructs material interfaces
##
##
##  Reconstructs material interfaces from a mesh containing mixed cells (where several materials are
##  mixed) this implementation is based on the youngs algorithm, generalized to arbitrary cell types
##  and works on both 2D and 3D meshes. the main advantage of the youngs algorithm is it guarantees
##  the material volume correctness. for 2D meshes, the AxisSymetric flag allows to switch between a
##  pure 2D (planar) algorithm and an axis symmetric 2D algorithm handling volumes of revolution.
##
##  @par Thanks:
##  This file is part of the generalized Youngs material interface reconstruction algorithm
##  contributed by <br> CEA/DIF - Commissariat a l'Energie Atomique, Centre DAM Ile-De-France <br>
##  BP12, F-91297 Arpajon, France. <br>
##  Implementation by Thierry Carrard (thierry.carrard@cea.fr)
##  Modification by Philippe Pebay (philippe.pebay@kitware.com)
##

import
  vtkFiltersGeneralModule, vtkMultiBlockDataSetAlgorithm, vtkSmartPointer

discard "forward decl of vtkIntArray"
discard "forward decl of vtkInformation"
discard "forward decl of vtkInformationVector"
discard "forward decl of vtkYoungsMaterialInterfaceInternals"
type
  vtkYoungsMaterialInterface* {.importcpp: "vtkYoungsMaterialInterface",
                               header: "vtkYoungsMaterialInterface.h", bycopy.} = object of vtkMultiBlockDataSetAlgorithm
    vtkYoungsMaterialInterface* {.importc: "vtkYoungsMaterialInterface".}: VTK_NEWINSTANCE
    ## /@}
    ## *
    ##  Read only properties
    ##
    ##  Description:
    ##  Internal data structures


proc New*(): ptr vtkYoungsMaterialInterface {.
    importcpp: "vtkYoungsMaterialInterface::New(@)",
    header: "vtkYoungsMaterialInterface.h".}
type
  vtkYoungsMaterialInterfaceSuperclass* = vtkMultiBlockDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkYoungsMaterialInterface::IsTypeOf(@)",
    header: "vtkYoungsMaterialInterface.h".}
proc IsA*(this: var vtkYoungsMaterialInterface; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkYoungsMaterialInterface.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkYoungsMaterialInterface {.
    importcpp: "vtkYoungsMaterialInterface::SafeDownCast(@)",
    header: "vtkYoungsMaterialInterface.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkYoungsMaterialInterface :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMultiBlockDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkYoungsMaterialInterface :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkYoungsMaterialInterface :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkYoungsMaterialInterface; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkYoungsMaterialInterface.h".}
proc SetInverseNormal*(this: var vtkYoungsMaterialInterface; _arg: vtkTypeBool) {.
    importcpp: "SetInverseNormal", header: "vtkYoungsMaterialInterface.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetInverseNormal ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InverseNormal  of  << this -> InverseNormal ) ; return this -> InverseNormal ; } ;
## Error: expected ';'!!!

proc InverseNormalOn*(this: var vtkYoungsMaterialInterface) {.
    importcpp: "InverseNormalOn", header: "vtkYoungsMaterialInterface.h".}
proc InverseNormalOff*(this: var vtkYoungsMaterialInterface) {.
    importcpp: "InverseNormalOff", header: "vtkYoungsMaterialInterface.h".}
  ## /@}
  ## /@{
  ## *
  ##  If this flag is on, material order in reversed.
  ##  Otherwise, materials are sorted in ascending order depending on the given ordering array.
  ##
proc SetInverseNormalReverseMaterialOrder*(this: var vtkYoungsMaterialInterface;
    _arg: vtkTypeBool) {.importcpp: "SetInverseNormalReverseMaterialOrder",
                       header: "vtkYoungsMaterialInterface.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetInverseNormalReverseMaterialOrder ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReverseMaterialOrder  of  << this -> ReverseMaterialOrder ) ; return this -> ReverseMaterialOrder ; } ;
## Error: expected ';'!!!

proc ReverseMaterialOrderOn*(this: var vtkYoungsMaterialInterface) {.
    importcpp: "ReverseMaterialOrderOn", header: "vtkYoungsMaterialInterface.h".}
proc ReverseMaterialOrderOff*(this: var vtkYoungsMaterialInterface) {.
    importcpp: "ReverseMaterialOrderOff", header: "vtkYoungsMaterialInterface.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get OnionPeel flag. if this flag is on, the normal vector of the first
  ##  material (which depends on material ordering) is used for all materials.
  ##
proc SetInverseNormalReverseMaterialOrderOnionPeel*(
    this: var vtkYoungsMaterialInterface; _arg: vtkTypeBool) {.
    importcpp: "SetInverseNormalReverseMaterialOrderOnionPeel",
    header: "vtkYoungsMaterialInterface.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetInverseNormalReverseMaterialOrderOnionPeel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OnionPeel  of  << this -> OnionPeel ) ; return this -> OnionPeel ; } ;
## Error: expected ';'!!!

proc OnionPeelOn*(this: var vtkYoungsMaterialInterface) {.importcpp: "OnionPeelOn",
    header: "vtkYoungsMaterialInterface.h".}
proc OnionPeelOff*(this: var vtkYoungsMaterialInterface) {.
    importcpp: "OnionPeelOff", header: "vtkYoungsMaterialInterface.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turns on/off AxisSymetric computation of 2D interfaces.
  ##  in axis symmetric mode, 2D meshes are understood as volumes of revolution.
  ##
proc SetInverseNormalReverseMaterialOrderOnionPeelAxisSymetric*(
    this: var vtkYoungsMaterialInterface; _arg: vtkTypeBool) {.
    importcpp: "SetInverseNormalReverseMaterialOrderOnionPeelAxisSymetric",
    header: "vtkYoungsMaterialInterface.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetInverseNormalReverseMaterialOrderOnionPeelAxisSymetric ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AxisSymetric  of  << this -> AxisSymetric ) ; return this -> AxisSymetric ; } ;
## Error: expected ';'!!!

proc AxisSymetricOn*(this: var vtkYoungsMaterialInterface) {.
    importcpp: "AxisSymetricOn", header: "vtkYoungsMaterialInterface.h".}
proc AxisSymetricOff*(this: var vtkYoungsMaterialInterface) {.
    importcpp: "AxisSymetricOff", header: "vtkYoungsMaterialInterface.h".}
  ## /@}
  ## /@{
  ## *
  ##  when UseFractionAsDistance is true, the volume fraction is interpreted as the distance
  ##  of the cutting plane from the origin.
  ##  in axis symmetric mode, 2D meshes are understood as volumes of revolution.
  ##
proc SetInverseNormalReverseMaterialOrderOnionPeelAxisSymetricUseFractionAsDistance*(
    this: var vtkYoungsMaterialInterface; _arg: vtkTypeBool) {.importcpp: "SetInverseNormalReverseMaterialOrderOnionPeelAxisSymetricUseFractionAsDistance",
    header: "vtkYoungsMaterialInterface.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetInverseNormalReverseMaterialOrderOnionPeelAxisSymetricUseFractionAsDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseFractionAsDistance  of  << this -> UseFractionAsDistance ) ; return this -> UseFractionAsDistance ; } ;
## Error: expected ';'!!!

proc UseFractionAsDistanceOn*(this: var vtkYoungsMaterialInterface) {.
    importcpp: "UseFractionAsDistanceOn", header: "vtkYoungsMaterialInterface.h".}
proc UseFractionAsDistanceOff*(this: var vtkYoungsMaterialInterface) {.
    importcpp: "UseFractionAsDistanceOff", header: "vtkYoungsMaterialInterface.h".}
  ## /@}
  ## /@{
  ## *
  ##  When FillMaterial is set to 1, the volume containing material is output and not only the
  ##  interface surface.
  ##
proc SetInverseNormalReverseMaterialOrderOnionPeelAxisSymetricUseFractionAsDistanceFillMaterial*(
    this: var vtkYoungsMaterialInterface; _arg: vtkTypeBool) {.importcpp: "SetInverseNormalReverseMaterialOrderOnionPeelAxisSymetricUseFractionAsDistanceFillMaterial",
    header: "vtkYoungsMaterialInterface.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetInverseNormalReverseMaterialOrderOnionPeelAxisSymetricUseFractionAsDistanceFillMaterial ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FillMaterial  of  << this -> FillMaterial ) ; return this -> FillMaterial ; } ;
## Error: expected ';'!!!

proc FillMaterialOn*(this: var vtkYoungsMaterialInterface) {.
    importcpp: "FillMaterialOn", header: "vtkYoungsMaterialInterface.h".}
proc FillMaterialOff*(this: var vtkYoungsMaterialInterface) {.
    importcpp: "FillMaterialOff", header: "vtkYoungsMaterialInterface.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get minimum and maximum volume fraction value. if a material fills a volume above the
  ##  minimum value, the material is considered to be void. if a material fills a volume fraction
  ##  beyond the maximum value it is considered as filling the whole volume.
  ##
proc SetVolumeFractionRange*(this: var vtkYoungsMaterialInterface; _arg1: cdouble;
                            _arg2: cdouble) {.importcpp: "SetVolumeFractionRange",
    header: "vtkYoungsMaterialInterface.h".}
proc SetVolumeFractionRange*(this: var vtkYoungsMaterialInterface;
                            _arg: array[2, cdouble]) {.
    importcpp: "SetVolumeFractionRange", header: "vtkYoungsMaterialInterface.h".}
## !!!Ignored construct:  virtual double * GetVolumeFractionRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << VolumeFractionRange  pointer  << this -> VolumeFractionRange ) ; return this -> VolumeFractionRange ; } VTK_WRAPEXCLUDE virtual void GetVolumeFractionRange ( double data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> VolumeFractionRange [ i ] ; } } ;
## Error: expected ';'!!!

proc SetNumberOfMaterials*(this: var vtkYoungsMaterialInterface; n: cint) {.
    importcpp: "SetNumberOfMaterials", header: "vtkYoungsMaterialInterface.h".}
proc GetNumberOfMaterials*(this: var vtkYoungsMaterialInterface): cint {.
    importcpp: "GetNumberOfMaterials", header: "vtkYoungsMaterialInterface.h".}
proc SetInverseNormalReverseMaterialOrderOnionPeelAxisSymetricUseFractionAsDistanceFillMaterialUseAllBlocks*(
    this: var vtkYoungsMaterialInterface; _arg: bool) {.importcpp: "SetInverseNormalReverseMaterialOrderOnionPeelAxisSymetricUseFractionAsDistanceFillMaterialUseAllBlocks",
    header: "vtkYoungsMaterialInterface.h".}
## !!!Ignored construct:  virtual bool GetInverseNormalReverseMaterialOrderOnionPeelAxisSymetricUseFractionAsDistanceFillMaterialUseAllBlocks ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseAllBlocks  of  << this -> UseAllBlocks ) ; return this -> UseAllBlocks ; } ;
## Error: expected ';'!!!

proc UseAllBlocksOn*(this: var vtkYoungsMaterialInterface) {.
    importcpp: "UseAllBlocksOn", header: "vtkYoungsMaterialInterface.h".}
proc UseAllBlocksOff*(this: var vtkYoungsMaterialInterface) {.
    importcpp: "UseAllBlocksOff", header: "vtkYoungsMaterialInterface.h".}
  ## /@}
  ## /@{
  ## *
  ##  Only meaningful for LOVE software. returns the maximum number of blocks containing the same
  ##  material
  ##
## !!!Ignored construct:  virtual int GetInverseNormalReverseMaterialOrderOnionPeelAxisSymetricUseFractionAsDistanceFillMaterialUseAllBlocksNumberOfDomains ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfDomains  of  << this -> NumberOfDomains ) ; return this -> NumberOfDomains ; } ;
## Error: expected ';'!!!

proc SetMaterialArrays*(this: var vtkYoungsMaterialInterface; i: cint;
                       volume: cstring; normalX: cstring; normalY: cstring;
                       normalZ: cstring; ordering: cstring) {.
    importcpp: "SetMaterialArrays", header: "vtkYoungsMaterialInterface.h".}
proc SetMaterialArrays*(this: var vtkYoungsMaterialInterface; i: cint;
                       volume: cstring; normal: cstring; ordering: cstring) {.
    importcpp: "SetMaterialArrays", header: "vtkYoungsMaterialInterface.h".}
proc SetMaterialVolumeFractionArray*(this: var vtkYoungsMaterialInterface; i: cint;
                                    volume: cstring) {.
    importcpp: "SetMaterialVolumeFractionArray",
    header: "vtkYoungsMaterialInterface.h".}
proc SetMaterialNormalArray*(this: var vtkYoungsMaterialInterface; i: cint;
                            normal: cstring) {.
    importcpp: "SetMaterialNormalArray", header: "vtkYoungsMaterialInterface.h".}
proc SetMaterialOrderingArray*(this: var vtkYoungsMaterialInterface; i: cint;
                              ordering: cstring) {.
    importcpp: "SetMaterialOrderingArray", header: "vtkYoungsMaterialInterface.h".}
proc RemoveAllMaterials*(this: var vtkYoungsMaterialInterface) {.
    importcpp: "RemoveAllMaterials", header: "vtkYoungsMaterialInterface.h".}
proc SetMaterialNormalArray*(this: var vtkYoungsMaterialInterface; volume: cstring;
                            normal: cstring) {.
    importcpp: "SetMaterialNormalArray", header: "vtkYoungsMaterialInterface.h".}
proc SetMaterialOrderingArray*(this: var vtkYoungsMaterialInterface;
                              volume: cstring; ordering: cstring) {.
    importcpp: "SetMaterialOrderingArray", header: "vtkYoungsMaterialInterface.h".}
proc RemoveAllMaterialBlockMappings*(this: var vtkYoungsMaterialInterface) {.
    importcpp: "RemoveAllMaterialBlockMappings",
    header: "vtkYoungsMaterialInterface.h".}
proc AddMaterialBlockMapping*(this: var vtkYoungsMaterialInterface; b: cint) {.
    importcpp: "AddMaterialBlockMapping", header: "vtkYoungsMaterialInterface.h".}
const
  vtkYoungsMaterialInterfaceMAX_CELL_POINTS* = 256
