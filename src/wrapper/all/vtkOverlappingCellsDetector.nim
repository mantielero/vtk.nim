## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOverlappingCellsDetector.h
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
##  @class vtkOverlappingCellsDetector
##  @brief Exposes how many cells each cell of the input collide.
##
##  This filter performs a cell collision detection between the cells of the input.
##  This detection takes the form of a cell array of double. Its name can be
##  reached from the static string attribute
##  vtkOverlappingCellsDetector::NumberOfOverlapsPerCell.
##
##  To detect collisions, coarse bounding spheres are estimated for each cell of the input.
##  The center of those spheres is stored in a point cloud which is used to find potential
##  colliding cells candidates, querying with twice the bounding sphere radius to ensure
##  we do not miss other bouding sphere centers. Duplicate intersections might appear during
##  this process, so a sphere id map is stored to avoid adding already added overlapping cell ids.
##
##  This filter works in a multi-process environment. When so, each cell of the input
##  whose bounding sphere and bounding box intersects another process is added in
##  a temporary `vtkUnstructuredGrid` being sent to this process. Cell collision
##  is then performed, and the collision id map is sent back. This map is then
##  read to look if any of those cells were not already counted (local process
##  could have spotted the same collision from
##  the cells sent by the other process indeed). One cell id collision map is stored
##  per neighbor process to avoid cell id collision.
##
##  The user can set a `Tolerance` parameter. It is set by default to zero. When
##  it is equal to zero or is lower to floating point precision,
##  then floating point precision is used to compute cell
##  overlaps. If it is not set to zero, then each cells are deflated by `0.5 *
##  Tolerance` before the overlaps are computed. The deflation is computed using
##  `vtkCell::Inflate` with a negative parameter.
##

import
  vtkFiltersParallelDIY2Module, vtkPassInputTypeAlgorithm, vtkBoundingBox

discard "forward decl of vtkDataSet"
discard "forward decl of vtkMultiProcessController"
discard "forward decl of vtkPointSet"
type
  vtkOverlappingCellsDetector* {.importcpp: "vtkOverlappingCellsDetector",
                                header: "vtkOverlappingCellsDetector.h", bycopy.} = object of vtkPassInputTypeAlgorithm
    vtkOverlappingCellsDetector* {.importc: "vtkOverlappingCellsDetector".}: VTK_NEWINSTANCE
    ## *
    ##  Output cell scalar field counting the number of cells that each cell was found to collide.
    ##
    ## *
    ##  Tolerance for overlap detections. If its value is lower than floating point
    ##  precision, then floating point
    ##  precision is used as bound error for overlaps. If not, then cells are
    ##  deflated by 0.5 * Tolerance before checking the overlaps. Deflating a cell
    ##  by `x` means translating inward its edges / faces by a distance `x` following
    ##  the edge's / face's normal direction. `vtkCell::Inflate` is used with a
    ##  negative parameter.
    ##


proc New*(): ptr vtkOverlappingCellsDetector {.
    importcpp: "vtkOverlappingCellsDetector::New(@)",
    header: "vtkOverlappingCellsDetector.h".}
type
  vtkOverlappingCellsDetectorSuperclass* = vtkPassInputTypeAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOverlappingCellsDetector::IsTypeOf(@)",
    header: "vtkOverlappingCellsDetector.h".}
proc IsA*(this: var vtkOverlappingCellsDetector; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkOverlappingCellsDetector.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOverlappingCellsDetector {.
    importcpp: "vtkOverlappingCellsDetector::SafeDownCast(@)",
    header: "vtkOverlappingCellsDetector.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOverlappingCellsDetector :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPassInputTypeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOverlappingCellsDetector :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOverlappingCellsDetector :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOverlappingCellsDetector; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkOverlappingCellsDetector.h".}
proc SetController*(this: var vtkOverlappingCellsDetector;
                   a2: ptr vtkMultiProcessController) {.importcpp: "SetController",
    header: "vtkOverlappingCellsDetector.h".}
proc GetnameController*(this: var vtkOverlappingCellsDetector): ptr vtkMultiProcessController {.
    importcpp: "GetnameController", header: "vtkOverlappingCellsDetector.h".}
  ## /@}
  ## /@{
  ## *
  ##  Getter / Setter for the Tolerance parameter.
  ##
## !!!Ignored construct:  virtual double GetTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tolerance  of  << this -> Tolerance ) ; return this -> Tolerance ; } ;
## Error: expected ';'!!!

proc SetTolerance*(this: var vtkOverlappingCellsDetector; _arg: cdouble) {.
    importcpp: "SetTolerance", header: "vtkOverlappingCellsDetector.h".}
  ## /@}
  ## /@{
  ## *
  ##  Getter / Setter for the name of the output array counting cell collisions.
  ##  This array is a cell array.
  ##
proc GetNumberOfOverlapsPerCellArrayName*(this: var vtkOverlappingCellsDetector): cstring {.
    importcpp: "GetNumberOfOverlapsPerCellArrayName",
    header: "vtkOverlappingCellsDetector.h".}
proc SetNumberOfOverlapsPerCellArrayName*(this: var vtkOverlappingCellsDetector;
    _arg: cstring) {.importcpp: "SetNumberOfOverlapsPerCellArrayName",
                   header: "vtkOverlappingCellsDetector.h".}
  ## /@}