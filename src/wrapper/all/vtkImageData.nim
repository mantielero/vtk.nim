## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageData.h
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
##  @class   vtkImageData
##  @brief   topologically and geometrically regular array of data
##
##  vtkImageData is a data object that is a concrete implementation of
##  vtkDataSet. vtkImageData represents a geometric structure that is
##  a topological and geometrical regular array of points. Examples include
##  volumes (voxel data) and pixmaps. This representation supports images
##  up to three dimensions. The image may also be oriented (see the
##  DirectionMatrices and related transformation methods). Note however,
##  that not all filters support oriented images.
##
##  @sa
##  vtkImageTransform
##

import
  vtkCommonDataModelModule, vtkDataSet, vtkStructuredData

discard "forward decl of vtkDataArray"
discard "forward decl of vtkLine"
discard "forward decl of vtkMatrix3x3"
discard "forward decl of vtkMatrix4x4"
discard "forward decl of vtkPixel"
discard "forward decl of vtkVertex"
discard "forward decl of vtkVoxel"
type
  vtkImageData* {.importcpp: "vtkImageData", header: "vtkImageData.h", bycopy.} = object of vtkDataSet
    vtkImageData* {.importc: "vtkImageData".}: VTK_NEWINSTANCE
    ##  Variables used to define dataset physical orientation
    ##  The first method assumes Active Scalars
    ##  for the GetPoint method


proc New*(): ptr vtkImageData {.importcpp: "vtkImageData::New(@)",
                            header: "vtkImageData.h".}
proc ExtendedNew*(): ptr vtkImageData {.importcpp: "vtkImageData::ExtendedNew(@)",
                                    header: "vtkImageData.h".}
