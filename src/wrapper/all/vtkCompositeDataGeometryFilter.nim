## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCompositeDataGeometryFilter.h
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
##  @class   vtkCompositeDataGeometryFilter
##  @brief   extract geometry from multi-group data
##
##  vtkCompositeDataGeometryFilter applies vtkGeometryFilter to all
##  leaves in vtkCompositeDataSet. Place this filter at the end of a
##  pipeline before a polydata consumer such as a polydata mapper to extract
##  geometry from all blocks and append them to one polydata object.
##

import
  vtkFiltersGeometryModule, vtkPolyDataAlgorithm

discard "forward decl of vtkPolyData"
type
  vtkCompositeDataGeometryFilter* {.importcpp: "vtkCompositeDataGeometryFilter",
                                   header: "vtkCompositeDataGeometryFilter.h",
                                   bycopy.} = object of vtkPolyDataAlgorithm
    vtkCompositeDataGeometryFilter* {.importc: "vtkCompositeDataGeometryFilter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkCompositeDataGeometryFilter {.
    importcpp: "vtkCompositeDataGeometryFilter::New(@)",
    header: "vtkCompositeDataGeometryFilter.h".}
type
  vtkCompositeDataGeometryFilterSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCompositeDataGeometryFilter::IsTypeOf(@)",
    header: "vtkCompositeDataGeometryFilter.h".}
proc IsA*(this: var vtkCompositeDataGeometryFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkCompositeDataGeometryFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCompositeDataGeometryFilter {.
    importcpp: "vtkCompositeDataGeometryFilter::SafeDownCast(@)",
    header: "vtkCompositeDataGeometryFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCompositeDataGeometryFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCompositeDataGeometryFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCompositeDataGeometryFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCompositeDataGeometryFilter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkCompositeDataGeometryFilter.h".}
proc ProcessRequest*(this: var vtkCompositeDataGeometryFilter;
                    request: ptr vtkInformation;
                    inputVector: ptr ptr vtkInformationVector;
                    outputVector: ptr vtkInformationVector): vtkTypeBool {.
    importcpp: "ProcessRequest", header: "vtkCompositeDataGeometryFilter.h".}