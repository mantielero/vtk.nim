## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTemporalDelimitedTextReader.h
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
##  @class   vtkTemporalDelimitedTextReader
##  @brief   reads a delimited ascii or unicode text files and and output a
##  temporal vtkTable.
##
##  This reader requires that FieldDelimiterCharacters is set before
##  the pipeline is executed, otherwise it will produce an empty output.
##
##  A column can be selected as time step indicator using the SetTimeColumnName
##  or SetTimeColumnId functions. If so, for a given time step 's' only the
##  lines where the time step indicator column have the value 's' are present.
##  To control if the time step indicator column should be present in the
##  output, a RemoveTimeStepColumn option is available. If no time step
##  indicator column is given by the user, the whole file it outputted.
##
##  This reader assume the time step column is numeric. A warning is
##  set otherwise. The DetectNumericColumns field is set to on,
##  do not change this field unless you really know what you are
##  doing.
##
##  @see vtkDelimitedTextReader
##

import
  vtkDelimitedTextReader, vtkIOInfovisModule, vtkNew

type
  vtkTemporalDelimitedTextReader* {.importcpp: "vtkTemporalDelimitedTextReader",
                                   header: "vtkTemporalDelimitedTextReader.h",
                                   bycopy.} = object of vtkDelimitedTextReader
    vtkTemporalDelimitedTextReader* {.importc: "vtkTemporalDelimitedTextReader".}: VTK_NEWINSTANCE
    ##  Input file content and update


proc New*(): ptr vtkTemporalDelimitedTextReader {.
    importcpp: "vtkTemporalDelimitedTextReader::New(@)",
    header: "vtkTemporalDelimitedTextReader.h".}
type
  vtkTemporalDelimitedTextReaderSuperclass* = vtkDelimitedTextReader

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTemporalDelimitedTextReader::IsTypeOf(@)",
    header: "vtkTemporalDelimitedTextReader.h".}
proc IsA*(this: var vtkTemporalDelimitedTextReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTemporalDelimitedTextReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTemporalDelimitedTextReader {.
    importcpp: "vtkTemporalDelimitedTextReader::SafeDownCast(@)",
    header: "vtkTemporalDelimitedTextReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTemporalDelimitedTextReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDelimitedTextReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTemporalDelimitedTextReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTemporalDelimitedTextReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTemporalDelimitedTextReader; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkTemporalDelimitedTextReader.h".}
## !!!Ignored construct:  /@{ *
##  Get/Set the name of the column to use as time indicator.
##  Ignored if TimeColumnId is not equal to -1.
##  If no column has been chosen using either the TimeColumnId or the
##  TimeColumnName the whole input file is outputted.
##  Default to empty string.
##  virtual std :: string GetTimeColumnNameTimeColumnName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TimeColumnName  of  << this -> TimeColumnName ) ; return this -> TimeColumnName ; } ;
## Error: expected ';'!!!

proc SetTimeColumnName*(this: var vtkTemporalDelimitedTextReader; name: string) {.
    importcpp: "SetTimeColumnName", header: "vtkTemporalDelimitedTextReader.h".}
## !!!Ignored construct:  /@} /@{ *
##  Get/Set the column to use as time indicator.
##  It the TimeColumnId is equal to -1, the TimeColumnName will be used
##  instead.
##  If no column has been chosen using either the TimeColumnId or the
##  TimeColumnName the whole input file is outputted.
##  Default to -1.
##  virtual int GetTimeColumnNameTimeColumnNameTimeColumnIdTimeColumnId ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TimeColumnId  of  << this -> TimeColumnId ) ; return this -> TimeColumnId ; } ;
## Error: expected ';'!!!

proc SetTimeColumnId*(this: var vtkTemporalDelimitedTextReader; idx: cint) {.
    importcpp: "SetTimeColumnId", header: "vtkTemporalDelimitedTextReader.h".}
## !!!Ignored construct:  /@} /@{ *
##  Set the RemoveTimeStepColumn flag
##  If this boolean is true, the output will not contain the Time step column.
##  Default to true.
##  virtual bool GetTimeColumnNameTimeColumnNameTimeColumnIdTimeColumnIdRemoveTimeStepColumnRemoveTimeStepColumn ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RemoveTimeStepColumn  of  << this -> RemoveTimeStepColumn ) ; return this -> RemoveTimeStepColumn ; } ;
## Error: expected ';'!!!

proc SetRemoveTimeStepColumn*(this: var vtkTemporalDelimitedTextReader; rts: bool) {.
    importcpp: "SetRemoveTimeStepColumn",
    header: "vtkTemporalDelimitedTextReader.h".}
proc GetMTime*(this: var vtkTemporalDelimitedTextReader): vtkMTimeType {.
    importcpp: "GetMTime", header: "vtkTemporalDelimitedTextReader.h".}