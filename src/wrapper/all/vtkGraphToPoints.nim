## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGraphToPoints.h
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
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkGraphToPoints
##  @brief   convert a vtkGraph a set of points.
##
##
##  Converts a vtkGraph to a vtkPolyData containing a set of points.
##  This assumes that the points
##  of the graph have already been filled (perhaps by vtkGraphLayout).
##  The vertex data is passed along to the point data.
##

import
  vtkFiltersGeneralModule, vtkPolyDataAlgorithm

type
  vtkGraphToPoints* {.importcpp: "vtkGraphToPoints", header: "vtkGraphToPoints.h",
                     bycopy.} = object of vtkPolyDataAlgorithm
    vtkGraphToPoints* {.importc: "vtkGraphToPoints".}: VTK_NEWINSTANCE


proc New*(): ptr vtkGraphToPoints {.importcpp: "vtkGraphToPoints::New(@)",
                                header: "vtkGraphToPoints.h".}
type
  vtkGraphToPointsSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGraphToPoints::IsTypeOf(@)", header: "vtkGraphToPoints.h".}
proc IsA*(this: var vtkGraphToPoints; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkGraphToPoints.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGraphToPoints {.
    importcpp: "vtkGraphToPoints::SafeDownCast(@)", header: "vtkGraphToPoints.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGraphToPoints :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGraphToPoints :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGraphToPoints :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGraphToPoints; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGraphToPoints.h".}