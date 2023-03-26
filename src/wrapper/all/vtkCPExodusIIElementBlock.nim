## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCPExodusIIElementBlock.h
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
##  @class   vtkCPExodusIIElementBlock
##  @brief   Uses an Exodus II element block as a
##   vtkMappedUnstructuredGrid's implementation.
##
##
##  This class allows raw data arrays returned by the Exodus II library to be
##  used directly in VTK without repacking the data into the vtkUnstructuredGrid
##  memory layout. Use the vtkCPExodusIIInSituReader to read an Exodus II file's
##  data into this structure.
##

## !!!Ignored construct:  # vtkCPExodusIIElementBlock_h [NewLine] # vtkCPExodusIIElementBlock_h [NewLine] # vtkIOExodusModule.h  For export macro # vtkObject.h [NewLine] # vtkMappedUnstructuredGrid.h  For mapped unstructured grid wrapper [NewLine] # < string >  For std::string [NewLine] class vtkGenericCell ;
## Error: did not expect )!!!

type
  vtkCPExodusIIElementBlockImpl* {.importcpp: "vtkCPExodusIIElementBlockImpl",
                                  header: "vtkCPExodusIIElementBlock.h", bycopy.} = object of vtkObject
    vtkCPExodusIIElementBlockImpl* {.importc: "vtkCPExodusIIElementBlockImpl".}: VTK_NEWINSTANCE


proc New*(): ptr vtkCPExodusIIElementBlockImpl {.
    importcpp: "vtkCPExodusIIElementBlockImpl::New(@)",
    header: "vtkCPExodusIIElementBlock.h".}
proc PrintSelf*(this: var vtkCPExodusIIElementBlockImpl; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkCPExodusIIElementBlock.h".}
type
  vtkCPExodusIIElementBlockImplSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCPExodusIIElementBlockImpl::IsTypeOf(@)",
    header: "vtkCPExodusIIElementBlock.h".}
proc IsA*(this: var vtkCPExodusIIElementBlockImpl; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkCPExodusIIElementBlock.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCPExodusIIElementBlockImpl {.
    importcpp: "vtkCPExodusIIElementBlockImpl::SafeDownCast(@)",
    header: "vtkCPExodusIIElementBlock.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCPExodusIIElementBlockImpl :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCPExodusIIElementBlockImpl :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCPExodusIIElementBlockImpl :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc SetExodusConnectivityArray*(this: var vtkCPExodusIIElementBlockImpl;
                                elements: ptr cint; `type`: string;
                                numElements: cint; nodesPerElement: cint): bool {.
    importcpp: "SetExodusConnectivityArray", header: "vtkCPExodusIIElementBlock.h".}
proc GetNumberOfCells*(this: var vtkCPExodusIIElementBlockImpl): vtkIdType {.
    importcpp: "GetNumberOfCells", header: "vtkCPExodusIIElementBlock.h".}
proc GetCellType*(this: var vtkCPExodusIIElementBlockImpl; cellId: vtkIdType): cint {.
    importcpp: "GetCellType", header: "vtkCPExodusIIElementBlock.h".}
proc GetCellPoints*(this: var vtkCPExodusIIElementBlockImpl; cellId: vtkIdType;
                   ptIds: ptr vtkIdList) {.importcpp: "GetCellPoints",
                                        header: "vtkCPExodusIIElementBlock.h".}
proc GetFaceStream*(this: var vtkCPExodusIIElementBlockImpl; cellId: vtkIdType;
                   ptIds: ptr vtkIdList) {.importcpp: "GetFaceStream",
                                        header: "vtkCPExodusIIElementBlock.h".}
proc GetPointCells*(this: var vtkCPExodusIIElementBlockImpl; ptId: vtkIdType;
                   cellIds: ptr vtkIdList) {.importcpp: "GetPointCells",
    header: "vtkCPExodusIIElementBlock.h".}
proc GetMaxCellSize*(this: var vtkCPExodusIIElementBlockImpl): cint {.
    importcpp: "GetMaxCellSize", header: "vtkCPExodusIIElementBlock.h".}
proc GetIdsOfCellsOfType*(this: var vtkCPExodusIIElementBlockImpl; `type`: cint;
                         array: ptr vtkIdTypeArray) {.
    importcpp: "GetIdsOfCellsOfType", header: "vtkCPExodusIIElementBlock.h".}
proc IsHomogeneous*(this: var vtkCPExodusIIElementBlockImpl): cint {.
    importcpp: "IsHomogeneous", header: "vtkCPExodusIIElementBlock.h".}
proc Allocate*(this: var vtkCPExodusIIElementBlockImpl; numCells: vtkIdType;
              extSize: cint = 1000) {.importcpp: "Allocate",
                                  header: "vtkCPExodusIIElementBlock.h".}
proc InsertNextCell*(this: var vtkCPExodusIIElementBlockImpl; `type`: cint;
                    ptIds: ptr vtkIdList): vtkIdType {.importcpp: "InsertNextCell",
    header: "vtkCPExodusIIElementBlock.h".}
## !!!Ignored construct:  vtkIdType InsertNextCell ( int type , vtkIdType npts , const vtkIdType ptIds [ ] ) VTK_SIZEHINT ( ptIds , npts ) ;
## Error: expected ';'!!!

## !!!Ignored construct:  vtkIdType InsertNextCell ( int type , vtkIdType npts , const vtkIdType ptIds [ ] , vtkIdType nfaces , const vtkIdType faces [ ] ) VTK_SIZEHINT ( ptIds , npts ) VTK_SIZEHINT ( faces , nfaces ) ;
## Error: expected ';'!!!

## !!!Ignored construct:  void ReplaceCell ( vtkIdType cellId , int npts , const vtkIdType pts [ ] ) VTK_SIZEHINT ( pts , npts ) ;
## Error: expected ';'!!!

## !!!Ignored construct:  vtkMakeExportedMappedUnstructuredGrid ( vtkCPExodusIIElementBlock , vtkCPExodusIIElementBlockImpl , ) ;
## Error: did not expect )!!!
