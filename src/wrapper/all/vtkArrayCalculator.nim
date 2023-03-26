## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkArrayCalculator.h
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
##  @class   vtkArrayCalculator
##  @brief   perform mathematical operations on data in field data arrays
##
##  vtkArrayCalculator performs operations on vectors or scalars in field
##  data arrays.  It uses vtkFunctionParser/vtkExprTkFunctionParser to do
##  the parsing and to evaluate the function for each entry in the input
##  arrays.  The arrays used in a given function must be all in point data
##  or all in cell data. The resulting array will be stored as a field
##  data array.  The result array can either be stored in a new array or
##  it can overwrite an existing array. vtkArrayCalculator can run in
##  parallel using vtkSMPTools.
##
##  The functions that this array calculator understands is:
##
##  standard operations:
##  +
##  -
##  *
##  /
##  ^
##  . (only by vtkFunctionParser)
##  build unit vectors: iHat, jHat, kHat (ie (1,0,0), (0,1,0), (0,0,1))
##  abs
##  acos
##  asin
##  atan
##  ceil
##  cos
##  cosh
##  exp
##  floor
##  ln
##  mag
##  min
##  max
##  norm
##  dot (only by vtkExprTkFunctionParser)
##  cross
##  sign
##  sin
##  sinh
##  sqrt
##  tan
##  tanh
##
##  Note that some of these operations work on scalars, some on vectors, and some on
##  both (e.g., you can multiply a scalar times a vector). The operations are performed
##  tuple-wise (i.e., tuple-by-tuple). The user must specify which arrays to use as
##  vectors and/or scalars, and the name of the output data array.
##
##  @sa
##  For more detailed documentation of the supported functionality see:
##  1) vtkFunctionParser
##  2) vtkExprTkFunctionParser (default)
##

