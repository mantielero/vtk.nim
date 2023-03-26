## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDynamicLoader.h
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
##  @class   vtkDynamicLoader
##  @brief   class interface to system dynamic libraries
##
##  vtkDynamicLoader provides a portable interface to loading dynamic
##  libraries into a process.
##  @sa
##  A more portable and lightweight solution is kwsys::DynamicLoader
##

import
  vtkCommonCoreModule, vtkObject

type
  vtkLibHandle* = LibraryHandle
  vtkSymbolPointer* = SymbolPointer
  vtkDynamicLoader* {.importcpp: "vtkDynamicLoader", header: "vtkDynamicLoader.h",
                     bycopy.} = object of vtkObject
    vtkDynamicLoader* {.importc: "vtkDynamicLoader".}: VTK_NEWINSTANCE


proc New*(): ptr vtkDynamicLoader {.importcpp: "vtkDynamicLoader::New(@)",
                                header: "vtkDynamicLoader.h".}
type
  vtkDynamicLoaderSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDynamicLoader::IsTypeOf(@)", header: "vtkDynamicLoader.h".}
proc IsA*(this: var vtkDynamicLoader; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkDynamicLoader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDynamicLoader {.
    importcpp: "vtkDynamicLoader::SafeDownCast(@)", header: "vtkDynamicLoader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDynamicLoader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDynamicLoader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDynamicLoader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDynamicLoader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkDynamicLoader.h".}
## !!!Ignored construct:  *
##  Load a dynamic library into the current process.
##  The returned vtkLibHandle can be used to access the symbols in the
##  library.
##  static vtkLibHandle OpenLibrary ( VTK_FILEPATH const char * ) ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  static vtkLibHandle OpenLibrary ( VTK_FILEPATH const char * , int ) ;
## Error: token expected: ) but got: *!!!

proc CloseLibrary*(a1: vtkLibHandle): cint {.
    importcpp: "vtkDynamicLoader::CloseLibrary(@)", header: "vtkDynamicLoader.h".}
proc GetSymbolAddress*(a1: vtkLibHandle; a2: cstring): vtkSymbolPointer {.
    importcpp: "vtkDynamicLoader::GetSymbolAddress(@)",
    header: "vtkDynamicLoader.h".}
proc LibPrefix*(): cstring {.importcpp: "vtkDynamicLoader::LibPrefix(@)",
                          header: "vtkDynamicLoader.h".}
proc LibExtension*(): cstring {.importcpp: "vtkDynamicLoader::LibExtension(@)",
                             header: "vtkDynamicLoader.h".}
proc LastError*(): cstring {.importcpp: "vtkDynamicLoader::LastError(@)",
                          header: "vtkDynamicLoader.h".}