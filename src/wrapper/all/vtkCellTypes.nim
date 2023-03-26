## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCellTypes.h
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
##  @class   vtkCellTypes
##  @brief   object provides direct access to cells in vtkCellArray and type information
##
##  This class is a supplemental object to vtkCellArray to allow random access
##  into cells as well as representing cell type information.  The "location"
##  field is the location in the vtkCellArray list in terms of an integer
##  offset.  An integer offset was used instead of a pointer for easy storage
##  and inter-process communication. The type information is defined in the
##  file vtkCellType.h.
##
##  @warning
##  Sometimes this class is used to pass type information independent of the
##  random access (i.e., location) information. For example, see
##  vtkDataSet::GetCellTypes(). If you use the class in this way, you can use
##  a location value of -1.
##
##  @sa
##  vtkCellArray vtkCellLinks
##

import
  vtkCommonDataModelModule, vtkObject, vtkCellType, vtkDeprecation, vtkIdTypeArray,
  vtkSmartPointer, vtkUnsignedCharArray

discard "forward decl of vtkIntArray"
type
  vtkCellTypes* {.importcpp: "vtkCellTypes", header: "vtkCellTypes.h", bycopy.} = object of vtkObject
    vtkCellTypes* {.importc: "vtkCellTypes".}: VTK_NEWINSTANCE
    ##  pointer to types array
    ##  DEPRECATION_IN_9_2_0 Note for whoever is in deprecation duties:
    ##  The attribute LocationArray needs to be deleted, and any code in this class that would fail
    ##  compiling because of its removal deleted as well.
    ##  pointer to array of offsets
    ##  maximum index inserted thus far


proc New*(): ptr vtkCellTypes {.importcpp: "vtkCellTypes::New(@)",
                            header: "vtkCellTypes.h".}
type
  vtkCellTypesSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCellTypes::IsTypeOf(@)", header: "vtkCellTypes.h".}
proc IsA*(this: var vtkCellTypes; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkCellTypes.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCellTypes {.
    importcpp: "vtkCellTypes::SafeDownCast(@)", header: "vtkCellTypes.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCellTypes :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCellTypes :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCellTypes :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCellTypes; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCellTypes.h".}
proc Allocate*(this: var vtkCellTypes; sz: vtkIdType = 512; ext: vtkIdType = 1000): cint {.
    importcpp: "Allocate", header: "vtkCellTypes.h".}
proc InsertCell*(this: var vtkCellTypes; id: vtkIdType; `type`: cuchar; loc: vtkIdType) {.
    importcpp: "InsertCell", header: "vtkCellTypes.h".}
proc InsertNextCell*(this: var vtkCellTypes; `type`: cuchar; loc: vtkIdType): vtkIdType {.
    importcpp: "InsertNextCell", header: "vtkCellTypes.h".}
## !!!Ignored construct:  *
##  Specify a group of cell types.
##
##  \deprecated Please use method version that doesn't use `cellLocations` instead.
##  VTK_DEPRECATED_IN_9_2_0 ( Please use version without cellLocations. ) void SetCellTypes ( vtkIdType ncells , vtkUnsignedCharArray * cellTypes , vtkIdTypeArray * cellLocations ) ;
## Error: identifier expected, but got: Please use version without cellLocations.!!!

proc SetCellTypes*(this: var vtkCellTypes; ncells: vtkIdType;
                  cellTypes: ptr vtkUnsignedCharArray) {.importcpp: "SetCellTypes",
    header: "vtkCellTypes.h".}
## !!!Ignored construct:  VTK_DEPRECATED_IN_9_2_0 ( Please use version without cellLocations. ) void SetCellTypes ( vtkIdType ncells , vtkUnsignedCharArray * cellTypes , vtkIntArray * cellLocations ) ;
## Error: identifier expected, but got: Please use version without cellLocations.!!!

## !!!Ignored construct:  *
##  Return the location of the cell in the associated vtkCellArray.
##
##  \deprecated This method will go away in future releases.
##  Please do not rely on `CellLocation` in this class.
##  VTK_DEPRECATED_IN_9_2_0 ( The Location API will disappear. ) vtkIdType GetCellLocation ( vtkIdType cellId ) { return this -> LocationArray -> GetValue ( cellId ) ; } *
##  Delete cell by setting to nullptr cell type.
##  void DeleteCell ( vtkIdType cellId ) { this -> TypeArray -> SetValue ( cellId , VTK_EMPTY_CELL ) ; } *
##  Return the number of types in the list.
##  vtkIdType GetNumberOfTypes ( ) { return ( this -> MaxId + 1 ) ; } *
##  Return 1 if type specified is contained in list; 0 otherwise.
##  int IsType ( unsigned char type ) ;
## Error: identifier expected, but got: The Location API will disappear.!!!

proc InsertNextType*(this: var vtkCellTypes; `type`: cuchar): vtkIdType {.
    importcpp: "InsertNextType", header: "vtkCellTypes.h".}
proc GetCellType*(this: var vtkCellTypes; cellId: vtkIdType): cuchar {.
    importcpp: "GetCellType", header: "vtkCellTypes.h".}
proc Squeeze*(this: var vtkCellTypes) {.importcpp: "Squeeze", header: "vtkCellTypes.h".}
proc Reset*(this: var vtkCellTypes) {.importcpp: "Reset", header: "vtkCellTypes.h".}
proc GetActualMemorySize*(this: var vtkCellTypes): culong {.
    importcpp: "GetActualMemorySize", header: "vtkCellTypes.h".}
proc DeepCopy*(this: var vtkCellTypes; src: ptr vtkCellTypes) {.importcpp: "DeepCopy",
    header: "vtkCellTypes.h".}
proc GetClassNameFromTypeId*(typeId: cint): cstring {.
    importcpp: "vtkCellTypes::GetClassNameFromTypeId(@)", header: "vtkCellTypes.h".}
proc GetTypeIdFromClassName*(classname: cstring): cint {.
    importcpp: "vtkCellTypes::GetTypeIdFromClassName(@)", header: "vtkCellTypes.h".}
proc IsLinear*(`type`: cuchar): cint {.importcpp: "vtkCellTypes::IsLinear(@)",
                                   header: "vtkCellTypes.h".}
proc GetDimension*(`type`: cuchar): cint {.importcpp: "vtkCellTypes::GetDimension(@)",
                                       header: "vtkCellTypes.h".}
proc GetCellTypesArray*(this: var vtkCellTypes): ptr vtkUnsignedCharArray {.
    importcpp: "GetCellTypesArray", header: "vtkCellTypes.h".}
proc GetCellLocationsArray*(this: var vtkCellTypes): ptr vtkIdTypeArray {.
    importcpp: "GetCellLocationsArray", header: "vtkCellTypes.h".}
## ----------------------------------------------------------------------------

proc IsType*(this: var vtkCellTypes; `type`: cuchar): cint {.importcpp: "IsType",
    header: "vtkCellTypes.h".}
## -----------------------------------------------------------------------------

proc IsLinear*(this: var vtkCellTypes; `type`: cuchar): cint {.importcpp: "IsLinear",
    header: "vtkCellTypes.h".}