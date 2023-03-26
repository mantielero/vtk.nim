## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAbstractElectronicData.h
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
##  @class   vtkAbstractElectronicData
##  @brief   Provides access to and storage of
##  chemical electronic data
##
##

import
  vtkCommonDataModelModule, vtkDataObject

discard "forward decl of vtkImageData"
type
  vtkAbstractElectronicData* {.importcpp: "vtkAbstractElectronicData",
                              header: "vtkAbstractElectronicData.h", bycopy.} = object of vtkDataObject
    vtkAbstractElectronicData* {.importc: "vtkAbstractElectronicData".}: VTK_NEWINSTANCE

  vtkAbstractElectronicDataSuperclass* = vtkDataObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAbstractElectronicData::IsTypeOf(@)",
    header: "vtkAbstractElectronicData.h".}
proc IsA*(this: var vtkAbstractElectronicData; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkAbstractElectronicData.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAbstractElectronicData {.
    importcpp: "vtkAbstractElectronicData::SafeDownCast(@)",
    header: "vtkAbstractElectronicData.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAbstractElectronicData :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAbstractElectronicData :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAbstractElectronicData :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAbstractElectronicData; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkAbstractElectronicData.h".}
proc GetDataObjectType*(this: var vtkAbstractElectronicData): cint {.
    importcpp: "GetDataObjectType", header: "vtkAbstractElectronicData.h".}
proc GetNumberOfMOs*(this: var vtkAbstractElectronicData): vtkIdType {.
    importcpp: "GetNumberOfMOs", header: "vtkAbstractElectronicData.h".}
proc GetNumberOfElectrons*(this: var vtkAbstractElectronicData): vtkIdType {.
    importcpp: "GetNumberOfElectrons", header: "vtkAbstractElectronicData.h".}
proc GetMO*(this: var vtkAbstractElectronicData; orbitalNumber: vtkIdType): ptr vtkImageData {.
    importcpp: "GetMO", header: "vtkAbstractElectronicData.h".}
proc GetElectronDensity*(this: var vtkAbstractElectronicData): ptr vtkImageData {.
    importcpp: "GetElectronDensity", header: "vtkAbstractElectronicData.h".}
proc GetHOMO*(this: var vtkAbstractElectronicData): ptr vtkImageData {.
    importcpp: "GetHOMO", header: "vtkAbstractElectronicData.h".}
proc GetLUMO*(this: var vtkAbstractElectronicData): ptr vtkImageData {.
    importcpp: "GetLUMO", header: "vtkAbstractElectronicData.h".}
proc GetHOMOOrbitalNumber*(this: var vtkAbstractElectronicData): vtkIdType {.
    importcpp: "GetHOMOOrbitalNumber", header: "vtkAbstractElectronicData.h".}
proc GetLUMOOrbitalNumber*(this: var vtkAbstractElectronicData): vtkIdType {.
    importcpp: "GetLUMOOrbitalNumber", header: "vtkAbstractElectronicData.h".}
proc IsHOMO*(this: var vtkAbstractElectronicData; orbitalNumber: vtkIdType): bool {.
    importcpp: "IsHOMO", header: "vtkAbstractElectronicData.h".}
proc IsLUMO*(this: var vtkAbstractElectronicData; orbitalNumber: vtkIdType): bool {.
    importcpp: "IsLUMO", header: "vtkAbstractElectronicData.h".}
proc DeepCopy*(this: var vtkAbstractElectronicData; obj: ptr vtkDataObject) {.
    importcpp: "DeepCopy", header: "vtkAbstractElectronicData.h".}
## !!!Ignored construct:  /@{ *
##  Get the padding between the molecule and the cube boundaries. This is
##  used to determine the dataset's bounds.
##  virtual double GetPaddingPadding ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Padding  of  << this -> Padding ) ; return this -> Padding ; } ;
## Error: expected ';'!!!
