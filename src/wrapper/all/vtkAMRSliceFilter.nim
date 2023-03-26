## =========================================================================
##
##  Program:   Visualization Toolkit
##  Module:    vtkAMRSliceFilter.h
##
##  Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##  All rights reserved.
##  See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##  This software is distributed WITHOUT ANY WARRANTY; without even
##  the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##  PURPOSE.  See the above copyright notice for more information.
##
##  =========================================================================
## *
##  @class   vtkAMRSliceFilter
##
##
##   A concrete instance of vtkOverlappingAMRAlgorithm which implements
##   functionality for extracting slices from AMR data. Unlike the conventional
##   slice filter, the output of this filter is a 2-D AMR dataset itself.
##

import
  vtkFiltersAMRModule, vtkOverlappingAMRAlgorithm

discard "forward decl of vtkInformation"
discard "forward decl of vtkInformationVector"
discard "forward decl of vtkOverlappingAMR"
discard "forward decl of vtkMultiProcessController"
discard "forward decl of vtkPlane"
discard "forward decl of vtkAMRBox"
discard "forward decl of vtkUniformGrid"
type
  vtkAMRSliceFilter* {.importcpp: "vtkAMRSliceFilter",
                      header: "vtkAMRSliceFilter.h", bycopy.} = object of vtkOverlappingAMRAlgorithm
    vtkAMRSliceFilter* {.importc: "vtkAMRSliceFilter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkAMRSliceFilter {.importcpp: "vtkAMRSliceFilter::New(@)",
                                 header: "vtkAMRSliceFilter.h".}
type
  vtkAMRSliceFilterSuperclass* = vtkOverlappingAMRAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAMRSliceFilter::IsTypeOf(@)", header: "vtkAMRSliceFilter.h".}
proc IsA*(this: var vtkAMRSliceFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkAMRSliceFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAMRSliceFilter {.
    importcpp: "vtkAMRSliceFilter::SafeDownCast(@)", header: "vtkAMRSliceFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAMRSliceFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkOverlappingAMRAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAMRSliceFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAMRSliceFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAMRSliceFilter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkAMRSliceFilter.h".}
proc SetOffsetFromOrigin*(this: var vtkAMRSliceFilter; _arg: cdouble) {.
    importcpp: "SetOffsetFromOrigin", header: "vtkAMRSliceFilter.h".}
## !!!Ignored construct:  virtual double GetOffsetFromOrigin ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OffsetFromOrigin  of  << this -> OffsetFromOrigin ) ; return this -> OffsetFromOrigin ; } ;
## Error: expected ';'!!!

proc SetOffsetFromOriginMaxResolution*(this: var vtkAMRSliceFilter; _arg: cuint) {.
    importcpp: "SetOffsetFromOriginMaxResolution", header: "vtkAMRSliceFilter.h".}
## !!!Ignored construct:  virtual unsigned int GetOffsetFromOriginMaxResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaxResolution  of  << this -> MaxResolution ) ; return this -> MaxResolution ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} *
##  Tags to identify normals along the X, Y and Z directions.
##  enum NormalTag : char { X_NORMAL = 1 , Y_NORMAL = 2 , Z_NORMAL = 4 } ;
## Error: identifier expected, but got: :!!!

proc SetOffsetFromOriginMaxResolutionNormal*(this: var vtkAMRSliceFilter; _arg: cint) {.
    importcpp: "SetOffsetFromOriginMaxResolutionNormal",
    header: "vtkAMRSliceFilter.h".}
## !!!Ignored construct:  virtual int GetOffsetFromOriginMaxResolutionNormal ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Normal  of  << this -> Normal ) ; return this -> Normal ; } ;
## Error: expected ';'!!!

proc SetController*(this: var vtkAMRSliceFilter; a2: ptr vtkMultiProcessController) {.
    importcpp: "SetController", header: "vtkAMRSliceFilter.h".}
proc GetnameController*(this: var vtkAMRSliceFilter): ptr vtkMultiProcessController {.
    importcpp: "GetnameController", header: "vtkAMRSliceFilter.h".}
  ## /@}
  ##  Standard Pipeline methods
proc RequestData*(this: var vtkAMRSliceFilter; a2: ptr vtkInformation;
                 a3: ptr ptr vtkInformationVector; a4: ptr vtkInformationVector): cint {.
    importcpp: "RequestData", header: "vtkAMRSliceFilter.h".}
proc FillInputPortInformation*(this: var vtkAMRSliceFilter; port: cint;
                              info: ptr vtkInformation): cint {.
    importcpp: "FillInputPortInformation", header: "vtkAMRSliceFilter.h".}
proc FillOutputPortInformation*(this: var vtkAMRSliceFilter; port: cint;
                               info: ptr vtkInformation): cint {.
    importcpp: "FillOutputPortInformation", header: "vtkAMRSliceFilter.h".}
proc RequestInformation*(this: var vtkAMRSliceFilter; rqst: ptr vtkInformation;
                        inputVector: ptr ptr vtkInformationVector;
                        outputVector: ptr vtkInformationVector): cint {.
    importcpp: "RequestInformation", header: "vtkAMRSliceFilter.h".}
proc RequestUpdateExtent*(this: var vtkAMRSliceFilter; a2: ptr vtkInformation;
                         a3: ptr ptr vtkInformationVector;
                         a4: ptr vtkInformationVector): cint {.
    importcpp: "RequestUpdateExtent", header: "vtkAMRSliceFilter.h".}