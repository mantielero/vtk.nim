## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMaskPointsFilter.h
##
##   Copyright (c) Kitware, Inc.
##   All rights reserved.
##   See LICENSE file for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkMaskPointsFilter
##  @brief   extract points within an image/volume mask
##
##  vtkMaskPointsFilter extracts points that are inside an image mask. The
##  image mask is a second input to the filter. Points that are inside a voxel
##  marked "inside" are copied to the output. The image mask can be generated
##  by vtkPointOccupancyFilter, with optional image processing steps performed
##  on the mask. Thus vtkPointOccupancyFilter and vtkMaskPointsFilter are
##  generally used together, with a pipeline of image processing algorithms
##  in between the two filters.
##
##  Note also that this filter is a subclass of vtkPointCloudFilter which has
##  the ability to produce an output mask indicating which points were
##  selected for output. It also has an optional second output containing the
##  points that were masked out (i.e., outliers) during processing.
##
##  Finally, the mask value indicating non-selection of points (i.e., the
##  empty value) may be specified. The second input, masking image, is
##  typically of type unsigned char so the empty value is of this type as
##  well.
##
##  @warning
##  During processing, points not within the masking image/volume are
##  considered outside and never extracted.
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @sa
##  vtkPointOccupancyFilter vtkPointCloudFilter
##

import
  vtkFiltersPointsModule, vtkPointCloudFilter

discard "forward decl of vtkImageData"
discard "forward decl of vtkPointSet"
type
  vtkMaskPointsFilter* {.importcpp: "vtkMaskPointsFilter",
                        header: "vtkMaskPointsFilter.h", bycopy.} = object of vtkPointCloudFilter ## /@{
                                                                                           ## *
                                                                                           ##  Standard methods for instantiating, obtaining type information, and
                                                                                           ##  printing information.
                                                                                           ##
    vtkMaskPointsFilter* {.importc: "vtkMaskPointsFilter".}: VTK_NEWINSTANCE
    ##  what value indicates a voxel is empty
    ##  All derived classes must implement this method. Note that a side effect of
    ##  the class is to populate the PointMap. Zero is returned if there is a failure.
    ##  just a placeholder during execution


proc New*(): ptr vtkMaskPointsFilter {.importcpp: "vtkMaskPointsFilter::New(@)",
                                   header: "vtkMaskPointsFilter.h".}
type
  vtkMaskPointsFilterSuperclass* = vtkPointCloudFilter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMaskPointsFilter::IsTypeOf(@)", header: "vtkMaskPointsFilter.h".}
proc IsA*(this: var vtkMaskPointsFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkMaskPointsFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMaskPointsFilter {.
    importcpp: "vtkMaskPointsFilter::SafeDownCast(@)",
    header: "vtkMaskPointsFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMaskPointsFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPointCloudFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMaskPointsFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMaskPointsFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkMaskPointsFilter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkMaskPointsFilter.h".}
proc SetMaskData*(this: var vtkMaskPointsFilter; source: ptr vtkDataObject) {.
    importcpp: "SetMaskData", header: "vtkMaskPointsFilter.h".}
proc GetMask*(this: var vtkMaskPointsFilter): ptr vtkDataObject {.
    importcpp: "GetMask", header: "vtkMaskPointsFilter.h".}
proc SetMaskConnection*(this: var vtkMaskPointsFilter;
                       algOutput: ptr vtkAlgorithmOutput) {.
    importcpp: "SetMaskConnection", header: "vtkMaskPointsFilter.h".}
proc SetEmptyValue*(this: var vtkMaskPointsFilter; _arg: cuchar) {.
    importcpp: "SetEmptyValue", header: "vtkMaskPointsFilter.h".}
## !!!Ignored construct:  virtual unsigned char GetEmptyValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EmptyValue  of  << this -> EmptyValue ) ; return this -> EmptyValue ; } ;
## Error: expected ';'!!!
