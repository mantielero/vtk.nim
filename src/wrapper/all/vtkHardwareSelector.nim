## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHardwareSelector.h
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
##
##  @class   vtkHardwareSelector
##  @brief   manager for OpenGL-based selection.
##
##  vtkHardwareSelector is a helper that orchestrates color buffer based
##  selection. This relies on OpenGL.
##  vtkHardwareSelector can be used to select visible cells or points within a
##  given rectangle of the RenderWindow.
##  To use it, call in order:
##  \li SetRenderer() - to select the renderer in which we
##  want to select the cells/points.
##  \li SetArea() - to set the rectangular region in the render window to select
##  in.
##  \li SetFieldAssociation() -  to select the attribute to select i.e.
##  cells/points etc.
##  \li Finally, call Select().
##  Select will cause the attached vtkRenderer to render in a special color mode,
##  where each cell/point is given it own color so that later inspection of the
##  Rendered Pixels can determine what cells are visible. Select() returns a new
##  vtkSelection instance with the cells/points selected.
##
##  Limitations:
##  Antialiasing will break this class. If your graphics card settings force
##  their use this class will return invalid results.
##
##  Only Opaque geometry in Actors is selected from. Assemblies and LODMappers
##  are not currently supported.
##
##  During selection, visible datasets that can not be selected from are
##  temporarily hidden so as not to produce invalid indices from their colors.
##
##
##  The basic approach this class uses is to invoke render multiple times
##  (passes) and have the mappers render pass specific information into
##  the color buffer. For example during the ACTOR_PASS a mapper is
##  supposed to render it's actor's id into the color buffer as a RGB
##  value where R is the lower 8 bits, G is the next 8, etc. Giving us 24
##  bits of unsigned int range.
##
##  The same concept applies to the COMPOSITE_INDEX_PASS and the point and
##  cell ID passes. As points and cells can easily exceed the 24 bit range
##  of the color buffer we break them into two 24 bit passes for a total
##  of 48 bits of range.
##
##  During each pass the mappers render their data into the color buffer,
##  the hardware selector grabs that buffer and then invokes
##  ProcessSelectorPixelBuffer on all of the hit props. Giving them, and
##  their mappers, a chance to modify the pixel buffer.
##
##  Most mappers use this ProcessSelectorPixelBuffers pass to take when
##  they rendered into the color buffer and convert it into what the
##  hardware selector is expecting. This is because in some cases it is
##  far easier and faster to  render something else, such as
##  gl_PrimitiveID or gl_VertexID and then in the processing convert those
##  values to the appropriate VTK values.
##
##  NOTE:  The goal is for mappers to support hardware selection without
##  having to rebuild any of their VBO/IBOs to maintain fast picking
##  performance.
##
##  NOTE: This class has a complex interaction with parallel compositing
##  techniques such as IceT that are used on supercomputers. In those
##  cases the local nodes render each pass, process it, send it to icet
##  which composites it, and then must copy the result back to the hardware
##  selector. Be aware of these interactions  if you work on this class.
##
##  NOTE: many mappers support remapping arrays from their local value to
##  some other provided value. For example ParaView when creating a
##  polydata from an unstructured grid will create point and cell data
##  arrays on the polydata that may the polydata point and cell IDs back
##  to the original unstructured grid's point and cell IDs. The hardware
##  selection process honors those arrays and will provide the original
##  unstructured grid point and cell ID when a selection is made.
##  Likewise there are process and composite arrays that most mappers
##  support that allow for parallel data generation, delivery, and local
##  rendering while preserving the original process and composite values
##  from when the data was distributed. Be aware the process array is a
##  point data while the composite array is a cell data.
##
##  TODO: This whole selection process could be nicely encapsulated as a
##  RenderPass that internally renders multiple times with different
##  settings. That would be my suggestion for the future.
##
##  TODO: The pick method build into renderer could use the ACTOR pass of
##  this class to do it's work eliminating some confusion and duplicate
##  code paths.
##
##  TODO: I am not sure where the composite array indirection is used.
##
##
##  @sa
##  vtkOpenGLHardwareSelector
##

import
  vtkObject, vtkRenderingCoreModule