## !!!Ignored construct:  # vtkArrayCalculator_h [NewLine] # vtkArrayCalculator_h [NewLine] # vtkDataObject.h  For attribute types # vtkFiltersCoreModule.h  For export macro # vtkPassInputTypeAlgorithm.h [NewLine] # vtkTuple.h  needed for vtkTuple # < vector >  needed for vector [NewLine] class vtkDataSet ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSCORE_EXPORT vtkArrayCalculator : public vtkPassInputTypeAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPassInputTypeAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPassInputTypeAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkArrayCalculator :: IsTypeOf ( type ) ; } static vtkArrayCalculator * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkArrayCalculator * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkArrayCalculator * NewInstance ( ) const { return vtkArrayCalculator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPassInputTypeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkArrayCalculator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkArrayCalculator :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkArrayCalculator * New ( ) ; /@{ *
##  Set/Get the function to be evaluated.
##  virtual void SetFunction ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Function  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> Function == nullptr && _arg == nullptr ) { return ; } if ( this -> Function && _arg && ( ! strcmp ( this -> Function , _arg ) ) ) { return ; } delete [ ] this -> Function ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> Function = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> Function = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetFunction ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << Function  of  << ( this -> Function ? this -> Function : (null) ) ) ; return this -> Function ; } ; /@} /@{ *
##  Add an array name to the list of arrays used in the function and specify
##  which components of the array to use in evaluating the function. The
##  array name must match the name in the function. If the array name is not
##  sanitized, the variable name will be the array name enclosed in quotes.
##  Use AddScalarVariable or AddVectorVariable to use a user defined
##  variable name.
##
##  @note A sanitized variable name is accepted by the following regex: ^[a-zA-Z][a-zA-Z_0-9]*.
##  void AddScalarArrayName ( const char * arrayName , int component = 0 ) ; void AddVectorArrayName ( const char * arrayName , int component0 = 0 , int component1 = 1 , int component2 = 2 ) ; /@} /@{ *
##  Add a variable name, a corresponding array name, and which components of
##  the array to use. The variable name should be sanitized or in quotes.
##
##  @note A sanitized variable name is accepted by the following regex: ^[a-zA-Z][a-zA-Z_0-9]*.
##  void AddScalarVariable ( const char * variableName , const char * arrayName , int component = 0 ) ; void AddVectorVariable ( const char * variableName , const char * arrayName , int component0 = 0 , int component1 = 1 , int component2 = 2 ) ; /@} /@{ *
##  Add a variable name, a corresponding array name, and which components of
##  the array to use. The variable name should be sanitized or in quotes.
##
##  @note A sanitized variable name is accepted by the following regex: ^[a-zA-Z][a-zA-Z_0-9]*.
##  void AddCoordinateScalarVariable ( const char * variableName , int component = 0 ) ; void AddCoordinateVectorVariable ( const char * variableName , int component0 = 0 , int component1 = 1 , int component2 = 2 ) ; /@} /@{ *
##  Set the name of the array in which to store the result of
##  evaluating this function.  If this is the name of an existing array,
##  that array will be overwritten.  Otherwise a new array will be
##  created with the specified name.
##  virtual void SetFunctionResultArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ResultArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> ResultArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> ResultArrayName && _arg && ( ! strcmp ( this -> ResultArrayName , _arg ) ) ) { return ; } delete [ ] this -> ResultArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> ResultArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> ResultArrayName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetFunctionResultArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << ResultArrayName  of  << ( this -> ResultArrayName ? this -> ResultArrayName : (null) ) ) ; return this -> ResultArrayName ; } ; /@} /@{ *
##  Type of the result array. It is ignored if CoordinateResults is true.
##  Initial value is VTK_DOUBLE.
##  virtual int GetResultArrayType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ResultArrayType  of  << this -> ResultArrayType ) ; return this -> ResultArrayType ; } ; virtual void SetResultArrayType ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ResultArrayType  to  << _arg ) ; if ( this -> ResultArrayType != _arg ) { this -> ResultArrayType = _arg ; this -> Modified ( ) ; } } ; /@} /@{ *
##  Set whether to output results as coordinates.  ResultArrayName will be
##  ignored.  Outputting as coordinates is only valid with vector results and
##  if the AttributeMode is AttributeModeToUsePointData.
##  If a valid output can't be made, an error will occur.
##  virtual vtkTypeBool GetResultArrayTypeCoordinateResults ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CoordinateResults  of  << this -> CoordinateResults ) ; return this -> CoordinateResults ; } ; virtual void SetResultArrayTypeCoordinateResults ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CoordinateResults  to  << _arg ) ; if ( this -> CoordinateResults != _arg ) { this -> CoordinateResults = _arg ; this -> Modified ( ) ; } } ; virtual void CoordinateResultsOn ( ) { this -> SetCoordinateResults ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void CoordinateResultsOff ( ) { this -> SetCoordinateResults ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set whether to output results as point/cell normals. Outputting as
##  normals is only valid with vector results. Point or cell normals are
##  selected using AttributeMode.
##  virtual bool GetResultArrayTypeCoordinateResultsResultNormals ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ResultNormals  of  << this -> ResultNormals ) ; return this -> ResultNormals ; } ; virtual void SetResultArrayTypeCoordinateResultsResultNormals ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ResultNormals  to  << _arg ) ; if ( this -> ResultNormals != _arg ) { this -> ResultNormals = _arg ; this -> Modified ( ) ; } } ; virtual void ResultNormalsOn ( ) { this -> SetCoordinateResultsResultNormals ( static_cast < bool > ( 1 ) ) ; } virtual void ResultNormalsOff ( ) { this -> SetCoordinateResultsResultNormals ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Set whether to output results as point/cell texture coordinates.
##  Point or cell texture coordinates are selected using AttributeMode.
##  2-component texture coordinates cannot be generated at this time.
##  virtual bool GetResultArrayTypeCoordinateResultsResultNormalsResultTCoords ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ResultTCoords  of  << this -> ResultTCoords ) ; return this -> ResultTCoords ; } ; virtual void SetResultArrayTypeCoordinateResultsResultNormalsResultTCoords ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ResultTCoords  to  << _arg ) ; if ( this -> ResultTCoords != _arg ) { this -> ResultTCoords = _arg ; this -> Modified ( ) ; } } ; virtual void ResultTCoordsOn ( ) { this -> SetCoordinateResultsResultNormalsResultTCoords ( static_cast < bool > ( 1 ) ) ; } virtual void ResultTCoordsOff ( ) { this -> SetCoordinateResultsResultNormalsResultTCoords ( static_cast < bool > ( 0 ) ) ; } ; /@} *
##  Returns a string representation of the calculator's AttributeType
##  const char * GetAttributeTypeAsString ( ) ; static const int DEFAULT_ATTRIBUTE_TYPE = - 1 ; /@{ *
##  Control which AttributeType the filter operates on (point data or cell data
##  for vtkDataSets).  By default the filter uses Point/Vertex/Row data depending
##  on the input data type.  The input value for this function should be one of the
##  constants in vtkDataObject::AttributeTypes or DEFAULT_ATTRIBUTE_TYPE for 'default behavior'.
##  virtual void SetResultArrayTypeCoordinateResultsResultNormalsResultTCoordsAttributeType ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AttributeType  to  << _arg ) ; if ( this -> AttributeType != _arg ) { this -> AttributeType = _arg ; this -> Modified ( ) ; } } ; virtual int GetResultArrayTypeCoordinateResultsResultNormalsResultTCoordsAttributeType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AttributeType  of  << this -> AttributeType ) ; return this -> AttributeType ; } ; void SetAttributeTypeToDefault ( ) { this -> SetAttributeType ( DEFAULT_ATTRIBUTE_TYPE ) ; } void SetAttributeTypeToPointData ( ) { this -> SetAttributeType ( vtkDataObject :: POINT ) ; } void SetAttributeTypeToCellData ( ) { this -> SetAttributeType ( vtkDataObject :: CELL ) ; } void SetAttributeTypeToEdgeData ( ) { this -> SetAttributeType ( vtkDataObject :: EDGE ) ; } void SetAttributeTypeToVertexData ( ) { this -> SetAttributeType ( vtkDataObject :: VERTEX ) ; } void SetAttributeTypeToRowData ( ) { this -> SetAttributeType ( vtkDataObject :: ROW ) ; } /@} *
##  Remove all the variable names and their associated array names.
##  void RemoveAllVariables ( ) ; *
##  Remove all the scalar variable names and their associated array names.
##  virtual void RemoveScalarVariables ( ) ; *
##  Remove all the scalar variable names and their associated array names.
##  virtual void RemoveVectorVariables ( ) ; *
##  Remove all the coordinate variables.
##  virtual void RemoveCoordinateScalarVariables ( ) ; *
##  Remove all the coordinate variables.
##  virtual void RemoveCoordinateVectorVariables ( ) ; /@{ *
##  Methods to get information about the current variables.
##  const std :: vector < std :: string > & GetScalarArrayNames ( ) { return this -> ScalarArrayNames ; } std :: string GetScalarArrayName ( int i ) ; const std :: vector < std :: string > & GetVectorArrayNames ( ) { return this -> VectorArrayNames ; } std :: string GetVectorArrayName ( int i ) ; const std :: vector < std :: string > & GetScalarVariableNames ( ) { return this -> ScalarVariableNames ; } std :: string GetScalarVariableName ( int i ) ; const std :: vector < std :: string > & GetVectorVariableNames ( ) { return this -> VectorVariableNames ; } std :: string GetVectorVariableName ( int i ) ; const std :: vector < int > & GetSelectedScalarComponents ( ) { return this -> SelectedScalarComponents ; } int GetSelectedScalarComponent ( int i ) ; const std :: vector < vtkTuple < int , 3 >> & GetSelectedVectorComponents ( ) { return this -> SelectedVectorComponents ; } vtkTuple < int , 3 > GetSelectedVectorComponents ( int i ) ; int GetNumberOfScalarArrays ( ) { return static_cast < int > ( this -> ScalarArrayNames . size ( ) ) ; } int GetNumberOfVectorArrays ( ) { return static_cast < int > ( this -> VectorArrayNames . size ( ) ) ; } /@} /@{ *
##  When ReplaceInvalidValues is on, all invalid values (such as
##  sqrt(-2), note that function parser does not handle complex
##  numbers) will be replaced by ReplacementValue. Otherwise an
##  error will be reported.
##  virtual void SetResultArrayTypeCoordinateResultsResultNormalsResultTCoordsAttributeTypeReplaceInvalidValues ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ReplaceInvalidValues  to  << _arg ) ; if ( this -> ReplaceInvalidValues != _arg ) { this -> ReplaceInvalidValues = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetResultArrayTypeCoordinateResultsResultNormalsResultTCoordsAttributeTypeReplaceInvalidValues ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReplaceInvalidValues  of  << this -> ReplaceInvalidValues ) ; return this -> ReplaceInvalidValues ; } ; virtual void ReplaceInvalidValuesOn ( ) { this -> SetCoordinateResultsResultNormalsResultTCoordsReplaceInvalidValues ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ReplaceInvalidValuesOff ( ) { this -> SetCoordinateResultsResultNormalsResultTCoordsReplaceInvalidValues ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual void SetResultArrayTypeCoordinateResultsResultNormalsResultTCoordsAttributeTypeReplaceInvalidValuesReplacementValue ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ReplacementValue  to  << _arg ) ; if ( this -> ReplacementValue != _arg ) { this -> ReplacementValue = _arg ; this -> Modified ( ) ; } } ; virtual double GetResultArrayTypeCoordinateResultsResultNormalsResultTCoordsAttributeTypeReplaceInvalidValuesReplacementValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReplacementValue  of  << this -> ReplacementValue ) ; return this -> ReplacementValue ; } ; /@} /@{ *
##  When this option is set, silently ignore datasets where the requested field
##  data array is not present. When an input array is not present, the result array
##  will not be generated nor added to the output.
##  virtual void SetResultArrayTypeCoordinateResultsResultNormalsResultTCoordsAttributeTypeReplaceInvalidValuesReplacementValueIgnoreMissingArrays ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  IgnoreMissingArrays  to  << _arg ) ; if ( this -> IgnoreMissingArrays != _arg ) { this -> IgnoreMissingArrays = _arg ; this -> Modified ( ) ; } } ; virtual bool GetResultArrayTypeCoordinateResultsResultNormalsResultTCoordsAttributeTypeReplaceInvalidValuesReplacementValueIgnoreMissingArrays ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IgnoreMissingArrays  of  << this -> IgnoreMissingArrays ) ; return this -> IgnoreMissingArrays ; } ; virtual void IgnoreMissingArraysOn ( ) { this -> SetCoordinateResultsResultNormalsResultTCoordsReplaceInvalidValuesIgnoreMissingArrays ( static_cast < bool > ( 1 ) ) ; } virtual void IgnoreMissingArraysOff ( ) { this -> SetCoordinateResultsResultNormalsResultTCoordsReplaceInvalidValuesIgnoreMissingArrays ( static_cast < bool > ( 0 ) ) ; } ; /@} *
##  Enum that includes the types of parsers that can be used.
##  enum FunctionParserTypes { FunctionParser ,  vtkFunctionParser ExprTkFunctionParser ,  vtkExprTkFunctionParser NumberOfFunctionParserTypes } ; /@{ *
##  Set/Get the FunctionParser type that will be used.
##  vtkFunctionParser = 0, vtkExprTkFunctionParser = 1. Default is 1.
##  virtual void SetFunctionParserType ( FunctionParserTypes _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  FunctionParserType  to  << static_cast < std :: underlying_type < FunctionParserTypes > :: type > ( _arg ) ) ; if ( this -> FunctionParserType != _arg ) { this -> FunctionParserType = _arg ; this -> Modified ( ) ; } } ; void SetFunctionParserTypeToFunctionParser ( ) { this -> FunctionParserType = FunctionParserTypes :: FunctionParser ; this -> Modified ( ) ; } void SetFunctionParserTypeToExprTkFunctionParser ( ) { this -> FunctionParserType = FunctionParserTypes :: ExprTkFunctionParser ; this -> Modified ( ) ; } virtual FunctionParserTypes GetFunctionParserType ( ) const { vtkDebugWithObjectMacro ( this , <<  returning  << FunctionParserType  of  << static_cast < std :: underlying_type < FunctionParserTypes > :: type > ( this -> FunctionParserType ) ) ; return this -> FunctionParserType ; } ; /@} *
##  Returns the output of the filter downcast to a vtkDataSet or nullptr if the
##  cast fails.
##  vtkDataSet * GetDataSetOutput ( ) ; protected : vtkArrayCalculator ( ) ; ~ vtkArrayCalculator ( ) override ; int FillInputPortInformation ( int , vtkInformation * ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; *
##  Get the attribute type for the input.
##  int GetAttributeTypeFromInput ( vtkDataObject * input ) ; *
##  A variable name is valid if it's sanitized or enclosed in quotes.
##  1) if it's valid, return itself.
##  2) if it's not valid, return itself enclosed in quotes,
##
##  @note A sanitized variable name is accepted by the following regex: ^[a-zA-Z][a-zA-Z_0-9]*.
##  static std :: string CheckValidVariableName ( const char * variableName ) ; FunctionParserTypes FunctionParserType ; char * Function ; char * ResultArrayName ; std :: vector < std :: string > ScalarArrayNames ; std :: vector < std :: string > VectorArrayNames ; std :: vector < std :: string > ScalarVariableNames ; std :: vector < std :: string > VectorVariableNames ; int AttributeType ; std :: vector < int > SelectedScalarComponents ; std :: vector < vtkTuple < int , 3 >> SelectedVectorComponents ; vtkTypeBool ReplaceInvalidValues ; double ReplacementValue ; bool IgnoreMissingArrays ; vtkTypeBool CoordinateResults ; bool ResultNormals ; bool ResultTCoords ; std :: vector < std :: string > CoordinateScalarVariableNames ; std :: vector < std :: string > CoordinateVectorVariableNames ; std :: vector < int > SelectedCoordinateScalarComponents ; std :: vector < vtkTuple < int , 3 >> SelectedCoordinateVectorComponents ; int ResultArrayType ; private : vtkArrayCalculator ( const vtkArrayCalculator & ) = delete ; void operator = ( const vtkArrayCalculator & ) = delete ;  Do the bulk of the work template < typename TFunctionParser > int ProcessDataObject ( vtkDataObject * input , vtkDataObject * output ) ; } ;
## Error: token expected: ; but got: [identifier]!!!
