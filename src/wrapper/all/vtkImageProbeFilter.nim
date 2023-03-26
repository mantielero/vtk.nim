## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageProbeFilter.h
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
##  @class   vtkImageProbeFilter
##  @brief   sample image values at specified point positions
##
##  vtkImageProbeFilter interpolates an image at specified point positions.
##  This filter has two inputs: the Input and Source. The Input geometric
##  structure is passed through the filter, and the Output point scalars
##  are interpolated from the Source image.
##
##  This filter can be used to resample an image onto a set of arbitrarily
##  placed sample points.  For example, if you have a surface data set
##  (i.e. a vtkPolyData that has been tesselated so that its points are
##  very closely spaced), you can color the polydata from the image points.
##
##  In general, this filter is similar to vtkProbeFilter except that the
##  Source data is always an image.  The advantages that it provides over
##  vtkProbeFilter is that it is faster, and it can take advantage of the
##  advanced interpolation methods offered by vtkAbstractImageInterpolator
##  subclasses.
##

import
  vtkDataSetAlgorithm, vtkImagingCoreModule

discard "forward decl of vtkAbstractImageInterpolator"
discard "forward decl of vtkUnsignedCharArray"
discard "forward decl of vtkImageData"
discard "forward decl of vtkPointData"
type
  vtkImageProbeFilter* {.importcpp: "vtkImageProbeFilter",
                        header: "vtkImageProbeFilter.h", bycopy.} = object of vtkDataSetAlgorithm
    vtkImageProbeFilter* {.importc: "vtkImageProbeFilter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageProbeFilter {.importcpp: "vtkImageProbeFilter::New(@)",
                                   header: "vtkImageProbeFilter.h".}
type
  vtkImageProbeFilterSuperclass* = vtkDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageProbeFilter::IsTypeOf(@)", header: "vtkImageProbeFilter.h".}
proc IsA*(this: var vtkImageProbeFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageProbeFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageProbeFilter {.
    importcpp: "vtkImageProbeFilter::SafeDownCast(@)",
    header: "vtkImageProbeFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageProbeFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageProbeFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageProbeFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageProbeFilter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageProbeFilter.h".}
proc SetSourceData*(this: var vtkImageProbeFilter; source: ptr vtkDataObject) {.
    importcpp: "SetSourceData", header: "vtkImageProbeFilter.h".}
proc GetSource*(this: var vtkImageProbeFilter): ptr vtkDataObject {.
    importcpp: "GetSource", header: "vtkImageProbeFilter.h".}
proc SetSourceConnection*(this: var vtkImageProbeFilter;
                         algOutput: ptr vtkAlgorithmOutput) {.
    importcpp: "SetSourceConnection", header: "vtkImageProbeFilter.h".}
proc SetInterpolator*(this: var vtkImageProbeFilter;
                     interpolator: ptr vtkAbstractImageInterpolator) {.
    importcpp: "SetInterpolator", header: "vtkImageProbeFilter.h".}
proc GetInterpolator*(this: var vtkImageProbeFilter): ptr vtkAbstractImageInterpolator {.
    importcpp: "GetInterpolator", header: "vtkImageProbeFilter.h".}