type
  vtkImageDataSuperclass* = vtkDataSet

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageData::IsTypeOf(@)", header: "vtkImageData.h".}
proc IsA*(this: var vtkImageData; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkImageData.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageData {.
    importcpp: "vtkImageData::SafeDownCast(@)", header: "vtkImageData.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageData :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSet :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageData :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageData :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageData; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageData.h".}
proc CopyStructure*(this: var vtkImageData; ds: ptr vtkDataSet) {.
    importcpp: "CopyStructure", header: "vtkImageData.h".}
proc GetDataObjectType*(this: var vtkImageData): cint {.
    importcpp: "GetDataObjectType", header: "vtkImageData.h".}
proc GetNumberOfCells*(this: var vtkImageData): vtkIdType {.
    importcpp: "GetNumberOfCells", header: "vtkImageData.h".}
proc GetNumberOfPoints*(this: var vtkImageData): vtkIdType {.
    importcpp: "GetNumberOfPoints", header: "vtkImageData.h".}
## !!!Ignored construct:  double * GetPoint ( vtkIdType ptId ) VTK_SIZEHINT ( 3 ) override ;
## Error: expected ';'!!!

proc GetPoint*(this: var vtkImageData; id: vtkIdType; x: array[3, cdouble]) {.
    importcpp: "GetPoint", header: "vtkImageData.h".}
proc GetCell*(this: var vtkImageData; cellId: vtkIdType): ptr vtkCell {.
    importcpp: "GetCell", header: "vtkImageData.h".}
proc GetCell*(this: var vtkImageData; i: cint; j: cint; k: cint): ptr vtkCell {.
    importcpp: "GetCell", header: "vtkImageData.h".}
proc GetCell*(this: var vtkImageData; cellId: vtkIdType; cell: ptr vtkGenericCell) {.
    importcpp: "GetCell", header: "vtkImageData.h".}
proc GetCellBounds*(this: var vtkImageData; cellId: vtkIdType;
                   bounds: array[6, cdouble]) {.importcpp: "GetCellBounds",
    header: "vtkImageData.h".}
proc FindPoint*(this: var vtkImageData; x: cdouble; y: cdouble; z: cdouble): vtkIdType {.
    importcpp: "FindPoint", header: "vtkImageData.h".}
proc FindPoint*(this: var vtkImageData; x: array[3, cdouble]): vtkIdType {.
    importcpp: "FindPoint", header: "vtkImageData.h".}
proc FindCell*(this: var vtkImageData; x: array[3, cdouble]; cell: ptr vtkCell;
              cellId: vtkIdType; tol2: cdouble; subId: var cint;
              pcoords: array[3, cdouble]; weights: ptr cdouble): vtkIdType {.
    importcpp: "FindCell", header: "vtkImageData.h".}
proc FindCell*(this: var vtkImageData; x: array[3, cdouble]; cell: ptr vtkCell;
              gencell: ptr vtkGenericCell; cellId: vtkIdType; tol2: cdouble;
              subId: var cint; pcoords: array[3, cdouble]; weights: ptr cdouble): vtkIdType {.
    importcpp: "FindCell", header: "vtkImageData.h".}
proc FindAndGetCell*(this: var vtkImageData; x: array[3, cdouble]; cell: ptr vtkCell;
                    cellId: vtkIdType; tol2: cdouble; subId: var cint;
                    pcoords: array[3, cdouble]; weights: ptr cdouble): ptr vtkCell {.
    importcpp: "FindAndGetCell", header: "vtkImageData.h".}
proc GetCellType*(this: var vtkImageData; cellId: vtkIdType): cint {.
    importcpp: "GetCellType", header: "vtkImageData.h".}
proc GetCellSize*(this: var vtkImageData; cellId: vtkIdType): vtkIdType {.
    importcpp: "GetCellSize", header: "vtkImageData.h".}
## using statement

proc GetCellPoints*(this: var vtkImageData; cellId: vtkIdType; ptIds: ptr vtkIdList) {.
    importcpp: "GetCellPoints", header: "vtkImageData.h".}
proc GetPointCells*(this: var vtkImageData; ptId: vtkIdType; cellIds: ptr vtkIdList) {.
    importcpp: "GetPointCells", header: "vtkImageData.h".}
proc ComputeBounds*(this: var vtkImageData) {.importcpp: "ComputeBounds",
    header: "vtkImageData.h".}
proc GetMaxCellSize*(this: var vtkImageData): cint {.importcpp: "GetMaxCellSize",
    header: "vtkImageData.h".}
proc GetCellNeighbors*(this: var vtkImageData; cellId: vtkIdType;
                      ptIds: ptr vtkIdList; cellIds: ptr vtkIdList) {.
    importcpp: "GetCellNeighbors", header: "vtkImageData.h".}
proc GetCellNeighbors*(this: var vtkImageData; cellId: vtkIdType;
                      ptIds: ptr vtkIdList; cellIds: ptr vtkIdList; seedLoc: ptr cint) {.
    importcpp: "GetCellNeighbors", header: "vtkImageData.h".}
proc Initialize*(this: var vtkImageData) {.importcpp: "Initialize",
                                       header: "vtkImageData.h".}
proc IsPointVisible*(this: var vtkImageData; ptId: vtkIdType): cuchar {.
    importcpp: "IsPointVisible", header: "vtkImageData.h".}
proc IsCellVisible*(this: var vtkImageData; cellId: vtkIdType): cuchar {.
    importcpp: "IsCellVisible", header: "vtkImageData.h".}
proc HasAnyBlankPoints*(this: var vtkImageData): bool {.
    importcpp: "HasAnyBlankPoints", header: "vtkImageData.h".}
proc HasAnyBlankCells*(this: var vtkImageData): bool {.importcpp: "HasAnyBlankCells",
    header: "vtkImageData.h".}
proc GetCellDims*(this: var vtkImageData; cellDims: array[3, cint]) {.
    importcpp: "GetCellDims", header: "vtkImageData.h".}
proc SetDimensions*(this: var vtkImageData; i: cint; j: cint; k: cint) {.
    importcpp: "SetDimensions", header: "vtkImageData.h".}
proc SetDimensions*(this: var vtkImageData; dims: array[3, cint]) {.
    importcpp: "SetDimensions", header: "vtkImageData.h".}
## !!!Ignored construct:  *
##  Get dimensions of this structured points dataset.
##  It is the number of points on each axis.
##  Dimensions are computed from Extents during this call.
##  \warning Non thread-safe, use second signature if you want it to be.
##  virtual int * GetDimensions ( ) VTK_SIZEHINT ( 3 ) ;
## Error: expected ';'!!!

proc GetDimensions*(this: var vtkImageData; dims: array[3, cint]) {.
    importcpp: "GetDimensions", header: "vtkImageData.h".}
when VTK_ID_TYPE_IMPL != VTK_INT:
  proc GetDimensions*(this: var vtkImageData; dims: array[3, vtkIdType]) {.
      importcpp: "GetDimensions", header: "vtkImageData.h".}
proc ComputeStructuredCoordinates*(this: var vtkImageData; x: array[3, cdouble];
                                  ijk: array[3, cint]; pcoords: array[3, cdouble]): cint {.
    importcpp: "ComputeStructuredCoordinates", header: "vtkImageData.h".}
proc GetVoxelGradient*(this: var vtkImageData; i: cint; j: cint; k: cint;
                      s: ptr vtkDataArray; g: ptr vtkDataArray) {.
    importcpp: "GetVoxelGradient", header: "vtkImageData.h".}
proc GetPointGradient*(this: var vtkImageData; i: cint; j: cint; k: cint;
                      s: ptr vtkDataArray; g: array[3, cdouble]) {.
    importcpp: "GetPointGradient", header: "vtkImageData.h".}
proc GetDataDimension*(this: var vtkImageData): cint {.importcpp: "GetDataDimension",
    header: "vtkImageData.h".}
proc ComputePointId*(this: var vtkImageData; ijk: array[3, cint]): vtkIdType {.
    importcpp: "ComputePointId", header: "vtkImageData.h".}
proc ComputeCellId*(this: var vtkImageData; ijk: array[3, cint]): vtkIdType {.
    importcpp: "ComputeCellId", header: "vtkImageData.h".}
proc SetAxisUpdateExtent*(this: var vtkImageData; axis: cint; min: cint; max: cint;
                         updateExtent: ptr cint; axisUpdateExtent: ptr cint) {.
    importcpp: "SetAxisUpdateExtent", header: "vtkImageData.h".}
proc GetAxisUpdateExtent*(this: var vtkImageData; axis: cint; min: var cint;
                         max: var cint; updateExtent: ptr cint) {.
    importcpp: "GetAxisUpdateExtent", header: "vtkImageData.h".}
proc SetExtent*(this: var vtkImageData; extent: array[6, cint]) {.
    importcpp: "SetExtent", header: "vtkImageData.h".}
proc SetExtent*(this: var vtkImageData; x1: cint; x2: cint; y1: cint; y2: cint; z1: cint;
               z2: cint) {.importcpp: "SetExtent", header: "vtkImageData.h".}
## !!!Ignored construct:  virtual int * GetExtent ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Extent  pointer  << this -> Extent ) ; return this -> Extent ; } VTK_WRAPEXCLUDE virtual void GetExtent ( int & _arg1 , int & _arg2 , int & _arg3 , int & _arg4 , int & _arg5 , int & _arg6 ) { _arg1 = this -> Extent [ 0 ] ; _arg2 = this -> Extent [ 1 ] ; _arg3 = this -> Extent [ 2 ] ; _arg4 = this -> Extent [ 3 ] ; _arg5 = this -> Extent [ 4 ] ; _arg6 = this -> Extent [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Extent  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetExtent ( int _arg [ 6 ] ) { this -> GetExtent ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ;
## Error: expected ';'!!!

proc GetScalarTypeMin*(this: var vtkImageData; meta_data: ptr vtkInformation): cdouble {.
    importcpp: "GetScalarTypeMin", header: "vtkImageData.h".}
proc GetScalarTypeMin*(this: var vtkImageData): cdouble {.
    importcpp: "GetScalarTypeMin", header: "vtkImageData.h".}
proc GetScalarTypeMax*(this: var vtkImageData; meta_data: ptr vtkInformation): cdouble {.
    importcpp: "GetScalarTypeMax", header: "vtkImageData.h".}
proc GetScalarTypeMax*(this: var vtkImageData): cdouble {.
    importcpp: "GetScalarTypeMax", header: "vtkImageData.h".}
proc GetScalarSize*(this: var vtkImageData; meta_data: ptr vtkInformation): cint {.
    importcpp: "GetScalarSize", header: "vtkImageData.h".}
proc GetScalarSize*(this: var vtkImageData): cint {.importcpp: "GetScalarSize",
    header: "vtkImageData.h".}
## !!!Ignored construct:  /@} /@{ *
##  Different ways to get the increments for moving around the data.
##  GetIncrements() calls ComputeIncrements() to ensure the increments are
##  up to date.  The first three methods compute the increments based on the
##  active scalar field while the next three, the scalar field is passed in.
##
##  Note that all methods which do not have the increments passed in are not
##  thread-safe. When working on a given `vtkImageData` instance on multiple
##  threads, each thread should use the `inc*` overloads to compute the
##  increments to avoid racing with other threads.
##  virtual vtkIdType * GetIncrements ( ) VTK_SIZEHINT ( 3 ) ;
## Error: expected ';'!!!

proc GetIncrements*(this: var vtkImageData; incX: var vtkIdType; incY: var vtkIdType;
                   incZ: var vtkIdType) {.importcpp: "GetIncrements",
                                       header: "vtkImageData.h".}
proc GetIncrements*(this: var vtkImageData; inc: array[3, vtkIdType]) {.
    importcpp: "GetIncrements", header: "vtkImageData.h".}
## !!!Ignored construct:  virtual vtkIdType * GetIncrements ( vtkDataArray * scalars ) VTK_SIZEHINT ( 3 ) ;
## Error: expected ';'!!!

proc GetIncrements*(this: var vtkImageData; scalars: ptr vtkDataArray;
                   incX: var vtkIdType; incY: var vtkIdType; incZ: var vtkIdType) {.
    importcpp: "GetIncrements", header: "vtkImageData.h".}
proc GetIncrements*(this: var vtkImageData; scalars: ptr vtkDataArray;
                   inc: array[3, vtkIdType]) {.importcpp: "GetIncrements",
    header: "vtkImageData.h".}
proc GetContinuousIncrements*(this: var vtkImageData; extent: array[6, cint];
                             incX: var vtkIdType; incY: var vtkIdType;
                             incZ: var vtkIdType) {.
    importcpp: "GetContinuousIncrements", header: "vtkImageData.h".}
proc GetContinuousIncrements*(this: var vtkImageData; scalars: ptr vtkDataArray;
                             extent: array[6, cint]; incX: var vtkIdType;
                             incY: var vtkIdType; incZ: var vtkIdType) {.
    importcpp: "GetContinuousIncrements", header: "vtkImageData.h".}
proc GetScalarPointerForExtent*(this: var vtkImageData; extent: array[6, cint]): pointer {.
    importcpp: "GetScalarPointerForExtent", header: "vtkImageData.h".}
proc GetScalarPointer*(this: var vtkImageData; coordinates: array[3, cint]): pointer {.
    importcpp: "GetScalarPointer", header: "vtkImageData.h".}
proc GetScalarPointer*(this: var vtkImageData; x: cint; y: cint; z: cint): pointer {.
    importcpp: "GetScalarPointer", header: "vtkImageData.h".}
proc GetScalarPointer*(this: var vtkImageData): pointer {.
    importcpp: "GetScalarPointer", header: "vtkImageData.h".}
proc GetScalarIndexForExtent*(this: var vtkImageData; extent: array[6, cint]): vtkIdType {.
    importcpp: "GetScalarIndexForExtent", header: "vtkImageData.h".}
proc GetScalarIndex*(this: var vtkImageData; coordinates: array[3, cint]): vtkIdType {.
    importcpp: "GetScalarIndex", header: "vtkImageData.h".}
proc GetScalarIndex*(this: var vtkImageData; x: cint; y: cint; z: cint): vtkIdType {.
    importcpp: "GetScalarIndex", header: "vtkImageData.h".}
proc GetScalarComponentAsFloat*(this: var vtkImageData; x: cint; y: cint; z: cint;
                               component: cint): cfloat {.
    importcpp: "GetScalarComponentAsFloat", header: "vtkImageData.h".}
proc SetScalarComponentFromFloat*(this: var vtkImageData; x: cint; y: cint; z: cint;
                                 component: cint; v: cfloat) {.
    importcpp: "SetScalarComponentFromFloat", header: "vtkImageData.h".}
proc GetScalarComponentAsDouble*(this: var vtkImageData; x: cint; y: cint; z: cint;
                                component: cint): cdouble {.
    importcpp: "GetScalarComponentAsDouble", header: "vtkImageData.h".}
proc SetScalarComponentFromDouble*(this: var vtkImageData; x: cint; y: cint; z: cint;
                                  component: cint; v: cdouble) {.
    importcpp: "SetScalarComponentFromDouble", header: "vtkImageData.h".}
proc AllocateScalars*(this: var vtkImageData; dataType: cint; numComponents: cint) {.
    importcpp: "AllocateScalars", header: "vtkImageData.h".}
proc AllocateScalars*(this: var vtkImageData; pipeline_info: ptr vtkInformation) {.
    importcpp: "AllocateScalars", header: "vtkImageData.h".}
proc CopyAndCastFrom*(this: var vtkImageData; inData: ptr vtkImageData;
                     extent: array[6, cint]) {.importcpp: "CopyAndCastFrom",
    header: "vtkImageData.h".}
proc CopyAndCastFrom*(this: var vtkImageData; inData: ptr vtkImageData; x0: cint;
                     x1: cint; y0: cint; y1: cint; z0: cint; z1: cint) {.
    importcpp: "CopyAndCastFrom", header: "vtkImageData.h".}
proc Crop*(this: var vtkImageData; updateExtent: ptr cint) {.importcpp: "Crop",
    header: "vtkImageData.h".}
proc GetActualMemorySize*(this: var vtkImageData): culong {.
    importcpp: "GetActualMemorySize", header: "vtkImageData.h".}
## !!!Ignored construct:  /@{ *
##  Set the spacing (width,height,length) of the cubical cells that
##  compose the data set.
##  virtual double * GetSpacingSpacing ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Spacing  pointer  << this -> Spacing ) ; return this -> Spacing ; } VTK_WRAPEXCLUDE virtual void GetSpacingSpacing ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Spacing [ 0 ] ; _arg2 = this -> Spacing [ 1 ] ; _arg3 = this -> Spacing [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Spacing  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetSpacingSpacing ( double _arg [ 3 ] ) { this -> GetSpacingSpacing ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetSpacing*(this: var vtkImageData; i: cdouble; j: cdouble; k: cdouble) {.
    importcpp: "SetSpacing", header: "vtkImageData.h".}
