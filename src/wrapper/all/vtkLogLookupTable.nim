## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLogLookupTable.h
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
##  @class   vtkLogLookupTable
##  @brief   map scalars into colors using log (base 10) scale
##
##  This class is an empty shell.  Use vtkLookupTable with SetScaleToLog10()
##  instead.
##
##  @sa
##  vtkLookupTable
##

import
  vtkLookupTable, vtkRenderingCoreModule

type
  vtkLogLookupTable* {.importcpp: "vtkLogLookupTable",
                      header: "vtkLogLookupTable.h", bycopy.} = object of vtkLookupTable
    vtkLogLookupTable* {.importc: "vtkLogLookupTable".}: VTK_NEWINSTANCE


proc New*(): ptr vtkLogLookupTable {.importcpp: "vtkLogLookupTable::New(@)",
                                 header: "vtkLogLookupTable.h".}
type
  vtkLogLookupTableSuperclass* = vtkLookupTable

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkLogLookupTable::IsTypeOf(@)", header: "vtkLogLookupTable.h".}
proc IsA*(this: var vtkLogLookupTable; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkLogLookupTable.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkLogLookupTable {.
    importcpp: "vtkLogLookupTable::SafeDownCast(@)", header: "vtkLogLookupTable.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkLogLookupTable :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkLookupTable :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLogLookupTable :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLogLookupTable :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkLogLookupTable; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkLogLookupTable.h".}