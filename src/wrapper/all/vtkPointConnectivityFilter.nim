## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPointConnectivityFilter.h
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
##  @class   vtkPointConnectivityFilter
##  @brief   output a scalar field indicating point connectivity
##
##
##  vtkPointConnectivityFilter is a filter the produces a point scalar field
##  that characerizes the connectivity of the point. What is meant by
##  connectivity is the number of cells that use each point. The output
##  scalar array is represented by a 16-bit integral value. A value of zero
##  means that no cells use a particular point.
##

import
  vtkDataSetAlgorithm, vtkFiltersGeneralModule

type
  vtkPointConnectivityFilter* {.importcpp: "vtkPointConnectivityFilter",
                               header: "vtkPointConnectivityFilter.h", bycopy.} = object of vtkDataSetAlgorithm ## /@{
                                                                                                         ## *
                                                                                                         ##  Standard methods for instantiation, obtaining type information and
                                                                                                         ##  printing.
                                                                                                         ##
    vtkPointConnectivityFilter* {.importc: "vtkPointConnectivityFilter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPointConnectivityFilter {.
    importcpp: "vtkPointConnectivityFilter::New(@)",
    header: "vtkPointConnectivityFilter.h".}
type
  vtkPointConnectivityFilterSuperclass* = vtkDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPointConnectivityFilter::IsTypeOf(@)",
    header: "vtkPointConnectivityFilter.h".}
proc IsA*(this: var vtkPointConnectivityFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPointConnectivityFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPointConnectivityFilter {.
    importcpp: "vtkPointConnectivityFilter::SafeDownCast(@)",
    header: "vtkPointConnectivityFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPointConnectivityFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPointConnectivityFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPointConnectivityFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPointConnectivityFilter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkPointConnectivityFilter.h".}