proc SetSpacing*(this: var vtkImageData; ijk: array[3, cdouble]) {.
    importcpp: "SetSpacing", header: "vtkImageData.h".}
## !!!Ignored construct:  /@} /@{ *
##  Set/Get the origin of the dataset. The origin is the position in world
##  coordinates of the point of extent (0,0,0). This point does not have to be
##  part of the dataset, in other words, the dataset extent does not have to
##  start at (0,0,0) and the origin can be outside of the dataset bounding
##  box.
##  The origin plus spacing determine the position in space of the points.
##  virtual double * GetSpacingSpacingOriginOrigin ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Origin  pointer  << this -> Origin ) ; return this -> Origin ; } VTK_WRAPEXCLUDE virtual void GetSpacingSpacingOriginOrigin ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Origin [ 0 ] ; _arg2 = this -> Origin [ 1 ] ; _arg3 = this -> Origin [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Origin  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetSpacingSpacingOriginOrigin ( double _arg [ 3 ] ) { this -> GetSpacingSpacingOriginOrigin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetOrigin*(this: var vtkImageData; i: cdouble; j: cdouble; k: cdouble) {.
    importcpp: "SetOrigin", header: "vtkImageData.h".}
proc SetOrigin*(this: var vtkImageData; ijk: array[3, cdouble]) {.
    importcpp: "SetOrigin", header: "vtkImageData.h".}
