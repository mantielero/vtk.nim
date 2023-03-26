## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFunctionParser.h
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
##  @class   vtkFunctionParser
##  @brief   Parse and evaluate a mathematical expression
##
##  vtkFunctionParser is a class that takes in a mathematical expression as
##  a char string, parses it, and evaluates it at the specified values of
##  the variables in the input string.
##
##  You can use the "if" operator to create conditional expressions
##  such as if ( test, trueresult, falseresult). These evaluate the boolean
##  valued test expression and then evaluate either the trueresult or the
##  falseresult expression to produce a final (scalar or vector valued) value.
##  "test" may contain <,>,=,|,&, and () and all three subexpressions can
##  evaluate arbitrary function operators (ln, cos, +, if, etc)
##
##  @par Thanks:
##  Juha Nieminen (juha.nieminen@gmail.com) for relicensing this branch of the
##  function parser code that this class is based upon under the new BSD license
##  so that it could be used in VTK. Note, the BSD license applies to this
##  version of the function parser only (by permission of the author), and not
##  the original library.
##
##  @par Thanks:
##  Thomas Dunne (thomas.dunne@iwr.uni-heidelberg.de) for adding code for
##  two-parameter-parsing and a few functions (sign, min, max).
##
##  @par Thanks:
##  Sid Sydoriak (sxs@lanl.gov) for adding boolean operations and
##  conditional expressions and for fixing a variety of bugs.
##

import
  vtkCommonMiscModule, vtkObject, vtkTuple

const
  VTK_PARSER_IMMEDIATE* = 1
  VTK_PARSER_UNARY_MINUS* = 2
  VTK_PARSER_UNARY_PLUS* = 3

##  supported math functions

const
  VTK_PARSER_ADD* = 4
  VTK_PARSER_SUBTRACT* = 5
  VTK_PARSER_MULTIPLY* = 6
  VTK_PARSER_DIVIDE* = 7
  VTK_PARSER_POWER* = 8
  VTK_PARSER_ABSOLUTE_VALUE* = 9
  VTK_PARSER_EXPONENT* = 10
  VTK_PARSER_CEILING* = 11
  VTK_PARSER_FLOOR* = 12
  VTK_PARSER_LOGARITHM* = 13
  VTK_PARSER_LOGARITHME* = 14
  VTK_PARSER_LOGARITHM10* = 15
  VTK_PARSER_SQUARE_ROOT* = 16
  VTK_PARSER_SINE* = 17
  VTK_PARSER_COSINE* = 18
  VTK_PARSER_TANGENT* = 19
  VTK_PARSER_ARCSINE* = 20
  VTK_PARSER_ARCCOSINE* = 21
  VTK_PARSER_ARCTANGENT* = 22
  VTK_PARSER_HYPERBOLIC_SINE* = 23
  VTK_PARSER_HYPERBOLIC_COSINE* = 24
  VTK_PARSER_HYPERBOLIC_TANGENT* = 25
  VTK_PARSER_MIN* = 26
  VTK_PARSER_MAX* = 27
  VTK_PARSER_SIGN* = 29

##  functions involving vectors

const
  VTK_PARSER_CROSS* = 28
  VTK_PARSER_VECTOR_UNARY_MINUS* = 30
  VTK_PARSER_VECTOR_UNARY_PLUS* = 31
  VTK_PARSER_DOT_PRODUCT* = 32
  VTK_PARSER_VECTOR_ADD* = 33
  VTK_PARSER_VECTOR_SUBTRACT* = 34
  VTK_PARSER_SCALAR_TIMES_VECTOR* = 35
  VTK_PARSER_VECTOR_TIMES_SCALAR* = 36
  VTK_PARSER_VECTOR_OVER_SCALAR* = 37
  VTK_PARSER_MAGNITUDE* = 38
  VTK_PARSER_NORMALIZE* = 39

##  constants involving vectors

const
  VTK_PARSER_IHAT* = 40
  VTK_PARSER_JHAT* = 41
  VTK_PARSER_KHAT* = 42

