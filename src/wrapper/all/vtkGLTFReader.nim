## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGLTFReader.h
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
##  @class   vtkGLTFReader
##  @brief   Read a GLTF file.
##
##  vtkGLTFReader is a concrete subclass of vtkMultiBlockDataSetAlgorithm that reads glTF 2.0 files.
##
##  The GL Transmission Format (glTF) is an API-neutral runtime asset delivery format.
##  A glTF asset is represented by:
##  - A JSON-formatted file (.gltf) containing a full scene description: node hierarchy, materials,
##    cameras, as well as descriptor information for meshes, animations, and other constructs
##  - Binary files (.bin) containing geometry and animation data, and other buffer-based data
##  - Image files (.jpg, .png) for textures
##
##  This reader currently outputs a vtkMultiBlockDataSet containing geometry information
##  for the current selected scene, with animations, skins and morph targets applied, unless
##  configured not to (see ApplyDeformationsToGeometry).
##
##  It is possible to get information about available scenes and animations by using the
##  corresponding accessors.
##  To use animations, first call SetFramerate with a non-zero value,
##  then use EnableAnimation or DisableAnimation to configure which animations you would like to
##  apply to the geometry.
##  Finally, use UPDATE_TIME_STEPS to choose which frame to apply.
##  If ApplyDeformationsToGeometry is set to true, the reader will apply the deformations, otherwise,
##  animation transformation information will be saved to the dataset's FieldData.
##
##  Materials are currently not supported in this reader. If you would like to display materials,
##  please try using vtkGLTFImporter.
##  You could also use vtkGLTFReader::GetGLTFTexture, to access the image data that was loaded from
##  the glTF 2.0 document.
##
##  This reader only supports assets that use the 2.x version of the glTF specification.
##
##  For the full glTF specification, see:
##  https://github.com/KhronosGroup/glTF/tree/master/specification/2.0
##
##  Note: array sizes should not exceed INT_MAX
##
##  @sa
##  vtkMultiBlockDataSetAlgorithm
##  vtkGLTFImporter
##

import
  vtkIOGeometryModule, vtkMultiBlockDataSetAlgorithm, vtkSmartPointer

