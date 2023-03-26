## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOpenGLVolumeRGBTable.h
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

import
  vtkOpenGLVolumeLookupTable, vtkRenderingVolumeOpenGL2Module

##  Forward declarations

discard "forward decl of vtkOpenGLRenderWindow"
type
  vtkOpenGLVolumeRGBTable* {.importcpp: "vtkOpenGLVolumeRGBTable",
                            header: "vtkOpenGLVolumeRGBTable.h", bycopy.} = object of vtkOpenGLVolumeLookupTable
    vtkOpenGLVolumeRGBTable* {.importc: "vtkOpenGLVolumeRGBTable".}: VTK_NEWINSTANCE

  vtkOpenGLVolumeRGBTableSuperclass* = vtkOpenGLVolumeLookupTable

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOpenGLVolumeRGBTable::IsTypeOf(@)",
    header: "vtkOpenGLVolumeRGBTable.h".}
proc IsA*(this: var vtkOpenGLVolumeRGBTable; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkOpenGLVolumeRGBTable.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOpenGLVolumeRGBTable {.
    importcpp: "vtkOpenGLVolumeRGBTable::SafeDownCast(@)",
    header: "vtkOpenGLVolumeRGBTable.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOpenGLVolumeRGBTable :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkOpenGLVolumeLookupTable :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenGLVolumeRGBTable :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenGLVolumeRGBTable :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOpenGLVolumeRGBTable; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkOpenGLVolumeRGBTable.h".}
proc New*(): ptr vtkOpenGLVolumeRGBTable {.importcpp: "vtkOpenGLVolumeRGBTable::New(@)",
                                       header: "vtkOpenGLVolumeRGBTable.h".}