## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDijkstraImageContourLineInterpolator.h
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
##  @class   vtkDijkstraImageContourLineInterpolator
##  @brief   Contour interpolator for placing points on an image.
##
##
##  vtkDijkstraImageContourLineInterpolator interpolates and places
##  contour points on images. The class interpolates nodes by
##  computing a graph laying on the image data. By graph, we mean
##  that the line interpolating the two end points traverses along
##  pixels so as to form a shortest path. A Dijkstra algorithm is
##  used to compute the path.
##
##  The class is meant to be used in conjunction with
##  vtkImageActorPointPlacer. One reason for this coupling is a
##  performance issue: both classes need to perform a cell pick, and
##  coupling avoids multiple cell picks (cell picks are slow).  Another
##  issue is that the interpolator may need to set the image input to
##  its vtkDijkstraImageGeodesicPath ivar.
##
##  @sa
##  vtkContourWidget vtkContourLineInterpolator vtkDijkstraImageGeodesicPath
##

import
  vtkContourLineInterpolator, vtkInteractionWidgetsModule

discard "forward decl of vtkDijkstraImageGeodesicPath"
discard "forward decl of vtkImageData"
type
  vtkDijkstraImageContourLineInterpolator* {.
      importcpp: "vtkDijkstraImageContourLineInterpolator",
      header: "vtkDijkstraImageContourLineInterpolator.h", bycopy.} = object of vtkContourLineInterpolator ## /@{
                                                                                                    ## *
                                                                                                    ##  Standard methods for instances of this class.
                                                                                                    ##
    vtkDijkstraImageContourLineInterpolator*
        {.importc: "vtkDijkstraImageContourLineInterpolator".}: VTK_NEWINSTANCE

  vtkDijkstraImageContourLineInterpolatorSuperclass* = vtkContourLineInterpolator

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDijkstraImageContourLineInterpolator::IsTypeOf(@)",
    header: "vtkDijkstraImageContourLineInterpolator.h".}
proc IsA*(this: var vtkDijkstraImageContourLineInterpolator; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkDijkstraImageContourLineInterpolator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDijkstraImageContourLineInterpolator {.
    importcpp: "vtkDijkstraImageContourLineInterpolator::SafeDownCast(@)",
    header: "vtkDijkstraImageContourLineInterpolator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDijkstraImageContourLineInterpolator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkContourLineInterpolator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDijkstraImageContourLineInterpolator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDijkstraImageContourLineInterpolator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDijkstraImageContourLineInterpolator; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkDijkstraImageContourLineInterpolator.h".}
proc New*(): ptr vtkDijkstraImageContourLineInterpolator {.
    importcpp: "vtkDijkstraImageContourLineInterpolator::New(@)",
    header: "vtkDijkstraImageContourLineInterpolator.h".}
proc InterpolateLine*(this: var vtkDijkstraImageContourLineInterpolator;
                     ren: ptr vtkRenderer; rep: ptr vtkContourRepresentation;
                     idx1: cint; idx2: cint): cint {.importcpp: "InterpolateLine",
    header: "vtkDijkstraImageContourLineInterpolator.h".}
proc SetCostImage*(this: var vtkDijkstraImageContourLineInterpolator;
                  a2: ptr vtkImageData) {.importcpp: "SetCostImage", header: "vtkDijkstraImageContourLineInterpolator.h".}
proc GetnameCostImage*(this: var vtkDijkstraImageContourLineInterpolator): ptr vtkImageData {.
    importcpp: "GetnameCostImage",
    header: "vtkDijkstraImageContourLineInterpolator.h".}
  ## /@}
  ## /@{
  ## *
  ##  access to the internal dijkstra path
  ##
proc GetnameCostImageDijkstraImageGeodesicPath*(
    this: var vtkDijkstraImageContourLineInterpolator): ptr vtkDijkstraImageGeodesicPath {.
    importcpp: "GetnameCostImageDijkstraImageGeodesicPath",
    header: "vtkDijkstraImageContourLineInterpolator.h".}
  ## /@}