## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkContourTriangulator.h
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
##  @class   vtkContourTriangulator
##  @brief   Fill all 2D contours to create polygons
##
##  vtkContourTriangulator will generate triangles to fill all of the 2D
##  contours in its input. The input to the filter is a set of lines (not
##  polylines) which when joined form loops. The contours may be concave, and
##  may even contain holes i.e. a contour may contain an internal contour that
##  is wound in the opposite direction (as compared to the outer polygon
##  normal) to indicate that it is a hole.
##
##  @warning
##  The triangulation of is done in O(n) time for simple convex
##  inputs, but for non-convex inputs the worst-case time is O(n^2*m^2)
##  where n is the number of points and m is the number of holes.
##  The best triangulation algorithms, in contrast, are O(n log n).
##  The resulting triangles may be quite narrow, the algorithm does
##  not attempt to produce high-quality triangles.
##
##  @sa
##  vtkClipClosedSurface vtkPolygon
##
##  @par Thanks:
##  Thanks to David Gobbi for contributing this class to VTK.
##

import
  vtkFiltersGeneralModule, vtkPolyDataAlgorithm

discard "forward decl of vtkCellArray"
discard "forward decl of vtkIdList"
type
  vtkContourTriangulator* {.importcpp: "vtkContourTriangulator",
                           header: "vtkContourTriangulator.h", bycopy.} = object of vtkPolyDataAlgorithm ## /@{
                                                                                                  ## *
                                                                                                  ##  Standard methods for instantiation, obtaining type information, and printing.
                                                                                                  ##
    vtkContourTriangulator* {.importc: "vtkContourTriangulator".}: VTK_NEWINSTANCE


proc New*(): ptr vtkContourTriangulator {.importcpp: "vtkContourTriangulator::New(@)",
                                      header: "vtkContourTriangulator.h".}
type
  vtkContourTriangulatorSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkContourTriangulator::IsTypeOf(@)",
    header: "vtkContourTriangulator.h".}
proc IsA*(this: var vtkContourTriangulator; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkContourTriangulator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkContourTriangulator {.
    importcpp: "vtkContourTriangulator::SafeDownCast(@)",
    header: "vtkContourTriangulator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkContourTriangulator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkContourTriangulator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkContourTriangulator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkContourTriangulator; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkContourTriangulator.h".}
## !!!Ignored construct:  /@} /@{ *
##  Check if there was a triangulation failure in the last update.
##  virtual int GetTriangulationErrorTriangulationError ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TriangulationError  of  << this -> TriangulationError ) ; return this -> TriangulationError ; } ;
## Error: expected ';'!!!

proc SetTriangulationErrorDisplay*(this: var vtkContourTriangulator;
                                  _arg: vtkTypeBool) {.
    importcpp: "SetTriangulationErrorDisplay", header: "vtkContourTriangulator.h".}
proc TriangulationErrorDisplayOn*(this: var vtkContourTriangulator) {.
    importcpp: "TriangulationErrorDisplayOn", header: "vtkContourTriangulator.h".}
proc TriangulationErrorDisplayOff*(this: var vtkContourTriangulator) {.
    importcpp: "TriangulationErrorDisplayOff", header: "vtkContourTriangulator.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetTriangulationErrorTriangulationErrorTriangulationErrorDisplay ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TriangulationErrorDisplay  of  << this -> TriangulationErrorDisplay ) ; return this -> TriangulationErrorDisplay ; } ;
## Error: expected ';'!!!

proc TriangulatePolygon*(polygon: ptr vtkIdList; points: ptr vtkPoints;
                        triangles: ptr vtkCellArray): cint {.
    importcpp: "vtkContourTriangulator::TriangulatePolygon(@)",
    header: "vtkContourTriangulator.h".}
proc TriangulateContours*(data: ptr vtkPolyData; firstLine: vtkIdType;
                         numLines: vtkIdType; outputPolys: ptr vtkCellArray;
                         normal: array[3, cdouble]): cint {.
    importcpp: "vtkContourTriangulator::TriangulateContours(@)",
    header: "vtkContourTriangulator.h".}