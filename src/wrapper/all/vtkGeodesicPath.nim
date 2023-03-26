## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGeodesicPath.h
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
##  @class   vtkGeodesicPath
##  @brief   Abstract base for classes that generate a geodesic path
##
##  Serves as a base class for algorithms that trace a geodesic path on a
##  polygonal dataset.
##

import
  vtkFiltersModelingModule, vtkPolyDataAlgorithm

discard "forward decl of vtkPolyData"
type
  vtkGeodesicPath* {.importcpp: "vtkGeodesicPath", header: "vtkGeodesicPath.h",
                    bycopy.} = object of vtkPolyDataAlgorithm ## /@{
                                                         ## *
                                                         ##  Standard methods for printing and determining type information.
                                                         ##
    vtkGeodesicPath* {.importc: "vtkGeodesicPath".}: VTK_NEWINSTANCE

  vtkGeodesicPathSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGeodesicPath::IsTypeOf(@)", header: "vtkGeodesicPath.h".}
proc IsA*(this: var vtkGeodesicPath; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkGeodesicPath.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGeodesicPath {.
    importcpp: "vtkGeodesicPath::SafeDownCast(@)", header: "vtkGeodesicPath.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGeodesicPath :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGeodesicPath :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGeodesicPath :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGeodesicPath; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGeodesicPath.h".}