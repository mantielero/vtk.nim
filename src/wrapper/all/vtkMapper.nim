## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMapper.h
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
##  @class   vtkMapper
##  @brief   abstract class specifies interface to map data to graphics primitives
##
##  vtkMapper is an abstract class to specify interface between data and
##  graphics primitives. Subclasses of vtkMapper map data through a
##  lookuptable and control the creation of rendering primitives that
##  interface to the graphics library. The mapping can be controlled by
##  supplying a lookup table and specifying a scalar range to map data
##  through.
##
##  There are several important control mechanisms affecting the behavior of
##  this object. The ScalarVisibility flag controls whether scalar data (if
##  any) controls the color of the associated actor(s) that refer to the
##  mapper. The ScalarMode ivar is used to determine whether scalar point data
##  or cell data is used to color the object. By default, point data scalars
##  are used unless there are none, in which cell scalars are used. Or you can
##  explicitly control whether to use point or cell scalar data. Finally, the
##  mapping of scalars through the lookup table varies depending on the
##  setting of the ColorMode flag. See the documentation for the appropriate
##  methods for an explanation.
##
##  Another important feature of the mapper is the ability to shift the
##  z-buffer to resolve coincident topology. For example, if you'd like to
##  draw a mesh with some edges a different color, and the edges lie on the
##  mesh, this feature can be useful to get nice looking lines. (See the
##  ResolveCoincidentTopology-related methods.)
##
##  @sa
##  vtkDataSetMapper vtkPolyDataMapper
##

import
  vtkAbstractMapper3D, vtkRenderingCoreModule, vtkSmartPointer, vtkSystemIncludes

const
  VTK_RESOLVE_OFF* = 0
  VTK_RESOLVE_POLYGON_OFFSET* = 1
  VTK_RESOLVE_SHIFT_ZBUFFER* = 2
  VTK_GET_ARRAY_BY_ID* = 0
  VTK_GET_ARRAY_BY_NAME* = 1
  VTK_MATERIALMODE_DEFAULT* = 0
  VTK_MATERIALMODE_AMBIENT* = 1
  VTK_MATERIALMODE_DIFFUSE* = 2
  VTK_MATERIALMODE_AMBIENT_AND_DIFFUSE* = 3

discard "forward decl of vtkActor"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkDataObject"
discard "forward decl of vtkFloatArray"
discard "forward decl of vtkHardwareSelector"
discard "forward decl of vtkImageData"
discard "forward decl of vtkProp"
discard "forward decl of vtkRenderer"
discard "forward decl of vtkScalarsToColors"
discard "forward decl of vtkSelection"
discard "forward decl of vtkUnsignedCharArray"
discard "forward decl of vtkWindow"
type
  vtkMapper* {.importcpp: "vtkMapper", header: "vtkMapper.h", bycopy.} = object of vtkAbstractMapper3D
    vtkMapper* {.importc: "vtkMapper".}: VTK_NEWINSTANCE
    ##  Use texture coordinates for coloring.
    ##  Coordinate for each point.
    ##  1D ColorMap used for the texture image.
    ##  for coloring by a component of a field data array
    ##  If coloring by field data, which tuple to use to color the entire
    ##  data set. If -1, treat array values as cell data.

  vtkMapperSuperclass* = vtkAbstractMapper3D

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkMapper::IsTypeOf(@)",
    header: "vtkMapper.h".}
