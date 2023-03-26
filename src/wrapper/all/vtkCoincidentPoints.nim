## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCoincidentPoints.h
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
##  @class   vtkCoincidentPoints
##  @brief   contains an octree of labels
##
##
##  This class provides a collection of points that is organized such that
##  each coordinate is stored with a set of point id's of points that are
##  all coincident.
##

import
  vtkFiltersGeneralModule, vtkObject

discard "forward decl of vtkIdList"
discard "forward decl of vtkPoints"
type
  vtkCoincidentPoints* {.importcpp: "vtkCoincidentPoints",
                        header: "vtkCoincidentPoints.h", bycopy.} = object of vtkObject
    vtkCoincidentPoints* {.importc: "vtkCoincidentPoints".}: VTK_NEWINSTANCE


proc New*(): ptr vtkCoincidentPoints {.importcpp: "vtkCoincidentPoints::New(@)",
                                   header: "vtkCoincidentPoints.h".}
type
  vtkCoincidentPointsSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCoincidentPoints::IsTypeOf(@)", header: "vtkCoincidentPoints.h".}
proc IsA*(this: var vtkCoincidentPoints; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkCoincidentPoints.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCoincidentPoints {.
    importcpp: "vtkCoincidentPoints::SafeDownCast(@)",
    header: "vtkCoincidentPoints.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCoincidentPoints :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCoincidentPoints :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCoincidentPoints :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCoincidentPoints; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCoincidentPoints.h".}
proc AddPoint*(this: var vtkCoincidentPoints; Id: vtkIdType; point: array[3, cdouble]) {.
    importcpp: "AddPoint", header: "vtkCoincidentPoints.h".}
proc GetCoincidentPointIds*(this: var vtkCoincidentPoints; point: array[3, cdouble]): ptr vtkIdList {.
    importcpp: "GetCoincidentPointIds", header: "vtkCoincidentPoints.h".}
proc GetNextCoincidentPointIds*(this: var vtkCoincidentPoints): ptr vtkIdList {.
    importcpp: "GetNextCoincidentPointIds", header: "vtkCoincidentPoints.h".}
proc InitTraversal*(this: var vtkCoincidentPoints) {.importcpp: "InitTraversal",
    header: "vtkCoincidentPoints.h".}
proc RemoveNonCoincidentPoints*(this: var vtkCoincidentPoints) {.
    importcpp: "RemoveNonCoincidentPoints", header: "vtkCoincidentPoints.h".}
proc Clear*(this: var vtkCoincidentPoints) {.importcpp: "Clear",
    header: "vtkCoincidentPoints.h".}
discard "forward decl of implementation"
proc GetImplementation*(this: var vtkCoincidentPoints): ptr vtkCoincidentPointsimplementation {.
    importcpp: "GetImplementation", header: "vtkCoincidentPoints.h".}
proc SpiralPoints*(num: vtkIdType; offsets: ptr vtkPoints) {.
    importcpp: "vtkCoincidentPoints::SpiralPoints(@)",
    header: "vtkCoincidentPoints.h".}