discard "forward decl of vtkRenderer"
discard "forward decl of vtkRenderWindow"
discard "forward decl of vtkSelection"
discard "forward decl of vtkProp"
discard "forward decl of vtkTextureObject"
type
  vtkHardwareSelector* {.importcpp: "vtkHardwareSelector",
                        header: "vtkHardwareSelector.h", bycopy.} = object of vtkObject ## /@{
                                                                                 ## *
                                                                                 ##  Struct used to return information about a pixel location.
                                                                                 ##
    vtkHardwareSelector* {.importc: "vtkHardwareSelector".}: VTK_NEWINSTANCE
    vtkSelection* {.importc: "vtkSelection".}: VTK_NEWINSTANCE
    ## /@}
    ##  At most 10 passes.

  vtkHardwareSelectorPixelInformation* {.importcpp: "vtkHardwareSelector::PixelInformation",
                                        header: "vtkHardwareSelector.h", bycopy.} = object
    Valid* {.importc: "Valid".}: bool
    ProcessID* {.importc: "ProcessID".}: cint
    PropID* {.importc: "PropID".}: cint
    Prop* {.importc: "Prop".}: ptr vtkProp
    CompositeID* {.importc: "CompositeID".}: cuint
    AttributeID* {.importc: "AttributeID".}: vtkIdType


proc constructvtkHardwareSelectorPixelInformation*(): vtkHardwareSelectorPixelInformation {.
    constructor, importcpp: "vtkHardwareSelector::PixelInformation(@)",
    header: "vtkHardwareSelector.h".}
proc New*(): ptr vtkHardwareSelector {.importcpp: "vtkHardwareSelector::New(@)",
                                   header: "vtkHardwareSelector.h".}
type
  vtkHardwareSelectorSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkHardwareSelector::IsTypeOf(@)", header: "vtkHardwareSelector.h".}
