## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInformationVariantVectorKey.h
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
##  @class   vtkInformationVariantVectorKey
##  @brief   Key for variant vector values.
##
##  vtkInformationVariantVectorKey is used to represent keys for variant
##  vector values in vtkInformation.h
##

import
  vtkCommonCoreModule, vtkInformationKey, vtkCommonInformationKeyManager

discard "forward decl of vtkVariant"
type
  vtkInformationVariantVectorKey* {.importcpp: "vtkInformationVariantVectorKey",
                                   header: "vtkInformationVariantVectorKey.h",
                                   bycopy.} = object of vtkInformationKey ##  The required length of the vector value (-1 is no restriction).
    vtkInformationVariantVectorKey* {.importc: "vtkInformationVariantVectorKey".}: VTK_NEWINSTANCE

  vtkInformationVariantVectorKeySuperclass* = vtkInformationKey

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkInformationVariantVectorKey::IsTypeOf(@)",
    header: "vtkInformationVariantVectorKey.h".}
proc IsA*(this: var vtkInformationVariantVectorKey; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkInformationVariantVectorKey.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkInformationVariantVectorKey {.
    importcpp: "vtkInformationVariantVectorKey::SafeDownCast(@)",
    header: "vtkInformationVariantVectorKey.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkInformationVariantVectorKey :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInformationKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInformationVariantVectorKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInformationVariantVectorKey :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkInformationVariantVectorKey; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkInformationVariantVectorKey.h".}
proc constructvtkInformationVariantVectorKey*(name: cstring; location: cstring;
    length: cint = -1): vtkInformationVariantVectorKey {.constructor,
    importcpp: "vtkInformationVariantVectorKey(@)",
    header: "vtkInformationVariantVectorKey.h".}
proc destroyvtkInformationVariantVectorKey*(
    this: var vtkInformationVariantVectorKey) {.
    importcpp: "#.~vtkInformationVariantVectorKey()",
    header: "vtkInformationVariantVectorKey.h".}
## !!!Ignored construct:  * MakeKey ( const char * name , const char * location , int length = - 1 ) { return new vtkInformationVariantVectorKey ( name , location , length ) ; } /@{ *
##  Get/Set the value associated with this key in the given
##  information object.
##  void Append ( vtkInformation * info , const vtkVariant & value ) ;
## Error: identifier expected, but got: *!!!

proc Set*(this: var vtkInformationVariantVectorKey; info: ptr vtkInformation;
         value: ptr vtkVariant; length: cint) {.importcpp: "Set",
    header: "vtkInformationVariantVectorKey.h".}
proc Get*(this: vtkInformationVariantVectorKey; info: ptr vtkInformation): ptr vtkVariant {.
    noSideEffect, importcpp: "Get", header: "vtkInformationVariantVectorKey.h".}
proc Get*(this: vtkInformationVariantVectorKey; info: ptr vtkInformation; idx: cint): vtkVariant {.
    noSideEffect, importcpp: "Get", header: "vtkInformationVariantVectorKey.h".}
proc Get*(this: vtkInformationVariantVectorKey; info: ptr vtkInformation;
         value: ptr vtkVariant) {.noSideEffect, importcpp: "Get",
                               header: "vtkInformationVariantVectorKey.h".}
proc Length*(this: vtkInformationVariantVectorKey; info: ptr vtkInformation): cint {.
    noSideEffect, importcpp: "Length", header: "vtkInformationVariantVectorKey.h".}
proc ShallowCopy*(this: var vtkInformationVariantVectorKey;
                 `from`: ptr vtkInformation; to: ptr vtkInformation) {.
    importcpp: "ShallowCopy", header: "vtkInformationVariantVectorKey.h".}
proc Print*(this: var vtkInformationVariantVectorKey; os: var ostream;
           info: ptr vtkInformation) {.importcpp: "Print",
                                    header: "vtkInformationVariantVectorKey.h".}