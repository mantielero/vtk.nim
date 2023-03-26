## =========================================================================
##
##   Program:   Visualization Toolkit
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
##  @class   vtkOpenGLPolyDataMapper
##  @brief   PolyDataMapper using OpenGL to render.
##
##  PolyDataMapper that uses a OpenGL to do the actual rendering.
##

import
  vtkInformation, vtkNew, vtkOpenGLHelper, vtkPolyDataMapper,
  vtkRenderingOpenGL2Module, vtkShader, vtkStateStorage

discard "forward decl of vtkCellArray"
discard "forward decl of vtkGenericOpenGLResourceFreeCallback"
discard "forward decl of vtkMatrix4x4"
discard "forward decl of vtkMatrix3x3"
discard "forward decl of vtkOpenGLCellToVTKCellMap"
discard "forward decl of vtkOpenGLRenderTimer"
discard "forward decl of vtkOpenGLTexture"
discard "forward decl of vtkOpenGLBufferObject"
discard "forward decl of vtkOpenGLVertexBufferObject"
discard "forward decl of vtkOpenGLVertexBufferObjectGroup"
discard "forward decl of vtkPoints"
discard "forward decl of vtkTexture"
discard "forward decl of vtkTextureObject"
discard "forward decl of vtkTransform"
discard "forward decl of vtkOpenGLShaderProperty"
type
  vtkOpenGLPolyDataMapper* {.importcpp: "vtkOpenGLPolyDataMapper",
                            header: "vtkOpenGLPolyDataMapper.h", bycopy.} = object of vtkPolyDataMapper
    vtkOpenGLPolyDataMapper* {.importc: "vtkOpenGLPolyDataMapper".}: VTK_NEWINSTANCE
    CurrentInput* {.importc: "CurrentInput".}: ptr vtkPolyData ## /@{
                                                          ## *
                                                          ##  By default, this class uses the dataset's point and cell ids during
                                                          ##  rendering. However, one can override those by specifying cell and point
                                                          ##  data arrays to use instead. Currently, only vtkIdType array is supported.
                                                          ##  Set to NULL string (default) to use the point ids instead.
                                                          ##
    ##  Structures for the various cell types we render.
    ##  do we have wide lines that require special handling
    ##  Check the renderpasses in actor's property keys to see if they've changed
    ##  render stages:
    ##  When was the OpenGL VBO updated?
    ##  used for determining when to rebuild the VBO
    ##  used for determining whento rebuild the IBOs
    ##  can be used to avoid constant allocs/deallocs
    ##  for points
    ##  if set to true, tcoords will be passed to the
    ##  VBO even if the mapper knows of no texture maps
    ##  normally tcoords are only added to the VBO if the
    ##  mapper has identified a texture map as well.
    ##  are we currently drawing spheres/tubes
    ##  stores the mapping from vtk cells to gl_PrimitiveId
    ##  compute and set the maximum point and cell ID used in selection


proc New*(): ptr vtkOpenGLPolyDataMapper {.importcpp: "vtkOpenGLPolyDataMapper::New(@)",
                                       header: "vtkOpenGLPolyDataMapper.h".}
type
  vtkOpenGLPolyDataMapperSuperclass* = vtkPolyDataMapper

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOpenGLPolyDataMapper::IsTypeOf(@)",
    header: "vtkOpenGLPolyDataMapper.h".}
