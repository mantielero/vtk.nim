## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTimePointUtility.h
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
##  @class   vtkTimePointUtility
##  @brief   performs common time operations
##
##
##  vtkTimePointUtility is provides methods to perform common time operations.
##

import
  vtkCommonCoreModule, vtkObject

type
  vtkTimePointUtility* {.importcpp: "vtkTimePointUtility",
                        header: "vtkTimePointUtility.h", bycopy.} = object of vtkObject
    vtkTimePointUtility* {.importc: "vtkTimePointUtility".}: VTK_NEWINSTANCE


proc New*(): ptr vtkTimePointUtility {.importcpp: "vtkTimePointUtility::New(@)",
                                   header: "vtkTimePointUtility.h".}
type
  vtkTimePointUtilitySuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTimePointUtility::IsTypeOf(@)", header: "vtkTimePointUtility.h".}
proc IsA*(this: var vtkTimePointUtility; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTimePointUtility.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTimePointUtility {.
    importcpp: "vtkTimePointUtility::SafeDownCast(@)",
    header: "vtkTimePointUtility.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTimePointUtility :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTimePointUtility :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTimePointUtility :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTimePointUtility; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTimePointUtility.h".}
proc DateToTimePoint*(year: cint; month: cint; day: cint): vtkTypeUInt64 {.
    importcpp: "vtkTimePointUtility::DateToTimePoint(@)",
    header: "vtkTimePointUtility.h".}
proc TimeToTimePoint*(hour: cint; minute: cint; second: cint; millis: cint = 0): vtkTypeUInt64 {.
    importcpp: "vtkTimePointUtility::TimeToTimePoint(@)",
    header: "vtkTimePointUtility.h".}
proc DateTimeToTimePoint*(year: cint; month: cint; day: cint; hour: cint; minute: cint;
                         sec: cint; millis: cint = 0): vtkTypeUInt64 {.
    importcpp: "vtkTimePointUtility::DateTimeToTimePoint(@)",
    header: "vtkTimePointUtility.h".}
proc GetDate*(time: vtkTypeUInt64; year: var cint; month: var cint; day: var cint) {.
    importcpp: "vtkTimePointUtility::GetDate(@)", header: "vtkTimePointUtility.h".}
proc GetTime*(time: vtkTypeUInt64; hour: var cint; minute: var cint; second: var cint;
             millis: var cint) {.importcpp: "vtkTimePointUtility::GetTime(@)",
                              header: "vtkTimePointUtility.h".}
proc GetDateTime*(time: vtkTypeUInt64; year: var cint; month: var cint; day: var cint;
                 hour: var cint; minute: var cint; second: var cint; millis: var cint) {.
    importcpp: "vtkTimePointUtility::GetDateTime(@)",
    header: "vtkTimePointUtility.h".}
proc GetYear*(time: vtkTypeUInt64): cint {.importcpp: "vtkTimePointUtility::GetYear(@)",
                                       header: "vtkTimePointUtility.h".}
proc GetMonth*(time: vtkTypeUInt64): cint {.importcpp: "vtkTimePointUtility::GetMonth(@)",
                                        header: "vtkTimePointUtility.h".}
proc GetDay*(time: vtkTypeUInt64): cint {.importcpp: "vtkTimePointUtility::GetDay(@)",
                                      header: "vtkTimePointUtility.h".}
proc GetHour*(time: vtkTypeUInt64): cint {.importcpp: "vtkTimePointUtility::GetHour(@)",
                                       header: "vtkTimePointUtility.h".}
proc GetMinute*(time: vtkTypeUInt64): cint {.
    importcpp: "vtkTimePointUtility::GetMinute(@)",
    header: "vtkTimePointUtility.h".}
proc GetSecond*(time: vtkTypeUInt64): cint {.
    importcpp: "vtkTimePointUtility::GetSecond(@)",
    header: "vtkTimePointUtility.h".}
proc GetMillisecond*(time: vtkTypeUInt64): cint {.
    importcpp: "vtkTimePointUtility::GetMillisecond(@)",
    header: "vtkTimePointUtility.h".}
const
  vtkTimePointUtilityISO8601_DATETIME_MILLIS* = 0
  vtkTimePointUtilityISO8601_DATETIME* = 1
  vtkTimePointUtilityISO8601_DATE* = 2
  vtkTimePointUtilityISO8601_TIME_MILLIS* = 3
  vtkTimePointUtilityISO8601_TIME* = 4

proc ISO8601ToTimePoint*(str: cstring; ok: ptr bool = nil): vtkTypeUInt64 {.
    importcpp: "vtkTimePointUtility::ISO8601ToTimePoint(@)",
    header: "vtkTimePointUtility.h".}
proc TimePointToISO8601*(a1: vtkTypeUInt64; format: cint = vtkTimePointUtilityISO8601_DATETIME_MILLIS): cstring {.
    importcpp: "vtkTimePointUtility::TimePointToISO8601(@)",
    header: "vtkTimePointUtility.h".}