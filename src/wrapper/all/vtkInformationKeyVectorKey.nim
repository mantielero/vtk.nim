## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInformationKeyVectorKey.h
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
##  @class   vtkInformationKeyVectorKey
##  @brief   Key for vector-of-keys values.
##
##  vtkInformationKeyVectorKey is used to represent keys for
##  vector-of-keys values in vtkInformation.
##

import
  vtkCommonCoreModule, vtkInformationKey, vtkCommonInformationKeyManager

type
  vtkInformationKeyVectorKey* {.importcpp: "vtkInformationKeyVectorKey",
                               header: "vtkInformationKeyVectorKey.h", bycopy.} = object of vtkInformationKey
    vtkInformationKeyVectorKey* {.importc: "vtkInformationKeyVectorKey".}: VTK_NEWINSTANCE

  vtkInformationKeyVectorKeySuperclass* = vtkInformationKey

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkInformationKeyVectorKey::IsTypeOf(@)",
    header: "vtkInformationKeyVectorKey.h".}
proc IsA*(this: var vtkInformationKeyVectorKey; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkInformationKeyVectorKey.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkInformationKeyVectorKey {.
    importcpp: "vtkInformationKeyVectorKey::SafeDownCast(@)",
    header: "vtkInformationKeyVectorKey.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkInformationKeyVectorKey :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInformationKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInformationKeyVectorKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInformationKeyVectorKey :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkInformationKeyVectorKey; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkInformationKeyVectorKey.h".}
proc constructvtkInformationKeyVectorKey*(name: cstring; location: cstring): vtkInformationKeyVectorKey {.
    constructor, importcpp: "vtkInformationKeyVectorKey(@)",
    header: "vtkInformationKeyVectorKey.h".}
proc destroyvtkInformationKeyVectorKey*(this: var vtkInformationKeyVectorKey) {.
    importcpp: "#.~vtkInformationKeyVectorKey()",
    header: "vtkInformationKeyVectorKey.h".}
## !!!Ignored construct:  * MakeKey ( const char * name , const char * location ) { return new vtkInformationKeyVectorKey ( name , location ) ; } /@{ *
##  Get/Set the value associated with this key in the given
##  information object.
##  void Append ( vtkInformation * info , vtkInformationKey * value ) ;
## Error: identifier expected, but got: *!!!

proc AppendUnique*(this: var vtkInformationKeyVectorKey; info: ptr vtkInformation;
                  value: ptr vtkInformationKey) {.importcpp: "AppendUnique",
    header: "vtkInformationKeyVectorKey.h".}
proc Set*(this: var vtkInformationKeyVectorKey; info: ptr vtkInformation;
         value: ptr ptr vtkInformationKey; length: cint) {.importcpp: "Set",
    header: "vtkInformationKeyVectorKey.h".}
proc RemoveItem*(this: var vtkInformationKeyVectorKey; info: ptr vtkInformation;
                value: ptr vtkInformationKey) {.importcpp: "RemoveItem",
    header: "vtkInformationKeyVectorKey.h".}
proc Get*(this: var vtkInformationKeyVectorKey; info: ptr vtkInformation): ptr ptr vtkInformationKey {.
    importcpp: "Get", header: "vtkInformationKeyVectorKey.h".}
proc Get*(this: var vtkInformationKeyVectorKey; info: ptr vtkInformation; idx: cint): ptr vtkInformationKey {.
    importcpp: "Get", header: "vtkInformationKeyVectorKey.h".}
proc Get*(this: var vtkInformationKeyVectorKey; info: ptr vtkInformation;
         value: ptr ptr vtkInformationKey) {.importcpp: "Get",
    header: "vtkInformationKeyVectorKey.h".}
proc Length*(this: var vtkInformationKeyVectorKey; info: ptr vtkInformation): cint {.
    importcpp: "Length", header: "vtkInformationKeyVectorKey.h".}
proc ShallowCopy*(this: var vtkInformationKeyVectorKey; `from`: ptr vtkInformation;
                 to: ptr vtkInformation) {.importcpp: "ShallowCopy",
                                        header: "vtkInformationKeyVectorKey.h".}
proc Print*(this: var vtkInformationKeyVectorKey; os: var ostream;
           info: ptr vtkInformation) {.importcpp: "Print",
                                    header: "vtkInformationKeyVectorKey.h".}