proc GetnameDirectionMatrix*(this: var vtkImageData): ptr vtkMatrix3x3 {.
    importcpp: "GetnameDirectionMatrix", header: "vtkImageData.h".}
proc SetDirectionMatrix*(this: var vtkImageData; m: ptr vtkMatrix3x3) {.
    importcpp: "SetDirectionMatrix", header: "vtkImageData.h".}
proc SetDirectionMatrix*(this: var vtkImageData; elements: array[9, cdouble]) {.
    importcpp: "SetDirectionMatrix", header: "vtkImageData.h".}
proc SetDirectionMatrix*(this: var vtkImageData; e00: cdouble; e01: cdouble;
                        e02: cdouble; e10: cdouble; e11: cdouble; e12: cdouble;
                        e20: cdouble; e21: cdouble; e22: cdouble) {.
    importcpp: "SetDirectionMatrix", header: "vtkImageData.h".}
proc GetnameDirectionMatrixIndexToPhysicalMatrix*(this: var vtkImageData): ptr vtkMatrix4x4 {.
    importcpp: "GetnameDirectionMatrixIndexToPhysicalMatrix",
    header: "vtkImageData.h".}
  ## /@}
  ## /@{
  ## *
  ##  Convert coordinates from index space (ijk) to physical space (xyz).
  ##
