## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLogoRepresentation.h
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
##  @class   vtkLogoRepresentation
##  @brief   represent the vtkLogoWidget
##
##
##  This class provides support for interactively positioning a logo. A logo
##  is defined by an instance of vtkImage. The properties of the image,
##  including transparency, can be set with an instance of vtkProperty2D. To
##  position the logo, use the superclass's Position and Position2 coordinates.
##
##  @sa
##  vtkLogoWidget
##

import
  vtkBorderRepresentation, vtkInteractionWidgetsModule

discard "forward decl of vtkImageData"
discard "forward decl of vtkImageProperty"
discard "forward decl of vtkTexture"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkPoionts"
discard "forward decl of vtkPolyDataMapper2D"
discard "forward decl of vtkTexturedActor2D"
discard "forward decl of vtkProperty2D"
type
  vtkLogoRepresentation* {.importcpp: "vtkLogoRepresentation",
                          header: "vtkLogoRepresentation.h", bycopy.} = object of vtkBorderRepresentation ## *
                                                                                                   ##  Instantiate this class.
                                                                                                   ##
    vtkLogoRepresentation* {.importc: "vtkLogoRepresentation".}: VTK_NEWINSTANCE
    ##  Represent the image
    ##  Helper methods


proc New*(): ptr vtkLogoRepresentation {.importcpp: "vtkLogoRepresentation::New(@)",
                                     header: "vtkLogoRepresentation.h".}
type
  vtkLogoRepresentationSuperclass* = vtkBorderRepresentation

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkLogoRepresentation::IsTypeOf(@)",
    header: "vtkLogoRepresentation.h".}
proc IsA*(this: var vtkLogoRepresentation; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkLogoRepresentation.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkLogoRepresentation {.
    importcpp: "vtkLogoRepresentation::SafeDownCast(@)",
    header: "vtkLogoRepresentation.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkLogoRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkBorderRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLogoRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLogoRepresentation :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkLogoRepresentation; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkLogoRepresentation.h".}
proc SetImage*(this: var vtkLogoRepresentation; img: ptr vtkImageData) {.
    importcpp: "SetImage", header: "vtkLogoRepresentation.h".}
proc GetnameImage*(this: var vtkLogoRepresentation): ptr vtkImageData {.
    importcpp: "GetnameImage", header: "vtkLogoRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get the image property (relevant only if an image is shown).
  ##
proc SetImageProperty*(this: var vtkLogoRepresentation; p: ptr vtkProperty2D) {.
    importcpp: "SetImageProperty", header: "vtkLogoRepresentation.h".}
proc GetnameImageImageProperty*(this: var vtkLogoRepresentation): ptr vtkProperty2D {.
    importcpp: "GetnameImageImageProperty", header: "vtkLogoRepresentation.h".}
  ## /@}
  ## *
  ##  Satisfy the superclasses' API.
  ##
proc BuildRepresentation*(this: var vtkLogoRepresentation) {.
    importcpp: "BuildRepresentation", header: "vtkLogoRepresentation.h".}
proc GetActors2D*(this: var vtkLogoRepresentation; pc: ptr vtkPropCollection) {.
    importcpp: "GetActors2D", header: "vtkLogoRepresentation.h".}
proc ReleaseGraphicsResources*(this: var vtkLogoRepresentation; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkLogoRepresentation.h".}
proc RenderOverlay*(this: var vtkLogoRepresentation; a2: ptr vtkViewport): cint {.
    importcpp: "RenderOverlay", header: "vtkLogoRepresentation.h".}