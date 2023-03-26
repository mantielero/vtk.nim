## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGLTFImporter.h
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
##  @class   vtkGLTFImporter
##  @brief   Import a GLTF file.
##
##  vtkGLTFImporter is a concrete subclass of vtkImporter that reads glTF 2.0
##  files.
##
##  The GL Transmission Format (glTF) is an API-neutral runtime asset delivery format.
##  A glTF asset is represented by:
##  - A JSON-formatted file (.gltf) containing a full scene description: node hierarchy, materials,
##    cameras, as well as descriptor information for meshes, animations, and other constructs
##  - Binary files (.bin) containing geometry and animation data, and other buffer-based data
##  - Image files (.jpg, .png) for textures
##
##  This importer supports all physically-based rendering material features, with the exception of
##  alpha masking and mirrored texture wrapping, which are not supported.
##
##
##  This importer does not support materials that use multiple
##  sets of texture coordinates. Only the first set will be used in this case.
##
##  This importer does not support animations, morphing and skinning. If you would like to use
##  animations, morphing or skinning, please consider using vtkGLTFReader.
##
##  This importer only supports assets that use the 2.x version of the glTF specification.
##
##  For the full glTF specification, see:
##  https://github.com/KhronosGroup/glTF/tree/master/specification/2.0
##
##  Note: array sizes should not exceed INT_MAX
##
##  Supported extensions:
##  - KHR_lights_punctual :
##    The importer supports the KHR_lights_punctual extension except for this feature:
##    - VTK does not support changing the falloff of the cone with innerConeAngle and outerConeAngle.
##      The importer uses outerConeAngle and ignores innerConeAngle as specified for this situation.
##
##  @sa
##  vtkImporter
##  vtkGLTFReader
##

import
  vtkIOImportModule, vtkImporter, vtkSmartPointer

discard "forward decl of vtkActor"
discard "forward decl of vtkCamera"
discard "forward decl of vtkGLTFDocumentLoader"
discard "forward decl of vtkTexture"
type
  vtkGLTFImporter* {.importcpp: "vtkGLTFImporter", header: "vtkGLTFImporter.h",
                    bycopy.} = object of vtkImporter
    vtkGLTFImporter* {.importc: "vtkGLTFImporter".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH


proc New*(): ptr vtkGLTFImporter {.importcpp: "vtkGLTFImporter::New(@)",
                               header: "vtkGLTFImporter.h".}
type
  vtkGLTFImporterSuperclass* = vtkImporter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGLTFImporter::IsTypeOf(@)", header: "vtkGLTFImporter.h".}
proc IsA*(this: var vtkGLTFImporter; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkGLTFImporter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGLTFImporter {.
    importcpp: "vtkGLTFImporter::SafeDownCast(@)", header: "vtkGLTFImporter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGLTFImporter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImporter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGLTFImporter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGLTFImporter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGLTFImporter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGLTFImporter.h".}
## !!!Ignored construct:  /@{ *
##  Specify the name of the file to read.
##  virtual void SetFileNameFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

proc GetCamera*(this: var vtkGLTFImporter; id: cuint): vtkSmartPointer[vtkCamera] {.
    importcpp: "GetCamera", header: "vtkGLTFImporter.h".}
proc GetOutputsDescription*(this: var vtkGLTFImporter): string {.
    importcpp: "GetOutputsDescription", header: "vtkGLTFImporter.h".}
  ## *
  ##  update timestep
  ##
proc UpdateTimeStep*(this: var vtkGLTFImporter; timestep: cdouble) {.
    importcpp: "UpdateTimeStep", header: "vtkGLTFImporter.h".}
proc GetNumberOfAnimations*(this: var vtkGLTFImporter): vtkIdType {.
    importcpp: "GetNumberOfAnimations", header: "vtkGLTFImporter.h".}
proc GetAnimationName*(this: var vtkGLTFImporter; animationIndex: vtkIdType): string {.
    importcpp: "GetAnimationName", header: "vtkGLTFImporter.h".}
proc EnableAnimation*(this: var vtkGLTFImporter; animationIndex: vtkIdType) {.
    importcpp: "EnableAnimation", header: "vtkGLTFImporter.h".}
proc DisableAnimation*(this: var vtkGLTFImporter; animationIndex: vtkIdType) {.
    importcpp: "DisableAnimation", header: "vtkGLTFImporter.h".}
proc IsAnimationEnabled*(this: var vtkGLTFImporter; animationIndex: vtkIdType): bool {.
    importcpp: "IsAnimationEnabled", header: "vtkGLTFImporter.h".}
proc GetNumberOfCameras*(this: var vtkGLTFImporter): vtkIdType {.
    importcpp: "GetNumberOfCameras", header: "vtkGLTFImporter.h".}
proc GetCameraName*(this: var vtkGLTFImporter; camIndex: vtkIdType): string {.
    importcpp: "GetCameraName", header: "vtkGLTFImporter.h".}
proc SetCamera*(this: var vtkGLTFImporter; camIndex: vtkIdType) {.
    importcpp: "SetCamera", header: "vtkGLTFImporter.h".}
proc GetTemporalInformation*(this: var vtkGLTFImporter; animationIndex: vtkIdType;
                            frameRate: cdouble; nbTimeSteps: var cint;
                            timeRange: array[2, cdouble];
                            timeSteps: ptr vtkDoubleArray): bool {.
    importcpp: "GetTemporalInformation", header: "vtkGLTFImporter.h".}
## !!!Ignored construct:  std :: map < int , std :: vector < vtkSmartPointer < vtkActor >> > Actors ;
## Error: identifier expected, but got: <!!!
