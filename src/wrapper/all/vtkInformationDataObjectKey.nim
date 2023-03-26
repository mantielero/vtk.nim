## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInformationDataObjectKey.h
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
##  @class   vtkInformationDataObjectKey
##  @brief   Key for vtkDataObject values.
##
##  vtkInformationDataObjectKey is used to represent keys in
##  vtkInformation for values that are vtkDataObject instances.
##

import
  vtkCommonCoreModule, vtkInformationKey, vtkCommonInformationKeyManager

discard "forward decl of vtkDataObject"
type
  vtkInformationDataObjectKey* {.importcpp: "vtkInformationDataObjectKey",
                                header: "vtkInformationDataObjectKey.h", bycopy.} = object of vtkInformationKey
    vtkInformationDataObjectKey* {.importc: "vtkInformationDataObjectKey".}: VTK_NEWINSTANCE

  vtkInformationDataObjectKeySuperclass* = vtkInformationKey

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkInformationDataObjectKey::IsTypeOf(@)",
    header: "vtkInformationDataObjectKey.h".}
proc IsA*(this: var vtkInformationDataObjectKey; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkInformationDataObjectKey.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkInformationDataObjectKey {.
    importcpp: "vtkInformationDataObjectKey::SafeDownCast(@)",
    header: "vtkInformationDataObjectKey.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkInformationDataObjectKey :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInformationKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInformationDataObjectKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInformationDataObjectKey :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkInformationDataObjectKey; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkInformationDataObjectKey.h".}
proc constructvtkInformationDataObjectKey*(name: cstring; location: cstring): vtkInformationDataObjectKey {.
    constructor, importcpp: "vtkInformationDataObjectKey(@)",
    header: "vtkInformationDataObjectKey.h".}
proc destroyvtkInformationDataObjectKey*(this: var vtkInformationDataObjectKey) {.
    importcpp: "#.~vtkInformationDataObjectKey()",
    header: "vtkInformationDataObjectKey.h".}
## !!!Ignored construct:  * MakeKey ( const char * name , const char * location ) { return new vtkInformationDataObjectKey ( name , location ) ; } /@{ *
##  Get/Set the value associated with this key in the given
##  information object.
##  void Set ( vtkInformation * info , vtkDataObject * ) ;
## Error: identifier expected, but got: *!!!

proc Get*(this: var vtkInformationDataObjectKey; info: ptr vtkInformation): ptr vtkDataObject {.
    importcpp: "Get", header: "vtkInformationDataObjectKey.h".}
proc ShallowCopy*(this: var vtkInformationDataObjectKey; `from`: ptr vtkInformation;
                 to: ptr vtkInformation) {.importcpp: "ShallowCopy",
                                        header: "vtkInformationDataObjectKey.h".}
proc Report*(this: var vtkInformationDataObjectKey; info: ptr vtkInformation;
            collector: ptr vtkGarbageCollector) {.importcpp: "Report",
    header: "vtkInformationDataObjectKey.h".}