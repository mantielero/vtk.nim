## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImplicitImageRepresentation.h
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
##  @class   vtkImplicitImageRepresentation
##  @brief   a representation for a vtkImplicitPlaneWidget2 which reslices a volume
##
##  This class is a specialization of the vtkImplicitPlaneRepresentation. It
##  is specialized to resample volumes across a plane. It is similar to
##  vtkImagePlaneWidget, except the combination of vtkImplicitPlaneWidget2 and
##  vtkImplicitImageRepresentation is a second generation widget design, with
##  a much simpler and intuitive plane manipulation.
##
##  See the documentation for vtkImplicitPlaneWidget2 and
##  vtkImplicitPlaneRepresentation for usage information. One notable difference
##  is that the methods PlaceImage() are preferred to the superclasses'
##  PlaceWidget() method.
##
##  @sa
##  vtkImplicitPlaneWidget2 vtkImagePlaneWidget
##

import
  vtkImagePlaneWidget, vtkImplicitPlaneRepresentation, vtkInteractionWidgetsModule

discard "forward decl of vtkActor"
discard "forward decl of vtkImageData"
discard "forward decl of vtkImageMapToColors"
discard "forward decl of vtkImageReslice"
discard "forward decl of vtkLookupTable"
discard "forward decl of vtkMatrix4x4"
discard "forward decl of vtkTexture"
discard "forward decl of vtkTextureMapToPlane"
type
  vtkImplicitImageRepresentation* {.importcpp: "vtkImplicitImageRepresentation",
                                   header: "vtkImplicitImageRepresentation.h",
                                   bycopy.} = object of vtkImplicitPlaneRepresentation ## *
                                                                                  ##  Instantiate the class.
                                                                                  ##
    vtkImplicitImageRepresentation* {.importc: "vtkImplicitImageRepresentation".}: VTK_NEWINSTANCE
    ##  These classes implement the imaging pipeline. Note that we
    ##  use the superclass plane to draw the image texture.


proc New*(): ptr vtkImplicitImageRepresentation {.
    importcpp: "vtkImplicitImageRepresentation::New(@)",
    header: "vtkImplicitImageRepresentation.h".}
type
  vtkImplicitImageRepresentationSuperclass* = vtkImplicitPlaneRepresentation

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImplicitImageRepresentation::IsTypeOf(@)",
    header: "vtkImplicitImageRepresentation.h".}
