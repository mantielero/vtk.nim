## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageConnectivityFilter.h
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
## =========================================================================
##   Copyright (c) 2014 David Gobbi
##   All rights reserved.
##
##   Redistribution and use in source and binary forms, with or without
##   modification, are permitted provided that the following conditions
##   are met:
##
##  Redistributions of source code must retain the above copyright
##     notice, this list of conditions and the following disclaimer.
##
##  Redistributions in binary form must reproduce the above copyright
##     notice, this list of conditions and the following disclaimer in the
##     documentation and/or other materials provided with the distribution.
##
##  Neither the name of David Gobbi nor the names of any contributors
##     may be used to endorse or promote products derived from this software
##     without specific prior written permission.
##
##   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
##   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
##   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
##   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
##   HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
##   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
##   LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
##   DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
##   THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
##   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
##   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
## =========================================================================
## *
##  @class   vtkImageConnectivityFilter
##  @brief   Label an image by connectivity
##
##  vtkImageConnectivityFilter will identify connected regions within an
##  image and label them.  Only points with scalar values within a
##  prescribed range are considered for inclusion, by default this range
##  includes all scalar values with a value greater than zero.  Points
##  within the prescribed scalar range are considered to be connected
##  if a path exists between the points that does not traverse any
##  points that are not within the prescribed scalar range.
##  Adjacency of points is governed by 4-connectivity for 2D images, and
##  6-connectivity for 3D images.
##
##  The output of this filter is a label image.  By default, each region
##  is assigned a different label, where the labels are integer values
##  starting at a value of 1.  The SetLabelMode() method can be used to
##  change the way that labels are assigned.  Labels can be assigned
##  by providing input seed points for each region to be labelled, or
##  they can be assigned by ranking the regions by size.
##
##  If a set of seeds is provided with the SetSeedData() method,
##  then the default behavior is to only output the regions that are
##  connected to the seeds, and if the seeds have scalars, then these
##  scalars will be used to label the regions.  Seeds with a scalar
##  value equal to zero are ignored.  See the documentation for the
##  SetExtractionMode() method for details on how to control which
##  regions will labeled.
##
##  Regions can be selected by size with the SetSizeRange() method,
##  which can be useful for identifying objects of a certain size,
##  e.g. for rejecting small regions that are likely to be noise.
##  It is also possible to label only the largest region and ignore
##  all others, with SetExtractionModeToLargestRegion().
##
##  In addition to the labels, the following additional information
##  is provided: the number of regions identified, the size of each
##  region, a list of all label values used, and the seed for each
##  region (if seeds were used).  Optionally, this filter can also
##  compute the extent of each region if GenerateRegionExtentsOn()
##  is called.  These extents can be useful for cropping the output
##  of the filter.
##
##  @sa
##  vtkConnectivityFilter, vtkPolyDataConnectivityFilter, vtkmImageConnectivity
##

import
  vtkImageAlgorithm, vtkImagingMorphologicalModule

discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkIntArray"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkImageData"
discard "forward decl of vtkImageStencilData"
type
  vtkImageConnectivityFilter* {.importcpp: "vtkImageConnectivityFilter",
                               header: "vtkImageConnectivityFilter.h", bycopy.} = object of vtkImageAlgorithm
    vtkImageConnectivityFilter* {.importc: "vtkImageConnectivityFilter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageConnectivityFilter {.
    importcpp: "vtkImageConnectivityFilter::New(@)",
    header: "vtkImageConnectivityFilter.h".}
type
  vtkImageConnectivityFilterSuperclass* = vtkImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageConnectivityFilter::IsTypeOf(@)",
    header: "vtkImageConnectivityFilter.h".}
