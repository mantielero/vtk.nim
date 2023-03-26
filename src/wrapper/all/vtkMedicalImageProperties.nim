## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMedicalImageProperties.h
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
##  @class   vtkMedicalImageProperties
##  @brief   some medical image properties.
##
##  vtkMedicalImageProperties is a helper class that can be used by medical
##  image readers and applications to encapsulate medical image/acquisition
##  properties. Later on, this should probably be extended to add
##  any user-defined property.
##  @sa
##  vtkMedicalImageReader2
##

import
  vtkIOImageModule, vtkObject

discard "forward decl of vtkMedicalImagePropertiesInternals"
type
  vtkMedicalImageProperties* {.importcpp: "vtkMedicalImageProperties",
                              header: "vtkMedicalImageProperties.h", bycopy.} = object of vtkObject
    vtkMedicalImageProperties* {.importc: "vtkMedicalImageProperties".}: VTK_NEWINSTANCE
    ## *
    ##  PIMPL Encapsulation for STL containers
    ##


proc New*(): ptr vtkMedicalImageProperties {.
    importcpp: "vtkMedicalImageProperties::New(@)",
    header: "vtkMedicalImageProperties.h".}
type
  vtkMedicalImagePropertiesSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMedicalImageProperties::IsTypeOf(@)",
    header: "vtkMedicalImageProperties.h".}
