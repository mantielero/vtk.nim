## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkUnstructuredGridBase.h
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
##  @class   vtkUnstructuredGridBase
##  @brief   dataset represents arbitrary combinations
##  of all possible cell types. May be mapped onto a non-standard memory layout.
##
##
##  vtkUnstructuredGridBase defines the core vtkUnstructuredGrid API, omitting
##  functions that are implementation dependent.
##
##  @sa
##  vtkMappedDataArray vtkUnstructuredGrid
##

import
  vtkCommonDataModelModule, vtkPointSet

type
  vtkUnstructuredGridBase* {.importcpp: "vtkUnstructuredGridBase",
                            header: "vtkUnstructuredGridBase.h", bycopy.} = object of vtkPointSet
    vtkUnstructuredGridBase* {.importc: "vtkUnstructuredGridBase".}: VTK_NEWINSTANCE

  vtkUnstructuredGridBaseSuperclass* = vtkPointSet

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkUnstructuredGridBase::IsTypeOf(@)",
    header: "vtkUnstructuredGridBase.h".}
proc IsA*(this: var vtkUnstructuredGridBase; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkUnstructuredGridBase.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkUnstructuredGridBase {.
    importcpp: "vtkUnstructuredGridBase::SafeDownCast(@)",
    header: "vtkUnstructuredGridBase.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkUnstructuredGridBase :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( vtkUnstructuredGridBase , type ) ) { return 0 ; } return 1 + vtkPointSet :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkUnstructuredGridBase :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkUnstructuredGridBase; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkUnstructuredGridBase.h".}
proc GetDataObjectType*(this: var vtkUnstructuredGridBase): cint {.
    importcpp: "GetDataObjectType", header: "vtkUnstructuredGridBase.h".}
proc Allocate*(this: var vtkUnstructuredGridBase; numCells: vtkIdType = 1000;
              extSize: cint = 1000) {.importcpp: "Allocate",
                                  header: "vtkUnstructuredGridBase.h".}
proc DeepCopy*(this: var vtkUnstructuredGridBase; src: ptr vtkDataObject) {.
    importcpp: "DeepCopy", header: "vtkUnstructuredGridBase.h".}
## !!!Ignored construct:  *
##  Insert/create cell in object by type and list of point ids defining
##  cell topology. Most cells require just a type which implicitly defines
##  a set of points and their ordering. For non-polyhedron cell type, npts
##  is the number of unique points in the cell. pts are the list of global
##  point Ids. For polyhedron cell, a special input format is required.
##  npts is the number of faces in the cell. ptIds is the list of face stream:
##  (numFace0Pts, id1, id2, id3, numFace1Pts,id1, id2, id3, ...)
##  Make sure you have called Allocate() before calling this method
##  vtkIdType InsertNextCell ( int type , vtkIdType npts , const vtkIdType ptIds [ ] ) VTK_SIZEHINT ( ptIds , npts ) ;
## Error: expected ';'!!!

proc InsertNextCell*(this: var vtkUnstructuredGridBase; `type`: cint;
                    ptIds: ptr vtkIdList): vtkIdType {.importcpp: "InsertNextCell",
    header: "vtkUnstructuredGridBase.h".}
## !!!Ignored construct:   Description:
##  Insert/create a polyhedron cell. npts is the number of unique points in
##  the cell. pts is the list of the unique cell point Ids. nfaces is the
##  number of faces in the cell. faces is the face-stream
##  [numFace0Pts, id1, id2, id3, numFace1Pts,id1, id2, id3, ...].
##  All point Ids are global.
##  Make sure you have called Allocate() before calling this method vtkIdType InsertNextCell ( int type , vtkIdType npts , const vtkIdType ptIds [ ] , vtkIdType nfaces , const vtkIdType faces [ ] ) VTK_SIZEHINT ( ptIds , npts ) VTK_SIZEHINT ( faces , nfaces ) ;
## Error: expected ';'!!!

## !!!Ignored construct:  *
##  Replace the points defining cell "cellId" with a new set of points. This
##  operator is (typically) used when links from points to cells have not been
##  built (i.e., BuildLinks() has not been executed). Use the operator
##  ReplaceLinkedCell() to replace a cell when cell structure has been built.
##  void ReplaceCell ( vtkIdType cellId , int npts , const vtkIdType pts [ ] ) VTK_SIZEHINT ( pts , npts ) ;
## Error: expected ';'!!!

proc GetIdsOfCellsOfType*(this: var vtkUnstructuredGridBase; `type`: cint;
                         array: ptr vtkIdTypeArray) {.
    importcpp: "GetIdsOfCellsOfType", header: "vtkUnstructuredGridBase.h".}
proc IsHomogeneous*(this: var vtkUnstructuredGridBase): cint {.
    importcpp: "IsHomogeneous", header: "vtkUnstructuredGridBase.h".}
proc GetData*(info: ptr vtkInformation): ptr vtkUnstructuredGridBase {.
    importcpp: "vtkUnstructuredGridBase::GetData(@)",
    header: "vtkUnstructuredGridBase.h".}
proc GetData*(v: ptr vtkInformationVector; i: cint = 0): ptr vtkUnstructuredGridBase {.
    importcpp: "vtkUnstructuredGridBase::GetData(@)",
    header: "vtkUnstructuredGridBase.h".}