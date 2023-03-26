## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTerrainContourLineInterpolator.h
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
##  @class   vtkTerrainContourLineInterpolator
##  @brief   Contour interpolator for DEM data.
##
##
##  vtkTerrainContourLineInterpolator interpolates nodes on height field data.
##  The class is meant to be used in conjunciton with a vtkContourWidget,
##  enabling you to draw paths on terrain data. The class internally uses a
##  vtkProjectedTerrainPath. Users can set kind of interpolation
##  desired between two node points by setting the modes of the this filter.
##  For instance:
##
##  \code
##  contourRepresentation->SetLineInterpolator(interpolator);
##  interpolator->SetImageData( demDataFile );
##  interpolator->GetProjector()->SetProjectionModeToHug();
##  interpolator->SetHeightOffset(25.0);
##  \endcode
##
##  You are required to set the ImageData to this class as the height-field
##  image.
##
##  @sa
##  vtkTerrainDataPointPlacer vtkProjectedTerrainPath
##

import
  vtkContourLineInterpolator, vtkInteractionWidgetsModule

discard "forward decl of vtkImageData"
discard "forward decl of vtkProjectedTerrainPath"
type
  vtkTerrainContourLineInterpolator* {.importcpp: "vtkTerrainContourLineInterpolator", header: "vtkTerrainContourLineInterpolator.h",
                                      bycopy.} = object of vtkContourLineInterpolator ## *
                                                                                 ##  Instantiate this class.
                                                                                 ##
    vtkTerrainContourLineInterpolator* {.importc: "vtkTerrainContourLineInterpolator".}: VTK_NEWINSTANCE
    ##  height field data


proc New*(): ptr vtkTerrainContourLineInterpolator {.
    importcpp: "vtkTerrainContourLineInterpolator::New(@)",
    header: "vtkTerrainContourLineInterpolator.h".}
type
  vtkTerrainContourLineInterpolatorSuperclass* = vtkContourLineInterpolator

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTerrainContourLineInterpolator::IsTypeOf(@)",
    header: "vtkTerrainContourLineInterpolator.h".}
proc IsA*(this: var vtkTerrainContourLineInterpolator; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTerrainContourLineInterpolator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTerrainContourLineInterpolator {.
    importcpp: "vtkTerrainContourLineInterpolator::SafeDownCast(@)",
    header: "vtkTerrainContourLineInterpolator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTerrainContourLineInterpolator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkContourLineInterpolator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTerrainContourLineInterpolator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTerrainContourLineInterpolator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTerrainContourLineInterpolator; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkTerrainContourLineInterpolator.h".}
proc InterpolateLine*(this: var vtkTerrainContourLineInterpolator;
                     ren: ptr vtkRenderer; rep: ptr vtkContourRepresentation;
                     idx1: cint; idx2: cint): cint {.importcpp: "InterpolateLine",
    header: "vtkTerrainContourLineInterpolator.h".}
proc UpdateNode*(this: var vtkTerrainContourLineInterpolator; a2: ptr vtkRenderer;
                a3: ptr vtkContourRepresentation;
                vtkNotUsed: proc (a1: node): ptr cdouble;
                vtkNotUsed: proc (a1: idx): cint): cint {.importcpp: "UpdateNode",
    header: "vtkTerrainContourLineInterpolator.h".}
proc SetImageData*(this: var vtkTerrainContourLineInterpolator; a2: ptr vtkImageData) {.
    importcpp: "SetImageData", header: "vtkTerrainContourLineInterpolator.h".}
proc GetnameImageData*(this: var vtkTerrainContourLineInterpolator): ptr vtkImageData {.
    importcpp: "GetnameImageData", header: "vtkTerrainContourLineInterpolator.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the vtkProjectedTerrainPath operator used to project the terrain
  ##  onto the data. This operator has several modes, See the documentation
  ##  of vtkProjectedTerrainPath. The default mode is to hug the terrain
  ##  data at 0 height offset.
  ##
proc GetnameImageDataProjector*(this: var vtkTerrainContourLineInterpolator): ptr vtkProjectedTerrainPath {.
    importcpp: "GetnameImageDataProjector",
    header: "vtkTerrainContourLineInterpolator.h".}
  ## /@}