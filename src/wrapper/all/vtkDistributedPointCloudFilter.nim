## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDistributedPointCloudFilter.h
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
##  @class vtkDistributedPointCloudFilter
##  @brief Distributes points among MPI processors.
##
##  This filter distributes points among processors into spatially
##  contiguous point set, containing an equivalent number of points.
##  Algorithm: point set is recursively splitted in two, among MPI groups.
##  Note: input cells are ignored. Output is a vtkPolyData.
##
##  @par Thanks:
##  This class has been written by Kitware SAS from an initial work made by
##  Aymeric Pelle from Universite de Technologie de Compiegne, France,
##  and Laurent Colombet and Thierry Carrard from Commissariat a l'Energie
##  Atomique (CEA/DIF).
##

import
  vtkFiltersParallelMPIModule, vtkPointSetAlgorithm

discard "forward decl of vtkMPIController"
discard "forward decl of vtkMultiProcessController"
type
  vtkDistributedPointCloudFilter* {.importcpp: "vtkDistributedPointCloudFilter",
                                   header: "vtkDistributedPointCloudFilter.h",
                                   bycopy.} = object of vtkPointSetAlgorithm
    vtkDistributedPointCloudFilter* {.importc: "vtkDistributedPointCloudFilter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkDistributedPointCloudFilter {.
    importcpp: "vtkDistributedPointCloudFilter::New(@)",
    header: "vtkDistributedPointCloudFilter.h".}
type
  vtkDistributedPointCloudFilterSuperclass* = vtkPointSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDistributedPointCloudFilter::IsTypeOf(@)",
    header: "vtkDistributedPointCloudFilter.h".}
proc IsA*(this: var vtkDistributedPointCloudFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkDistributedPointCloudFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDistributedPointCloudFilter {.
    importcpp: "vtkDistributedPointCloudFilter::SafeDownCast(@)",
    header: "vtkDistributedPointCloudFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDistributedPointCloudFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPointSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDistributedPointCloudFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDistributedPointCloudFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDistributedPointCloudFilter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkDistributedPointCloudFilter.h".}
proc SetController*(this: var vtkDistributedPointCloudFilter;
                   a2: ptr vtkMultiProcessController) {.importcpp: "SetController",
    header: "vtkDistributedPointCloudFilter.h".}
proc GetnameController*(this: var vtkDistributedPointCloudFilter): ptr vtkMultiProcessController {.
    importcpp: "GetnameController", header: "vtkDistributedPointCloudFilter.h".}
  ## /@}
  ## *
  ##  Get the points that are inside innerBounds and put them in output DataSet.
  ##  Ask other MPI ranks for their corresponding points.
  ##
proc GetPointsInsideBounds*(a1: ptr vtkMPIController; input: ptr vtkPointSet;
                           output: ptr vtkPointSet; innerBounds: array[6, cdouble]) {.
    importcpp: "vtkDistributedPointCloudFilter::GetPointsInsideBounds(@)",
    header: "vtkDistributedPointCloudFilter.h".}