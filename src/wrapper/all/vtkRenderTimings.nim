## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    VTKRenderTimings.h
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
##  Define the classes we use for running timing benchmarks
##

import
  vtkTimerLog, vtkUtilitiesBenchmarksModule

discard "forward decl of vtkRTTestResult"
discard "forward decl of vtkRTTestSequence"
discard "forward decl of vtkRenderTimings"
type
  vtkRTTest* {.importcpp: "vtkRTTest", header: "vtkRenderTimings.h", bycopy.} = object ##  what is the name of this test


proc GetName*(this: var vtkRTTest): string {.importcpp: "GetName",
                                        header: "vtkRenderTimings.h".}
proc GetSecondSummaryResultName*(this: var vtkRTTest): cstring {.
    importcpp: "GetSecondSummaryResultName", header: "vtkRenderTimings.h".}
proc GetSummaryResultName*(this: var vtkRTTest): cstring {.
    importcpp: "GetSummaryResultName", header: "vtkRenderTimings.h".}
proc UseLargestSummaryResult*(this: var vtkRTTest): bool {.
    importcpp: "UseLargestSummaryResult", header: "vtkRenderTimings.h".}
proc SetTargetTime*(this: var vtkRTTest; tt: cfloat) {.importcpp: "SetTargetTime",
    header: "vtkRenderTimings.h".}
proc GetTargetTime*(this: var vtkRTTest): cfloat {.importcpp: "GetTargetTime",
    header: "vtkRenderTimings.h".}
proc SetRenderSize*(this: var vtkRTTest; width: cint; height: cint) {.
    importcpp: "SetRenderSize", header: "vtkRenderTimings.h".}
proc GetRenderWidth*(this: var vtkRTTest): cint {.importcpp: "GetRenderWidth",
    header: "vtkRenderTimings.h".}
proc GetRenderHeight*(this: var vtkRTTest): cint {.importcpp: "GetRenderHeight",
    header: "vtkRenderTimings.h".}
proc Run*(this: var vtkRTTest; ats: ptr vtkRTTestSequence; argc: cint; argv: ptr cstring): vtkRTTestResult {.
    importcpp: "Run", header: "vtkRenderTimings.h".}
proc constructvtkRTTest*(name: cstring): vtkRTTest {.constructor,
    importcpp: "vtkRTTest(@)", header: "vtkRenderTimings.h".}
proc destroyvtkRTTest*(this: var vtkRTTest) {.importcpp: "#.~vtkRTTest()",
    header: "vtkRenderTimings.h".}
type
  vtkRTTestResult* {.importcpp: "vtkRTTestResult", header: "vtkRenderTimings.h",
                    bycopy.} = object
    Results* {.importc: "Results".}: map[string, cdouble]
    SequenceNumber* {.importc: "SequenceNumber".}: cint


proc ReportResults*(this: var vtkRTTestResult; test: ptr vtkRTTest; ost: var ostream) {.
    importcpp: "ReportResults", header: "vtkRenderTimings.h".}
type
  vtkRTTestSequence* {.importcpp: "vtkRTTestSequence",
                      header: "vtkRenderTimings.h", bycopy.} = object
    Test* {.importc: "Test".}: ptr vtkRTTest
    TargetTime* {.importc: "TargetTime".}: cfloat


proc Run*(this: var vtkRTTestSequence) {.importcpp: "Run",
                                     header: "vtkRenderTimings.h".}
proc ReportSummaryResults*(this: var vtkRTTestSequence; ost: var ostream) {.
    importcpp: "ReportSummaryResults", header: "vtkRenderTimings.h".}
proc ReportDetailedResults*(this: var vtkRTTestSequence; ost: var ostream) {.
    importcpp: "ReportDetailedResults", header: "vtkRenderTimings.h".}
proc GetSequenceNumbers*(this: var vtkRTTestSequence; xdim: var cint) {.
    importcpp: "GetSequenceNumbers", header: "vtkRenderTimings.h".}
proc GetSequenceNumbers*(this: var vtkRTTestSequence; xdim: var cint; ydim: var cint) {.
    importcpp: "GetSequenceNumbers", header: "vtkRenderTimings.h".}
proc GetSequenceNumbers*(this: var vtkRTTestSequence; xdim: var cint; ydim: var cint;
                        zdim: var cint) {.importcpp: "GetSequenceNumbers",
                                       header: "vtkRenderTimings.h".}
proc GetSequenceNumbers*(this: var vtkRTTestSequence; xdim: var cint; ydim: var cint;
                        zdim: var cint; wdim: var cint) {.
    importcpp: "GetSequenceNumbers", header: "vtkRenderTimings.h".}
proc SetChartResults*(this: var vtkRTTestSequence; v: bool) {.
    importcpp: "SetChartResults", header: "vtkRenderTimings.h".}
proc constructvtkRTTestSequence*(rt: ptr vtkRenderTimings): vtkRTTestSequence {.
    constructor, importcpp: "vtkRTTestSequence(@)", header: "vtkRenderTimings.h".}
proc destroyvtkRTTestSequence*(this: var vtkRTTestSequence) {.
    importcpp: "#.~vtkRTTestSequence()", header: "vtkRenderTimings.h".}
##  a class to run a bunch of timing tests and
##  report the results

type
  vtkRenderTimings* {.importcpp: "vtkRenderTimings", header: "vtkRenderTimings.h",
                     bycopy.} = object
    TestsToRun* {.importc: "TestsToRun".}: vector[ptr vtkRTTest]
    TestSequences* {.importc: "TestSequences".}: vector[ptr vtkRTTestSequence]
    ##  regular expression for tests


proc constructvtkRenderTimings*(): vtkRenderTimings {.constructor,
    importcpp: "vtkRenderTimings(@)", header: "vtkRenderTimings.h".}
proc GetSequenceStart*(this: var vtkRenderTimings): cint {.
    importcpp: "GetSequenceStart", header: "vtkRenderTimings.h".}
proc GetSequenceEnd*(this: var vtkRenderTimings): cint {.importcpp: "GetSequenceEnd",
    header: "vtkRenderTimings.h".}
proc GetSequenceStepTimeLimit*(this: var vtkRenderTimings): cdouble {.
    importcpp: "GetSequenceStepTimeLimit", header: "vtkRenderTimings.h".}
proc GetRenderWidth*(this: var vtkRenderTimings): cint {.importcpp: "GetRenderWidth",
    header: "vtkRenderTimings.h".}
proc GetRenderHeight*(this: var vtkRenderTimings): cint {.
    importcpp: "GetRenderHeight", header: "vtkRenderTimings.h".}
proc ParseCommandLineArguments*(this: var vtkRenderTimings; argc: cint;
                               argv: ptr cstring): cint {.
    importcpp: "ParseCommandLineArguments", header: "vtkRenderTimings.h".}
proc GetArguments*(this: var vtkRenderTimings): var CommandLineArguments {.
    importcpp: "GetArguments", header: "vtkRenderTimings.h".}
proc GetSystemName*(this: var vtkRenderTimings): string {.importcpp: "GetSystemName",
    header: "vtkRenderTimings.h".}
##  VTK-HeaderTest-Exclude: vtkRenderTimings.h