##  code for if(bool, trueval, falseval) resulting in a scalar

const
  VTK_PARSER_IF* = 43

##  code for if(bool, truevec, falsevec) resulting in a vector

const
  VTK_PARSER_VECTOR_IF* = 44

##  codes for boolean expressions

const
  VTK_PARSER_LESS_THAN* = 45

##  codes for boolean expressions

const
  VTK_PARSER_GREATER_THAN* = 46

##  codes for boolean expressions

const
  VTK_PARSER_EQUAL_TO* = 47

##  codes for boolean expressions

const
  VTK_PARSER_AND* = 48

##  codes for boolean expressions

const
  VTK_PARSER_OR* = 49

##  codes for scalar variables come before those for vectors. Do not define
##  values for VTK_PARSER_BEGIN_VARIABLES+1, VTK_PARSER_BEGIN_VARIABLES+2, ...,
##  because they are used to look up variables numbered 1, 2, ...

const
  VTK_PARSER_BEGIN_VARIABLES* = 50

##  the value that is returned as a result if there is an error

const
  VTK_PARSER_ERROR_RESULT* = VTK_FLOAT_MAX

type
  vtkFunctionParser* {.importcpp: "vtkFunctionParser",
                      header: "vtkFunctionParser.h", bycopy.} = object of vtkObject
    vtkFunctionParser* {.importc: "vtkFunctionParser".}: VTK_NEWINSTANCE


proc New*(): ptr vtkFunctionParser {.importcpp: "vtkFunctionParser::New(@)",
                                 header: "vtkFunctionParser.h".}
type
  vtkFunctionParserSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkFunctionParser::IsTypeOf(@)", header: "vtkFunctionParser.h".}
