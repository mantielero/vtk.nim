## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExporter.h
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
##  @class   vtkExporter
##  @brief   abstract class to write a scene to a file
##
##  vtkExporter is an abstract class that exports a scene to a file. It
##  is very similar to vtkWriter except that a writer only writes out
##  the geometric and topological data for an object, where an exporter
##  can write out material properties, lighting, camera parameters etc.
##  The concrete subclasses of this class may not write out all of this
##  information. For example vtkOBJExporter writes out Wavefront obj files
##  which do not include support for camera parameters.
##
##  vtkExporter provides the convenience methods StartWrite() and EndWrite().
##  These methods are executed before and after execution of the Write()
##  method. You can also specify arguments to these methods.
##  This class defines SetInput and GetInput methods which take or return
##  a vtkRenderWindow.
##  @warning
##  Every subclass of vtkExporter must implement a WriteData() method.
##
##  @sa
##  vtkOBJExporter vtkRenderWindow vtkWriter
##

import
  vtkIOExportModule, vtkObject

discard "forward decl of vtkRenderWindow"
discard "forward decl of vtkRenderer"
type
  vtkExporter* {.importcpp: "vtkExporter", header: "vtkExporter.h", bycopy.} = object of vtkObject
    vtkExporter* {.importc: "vtkExporter".}: VTK_NEWINSTANCE

  vtkExporterSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkExporter::IsTypeOf(@)", header: "vtkExporter.h".}
proc IsA*(this: var vtkExporter; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkExporter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkExporter {.
    importcpp: "vtkExporter::SafeDownCast(@)", header: "vtkExporter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkExporter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExporter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExporter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkExporter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkExporter.h".}
proc Write*(this: var vtkExporter) {.importcpp: "Write", header: "vtkExporter.h".}
proc Update*(this: var vtkExporter) {.importcpp: "Update", header: "vtkExporter.h".}
proc SetRenderWindow*(this: var vtkExporter; a2: ptr vtkRenderWindow) {.
    importcpp: "SetRenderWindow", header: "vtkExporter.h".}
proc GetnameRenderWindow*(this: var vtkExporter): ptr vtkRenderWindow {.
    importcpp: "GetnameRenderWindow", header: "vtkExporter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the renderer that contains actors to be written.
  ##  If it is set to nullptr (by default), then in most subclasses
  ##  the behavior is to only export actors of the first renderer.
  ##  In some subclasses, if ActiveRenderer is nullptr then
  ##  actors of all renderers will be exported.
  ##  The renderer must be in the renderer collection of the specified
  ##  RenderWindow.
  ##  \sa SetRenderWindow()
  ##
proc SetActiveRenderer*(this: var vtkExporter; a2: ptr vtkRenderer) {.
    importcpp: "SetActiveRenderer", header: "vtkExporter.h".}
proc GetnameRenderWindowActiveRenderer*(this: var vtkExporter): ptr vtkRenderer {.
    importcpp: "GetnameRenderWindowActiveRenderer", header: "vtkExporter.h".}
  ## /@}
  ## /@{
  ## *
  ##  These methods are provided for backward compatibility. Will disappear
  ##  soon.
  ##
proc SetInput*(this: var vtkExporter; renWin: ptr vtkRenderWindow) {.
    importcpp: "SetInput", header: "vtkExporter.h".}
proc GetInput*(this: var vtkExporter): ptr vtkRenderWindow {.importcpp: "GetInput",
    header: "vtkExporter.h".}
proc SetStartWrite*(this: var vtkExporter; f: proc (a1: pointer); arg: pointer) {.
    importcpp: "SetStartWrite", header: "vtkExporter.h".}
proc SetEndWrite*(this: var vtkExporter; f: proc (a1: pointer); arg: pointer) {.
    importcpp: "SetEndWrite", header: "vtkExporter.h".}
proc SetStartWriteArgDelete*(this: var vtkExporter; f: proc (a1: pointer)) {.
    importcpp: "SetStartWriteArgDelete", header: "vtkExporter.h".}
proc SetEndWriteArgDelete*(this: var vtkExporter; f: proc (a1: pointer)) {.
    importcpp: "SetEndWriteArgDelete", header: "vtkExporter.h".}
proc GetMTime*(this: var vtkExporter): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkExporter.h".}