proc IsA*(this: var vtkMedicalImageProperties; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkMedicalImageProperties.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMedicalImageProperties {.
    importcpp: "vtkMedicalImageProperties::SafeDownCast(@)",
    header: "vtkMedicalImageProperties.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMedicalImageProperties :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMedicalImageProperties :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMedicalImageProperties :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkMedicalImageProperties; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkMedicalImageProperties.h".}
proc Clear*(this: var vtkMedicalImageProperties) {.importcpp: "Clear",
    header: "vtkMedicalImageProperties.h".}
proc SetPatientName*(this: var vtkMedicalImageProperties; _arg: cstring) {.
    importcpp: "SetPatientName", header: "vtkMedicalImageProperties.h".}
proc GetPatientName*(this: var vtkMedicalImageProperties): cstring {.
    importcpp: "GetPatientName", header: "vtkMedicalImageProperties.h".}
  ## /@}
  ## /@{
  ## *
  ##  Patient ID
  ##  For ex: DICOM (0010,0020) = 1933197
  ##
proc SetPatientNamePatientID*(this: var vtkMedicalImageProperties; _arg: cstring) {.
    importcpp: "SetPatientNamePatientID", header: "vtkMedicalImageProperties.h".}
proc GetPatientNamePatientID*(this: var vtkMedicalImageProperties): cstring {.
    importcpp: "GetPatientNamePatientID", header: "vtkMedicalImageProperties.h".}
  ## /@}
  ## /@{
  ## *
  ##  Patient age
  ##  Format: nnnD, nnW, nnnM or nnnY (eventually nnD, nnW, nnY)
  ##  with D (day), M (month), W (week), Y (year)
  ##  For ex: DICOM (0010,1010) = 031Y
  ##
proc SetPatientNamePatientIDPatientAge*(this: var vtkMedicalImageProperties;
                                       _arg: cstring) {.
    importcpp: "SetPatientNamePatientIDPatientAge",
    header: "vtkMedicalImageProperties.h".}
proc GetPatientNamePatientIDPatientAge*(this: var vtkMedicalImageProperties): cstring {.
    importcpp: "GetPatientNamePatientIDPatientAge",
    header: "vtkMedicalImageProperties.h".}
  ## /@}
  ## *
  ##  Take as input a string in VR=AS (DICOM PS3.5) and extract either
  ##  different fields namely: year month week day
  ##  Return 0 on error, 1 on success
  ##  One can test fields if they are different from -1 upon success
  ##
proc GetAgeAsFields*(age: cstring; year: var cint; month: var cint; week: var cint;
                    day: var cint): cint {.importcpp: "vtkMedicalImageProperties::GetAgeAsFields(@)",
                                       header: "vtkMedicalImageProperties.h".}
proc GetPatientAgeYear*(this: var vtkMedicalImageProperties): cint {.
    importcpp: "GetPatientAgeYear", header: "vtkMedicalImageProperties.h".}
proc GetPatientAgeMonth*(this: var vtkMedicalImageProperties): cint {.
    importcpp: "GetPatientAgeMonth", header: "vtkMedicalImageProperties.h".}
proc GetPatientAgeWeek*(this: var vtkMedicalImageProperties): cint {.
    importcpp: "GetPatientAgeWeek", header: "vtkMedicalImageProperties.h".}
proc GetPatientAgeDay*(this: var vtkMedicalImageProperties): cint {.
    importcpp: "GetPatientAgeDay", header: "vtkMedicalImageProperties.h".}
proc SetPatientNamePatientIDPatientAgePatientSex*(
    this: var vtkMedicalImageProperties; _arg: cstring) {.
    importcpp: "SetPatientNamePatientIDPatientAgePatientSex",
    header: "vtkMedicalImageProperties.h".}
proc GetPatientNamePatientIDPatientAgePatientSex*(
    this: var vtkMedicalImageProperties): cstring {.
    importcpp: "GetPatientNamePatientIDPatientAgePatientSex",
    header: "vtkMedicalImageProperties.h".}
  ## /@}
  ## /@{
  ## *
  ##  Patient birth date
  ##  Format: yyyymmdd
  ##  For ex: DICOM (0010,0030) = 19680427
  ##
proc SetPatientNamePatientIDPatientAgePatientSexPatientBirthDate*(
    this: var vtkMedicalImageProperties; _arg: cstring) {.
    importcpp: "SetPatientNamePatientIDPatientAgePatientSexPatientBirthDate",
    header: "vtkMedicalImageProperties.h".}
proc GetPatientNamePatientIDPatientAgePatientSexPatientBirthDate*(
    this: var vtkMedicalImageProperties): cstring {.
    importcpp: "GetPatientNamePatientIDPatientAgePatientSexPatientBirthDate",
    header: "vtkMedicalImageProperties.h".}
  ## /@}
  ##  For Tcl:
  ##  From C++ use GetPatientBirthDate + GetDateAsFields
proc GetPatientBirthDateYear*(this: var vtkMedicalImageProperties): cint {.
    importcpp: "GetPatientBirthDateYear", header: "vtkMedicalImageProperties.h".}
proc GetPatientBirthDateMonth*(this: var vtkMedicalImageProperties): cint {.
    importcpp: "GetPatientBirthDateMonth", header: "vtkMedicalImageProperties.h".}
proc GetPatientBirthDateDay*(this: var vtkMedicalImageProperties): cint {.
    importcpp: "GetPatientBirthDateDay", header: "vtkMedicalImageProperties.h".}
proc SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDate*(
    this: var vtkMedicalImageProperties; _arg: cstring) {.importcpp: "SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDate",
    header: "vtkMedicalImageProperties.h".}
proc GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDate*(
    this: var vtkMedicalImageProperties): cstring {.importcpp: "GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDate",
    header: "vtkMedicalImageProperties.h".}
  ## /@}
  ## /@{
  ## *
  ##  Acquisition Date
  ##  Format: yyyymmdd
  ##  For ex: DICOM (0008,0022) = 20030617
  ##
proc SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDate*(
    this: var vtkMedicalImageProperties; _arg: cstring) {.importcpp: "SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDate",
    header: "vtkMedicalImageProperties.h".}
proc GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDate*(
    this: var vtkMedicalImageProperties): cstring {.importcpp: "GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDate",
    header: "vtkMedicalImageProperties.h".}
  ## /@}
  ##  For Tcl:
  ##  From C++ use GetAcquisitionDate + GetDateAsFields
proc GetAcquisitionDateYear*(this: var vtkMedicalImageProperties): cint {.
    importcpp: "GetAcquisitionDateYear", header: "vtkMedicalImageProperties.h".}
proc GetAcquisitionDateMonth*(this: var vtkMedicalImageProperties): cint {.
    importcpp: "GetAcquisitionDateMonth", header: "vtkMedicalImageProperties.h".}
proc GetAcquisitionDateDay*(this: var vtkMedicalImageProperties): cint {.
    importcpp: "GetAcquisitionDateDay", header: "vtkMedicalImageProperties.h".}
proc SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTime*(
    this: var vtkMedicalImageProperties; _arg: cstring) {.importcpp: "SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTime",
    header: "vtkMedicalImageProperties.h".}
proc GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTime*(
    this: var vtkMedicalImageProperties): cstring {.importcpp: "GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTime",
    header: "vtkMedicalImageProperties.h".}
  ## /@}
  ## /@{
  ## *
  ##  Acquisition time
  ##  Format: hhmmss.frac (any trailing component(s) can be omitted)
  ##  For ex: DICOM (0008,0032) = 162552.0705 or 230012, or 0012
  ##
proc SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTime*(
    this: var vtkMedicalImageProperties; _arg: cstring) {.importcpp: "SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTime",
    header: "vtkMedicalImageProperties.h".}
proc GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTime*(
    this: var vtkMedicalImageProperties): cstring {.importcpp: "GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTime",
    header: "vtkMedicalImageProperties.h".}
  ## /@}
  ## /@{
  ## *
  ##  Image Date aka Content Date
  ##  Format: yyyymmdd
  ##  For ex: DICOM (0008,0023) = 20030617
  ##
proc SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDate*(
    this: var vtkMedicalImageProperties; _arg: cstring) {.importcpp: "SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDate",
    header: "vtkMedicalImageProperties.h".}
proc GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDate*(
    this: var vtkMedicalImageProperties): cstring {.importcpp: "GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDate",
    header: "vtkMedicalImageProperties.h".}
  ## /@}
  ##  For Tcl:
  ##  From C++ use GetImageDate + GetDateAsFields
proc GetImageDateYear*(this: var vtkMedicalImageProperties): cint {.
    importcpp: "GetImageDateYear", header: "vtkMedicalImageProperties.h".}
proc GetImageDateMonth*(this: var vtkMedicalImageProperties): cint {.
    importcpp: "GetImageDateMonth", header: "vtkMedicalImageProperties.h".}
proc GetImageDateDay*(this: var vtkMedicalImageProperties): cint {.
    importcpp: "GetImageDateDay", header: "vtkMedicalImageProperties.h".}
proc GetDateAsFields*(date: cstring; year: var cint; month: var cint; day: var cint): cint {.
    importcpp: "vtkMedicalImageProperties::GetDateAsFields(@)",
    header: "vtkMedicalImageProperties.h".}
proc GetTimeAsFields*(time: cstring; hour: var cint; minute: var cint; second: var cint): cint {.
    importcpp: "vtkMedicalImageProperties::GetTimeAsFields(@)",
    header: "vtkMedicalImageProperties.h".}
  ##  , long &milliseconds
proc GetDateAsLocale*(date: cstring; locale: cstring): cint {.
    importcpp: "vtkMedicalImageProperties::GetDateAsLocale(@)",
    header: "vtkMedicalImageProperties.h".}
proc SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTime*(
    this: var vtkMedicalImageProperties; _arg: cstring) {.importcpp: "SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTime",
    header: "vtkMedicalImageProperties.h".}
proc GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTime*(
    this: var vtkMedicalImageProperties): cstring {.importcpp: "GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTime",
    header: "vtkMedicalImageProperties.h".}
  ## /@}
  ## /@{
  ## *
  ##  Image number
  ##  For ex: DICOM (0020,0013) = 1
  ##
proc SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumber*(
    this: var vtkMedicalImageProperties; _arg: cstring) {.importcpp: "SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumber",
    header: "vtkMedicalImageProperties.h".}
proc GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumber*(
    this: var vtkMedicalImageProperties): cstring {.importcpp: "GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumber",
    header: "vtkMedicalImageProperties.h".}
  ## /@}
  ## /@{
  ## *
  ##  Series number
  ##  For ex: DICOM (0020,0011) = 902
  ##
proc SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumber*(
    this: var vtkMedicalImageProperties; _arg: cstring) {.importcpp: "SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumber",
    header: "vtkMedicalImageProperties.h".}
proc GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumber*(
    this: var vtkMedicalImageProperties): cstring {.importcpp: "GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumber",
    header: "vtkMedicalImageProperties.h".}
  ## /@}
  ## /@{
  ## *
  ##  Series Description
  ##  User provided description of the Series
  ##  For ex: DICOM (0008,103e) = SCOUT
  ##
proc SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescription*(
    this: var vtkMedicalImageProperties; _arg: cstring) {.importcpp: "SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescription",
    header: "vtkMedicalImageProperties.h".}
proc GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescription*(
    this: var vtkMedicalImageProperties): cstring {.importcpp: "GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescription",
    header: "vtkMedicalImageProperties.h".}
  ## /@}
  ## /@{
  ## *
  ##  Study ID
  ##  For ex: DICOM (0020,0010) = 37481
  ##
proc SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyID*(
    this: var vtkMedicalImageProperties; _arg: cstring) {.importcpp: "SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyID",
    header: "vtkMedicalImageProperties.h".}
proc GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyID*(
    this: var vtkMedicalImageProperties): cstring {.importcpp: "GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyID",
    header: "vtkMedicalImageProperties.h".}
  ## /@}
  ## /@{
  ## *
  ##  Study description
  ##  For ex: DICOM (0008,1030) = BRAIN/C-SP/FACIAL
  ##
proc SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescription*(
    this: var vtkMedicalImageProperties; _arg: cstring) {.importcpp: "SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescription",
    header: "vtkMedicalImageProperties.h".}
proc GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescription*(
    this: var vtkMedicalImageProperties): cstring {.importcpp: "GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescription",
    header: "vtkMedicalImageProperties.h".}
  ## /@}
  ## /@{
  ## *
  ##  Modality
  ##  For ex: DICOM (0008,0060)= CT
  ##
proc SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModality*(
    this: var vtkMedicalImageProperties; _arg: cstring) {.importcpp: "SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModality",
    header: "vtkMedicalImageProperties.h".}
proc GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModality*(
    this: var vtkMedicalImageProperties): cstring {.importcpp: "GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModality",
    header: "vtkMedicalImageProperties.h".}
  ## /@}
  ## /@{
  ## *
  ##  Manufacturer
  ##  For ex: DICOM (0008,0070) = Siemens
  ##
proc SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturer*(
    this: var vtkMedicalImageProperties; _arg: cstring) {.importcpp: "SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturer",
    header: "vtkMedicalImageProperties.h".}
proc GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturer*(
    this: var vtkMedicalImageProperties): cstring {.importcpp: "GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturer",
    header: "vtkMedicalImageProperties.h".}
  ## /@}
  ## /@{
  ## *
  ##  Manufacturer's Model Name
  ##  For ex: DICOM (0008,1090) = LightSpeed QX/i
  ##
proc SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelName*(
    this: var vtkMedicalImageProperties; _arg: cstring) {.importcpp: "SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelName",
    header: "vtkMedicalImageProperties.h".}
proc GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelName*(
    this: var vtkMedicalImageProperties): cstring {.importcpp: "GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelName",
    header: "vtkMedicalImageProperties.h".}
  ## /@}
  ## /@{
  ## *
  ##  Station Name
  ##  For ex: DICOM (0008,1010) = LSPD_OC8
  ##
proc SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationName*(
    this: var vtkMedicalImageProperties; _arg: cstring) {.importcpp: "SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationName",
    header: "vtkMedicalImageProperties.h".}
proc GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationName*(
    this: var vtkMedicalImageProperties): cstring {.importcpp: "GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationName",
    header: "vtkMedicalImageProperties.h".}
  ## /@}
  ## /@{
  ## *
  ##  Institution Name
  ##  For ex: DICOM (0008,0080) = FooCity Medical Center
  ##
proc SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionName*(
    this: var vtkMedicalImageProperties; _arg: cstring) {.importcpp: "SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionName",
    header: "vtkMedicalImageProperties.h".}
proc GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionName*(
    this: var vtkMedicalImageProperties): cstring {.importcpp: "GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionName",
    header: "vtkMedicalImageProperties.h".}
  ## /@}
  ## /@{
  ## *
  ##  Convolution Kernel (or algorithm used to reconstruct the data)
  ##  For ex: DICOM (0018,1210) = Bone
  ##
proc SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernel*(
    this: var vtkMedicalImageProperties; _arg: cstring) {.importcpp: "SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernel",
    header: "vtkMedicalImageProperties.h".}
proc GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernel*(
    this: var vtkMedicalImageProperties): cstring {.importcpp: "GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernel",
    header: "vtkMedicalImageProperties.h".}
  ## /@}
  ## /@{
  ## *
  ##  Slice Thickness (Nominal reconstructed slice thickness, in mm)
  ##  For ex: DICOM (0018,0050) = 0.273438
  ##
proc SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernelSliceThickness*(
    this: var vtkMedicalImageProperties; _arg: cstring) {.importcpp: "SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernelSliceThickness",
    header: "vtkMedicalImageProperties.h".}
proc GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernelSliceThickness*(
    this: var vtkMedicalImageProperties): cstring {.importcpp: "GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernelSliceThickness",
    header: "vtkMedicalImageProperties.h".}
proc GetSliceThicknessAsDouble*(this: var vtkMedicalImageProperties): cdouble {.
    importcpp: "GetSliceThicknessAsDouble", header: "vtkMedicalImageProperties.h".}
proc SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernelSliceThicknessKVP*(
    this: var vtkMedicalImageProperties; _arg: cstring) {.importcpp: "SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernelSliceThicknessKVP",
    header: "vtkMedicalImageProperties.h".}
proc GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernelSliceThicknessKVP*(
    this: var vtkMedicalImageProperties): cstring {.importcpp: "GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernelSliceThicknessKVP",
    header: "vtkMedicalImageProperties.h".}
  ## /@}
  ## /@{
  ## *
  ##  Gantry/Detector tilt (Nominal angle of tilt in degrees of the scanning
  ##  gantry.)
  ##  For ex: DICOM (0018,1120) = 15
  ##
proc SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernelSliceThicknessKVPGantryTilt*(
    this: var vtkMedicalImageProperties; _arg: cstring) {.importcpp: "SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernelSliceThicknessKVPGantryTilt",
    header: "vtkMedicalImageProperties.h".}
proc GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernelSliceThicknessKVPGantryTilt*(
    this: var vtkMedicalImageProperties): cstring {.importcpp: "GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernelSliceThicknessKVPGantryTilt",
    header: "vtkMedicalImageProperties.h".}
proc GetGantryTiltAsDouble*(this: var vtkMedicalImageProperties): cdouble {.
    importcpp: "GetGantryTiltAsDouble", header: "vtkMedicalImageProperties.h".}
proc SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernelSliceThicknessKVPGantryTiltEchoTime*(
    this: var vtkMedicalImageProperties; _arg: cstring) {.importcpp: "SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernelSliceThicknessKVPGantryTiltEchoTime",
    header: "vtkMedicalImageProperties.h".}
proc GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernelSliceThicknessKVPGantryTiltEchoTime*(
    this: var vtkMedicalImageProperties): cstring {.importcpp: "GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernelSliceThicknessKVPGantryTiltEchoTime",
    header: "vtkMedicalImageProperties.h".}
  ## /@}
  ## /@{
  ## *
  ##  Echo Train Length
  ##  (Number of lines in k-space acquired per excitation per image)
  ##  For ex: DICOM (0018,0091) = 35
  ##
proc SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernelSliceThicknessKVPGantryTiltEchoTimeEchoTrainLength*(
    this: var vtkMedicalImageProperties; _arg: cstring) {.importcpp: "SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernelSliceThicknessKVPGantryTiltEchoTimeEchoTrainLength",
    header: "vtkMedicalImageProperties.h".}
proc GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernelSliceThicknessKVPGantryTiltEchoTimeEchoTrainLength*(
    this: var vtkMedicalImageProperties): cstring {.importcpp: "GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernelSliceThicknessKVPGantryTiltEchoTimeEchoTrainLength",
    header: "vtkMedicalImageProperties.h".}
  ## /@}
  ## /@{
  ## *
  ##  Repetition Time
  ##  The period of time in msec between the beginning of a pulse sequence and
  ##  the beginning of the succeeding (essentially identical) pulse sequence.
  ##  For ex: DICOM (0018,0080) = 2040
  ##
proc SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernelSliceThicknessKVPGantryTiltEchoTimeEchoTrainLengthRepetitionTime*(
    this: var vtkMedicalImageProperties; _arg: cstring) {.importcpp: "SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernelSliceThicknessKVPGantryTiltEchoTimeEchoTrainLengthRepetitionTime",
    header: "vtkMedicalImageProperties.h".}
proc GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernelSliceThicknessKVPGantryTiltEchoTimeEchoTrainLengthRepetitionTime*(
    this: var vtkMedicalImageProperties): cstring {.importcpp: "GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernelSliceThicknessKVPGantryTiltEchoTimeEchoTrainLengthRepetitionTime",
    header: "vtkMedicalImageProperties.h".}
  ## /@}
  ## /@{
  ## *
  ##  Exposure time (time of x-ray exposure in msec)
  ##  For ex: DICOM (0018,1150) = 5
  ##
proc SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernelSliceThicknessKVPGantryTiltEchoTimeEchoTrainLengthRepetitionTimeExposureTime*(
    this: var vtkMedicalImageProperties; _arg: cstring) {.importcpp: "SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernelSliceThicknessKVPGantryTiltEchoTimeEchoTrainLengthRepetitionTimeExposureTime",
    header: "vtkMedicalImageProperties.h".}
proc GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernelSliceThicknessKVPGantryTiltEchoTimeEchoTrainLengthRepetitionTimeExposureTime*(
    this: var vtkMedicalImageProperties): cstring {.importcpp: "GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernelSliceThicknessKVPGantryTiltEchoTimeEchoTrainLengthRepetitionTimeExposureTime",
    header: "vtkMedicalImageProperties.h".}
  ## /@}
  ## /@{
  ## *
  ##  X-ray tube current (in mA)
  ##  For ex: DICOM (0018,1151) = 400
  ##
proc SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernelSliceThicknessKVPGantryTiltEchoTimeEchoTrainLengthRepetitionTimeExposureTimeXRayTubeCurrent*(
    this: var vtkMedicalImageProperties; _arg: cstring) {.importcpp: "SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernelSliceThicknessKVPGantryTiltEchoTimeEchoTrainLengthRepetitionTimeExposureTimeXRayTubeCurrent",
    header: "vtkMedicalImageProperties.h".}
proc GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernelSliceThicknessKVPGantryTiltEchoTimeEchoTrainLengthRepetitionTimeExposureTimeXRayTubeCurrent*(
    this: var vtkMedicalImageProperties): cstring {.importcpp: "GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernelSliceThicknessKVPGantryTiltEchoTimeEchoTrainLengthRepetitionTimeExposureTimeXRayTubeCurrent",
    header: "vtkMedicalImageProperties.h".}
  ## /@}
  ## /@{
  ## *
  ##  Exposure (The exposure expressed in mAs, for example calculated
  ##  from Exposure Time and X-ray Tube Current)
  ##  For ex: DICOM (0018,1152) = 114
  ##
proc SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernelSliceThicknessKVPGantryTiltEchoTimeEchoTrainLengthRepetitionTimeExposureTimeXRayTubeCurrentExposure*(
    this: var vtkMedicalImageProperties; _arg: cstring) {.importcpp: "SetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernelSliceThicknessKVPGantryTiltEchoTimeEchoTrainLengthRepetitionTimeExposureTimeXRayTubeCurrentExposure",
    header: "vtkMedicalImageProperties.h".}
proc GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernelSliceThicknessKVPGantryTiltEchoTimeEchoTrainLengthRepetitionTimeExposureTimeXRayTubeCurrentExposure*(
    this: var vtkMedicalImageProperties): cstring {.importcpp: "GetPatientNamePatientIDPatientAgePatientSexPatientBirthDateStudyDateAcquisitionDateStudyTimeAcquisitionTimeImageDateImageTimeImageNumberSeriesNumberSeriesDescriptionStudyIDStudyDescriptionModalityManufacturerManufacturerModelNameStationNameInstitutionNameConvolutionKernelSliceThicknessKVPGantryTiltEchoTimeEchoTrainLengthRepetitionTimeExposureTimeXRayTubeCurrentExposure",
    header: "vtkMedicalImageProperties.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the direction cosine (default to 1,0,0,0,1,0)
  ##
proc SetDirectionCosine*(this: var vtkMedicalImageProperties; _arg1: cdouble;
                        _arg2: cdouble; _arg3: cdouble; _arg4: cdouble;
                        _arg5: cdouble; _arg6: cdouble) {.
    importcpp: "SetDirectionCosine", header: "vtkMedicalImageProperties.h".}
proc SetDirectionCosine*(this: var vtkMedicalImageProperties;
                        _arg: array[6, cdouble]) {.importcpp: "SetDirectionCosine",
    header: "vtkMedicalImageProperties.h".}
## !!!Ignored construct:  virtual double * GetDirectionCosine ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << DirectionCosine  pointer  << this -> DirectionCosine ) ; return this -> DirectionCosine ; } VTK_WRAPEXCLUDE virtual void GetDirectionCosine ( double & _arg1 , double & _arg2 , double & _arg3 , double & _arg4 , double & _arg5 , double & _arg6 ) { _arg1 = this -> DirectionCosine [ 0 ] ; _arg2 = this -> DirectionCosine [ 1 ] ; _arg3 = this -> DirectionCosine [ 2 ] ; _arg4 = this -> DirectionCosine [ 3 ] ; _arg5 = this -> DirectionCosine [ 4 ] ; _arg6 = this -> DirectionCosine [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << DirectionCosine  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetDirectionCosine ( double _arg [ 6 ] ) { this -> GetDirectionCosine ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ;
## Error: expected ';'!!!

proc AddUserDefinedValue*(this: var vtkMedicalImageProperties; name: cstring;
                         value: cstring) {.importcpp: "AddUserDefinedValue",
    header: "vtkMedicalImageProperties.h".}
proc GetUserDefinedValue*(this: var vtkMedicalImageProperties; name: cstring): cstring {.
    importcpp: "GetUserDefinedValue", header: "vtkMedicalImageProperties.h".}
proc GetNumberOfUserDefinedValues*(this: var vtkMedicalImageProperties): cuint {.
    importcpp: "GetNumberOfUserDefinedValues",
    header: "vtkMedicalImageProperties.h".}
proc GetUserDefinedNameByIndex*(this: var vtkMedicalImageProperties; idx: cuint): cstring {.
    importcpp: "GetUserDefinedNameByIndex", header: "vtkMedicalImageProperties.h".}
proc GetUserDefinedValueByIndex*(this: var vtkMedicalImageProperties; idx: cuint): cstring {.
    importcpp: "GetUserDefinedValueByIndex", header: "vtkMedicalImageProperties.h".}
proc RemoveAllUserDefinedValues*(this: var vtkMedicalImageProperties) {.
    importcpp: "RemoveAllUserDefinedValues", header: "vtkMedicalImageProperties.h".}
proc AddWindowLevelPreset*(this: var vtkMedicalImageProperties; w: cdouble; l: cdouble): cint {.
    importcpp: "AddWindowLevelPreset", header: "vtkMedicalImageProperties.h".}
proc RemoveWindowLevelPreset*(this: var vtkMedicalImageProperties; w: cdouble;
                             l: cdouble) {.importcpp: "RemoveWindowLevelPreset",
    header: "vtkMedicalImageProperties.h".}
proc RemoveAllWindowLevelPresets*(this: var vtkMedicalImageProperties) {.
    importcpp: "RemoveAllWindowLevelPresets",
    header: "vtkMedicalImageProperties.h".}
proc GetNumberOfWindowLevelPresets*(this: var vtkMedicalImageProperties): cint {.
    importcpp: "GetNumberOfWindowLevelPresets",
    header: "vtkMedicalImageProperties.h".}
proc HasWindowLevelPreset*(this: var vtkMedicalImageProperties; w: cdouble; l: cdouble): cint {.
    importcpp: "HasWindowLevelPreset", header: "vtkMedicalImageProperties.h".}
proc GetWindowLevelPresetIndex*(this: var vtkMedicalImageProperties; w: cdouble;
                               l: cdouble): cint {.
    importcpp: "GetWindowLevelPresetIndex", header: "vtkMedicalImageProperties.h".}
proc GetNthWindowLevelPreset*(this: var vtkMedicalImageProperties; idx: cint;
                             w: ptr cdouble; l: ptr cdouble): cint {.
    importcpp: "GetNthWindowLevelPreset", header: "vtkMedicalImageProperties.h".}
## !!!Ignored construct:  virtual double * GetNthWindowLevelPreset ( int idx ) VTK_SIZEHINT ( 2 ) ;
## Error: expected ';'!!!

proc SetNthWindowLevelPresetComment*(this: var vtkMedicalImageProperties; idx: cint;
                                    comment: cstring) {.
    importcpp: "SetNthWindowLevelPresetComment",
    header: "vtkMedicalImageProperties.h".}
proc GetNthWindowLevelPresetComment*(this: var vtkMedicalImageProperties; idx: cint): cstring {.
    importcpp: "GetNthWindowLevelPresetComment",
    header: "vtkMedicalImageProperties.h".}
proc GetInstanceUIDFromSliceID*(this: var vtkMedicalImageProperties;
                               volumeidx: cint; sliceid: cint): cstring {.
    importcpp: "GetInstanceUIDFromSliceID", header: "vtkMedicalImageProperties.h".}
proc SetInstanceUIDFromSliceID*(this: var vtkMedicalImageProperties;
                               volumeidx: cint; sliceid: cint; uid: cstring) {.
    importcpp: "SetInstanceUIDFromSliceID", header: "vtkMedicalImageProperties.h".}
proc GetSliceIDFromInstanceUID*(this: var vtkMedicalImageProperties;
                               volumeidx: var cint; uid: cstring): cint {.
    importcpp: "GetSliceIDFromInstanceUID", header: "vtkMedicalImageProperties.h".}
type
  vtkMedicalImagePropertiesOrientationType* {.size: sizeof(cint),
      importcpp: "vtkMedicalImageProperties::OrientationType",
      header: "vtkMedicalImageProperties.h".} = enum
    AXIAL = 0, CORONAL, SAGITTAL


proc GetOrientationType*(this: var vtkMedicalImageProperties; volumeidx: cint): cint {.
    importcpp: "GetOrientationType", header: "vtkMedicalImageProperties.h".}
proc SetOrientationType*(this: var vtkMedicalImageProperties; volumeidx: cint;
                        orientation: cint) {.importcpp: "SetOrientationType",
    header: "vtkMedicalImageProperties.h".}
proc GetStringFromOrientationType*(`type`: cuint): cstring {.
    importcpp: "vtkMedicalImageProperties::GetStringFromOrientationType(@)",
    header: "vtkMedicalImageProperties.h".}
proc DeepCopy*(this: var vtkMedicalImageProperties; p: ptr vtkMedicalImageProperties) {.
    importcpp: "DeepCopy", header: "vtkMedicalImageProperties.h".}