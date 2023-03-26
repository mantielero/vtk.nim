## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOpenGLInstanceCulling.h
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
##  @class   vtkOpenGLInstanceCulling
##  @brief   Frustum culling and LOD management.
##
##  This class is used to cull instances based on their transformation matrix.
##  It was designed to improve performances when there is large number of instances
##  in vtkOpenGLGlyph3DMapper.
##
##  Each instance is tested on the GPU through vertex shader to know if it is inside
##  of the frustum view. If it is, the distance to the camera is computed to select
##  and send to the geometry shader the corresponding LOD index.
##  The geometry shader register the instance to the corresponding vertex stream and
##  therefore the corresponding transform feedback buffer in video memory.
##
##  @warning   GL_ARB_gpu_shader5 extension is required.
##
##  @code{.cpp}
##
##  vtkNew<vtkOpenGLInstanceCulling> culling;
##  vtkIdType nbInstances = 1000000;
##
##  // buffer of size 16*nbInstances containing transform matrices.
##  vtkOpenGLBufferObject* bufferMatrix = ...;
##
##  // buffer of size 4*nbInstances containing color buffer to pass through.
##  vtkOpenGLBufferObject* bufferColor = ...;
##
##  // Initialize LODs
##  culling->InitLOD(polydata); // LOD0 : full geometry
##  culling->AddLOD(2.0, 0.5); // LOD1 : after 2.0, 50% triangles
##  culling->AddLOD(5.0, 0.99); // LOD2 : after 5.0, 1% triangles
##
##  // Build shader and binds
##  culling->BuildCullingShaders(ren, actor, nbInstances);
##  culling->RunCullingShaders(nbInstances, bufferMatrix, bufferColor);
##
##  // Get number of instances in LOD 0
##  int nbInstInLOD0 = culling->GetLOD(0).NumberOfInstances;
##
##  // Get VBO and IBO of LOD 1
##  vtkOpenGLBufferObject* VBO1 = culling->GetLOD(1).PositionVBO;
##  vtkOpenGLBufferObject* IBO1 = culling->GetLOD(1).IBO;
##
##  // Get instances buffer of LOD 2
##  // buffer is interleaved [ transformMatrix0 color0 transformMatrix1 color1 ... ]
##  vtkOpenGLBufferObject* buffer2 = culling->GetLODBuffer(2);
##
##  @endcode
##

import
  vtkObject, vtkOpenGLHelper, vtkRenderingOpenGL2Module, vtkSmartPointer

discard "forward decl of vtkOpenGLIndexBufferObject"
discard "forward decl of vtkOpenGLBufferObject"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkOpenGLShaderCache"
type
  vtkOpenGLInstanceCulling* {.importcpp: "vtkOpenGLInstanceCulling",
                             header: "vtkOpenGLInstanceCulling.h", bycopy.} = object of vtkObject
    vtkOpenGLInstanceCulling* {.importc: "vtkOpenGLInstanceCulling".}: VTK_NEWINSTANCE


proc New*(): ptr vtkOpenGLInstanceCulling {.importcpp: "vtkOpenGLInstanceCulling::New(@)",
                                        header: "vtkOpenGLInstanceCulling.h".}
type
  vtkOpenGLInstanceCullingSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOpenGLInstanceCulling::IsTypeOf(@)",
    header: "vtkOpenGLInstanceCulling.h".}
proc IsA*(this: var vtkOpenGLInstanceCulling; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkOpenGLInstanceCulling.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOpenGLInstanceCulling {.
    importcpp: "vtkOpenGLInstanceCulling::SafeDownCast(@)",
    header: "vtkOpenGLInstanceCulling.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOpenGLInstanceCulling :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenGLInstanceCulling :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenGLInstanceCulling :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOpenGLInstanceCulling; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkOpenGLInstanceCulling.h".}
type
  vtkOpenGLInstanceCullingInstanceLOD* {.importcpp: "vtkOpenGLInstanceCulling::InstanceLOD",
                                        header: "vtkOpenGLInstanceCulling.h",
                                        bycopy.} = object
    Distance* {.importc: "Distance".}: cfloat
    Query* {.importc: "Query".}: cuint
    IBO* {.importc: "IBO".}: ptr vtkOpenGLIndexBufferObject
    PositionVBO* {.importc: "PositionVBO".}: ptr vtkOpenGLBufferObject
    NormalVBO* {.importc: "NormalVBO".}: ptr vtkOpenGLBufferObject
    NumberOfInstances* {.importc: "NumberOfInstances".}: cint ##  used for sorting


proc `<`*(this: vtkOpenGLInstanceCullingInstanceLOD;
         other: vtkOpenGLInstanceCullingInstanceLOD): bool {.noSideEffect,
    importcpp: "(# < #)", header: "vtkOpenGLInstanceCulling.h".}
proc InitLOD*(this: var vtkOpenGLInstanceCulling; pd: ptr vtkPolyData) {.
    importcpp: "InitLOD", header: "vtkOpenGLInstanceCulling.h".}
proc AddLOD*(this: var vtkOpenGLInstanceCulling; distance: cfloat;
            targetReduction: cfloat) {.importcpp: "AddLOD",
                                     header: "vtkOpenGLInstanceCulling.h".}
proc BuildCullingShaders*(this: var vtkOpenGLInstanceCulling;
                         cache: ptr vtkOpenGLShaderCache; numInstances: vtkIdType;
                         withNormals: bool) {.importcpp: "BuildCullingShaders",
    header: "vtkOpenGLInstanceCulling.h".}
proc GetHelper*(this: var vtkOpenGLInstanceCulling): var vtkOpenGLHelper {.
    importcpp: "GetHelper", header: "vtkOpenGLInstanceCulling.h".}
proc GetLOD*(this: var vtkOpenGLInstanceCulling; index: vtkIdType): var vtkOpenGLInstanceCullingInstanceLOD {.
    importcpp: "GetLOD", header: "vtkOpenGLInstanceCulling.h".}
proc GetNumberOfLOD*(this: var vtkOpenGLInstanceCulling): vtkIdType {.
    importcpp: "GetNumberOfLOD", header: "vtkOpenGLInstanceCulling.h".}
proc GetLODBuffer*(this: var vtkOpenGLInstanceCulling; index: vtkIdType): ptr vtkOpenGLBufferObject {.
    importcpp: "GetLODBuffer", header: "vtkOpenGLInstanceCulling.h".}
proc RunCullingShaders*(this: var vtkOpenGLInstanceCulling; numInstances: vtkIdType;
                       matrixBuffer: ptr vtkOpenGLBufferObject;
                       colorBuffer: ptr vtkOpenGLBufferObject;
                       normalBuffer: ptr vtkOpenGLBufferObject) {.
    importcpp: "RunCullingShaders", header: "vtkOpenGLInstanceCulling.h".}
proc SetColorLOD*(this: var vtkOpenGLInstanceCulling; _arg: bool) {.
    importcpp: "SetColorLOD", header: "vtkOpenGLInstanceCulling.h".}
## !!!Ignored construct:  virtual bool GetColorLOD ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ColorLOD  of  << this -> ColorLOD ) ; return this -> ColorLOD ; } ;
## Error: expected ';'!!!
