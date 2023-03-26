## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExprTkFunctionParser.h
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
##  @class   vtkExprTkFunctionParser
##  @brief   Parse and evaluate a mathematical expression
##
##  vtkExprTkFunctionParser is a wrapper class of the ExprTK library that takes
##  in a mathematical expression as a char string, parses it, and evaluates it
##  at the specified values of the variables in the input string.
##
##  The detailed documentation of the supported functionality is described in
##  https://github.com/ArashPartow/exprtk. In addition to the documented
##  functionality, the following vector operations have been implemented:
##  1) cross(v1, v2), cross product of two vectors,
##  2) mag(v), magnitude of a vector,
##  3) norm(v), the normalized version of a vector.
##
##  @par Thanks:
##  Arash Partow for implementing the ExprTk library.
##

import
  vtkCommonMiscModule, vtkObject, vtkTuple

##  forward declarations for ExprTk tools

discard "forward decl of vtkExprTkTools"
type
  vtkExprTkFunctionParser* {.importcpp: "vtkExprTkFunctionParser",
                            header: "vtkExprTkFunctionParser.h", bycopy.} = object of vtkObject
    vtkExprTkFunctionParser* {.importc: "vtkExprTkFunctionParser".}: VTK_NEWINSTANCE
    ##  original and used variables names are the same, except if the original
    ##  ones are not valid.
    ##  pointers for scalar and vector variables are used to enforce
    ##  that their memory address will not change due to a possible
    ##  resizing of their container (std::vector), ExprTk requires the
    ##  memory address of the given variable to remain the same.


proc New*(): ptr vtkExprTkFunctionParser {.importcpp: "vtkExprTkFunctionParser::New(@)",
                                       header: "vtkExprTkFunctionParser.h".}
type
  vtkExprTkFunctionParserSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkExprTkFunctionParser::IsTypeOf(@)",
    header: "vtkExprTkFunctionParser.h".}
