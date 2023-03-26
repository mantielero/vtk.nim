## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkVolumeContourSpectrumFilter.h
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
##  @class   vtkVolumeContourSpectrumFilter
##  @brief   compute an approximation of the
##  volume contour signature (evolution of the volume of the input tet-mesh
##  along an arc of the Reeb graph).
##
##  The filter takes a vtkUnstructuredGrid as an input (port 0), along with a
##  vtkReebGraph (port 1).
##  The Reeb graph arc to consider can be specified with SetArcId() (default: 0).
##  The number of (evenly distributed) samples of the signature can be defined
##  with SetNumberOfSamples() (default value: 100).
##  The filter will first try to pull as a scalar field the vtkDataArray with Id
##  'FieldId' of the vtkUnstructuredGrid, see SetFieldId (default: 0). The
##  filter will abort if this field does not exist.
##
##  The filter outputs a vtkTable with the volume contour signature
##  approximation, each sample being evenly distributed in the function span of
##  the arc.
##
##  This filter is a typical example for designing your own contour signature
##  filter (with customized metrics). It also shows typical vtkReebGraph
##  traversals.
##
##  Reference:
##  C. Bajaj, V. Pascucci, D. Schikore,
##  "The contour spectrum",
##  IEEE Visualization, 167-174, 1997.
##

import
  vtkDataObjectAlgorithm, vtkFiltersGeneralModule

discard "forward decl of vtkReebGraph"
discard "forward decl of vtkTable"
type
  vtkVolumeContourSpectrumFilter* {.importcpp: "vtkVolumeContourSpectrumFilter",
                                   header: "vtkVolumeContourSpectrumFilter.h",
                                   bycopy.} = object of vtkDataObjectAlgorithm
    vtkVolumeContourSpectrumFilter* {.importc: "vtkVolumeContourSpectrumFilter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkVolumeContourSpectrumFilter {.
    importcpp: "vtkVolumeContourSpectrumFilter::New(@)",
    header: "vtkVolumeContourSpectrumFilter.h".}
type
  vtkVolumeContourSpectrumFilterSuperclass* = vtkDataObjectAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkVolumeContourSpectrumFilter::IsTypeOf(@)",
    header: "vtkVolumeContourSpectrumFilter.h".}
proc IsA*(this: var vtkVolumeContourSpectrumFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkVolumeContourSpectrumFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkVolumeContourSpectrumFilter {.
    importcpp: "vtkVolumeContourSpectrumFilter::SafeDownCast(@)",
    header: "vtkVolumeContourSpectrumFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkVolumeContourSpectrumFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObjectAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkVolumeContourSpectrumFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkVolumeContourSpectrumFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkVolumeContourSpectrumFilter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkVolumeContourSpectrumFilter.h".}
proc SetArcId*(this: var vtkVolumeContourSpectrumFilter; _arg: vtkIdType) {.
    importcpp: "SetArcId", header: "vtkVolumeContourSpectrumFilter.h".}
## !!!Ignored construct:  virtual vtkIdType GetArcId ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ArcId  of  << this -> ArcId ) ; return this -> ArcId ; } ;
## Error: expected ';'!!!

proc SetArcIdNumberOfSamples*(this: var vtkVolumeContourSpectrumFilter; _arg: cint) {.
    importcpp: "SetArcIdNumberOfSamples",
    header: "vtkVolumeContourSpectrumFilter.h".}
## !!!Ignored construct:  virtual int GetArcIdNumberOfSamples ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfSamples  of  << this -> NumberOfSamples ) ; return this -> NumberOfSamples ; } ;
## Error: expected ';'!!!

proc SetArcIdNumberOfSamplesFieldId*(this: var vtkVolumeContourSpectrumFilter;
                                    _arg: vtkIdType) {.
    importcpp: "SetArcIdNumberOfSamplesFieldId",
    header: "vtkVolumeContourSpectrumFilter.h".}
## !!!Ignored construct:  virtual vtkIdType GetArcIdNumberOfSamplesFieldId ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FieldId  of  << this -> FieldId ) ; return this -> FieldId ; } ;
## Error: expected ';'!!!

proc GetOutput*(this: var vtkVolumeContourSpectrumFilter): ptr vtkTable {.
    importcpp: "GetOutput", header: "vtkVolumeContourSpectrumFilter.h".}