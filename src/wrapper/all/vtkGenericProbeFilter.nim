## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGenericProbeFilter.h
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
##  @class   vtkGenericProbeFilter
##  @brief   sample data values at specified point locations
##
##  vtkGenericProbeFilter is a filter that computes point attributes (e.g., scalars,
##  vectors, etc.) at specified point positions. The filter has two inputs:
##  the Input and Source. The Input geometric structure is passed through the
##  filter. The point attributes are computed at the Input point positions
##  by interpolating into the source data. For example, we can compute data
##  values on a plane (plane specified as Input) from a volume (Source).
##
##  This filter can be used to resample data, or convert one dataset form into
##  another. For example, a generic dataset can be probed with a volume
##  (three-dimensional vtkImageData), and then volume rendering techniques can
##  be used to visualize the results. Another example: a line or curve can be
##  used to probe data to produce x-y plots along that line or curve.
##
##  This filter has been implemented to operate on generic datasets, rather
##  than the typical vtkDataSet (and subclasses). vtkGenericDataSet is a more
##  complex cousin of vtkDataSet, typically consisting of nonlinear,
##  higher-order cells. To process this type of data, generic cells are
##  automatically tessellated into linear cells prior to isocontouring.
##
##  @sa
##  vtkGenericProbeFilter vtkProbeFilter vtkGenericDataSet
##

import
  vtkDataSetAlgorithm, vtkFiltersGenericModule

discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkGenericDataSet"
type
  vtkGenericProbeFilter* {.importcpp: "vtkGenericProbeFilter",
                          header: "vtkGenericProbeFilter.h", bycopy.} = object of vtkDataSetAlgorithm
    vtkGenericProbeFilter* {.importc: "vtkGenericProbeFilter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkGenericProbeFilter {.importcpp: "vtkGenericProbeFilter::New(@)",
                                     header: "vtkGenericProbeFilter.h".}
type
  vtkGenericProbeFilterSuperclass* = vtkDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGenericProbeFilter::IsTypeOf(@)",
    header: "vtkGenericProbeFilter.h".}
proc IsA*(this: var vtkGenericProbeFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkGenericProbeFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGenericProbeFilter {.
    importcpp: "vtkGenericProbeFilter::SafeDownCast(@)",
    header: "vtkGenericProbeFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGenericProbeFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGenericProbeFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGenericProbeFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGenericProbeFilter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGenericProbeFilter.h".}
proc SetSourceData*(this: var vtkGenericProbeFilter; source: ptr vtkGenericDataSet) {.
    importcpp: "SetSourceData", header: "vtkGenericProbeFilter.h".}
proc GetSource*(this: var vtkGenericProbeFilter): ptr vtkGenericDataSet {.
    importcpp: "GetSource", header: "vtkGenericProbeFilter.h".}
proc GetnameValidPoints*(this: var vtkGenericProbeFilter): ptr vtkIdTypeArray {.
    importcpp: "GetnameValidPoints", header: "vtkGenericProbeFilter.h".}
  ## /@}