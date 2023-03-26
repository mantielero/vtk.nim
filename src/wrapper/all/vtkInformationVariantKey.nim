## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInformationVariantKey.h
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
##  @class   vtkInformationVariantKey
##  @brief   Key for variant values in vtkInformation.
##
##  vtkInformationVariantKey is used to represent keys for variant values
##  in vtkInformation.
##

import
  vtkCommonCoreModule, vtkInformationKey, vtkCommonInformationKeyManager

discard "forward decl of vtkVariant"
type
  vtkInformationVariantKey* {.importcpp: "vtkInformationVariantKey",
                             header: "vtkInformationVariantKey.h", bycopy.} = object of vtkInformationKey ## *
                                                                                                   ##  Get the address at which the actual value is stored.  This is
                                                                                                   ##  meant for use from a debugger to add watches and is therefore not
                                                                                                   ##  a public method.
                                                                                                   ##
    vtkInformationVariantKey* {.importc: "vtkInformationVariantKey".}: VTK_NEWINSTANCE

  vtkInformationVariantKeySuperclass* = vtkInformationKey

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkInformationVariantKey::IsTypeOf(@)",
    header: "vtkInformationVariantKey.h".}
proc IsA*(this: var vtkInformationVariantKey; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkInformationVariantKey.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkInformationVariantKey {.
    importcpp: "vtkInformationVariantKey::SafeDownCast(@)",
    header: "vtkInformationVariantKey.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkInformationVariantKey :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInformationKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInformationVariantKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInformationVariantKey :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkInformationVariantKey; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkInformationVariantKey.h".}
proc constructvtkInformationVariantKey*(name: cstring; location: cstring): vtkInformationVariantKey {.
    constructor, importcpp: "vtkInformationVariantKey(@)",
    header: "vtkInformationVariantKey.h".}
proc destroyvtkInformationVariantKey*(this: var vtkInformationVariantKey) {.
    importcpp: "#.~vtkInformationVariantKey()",
    header: "vtkInformationVariantKey.h".}
## !!!Ignored construct:  * MakeKey ( const char * name , const char * location ) { return new vtkInformationVariantKey ( name , location ) ; } /@{ *
##  Get/Set the value associated with this key in the given
##  information object.
##  void Set ( vtkInformation * info , const vtkVariant & ) ;
## Error: identifier expected, but got: *!!!

proc Get*(this: var vtkInformationVariantKey; info: ptr vtkInformation): vtkVariant {.
    importcpp: "Get", header: "vtkInformationVariantKey.h".}
proc ShallowCopy*(this: var vtkInformationVariantKey; `from`: ptr vtkInformation;
                 to: ptr vtkInformation) {.importcpp: "ShallowCopy",
                                        header: "vtkInformationVariantKey.h".}
proc Print*(this: var vtkInformationVariantKey; os: var ostream;
           info: ptr vtkInformation) {.importcpp: "Print",
                                    header: "vtkInformationVariantKey.h".}