## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInformationExecutivePortKey.h
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
##  @class   vtkInformationExecutivePortKey
##  @brief   Key for vtkExecutive/Port value pairs.
##
##  vtkInformationExecutivePortKey is used to represent keys in
##  vtkInformation for values that are vtkExecutive instances paired
##  with port numbers.
##

import
  vtkCommonExecutionModelModule, vtkInformationKey,
  vtkFilteringInformationKeyManager

discard "forward decl of vtkExecutive"
type
  vtkInformationExecutivePortKey* {.importcpp: "vtkInformationExecutivePortKey",
                                   header: "vtkInformationExecutivePortKey.h",
                                   bycopy.} = object of vtkInformationKey
    vtkInformationExecutivePortKey* {.importc: "vtkInformationExecutivePortKey".}: VTK_NEWINSTANCE

  vtkInformationExecutivePortKeySuperclass* = vtkInformationKey

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkInformationExecutivePortKey::IsTypeOf(@)",
    header: "vtkInformationExecutivePortKey.h".}
proc IsA*(this: var vtkInformationExecutivePortKey; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkInformationExecutivePortKey.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkInformationExecutivePortKey {.
    importcpp: "vtkInformationExecutivePortKey::SafeDownCast(@)",
    header: "vtkInformationExecutivePortKey.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkInformationExecutivePortKey :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInformationKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInformationExecutivePortKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInformationExecutivePortKey :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkInformationExecutivePortKey; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkInformationExecutivePortKey.h".}
proc constructvtkInformationExecutivePortKey*(name: cstring; location: cstring): vtkInformationExecutivePortKey {.
    constructor, importcpp: "vtkInformationExecutivePortKey(@)",
    header: "vtkInformationExecutivePortKey.h".}
proc destroyvtkInformationExecutivePortKey*(
    this: var vtkInformationExecutivePortKey) {.
    importcpp: "#.~vtkInformationExecutivePortKey()",
    header: "vtkInformationExecutivePortKey.h".}
## !!!Ignored construct:  * MakeKey ( const char * name , const char * location ) { return new vtkInformationExecutivePortKey ( name , location ) ; } /@{ *
##  Get/Set the value associated with this key in the given
##  information object.
##  void Set ( vtkInformation * info , vtkExecutive * , int ) ;
## Error: identifier expected, but got: *!!!

proc GetExecutive*(this: var vtkInformationExecutivePortKey;
                  info: ptr vtkInformation): ptr vtkExecutive {.
    importcpp: "GetExecutive", header: "vtkInformationExecutivePortKey.h".}
proc GetPort*(this: var vtkInformationExecutivePortKey; info: ptr vtkInformation): cint {.
    importcpp: "GetPort", header: "vtkInformationExecutivePortKey.h".}
proc Get*(this: var vtkInformationExecutivePortKey; info: ptr vtkInformation;
         executive: ptr vtkExecutive; port: var cint) {.importcpp: "Get",
    header: "vtkInformationExecutivePortKey.h".}
proc ShallowCopy*(this: var vtkInformationExecutivePortKey;
                 `from`: ptr vtkInformation; to: ptr vtkInformation) {.
    importcpp: "ShallowCopy", header: "vtkInformationExecutivePortKey.h".}
proc Report*(this: var vtkInformationExecutivePortKey; info: ptr vtkInformation;
            collector: ptr vtkGarbageCollector) {.importcpp: "Report",
    header: "vtkInformationExecutivePortKey.h".}
proc Print*(this: var vtkInformationExecutivePortKey; os: var ostream;
           info: ptr vtkInformation) {.importcpp: "Print",
                                    header: "vtkInformationExecutivePortKey.h".}