proc TransformContinuousIndexToPhysicalPoint*(this: var vtkImageData; i: cdouble;
    j: cdouble; k: cdouble; xyz: array[3, cdouble]) {.
    importcpp: "TransformContinuousIndexToPhysicalPoint", header: "vtkImageData.h".}
proc TransformContinuousIndexToPhysicalPoint*(this: var vtkImageData;
    ijk: array[3, cdouble]; xyz: array[3, cdouble]) {.
    importcpp: "TransformContinuousIndexToPhysicalPoint", header: "vtkImageData.h".}
proc TransformIndexToPhysicalPoint*(this: var vtkImageData; i: cint; j: cint; k: cint;
                                   xyz: array[3, cdouble]) {.
    importcpp: "TransformIndexToPhysicalPoint", header: "vtkImageData.h".}
proc TransformIndexToPhysicalPoint*(this: var vtkImageData; ijk: array[3, cint];
                                   xyz: array[3, cdouble]) {.
    importcpp: "TransformIndexToPhysicalPoint", header: "vtkImageData.h".}
proc TransformContinuousIndexToPhysicalPoint*(i: cdouble; j: cdouble; k: cdouble;
    origin: array[3, cdouble]; spacing: array[3, cdouble];
    direction: array[9, cdouble]; xyz: array[3, cdouble]) {.
    importcpp: "vtkImageData::TransformContinuousIndexToPhysicalPoint(@)",
    header: "vtkImageData.h".}
