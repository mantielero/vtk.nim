## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInformationRequestKey.h
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
##  @class   vtkInformationRequestKey
##  @brief   Key for pointer to pointer.
##
##  vtkInformationRequestKey is used to represent keys for pointer
##  to pointer values in vtkInformation.h
##

import
  vtkCommonCoreModule, vtkInformationKey, vtkCommonInformationKeyManager

type
  vtkInformationRequestKey* {.importcpp: "vtkInformationRequestKey",
                             header: "vtkInformationRequestKey.h", bycopy.} = object of vtkInformationKey
    vtkInformationRequestKey* {.importc: "vtkInformationRequestKey".}: VTK_NEWINSTANCE

  vtkInformationRequestKeySuperclass* = vtkInformationKey

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkInformationRequestKey::IsTypeOf(@)",
    header: "vtkInformationRequestKey.h".}
proc IsA*(this: var vtkInformationRequestKey; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkInformationRequestKey.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkInformationRequestKey {.
    importcpp: "vtkInformationRequestKey::SafeDownCast(@)",
    header: "vtkInformationRequestKey.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkInformationRequestKey :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInformationKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInformationRequestKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInformationRequestKey :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkInformationRequestKey; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkInformationRequestKey.h".}
proc constructvtkInformationRequestKey*(name: cstring; location: cstring): vtkInformationRequestKey {.
    constructor, importcpp: "vtkInformationRequestKey(@)",
    header: "vtkInformationRequestKey.h".}
proc destroyvtkInformationRequestKey*(this: var vtkInformationRequestKey) {.
    importcpp: "#.~vtkInformationRequestKey()",
    header: "vtkInformationRequestKey.h".}
## !!!Ignored construct:  * MakeKey ( const char * name , const char * location ) { return new vtkInformationRequestKey ( name , location ) ; } /@{ *
##  Get/Set the value associated with this key in the given
##  information object.
##  void Set ( vtkInformation * info ) ;
## Error: identifier expected, but got: *!!!

proc Remove*(this: var vtkInformationRequestKey; info: ptr vtkInformation) {.
    importcpp: "Remove", header: "vtkInformationRequestKey.h".}
proc Has*(this: var vtkInformationRequestKey; info: ptr vtkInformation): cint {.
    importcpp: "Has", header: "vtkInformationRequestKey.h".}
proc ShallowCopy*(this: var vtkInformationRequestKey; `from`: ptr vtkInformation;
                 to: ptr vtkInformation) {.importcpp: "ShallowCopy",
                                        header: "vtkInformationRequestKey.h".}
proc Print*(this: var vtkInformationRequestKey; os: var ostream;
           info: ptr vtkInformation) {.importcpp: "Print",
                                    header: "vtkInformationRequestKey.h".}