## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCellArray.h
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
##  @class   vtkCellArray
##  @brief   object to represent cell connectivity
##
##  vtkCellArray stores dataset topologies as an explicit connectivity table
##  listing the point ids that make up each cell.
##
##  Internally, the connectivity table is represented as two arrays: Offsets and
##  Connectivity.
##
##  Offsets is an array of [numCells+1] values indicating the index in the
##  Connectivity array where each cell's points start. The last value is always
##  the length of the Connectivity array.
##
##  The Connectivity array stores the lists of point ids for each cell.
##
##  Thus, for a dataset consisting of 2 triangles, a quad, and a line, the
##  internal arrays will appear as follows:
##
##  ```
##  Topology:
##  ---------
##  Cell 0: Triangle | point ids: {0, 1, 2}
##  Cell 1: Triangle | point ids: {5, 7, 2}
##  Cell 2: Quad     | point ids: {3, 4, 6, 7}
##  Cell 4: Line     | point ids: {5, 8}
##
##  vtkCellArray (current):
##  -----------------------
##  Offsets:      {0, 3, 6, 10, 12}
##  Connectivity: {0, 1, 2, 5, 7, 2, 3, 4, 6, 7, 5, 8}
##  ```
##
##  While this class provides traversal methods (the legacy InitTraversal(),
##  GetNextCell() methods, and the newer method GetCellAtId()) these are in
##  general not thread-safe. Whenever possible it is preferable to use a
##  local thread-safe, vtkCellArrayIterator object, which can be obtained via:
##
##  ```
##  auto iter = vtk::TakeSmartPointer(cellArray->NewIterator());
##  for (iter->GoToFirstCell(); !iter->IsDoneWithTraversal(); iter->GoToNextCell())
##  {
##    // do work with iter
##  }
##  ```
##  (Note however that depending on the type and structure of internal
##  storage, a cell array iterator may be significantly slower than direct
##  traversal over the cell array due to extra data copying. Factors of 3-4X
##  are not uncommon. See vtkCellArrayIterator for more information. Also note
##  that an iterator may become invalid if the internal vtkCellArray storage
##  is modified.)
##
##  Other methods are also available for allocation and memory-related
##  management; insertion of new cells into the vtkCellArray; and limited
##  editing operations such as replacing one cell with a new cell of the
##  same size.
##
##  The internal arrays may store either 32- or 64-bit values, though most of
##  the API will prefer to use vtkIdType to refer to items in these
##  arrays. This enables significant memory savings when vtkIdType is 64-bit,
##  but 32 bits are sufficient to store all of the values in the connectivity
##  table. Using 64-bit storage with a 32-bit vtkIdType is permitted, but
##  values too large to fit in a 32-bit signed integer will be truncated when
##  accessed through the API. (The particular internal storage type has
##  implications on performance depending on vtkIdType. If the internal
##  storage is equivalent to vtkIdType, then methods that return pointers to
##  arrays of point ids can share the internal storage; otherwise a copy of
##  internal memory must be performed.)
##
##  Methods for managing the storage type are:
##
##  - `bool IsStorage64Bit()`
##  - `bool IsStorageShareable() // Can pointers to internal storage be shared`
##  - `void Use32BitStorage()`
##  - `void Use64BitStorage()`
##  - `void UseDefaultStorage() // Depends on vtkIdType`
##  - `bool CanConvertTo32BitStorage()`
##  - `bool CanConvertTo64BitStorage()`
##  - `bool CanConvertToDefaultStorage() // Depends on vtkIdType`
##  - `bool ConvertTo32BitStorage()`
##  - `bool ConvertTo64BitStorage()`
##  - `bool ConvertToDefaultStorage() // Depends on vtkIdType`
##  - `bool ConvertToSmallestStorage() // Depends on current values in arrays`
##
##  Note that some legacy methods are still available that reflect the
##  previous storage format of this data, which embedded the cell sizes into
##  the Connectivity array:
##
##  ```
##  vtkCellArray (legacy):
##  ----------------------
##  Connectivity: {3, 0, 1, 2, 3, 5, 7, 2, 4, 3, 4, 6, 7, 2, 5, 8}
##                 |--Cell 0--||--Cell 1--||----Cell 2---||--C3-|
##  ```
##
##  The methods require an external lookup table to allow random access, which
##  was historically stored in the vtkCellTypes object. The following methods in
##  vtkCellArray still support this style of indexing for compatibility
##  purposes, but these are slow as they must perform some complex computations
##  to convert the old "location" into the new "offset" and should be avoided.
##  These methods (and their modern equivalents) are:
##
##  - GetCell (Prefer GetCellAtId)
##  - GetInsertLocation (Prefer GetNumberOfCells)
##  - GetTraversalLocation (Prefer GetTraversalCellId, or better, NewIterator)
##  - SetTraversalLocation (Prefer SetTraversalLocation, or better, NewIterator)
##  - ReverseCell (Prefer ReverseCellAtId)
##  - ReplaceCell (Prefer ReplaceCellAtId)
##  - SetCells (Use ImportLegacyFormat, or SetData)
##  - GetData (Use ExportLegacyFormat, or Get[Offsets|Connectivity]Array[|32|64])
##
##  Some other legacy methods were completely removed, such as GetPointer() /
##  WritePointer(), since they are cannot be effectively emulated under the
##  current design. If external code needs to support both the old and new
##  version of the vtkCellArray API, the VTK_CELL_ARRAY_V2 preprocessor
##  definition may be used to detect which API is being compiled against.
##
##  @sa vtkCellTypes vtkCellLinks
##

## !!!Ignored construct:  # vtkCellArray_h [NewLine] # vtkCellArray_h [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkObject.h [NewLine] # vtkAOSDataArrayTemplate.h  Needed for inline methods # vtkCell.h  Needed for inline methods # vtkDataArrayRange.h  Needed for inline methods # vtkFeatures.h  for VTK_USE_MEMKIND # vtkSmartPointer.h  For vtkSmartPointer # vtkTypeInt32Array.h  Needed for inline methods # vtkTypeInt64Array.h  Needed for inline methods # vtkTypeList.h  Needed for ArrayList definition [NewLine] # < cassert >  for assert # < initializer_list >  for API # < type_traits >  for std::is_same # < utility >  for std::forward [NewLine] *
##  @def VTK_CELL_ARRAY_V2
##  @brief This preprocessor definition indicates that the updated vtkCellArray
##  is being used. It may be used to conditionally switch between old and new
##  API when both must be supported.
##
##  For example:
##
##  ```
##  vtkIdType npts;
##
##  #ifdef VTK_CELL_ARRAY_V2
##  const vtkIdType *pts;
##  #else // VTK_CELL_ARRAY_V2
##  vtkIdType *pts'
##  #endif // VTK_CELL_ARRAY_V2
##
##  cellArray->GetCell(legacyLocation, npts, pts);
##  ```
##  # [NewLine] class vtkCellArrayIterator ;
## Error: token expected: ( but got: <!!!

