## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInformationObjectBaseVectorKey.h
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
##  @class   vtkInformationObjectBaseVectorKey
##  @brief   Key for vtkObjectBase vector values.
##
##  vtkInformationObjectBaseVectorKey is used to represent keys for double
##  vector values in vtkInformation.h. NOTE the interface in this key differs
##  from that in other similar keys because of our internal use of smart
##  pointers.
##

import
  vtkCommonCoreModule, vtkCommonInformationKeyManager, vtkInformationKey

discard "forward decl of vtkInformationObjectBaseVectorValue"
type
  vtkInformationObjectBaseVectorKey* {.importcpp: "vtkInformationObjectBaseVectorKey", header: "vtkInformationObjectBaseVectorKey.h",
                                      bycopy.} = object of vtkInformationKey ##  The type required of all objects stored with this key.
                                                                        ## *
                                                                        ##  Used to create the underlying vector that will be associated
                                                                        ##  with this key.
                                                                        ##
    vtkInformationObjectBaseVectorKey* {.importc: "vtkInformationObjectBaseVectorKey".}: VTK_NEWINSTANCE

  vtkInformationObjectBaseVectorKeySuperclass* = vtkInformationKey

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkInformationObjectBaseVectorKey::IsTypeOf(@)",
    header: "vtkInformationObjectBaseVectorKey.h".}
proc IsA*(this: var vtkInformationObjectBaseVectorKey; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkInformationObjectBaseVectorKey.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkInformationObjectBaseVectorKey {.
    importcpp: "vtkInformationObjectBaseVectorKey::SafeDownCast(@)",
    header: "vtkInformationObjectBaseVectorKey.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkInformationObjectBaseVectorKey :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInformationKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInformationObjectBaseVectorKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInformationObjectBaseVectorKey :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkInformationObjectBaseVectorKey; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkInformationObjectBaseVectorKey.h".}
proc constructvtkInformationObjectBaseVectorKey*(name: cstring; location: cstring;
    requiredClass: cstring = nil): vtkInformationObjectBaseVectorKey {.constructor,
    importcpp: "vtkInformationObjectBaseVectorKey(@)",
    header: "vtkInformationObjectBaseVectorKey.h".}
proc destroyvtkInformationObjectBaseVectorKey*(
    this: var vtkInformationObjectBaseVectorKey) {.
    importcpp: "#.~vtkInformationObjectBaseVectorKey()",
    header: "vtkInformationObjectBaseVectorKey.h".}
## !!!Ignored construct:  * MakeKey ( const char * name , const char * location , const char * requiredClass = nullptr ) { return new vtkInformationObjectBaseVectorKey ( name , location , requiredClass ) ; } *
##  Clear the vector.
##  void Clear ( vtkInformation * info ) ;
## Error: identifier expected, but got: *!!!

proc Resize*(this: var vtkInformationObjectBaseVectorKey; info: ptr vtkInformation;
            size: cint) {.importcpp: "Resize",
                        header: "vtkInformationObjectBaseVectorKey.h".}
proc Size*(this: var vtkInformationObjectBaseVectorKey; info: ptr vtkInformation): cint {.
    importcpp: "Size", header: "vtkInformationObjectBaseVectorKey.h".}
proc Length*(this: var vtkInformationObjectBaseVectorKey; info: ptr vtkInformation): cint {.
    importcpp: "Length", header: "vtkInformationObjectBaseVectorKey.h".}
proc Append*(this: var vtkInformationObjectBaseVectorKey; info: ptr vtkInformation;
            value: ptr vtkObjectBase) {.importcpp: "Append", header: "vtkInformationObjectBaseVectorKey.h".}
proc Set*(this: var vtkInformationObjectBaseVectorKey; info: ptr vtkInformation;
         value: ptr vtkObjectBase; i: cint) {.importcpp: "Set",
    header: "vtkInformationObjectBaseVectorKey.h".}
proc Remove*(this: var vtkInformationObjectBaseVectorKey; info: ptr vtkInformation;
            val: ptr vtkObjectBase) {.importcpp: "Remove", header: "vtkInformationObjectBaseVectorKey.h".}
proc Remove*(this: var vtkInformationObjectBaseVectorKey; info: ptr vtkInformation;
            idx: cint) {.importcpp: "Remove",
                       header: "vtkInformationObjectBaseVectorKey.h".}
## using statement

proc SetRange*(this: var vtkInformationObjectBaseVectorKey;
              info: ptr vtkInformation; source: ptr ptr vtkObjectBase; `from`: cint;
              to: cint; n: cint) {.importcpp: "SetRange",
                               header: "vtkInformationObjectBaseVectorKey.h".}
proc GetRange*(this: var vtkInformationObjectBaseVectorKey;
              info: ptr vtkInformation; dest: ptr ptr vtkObjectBase; `from`: cint;
              to: cint; n: cint) {.importcpp: "GetRange",
                               header: "vtkInformationObjectBaseVectorKey.h".}
proc Get*(this: var vtkInformationObjectBaseVectorKey; info: ptr vtkInformation;
         idx: cint): ptr vtkObjectBase {.importcpp: "Get", header: "vtkInformationObjectBaseVectorKey.h".}
proc ShallowCopy*(this: var vtkInformationObjectBaseVectorKey;
                 source: ptr vtkInformation; dest: ptr vtkInformation) {.
    importcpp: "ShallowCopy", header: "vtkInformationObjectBaseVectorKey.h".}
proc Print*(this: var vtkInformationObjectBaseVectorKey; os: var ostream;
           info: ptr vtkInformation) {.importcpp: "Print", header: "vtkInformationObjectBaseVectorKey.h".}