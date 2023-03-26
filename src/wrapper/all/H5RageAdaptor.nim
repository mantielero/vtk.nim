## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    H5RageAdaptor.h
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

import
  vtkDataArraySelection, vtkIOH5RageModule

discard "forward decl of vtkDataArraySelection"
discard "forward decl of vtkImageData"
discard "forward decl of vtkMultiProcessController"
type
  H5RageAdaptor* {.importcpp: "H5RageAdaptor", header: "H5RageAdaptor.h", bycopy.} = object ##  Collect the metadata
    ##  Time series of hdf files
    ##  all hdf files
    ##  Time step information retrieved from hdf filenames
    ##  Geometry information for sharing data with other processors
    ##  Size of image
    ##  Size of image this processor
    ##  Dimension of image
    ##  Physical origin
    ##  Physical spacing
    ##  Variable information retrieved from hdf filenames


proc constructH5RageAdaptor*(ctrl: ptr vtkMultiProcessController): H5RageAdaptor {.
    constructor, importcpp: "H5RageAdaptor(@)", header: "H5RageAdaptor.h".}
proc destroyH5RageAdaptor*(this: var H5RageAdaptor) {.
    importcpp: "#.~H5RageAdaptor()", header: "H5RageAdaptor.h".}
proc InitializeGlobal*(this: var H5RageAdaptor; DescFile: cstring): cint {.
    importcpp: "InitializeGlobal", header: "H5RageAdaptor.h".}
proc LoadVariableData*(this: var H5RageAdaptor; data: ptr vtkImageData; timeStep: cint;
                      cellSelection: ptr vtkDataArraySelection) {.
    importcpp: "LoadVariableData", header: "H5RageAdaptor.h".}
proc ConvertHDFData*[T](this: var H5RageAdaptor; ndims: cint; dims_out: ptr cint;
                       hdfData: ptr T) {.importcpp: "ConvertHDFData",
                                      header: "H5RageAdaptor.h".}
proc GetNumberOfTimeSteps*(this: var H5RageAdaptor): cint {.
    importcpp: "GetNumberOfTimeSteps", header: "H5RageAdaptor.h".}
proc GetTimeStep*(this: var H5RageAdaptor; step: cint): cdouble {.
    importcpp: "GetTimeStep", header: "H5RageAdaptor.h".}
proc GetNumberOfVariables*(this: var H5RageAdaptor): cint {.
    importcpp: "GetNumberOfVariables", header: "H5RageAdaptor.h".}
proc GetVariableName*(this: var H5RageAdaptor; indx: cint): cstring {.
    importcpp: "GetVariableName", header: "H5RageAdaptor.h".}
proc GetWholeExtent*(this: var H5RageAdaptor; ext: cint): cint {.
    importcpp: "GetWholeExtent", header: "H5RageAdaptor.h".}
proc GetSubExtent*(this: var H5RageAdaptor; ext: cint): cint {.
    importcpp: "GetSubExtent", header: "H5RageAdaptor.h".}
proc GetDimension*(this: var H5RageAdaptor; dim: cint): cint {.
    importcpp: "GetDimension", header: "H5RageAdaptor.h".}
proc GetOrigin*(this: var H5RageAdaptor; dim: cint): cdouble {.importcpp: "GetOrigin",
    header: "H5RageAdaptor.h".}
proc GetSpacing*(this: var H5RageAdaptor; dim: cint): cdouble {.
    importcpp: "GetSpacing", header: "H5RageAdaptor.h".}
##  VTK-HeaderTest-Exclude: H5RageAdaptor.h
