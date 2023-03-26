## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkStringToNumeric.h
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
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkStringToNumeric
##  @brief   Converts string arrays to numeric arrays
##
##
##  vtkStringToNumeric is a filter for converting a string array
##  into a numeric arrays.
##

import
  vtkDataObjectAlgorithm, vtkInfovisCoreModule

type
  vtkStringToNumeric* {.importcpp: "vtkStringToNumeric",
                       header: "vtkStringToNumeric.h", bycopy.} = object of vtkDataObjectAlgorithm
    vtkStringToNumeric* {.importc: "vtkStringToNumeric".}: VTK_NEWINSTANCE
    ## *
    ##  Count the total number of items (array components) that will need
    ##  to be converted in the given vtkFieldData.  This lets us emit
    ##  ProgressEvent.
    ##


proc New*(): ptr vtkStringToNumeric {.importcpp: "vtkStringToNumeric::New(@)",
                                  header: "vtkStringToNumeric.h".}
type
  vtkStringToNumericSuperclass* = vtkDataObjectAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkStringToNumeric::IsTypeOf(@)", header: "vtkStringToNumeric.h".}
proc IsA*(this: var vtkStringToNumeric; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkStringToNumeric.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkStringToNumeric {.
    importcpp: "vtkStringToNumeric::SafeDownCast(@)",
    header: "vtkStringToNumeric.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkStringToNumeric :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObjectAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkStringToNumeric :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkStringToNumeric :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkStringToNumeric; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkStringToNumeric.h".}
proc SetForceDouble*(this: var vtkStringToNumeric; _arg: bool) {.
    importcpp: "SetForceDouble", header: "vtkStringToNumeric.h".}
## !!!Ignored construct:  virtual bool GetForceDouble ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ForceDouble  of  << this -> ForceDouble ) ; return this -> ForceDouble ; } ;
## Error: expected ';'!!!

proc ForceDoubleOn*(this: var vtkStringToNumeric) {.importcpp: "ForceDoubleOn",
    header: "vtkStringToNumeric.h".}
proc ForceDoubleOff*(this: var vtkStringToNumeric) {.importcpp: "ForceDoubleOff",
    header: "vtkStringToNumeric.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the default integer value assigned to arrays.  Default is 0.
  ##
proc SetForceDoubleDefaultIntegerValue*(this: var vtkStringToNumeric; _arg: cint) {.
    importcpp: "SetForceDoubleDefaultIntegerValue", header: "vtkStringToNumeric.h".}
## !!!Ignored construct:  virtual int GetForceDoubleDefaultIntegerValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DefaultIntegerValue  of  << this -> DefaultIntegerValue ) ; return this -> DefaultIntegerValue ; } ;
## Error: expected ';'!!!

proc SetForceDoubleDefaultIntegerValueDefaultDoubleValue*(
    this: var vtkStringToNumeric; _arg: cdouble) {.
    importcpp: "SetForceDoubleDefaultIntegerValueDefaultDoubleValue",
    header: "vtkStringToNumeric.h".}
## !!!Ignored construct:  virtual double GetForceDoubleDefaultIntegerValueDefaultDoubleValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DefaultDoubleValue  of  << this -> DefaultDoubleValue ) ; return this -> DefaultDoubleValue ; } ;
## Error: expected ';'!!!

proc SetForceDoubleDefaultIntegerValueDefaultDoubleValueTrimWhitespacePriorToNumericConversion*(
    this: var vtkStringToNumeric; _arg: bool) {.importcpp: "SetForceDoubleDefaultIntegerValueDefaultDoubleValueTrimWhitespacePriorToNumericConversion",
    header: "vtkStringToNumeric.h".}
## !!!Ignored construct:  virtual bool GetForceDoubleDefaultIntegerValueDefaultDoubleValueTrimWhitespacePriorToNumericConversion ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TrimWhitespacePriorToNumericConversion  of  << this -> TrimWhitespacePriorToNumericConversion ) ; return this -> TrimWhitespacePriorToNumericConversion ; } ;
## Error: expected ';'!!!

proc TrimWhitespacePriorToNumericConversionOn*(this: var vtkStringToNumeric) {.
    importcpp: "TrimWhitespacePriorToNumericConversionOn",
    header: "vtkStringToNumeric.h".}
proc TrimWhitespacePriorToNumericConversionOff*(this: var vtkStringToNumeric) {.
    importcpp: "TrimWhitespacePriorToNumericConversionOff",
    header: "vtkStringToNumeric.h".}
  ## /@}
  ## /@{
  ## *
  ##  Whether to detect and convert field data arrays.  Default is on.
  ##
proc SetForceDoubleDefaultIntegerValueDefaultDoubleValueTrimWhitespacePriorToNumericConversionConvertFieldData*(
    this: var vtkStringToNumeric; _arg: bool) {.importcpp: "SetForceDoubleDefaultIntegerValueDefaultDoubleValueTrimWhitespacePriorToNumericConversionConvertFieldData",
    header: "vtkStringToNumeric.h".}
## !!!Ignored construct:  virtual bool GetForceDoubleDefaultIntegerValueDefaultDoubleValueTrimWhitespacePriorToNumericConversionConvertFieldData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ConvertFieldData  of  << this -> ConvertFieldData ) ; return this -> ConvertFieldData ; } ;
## Error: expected ';'!!!

proc ConvertFieldDataOn*(this: var vtkStringToNumeric) {.
    importcpp: "ConvertFieldDataOn", header: "vtkStringToNumeric.h".}
proc ConvertFieldDataOff*(this: var vtkStringToNumeric) {.
    importcpp: "ConvertFieldDataOff", header: "vtkStringToNumeric.h".}
  ## /@}
  ## /@{
  ## *
  ##  Whether to detect and convert cell data arrays.  Default is on.
  ##
proc SetForceDoubleDefaultIntegerValueDefaultDoubleValueTrimWhitespacePriorToNumericConversionConvertFieldDataConvertPointData*(
    this: var vtkStringToNumeric; _arg: bool) {.importcpp: "SetForceDoubleDefaultIntegerValueDefaultDoubleValueTrimWhitespacePriorToNumericConversionConvertFieldDataConvertPointData",
    header: "vtkStringToNumeric.h".}
## !!!Ignored construct:  virtual bool GetForceDoubleDefaultIntegerValueDefaultDoubleValueTrimWhitespacePriorToNumericConversionConvertFieldDataConvertPointData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ConvertPointData  of  << this -> ConvertPointData ) ; return this -> ConvertPointData ; } ;
## Error: expected ';'!!!

proc ConvertPointDataOn*(this: var vtkStringToNumeric) {.
    importcpp: "ConvertPointDataOn", header: "vtkStringToNumeric.h".}
proc ConvertPointDataOff*(this: var vtkStringToNumeric) {.
    importcpp: "ConvertPointDataOff", header: "vtkStringToNumeric.h".}
  ## /@}
  ## /@{
  ## *
  ##  Whether to detect and convert point data arrays.  Default is on.
  ##
proc SetForceDoubleDefaultIntegerValueDefaultDoubleValueTrimWhitespacePriorToNumericConversionConvertFieldDataConvertPointDataConvertCellData*(
    this: var vtkStringToNumeric; _arg: bool) {.importcpp: "SetForceDoubleDefaultIntegerValueDefaultDoubleValueTrimWhitespacePriorToNumericConversionConvertFieldDataConvertPointDataConvertCellData",
    header: "vtkStringToNumeric.h".}
## !!!Ignored construct:  virtual bool GetForceDoubleDefaultIntegerValueDefaultDoubleValueTrimWhitespacePriorToNumericConversionConvertFieldDataConvertPointDataConvertCellData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ConvertCellData  of  << this -> ConvertCellData ) ; return this -> ConvertCellData ; } ;
## Error: expected ';'!!!

proc ConvertCellDataOn*(this: var vtkStringToNumeric) {.
    importcpp: "ConvertCellDataOn", header: "vtkStringToNumeric.h".}
proc ConvertCellDataOff*(this: var vtkStringToNumeric) {.
    importcpp: "ConvertCellDataOff", header: "vtkStringToNumeric.h".}
  ## /@}
  ## *
  ##  Whether to detect and convert vertex data arrays.  Default is on.
  ##
proc SetConvertVertexData*(this: var vtkStringToNumeric; b: bool) {.
    importcpp: "SetConvertVertexData", header: "vtkStringToNumeric.h".}
proc GetConvertVertexData*(this: var vtkStringToNumeric): bool {.
    importcpp: "GetConvertVertexData", header: "vtkStringToNumeric.h".}
proc ConvertVertexDataOn*(this: var vtkStringToNumeric) {.
    importcpp: "ConvertVertexDataOn", header: "vtkStringToNumeric.h".}
proc ConvertVertexDataOff*(this: var vtkStringToNumeric) {.
    importcpp: "ConvertVertexDataOff", header: "vtkStringToNumeric.h".}
  ## *
  ##  Whether to detect and convert edge data arrays.  Default is on.
  ##
proc SetConvertEdgeData*(this: var vtkStringToNumeric; b: bool) {.
    importcpp: "SetConvertEdgeData", header: "vtkStringToNumeric.h".}
proc GetConvertEdgeData*(this: var vtkStringToNumeric): bool {.
    importcpp: "GetConvertEdgeData", header: "vtkStringToNumeric.h".}
proc ConvertEdgeDataOn*(this: var vtkStringToNumeric) {.
    importcpp: "ConvertEdgeDataOn", header: "vtkStringToNumeric.h".}
proc ConvertEdgeDataOff*(this: var vtkStringToNumeric) {.
    importcpp: "ConvertEdgeDataOff", header: "vtkStringToNumeric.h".}
  ## *
  ##  Whether to detect and convert row data arrays.  Default is on.
  ##
proc SetConvertRowData*(this: var vtkStringToNumeric; b: bool) {.
    importcpp: "SetConvertRowData", header: "vtkStringToNumeric.h".}
proc GetConvertRowData*(this: var vtkStringToNumeric): bool {.
    importcpp: "GetConvertRowData", header: "vtkStringToNumeric.h".}
proc ConvertRowDataOn*(this: var vtkStringToNumeric) {.
    importcpp: "ConvertRowDataOn", header: "vtkStringToNumeric.h".}
proc ConvertRowDataOff*(this: var vtkStringToNumeric) {.
    importcpp: "ConvertRowDataOff", header: "vtkStringToNumeric.h".}
  ## *
  ##  This is required to capture REQUEST_DATA_OBJECT requests.
  ##
proc ProcessRequest*(this: var vtkStringToNumeric; request: ptr vtkInformation;
                    inputVector: ptr ptr vtkInformationVector;
                    outputVector: ptr vtkInformationVector): vtkTypeBool {.
    importcpp: "ProcessRequest", header: "vtkStringToNumeric.h".}