proc GetnameDirectionMatrixIndexToPhysicalMatrixPhysicalToIndexMatrix*(
    this: var vtkImageData): ptr vtkMatrix4x4 {.importcpp: "GetnameDirectionMatrixIndexToPhysicalMatrixPhysicalToIndexMatrix",
    header: "vtkImageData.h".}
  ## /@}
  ## /@{
  ## *
  ##  Convert coordinates from physical space (xyz) to index space (ijk).
  ##
proc TransformPhysicalPointToContinuousIndex*(this: var vtkImageData; x: cdouble;
    y: cdouble; z: cdouble; ijk: array[3, cdouble]) {.
    importcpp: "TransformPhysicalPointToContinuousIndex", header: "vtkImageData.h".}
proc TransformPhysicalPointToContinuousIndex*(this: var vtkImageData;
    xyz: array[3, cdouble]; ijk: array[3, cdouble]) {.
    importcpp: "TransformPhysicalPointToContinuousIndex", header: "vtkImageData.h".}
proc ComputeIndexToPhysicalMatrix*(origin: array[3, cdouble];
                                  spacing: array[3, cdouble];
                                  direction: array[9, cdouble];
                                  result: array[16, cdouble]) {.
    importcpp: "vtkImageData::ComputeIndexToPhysicalMatrix(@)",
    header: "vtkImageData.h".}
proc TransformPhysicalNormalToContinuousIndex*(this: var vtkImageData;
    xyz: array[3, cdouble]; ijk: array[3, cdouble]) {.
    importcpp: "TransformPhysicalNormalToContinuousIndex",
    header: "vtkImageData.h".}
proc TransformPhysicalPlaneToContinuousIndex*(this: var vtkImageData;
    pplane: array[4, cdouble]; iplane: array[4, cdouble]) {.
    importcpp: "TransformPhysicalPlaneToContinuousIndex", header: "vtkImageData.h".}
proc SetScalarType*(a1: cint; meta_data: ptr vtkInformation) {.
    importcpp: "vtkImageData::SetScalarType(@)", header: "vtkImageData.h".}
proc GetScalarType*(meta_data: ptr vtkInformation): cint {.
    importcpp: "vtkImageData::GetScalarType(@)", header: "vtkImageData.h".}
proc HasScalarType*(meta_data: ptr vtkInformation): bool {.
    importcpp: "vtkImageData::HasScalarType(@)", header: "vtkImageData.h".}
proc GetScalarType*(this: var vtkImageData): cint {.importcpp: "GetScalarType",
    header: "vtkImageData.h".}
proc GetScalarTypeAsString*(this: var vtkImageData): cstring {.
    importcpp: "GetScalarTypeAsString", header: "vtkImageData.h".}
proc SetNumberOfScalarComponents*(n: cint; meta_data: ptr vtkInformation) {.
    importcpp: "vtkImageData::SetNumberOfScalarComponents(@)",
    header: "vtkImageData.h".}
