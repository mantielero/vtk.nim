## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInformationKey.h
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
##  @class   vtkInformationKey
##  @brief   Superclass for vtkInformation keys.
##
##  vtkInformationKey is the superclass for all keys used to access the
##  map represented by vtkInformation.  The vtkInformation::Set and
##  vtkInformation::Get methods of vtkInformation are accessed by
##  information keys.  A key is a pointer to an instance of a subclass
##  of vtkInformationKey.  The type of the subclass determines the
##  overload of Set/Get that is selected.  This ensures that the type
##  of value stored in a vtkInformation instance corresponding to a
##  given key matches the type expected for that key.
##

## !!!Ignored construct:  # vtkInformationKey_h [NewLine] # vtkInformationKey_h [NewLine] # vtkCommonCoreModule.h  For export macro # vtkObject.h  Need vtkTypeMacro # vtkObjectBase.h [NewLine] class vtkInformation ;
## Error: identifier expected, but got: ##!!!
import
  vtkObjectBase, vtkType, vtkIndent

type
  ostream* = object # FIXME


type
  vtkInformationKey* {.importcpp: "vtkInformationKey",
                      header: "vtkInformationKey.h", bycopy.} = object of vtkObjectBase
    #vtkInformationKey* {.importc: "vtkInformationKey".}: VTK_NEWINSTANCE
    ##  Set/Get the value associated with this key instance in the given
    ##  information object.

  vtkInformationKeySuperclass* = vtkObjectBase

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkInformationKey::IsTypeOf(@)", header: "vtkInformationKey.h".}
proc IsA*(this: var vtkInformationKey; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkInformationKey.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkInformationKey {.
    importcpp: "vtkInformationKey::SafeDownCast(@)", header: "vtkInformationKey.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkInformationKey :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObjectBase :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInformationKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : virtual vtkObjectBase * NewInstanceInternal ( ) const { return vtkInformationKey :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkInformationKey; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkInformationKey.h".}
proc Register*(this: var vtkInformationKey; a2: ptr vtkObjectBase) {.
    importcpp: "Register", header: "vtkInformationKey.h".}
proc UnRegister*(this: var vtkInformationKey; a2: ptr vtkObjectBase) {.
    importcpp: "UnRegister", header: "vtkInformationKey.h".}
proc GetName*(this: var vtkInformationKey): cstring {.importcpp: "GetName",
    header: "vtkInformationKey.h".}
proc GetLocation*(this: var vtkInformationKey): cstring {.importcpp: "GetLocation",
    header: "vtkInformationKey.h".}
proc constructvtkInformationKey*(name: cstring; location: cstring): vtkInformationKey {.
    constructor, importcpp: "vtkInformationKey(@)", header: "vtkInformationKey.h".}
proc destroyvtkInformationKey*(this: var vtkInformationKey) {.
    importcpp: "#.~vtkInformationKey()", header: "vtkInformationKey.h".}

template vtkInformationKeySetStringMacro*(name: untyped): untyped =
  virtual

##  Macros to define an information key instance in a C++ source file.
##  The corresponding method declaration must appear in the class
##  definition in the header file.

## !!!Ignored construct:  # vtkInformationKeyMacro ( CLASS , NAME , type ) static vtkInformation ## type ## Key * CLASS ## _ ## NAME = new vtkInformation ## type ## Key ( # , # ) ;
## Error: identifier expected, but got: ##!!!

## !!!Ignored construct:  vtkInformation ## type ## Key * CLASS :: NAME ( ) { return CLASS ## _ ## NAME ; } [NewLine] # vtkInformationKeySubclassMacro ( CLASS , NAME , type , super ) static vtkInformation ## type ## Key * CLASS ## _ ## NAME = new vtkInformation ## type ## Key ( # , # ) ;
## Error: expected ';'!!!

## !!!Ignored construct:  vtkInformation ## super ## Key * CLASS :: NAME ( ) { return CLASS ## _ ## NAME ; } [NewLine] # vtkInformationKeyRestrictedMacro ( CLASS , NAME , type , required ) static vtkInformation ## type ## Key * CLASS ## _ ## NAME = new vtkInformation ## type ## Key ( # , # , required ) ;
## Error: expected ';'!!!

## !!!Ignored construct:  vtkInformation ## type ## Key * CLASS :: NAME ( ) { return CLASS ## _ ## NAME ; } [NewLine] # [NewLine]
## Error: expected ';'!!!
