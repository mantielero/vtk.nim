## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInformationDoubleKey.h
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
##  @class   vtkInformationDoubleKey
##  @brief   Key for double values in vtkInformation.
##
##  vtkInformationDoubleKey is used to represent keys for double values
##  in vtkInformation.
##

import
  vtkCommonCoreModule, vtkInformationKey, vtkCommonInformationKeyManager

type
  vtkInformationDoubleKey* {.importcpp: "vtkInformationDoubleKey",
                            header: "vtkInformationDoubleKey.h", bycopy.} = object of vtkInformationKey ## *
                                                                                                 ##  Get the address at which the actual value is stored.  This is
                                                                                                 ##  meant for use from a debugger to add watches and is therefore not
                                                                                                 ##  a public method.
                                                                                                 ##
    vtkInformationDoubleKey* {.importc: "vtkInformationDoubleKey".}: VTK_NEWINSTANCE

  vtkInformationDoubleKeySuperclass* = vtkInformationKey

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkInformationDoubleKey::IsTypeOf(@)",
    header: "vtkInformationDoubleKey.h".}
proc IsA*(this: var vtkInformationDoubleKey; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkInformationDoubleKey.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkInformationDoubleKey {.
    importcpp: "vtkInformationDoubleKey::SafeDownCast(@)",
    header: "vtkInformationDoubleKey.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkInformationDoubleKey :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInformationKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInformationDoubleKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInformationDoubleKey :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkInformationDoubleKey; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkInformationDoubleKey.h".}
proc constructvtkInformationDoubleKey*(name: cstring; location: cstring): vtkInformationDoubleKey {.
    constructor, importcpp: "vtkInformationDoubleKey(@)",
    header: "vtkInformationDoubleKey.h".}
proc destroyvtkInformationDoubleKey*(this: var vtkInformationDoubleKey) {.
    importcpp: "#.~vtkInformationDoubleKey()", header: "vtkInformationDoubleKey.h".}
## !!!Ignored construct:  * MakeKey ( const char * name , const char * location ) { return new vtkInformationDoubleKey ( name , location ) ; } /@{ *
##  Get/Set the value associated with this key in the given
##  information object.
##  void Set ( vtkInformation * info , double ) ;
## Error: identifier expected, but got: *!!!

proc Get*(this: var vtkInformationDoubleKey; info: ptr vtkInformation): cdouble {.
    importcpp: "Get", header: "vtkInformationDoubleKey.h".}
proc ShallowCopy*(this: var vtkInformationDoubleKey; `from`: ptr vtkInformation;
                 to: ptr vtkInformation) {.importcpp: "ShallowCopy",
                                        header: "vtkInformationDoubleKey.h".}
proc Print*(this: var vtkInformationDoubleKey; os: var ostream;
           info: ptr vtkInformation) {.importcpp: "Print",
                                    header: "vtkInformationDoubleKey.h".}