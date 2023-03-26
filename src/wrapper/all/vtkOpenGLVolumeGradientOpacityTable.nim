## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOpenGLVolumeGradientOpacityTable.h
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
  vtkOpenGLVolumeGradientOpacityTable* {.importcpp: "vtkOpenGLVolumeGradientOpacityTable", header: "vtkOpenGLVolumeGradientOpacityTable.h",
                                        bycopy.} = object of vtkOpenGLVolumeLookupTable
    vtkOpenGLVolumeGradientOpacityTable* {.
        importc: "vtkOpenGLVolumeGradientOpacityTable".}: VTK_NEWINSTANCE

  vtkOpenGLVolumeGradientOpacityTableSuperclass* = vtkOpenGLVolumeLookupTable

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOpenGLVolumeGradientOpacityTable::IsTypeOf(@)",
    header: "vtkOpenGLVolumeGradientOpacityTable.h".}
proc IsA*(this: var vtkOpenGLVolumeGradientOpacityTable; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkOpenGLVolumeGradientOpacityTable.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOpenGLVolumeGradientOpacityTable {.
    importcpp: "vtkOpenGLVolumeGradientOpacityTable::SafeDownCast(@)",
    header: "vtkOpenGLVolumeGradientOpacityTable.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOpenGLVolumeGradientOpacityTable :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkOpenGLVolumeLookupTable :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenGLVolumeGradientOpacityTable :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenGLVolumeGradientOpacityTable :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOpenGLVolumeGradientOpacityTable; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkOpenGLVolumeGradientOpacityTable.h".}
proc New*(): ptr vtkOpenGLVolumeGradientOpacityTable {.
    importcpp: "vtkOpenGLVolumeGradientOpacityTable::New(@)",
    header: "vtkOpenGLVolumeGradientOpacityTable.h".}