proc IsA*(this: var vtkFunctionParser; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkFunctionParser.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkFunctionParser {.
    importcpp: "vtkFunctionParser::SafeDownCast(@)", header: "vtkFunctionParser.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkFunctionParser :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFunctionParser :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFunctionParser :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkFunctionParser; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkFunctionParser.h".}
proc GetMTime*(this: var vtkFunctionParser): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkFunctionParser.h".}
proc SetFunction*(this: var vtkFunctionParser; function: cstring) {.
    importcpp: "SetFunction", header: "vtkFunctionParser.h".}
proc GetFunction*(this: var vtkFunctionParser): cstring {.importcpp: "GetFunction",
    header: "vtkFunctionParser.h".}
  ## /@}
  ## *
  ##  Check whether the result is a scalar result.  If it isn't, then
  ##  either the result is a vector or an error has occurred.
  ##
proc IsScalarResult*(this: var vtkFunctionParser): cint {.
    importcpp: "IsScalarResult", header: "vtkFunctionParser.h".}
proc IsVectorResult*(this: var vtkFunctionParser): cint {.
    importcpp: "IsVectorResult", header: "vtkFunctionParser.h".}
proc GetScalarResult*(this: var vtkFunctionParser): cdouble {.
    importcpp: "GetScalarResult", header: "vtkFunctionParser.h".}
## !!!Ignored construct:  /@{ *
##  Get a vector result from evaluating the input function.
##  double * GetVectorResult ( ) VTK_SIZEHINT ( 3 ) ;
## Error: expected ';'!!!

proc GetVectorResult*(this: var vtkFunctionParser; result: array[3, cdouble]) {.
    importcpp: "GetVectorResult", header: "vtkFunctionParser.h".}
proc SetScalarVariableValue*(this: var vtkFunctionParser; variableName: cstring;
                            value: cdouble) {.importcpp: "SetScalarVariableValue",
    header: "vtkFunctionParser.h".}
proc SetScalarVariableValue*(this: var vtkFunctionParser; variableName: string;
                            value: cdouble) {.importcpp: "SetScalarVariableValue",
    header: "vtkFunctionParser.h".}
proc SetScalarVariableValue*(this: var vtkFunctionParser; i: cint; value: cdouble) {.
    importcpp: "SetScalarVariableValue", header: "vtkFunctionParser.h".}
proc GetScalarVariableValue*(this: var vtkFunctionParser; variableName: cstring): cdouble {.
    importcpp: "GetScalarVariableValue", header: "vtkFunctionParser.h".}
proc GetScalarVariableValue*(this: var vtkFunctionParser; variableName: string): cdouble {.
    importcpp: "GetScalarVariableValue", header: "vtkFunctionParser.h".}
proc GetScalarVariableValue*(this: var vtkFunctionParser; i: cint): cdouble {.
    importcpp: "GetScalarVariableValue", header: "vtkFunctionParser.h".}
proc SetVectorVariableValue*(this: var vtkFunctionParser; variableName: cstring;
                            xValue: cdouble; yValue: cdouble; zValue: cdouble) {.
    importcpp: "SetVectorVariableValue", header: "vtkFunctionParser.h".}
proc SetVectorVariableValue*(this: var vtkFunctionParser; variableName: string;
                            xValue: cdouble; yValue: cdouble; zValue: cdouble) {.
    importcpp: "SetVectorVariableValue", header: "vtkFunctionParser.h".}
proc SetVectorVariableValue*(this: var vtkFunctionParser; variableName: cstring;
                            values: array[3, cdouble]) {.
    importcpp: "SetVectorVariableValue", header: "vtkFunctionParser.h".}
proc SetVectorVariableValue*(this: var vtkFunctionParser; variableName: string;
                            values: array[3, cdouble]) {.
    importcpp: "SetVectorVariableValue", header: "vtkFunctionParser.h".}
proc SetVectorVariableValue*(this: var vtkFunctionParser; i: cint; xValue: cdouble;
                            yValue: cdouble; zValue: cdouble) {.
    importcpp: "SetVectorVariableValue", header: "vtkFunctionParser.h".}
proc SetVectorVariableValue*(this: var vtkFunctionParser; i: cint;
                            values: array[3, cdouble]) {.
    importcpp: "SetVectorVariableValue", header: "vtkFunctionParser.h".}
## !!!Ignored construct:  /@} /@{ *
##  Get the value of a vector variable.
##  double * GetVectorVariableValue ( const char * variableName ) VTK_SIZEHINT ( 3 ) ;
## Error: expected ';'!!!

## !!!Ignored construct:  double * GetVectorVariableValue ( const std :: string & variableName ) VTK_SIZEHINT ( 3 ) { return this -> GetVectorVariableValue ( variableName . c_str ( ) ) ; } void GetVectorVariableValue ( const char * variableName , double value [ 3 ] ) { double * r = this -> GetVectorVariableValue ( variableName ) ; value [ 0 ] = r [ 0 ] ; value [ 1 ] = r [ 1 ] ; value [ 2 ] = r [ 2 ] ; } void GetVectorVariableValue ( const std :: string & variableName , double value [ 3 ] ) { this -> GetVectorVariableValue ( variableName . c_str ( ) , value ) ; } double * GetVectorVariableValue ( int i ) VTK_SIZEHINT ( 3 ) ;
## Error: expected ';'!!!

proc GetVectorVariableValue*(this: var vtkFunctionParser; i: cint;
                            value: array[3, cdouble]) {.
    importcpp: "GetVectorVariableValue", header: "vtkFunctionParser.h".}
proc GetNumberOfScalarVariables*(this: var vtkFunctionParser): cint {.
    importcpp: "GetNumberOfScalarVariables", header: "vtkFunctionParser.h".}
proc GetScalarVariableIndex*(this: var vtkFunctionParser; name: cstring): cint {.
    importcpp: "GetScalarVariableIndex", header: "vtkFunctionParser.h".}
proc GetScalarVariableIndex*(this: var vtkFunctionParser; name: string): cint {.
    importcpp: "GetScalarVariableIndex", header: "vtkFunctionParser.h".}
proc GetNumberOfVectorVariables*(this: var vtkFunctionParser): cint {.
    importcpp: "GetNumberOfVectorVariables", header: "vtkFunctionParser.h".}
proc GetVectorVariableIndex*(this: var vtkFunctionParser; name: cstring): cint {.
    importcpp: "GetVectorVariableIndex", header: "vtkFunctionParser.h".}
proc GetVectorVariableIndex*(this: var vtkFunctionParser; name: string): cint {.
    importcpp: "GetVectorVariableIndex", header: "vtkFunctionParser.h".}
proc GetScalarVariableName*(this: var vtkFunctionParser; i: cint): cstring {.
    importcpp: "GetScalarVariableName", header: "vtkFunctionParser.h".}
proc GetVectorVariableName*(this: var vtkFunctionParser; i: cint): cstring {.
    importcpp: "GetVectorVariableName", header: "vtkFunctionParser.h".}
proc GetScalarVariableNeeded*(this: var vtkFunctionParser; i: cint): bool {.
    importcpp: "GetScalarVariableNeeded", header: "vtkFunctionParser.h".}
proc GetScalarVariableNeeded*(this: var vtkFunctionParser; variableName: cstring): bool {.
    importcpp: "GetScalarVariableNeeded", header: "vtkFunctionParser.h".}
proc GetScalarVariableNeeded*(this: var vtkFunctionParser; variableName: string): bool {.
    importcpp: "GetScalarVariableNeeded", header: "vtkFunctionParser.h".}
proc GetVectorVariableNeeded*(this: var vtkFunctionParser; i: cint): bool {.
    importcpp: "GetVectorVariableNeeded", header: "vtkFunctionParser.h".}
proc GetVectorVariableNeeded*(this: var vtkFunctionParser; variableName: cstring): bool {.
    importcpp: "GetVectorVariableNeeded", header: "vtkFunctionParser.h".}
proc GetVectorVariableNeeded*(this: var vtkFunctionParser; variableName: string): bool {.
    importcpp: "GetVectorVariableNeeded", header: "vtkFunctionParser.h".}
proc RemoveAllVariables*(this: var vtkFunctionParser) {.
    importcpp: "RemoveAllVariables", header: "vtkFunctionParser.h".}
proc RemoveScalarVariables*(this: var vtkFunctionParser) {.
    importcpp: "RemoveScalarVariables", header: "vtkFunctionParser.h".}
proc RemoveVectorVariables*(this: var vtkFunctionParser) {.
    importcpp: "RemoveVectorVariables", header: "vtkFunctionParser.h".}
proc SetReplaceInvalidValues*(this: var vtkFunctionParser; _arg: vtkTypeBool) {.
    importcpp: "SetReplaceInvalidValues", header: "vtkFunctionParser.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetReplaceInvalidValues ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReplaceInvalidValues  of  << this -> ReplaceInvalidValues ) ; return this -> ReplaceInvalidValues ; } ;
## Error: expected ';'!!!

proc ReplaceInvalidValuesOn*(this: var vtkFunctionParser) {.
    importcpp: "ReplaceInvalidValuesOn", header: "vtkFunctionParser.h".}
proc ReplaceInvalidValuesOff*(this: var vtkFunctionParser) {.
    importcpp: "ReplaceInvalidValuesOff", header: "vtkFunctionParser.h".}
proc SetReplaceInvalidValuesReplacementValue*(this: var vtkFunctionParser;
    _arg: cdouble) {.importcpp: "SetReplaceInvalidValuesReplacementValue",
                   header: "vtkFunctionParser.h".}
## !!!Ignored construct:  virtual double GetReplaceInvalidValuesReplacementValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReplacementValue  of  << this -> ReplacementValue ) ; return this -> ReplacementValue ; } ;
## Error: expected ';'!!!

proc CheckExpression*(this: var vtkFunctionParser; pos: var cint; error: cstringArray) {.
    importcpp: "CheckExpression", header: "vtkFunctionParser.h".}
proc InvalidateFunction*(this: var vtkFunctionParser) {.
    importcpp: "InvalidateFunction", header: "vtkFunctionParser.h".}