discard "forward decl of vtkIdTypeArray"
type
  vtkCellArrayvtkCellArray* {.importcpp: "vtkCellArray", header: "vtkCellArray.h",
                             bycopy.} = object of vtkObject ##  Helpers that allow Visit to return a value:
                                                       ## *
                                                       ##  @warning Advanced use only.
                                                       ##
                                                       ##  The Visit methods allow efficient bulk modification of the vtkCellArray
                                                       ##  internal arrays by dispatching a functor with the current storage arrays.
                                                       ##  The simplest functor is of the form:
                                                       ##
                                                       ##  ```
                                                       ##  // Functor definition:
                                                       ##  struct Worker
                                                       ##  {
                                                       ##    template <typename CellStateT>
                                                       ##    void operator()(CellStateT &state)
                                                       ##    {
                                                       ##      // Do work on state object
                                                       ##    }
                                                       ##  };
                                                       ##
                                                       ##  // Functor usage:
                                                       ##  vtkCellArray *cellArray = ...;
                                                       ##  cellArray->Visit(Worker{});
                                                       ##  ```
                                                       ##
                                                       ##  where `state` is an instance of the vtkCellArray::VisitState<ArrayT> class,
                                                       ##  instantiated for the current storage type of the cell array. See that
                                                       ##  class for usage details.
                                                       ##
                                                       ##  The functor may also:
                                                       ##  - Return a value from `operator()`
                                                       ##  - Pass additional arguments to `operator()`
                                                       ##  - Hold state.
                                                       ##
                                                       ##  A more advanced functor that does these things is shown below, along
                                                       ##  with its usage. This functor scans a range of cells and returns the largest
                                                       ##  cell's id:
                                                       ##
                                                       ##  ```
                                                       ##  struct FindLargestCellInRange
                                                       ##  {
                                                       ##    template <typename CellStateT>
                                                       ##    vtkIdType operator()(CellStateT &state,
                                                       ##                         vtkIdType rangeBegin,
                                                       ##                         vtkIdType rangeEnd)
                                                       ##    {
                                                       ##      vtkIdType largest = rangeBegin;
                                                       ##      vtkIdType largestSize = state.GetCellSize(rangeBegin);
                                                       ##      ++rangeBegin;
                                                       ##      for (; rangeBegin < rangeEnd; ++rangeBegin)
                                                       ##      {
                                                       ##        const vtkIdType curSize = state.GetCellSize(rangeBegin);
                                                       ##        if (curSize > largestSize)
                                                       ##        {
                                                       ##          largest = rangeBegin;
                                                       ##          largestSize = curSize;
                                                       ##        }
                                                       ##      }
                                                       ##
                                                       ##      return largest;
                                                       ##    }
                                                       ##  };
                                                       ##
                                                       ##  // Usage:
                                                       ##  // Scan cells in range [128, 1024) and return the id of the largest.
                                                       ##  vtkCellArray cellArray = ...;
                                                       ##  vtkIdType largest = cellArray->Visit(FindLargestCellInRange{},
                                                       ##                                       128, 1024);
                                                       ##  ```
                                                       ##  @{
                                                       ##
    vtkCellArrayvtkCellArray* {.importc: "vtkCellArray".}: VTK_NEWINSTANCE
    vtkCellArrayIterator* {.importc: "vtkCellArrayIterator".}: VTK_NEWINSTANCE
    ##  For GetData().

  ArrayType32* = vtkTypeInt32Array
  ArrayType64* = vtkTypeInt64Array

proc New*(): ptr vtkCellArrayvtkCellArray {.importcpp: "vtkCellArray::New(@)",
                                        header: "vtkCellArray.h".}
type
  vtkCellArrayvtkCellArraySuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCellArray::IsTypeOf(@)", header: "vtkCellArray.h".}
