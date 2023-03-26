## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtractFunctionalBagPlot.h
##
##   Copyright (c) Kitware, Inc.
##   All rights reserved.
##   See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkExtractFunctionalBagPlot
##
##
##  From an input table containing series on port 0 and another table
##  describing densities on port 1 (for instance obtained by applying
##  filter  vtkHighestDensityRegionsStatistics, this filter generates
##  a table containing all the columns of the input port 0 plus two 2
##  components columns containing the bag series to be used by
##  vtkFunctionalBagPlot.
##
##  @sa
##  vtkFunctionalBagPlot vtkHighestDensityRegionsStatistics
##

import
  vtkFiltersStatisticsModule, vtkTableAlgorithm

type
  vtkExtractFunctionalBagPlot* {.importcpp: "vtkExtractFunctionalBagPlot",
                                header: "vtkExtractFunctionalBagPlot.h", bycopy.} = object of vtkTableAlgorithm
    vtkExtractFunctionalBagPlot* {.importc: "vtkExtractFunctionalBagPlot".}: VTK_NEWINSTANCE


proc New*(): ptr vtkExtractFunctionalBagPlot {.
    importcpp: "vtkExtractFunctionalBagPlot::New(@)",
    header: "vtkExtractFunctionalBagPlot.h".}
type
  vtkExtractFunctionalBagPlotSuperclass* = vtkTableAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkExtractFunctionalBagPlot::IsTypeOf(@)",
    header: "vtkExtractFunctionalBagPlot.h".}
proc IsA*(this: var vtkExtractFunctionalBagPlot; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkExtractFunctionalBagPlot.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkExtractFunctionalBagPlot {.
    importcpp: "vtkExtractFunctionalBagPlot::SafeDownCast(@)",
    header: "vtkExtractFunctionalBagPlot.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkExtractFunctionalBagPlot :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTableAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtractFunctionalBagPlot :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtractFunctionalBagPlot :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkExtractFunctionalBagPlot; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkExtractFunctionalBagPlot.h".}
proc SetDensityForP50*(this: var vtkExtractFunctionalBagPlot; _arg: cdouble) {.
    importcpp: "SetDensityForP50", header: "vtkExtractFunctionalBagPlot.h".}
  ## /@{
  ## *
  ##  Density value for the user defined quartile.
  ##
proc SetDensityForP50DensityForPUser*(this: var vtkExtractFunctionalBagPlot;
                                     _arg: cdouble) {.
    importcpp: "SetDensityForP50DensityForPUser",
    header: "vtkExtractFunctionalBagPlot.h".}
proc SetDensityForP50DensityForPUserPUser*(this: var vtkExtractFunctionalBagPlot;
    _arg: cint) {.importcpp: "SetDensityForP50DensityForPUserPUser",
                header: "vtkExtractFunctionalBagPlot.h".}
  ## /@}