proc IsA*(this: var vtkImplicitImageRepresentation; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImplicitImageRepresentation.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImplicitImageRepresentation {.
    importcpp: "vtkImplicitImageRepresentation::SafeDownCast(@)",
    header: "vtkImplicitImageRepresentation.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImplicitImageRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImplicitPlaneRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImplicitImageRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImplicitImageRepresentation :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImplicitImageRepresentation; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkImplicitImageRepresentation.h".}
proc PlaceImage*(this: var vtkImplicitImageRepresentation; img: ptr vtkImageData) {.
    importcpp: "PlaceImage", header: "vtkImplicitImageRepresentation.h".}
proc PlaceImage*(this: var vtkImplicitImageRepresentation;
                aout: ptr vtkAlgorithmOutput) {.importcpp: "PlaceImage",
    header: "vtkImplicitImageRepresentation.h".}
proc BuildRepresentation*(this: var vtkImplicitImageRepresentation) {.
    importcpp: "BuildRepresentation", header: "vtkImplicitImageRepresentation.h".}
proc SetUserControlledLookupTable*(this: var vtkImplicitImageRepresentation;
                                  _arg: bool) {.
    importcpp: "SetUserControlledLookupTable",
    header: "vtkImplicitImageRepresentation.h".}
## !!!Ignored construct:  virtual bool GetUserControlledLookupTable ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UserControlledLookupTable  of  << this -> UserControlledLookupTable ) ; return this -> UserControlledLookupTable ; } ;
## Error: expected ';'!!!

proc UserControlledLookupTableOn*(this: var vtkImplicitImageRepresentation) {.
    importcpp: "UserControlledLookupTableOn",
    header: "vtkImplicitImageRepresentation.h".}
proc UserControlledLookupTableOff*(this: var vtkImplicitImageRepresentation) {.
    importcpp: "UserControlledLookupTableOff",
    header: "vtkImplicitImageRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the internal lookuptable (lut) to one defined by the user, or,
  ##  alternatively, to the lut of another representation or widget.  In this way,
  ##  a set of three orthogonal planes can share the same lut so that
  ##  window-levelling is performed uniformly among planes.  The default
  ##  internal lut can be re- set/allocated by setting to nullptr.
  ##
proc SetLookupTable*(this: var vtkImplicitImageRepresentation;
                    a2: ptr vtkLookupTable) {.importcpp: "SetLookupTable",
    header: "vtkImplicitImageRepresentation.h".}
proc GetnameLookupTable*(this: var vtkImplicitImageRepresentation): ptr vtkLookupTable {.
    importcpp: "GetnameLookupTable", header: "vtkImplicitImageRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify whether to interpolate the texture or not. When off, the
  ##  reslice interpolation is nearest neighbour regardless of how the
  ##  interpolation is set through the API. Set before setting the
  ##  vtkImageData input. Default is On.
  ##
proc SetUserControlledLookupTableTextureInterpolate*(
    this: var vtkImplicitImageRepresentation; _arg: bool) {.
    importcpp: "SetUserControlledLookupTableTextureInterpolate",
    header: "vtkImplicitImageRepresentation.h".}
## !!!Ignored construct:  virtual bool GetUserControlledLookupTableTextureInterpolate ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TextureInterpolate  of  << this -> TextureInterpolate ) ; return this -> TextureInterpolate ; } ;
## Error: expected ';'!!!

proc TextureInterpolateOn*(this: var vtkImplicitImageRepresentation) {.
    importcpp: "TextureInterpolateOn", header: "vtkImplicitImageRepresentation.h".}
proc TextureInterpolateOff*(this: var vtkImplicitImageRepresentation) {.
    importcpp: "TextureInterpolateOff", header: "vtkImplicitImageRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the interpolation to use when texturing the plane.
  ##
proc SetResliceInterpolate*(this: var vtkImplicitImageRepresentation; a2: cint) {.
    importcpp: "SetResliceInterpolate", header: "vtkImplicitImageRepresentation.h".}
## !!!Ignored construct:  virtual int GetUserControlledLookupTableTextureInterpolateResliceInterpolate ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ResliceInterpolate  of  << this -> ResliceInterpolate ) ; return this -> ResliceInterpolate ; } ;
## Error: expected ';'!!!

proc SetResliceInterpolateToNearestNeighbour*(
    this: var vtkImplicitImageRepresentation) {.
    importcpp: "SetResliceInterpolateToNearestNeighbour",
    header: "vtkImplicitImageRepresentation.h".}
proc SetResliceInterpolateToLinear*(this: var vtkImplicitImageRepresentation) {.
    importcpp: "SetResliceInterpolateToLinear",
    header: "vtkImplicitImageRepresentation.h".}
proc SetResliceInterpolateToCubic*(this: var vtkImplicitImageRepresentation) {.
    importcpp: "SetResliceInterpolateToCubic",
    header: "vtkImplicitImageRepresentation.h".}
proc SetColorMap*(this: var vtkImplicitImageRepresentation;
                 a2: ptr vtkImageMapToColors) {.importcpp: "SetColorMap",
    header: "vtkImplicitImageRepresentation.h".}
proc GetnameLookupTableColorMap*(this: var vtkImplicitImageRepresentation): ptr vtkImageMapToColors {.
    importcpp: "GetnameLookupTableColorMap",
    header: "vtkImplicitImageRepresentation.h".}
  ## /@}
  ## *
  ##  Convenience method to get the vtkImageReslice filter used by this
  ##  widget.
  ##
proc GetnameLookupTableColorMapReslice*(this: var vtkImplicitImageRepresentation): ptr vtkImageReslice {.
    importcpp: "GetnameLookupTableColorMapReslice",
    header: "vtkImplicitImageRepresentation.h".}
  ## *
  ##  This method modifies the texture pipeline in order to generate texture
  ##  coordinates.
  ##
proc SetCropPlaneToBoundingBox*(this: var vtkImplicitImageRepresentation; a2: bool) {.
    importcpp: "SetCropPlaneToBoundingBox",
    header: "vtkImplicitImageRepresentation.h".}