discard "forward decl of vtkDataArraySelection"
discard "forward decl of vtkFieldData"
discard "forward decl of vtkGLTFDocumentLoader"
discard "forward decl of vtkImageData"
discard "forward decl of vtkStringArray"
type
  vtkGLTFReader* {.importcpp: "vtkGLTFReader", header: "vtkGLTFReader.h", bycopy.} = object of vtkMultiBlockDataSetAlgorithm
    vtkGLTFReader* {.importc: "vtkGLTFReader".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    ## *
    ##  Create and store GLTFTexture struct for each image present in the model.
    ##


proc New*(): ptr vtkGLTFReader {.importcpp: "vtkGLTFReader::New(@)",
                             header: "vtkGLTFReader.h".}
type
  vtkGLTFReaderSuperclass* = vtkMultiBlockDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGLTFReader::IsTypeOf(@)", header: "vtkGLTFReader.h".}
proc IsA*(this: var vtkGLTFReader; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkGLTFReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGLTFReader {.
    importcpp: "vtkGLTFReader::SafeDownCast(@)", header: "vtkGLTFReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGLTFReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMultiBlockDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGLTFReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGLTFReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGLTFReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGLTFReader.h".}
type
  vtkGLTFReaderGLTFTexture* {.importcpp: "vtkGLTFReader::GLTFTexture",
                             header: "vtkGLTFReader.h", bycopy.} = object
    Image* {.importc: "Image".}: vtkSmartPointer[vtkImageData]
    MinFilterValue* {.importc: "MinFilterValue".}: cushort
    MaxFilterValue* {.importc: "MaxFilterValue".}: cushort
    WrapSValue* {.importc: "WrapSValue".}: cushort
    WrapTValue* {.importc: "WrapTValue".}: cushort


proc GetNumberOfTextures*(this: var vtkGLTFReader): vtkIdType {.
    importcpp: "GetNumberOfTextures", header: "vtkGLTFReader.h".}
proc GetGLTFTexture*(this: var vtkGLTFReader; textureIndex: vtkIdType): vtkGLTFReaderGLTFTexture {.
    importcpp: "GetGLTFTexture", header: "vtkGLTFReader.h".}
## !!!Ignored construct:  /@} /@{ *
##  Set/Get the name of the file from which to read points.
##  virtual void SetFileNameFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

proc SetApplyDeformationsToGeometry*(this: var vtkGLTFReader; flag: bool) {.
    importcpp: "SetApplyDeformationsToGeometry", header: "vtkGLTFReader.h".}
## !!!Ignored construct:  virtual bool GetApplyDeformationsToGeometry ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ApplyDeformationsToGeometry  of  << this -> ApplyDeformationsToGeometry ) ; return this -> ApplyDeformationsToGeometry ; } ;
## Error: expected ';'!!!

proc ApplyDeformationsToGeometryOn*(this: var vtkGLTFReader) {.
    importcpp: "ApplyDeformationsToGeometryOn", header: "vtkGLTFReader.h".}
proc ApplyDeformationsToGeometryOff*(this: var vtkGLTFReader) {.
    importcpp: "ApplyDeformationsToGeometryOff", header: "vtkGLTFReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  glTF models can contain multiple animations, with various names and duration. glTF does not
  ##  specify however any runtime behavior (order of playing, auto-start, loops, mapping of
  ##  timelines, etc), which is why no animation is enabled by default.
  ##  These accessors expose metadata information about a model's available animations.
  ##
## !!!Ignored construct:  virtual vtkIdType GetApplyDeformationsToGeometryNumberOfAnimations ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfAnimations  of  << this -> NumberOfAnimations ) ; return this -> NumberOfAnimations ; } ;
## Error: expected ';'!!!

proc GetAnimationName*(this: var vtkGLTFReader; animationIndex: vtkIdType): string {.
    importcpp: "GetAnimationName", header: "vtkGLTFReader.h".}
proc GetAnimationDuration*(this: var vtkGLTFReader; animationIndex: vtkIdType): cfloat {.
    importcpp: "GetAnimationDuration", header: "vtkGLTFReader.h".}
proc EnableAnimation*(this: var vtkGLTFReader; animationIndex: vtkIdType) {.
    importcpp: "EnableAnimation", header: "vtkGLTFReader.h".}
proc DisableAnimation*(this: var vtkGLTFReader; animationIndex: vtkIdType) {.
    importcpp: "DisableAnimation", header: "vtkGLTFReader.h".}
proc IsAnimationEnabled*(this: var vtkGLTFReader; animationIndex: vtkIdType): bool {.
    importcpp: "IsAnimationEnabled", header: "vtkGLTFReader.h".}
proc GetSceneName*(this: var vtkGLTFReader; sceneIndex: vtkIdType): string {.
    importcpp: "GetSceneName", header: "vtkGLTFReader.h".}
## !!!Ignored construct:  virtual vtkIdType GetApplyDeformationsToGeometryNumberOfAnimationsNumberOfScenes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfScenes  of  << this -> NumberOfScenes ) ; return this -> NumberOfScenes ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get/Set the scene to be used by the reader
##  virtual vtkIdType GetApplyDeformationsToGeometryNumberOfAnimationsNumberOfScenesCurrentSceneCurrentScene ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CurrentScene  of  << this -> CurrentScene ) ; return this -> CurrentScene ; } ;
## Error: expected ';'!!!

proc SetCurrentScene*(this: var vtkGLTFReader; _arg: vtkIdType) {.
    importcpp: "SetCurrentScene", header: "vtkGLTFReader.h".}
proc SetScene*(this: var vtkGLTFReader; scene: string) {.importcpp: "SetScene",
    header: "vtkGLTFReader.h".}
## !!!Ignored construct:  /@} /@{ *
##  Get/Set the rate at which animations will be sampled:
##  the glTF format does not have the concept of static timesteps.
##  TimeSteps are generated, during the REQUEST_INFORMATION pass,
##  as linearly interpolated time values between 0s and the animations' maximum durations,
##  sampled at the specified frame rate.
##  Use the TIME_STEPS information key to obtain integer indices to each of these steps.
##  virtual unsigned int GetApplyDeformationsToGeometryNumberOfAnimationsNumberOfScenesCurrentSceneCurrentSceneFrameRateFrameRate ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FrameRate  of  << this -> FrameRate ) ; return this -> FrameRate ; } ;
## Error: expected ';'!!!

proc SetCurrentSceneFrameRate*(this: var vtkGLTFReader; _arg: cuint) {.
    importcpp: "SetCurrentSceneFrameRate", header: "vtkGLTFReader.h".}
  ## /@}
  ## *
  ##  Get a list all scenes names as a vtkStringArray, with duplicate names numbered and empty names
  ##  replaced by a generic name. All names are guaranteed to be unique, and their index in the array
  ##  matches the glTF document's scene indices.
  ##
proc GetAllSceneNames*(this: var vtkGLTFReader): ptr vtkStringArray {.
    importcpp: "GetAllSceneNames", header: "vtkGLTFReader.h".}
proc GetAnimationSelection*(this: var vtkGLTFReader): ptr vtkDataArraySelection {.
    importcpp: "GetAnimationSelection", header: "vtkGLTFReader.h".}