proc IsA*(this: var vtkOpenGLPolyDataMapper; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkOpenGLPolyDataMapper.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOpenGLPolyDataMapper {.
    importcpp: "vtkOpenGLPolyDataMapper::SafeDownCast(@)",
    header: "vtkOpenGLPolyDataMapper.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOpenGLPolyDataMapper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenGLPolyDataMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenGLPolyDataMapper :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOpenGLPolyDataMapper; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkOpenGLPolyDataMapper.h".}
proc RenderPiece*(this: var vtkOpenGLPolyDataMapper; ren: ptr vtkRenderer;
                 act: ptr vtkActor) {.importcpp: "RenderPiece",
                                   header: "vtkOpenGLPolyDataMapper.h".}
proc RenderPieceStart*(this: var vtkOpenGLPolyDataMapper; ren: ptr vtkRenderer;
                      act: ptr vtkActor) {.importcpp: "RenderPieceStart",
                                        header: "vtkOpenGLPolyDataMapper.h".}
proc RenderPieceDraw*(this: var vtkOpenGLPolyDataMapper; ren: ptr vtkRenderer;
                     act: ptr vtkActor) {.importcpp: "RenderPieceDraw",
                                       header: "vtkOpenGLPolyDataMapper.h".}
proc RenderPieceFinish*(this: var vtkOpenGLPolyDataMapper; ren: ptr vtkRenderer;
                       act: ptr vtkActor) {.importcpp: "RenderPieceFinish",
    header: "vtkOpenGLPolyDataMapper.h".}
proc ReleaseGraphicsResources*(this: var vtkOpenGLPolyDataMapper; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkOpenGLPolyDataMapper.h".}
## !!!Ignored construct:  virtual int GetPopulateSelectionSettings ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PopulateSelectionSettings  of  << this -> PopulateSelectionSettings ) ; return this -> PopulateSelectionSettings ; } ;
## Error: expected ';'!!!

proc SetPopulateSelectionSettings*(this: var vtkOpenGLPolyDataMapper; v: cint) {.
    importcpp: "SetPopulateSelectionSettings", header: "vtkOpenGLPolyDataMapper.h".}
proc GetSupportsSelection*(this: var vtkOpenGLPolyDataMapper): bool {.
    importcpp: "GetSupportsSelection", header: "vtkOpenGLPolyDataMapper.h".}
proc SetPointIdArrayName*(this: var vtkOpenGLPolyDataMapper; _arg: cstring) {.
    importcpp: "SetPointIdArrayName", header: "vtkOpenGLPolyDataMapper.h".}
proc GetPointIdArrayName*(this: var vtkOpenGLPolyDataMapper): cstring {.
    importcpp: "GetPointIdArrayName", header: "vtkOpenGLPolyDataMapper.h".}
proc SetPointIdArrayNameCellIdArrayName*(this: var vtkOpenGLPolyDataMapper;
                                        _arg: cstring) {.
    importcpp: "SetPointIdArrayNameCellIdArrayName",
    header: "vtkOpenGLPolyDataMapper.h".}
proc GetPointIdArrayNameCellIdArrayName*(this: var vtkOpenGLPolyDataMapper): cstring {.
    importcpp: "GetPointIdArrayNameCellIdArrayName",
    header: "vtkOpenGLPolyDataMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  If this class should override the process id using a data-array,
  ##  set this variable to the name of the array to use. It must be a
  ##  point-array.
  ##
proc SetPointIdArrayNameCellIdArrayNameProcessIdArrayName*(
    this: var vtkOpenGLPolyDataMapper; _arg: cstring) {.
    importcpp: "SetPointIdArrayNameCellIdArrayNameProcessIdArrayName",
    header: "vtkOpenGLPolyDataMapper.h".}
proc GetPointIdArrayNameCellIdArrayNameProcessIdArrayName*(
    this: var vtkOpenGLPolyDataMapper): cstring {.
    importcpp: "GetPointIdArrayNameCellIdArrayNameProcessIdArrayName",
    header: "vtkOpenGLPolyDataMapper.h".}
  ## /@}
  ## /@{
  ## *
  ##  Generally, this class can render the composite id when iterating
  ##  over composite datasets. However in some cases (as in AMR), the rendered
  ##  structure may not correspond to the input data, in which case we need
  ##  to provide a cell array that can be used to render in the composite id in
  ##  selection passes. Set to NULL (default) to not override the composite id
  ##  color set by vtkCompositePainter if any.
  ##  The array *MUST* be a cell array and of type vtkUnsignedIntArray.
  ##
proc SetPointIdArrayNameCellIdArrayNameProcessIdArrayNameCompositeIdArrayName*(
    this: var vtkOpenGLPolyDataMapper; _arg: cstring) {.importcpp: "SetPointIdArrayNameCellIdArrayNameProcessIdArrayNameCompositeIdArrayName",
    header: "vtkOpenGLPolyDataMapper.h".}
proc GetPointIdArrayNameCellIdArrayNameProcessIdArrayNameCompositeIdArrayName*(
    this: var vtkOpenGLPolyDataMapper): cstring {.importcpp: "GetPointIdArrayNameCellIdArrayNameProcessIdArrayNameCompositeIdArrayName",
    header: "vtkOpenGLPolyDataMapper.h".}
  ## /@}
  ## *
  ##  Make a shallow copy of this mapper.
  ##
proc ShallowCopy*(this: var vtkOpenGLPolyDataMapper; m: ptr vtkAbstractMapper) {.
    importcpp: "ShallowCopy", header: "vtkOpenGLPolyDataMapper.h".}
proc GetnameVBOs*(this: var vtkOpenGLPolyDataMapper): ptr vtkOpenGLVertexBufferObjectGroup {.
    importcpp: "GetnameVBOs", header: "vtkOpenGLPolyDataMapper.h".}
  ## *\brief A convenience method for enabling/disabling
  ##    the VBO's shift+scale transform.
  ##
proc SetVBOShiftScaleMethod*(this: var vtkOpenGLPolyDataMapper; m: cint) {.
    importcpp: "SetVBOShiftScaleMethod", header: "vtkOpenGLPolyDataMapper.h".}
proc GetVBOShiftScaleMethod*(this: var vtkOpenGLPolyDataMapper): cint {.
    importcpp: "GetVBOShiftScaleMethod", header: "vtkOpenGLPolyDataMapper.h".}
proc SetPauseShiftScale*(this: var vtkOpenGLPolyDataMapper; pauseShiftScale: bool) {.
    importcpp: "SetPauseShiftScale", header: "vtkOpenGLPolyDataMapper.h".}
## !!!Ignored construct:  virtual bool GetPopulateSelectionSettingsPauseShiftScale ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PauseShiftScale  of  << this -> PauseShiftScale ) ; return this -> PauseShiftScale ; } ;
## Error: expected ';'!!!

proc PauseShiftScaleOn*(this: var vtkOpenGLPolyDataMapper) {.
    importcpp: "PauseShiftScaleOn", header: "vtkOpenGLPolyDataMapper.h".}
proc PauseShiftScaleOff*(this: var vtkOpenGLPolyDataMapper) {.
    importcpp: "PauseShiftScaleOff", header: "vtkOpenGLPolyDataMapper.h".}
type
  vtkOpenGLPolyDataMapperPrimitiveTypes* {.size: sizeof(cint),
      importcpp: "vtkOpenGLPolyDataMapper::PrimitiveTypes",
      header: "vtkOpenGLPolyDataMapper.h".} = enum
    PrimitiveStart = 0, PrimitiveLines, PrimitiveTris, PrimitiveTriStrips,
    PrimitiveVertices, PrimitiveEnd

const
  PrimitivePoints = PrimitiveStart

proc MapDataArrayToVertexAttribute*(this: var vtkOpenGLPolyDataMapper;
                                   vertexAttributeName: cstring;
                                   dataArrayName: cstring; fieldAssociation: cint;
                                   componentno: cint = -1) {.
    importcpp: "MapDataArrayToVertexAttribute",
    header: "vtkOpenGLPolyDataMapper.h".}
proc MapDataArrayToMultiTextureAttribute*(this: var vtkOpenGLPolyDataMapper;
    tname: cstring; dataArrayName: cstring; fieldAssociation: cint;
    componentno: cint = -1) {.importcpp: "MapDataArrayToMultiTextureAttribute",
                          header: "vtkOpenGLPolyDataMapper.h".}
proc RemoveVertexAttributeMapping*(this: var vtkOpenGLPolyDataMapper;
                                  vertexAttributeName: cstring) {.
    importcpp: "RemoveVertexAttributeMapping", header: "vtkOpenGLPolyDataMapper.h".}
proc RemoveAllVertexAttributeMappings*(this: var vtkOpenGLPolyDataMapper) {.
    importcpp: "RemoveAllVertexAttributeMappings",
    header: "vtkOpenGLPolyDataMapper.h".}
proc ProcessSelectorPixelBuffers*(this: var vtkOpenGLPolyDataMapper;
                                 sel: ptr vtkHardwareSelector;
                                 pixeloffsets: var vector[cuint]; prop: ptr vtkProp) {.
    importcpp: "ProcessSelectorPixelBuffers", header: "vtkOpenGLPolyDataMapper.h".}