proc IsA*(this: var vtkHardwareSelector; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkHardwareSelector.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkHardwareSelector {.
    importcpp: "vtkHardwareSelector::SafeDownCast(@)",
    header: "vtkHardwareSelector.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkHardwareSelector :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHardwareSelector :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHardwareSelector :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkHardwareSelector; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkHardwareSelector.h".}
proc SetRenderer*(this: var vtkHardwareSelector; a2: ptr vtkRenderer) {.
    importcpp: "SetRenderer", header: "vtkHardwareSelector.h".}
proc GetnameRenderer*(this: var vtkHardwareSelector): ptr vtkRenderer {.
    importcpp: "GetnameRenderer", header: "vtkHardwareSelector.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get/Set the area to select as (xmin, ymin, xmax, ymax).
  ##
proc SetArea*(this: var vtkHardwareSelector; _arg1: cuint; _arg2: cuint; _arg3: cuint;
             _arg4: cuint) {.importcpp: "SetArea", header: "vtkHardwareSelector.h".}
proc SetArea*(this: var vtkHardwareSelector; _arg: array[4, cuint]) {.
    importcpp: "SetArea", header: "vtkHardwareSelector.h".}
## !!!Ignored construct:  virtual unsigned int * GetArea ( ) VTK_SIZEHINT ( 4 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Area  pointer  << this -> Area ) ; return this -> Area ; } VTK_WRAPEXCLUDE virtual void GetArea ( unsigned int & _arg1 , unsigned int & _arg2 , unsigned int & _arg3 , unsigned int & _arg4 ) { _arg1 = this -> Area [ 0 ] ; _arg2 = this -> Area [ 1 ] ; _arg3 = this -> Area [ 2 ] ; _arg4 = this -> Area [ 3 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Area  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetArea ( unsigned int _arg [ 4 ] ) { this -> GetArea ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ;
## Error: expected ';'!!!

proc SetFieldAssociation*(this: var vtkHardwareSelector; _arg: cint) {.
    importcpp: "SetFieldAssociation", header: "vtkHardwareSelector.h".}
## !!!Ignored construct:  virtual int GetFieldAssociation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FieldAssociation  of  << this -> FieldAssociation ) ; return this -> FieldAssociation ; } ;
## Error: expected ';'!!!

proc SetFieldAssociationUseProcessIdFromData*(this: var vtkHardwareSelector;
    _arg: bool) {.importcpp: "SetFieldAssociationUseProcessIdFromData",
                header: "vtkHardwareSelector.h".}
## !!!Ignored construct:  virtual bool GetFieldAssociationUseProcessIdFromData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseProcessIdFromData  of  << this -> UseProcessIdFromData ) ; return this -> UseProcessIdFromData ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  * Select ( ) ;
## Error: identifier expected, but got: *!!!

proc CaptureBuffers*(this: var vtkHardwareSelector): bool {.
    importcpp: "CaptureBuffers", header: "vtkHardwareSelector.h".}
proc GetPixelInformation*(this: var vtkHardwareSelector;
                         display_position: array[2, cuint]): vtkHardwareSelectorPixelInformation {.
    importcpp: "GetPixelInformation", header: "vtkHardwareSelector.h".}
proc GetPixelInformation*(this: var vtkHardwareSelector;
                         display_position: array[2, cuint]; maxDist: cint): vtkHardwareSelectorPixelInformation {.
    importcpp: "GetPixelInformation", header: "vtkHardwareSelector.h".}
proc GetPixelInformation*(this: var vtkHardwareSelector;
                         display_position: array[2, cuint]; maxDist: cint;
                         selected_position: array[2, cuint]): vtkHardwareSelectorPixelInformation {.
    importcpp: "GetPixelInformation", header: "vtkHardwareSelector.h".}
proc ClearBuffers*(this: var vtkHardwareSelector) {.importcpp: "ClearBuffers",
    header: "vtkHardwareSelector.h".}
proc GetRawPixelBuffer*(this: var vtkHardwareSelector; passNo: cint): ptr cuchar {.
    importcpp: "GetRawPixelBuffer", header: "vtkHardwareSelector.h".}
proc GetPixelBuffer*(this: var vtkHardwareSelector; passNo: cint): ptr cuchar {.
    importcpp: "GetPixelBuffer", header: "vtkHardwareSelector.h".}
proc RenderCompositeIndex*(this: var vtkHardwareSelector; index: cuint) {.
    importcpp: "RenderCompositeIndex", header: "vtkHardwareSelector.h".}
proc UpdateMaximumCellId*(this: var vtkHardwareSelector; attribid: vtkIdType) {.
    importcpp: "UpdateMaximumCellId", header: "vtkHardwareSelector.h".}
proc UpdateMaximumPointId*(this: var vtkHardwareSelector; attribid: vtkIdType) {.
    importcpp: "UpdateMaximumPointId", header: "vtkHardwareSelector.h".}
proc RenderProcessId*(this: var vtkHardwareSelector; processid: cuint) {.
    importcpp: "RenderProcessId", header: "vtkHardwareSelector.h".}
proc Render*(this: var vtkHardwareSelector; renderer: ptr vtkRenderer;
            propArray: ptr ptr vtkProp; propArrayCount: cint): cint {.
    importcpp: "Render", header: "vtkHardwareSelector.h".}
## !!!Ignored construct:  /@{ *
##  Get/Set to only do the actor pass. If true all other passes will be
##  skipped resulting in a faster pick.
##  virtual bool GetFieldAssociationUseProcessIdFromDataActorPassOnlyActorPassOnly ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ActorPassOnly  of  << this -> ActorPassOnly ) ; return this -> ActorPassOnly ; } ;
## Error: expected ';'!!!

proc SetFieldAssociationUseProcessIdFromDataActorPassOnly*(
    this: var vtkHardwareSelector; _arg: bool) {.
    importcpp: "SetFieldAssociationUseProcessIdFromDataActorPassOnly",
    header: "vtkHardwareSelector.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get/Set to capture the zvalue. If true the closest zvalue is
  ##  stored for each prop that is in the selection. ZValue in this
  ##  case is the value from the zbuffer which can be used in
  ##  coordinate conversions
  ##
## !!!Ignored construct:  virtual bool GetFieldAssociationUseProcessIdFromDataActorPassOnlyActorPassOnlyCaptureZValues ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CaptureZValues  of  << this -> CaptureZValues ) ; return this -> CaptureZValues ; } ;
## Error: expected ';'!!!

proc SetFieldAssociationUseProcessIdFromDataActorPassOnlyCaptureZValues*(
    this: var vtkHardwareSelector; _arg: bool) {.importcpp: "SetFieldAssociationUseProcessIdFromDataActorPassOnlyCaptureZValues",
    header: "vtkHardwareSelector.h".}
  ## /@}
  ## /@{
  ## *
  ##  Called by the mapper before and after rendering each prop.
  ##
proc BeginRenderProp*(this: var vtkHardwareSelector) {.importcpp: "BeginRenderProp",
    header: "vtkHardwareSelector.h".}
proc EndRenderProp*(this: var vtkHardwareSelector) {.importcpp: "EndRenderProp",
    header: "vtkHardwareSelector.h".}
proc SetFieldAssociationUseProcessIdFromDataActorPassOnlyCaptureZValuesProcessID*(
    this: var vtkHardwareSelector; _arg: cint) {.importcpp: "SetFieldAssociationUseProcessIdFromDataActorPassOnlyCaptureZValuesProcessID",
    header: "vtkHardwareSelector.h".}
## !!!Ignored construct:  virtual int GetFieldAssociationUseProcessIdFromDataActorPassOnlyActorPassOnlyCaptureZValuesProcessID ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProcessID  of  << this -> ProcessID ) ; return this -> ProcessID ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get/Set the color to be used by the prop when drawing
##  virtual float * GetPropColorValuePropColorValue ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << PropColorValue  pointer  << this -> PropColorValue ) ; return this -> PropColorValue ; } VTK_WRAPEXCLUDE virtual void GetPropColorValuePropColorValue ( float & _arg1 , float & _arg2 , float & _arg3 ) { _arg1 = this -> PropColorValue [ 0 ] ; _arg2 = this -> PropColorValue [ 1 ] ; _arg3 = this -> PropColorValue [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << PropColorValue  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetPropColorValuePropColorValue ( float _arg [ 3 ] ) { this -> GetPropColorValuePropColorValue ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetPropColorValue*(this: var vtkHardwareSelector; _arg1: cfloat; _arg2: cfloat;
                       _arg3: cfloat) {.importcpp: "SetPropColorValue",
                                      header: "vtkHardwareSelector.h".}
proc SetPropColorValue*(this: var vtkHardwareSelector; _arg: array[3, cfloat]) {.
    importcpp: "SetPropColorValue", header: "vtkHardwareSelector.h".}
proc SetPropColorValue*(this: var vtkHardwareSelector; val: vtkIdType) {.
    importcpp: "SetPropColorValue", header: "vtkHardwareSelector.h".}
## !!!Ignored construct:  /@} /@{ *
##  Get the current pass number.
##  virtual int GetFieldAssociationUseProcessIdFromDataActorPassOnlyActorPassOnlyCaptureZValuesProcessIDCurrentPassCurrentPass ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CurrentPass  of  << this -> CurrentPass ) ; return this -> CurrentPass ; } ;
## Error: expected ';'!!!

proc GenerateSelection*(this: var vtkHardwareSelector): ptr vtkSelection {.
    importcpp: "GenerateSelection", header: "vtkHardwareSelector.h".}
proc GenerateSelection*(this: var vtkHardwareSelector; r: array[4, cuint]): ptr vtkSelection {.
    importcpp: "GenerateSelection", header: "vtkHardwareSelector.h".}
proc GenerateSelection*(this: var vtkHardwareSelector; x1: cuint; y1: cuint; x2: cuint;
                       y2: cuint): ptr vtkSelection {.
    importcpp: "GenerateSelection", header: "vtkHardwareSelector.h".}
proc GeneratePolygonSelection*(this: var vtkHardwareSelector;
                              polygonPoints: ptr cint; count: vtkIdType): ptr vtkSelection {.
    importcpp: "GeneratePolygonSelection", header: "vtkHardwareSelector.h".}
proc GetPropFromID*(this: var vtkHardwareSelector; id: cint): ptr vtkProp {.
    importcpp: "GetPropFromID", header: "vtkHardwareSelector.h".}
type
  vtkHardwareSelectorPassTypes* {.size: sizeof(cint),
                                 importcpp: "vtkHardwareSelector::PassTypes",
                                 header: "vtkHardwareSelector.h".} = enum ##  always must be first so that the prop IDs are set
    ACTOR_PASS,               ##  must always be second for composite mapper
    COMPOSITE_INDEX_PASS, POINT_ID_LOW24, POINT_ID_HIGH24, ##  if needed
    PROCESS_PASS,             ##  must be after point id pass
    CELL_ID_LOW24, CELL_ID_HIGH24 ##  if needed

const
  MAX_KNOWN_PASS* = CELL_ID_HIGH24
  MIN_KNOWN_PASS* = ACTOR_PASS

proc PassTypeToString*(this: var vtkHardwareSelector;
                      `type`: vtkHardwareSelectorPassTypes): string {.
    importcpp: "PassTypeToString", header: "vtkHardwareSelector.h".}
proc Convert*(id: vtkIdType; tcoord: array[3, cfloat]) {.
    importcpp: "vtkHardwareSelector::Convert(@)", header: "vtkHardwareSelector.h".}
proc SavePixelBuffer*(this: var vtkHardwareSelector; passNo: cint) {.
    importcpp: "SavePixelBuffer", header: "vtkHardwareSelector.h".}
proc HasHighCellIds*(this: var vtkHardwareSelector): bool {.
    importcpp: "HasHighCellIds", header: "vtkHardwareSelector.h".}
proc HasHighPointIds*(this: var vtkHardwareSelector): bool {.
    importcpp: "HasHighPointIds", header: "vtkHardwareSelector.h".}