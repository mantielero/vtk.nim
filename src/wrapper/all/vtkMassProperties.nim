## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMassProperties.h
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
##  @class   vtkMassProperties
##  @brief   estimate volume, area, shape index of triangle mesh
##
##  vtkMassProperties estimates the volume, the surface area, and the
##  normalized shape index of a triangle mesh.  The algorithm
##  implemented here is based on the discrete form of the divergence
##  theorem.  The general assumption here is that the model is of
##  closed surface.  For more details see the following reference
##  (Alyassin A.M. et al, "Evaluation of new algorithms for the
##  interactive measurement of surface area and volume", Med Phys 21(6)
##  1994.).
##
##  @warning
##  Currently only triangles are processed. Use vtkTriangleFilter to convert
##  any strips or polygons to triangles. If multiple closed objects are
##  defined consider using vtkMultiObjectMassProperties. Alternatively,
##  vtkPolyDataConnectivityFilter can be used to extract connected regions
##  (i.e., objects) one at a time, and then each object can be processed by
##  this filter.
##
##  @sa
##  vtkTriangleFilter vtkMultiObjectMassProperties
##

import
  vtkFiltersCoreModule, vtkPolyDataAlgorithm

type
  vtkMassProperties* {.importcpp: "vtkMassProperties",
                      header: "vtkMassProperties.h", bycopy.} = object of vtkPolyDataAlgorithm ## *
                                                                                        ##  Constructs with initial values of zero.
                                                                                        ##
    vtkMassProperties* {.importc: "vtkMassProperties".}: VTK_NEWINSTANCE
    ##  == Projected area of triangles * average z values


proc New*(): ptr vtkMassProperties {.importcpp: "vtkMassProperties::New(@)",
                                 header: "vtkMassProperties.h".}
type
  vtkMassPropertiesSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMassProperties::IsTypeOf(@)", header: "vtkMassProperties.h".}
proc IsA*(this: var vtkMassProperties; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkMassProperties.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMassProperties {.
    importcpp: "vtkMassProperties::SafeDownCast(@)", header: "vtkMassProperties.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMassProperties :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMassProperties :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMassProperties :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkMassProperties; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkMassProperties.h".}
proc GetVolume*(this: var vtkMassProperties): cdouble {.importcpp: "GetVolume",
    header: "vtkMassProperties.h".}
proc GetVolumeProjected*(this: var vtkMassProperties): cdouble {.
    importcpp: "GetVolumeProjected", header: "vtkMassProperties.h".}
proc GetVolumeX*(this: var vtkMassProperties): cdouble {.importcpp: "GetVolumeX",
    header: "vtkMassProperties.h".}
proc GetVolumeY*(this: var vtkMassProperties): cdouble {.importcpp: "GetVolumeY",
    header: "vtkMassProperties.h".}
proc GetVolumeZ*(this: var vtkMassProperties): cdouble {.importcpp: "GetVolumeZ",
    header: "vtkMassProperties.h".}
proc GetKx*(this: var vtkMassProperties): cdouble {.importcpp: "GetKx",
    header: "vtkMassProperties.h".}
proc GetKy*(this: var vtkMassProperties): cdouble {.importcpp: "GetKy",
    header: "vtkMassProperties.h".}
proc GetKz*(this: var vtkMassProperties): cdouble {.importcpp: "GetKz",
    header: "vtkMassProperties.h".}
proc GetSurfaceArea*(this: var vtkMassProperties): cdouble {.
    importcpp: "GetSurfaceArea", header: "vtkMassProperties.h".}
proc GetMinCellArea*(this: var vtkMassProperties): cdouble {.
    importcpp: "GetMinCellArea", header: "vtkMassProperties.h".}
proc GetMaxCellArea*(this: var vtkMassProperties): cdouble {.
    importcpp: "GetMaxCellArea", header: "vtkMassProperties.h".}
proc GetNormalizedShapeIndex*(this: var vtkMassProperties): cdouble {.
    importcpp: "GetNormalizedShapeIndex", header: "vtkMassProperties.h".}