proc IsA*(this: var vtkCellArrayvtkCellArray; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkCellArray.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCellArrayvtkCellArray {.
    importcpp: "vtkCellArray::SafeDownCast(@)", header: "vtkCellArray.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCellArray :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCellArray :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCellArray :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCellArrayvtkCellArray; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCellArray.h".}
proc PrintDebug*(this: var vtkCellArrayvtkCellArray; os: var ostream) {.
    importcpp: "PrintDebug", header: "vtkCellArray.h".}
type
  StorageArrayList* = Create[ArrayType32, ArrayType64]
  InputArrayList* = typename

## !!!Ignored construct:  vtkTypeList :: Unique < vtkTypeList :: Create < vtkAOSDataArrayTemplate < int > , vtkAOSDataArrayTemplate < long > , vtkAOSDataArrayTemplate < long long >> > :: Result ;
## Error: identifier expected, but got: <!!!

proc Allocate*(this: var vtkCellArrayvtkCellArray; sz: vtkIdType;
              vtkNotUsed: proc (a1: ext): vtkIdType = 1000): vtkTypeBool {.
    importcpp: "Allocate", header: "vtkCellArray.h".}
proc AllocateEstimate*(this: var vtkCellArrayvtkCellArray; numCells: vtkIdType;
                      maxCellSize: vtkIdType): bool {.
    importcpp: "AllocateEstimate", header: "vtkCellArray.h".}
proc AllocateExact*(this: var vtkCellArrayvtkCellArray; numCells: vtkIdType;
                   connectivitySize: vtkIdType): bool {.importcpp: "AllocateExact",
    header: "vtkCellArray.h".}
proc AllocateCopy*(this: var vtkCellArrayvtkCellArray;
                  other: ptr vtkCellArrayvtkCellArray): bool {.
    importcpp: "AllocateCopy", header: "vtkCellArray.h".}
proc ResizeExact*(this: var vtkCellArrayvtkCellArray; numCells: vtkIdType;
                 connectivitySize: vtkIdType): bool {.importcpp: "ResizeExact",
    header: "vtkCellArray.h".}
proc Initialize*(this: var vtkCellArrayvtkCellArray) {.importcpp: "Initialize",
    header: "vtkCellArray.h".}
proc Reset*(this: var vtkCellArrayvtkCellArray) {.importcpp: "Reset",
    header: "vtkCellArray.h".}
proc Squeeze*(this: var vtkCellArrayvtkCellArray) {.importcpp: "Squeeze",
    header: "vtkCellArray.h".}
proc IsValid*(this: var vtkCellArrayvtkCellArray): bool {.importcpp: "IsValid",
    header: "vtkCellArray.h".}
proc GetNumberOfCells*(this: vtkCellArrayvtkCellArray): vtkIdType {.noSideEffect,
    importcpp: "GetNumberOfCells", header: "vtkCellArray.h".}
proc GetNumberOfOffsets*(this: vtkCellArrayvtkCellArray): vtkIdType {.noSideEffect,
    importcpp: "GetNumberOfOffsets", header: "vtkCellArray.h".}
proc GetOffset*(this: var vtkCellArrayvtkCellArray; cellId: vtkIdType): vtkIdType {.
    importcpp: "GetOffset", header: "vtkCellArray.h".}
proc GetNumberOfConnectivityIds*(this: vtkCellArrayvtkCellArray): vtkIdType {.
    noSideEffect, importcpp: "GetNumberOfConnectivityIds", header: "vtkCellArray.h".}
## !!!Ignored construct:  * NewIterator ( ) ;
## Error: identifier expected, but got: *!!!

## !!!Ignored construct:  # __VTK_WRAP__  The wrappers have issues with some of these templates *
##  Set the internal data arrays to the supplied offsets and connectivity
##  arrays.
##
##  Note that the input arrays may be copied and not used directly. To avoid
##  copying, use vtkIdTypeArray, vtkCellArray::ArrayType32, or
##  vtkCellArray::ArrayType64.
##
##  @{
##  [NewLine] void SetData ( vtkTypeInt32Array * offsets , vtkTypeInt32Array * connectivity ) ;
## Error: identifier expected, but got: *@}!!!

proc SetData*(this: var vtkCellArrayvtkCellArray; offsets: ptr vtkTypeInt64Array;
             connectivity: ptr vtkTypeInt64Array) {.importcpp: "SetData",
    header: "vtkCellArray.h".}
proc SetData*(this: var vtkCellArrayvtkCellArray;
             offsets: ptr vtkCellArrayvtkIdTypeArray;
             connectivity: ptr vtkCellArrayvtkIdTypeArray) {.importcpp: "SetData",
    header: "vtkCellArray.h".}
proc SetData*(this: var vtkCellArrayvtkCellArray;
             offsets: ptr vtkAOSDataArrayTemplate[cint];
             connectivity: ptr vtkAOSDataArrayTemplate[cint]) {.
    importcpp: "SetData", header: "vtkCellArray.h".}
proc SetData*(this: var vtkCellArrayvtkCellArray;
             offsets: ptr vtkAOSDataArrayTemplate[clong];
             connectivity: ptr vtkAOSDataArrayTemplate[clong]) {.
    importcpp: "SetData", header: "vtkCellArray.h".}
proc SetData*(this: var vtkCellArrayvtkCellArray;
             offsets: ptr vtkAOSDataArrayTemplate[clonglong];
             connectivity: ptr vtkAOSDataArrayTemplate[clonglong]) {.
    importcpp: "SetData", header: "vtkCellArray.h".}
proc SetData*(this: var vtkCellArrayvtkCellArray; offsets: ptr vtkDataArray;
             connectivity: ptr vtkDataArray): bool {.importcpp: "SetData",
    header: "vtkCellArray.h".}
proc SetData*(this: var vtkCellArrayvtkCellArray; cellSize: vtkIdType;
             connectivity: ptr vtkDataArray): bool {.importcpp: "SetData",
    header: "vtkCellArray.h".}
proc IsStorage64Bit*(this: vtkCellArrayvtkCellArray): bool {.noSideEffect,
    importcpp: "IsStorage64Bit", header: "vtkCellArray.h".}
proc IsStorageShareable*(this: vtkCellArrayvtkCellArray): bool {.noSideEffect,
    importcpp: "IsStorageShareable", header: "vtkCellArray.h".}
proc Use32BitStorage*(this: var vtkCellArrayvtkCellArray) {.
    importcpp: "Use32BitStorage", header: "vtkCellArray.h".}
proc Use64BitStorage*(this: var vtkCellArrayvtkCellArray) {.
    importcpp: "Use64BitStorage", header: "vtkCellArray.h".}
proc UseDefaultStorage*(this: var vtkCellArrayvtkCellArray) {.
    importcpp: "UseDefaultStorage", header: "vtkCellArray.h".}
proc CanConvertTo32BitStorage*(this: vtkCellArrayvtkCellArray): bool {.noSideEffect,
    importcpp: "CanConvertTo32BitStorage", header: "vtkCellArray.h".}
proc CanConvertTo64BitStorage*(this: vtkCellArrayvtkCellArray): bool {.noSideEffect,
    importcpp: "CanConvertTo64BitStorage", header: "vtkCellArray.h".}
proc CanConvertToDefaultStorage*(this: vtkCellArrayvtkCellArray): bool {.
    noSideEffect, importcpp: "CanConvertToDefaultStorage", header: "vtkCellArray.h".}
proc ConvertTo32BitStorage*(this: var vtkCellArrayvtkCellArray): bool {.
    importcpp: "ConvertTo32BitStorage", header: "vtkCellArray.h".}
proc ConvertTo64BitStorage*(this: var vtkCellArrayvtkCellArray): bool {.
    importcpp: "ConvertTo64BitStorage", header: "vtkCellArray.h".}
proc ConvertToDefaultStorage*(this: var vtkCellArrayvtkCellArray): bool {.
    importcpp: "ConvertToDefaultStorage", header: "vtkCellArray.h".}
proc ConvertToSmallestStorage*(this: var vtkCellArrayvtkCellArray): bool {.
    importcpp: "ConvertToSmallestStorage", header: "vtkCellArray.h".}
proc GetOffsetsArray*(this: var vtkCellArrayvtkCellArray): ptr vtkDataArray {.
    importcpp: "GetOffsetsArray", header: "vtkCellArray.h".}
proc GetOffsetsArray32*(this: var vtkCellArrayvtkCellArray): ptr ArrayType32 {.
    importcpp: "GetOffsetsArray32", header: "vtkCellArray.h".}
proc GetOffsetsArray64*(this: var vtkCellArrayvtkCellArray): ptr ArrayType64 {.
    importcpp: "GetOffsetsArray64", header: "vtkCellArray.h".}
proc GetConnectivityArray*(this: var vtkCellArrayvtkCellArray): ptr vtkDataArray {.
    importcpp: "GetConnectivityArray", header: "vtkCellArray.h".}
proc GetConnectivityArray32*(this: var vtkCellArrayvtkCellArray): ptr ArrayType32 {.
    importcpp: "GetConnectivityArray32", header: "vtkCellArray.h".}
proc GetConnectivityArray64*(this: var vtkCellArrayvtkCellArray): ptr ArrayType64 {.
    importcpp: "GetConnectivityArray64", header: "vtkCellArray.h".}
proc IsHomogeneous*(this: var vtkCellArrayvtkCellArray): vtkIdType {.
    importcpp: "IsHomogeneous", header: "vtkCellArray.h".}
proc InitTraversal*(this: var vtkCellArrayvtkCellArray) {.
    importcpp: "InitTraversal", header: "vtkCellArray.h".}
## !!!Ignored construct:  *
##  @warning This method is not thread-safe. Consider using the NewIterator()
##  iterator instead.
##
##  GetNextCell() gets the next cell in the list. If end of list
##  is encountered, 0 is returned. A value of 1 is returned whenever
##  npts and pts have been updated without error.
##
##  Do not modify the returned @a pts pointer, as it may point to shared
##  memory.
##
##  @note This method is not thread-safe and has tricky syntax to use
##  correctly. Prefer the use of vtkCellArrayIterator (see NewIterator()).
##  int GetNextCell ( vtkIdType & npts , vtkIdType const * & pts ) VTK_SIZEHINT ( pts , npts ) ;
## Error: expected ';'!!!

proc GetNextCell*(this: var vtkCellArrayvtkCellArray; pts: ptr vtkIdList): cint {.
    importcpp: "GetNextCell", header: "vtkCellArray.h".}
## !!!Ignored construct:  *
##  Return the point ids for the cell at @a cellId.
##
##  @warning Subsequent calls to this method may invalidate previous call
##  results if the internal storage type is not the same as vtkIdType and
##  cannot be shared through the @a cellPoints pointer. In other words, the
##  method may not be thread safe. Check if shareable (using
##  IsStorageShareable()), or use a vtkCellArrayIterator to guarantee thread
##  safety.
##  void GetCellAtId ( vtkIdType cellId , vtkIdType & cellSize , vtkIdType const * & cellPoints ) VTK_SIZEHINT ( cellPoints , cellSize ) VTK_EXPECTS ( 0 <= cellId && cellId < GetNumberOfCells ( ) ) ;
## Error: expected ';'!!!

## !!!Ignored construct:  *
##  Return the point ids for the cell at @a cellId.
##
##  Subsequent calls to this method may invalidate previous call
##  results if the internal storage type is not the same as vtkIdType and
##  cannot be shared through the @a cellPoints pointer. If that occurs,
##  the method will use ptIds, which is an object that is created by each thread,
##  to guarantee thread safety.
##  void GetCellAtId ( vtkIdType cellId , vtkIdType & cellSize , vtkIdType const * & cellPoints , vtkIdList * ptIds ) VTK_SIZEHINT ( cellPoints , cellSize ) VTK_EXPECTS ( 0 <= cellId && cellId < GetNumberOfCells ( ) ) ;
## Error: expected ';'!!!

## !!!Ignored construct:  *
##  Return the point ids for the cell at @a cellId. This always copies
##  the cell ids (i.e., the list of points @a pts into the supplied
##  vtkIdList). This method is thread safe.
##  void GetCellAtId ( vtkIdType cellId , vtkIdList * pts ) VTK_EXPECTS ( 0 <= cellId && cellId < GetNumberOfCells ( ) ) ;
## Error: expected ';'!!!

proc GetCellSize*(this: vtkCellArrayvtkCellArray; cellId: vtkIdType): vtkIdType {.
    noSideEffect, importcpp: "GetCellSize", header: "vtkCellArray.h".}
proc InsertNextCell*(this: var vtkCellArrayvtkCellArray; cell: ptr vtkCell): vtkIdType {.
    importcpp: "InsertNextCell", header: "vtkCellArray.h".}
## !!!Ignored construct:  *
##  Create a cell by specifying the number of points and an array of point
##  id's.  Return the cell id of the cell.
##  vtkIdType InsertNextCell ( vtkIdType npts , const vtkIdType * pts ) VTK_SIZEHINT ( pts , npts ) ;
## Error: expected ';'!!!

proc InsertNextCell*(this: var vtkCellArrayvtkCellArray; pts: ptr vtkIdList): vtkIdType {.
    importcpp: "InsertNextCell", header: "vtkCellArray.h".}
proc InsertNextCell*(this: var vtkCellArrayvtkCellArray;
                    cell: initializer_list[vtkIdType]): vtkIdType {.
    importcpp: "InsertNextCell", header: "vtkCellArray.h".}
proc InsertNextCell*(this: var vtkCellArrayvtkCellArray; npts: cint): vtkIdType {.
    importcpp: "InsertNextCell", header: "vtkCellArray.h".}
proc InsertCellPoint*(this: var vtkCellArrayvtkCellArray; id: vtkIdType) {.
    importcpp: "InsertCellPoint", header: "vtkCellArray.h".}
proc UpdateCellCount*(this: var vtkCellArrayvtkCellArray; npts: cint) {.
    importcpp: "UpdateCellCount", header: "vtkCellArray.h".}
proc GetTraversalCellId*(this: var vtkCellArrayvtkCellArray): vtkIdType {.
    importcpp: "GetTraversalCellId", header: "vtkCellArray.h".}
proc SetTraversalCellId*(this: var vtkCellArrayvtkCellArray; cellId: vtkIdType) {.
    importcpp: "SetTraversalCellId", header: "vtkCellArray.h".}
## !!!Ignored construct:  *@} *
##  Reverses the order of the point ids for the specified cell.
##  void ReverseCellAtId ( vtkIdType cellId ) VTK_EXPECTS ( 0 <= cellId && cellId < GetNumberOfCells ( ) ) ;
## Error: expected ';'!!!

proc ReplaceCellAtId*(this: var vtkCellArrayvtkCellArray; cellId: vtkIdType;
                     list: ptr vtkIdList) {.importcpp: "ReplaceCellAtId",
    header: "vtkCellArray.h".}
## !!!Ignored construct:  void ReplaceCellAtId ( vtkIdType cellId , vtkIdType cellSize , const vtkIdType * cellPoints ) VTK_EXPECTS ( 0 <= cellId && cellId < GetNumberOfCells ( ) ) VTK_SIZEHINT ( cellPoints , cellSize ) ;
## Error: expected ';'!!!

proc ReplaceCellAtId*(this: var vtkCellArrayvtkCellArray; cellId: vtkIdType;
                     cell: initializer_list[vtkIdType]) {.
    importcpp: "ReplaceCellAtId", header: "vtkCellArray.h".}
proc GetMaxCellSize*(this: var vtkCellArrayvtkCellArray): cint {.
    importcpp: "GetMaxCellSize", header: "vtkCellArray.h".}
proc DeepCopy*(this: var vtkCellArrayvtkCellArray; ca: ptr vtkCellArrayvtkCellArray) {.
    importcpp: "DeepCopy", header: "vtkCellArray.h".}
proc ShallowCopy*(this: var vtkCellArrayvtkCellArray;
                 ca: ptr vtkCellArrayvtkCellArray) {.importcpp: "ShallowCopy",
    header: "vtkCellArray.h".}
proc Append*(this: var vtkCellArrayvtkCellArray; src: ptr vtkCellArrayvtkCellArray;
            pointOffset: vtkIdType = 0) {.importcpp: "Append",
                                      header: "vtkCellArray.h".}
proc ExportLegacyFormat*(this: var vtkCellArrayvtkCellArray;
                        data: ptr vtkCellArrayvtkIdTypeArray) {.
    importcpp: "ExportLegacyFormat", header: "vtkCellArray.h".}
proc ImportLegacyFormat*(this: var vtkCellArrayvtkCellArray;
                        data: ptr vtkCellArrayvtkIdTypeArray) {.
    importcpp: "ImportLegacyFormat", header: "vtkCellArray.h".}
## !!!Ignored construct:  void ImportLegacyFormat ( const vtkIdType * data , vtkIdType len ) VTK_SIZEHINT ( data , len ) ;
## Error: expected ';'!!!

proc AppendLegacyFormat*(this: var vtkCellArrayvtkCellArray;
                        data: ptr vtkCellArrayvtkIdTypeArray;
                        ptOffset: vtkIdType = 0) {.importcpp: "AppendLegacyFormat",
    header: "vtkCellArray.h".}
## !!!Ignored construct:  void AppendLegacyFormat ( const vtkIdType * data , vtkIdType len , vtkIdType ptOffset = 0 ) VTK_SIZEHINT ( data , len ) ;
## Error: expected ';'!!!

proc GetActualMemorySize*(this: vtkCellArrayvtkCellArray): culong {.noSideEffect,
    importcpp: "GetActualMemorySize", header: "vtkCellArray.h".}
## !!!Ignored construct:   The following code is used to support  The wrappers get understandably confused by some of the template code below # __VTK_WRAP__ [NewLine]  Holds connectivity and offset arrays of the given ArrayType. template < typename ArrayT > struct VisitState { using ArrayType = ArrayT ; using ValueType = typename ArrayType :: ValueType ; using CellRangeType = decltype ( vtk :: DataArrayValueRange < 1 > ( std :: declval < ArrayType > ( ) ) ) ;  We can't just use is_same here, since binary compatible representations
##  (e.g. int and long) are distinct types. Instead, ensure that ValueType
##  is a signed integer the same size as vtkIdType.
##  If this value is true, ValueType pointers may be safely converted to
##  vtkIdType pointers via reinterpret cast. static constexpr bool ValueTypeIsSameAsIdType = std :: is_integral < ValueType > :: value && std :: is_signed < ValueType > :: value && ( sizeof ( ValueType ) == sizeof ( vtkIdType ) ) ; ArrayType * GetOffsets ( ) { return this -> Offsets ; } const ArrayType * GetOffsets ( ) const { return this -> Offsets ; } ArrayType * GetConnectivity ( ) { return this -> Connectivity ; } const ArrayType * GetConnectivity ( ) const { return this -> Connectivity ; } vtkIdType GetNumberOfCells ( ) const ; vtkIdType GetBeginOffset ( vtkIdType cellId ) const ; vtkIdType GetEndOffset ( vtkIdType cellId ) const ; vtkIdType GetCellSize ( vtkIdType cellId ) const ; CellRangeType GetCellRange ( vtkIdType cellId ) ; friend class vtkCellArray ; protected : VisitState ( ) { this -> Connectivity = vtkSmartPointer < ArrayType > :: New ( ) ; this -> Offsets = vtkSmartPointer < ArrayType > :: New ( ) ; this -> Offsets -> InsertNextValue ( 0 ) ; if ( vtkObjectBase :: GetUsingMemkind ( ) ) { this -> IsInMemkind = true ; } } ~ VisitState ( ) = default ; void * operator new ( size_t nSize ) { void * r ; # VTK_USE_MEMKIND [NewLine] r = vtkObjectBase :: GetCurrentMallocFunction ( ) ( nSize ) ; # [NewLine] r = malloc ( nSize ) ; # [NewLine] return r ; } void operator delete ( void * p ) { # VTK_USE_MEMKIND [NewLine] VisitState * a = static_cast < VisitState * > ( p ) ; if ( a -> IsInMemkind ) { vtkObjectBase :: GetAlternateFreeFunction ( ) ( p ) ; } else { free ( p ) ; } # [NewLine] free ( p ) ; # [NewLine] } vtkSmartPointer < ArrayType > Connectivity ; vtkSmartPointer < ArrayType > Offsets ; private : VisitState ( const VisitState & ) = delete ; VisitState & operator = ( const VisitState & ) = delete ; bool IsInMemkind = false ; } ;
## Error: identifier expected, but got:  Holds connectivity and offset arrays of the given ArrayType.!!!

## !!!Ignored construct:  private :  Helpers that allow Visit to return a value: template < typename Functor , typename ... Args > [end of template] using GetReturnType = decltype ( std :: declval < Functor > ( ) ( std :: declval < VisitState < ArrayType32 > & > ( ) , std :: declval < Args > ( ) ... ) ) ;
## Error: identifier expected, but got: ...!!!

## !!!Ignored construct:  template < typename Functor , typename ... Args > [end of template] struct ReturnsVoid : std :: is_same < GetReturnType < Functor , Args ... > , void > { } ;
## Error: identifier expected, but got: ...!!!

## !!!Ignored construct:  public : *
##  @warning Advanced use only.
##
##  The Visit methods allow efficient bulk modification of the vtkCellArray
##  internal arrays by dispatching a functor with the current storage arrays.
##  The simplest functor is of the form:
##
##  ```
##  // Functor definition:
##  struct Worker
##  {
##    template <typename CellStateT>
##    void operator()(CellStateT &state)
##    {
##      // Do work on state object
##    }
##  };
##
##  // Functor usage:
##  vtkCellArray *cellArray = ...;
##  cellArray->Visit(Worker{});
##  ```
##
##  where `state` is an instance of the vtkCellArray::VisitState<ArrayT> class,
##  instantiated for the current storage type of the cell array. See that
##  class for usage details.
##
##  The functor may also:
##  - Return a value from `operator()`
##  - Pass additional arguments to `operator()`
##  - Hold state.
##
##  A more advanced functor that does these things is shown below, along
##  with its usage. This functor scans a range of cells and returns the largest
##  cell's id:
##
##  ```
##  struct FindLargestCellInRange
##  {
##    template <typename CellStateT>
##    vtkIdType operator()(CellStateT &state,
##                         vtkIdType rangeBegin,
##                         vtkIdType rangeEnd)
##    {
##      vtkIdType largest = rangeBegin;
##      vtkIdType largestSize = state.GetCellSize(rangeBegin);
##      ++rangeBegin;
##      for (; rangeBegin < rangeEnd; ++rangeBegin)
##      {
##        const vtkIdType curSize = state.GetCellSize(rangeBegin);
##        if (curSize > largestSize)
##        {
##          largest = rangeBegin;
##          largestSize = curSize;
##        }
##      }
##
##      return largest;
##    }
##  };
##
##  // Usage:
##  // Scan cells in range [128, 1024) and return the id of the largest.
##  vtkCellArray cellArray = ...;
##  vtkIdType largest = cellArray->Visit(FindLargestCellInRange{},
##                                       128, 1024);
##  ```
##  @{
##  template < typename Functor , typename ... Args , typename = typename std :: enable_if < ReturnsVoid < Functor , Args ... > :: value > :: type > [end of template] void Visit ( Functor && functor , Args && ... args ) { if ( this -> Storage . Is64Bit ( ) ) {  If you get an error on the next line, a call to Visit(functor, Args...)
##  is being called with arguments that do not match the functor's call
##  signature. See the Visit documentation for details. functor ( this -> Storage . GetArrays64 ( ) , std :: forward < Args > ( args ) ... ) ; } else {  If you get an error on the next line, a call to Visit(functor, Args...)
##  is being called with arguments that do not match the functor's call
##  signature. See the Visit documentation for details. functor ( this -> Storage . GetArrays32 ( ) , std :: forward < Args > ( args ) ... ) ; } } template < typename Functor , typename ... Args , typename = typename std :: enable_if < ReturnsVoid < Functor , Args ... > :: value > :: type > void Visit ( Functor && functor , Args && ... args ) const { if ( this -> Storage . Is64Bit ( ) ) {  If you get an error on the next line, a call to Visit(functor, Args...)
##  is being called with arguments that do not match the functor's call
##  signature. See the Visit documentation for details. functor ( this -> Storage . GetArrays64 ( ) , std :: forward < Args > ( args ) ... ) ; } else {  If you get an error on the next line, a call to Visit(functor, Args...)
##  is being called with arguments that do not match the functor's call
##  signature. See the Visit documentation for details. functor ( this -> Storage . GetArrays32 ( ) , std :: forward < Args > ( args ) ... ) ; } } template < typename Functor , typename ... Args , typename = typename std :: enable_if < ! ReturnsVoid < Functor , Args ... > :: value > :: type > GetReturnType < Functor , Args ... > Visit ( Functor && functor , Args && ... args ) { if ( this -> Storage . Is64Bit ( ) ) {  If you get an error on the next line, a call to Visit(functor, Args...)
##  is being called with arguments that do not match the functor's call
##  signature. See the Visit documentation for details. return functor ( this -> Storage . GetArrays64 ( ) , std :: forward < Args > ( args ) ... ) ; } else {  If you get an error on the next line, a call to Visit(functor, Args...)
##  is being called with arguments that do not match the functor's call
##  signature. See the Visit documentation for details. return functor ( this -> Storage . GetArrays32 ( ) , std :: forward < Args > ( args ) ... ) ; } } template < typename Functor , typename ... Args , typename = typename std :: enable_if < ! ReturnsVoid < Functor , Args ... > :: value > :: type > GetReturnType < Functor , Args ... > Visit ( Functor && functor , Args && ... args ) const { if ( this -> Storage . Is64Bit ( ) ) {  If you get an error on the next line, a call to Visit(functor, Args...)
##  is being called with arguments that do not match the functor's call
##  signature. See the Visit documentation for details. return functor ( this -> Storage . GetArrays64 ( ) , std :: forward < Args > ( args ) ... ) ; } else {  If you get an error on the next line, a call to Visit(functor, Args...)
##  is being called with arguments that do not match the functor's call
##  signature. See the Visit documentation for details. return functor ( this -> Storage . GetArrays32 ( ) , std :: forward < Args > ( args ) ... ) ; } } * @} #  __VTK_WRAP__ [NewLine] =================== Begin Legacy Methods ===================================
##  These should be deprecated at some point as they are confusing or very slow *
##  Set the number of cells in the array.
##  DO NOT do any kind of allocation, advanced use only.
##
##  @note This call has no effect.
##  virtual void SetNumberOfCells ( vtkIdType ) ;
## Error: identifier expected, but got: ...!!!

proc EstimateSize*(this: var vtkCellArrayvtkCellArray; numCells: vtkIdType;
                  maxPtsPerCell: cint): vtkIdType {.importcpp: "EstimateSize",
    header: "vtkCellArray.h".}
proc GetSize*(this: var vtkCellArrayvtkCellArray): vtkIdType {.importcpp: "GetSize",
    header: "vtkCellArray.h".}
proc GetNumberOfConnectivityEntries*(this: var vtkCellArrayvtkCellArray): vtkIdType {.
    importcpp: "GetNumberOfConnectivityEntries", header: "vtkCellArray.h".}
## !!!Ignored construct:  *
##  Internal method used to retrieve a cell given a legacy offset location.
##
##  @warning Subsequent calls to this method may invalidate previous call
##  results.
##
##  @note The location-based API is now a super-slow compatibility layer.
##  Prefer GetCellAtId.
##  void GetCell ( vtkIdType loc , vtkIdType & npts , const vtkIdType * & pts ) VTK_EXPECTS ( 0 <= loc && loc < GetNumberOfConnectivityEntries ( ) ) VTK_SIZEHINT ( pts , npts ) ;
## Error: expected ';'!!!

## !!!Ignored construct:  *
##  Internal method used to retrieve a cell given a legacy offset location.
##
##  @note The location-based API is now a super-slow compatibility layer.
##  Prefer GetCellAtId.
##  void GetCell ( vtkIdType loc , vtkIdList * pts ) VTK_EXPECTS ( 0 <= loc && loc < GetNumberOfConnectivityEntries ( ) ) ;
## Error: expected ';'!!!

proc GetInsertLocation*(this: var vtkCellArrayvtkCellArray; npts: cint): vtkIdType {.
    importcpp: "GetInsertLocation", header: "vtkCellArray.h".}
proc GetTraversalLocation*(this: var vtkCellArrayvtkCellArray): vtkIdType {.
    importcpp: "GetTraversalLocation", header: "vtkCellArray.h".}
proc GetTraversalLocation*(this: var vtkCellArrayvtkCellArray; npts: vtkIdType): vtkIdType {.
    importcpp: "GetTraversalLocation", header: "vtkCellArray.h".}
proc SetTraversalLocation*(this: var vtkCellArrayvtkCellArray; loc: vtkIdType) {.
    importcpp: "SetTraversalLocation", header: "vtkCellArray.h".}
## !!!Ignored construct:  *@} *
##  Special method inverts ordering of cell at the specified legacy location.
##  Must be called carefully or the cell topology may be corrupted.
##
##  @note The location-based API is now a super-slow compatibility layer.
##  Prefer ReverseCellAtId;
##  void ReverseCell ( vtkIdType loc ) VTK_EXPECTS ( 0 <= loc && loc < GetNumberOfConnectivityEntries ( ) ) ;
## Error: expected ';'!!!

## !!!Ignored construct:  *
##  Replace the point ids of the cell at the legacy location with a different
##  list of point ids. Calling this method does not mark the vtkCellArray as
##  modified. This is the responsibility of the caller and may be done after
##  multiple calls to ReplaceCell. This call does not support changing the
##  number of points in the cell -- the caller must ensure that the target
##  cell has npts points.
##
##  @note The location-based API is now a super-slow compatibility layer.
##  Prefer ReplaceCellAtId.
##  void ReplaceCell ( vtkIdType loc , int npts , const vtkIdType pts [ ] ) VTK_EXPECTS ( 0 <= loc && loc < GetNumberOfConnectivityEntries ( ) ) VTK_SIZEHINT ( pts , npts ) ;
## Error: expected ';'!!!

proc SetCells*(this: var vtkCellArrayvtkCellArray; ncells: vtkIdType;
              cells: ptr vtkCellArrayvtkIdTypeArray) {.importcpp: "SetCells",
    header: "vtkCellArray.h".}
proc GetData*(this: var vtkCellArrayvtkCellArray): ptr vtkCellArrayvtkIdTypeArray {.
    importcpp: "GetData", header: "vtkCellArray.h".}
## !!!Ignored construct:  { 0 } ;
## Error: identifier expected, but got: {!!!

## !!!Ignored construct:  template < typename ArrayT > [end of template] vtkIdType vtkCellArray :: VisitState < ArrayT > :: GetNumberOfCells ( ) const { return this -> Offsets -> GetNumberOfValues ( ) - 1 ; } template < typename ArrayT > vtkIdType vtkCellArray :: VisitState < ArrayT > :: GetBeginOffset ( vtkIdType cellId ) const { return static_cast < vtkIdType > ( this -> Offsets -> GetValue ( cellId ) ) ; } template < typename ArrayT > vtkIdType vtkCellArray :: VisitState < ArrayT > :: GetEndOffset ( vtkIdType cellId ) const { return static_cast < vtkIdType > ( this -> Offsets -> GetValue ( cellId + 1 ) ) ; } template < typename ArrayT > vtkIdType vtkCellArray :: VisitState < ArrayT > :: GetCellSize ( vtkIdType cellId ) const { return this -> GetEndOffset ( cellId ) - this -> GetBeginOffset ( cellId ) ; } template < typename ArrayT > typename vtkCellArray :: VisitState < ArrayT > :: CellRangeType vtkCellArray :: VisitState < ArrayT > :: GetCellRange ( vtkIdType cellId ) { return vtk :: DataArrayValueRange < 1 > ( this -> GetConnectivity ( ) , this -> GetBeginOffset ( cellId ) , this -> GetEndOffset ( cellId ) ) ; } namespace vtkCellArray_detail { struct InsertNextCellImpl {  Insert full cell template < typename CellStateT > vtkIdType operator ( ) ( CellStateT & state , const vtkIdType npts , const vtkIdType pts [ ] ) { using ValueType = typename CellStateT :: ValueType ; auto * conn = state . GetConnectivity ( ) ; auto * offsets = state . GetOffsets ( ) ; const vtkIdType cellId = offsets -> GetNumberOfValues ( ) - 1 ; offsets -> InsertNextValue ( static_cast < ValueType > ( conn -> GetNumberOfValues ( ) + npts ) ) ; for ( vtkIdType i = 0 ; i < npts ; ++ i ) { conn -> InsertNextValue ( static_cast < ValueType > ( pts [ i ] ) ) ; } return cellId ; }  Just update offset table (for incremental API) template < typename CellStateT > vtkIdType operator ( ) ( CellStateT & state , const vtkIdType npts ) { using ValueType = typename CellStateT :: ValueType ; auto * conn = state . GetConnectivity ( ) ; auto * offsets = state . GetOffsets ( ) ; const vtkIdType cellId = offsets -> GetNumberOfValues ( ) - 1 ; offsets -> InsertNextValue ( static_cast < ValueType > ( conn -> GetNumberOfValues ( ) + npts ) ) ; return cellId ; } } ;  for incremental API: struct UpdateCellCountImpl { template < typename CellStateT > void operator ( ) ( CellStateT & state , const vtkIdType npts ) { using ValueType = typename CellStateT :: ValueType ; auto * offsets = state . GetOffsets ( ) ; const ValueType cellBegin = offsets -> GetValue ( offsets -> GetMaxId ( ) - 1 ) ; offsets -> SetValue ( offsets -> GetMaxId ( ) , static_cast < ValueType > ( cellBegin + npts ) ) ; } } ; struct GetCellSizeImpl { template < typename CellStateT > vtkIdType operator ( ) ( CellStateT & state , const vtkIdType cellId ) { return state . GetCellSize ( cellId ) ; } } ; struct GetCellAtIdImpl { template < typename CellStateT > void operator ( ) ( CellStateT & state , const vtkIdType cellId , vtkIdList * ids ) { using ValueType = typename CellStateT :: ValueType ; const auto cellPts = state . GetCellRange ( cellId ) ; ids -> SetNumberOfIds ( cellPts . size ( ) ) ; vtkIdType * idPtr = ids -> GetPointer ( 0 ) ; for ( ValueType ptId : cellPts ) { * idPtr ++ = static_cast < vtkIdType > ( ptId ) ; } }  SFINAE helper to check if a VisitState's connectivity array's memory
##  can be used as a vtkIdType*. template < typename CellStateT > struct CanShareConnPtr { private : using ValueType = typename CellStateT :: ValueType ; using ArrayType = typename CellStateT :: ArrayType ; using AOSArrayType = vtkAOSDataArrayTemplate < ValueType > ; static constexpr bool ValueTypeCompat = CellStateT :: ValueTypeIsSameAsIdType ; static constexpr bool ArrayTypeCompat = std :: is_base_of < AOSArrayType , ArrayType > :: value ; public : static constexpr bool value = ValueTypeCompat && ArrayTypeCompat ; } ; template < typename CellStateT > typename std :: enable_if < CanShareConnPtr < CellStateT > :: value , void > :: type operator ( ) ( CellStateT & state , const vtkIdType cellId , vtkIdType & cellSize , vtkIdType const * & cellPoints , vtkIdList * vtkNotUsed ( temp ) ) { const vtkIdType beginOffset = state . GetBeginOffset ( cellId ) ; const vtkIdType endOffset = state . GetEndOffset ( cellId ) ; cellSize = endOffset - beginOffset ;  This is safe, see CanShareConnPtr helper above. cellPoints = reinterpret_cast < vtkIdType * > ( state . GetConnectivity ( ) -> GetPointer ( beginOffset ) ) ; } template < typename CellStateT > typename std :: enable_if < ! CanShareConnPtr < CellStateT > :: value , void > :: type operator ( ) ( CellStateT & state , const vtkIdType cellId , vtkIdType & cellSize , vtkIdType const * & cellPoints , vtkIdList * temp ) { using ValueType = typename CellStateT :: ValueType ; const auto cellPts = state . GetCellRange ( cellId ) ; cellSize = cellPts . size ( ) ;  ValueType differs from vtkIdType, so we have to copy into a temporary
##  buffer: temp -> SetNumberOfIds ( cellSize ) ; vtkIdType * tempPtr = temp -> GetPointer ( 0 ) ; for ( ValueType ptId : cellPts ) { * tempPtr ++ = static_cast < vtkIdType > ( ptId ) ; } cellPoints = temp -> GetPointer ( 0 ) ; } } ; struct ResetImpl { template < typename CellStateT > void operator ( ) ( CellStateT & state ) { state . GetOffsets ( ) -> Reset ( ) ; state . GetConnectivity ( ) -> Reset ( ) ; state . GetOffsets ( ) -> InsertNextValue ( 0 ) ; } } ; }  end namespace vtkCellArray_detail ---------------------------------------------------------------------------- inline void vtkCellArray :: InitTraversal ( ) { this -> TraversalCellId = 0 ; } ---------------------------------------------------------------------------- inline int vtkCellArray :: GetNextCell ( vtkIdType & npts , vtkIdType const * & pts ) VTK_SIZEHINT ( pts , npts ) { if ( this -> TraversalCellId < this -> GetNumberOfCells ( ) ) { this -> GetCellAtId ( this -> TraversalCellId , npts , pts ) ; ++ this -> TraversalCellId ; return 1 ; } npts = 0 ; pts = nullptr ; return 0 ; } ---------------------------------------------------------------------------- inline int vtkCellArray :: GetNextCell ( vtkIdList * pts ) { if ( this -> TraversalCellId < this -> GetNumberOfCells ( ) ) { this -> GetCellAtId ( this -> TraversalCellId , pts ) ; ++ this -> TraversalCellId ; return 1 ; } pts -> Reset ( ) ; return 0 ; } ---------------------------------------------------------------------------- inline vtkIdType vtkCellArray :: GetCellSize ( const vtkIdType cellId ) const { return this -> Visit ( vtkCellArray_detail :: GetCellSizeImpl { } , cellId ) ; } ---------------------------------------------------------------------------- inline void vtkCellArray :: GetCellAtId ( vtkIdType cellId , vtkIdType & cellSize , vtkIdType const * & cellPoints ) VTK_SIZEHINT ( cellPoints , cellSize ) { this -> Visit ( vtkCellArray_detail :: GetCellAtIdImpl { } , cellId , cellSize , cellPoints , this -> TempCell ) ; } ---------------------------------------------------------------------------- inline void vtkCellArray :: GetCellAtId ( vtkIdType cellId , vtkIdType & cellSize , vtkIdType const * & cellPoints , vtkIdList * ptIds ) VTK_SIZEHINT ( cellPoints , cellSize ) { this -> Visit ( vtkCellArray_detail :: GetCellAtIdImpl { } , cellId , cellSize , cellPoints , ptIds ) ; } ---------------------------------------------------------------------------- inline void vtkCellArray :: GetCellAtId ( vtkIdType cellId , vtkIdList * pts ) { this -> Visit ( vtkCellArray_detail :: GetCellAtIdImpl { } , cellId , pts ) ; } ---------------------------------------------------------------------------- inline vtkIdType vtkCellArray :: InsertNextCell ( vtkIdType npts , const vtkIdType * pts ) VTK_SIZEHINT ( pts , npts ) { return this -> Visit ( vtkCellArray_detail :: InsertNextCellImpl { } , npts , pts ) ; } ---------------------------------------------------------------------------- inline vtkIdType vtkCellArray :: InsertNextCell ( int npts ) { return this -> Visit ( vtkCellArray_detail :: InsertNextCellImpl { } , npts ) ; } ---------------------------------------------------------------------------- inline void vtkCellArray :: InsertCellPoint ( vtkIdType id ) { if ( this -> Storage . Is64Bit ( ) ) { using ValueType = typename ArrayType64 :: ValueType ; this -> Storage . GetArrays64 ( ) . Connectivity -> InsertNextValue ( static_cast < ValueType > ( id ) ) ; } else { using ValueType = typename ArrayType32 :: ValueType ; this -> Storage . GetArrays32 ( ) . Connectivity -> InsertNextValue ( static_cast < ValueType > ( id ) ) ; } } ---------------------------------------------------------------------------- inline void vtkCellArray :: UpdateCellCount ( int npts ) { this -> Visit ( vtkCellArray_detail :: UpdateCellCountImpl { } , npts ) ; } ---------------------------------------------------------------------------- inline vtkIdType vtkCellArray :: InsertNextCell ( vtkIdList * pts ) { return this -> Visit ( vtkCellArray_detail :: InsertNextCellImpl { } , pts -> GetNumberOfIds ( ) , pts -> GetPointer ( 0 ) ) ; } ---------------------------------------------------------------------------- inline vtkIdType vtkCellArray :: InsertNextCell ( vtkCell * cell ) { vtkIdList * pts = cell -> GetPointIds ( ) ; return this -> Visit ( vtkCellArray_detail :: InsertNextCellImpl { } , pts -> GetNumberOfIds ( ) , pts -> GetPointer ( 0 ) ) ; } ---------------------------------------------------------------------------- inline void vtkCellArray :: Reset ( ) { this -> Visit ( vtkCellArray_detail :: ResetImpl { } ) ; } #  vtkCellArray.h
## Error: token expected: ( but got: <!!!
