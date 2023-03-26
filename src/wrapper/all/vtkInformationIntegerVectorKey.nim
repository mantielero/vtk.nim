## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInformationIntegerVectorKey.h
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
##  @class   vtkInformationIntegerVectorKey
##  @brief   Key for integer vector values.
##
##  vtkInformationIntegerVectorKey is used to represent keys for integer
##  vector values in vtkInformation.h
##

import
  vtkCommonCoreModule, vtkInformationKey, vtkCommonInformationKeyManager

type
  vtkInformationIntegerVectorKey* {.importcpp: "vtkInformationIntegerVectorKey",
                                   header: "vtkInformationIntegerVectorKey.h",
                                   bycopy.} = object of vtkInformationKey ##  The required length of the vector value (-1 is no restriction).
    vtkInformationIntegerVectorKey* {.importc: "vtkInformationIntegerVectorKey".}: VTK_NEWINSTANCE
    ## *
    ##  Get the address at which the actual value is stored.  This is
    ##  meant for use from a debugger to add watches and is therefore not
    ##  a public method.
    ##

  vtkInformationIntegerVectorKeySuperclass* = vtkInformationKey

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkInformationIntegerVectorKey::IsTypeOf(@)",
    header: "vtkInformationIntegerVectorKey.h".}
proc IsA*(this: var vtkInformationIntegerVectorKey; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkInformationIntegerVectorKey.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkInformationIntegerVectorKey {.
    importcpp: "vtkInformationIntegerVectorKey::SafeDownCast(@)",
    header: "vtkInformationIntegerVectorKey.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkInformationIntegerVectorKey :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInformationKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInformationIntegerVectorKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInformationIntegerVectorKey :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkInformationIntegerVectorKey; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkInformationIntegerVectorKey.h".}
proc constructvtkInformationIntegerVectorKey*(name: cstring; location: cstring;
    length: cint = -1): vtkInformationIntegerVectorKey {.constructor,
    importcpp: "vtkInformationIntegerVectorKey(@)",
    header: "vtkInformationIntegerVectorKey.h".}
proc destroyvtkInformationIntegerVectorKey*(
    this: var vtkInformationIntegerVectorKey) {.
    importcpp: "#.~vtkInformationIntegerVectorKey()",
    header: "vtkInformationIntegerVectorKey.h".}
## !!!Ignored construct:  * MakeKey ( const char * name , const char * location , int length = - 1 ) { return new vtkInformationIntegerVectorKey ( name , location , length ) ; } /@{ *
##  Get/Set the value associated with this key in the given
##  information object.
##  void Append ( vtkInformation * info , int value ) ;
## Error: identifier expected, but got: *!!!

proc Set*(this: var vtkInformationIntegerVectorKey; info: ptr vtkInformation;
         value: ptr cint; length: cint) {.importcpp: "Set",
                                     header: "vtkInformationIntegerVectorKey.h".}
proc Set*(this: var vtkInformationIntegerVectorKey; info: ptr vtkInformation) {.
    importcpp: "Set", header: "vtkInformationIntegerVectorKey.h".}
proc Get*(this: var vtkInformationIntegerVectorKey; info: ptr vtkInformation): ptr cint {.
    importcpp: "Get", header: "vtkInformationIntegerVectorKey.h".}
proc Get*(this: var vtkInformationIntegerVectorKey; info: ptr vtkInformation; idx: cint): cint {.
    importcpp: "Get", header: "vtkInformationIntegerVectorKey.h".}
proc Get*(this: var vtkInformationIntegerVectorKey; info: ptr vtkInformation;
         value: ptr cint) {.importcpp: "Get",
                         header: "vtkInformationIntegerVectorKey.h".}
proc Length*(this: var vtkInformationIntegerVectorKey; info: ptr vtkInformation): cint {.
    importcpp: "Length", header: "vtkInformationIntegerVectorKey.h".}
proc ShallowCopy*(this: var vtkInformationIntegerVectorKey;
                 `from`: ptr vtkInformation; to: ptr vtkInformation) {.
    importcpp: "ShallowCopy", header: "vtkInformationIntegerVectorKey.h".}
proc Print*(this: var vtkInformationIntegerVectorKey; os: var ostream;
           info: ptr vtkInformation) {.importcpp: "Print",
                                    header: "vtkInformationIntegerVectorKey.h".}