proc IsA*(this: var vtkExprTkFunctionParser; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkExprTkFunctionParser.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkExprTkFunctionParser {.
    importcpp: "vtkExprTkFunctionParser::SafeDownCast(@)",
    header: "vtkExprTkFunctionParser.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkExprTkFunctionParser :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExprTkFunctionParser :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExprTkFunctionParser :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkExprTkFunctionParser; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkExprTkFunctionParser.h".}
proc GetMTime*(this: var vtkExprTkFunctionParser): vtkMTimeType {.
    importcpp: "GetMTime", header: "vtkExprTkFunctionParser.h".}
proc SetFunction*(this: var vtkExprTkFunctionParser; function: cstring) {.
    importcpp: "SetFunction", header: "vtkExprTkFunctionParser.h".}
proc GetFunction*(this: var vtkExprTkFunctionParser): cstring {.
    importcpp: "GetFunction", header: "vtkExprTkFunctionParser.h".}
proc IsScalarResult*(this: var vtkExprTkFunctionParser): cint {.
    importcpp: "IsScalarResult", header: "vtkExprTkFunctionParser.h".}
proc IsVectorResult*(this: var vtkExprTkFunctionParser): cint {.
    importcpp: "IsVectorResult", header: "vtkExprTkFunctionParser.h".}
proc GetScalarResult*(this: var vtkExprTkFunctionParser): cdouble {.
    importcpp: "GetScalarResult", header: "vtkExprTkFunctionParser.h".}
## !!!Ignored construct:  /@{ *
##  Get a vector result from evaluating the input function.
##
##  If ReplaceInvalidValues is not set, then the error value
##  that will be return is [NaN, NaN, NaN].
##  double * GetVectorResult ( ) VTK_SIZEHINT ( 3 ) ;
## Error: expected ';'!!!

proc GetVectorResult*(this: var vtkExprTkFunctionParser; result: array[3, cdouble]) {.
    importcpp: "GetVectorResult", header: "vtkExprTkFunctionParser.h".}
proc SetScalarVariableValue*(this: var vtkExprTkFunctionParser;
                            variableName: string; value: cdouble) {.
    importcpp: "SetScalarVariableValue", header: "vtkExprTkFunctionParser.h".}
proc SetScalarVariableValue*(this: var vtkExprTkFunctionParser; i: cint;
                            value: cdouble) {.importcpp: "SetScalarVariableValue",
    header: "vtkExprTkFunctionParser.h".}
proc GetScalarVariableValue*(this: var vtkExprTkFunctionParser; variableName: string): cdouble {.
    importcpp: "GetScalarVariableValue", header: "vtkExprTkFunctionParser.h".}
proc GetScalarVariableValue*(this: var vtkExprTkFunctionParser; i: cint): cdouble {.
    importcpp: "GetScalarVariableValue", header: "vtkExprTkFunctionParser.h".}
proc SetVectorVariableValue*(this: var vtkExprTkFunctionParser;
                            variableName: string; xValue: cdouble; yValue: cdouble;
                            zValue: cdouble) {.
    importcpp: "SetVectorVariableValue", header: "vtkExprTkFunctionParser.h".}
proc SetVectorVariableValue*(this: var vtkExprTkFunctionParser;
                            variableName: string; values: array[3, cdouble]) {.
    importcpp: "SetVectorVariableValue", header: "vtkExprTkFunctionParser.h".}
proc SetVectorVariableValue*(this: var vtkExprTkFunctionParser; i: cint;
                            xValue: cdouble; yValue: cdouble; zValue: cdouble) {.
    importcpp: "SetVectorVariableValue", header: "vtkExprTkFunctionParser.h".}
proc SetVectorVariableValue*(this: var vtkExprTkFunctionParser; i: cint;
                            values: array[3, cdouble]) {.
    importcpp: "SetVectorVariableValue", header: "vtkExprTkFunctionParser.h".}
## !!!Ignored construct:  /@} /@{ *
##  Get the value of a vector variable.
##  double * GetVectorVariableValue ( const std :: string & variableName ) VTK_SIZEHINT ( 3 ) ;
## Error: expected ';'!!!

proc GetVectorVariableValue*(this: var vtkExprTkFunctionParser;
                            variableName: string; value: array[3, cdouble]) {.
    importcpp: "GetVectorVariableValue", header: "vtkExprTkFunctionParser.h".}
## !!!Ignored construct:  double * GetVectorVariableValue ( int i ) VTK_SIZEHINT ( 3 ) ;
## Error: expected ';'!!!

proc GetVectorVariableValue*(this: var vtkExprTkFunctionParser; i: cint;
                            value: array[3, cdouble]) {.
    importcpp: "GetVectorVariableValue", header: "vtkExprTkFunctionParser.h".}
proc GetNumberOfScalarVariables*(this: var vtkExprTkFunctionParser): cint {.
    importcpp: "GetNumberOfScalarVariables", header: "vtkExprTkFunctionParser.h".}
proc GetScalarVariableIndex*(this: var vtkExprTkFunctionParser; name: string): cint {.
    importcpp: "GetScalarVariableIndex", header: "vtkExprTkFunctionParser.h".}
proc GetNumberOfVectorVariables*(this: var vtkExprTkFunctionParser): cint {.
    importcpp: "GetNumberOfVectorVariables", header: "vtkExprTkFunctionParser.h".}
proc GetVectorVariableIndex*(this: var vtkExprTkFunctionParser; name: string): cint {.
    importcpp: "GetVectorVariableIndex", header: "vtkExprTkFunctionParser.h".}
proc GetScalarVariableName*(this: var vtkExprTkFunctionParser; i: cint): string {.
    importcpp: "GetScalarVariableName", header: "vtkExprTkFunctionParser.h".}
proc GetVectorVariableName*(this: var vtkExprTkFunctionParser; i: cint): string {.
    importcpp: "GetVectorVariableName", header: "vtkExprTkFunctionParser.h".}
proc GetScalarVariableNeeded*(this: var vtkExprTkFunctionParser; i: cint): bool {.
    importcpp: "GetScalarVariableNeeded", header: "vtkExprTkFunctionParser.h".}
proc GetScalarVariableNeeded*(this: var vtkExprTkFunctionParser;
                             variableName: string): bool {.
    importcpp: "GetScalarVariableNeeded", header: "vtkExprTkFunctionParser.h".}
proc GetVectorVariableNeeded*(this: var vtkExprTkFunctionParser; i: cint): bool {.
    importcpp: "GetVectorVariableNeeded", header: "vtkExprTkFunctionParser.h".}
proc GetVectorVariableNeeded*(this: var vtkExprTkFunctionParser;
                             variableName: string): bool {.
    importcpp: "GetVectorVariableNeeded", header: "vtkExprTkFunctionParser.h".}
proc RemoveAllVariables*(this: var vtkExprTkFunctionParser) {.
    importcpp: "RemoveAllVariables", header: "vtkExprTkFunctionParser.h".}
proc RemoveScalarVariables*(this: var vtkExprTkFunctionParser) {.
    importcpp: "RemoveScalarVariables", header: "vtkExprTkFunctionParser.h".}
proc RemoveVectorVariables*(this: var vtkExprTkFunctionParser) {.
    importcpp: "RemoveVectorVariables", header: "vtkExprTkFunctionParser.h".}
proc SetReplaceInvalidValues*(this: var vtkExprTkFunctionParser; _arg: vtkTypeBool) {.
    importcpp: "SetReplaceInvalidValues", header: "vtkExprTkFunctionParser.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetReplaceInvalidValues ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReplaceInvalidValues  of  << this -> ReplaceInvalidValues ) ; return this -> ReplaceInvalidValues ; } ;
## Error: expected ';'!!!

proc ReplaceInvalidValuesOn*(this: var vtkExprTkFunctionParser) {.
    importcpp: "ReplaceInvalidValuesOn", header: "vtkExprTkFunctionParser.h".}
proc ReplaceInvalidValuesOff*(this: var vtkExprTkFunctionParser) {.
    importcpp: "ReplaceInvalidValuesOff", header: "vtkExprTkFunctionParser.h".}
proc SetReplaceInvalidValuesReplacementValue*(this: var vtkExprTkFunctionParser;
    _arg: cdouble) {.importcpp: "SetReplaceInvalidValuesReplacementValue",
                   header: "vtkExprTkFunctionParser.h".}
## !!!Ignored construct:  virtual double GetReplaceInvalidValuesReplacementValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReplacementValue  of  << this -> ReplacementValue ) ; return this -> ReplacementValue ; } ;
## Error: expected ';'!!!

proc InvalidateFunction*(this: var vtkExprTkFunctionParser) {.
    importcpp: "InvalidateFunction", header: "vtkExprTkFunctionParser.h".}
proc SanitizeName*(name: cstring): string {.importcpp: "vtkExprTkFunctionParser::SanitizeName(@)",
                                        header: "vtkExprTkFunctionParser.h".}