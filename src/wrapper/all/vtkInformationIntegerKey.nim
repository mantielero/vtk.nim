## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInformationIntegerKey.h
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
##  @class   vtkInformationIntegerKey
##  @brief   Key for integer values in vtkInformation.
##
##  vtkInformationIntegerKey is used to represent keys for integer values
##  in vtkInformation.
##

import
  vtkCommonCoreModule, vtkInformationKey, vtkCommonInformationKeyManager

type
  vtkInformationIntegerKey* {.importcpp: "vtkInformationIntegerKey",
                             header: "vtkInformationIntegerKey.h", bycopy.} = object of vtkInformationKey ## *
                                                                                                   ##  Get the address at which the actual value is stored.  This is
                                                                                                   ##  meant for use from a debugger to add watches and is therefore not
                                                                                                   ##  a public method.
                                                                                                   ##
    vtkInformationIntegerKey* {.importc: "vtkInformationIntegerKey".}: VTK_NEWINSTANCE

  vtkInformationIntegerKeySuperclass* = vtkInformationKey

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkInformationIntegerKey::IsTypeOf(@)",
    header: "vtkInformationIntegerKey.h".}
proc IsA*(this: var vtkInformationIntegerKey; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkInformationIntegerKey.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkInformationIntegerKey {.
    importcpp: "vtkInformationIntegerKey::SafeDownCast(@)",
    header: "vtkInformationIntegerKey.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkInformationIntegerKey :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInformationKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInformationIntegerKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInformationIntegerKey :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkInformationIntegerKey; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkInformationIntegerKey.h".}
proc constructvtkInformationIntegerKey*(name: cstring; location: cstring): vtkInformationIntegerKey {.
    constructor, importcpp: "vtkInformationIntegerKey(@)",
    header: "vtkInformationIntegerKey.h".}
proc destroyvtkInformationIntegerKey*(this: var vtkInformationIntegerKey) {.
    importcpp: "#.~vtkInformationIntegerKey()",
    header: "vtkInformationIntegerKey.h".}
## !!!Ignored construct:  * MakeKey ( const char * name , const char * location ) { return new vtkInformationIntegerKey ( name , location ) ; } /@{ *
##  Get/Set the value associated with this key in the given
##  information object.
##  void Set ( vtkInformation * info , int ) ;
## Error: identifier expected, but got: *!!!

proc Get*(this: var vtkInformationIntegerKey; info: ptr vtkInformation): cint {.
    importcpp: "Get", header: "vtkInformationIntegerKey.h".}
proc ShallowCopy*(this: var vtkInformationIntegerKey; `from`: ptr vtkInformation;
                 to: ptr vtkInformation) {.importcpp: "ShallowCopy",
                                        header: "vtkInformationIntegerKey.h".}
proc Print*(this: var vtkInformationIntegerKey; os: var ostream;
           info: ptr vtkInformation) {.importcpp: "Print",
                                    header: "vtkInformationIntegerKey.h".}