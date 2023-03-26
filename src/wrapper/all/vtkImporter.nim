## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImporter.h
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
##  @class   vtkImporter
##  @brief   importer abstract class
##
##  vtkImporter is an abstract class that specifies the protocol for
##  importing actors, cameras, lights and properties into a
##  vtkRenderWindow. The following takes place:
##  1) Create a RenderWindow and Renderer if none is provided.
##  2) Call ImportBegin, if ImportBegin returns False, return
##  3) Call ReadData, which calls:
##   a) Import the Actors
##   b) Import the cameras
##   c) Import the lights
##   d) Import the Properties
##  7) Call ImportEnd
##
##  Subclasses optionally implement the ImportActors, ImportCameras,
##  ImportLights and ImportProperties or ReadData methods. An ImportBegin and
##  ImportEnd can optionally be provided to perform Importer-specific
##  initialization and termination.  The Read method initiates the import
##  process. If a RenderWindow is provided, its Renderer will contained
##  the imported objects. If the RenderWindow has no Renderer, one is
##  created. If no RenderWindow is provided, both a RenderWindow and
##  Renderer will be created. Both the RenderWindow and Renderer can be
##  accessed using Get methods.
##
##  @sa
##  vtk3DSImporter vtkExporter
##

import
  vtkIOImportModule, vtkObject

discard "forward decl of vtkAbstractArray"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkRenderWindow"
discard "forward decl of vtkRenderer"
type
  vtkImporter* {.importcpp: "vtkImporter", header: "vtkImporter.h", bycopy.} = object of vtkObject
    vtkImporter* {.importc: "vtkImporter".}: VTK_NEWINSTANCE

  vtkImporterSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImporter::IsTypeOf(@)", header: "vtkImporter.h".}
proc IsA*(this: var vtkImporter; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkImporter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImporter {.
    importcpp: "vtkImporter::SafeDownCast(@)", header: "vtkImporter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImporter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImporter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImporter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImporter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImporter.h".}
proc GetnameRenderer*(this: var vtkImporter): ptr vtkRenderer {.
    importcpp: "GetnameRenderer", header: "vtkImporter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the vtkRenderWindow to contain the imported actors, cameras and
  ##  lights, If no vtkRenderWindow is set, one will be created and can be
  ##  obtained with the GetRenderWindow method. If the vtkRenderWindow has been
  ##  specified, the first vtkRenderer it has will be used to import the
  ##  objects. If the vtkRenderWindow has no Renderer, one will be created and
  ##  can be accessed using GetRenderer.
  ##
proc SetRenderWindow*(this: var vtkImporter; a2: ptr vtkRenderWindow) {.
    importcpp: "SetRenderWindow", header: "vtkImporter.h".}
proc GetnameRendererRenderWindow*(this: var vtkImporter): ptr vtkRenderWindow {.
    importcpp: "GetnameRendererRenderWindow", header: "vtkImporter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Import the actors, cameras, lights and properties into a vtkRenderWindow.
  ##
proc Read*(this: var vtkImporter) {.importcpp: "Read", header: "vtkImporter.h".}
proc Update*(this: var vtkImporter) {.importcpp: "Update", header: "vtkImporter.h".}
proc GetOutputsDescription*(this: var vtkImporter): string {.
    importcpp: "GetOutputsDescription", header: "vtkImporter.h".}
proc GetNumberOfAnimations*(this: var vtkImporter): vtkIdType {.
    importcpp: "GetNumberOfAnimations", header: "vtkImporter.h".}
proc GetAnimationName*(this: var vtkImporter;
                      vtkNotUsed: proc (a1: animationIndex): vtkIdType): string {.
    importcpp: "GetAnimationName", header: "vtkImporter.h".}
proc EnableAnimation*(this: var vtkImporter;
                     vtkNotUsed: proc (a1: animationIndex): vtkIdType) {.
    importcpp: "EnableAnimation", header: "vtkImporter.h".}
proc DisableAnimation*(this: var vtkImporter;
                      vtkNotUsed: proc (a1: animationIndex): vtkIdType) {.
    importcpp: "DisableAnimation", header: "vtkImporter.h".}
proc IsAnimationEnabled*(this: var vtkImporter;
                        vtkNotUsed: proc (a1: animationIndex): vtkIdType): bool {.
    importcpp: "IsAnimationEnabled", header: "vtkImporter.h".}
proc GetNumberOfCameras*(this: var vtkImporter): vtkIdType {.
    importcpp: "GetNumberOfCameras", header: "vtkImporter.h".}
proc GetCameraName*(this: var vtkImporter;
                   vtkNotUsed: proc (a1: camIndex): vtkIdType): string {.
    importcpp: "GetCameraName", header: "vtkImporter.h".}
proc SetCamera*(this: var vtkImporter; vtkNotUsed: proc (a1: camIndex): vtkIdType) {.
    importcpp: "SetCamera", header: "vtkImporter.h".}
proc GetTemporalInformation*(this: var vtkImporter; animationIndex: vtkIdType;
                            frameRate: cdouble; nbTimeSteps: var cint;
                            timeRange: array[2, cdouble];
                            timeSteps: ptr vtkDoubleArray): bool {.
    importcpp: "GetTemporalInformation", header: "vtkImporter.h".}
proc UpdateTimeStep*(this: var vtkImporter; timeStep: cdouble) {.
    importcpp: "UpdateTimeStep", header: "vtkImporter.h".}