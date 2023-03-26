## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInformationDataObjectMetaDataKey.h
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
##  @class   vtkInformationDataObjectMetaDataKey
##  @brief   key used to define meta-data of type vtkDataObject
##  vtkInformationDataObjectMetaDataKey is a vtkInformationDataObjectKey
##  that (shallow) copies itself downstream during the REQUEST_INFORMATION pass. Hence
##  it can be used to provide meta-data of type vtkDataObject or any subclass.
##

import
  vtkCommonExecutionModelModule, vtkInformationDataObjectKey,
  vtkCommonInformationKeyManager

type
  vtkInformationDataObjectMetaDataKey* {.importcpp: "vtkInformationDataObjectMetaDataKey", header: "vtkInformationDataObjectMetaDataKey.h",
                                        bycopy.} = object of vtkInformationDataObjectKey
    vtkInformationDataObjectMetaDataKey* {.
        importc: "vtkInformationDataObjectMetaDataKey".}: VTK_NEWINSTANCE

  vtkInformationDataObjectMetaDataKeySuperclass* = vtkInformationDataObjectKey

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkInformationDataObjectMetaDataKey::IsTypeOf(@)",
    header: "vtkInformationDataObjectMetaDataKey.h".}
proc IsA*(this: var vtkInformationDataObjectMetaDataKey; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkInformationDataObjectMetaDataKey.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkInformationDataObjectMetaDataKey {.
    importcpp: "vtkInformationDataObjectMetaDataKey::SafeDownCast(@)",
    header: "vtkInformationDataObjectMetaDataKey.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkInformationDataObjectMetaDataKey :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInformationDataObjectKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInformationDataObjectMetaDataKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInformationDataObjectMetaDataKey :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkInformationDataObjectMetaDataKey; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkInformationDataObjectMetaDataKey.h".}
proc constructvtkInformationDataObjectMetaDataKey*(name: cstring; location: cstring): vtkInformationDataObjectMetaDataKey {.
    constructor, importcpp: "vtkInformationDataObjectMetaDataKey(@)",
    header: "vtkInformationDataObjectMetaDataKey.h".}
proc destroyvtkInformationDataObjectMetaDataKey*(
    this: var vtkInformationDataObjectMetaDataKey) {.
    importcpp: "#.~vtkInformationDataObjectMetaDataKey()",
    header: "vtkInformationDataObjectMetaDataKey.h".}
## !!!Ignored construct:  * MakeKey ( const char * name , const char * location ) { return new vtkInformationDataObjectMetaDataKey ( name , location ) ; } *
##  Simply shallow copies the key from fromInfo to toInfo if request
##  has the REQUEST_INFORMATION() key.
##  This is used by the pipeline to propagate this key downstream.
##  void CopyDefaultInformation ( vtkInformation * request , vtkInformation * fromInfo , vtkInformation * toInfo ) override ;
## Error: identifier expected, but got: *!!!