proc IsA*(this: var vtkImageConnectivityFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageConnectivityFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageConnectivityFilter {.
    importcpp: "vtkImageConnectivityFilter::SafeDownCast(@)",
    header: "vtkImageConnectivityFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageConnectivityFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageConnectivityFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageConnectivityFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageConnectivityFilter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkImageConnectivityFilter.h".}
type
  vtkImageConnectivityFilterLabelModeEnum* {.size: sizeof(cint),
      importcpp: "vtkImageConnectivityFilter::LabelModeEnum",
      header: "vtkImageConnectivityFilter.h".} = enum
    SeedScalar = 0, ConstantValue = 1, SizeRank = 2


type
  vtkImageConnectivityFilterExtractionModeEnum* {.size: sizeof(cint),
      importcpp: "vtkImageConnectivityFilter::ExtractionModeEnum",
      header: "vtkImageConnectivityFilter.h".} = enum
    SeededRegions = 0, AllRegions = 1, LargestRegion = 2


proc SetSeedConnection*(this: var vtkImageConnectivityFilter;
                       port: ptr vtkAlgorithmOutput) {.
    importcpp: "SetSeedConnection", header: "vtkImageConnectivityFilter.h".}
proc GetSeedConnection*(this: var vtkImageConnectivityFilter): ptr vtkAlgorithmOutput {.
    importcpp: "GetSeedConnection", header: "vtkImageConnectivityFilter.h".}
proc SetSeedData*(this: var vtkImageConnectivityFilter; data: ptr vtkDataSet) {.
    importcpp: "SetSeedData", header: "vtkImageConnectivityFilter.h".}
proc SetStencilConnection*(this: var vtkImageConnectivityFilter;
                          port: ptr vtkAlgorithmOutput) {.
    importcpp: "SetStencilConnection", header: "vtkImageConnectivityFilter.h".}
proc GetStencilConnection*(this: var vtkImageConnectivityFilter): ptr vtkAlgorithmOutput {.
    importcpp: "GetStencilConnection", header: "vtkImageConnectivityFilter.h".}
proc SetStencilData*(this: var vtkImageConnectivityFilter;
                    data: ptr vtkImageStencilData) {.importcpp: "SetStencilData",
    header: "vtkImageConnectivityFilter.h".}
proc SetLabelScalarTypeToUnsignedChar*(this: var vtkImageConnectivityFilter) {.
    importcpp: "SetLabelScalarTypeToUnsignedChar",
    header: "vtkImageConnectivityFilter.h".}
proc SetLabelScalarTypeToShort*(this: var vtkImageConnectivityFilter) {.
    importcpp: "SetLabelScalarTypeToShort", header: "vtkImageConnectivityFilter.h".}
proc SetLabelScalarTypeToUnsignedShort*(this: var vtkImageConnectivityFilter) {.
    importcpp: "SetLabelScalarTypeToUnsignedShort",
    header: "vtkImageConnectivityFilter.h".}
proc SetLabelScalarTypeToInt*(this: var vtkImageConnectivityFilter) {.
    importcpp: "SetLabelScalarTypeToInt", header: "vtkImageConnectivityFilter.h".}
proc GetLabelScalarTypeAsString*(this: var vtkImageConnectivityFilter): cstring {.
    importcpp: "GetLabelScalarTypeAsString",
    header: "vtkImageConnectivityFilter.h".}
proc SetLabelScalarType*(this: var vtkImageConnectivityFilter; _arg: cint) {.
    importcpp: "SetLabelScalarType", header: "vtkImageConnectivityFilter.h".}
## !!!Ignored construct:  virtual int GetLabelScalarType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LabelScalarType  of  << this -> LabelScalarType ) ; return this -> LabelScalarType ; } ;
## Error: expected ';'!!!

proc SetLabelModeToSeedScalar*(this: var vtkImageConnectivityFilter) {.
    importcpp: "SetLabelModeToSeedScalar", header: "vtkImageConnectivityFilter.h".}
proc SetLabelModeToConstantValue*(this: var vtkImageConnectivityFilter) {.
    importcpp: "SetLabelModeToConstantValue",
    header: "vtkImageConnectivityFilter.h".}
proc SetLabelModeToSizeRank*(this: var vtkImageConnectivityFilter) {.
    importcpp: "SetLabelModeToSizeRank", header: "vtkImageConnectivityFilter.h".}
proc GetLabelModeAsString*(this: var vtkImageConnectivityFilter): cstring {.
    importcpp: "GetLabelModeAsString", header: "vtkImageConnectivityFilter.h".}
proc SetLabelScalarTypeLabelMode*(this: var vtkImageConnectivityFilter; _arg: cint) {.
    importcpp: "SetLabelScalarTypeLabelMode",
    header: "vtkImageConnectivityFilter.h".}
## !!!Ignored construct:  virtual int GetLabelScalarTypeLabelMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LabelMode  of  << this -> LabelMode ) ; return this -> LabelMode ; } ;
## Error: expected ';'!!!

proc SetExtractionModeToSeededRegions*(this: var vtkImageConnectivityFilter) {.
    importcpp: "SetExtractionModeToSeededRegions",
    header: "vtkImageConnectivityFilter.h".}
proc SetExtractionModeToAllRegions*(this: var vtkImageConnectivityFilter) {.
    importcpp: "SetExtractionModeToAllRegions",
    header: "vtkImageConnectivityFilter.h".}
proc SetExtractionModeToLargestRegion*(this: var vtkImageConnectivityFilter) {.
    importcpp: "SetExtractionModeToLargestRegion",
    header: "vtkImageConnectivityFilter.h".}
proc GetExtractionModeAsString*(this: var vtkImageConnectivityFilter): cstring {.
    importcpp: "GetExtractionModeAsString", header: "vtkImageConnectivityFilter.h".}
proc SetLabelScalarTypeLabelModeExtractionMode*(
    this: var vtkImageConnectivityFilter; _arg: cint) {.
    importcpp: "SetLabelScalarTypeLabelModeExtractionMode",
    header: "vtkImageConnectivityFilter.h".}
## !!!Ignored construct:  virtual int GetLabelScalarTypeLabelModeExtractionMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ExtractionMode  of  << this -> ExtractionMode ) ; return this -> ExtractionMode ; } ;
## Error: expected ';'!!!

proc SetLabelScalarTypeLabelModeExtractionModeLabelConstantValue*(
    this: var vtkImageConnectivityFilter; _arg: cint) {.
    importcpp: "SetLabelScalarTypeLabelModeExtractionModeLabelConstantValue",
    header: "vtkImageConnectivityFilter.h".}
## !!!Ignored construct:  virtual int GetLabelScalarTypeLabelModeExtractionModeLabelConstantValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LabelConstantValue  of  << this -> LabelConstantValue ) ; return this -> LabelConstantValue ; } ;
## Error: expected ';'!!!

proc GetNumberOfExtractedRegions*(this: var vtkImageConnectivityFilter): vtkIdType {.
    importcpp: "GetNumberOfExtractedRegions",
    header: "vtkImageConnectivityFilter.h".}
proc GetExtractedRegionLabels*(this: var vtkImageConnectivityFilter): ptr vtkIdTypeArray {.
    importcpp: "GetExtractedRegionLabels", header: "vtkImageConnectivityFilter.h".}
proc GetExtractedRegionSizes*(this: var vtkImageConnectivityFilter): ptr vtkIdTypeArray {.
    importcpp: "GetExtractedRegionSizes", header: "vtkImageConnectivityFilter.h".}
proc GetExtractedRegionSeedIds*(this: var vtkImageConnectivityFilter): ptr vtkIdTypeArray {.
    importcpp: "GetExtractedRegionSeedIds", header: "vtkImageConnectivityFilter.h".}
proc GetExtractedRegionExtents*(this: var vtkImageConnectivityFilter): ptr vtkIntArray {.
    importcpp: "GetExtractedRegionExtents", header: "vtkImageConnectivityFilter.h".}
proc SetLabelScalarTypeLabelModeExtractionModeLabelConstantValueGenerateRegionExtents*(
    this: var vtkImageConnectivityFilter; _arg: vtkTypeBool) {.importcpp: "SetLabelScalarTypeLabelModeExtractionModeLabelConstantValueGenerateRegionExtents",
    header: "vtkImageConnectivityFilter.h".}
proc GenerateRegionExtentsOn*(this: var vtkImageConnectivityFilter) {.
    importcpp: "GenerateRegionExtentsOn", header: "vtkImageConnectivityFilter.h".}
proc GenerateRegionExtentsOff*(this: var vtkImageConnectivityFilter) {.
    importcpp: "GenerateRegionExtentsOff", header: "vtkImageConnectivityFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetLabelScalarTypeLabelModeExtractionModeLabelConstantValueGenerateRegionExtents ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateRegionExtents  of  << this -> GenerateRegionExtents ) ; return this -> GenerateRegionExtents ; } ;
## Error: expected ';'!!!

proc SetSizeRange*(this: var vtkImageConnectivityFilter; _arg1: vtkIdType;
                  _arg2: vtkIdType) {.importcpp: "SetSizeRange",
                                    header: "vtkImageConnectivityFilter.h".}
proc SetSizeRange*(this: var vtkImageConnectivityFilter; _arg: array[2, vtkIdType]) {.
    importcpp: "SetSizeRange", header: "vtkImageConnectivityFilter.h".}
## !!!Ignored construct:  virtual vtkIdType * GetSizeRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << SizeRange  pointer  << this -> SizeRange ) ; return this -> SizeRange ; } VTK_WRAPEXCLUDE virtual void GetSizeRange ( vtkIdType & _arg1 , vtkIdType & _arg2 ) { _arg1 = this -> SizeRange [ 0 ] ; _arg2 = this -> SizeRange [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << SizeRange  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetSizeRange ( vtkIdType _arg [ 2 ] ) { this -> GetSizeRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetSizeRangeScalarRange*(this: var vtkImageConnectivityFilter; _arg1: cdouble;
                             _arg2: cdouble) {.
    importcpp: "SetSizeRangeScalarRange", header: "vtkImageConnectivityFilter.h".}
proc SetSizeRangeScalarRange*(this: var vtkImageConnectivityFilter;
                             _arg: array[2, cdouble]) {.
    importcpp: "SetSizeRangeScalarRange", header: "vtkImageConnectivityFilter.h".}
## !!!Ignored construct:  virtual double * GetSizeRangeScalarRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarRange  pointer  << this -> ScalarRange ) ; return this -> ScalarRange ; } VTK_WRAPEXCLUDE virtual void GetSizeRangeScalarRange ( double & _arg1 , double & _arg2 ) { _arg1 = this -> ScalarRange [ 0 ] ; _arg2 = this -> ScalarRange [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ScalarRange  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetSizeRangeScalarRange ( double _arg [ 2 ] ) { this -> GetSizeRangeScalarRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetLabelScalarTypeLabelModeExtractionModeLabelConstantValueGenerateRegionExtentsActiveComponent*(
    this: var vtkImageConnectivityFilter; _arg: cint) {.importcpp: "SetLabelScalarTypeLabelModeExtractionModeLabelConstantValueGenerateRegionExtentsActiveComponent",
    header: "vtkImageConnectivityFilter.h".}
## !!!Ignored construct:  virtual int GetLabelScalarTypeLabelModeExtractionModeLabelConstantValueGenerateRegionExtentsActiveComponent ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ActiveComponent  of  << this -> ActiveComponent ) ; return this -> ActiveComponent ; } ;
## Error: expected ';'!!!