proc GetNumberOfScalarComponents*(meta_data: ptr vtkInformation): cint {.
    importcpp: "vtkImageData::GetNumberOfScalarComponents(@)",
    header: "vtkImageData.h".}
proc HasNumberOfScalarComponents*(meta_data: ptr vtkInformation): bool {.
    importcpp: "vtkImageData::HasNumberOfScalarComponents(@)",
    header: "vtkImageData.h".}
proc GetNumberOfScalarComponents*(this: var vtkImageData): cint {.
    importcpp: "GetNumberOfScalarComponents", header: "vtkImageData.h".}
proc CopyInformationFromPipeline*(this: var vtkImageData;
                                 information: ptr vtkInformation) {.
    importcpp: "CopyInformationFromPipeline", header: "vtkImageData.h".}
proc CopyInformationToPipeline*(this: var vtkImageData;
                               information: ptr vtkInformation) {.
    importcpp: "CopyInformationToPipeline", header: "vtkImageData.h".}
proc PrepareForNewData*(this: var vtkImageData) {.importcpp: "PrepareForNewData",
    header: "vtkImageData.h".}
proc ShallowCopy*(this: var vtkImageData; src: ptr vtkDataObject) {.
    importcpp: "ShallowCopy", header: "vtkImageData.h".}
proc DeepCopy*(this: var vtkImageData; src: ptr vtkDataObject) {.importcpp: "DeepCopy",
    header: "vtkImageData.h".}
proc GetArrayPointerForExtent*(this: var vtkImageData; array: ptr vtkDataArray;
                              extent: array[6, cint]): pointer {.
    importcpp: "GetArrayPointerForExtent", header: "vtkImageData.h".}
proc GetArrayPointer*(this: var vtkImageData; array: ptr vtkDataArray;
                     coordinates: array[3, cint]): pointer {.
    importcpp: "GetArrayPointer", header: "vtkImageData.h".}
proc GetTupleIndex*(this: var vtkImageData; array: ptr vtkDataArray;
                   coordinates: array[3, cint]): vtkIdType {.
    importcpp: "GetTupleIndex", header: "vtkImageData.h".}
proc GetArrayIncrements*(this: var vtkImageData; array: ptr vtkDataArray;
                        increments: array[3, vtkIdType]) {.
    importcpp: "GetArrayIncrements", header: "vtkImageData.h".}
proc ComputeInternalExtent*(this: var vtkImageData; intExt: ptr cint; tgtExt: ptr cint;
                           bnds: ptr cint) {.importcpp: "ComputeInternalExtent",
    header: "vtkImageData.h".}
proc GetExtentType*(this: var vtkImageData): cint {.importcpp: "GetExtentType",
    header: "vtkImageData.h".}
proc GetData*(info: ptr vtkInformation): ptr vtkImageData {.
    importcpp: "vtkImageData::GetData(@)", header: "vtkImageData.h".}
proc GetData*(v: ptr vtkInformationVector; i: cint = 0): ptr vtkImageData {.
    importcpp: "vtkImageData::GetData(@)", header: "vtkImageData.h".}
## ----------------------------------------------------------------------------

proc ComputeIncrements*(this: var vtkImageData) {.importcpp: "ComputeIncrements",
    header: "vtkImageData.h".}
## ----------------------------------------------------------------------------

proc ComputeIncrements*(this: var vtkImageData; numberOfComponents: cint) {.
    importcpp: "ComputeIncrements", header: "vtkImageData.h".}
## ----------------------------------------------------------------------------

proc ComputeIncrements*(this: var vtkImageData; scalars: ptr vtkDataArray) {.
    importcpp: "ComputeIncrements", header: "vtkImageData.h".}
## ----------------------------------------------------------------------------

proc GetPoint*(this: var vtkImageData; id: vtkIdType): ptr cdouble {.
    importcpp: "GetPoint", header: "vtkImageData.h".}
## ----------------------------------------------------------------------------

proc GetNumberOfPoints*(this: var vtkImageData): vtkIdType {.
    importcpp: "GetNumberOfPoints", header: "vtkImageData.h".}
## ----------------------------------------------------------------------------

proc GetDataDimension*(this: var vtkImageData): cint {.importcpp: "GetDataDimension",
    header: "vtkImageData.h".}