proc IsA*(this: var vtkMapper; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkMapper.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMapper {.
    importcpp: "vtkMapper::SafeDownCast(@)", header: "vtkMapper.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMapper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractMapper3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMapper :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkMapper; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkMapper.h".}
proc ShallowCopy*(this: var vtkMapper; m: ptr vtkAbstractMapper) {.
    importcpp: "ShallowCopy", header: "vtkMapper.h".}
proc GetMTime*(this: var vtkMapper): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkMapper.h".}
proc Render*(this: var vtkMapper; ren: ptr vtkRenderer; a: ptr vtkActor) {.
    importcpp: "Render", header: "vtkMapper.h".}
proc ReleaseGraphicsResources*(this: var vtkMapper; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkMapper.h".}
proc SetLookupTable*(this: var vtkMapper; lut: ptr vtkScalarsToColors) {.
    importcpp: "SetLookupTable", header: "vtkMapper.h".}
proc GetLookupTable*(this: var vtkMapper): ptr vtkScalarsToColors {.
    importcpp: "GetLookupTable", header: "vtkMapper.h".}
proc CreateDefaultLookupTable*(this: var vtkMapper) {.
    importcpp: "CreateDefaultLookupTable", header: "vtkMapper.h".}
proc SetScalarVisibility*(this: var vtkMapper; _arg: vtkTypeBool) {.
    importcpp: "SetScalarVisibility", header: "vtkMapper.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetScalarVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarVisibility  of  << this -> ScalarVisibility ) ; return this -> ScalarVisibility ; } ;
## Error: expected ';'!!!

proc ScalarVisibilityOn*(this: var vtkMapper) {.importcpp: "ScalarVisibilityOn",
    header: "vtkMapper.h".}
proc ScalarVisibilityOff*(this: var vtkMapper) {.importcpp: "ScalarVisibilityOff",
    header: "vtkMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off flag to control whether the mapper's data is static. Static data
  ##  means that the mapper does not propagate updates down the pipeline, greatly
  ##  decreasing the time it takes to update many mappers. This should only be
  ##  used if the data never changes.
  ##
proc SetScalarVisibilityStatic*(this: var vtkMapper; _arg: vtkTypeBool) {.
    importcpp: "SetScalarVisibilityStatic", header: "vtkMapper.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetScalarVisibilityStatic ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Static  of  << this -> Static ) ; return this -> Static ; } ;
## Error: expected ';'!!!

proc StaticOn*(this: var vtkMapper) {.importcpp: "StaticOn", header: "vtkMapper.h".}
proc StaticOff*(this: var vtkMapper) {.importcpp: "StaticOff", header: "vtkMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  default (ColorModeToDefault), unsigned char scalars are treated
  ##  as colors, and NOT mapped through the lookup table, while
  ##  everything else is.  ColorModeToDirectScalar extends
  ##  ColorModeToDefault such that all integer types are treated as
  ##  colors with values in the range 0-255 and floating types are
  ##  treated as colors with values in the range 0.0-1.0.  Setting
  ##  ColorModeToMapScalars means that all scalar data will be mapped
  ##  through the lookup table.  (Note that for multi-component
  ##  scalars, the particular component to use for mapping can be
  ##  specified using the SelectColorArray() method.)
  ##
proc SetScalarVisibilityStaticColorMode*(this: var vtkMapper; _arg: cint) {.
    importcpp: "SetScalarVisibilityStaticColorMode", header: "vtkMapper.h".}
## !!!Ignored construct:  virtual int GetScalarVisibilityStaticColorMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ColorMode  of  << this -> ColorMode ) ; return this -> ColorMode ; } ;
## Error: expected ';'!!!

proc SetColorModeToDefault*(this: var vtkMapper) {.
    importcpp: "SetColorModeToDefault", header: "vtkMapper.h".}
proc SetColorModeToMapScalars*(this: var vtkMapper) {.
    importcpp: "SetColorModeToMapScalars", header: "vtkMapper.h".}
proc SetColorModeToDirectScalars*(this: var vtkMapper) {.
    importcpp: "SetColorModeToDirectScalars", header: "vtkMapper.h".}
proc GetColorModeAsString*(this: var vtkMapper): cstring {.
    importcpp: "GetColorModeAsString", header: "vtkMapper.h".}
proc SetScalarVisibilityStaticColorModeInterpolateScalarsBeforeMapping*(
    this: var vtkMapper; _arg: vtkTypeBool) {.importcpp: "SetScalarVisibilityStaticColorModeInterpolateScalarsBeforeMapping",
    header: "vtkMapper.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetScalarVisibilityStaticColorModeInterpolateScalarsBeforeMapping ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InterpolateScalarsBeforeMapping  of  << this -> InterpolateScalarsBeforeMapping ) ; return this -> InterpolateScalarsBeforeMapping ; } ;
## Error: expected ';'!!!

proc InterpolateScalarsBeforeMappingOn*(this: var vtkMapper) {.
    importcpp: "InterpolateScalarsBeforeMappingOn", header: "vtkMapper.h".}
proc InterpolateScalarsBeforeMappingOff*(this: var vtkMapper) {.
    importcpp: "InterpolateScalarsBeforeMappingOff", header: "vtkMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  Control whether the mapper sets the lookuptable range based on its
  ##  own ScalarRange, or whether it will use the LookupTable ScalarRange
  ##  regardless of it's own setting. By default the Mapper is allowed to set
  ##  the LookupTable range, but users who are sharing LookupTables between
  ##  mappers/actors will probably wish to force the mapper to use the
  ##  LookupTable unchanged.
  ##
proc SetScalarVisibilityStaticColorModeInterpolateScalarsBeforeMappingUseLookupTableScalarRange*(
    this: var vtkMapper; _arg: vtkTypeBool) {.importcpp: "SetScalarVisibilityStaticColorModeInterpolateScalarsBeforeMappingUseLookupTableScalarRange",
    header: "vtkMapper.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetScalarVisibilityStaticColorModeInterpolateScalarsBeforeMappingUseLookupTableScalarRange ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseLookupTableScalarRange  of  << this -> UseLookupTableScalarRange ) ; return this -> UseLookupTableScalarRange ; } ;
## Error: expected ';'!!!

proc UseLookupTableScalarRangeOn*(this: var vtkMapper) {.
    importcpp: "UseLookupTableScalarRangeOn", header: "vtkMapper.h".}
proc UseLookupTableScalarRangeOff*(this: var vtkMapper) {.
    importcpp: "UseLookupTableScalarRangeOff", header: "vtkMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify range in terms of scalar minimum and maximum (smin,smax). These
  ##  values are used to map scalars into lookup table. Has no effect when
  ##  UseLookupTableScalarRange is true.
  ##
proc SetScalarRange*(this: var vtkMapper; _arg1: cdouble; _arg2: cdouble) {.
    importcpp: "SetScalarRange", header: "vtkMapper.h".}
proc SetScalarRange*(this: var vtkMapper; _arg: array[2, cdouble]) {.
    importcpp: "SetScalarRange", header: "vtkMapper.h".}
## !!!Ignored construct:  virtual double * GetScalarRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarRange  pointer  << this -> ScalarRange ) ; return this -> ScalarRange ; } VTK_WRAPEXCLUDE virtual void GetScalarRange ( double data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> ScalarRange [ i ] ; } } ;
## Error: expected ';'!!!

proc SetScalarVisibilityStaticColorModeInterpolateScalarsBeforeMappingUseLookupTableScalarRangeScalarMode*(
    this: var vtkMapper; _arg: cint) {.importcpp: "SetScalarVisibilityStaticColorModeInterpolateScalarsBeforeMappingUseLookupTableScalarRangeScalarMode",
                                  header: "vtkMapper.h".}
## !!!Ignored construct:  virtual int GetScalarVisibilityStaticColorModeInterpolateScalarsBeforeMappingUseLookupTableScalarRangeScalarMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarMode  of  << this -> ScalarMode ) ; return this -> ScalarMode ; } ;
## Error: expected ';'!!!

proc SetScalarModeToDefault*(this: var vtkMapper) {.
    importcpp: "SetScalarModeToDefault", header: "vtkMapper.h".}
proc SetScalarModeToUsePointData*(this: var vtkMapper) {.
    importcpp: "SetScalarModeToUsePointData", header: "vtkMapper.h".}
proc SetScalarModeToUseCellData*(this: var vtkMapper) {.
    importcpp: "SetScalarModeToUseCellData", header: "vtkMapper.h".}
proc SetScalarModeToUsePointFieldData*(this: var vtkMapper) {.
    importcpp: "SetScalarModeToUsePointFieldData", header: "vtkMapper.h".}
proc SetScalarModeToUseCellFieldData*(this: var vtkMapper) {.
    importcpp: "SetScalarModeToUseCellFieldData", header: "vtkMapper.h".}
proc SetScalarModeToUseFieldData*(this: var vtkMapper) {.
    importcpp: "SetScalarModeToUseFieldData", header: "vtkMapper.h".}
proc SelectColorArray*(this: var vtkMapper; arrayNum: cint) {.
    importcpp: "SelectColorArray", header: "vtkMapper.h".}
proc SelectColorArray*(this: var vtkMapper; arrayName: cstring) {.
    importcpp: "SelectColorArray", header: "vtkMapper.h".}
proc SetScalarVisibilityStaticColorModeInterpolateScalarsBeforeMappingUseLookupTableScalarRangeScalarModeFieldDataTupleId*(
    this: var vtkMapper; _arg: vtkIdType) {.importcpp: "SetScalarVisibilityStaticColorModeInterpolateScalarsBeforeMappingUseLookupTableScalarRangeScalarModeFieldDataTupleId",
                                       header: "vtkMapper.h".}
## !!!Ignored construct:  virtual vtkIdType GetScalarVisibilityStaticColorModeInterpolateScalarsBeforeMappingUseLookupTableScalarRangeScalarModeFieldDataTupleId ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FieldDataTupleId  of  << this -> FieldDataTupleId ) ; return this -> FieldDataTupleId ; } ;
## Error: expected ';'!!!

proc ColorByArrayComponent*(this: var vtkMapper; arrayNum: cint; component: cint) {.
    importcpp: "ColorByArrayComponent", header: "vtkMapper.h".}
proc ColorByArrayComponent*(this: var vtkMapper; arrayName: cstring; component: cint) {.
    importcpp: "ColorByArrayComponent", header: "vtkMapper.h".}
proc GetArrayName*(this: var vtkMapper): cstring {.importcpp: "GetArrayName",
    header: "vtkMapper.h".}
proc SetArrayName*(this: var vtkMapper; _arg: cstring) {.importcpp: "SetArrayName",
    header: "vtkMapper.h".}
## !!!Ignored construct:  virtual int GetScalarVisibilityStaticColorModeInterpolateScalarsBeforeMappingUseLookupTableScalarRangeScalarModeFieldDataTupleIdArrayId ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ArrayId  of  << this -> ArrayId ) ; return this -> ArrayId ; } ;
## Error: expected ';'!!!

proc SetScalarVisibilityStaticColorModeInterpolateScalarsBeforeMappingUseLookupTableScalarRangeScalarModeFieldDataTupleIdArrayId*(
    this: var vtkMapper; _arg: cint) {.importcpp: "SetScalarVisibilityStaticColorModeInterpolateScalarsBeforeMappingUseLookupTableScalarRangeScalarModeFieldDataTupleIdArrayId",
                                  header: "vtkMapper.h".}
## !!!Ignored construct:  virtual int GetScalarVisibilityStaticColorModeInterpolateScalarsBeforeMappingUseLookupTableScalarRangeScalarModeFieldDataTupleIdArrayIdArrayAccessMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ArrayAccessMode  of  << this -> ArrayAccessMode ) ; return this -> ArrayAccessMode ; } ;
## Error: expected ';'!!!

proc SetScalarVisibilityStaticColorModeInterpolateScalarsBeforeMappingUseLookupTableScalarRangeScalarModeFieldDataTupleIdArrayIdArrayAccessMode*(
    this: var vtkMapper; _arg: cint) {.importcpp: "SetScalarVisibilityStaticColorModeInterpolateScalarsBeforeMappingUseLookupTableScalarRangeScalarModeFieldDataTupleIdArrayIdArrayAccessMode",
                                  header: "vtkMapper.h".}
## !!!Ignored construct:  virtual int GetScalarVisibilityStaticColorModeInterpolateScalarsBeforeMappingUseLookupTableScalarRangeScalarModeFieldDataTupleIdArrayIdArrayAccessModeArrayComponent ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ArrayComponent  of  << this -> ArrayComponent ) ; return this -> ArrayComponent ; } ;
## Error: expected ';'!!!

proc SetScalarVisibilityStaticColorModeInterpolateScalarsBeforeMappingUseLookupTableScalarRangeScalarModeFieldDataTupleIdArrayIdArrayAccessModeArrayComponent*(
    this: var vtkMapper; _arg: cint) {.importcpp: "SetScalarVisibilityStaticColorModeInterpolateScalarsBeforeMappingUseLookupTableScalarRangeScalarModeFieldDataTupleIdArrayIdArrayAccessModeArrayComponent",
                                  header: "vtkMapper.h".}
  ## *
  ##  Return the method for obtaining scalar data.
  ##
proc GetScalarModeAsString*(this: var vtkMapper): cstring {.
    importcpp: "GetScalarModeAsString", header: "vtkMapper.h".}
proc SetResolveCoincidentTopology*(val: cint) {.
    importcpp: "vtkMapper::SetResolveCoincidentTopology(@)", header: "vtkMapper.h".}
proc GetResolveCoincidentTopology*(): cint {.
    importcpp: "vtkMapper::GetResolveCoincidentTopology(@)", header: "vtkMapper.h".}
proc SetResolveCoincidentTopologyToDefault*() {.
    importcpp: "vtkMapper::SetResolveCoincidentTopologyToDefault(@)",
    header: "vtkMapper.h".}
proc SetResolveCoincidentTopologyToOff*() {.
    importcpp: "vtkMapper::SetResolveCoincidentTopologyToOff(@)",
    header: "vtkMapper.h".}
proc SetResolveCoincidentTopologyToPolygonOffset*() {.
    importcpp: "vtkMapper::SetResolveCoincidentTopologyToPolygonOffset(@)",
    header: "vtkMapper.h".}
proc SetResolveCoincidentTopologyToShiftZBuffer*() {.
    importcpp: "vtkMapper::SetResolveCoincidentTopologyToShiftZBuffer(@)",
    header: "vtkMapper.h".}
proc SetResolveCoincidentTopologyPolygonOffsetParameters*(factor: cdouble;
    units: cdouble) {.importcpp: "vtkMapper::SetResolveCoincidentTopologyPolygonOffsetParameters(@)",
                    header: "vtkMapper.h".}
proc GetResolveCoincidentTopologyPolygonOffsetParameters*(factor: var cdouble;
    units: var cdouble) {.importcpp: "vtkMapper::GetResolveCoincidentTopologyPolygonOffsetParameters(@)",
                       header: "vtkMapper.h".}
proc SetRelativeCoincidentTopologyPolygonOffsetParameters*(this: var vtkMapper;
    factor: cdouble; units: cdouble) {.importcpp: "SetRelativeCoincidentTopologyPolygonOffsetParameters",
                                   header: "vtkMapper.h".}
proc GetRelativeCoincidentTopologyPolygonOffsetParameters*(this: var vtkMapper;
    factor: var cdouble; units: var cdouble) {.
    importcpp: "GetRelativeCoincidentTopologyPolygonOffsetParameters",
    header: "vtkMapper.h".}
proc SetResolveCoincidentTopologyLineOffsetParameters*(factor: cdouble;
    units: cdouble) {.importcpp: "vtkMapper::SetResolveCoincidentTopologyLineOffsetParameters(@)",
                    header: "vtkMapper.h".}
proc GetResolveCoincidentTopologyLineOffsetParameters*(factor: var cdouble;
    units: var cdouble) {.importcpp: "vtkMapper::GetResolveCoincidentTopologyLineOffsetParameters(@)",
                       header: "vtkMapper.h".}
proc SetRelativeCoincidentTopologyLineOffsetParameters*(this: var vtkMapper;
    factor: cdouble; units: cdouble) {.importcpp: "SetRelativeCoincidentTopologyLineOffsetParameters",
                                   header: "vtkMapper.h".}
proc GetRelativeCoincidentTopologyLineOffsetParameters*(this: var vtkMapper;
    factor: var cdouble; units: var cdouble) {.
    importcpp: "GetRelativeCoincidentTopologyLineOffsetParameters",
    header: "vtkMapper.h".}
proc SetResolveCoincidentTopologyPointOffsetParameter*(units: cdouble) {.importcpp: "vtkMapper::SetResolveCoincidentTopologyPointOffsetParameter(@)",
    header: "vtkMapper.h".}
proc GetResolveCoincidentTopologyPointOffsetParameter*(units: var cdouble) {.importcpp: "vtkMapper::GetResolveCoincidentTopologyPointOffsetParameter(@)",
    header: "vtkMapper.h".}
proc SetRelativeCoincidentTopologyPointOffsetParameter*(this: var vtkMapper;
    units: cdouble) {.importcpp: "SetRelativeCoincidentTopologyPointOffsetParameter",
                    header: "vtkMapper.h".}
proc GetRelativeCoincidentTopologyPointOffsetParameter*(this: var vtkMapper;
    units: var cdouble) {.importcpp: "GetRelativeCoincidentTopologyPointOffsetParameter",
                       header: "vtkMapper.h".}
proc GetCoincidentTopologyPolygonOffsetParameters*(this: var vtkMapper;
    factor: var cdouble; units: var cdouble) {.
    importcpp: "GetCoincidentTopologyPolygonOffsetParameters",
    header: "vtkMapper.h".}
proc GetCoincidentTopologyLineOffsetParameters*(this: var vtkMapper;
    factor: var cdouble; units: var cdouble) {.
    importcpp: "GetCoincidentTopologyLineOffsetParameters", header: "vtkMapper.h".}
proc GetCoincidentTopologyPointOffsetParameter*(this: var vtkMapper;
    units: var cdouble) {.importcpp: "GetCoincidentTopologyPointOffsetParameter",
                       header: "vtkMapper.h".}
proc SetResolveCoincidentTopologyPolygonOffsetFaces*(faces: cint) {.
    importcpp: "vtkMapper::SetResolveCoincidentTopologyPolygonOffsetFaces(@)",
    header: "vtkMapper.h".}
proc GetResolveCoincidentTopologyPolygonOffsetFaces*(): cint {.
    importcpp: "vtkMapper::GetResolveCoincidentTopologyPolygonOffsetFaces(@)",
    header: "vtkMapper.h".}
proc SetResolveCoincidentTopologyZShift*(val: cdouble) {.
    importcpp: "vtkMapper::SetResolveCoincidentTopologyZShift(@)",
    header: "vtkMapper.h".}
proc GetResolveCoincidentTopologyZShift*(): cdouble {.
    importcpp: "vtkMapper::GetResolveCoincidentTopologyZShift(@)",
    header: "vtkMapper.h".}
## !!!Ignored construct:  /@} *
##  Return bounding box (array of six doubles) of data expressed as
##  (xmin,xmax, ymin,ymax, zmin,zmax).
##  double * GetBounds ( ) VTK_SIZEHINT ( 6 ) override ;
## Error: expected ';'!!!

proc GetBounds*(this: var vtkMapper; bounds: array[6, cdouble]) {.
    importcpp: "GetBounds", header: "vtkMapper.h".}
proc SetRenderTime*(this: var vtkMapper; time: cdouble) {.importcpp: "SetRenderTime",
    header: "vtkMapper.h".}
## !!!Ignored construct:  virtual double GetScalarVisibilityStaticColorModeInterpolateScalarsBeforeMappingUseLookupTableScalarRangeScalarModeFieldDataTupleIdArrayIdArrayAccessModeArrayComponentRenderTime ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RenderTime  of  << this -> RenderTime ) ; return this -> RenderTime ; } ;
## Error: expected ';'!!!

proc GetInput*(this: var vtkMapper): ptr vtkDataSet {.importcpp: "GetInput",
    header: "vtkMapper.h".}
proc GetInputAsDataSet*(this: var vtkMapper): ptr vtkDataSet {.
    importcpp: "GetInputAsDataSet", header: "vtkMapper.h".}
proc MapScalars*(this: var vtkMapper; alpha: cdouble): ptr vtkUnsignedCharArray {.
    importcpp: "MapScalars", header: "vtkMapper.h".}
proc MapScalars*(this: var vtkMapper; alpha: cdouble; cellFlag: var cint): ptr vtkUnsignedCharArray {.
    importcpp: "MapScalars", header: "vtkMapper.h".}
proc MapScalars*(this: var vtkMapper; input: ptr vtkDataSet; alpha: cdouble): ptr vtkUnsignedCharArray {.
    importcpp: "MapScalars", header: "vtkMapper.h".}
proc MapScalars*(this: var vtkMapper; input: ptr vtkDataSet; alpha: cdouble;
                cellFlag: var cint): ptr vtkUnsignedCharArray {.
    importcpp: "MapScalars", header: "vtkMapper.h".}
proc HasOpaqueGeometry*(this: var vtkMapper): bool {.importcpp: "HasOpaqueGeometry",
    header: "vtkMapper.h".}
proc HasTranslucentPolygonalGeometry*(this: var vtkMapper): bool {.
    importcpp: "HasTranslucentPolygonalGeometry", header: "vtkMapper.h".}
proc GetSupportsSelection*(this: var vtkMapper): bool {.
    importcpp: "GetSupportsSelection", header: "vtkMapper.h".}
proc ProcessSelectorPixelBuffers*(this: var vtkMapper; a2: ptr vtkHardwareSelector; ##  sel
                                 a3: var vector[cuint]; ##  pixeloffsets
                                 a4: ptr vtkProp) {.
    importcpp: "ProcessSelectorPixelBuffers", header: "vtkMapper.h".}
  ##  prop
proc CanUseTextureMapForColoring*(this: var vtkMapper; input: ptr vtkDataObject): cint {.
    importcpp: "CanUseTextureMapForColoring", header: "vtkMapper.h".}
proc ClearColorArrays*(this: var vtkMapper) {.importcpp: "ClearColorArrays",
    header: "vtkMapper.h".}
proc GetColorMapColors*(this: var vtkMapper): ptr vtkUnsignedCharArray {.
    importcpp: "GetColorMapColors", header: "vtkMapper.h".}
proc GetColorCoordinates*(this: var vtkMapper): ptr vtkFloatArray {.
    importcpp: "GetColorCoordinates", header: "vtkMapper.h".}
proc GetColorTextureMap*(this: var vtkMapper): ptr vtkImageData {.
    importcpp: "GetColorTextureMap", header: "vtkMapper.h".}
proc GetnameSelection*(this: var vtkMapper): ptr vtkSelection {.
    importcpp: "GetnameSelection", header: "vtkMapper.h".}
proc SetSelection*(this: var vtkMapper; a2: ptr vtkSelection) {.
    importcpp: "SetSelection", header: "vtkMapper.h".}