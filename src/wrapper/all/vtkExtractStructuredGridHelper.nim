## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtractGrid.h
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
##  @class   vtkExtractStructuredGridHelper
##  @brief   helper for extracting/sub-sampling
##   structured datasets.
##
##
##  vtkExtractStructuredGridHelper provides some common functionality that is
##  used by filters that extract and sub-sample structured data. Specifically,
##  it provides functionality for calculating the mapping from the output extent
##  of each process to the input extent.
##
##  @sa
##  vtkExtractGrid vtkExtractVOI vtkExtractRectilinearGrid
##

import
  vtkCommonDataModelModule, vtkObject

##  Forward declarations

discard "forward decl of vtkCellData"
discard "forward decl of vtkPointData"
discard "forward decl of vtkPoints"
discard "forward decl of vtkIndexMap"
##  END namespace detail

##  END namespace vtk

type
  vtkExtractStructuredGridHelper* {.importcpp: "vtkExtractStructuredGridHelper",
                                   header: "vtkExtractStructuredGridHelper.h",
                                   bycopy.} = object of vtkObject
    vtkExtractStructuredGridHelper* {.importc: "vtkExtractStructuredGridHelper".}: VTK_NEWINSTANCE
    ## *
    ##  \brief Invalidates the output extent.
    ##


proc New*(): ptr vtkExtractStructuredGridHelper {.
    importcpp: "vtkExtractStructuredGridHelper::New(@)",
    header: "vtkExtractStructuredGridHelper.h".}
type
  vtkExtractStructuredGridHelperSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkExtractStructuredGridHelper::IsTypeOf(@)",
    header: "vtkExtractStructuredGridHelper.h".}
proc IsA*(this: var vtkExtractStructuredGridHelper; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkExtractStructuredGridHelper.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkExtractStructuredGridHelper {.
    importcpp: "vtkExtractStructuredGridHelper::SafeDownCast(@)",
    header: "vtkExtractStructuredGridHelper.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkExtractStructuredGridHelper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtractStructuredGridHelper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtractStructuredGridHelper :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkExtractStructuredGridHelper; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkExtractStructuredGridHelper.h".}
## !!!Ignored construct:   Get & Set Macros virtual int * GetOutputWholeExtentOutputWholeExtent ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << OutputWholeExtent  pointer  << this -> OutputWholeExtent ) ; return this -> OutputWholeExtent ; } VTK_WRAPEXCLUDE virtual void GetOutputWholeExtentOutputWholeExtent ( int & _arg1 , int & _arg2 , int & _arg3 , int & _arg4 , int & _arg5 , int & _arg6 ) { _arg1 = this -> OutputWholeExtent [ 0 ] ; _arg2 = this -> OutputWholeExtent [ 1 ] ; _arg3 = this -> OutputWholeExtent [ 2 ] ; _arg4 = this -> OutputWholeExtent [ 3 ] ; _arg5 = this -> OutputWholeExtent [ 4 ] ; _arg6 = this -> OutputWholeExtent [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << OutputWholeExtent  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOutputWholeExtentOutputWholeExtent ( int _arg [ 6 ] ) { this -> GetOutputWholeExtentOutputWholeExtent ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ;
## Error: expected ';'!!!

proc Initialize*(this: var vtkExtractStructuredGridHelper; voi: array[6, cint];
                wholeExt: array[6, cint]; sampleRate: array[3, cint];
                includeBoundary: bool) {.importcpp: "Initialize", header: "vtkExtractStructuredGridHelper.h".}
proc IsValid*(this: vtkExtractStructuredGridHelper): bool {.noSideEffect,
    importcpp: "IsValid", header: "vtkExtractStructuredGridHelper.h".}
proc GetSize*(this: var vtkExtractStructuredGridHelper; dim: cint): cint {.
    importcpp: "GetSize", header: "vtkExtractStructuredGridHelper.h".}
proc GetMappedIndex*(this: var vtkExtractStructuredGridHelper; dim: cint; outIdx: cint): cint {.
    importcpp: "GetMappedIndex", header: "vtkExtractStructuredGridHelper.h".}
proc GetMappedIndexFromExtentValue*(this: var vtkExtractStructuredGridHelper;
                                   dim: cint; outExtVal: cint): cint {.
    importcpp: "GetMappedIndexFromExtentValue",
    header: "vtkExtractStructuredGridHelper.h".}
proc GetMappedExtentValue*(this: var vtkExtractStructuredGridHelper; dim: cint;
                          outExtVal: cint): cint {.
    importcpp: "GetMappedExtentValue", header: "vtkExtractStructuredGridHelper.h".}
proc GetMappedExtentValueFromIndex*(this: var vtkExtractStructuredGridHelper;
                                   dim: cint; outIdx: cint): cint {.
    importcpp: "GetMappedExtentValueFromIndex",
    header: "vtkExtractStructuredGridHelper.h".}
proc ComputeBeginAndEnd*(this: var vtkExtractStructuredGridHelper;
                        inExt: array[6, cint]; voi: array[6, cint];
                        begin: array[3, cint]; `end`: array[3, cint]) {.
    importcpp: "ComputeBeginAndEnd", header: "vtkExtractStructuredGridHelper.h".}
proc CopyPointsAndPointData*(this: var vtkExtractStructuredGridHelper;
                            inExt: array[6, cint]; outExt: array[6, cint];
                            pd: ptr vtkPointData; inpnts: ptr vtkPoints;
                            outPD: ptr vtkPointData; outpnts: ptr vtkPoints) {.
    importcpp: "CopyPointsAndPointData",
    header: "vtkExtractStructuredGridHelper.h".}
proc CopyCellData*(this: var vtkExtractStructuredGridHelper; inExt: array[6, cint];
                  outExt: array[6, cint]; cd: ptr vtkCellData; outCD: ptr vtkCellData) {.
    importcpp: "CopyCellData", header: "vtkExtractStructuredGridHelper.h".}
proc GetPartitionedVOI*(globalVOI: array[6, cint];
                       partitionedExtent: array[6, cint];
                       sampleRate: array[3, cint]; includeBoundary: bool;
                       partitionedVOI: array[6, cint]) {.
    importcpp: "vtkExtractStructuredGridHelper::GetPartitionedVOI(@)",
    header: "vtkExtractStructuredGridHelper.h".}
proc GetPartitionedOutputExtent*(globalVOI: array[6, cint];
                                partitionedVOI: array[6, cint];
                                outputWholeExtent: array[6, cint];
                                sampleRate: array[3, cint]; includeBoundary: bool;
                                partitionedOutputExtent: array[6, cint]) {.
    importcpp: "vtkExtractStructuredGridHelper::GetPartitionedOutputExtent(@)",
    header: "vtkExtractStructuredGridHelper.h".}