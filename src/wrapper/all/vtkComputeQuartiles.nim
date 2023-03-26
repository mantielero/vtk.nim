## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkComputeQuartiles.h
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
##  @class   vtkComputeQuartiles
##  @brief   Extract quartiles and extremum values
##  of all columns of a table or all fields of a dataset.
##
##
##  vtkComputeQuartiles accepts any vtkDataObject as input and produces a
##  vtkTable data as output.
##  This filter can be used to generate a table to create box plots
##  using a vtkPlotBox instance.
##  The filter internally uses vtkOrderStatistics to compute quartiles.
##
##  Note: This class is being kept for backwards compatibility. Please use vtkComputeQuantiles
##  instead which is the generalized version of this filter.
##
##  @sa
##  vtkTableAlgorithm vtkOrderStatistics vtkPlotBox vtkChartBox
##
##  @par Thanks:
##  This class was written by Kitware SAS and supported by EDF - www.edf.fr
##

import
  vtkComputeQuantiles, vtkFiltersStatisticsModule

type
  vtkComputeQuartiles* {.importcpp: "vtkComputeQuartiles",
                        header: "vtkComputeQuartiles.h", bycopy.} = object of vtkComputeQuantiles
    vtkComputeQuartiles* {.importc: "vtkComputeQuartiles".}: VTK_NEWINSTANCE


proc New*(): ptr vtkComputeQuartiles {.importcpp: "vtkComputeQuartiles::New(@)",
                                   header: "vtkComputeQuartiles.h".}
type
  vtkComputeQuartilesSuperclass* = vtkComputeQuantiles

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkComputeQuartiles::IsTypeOf(@)", header: "vtkComputeQuartiles.h".}
proc IsA*(this: var vtkComputeQuartiles; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkComputeQuartiles.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkComputeQuartiles {.
    importcpp: "vtkComputeQuartiles::SafeDownCast(@)",
    header: "vtkComputeQuartiles.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkComputeQuartiles :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkComputeQuantiles :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkComputeQuartiles :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkComputeQuartiles :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkComputeQuartiles; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkComputeQuartiles.h".}