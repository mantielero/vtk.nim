## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRandomAttributeGenerator.h
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
##  @class   vtkRandomAttributeGenerator
##  @brief   generate and create random data attributes
##
##  vtkRandomAttributeGenerator is a filter that creates random attributes
##  including scalars, vectors, normals, tensors, texture coordinates and/or
##  general data arrays. These attributes can be generated as point data, cell
##  data or general field data. The generation of each component is normalized
##  between a user-specified minimum and maximum value.
##
##  This filter provides that capability to specify the data type of the
##  attributes, the range for each of the components, and the number of
##  components. Note, however, that this flexibility only goes so far because
##  some attributes (e.g., normals, vectors and tensors) are fixed in the
##  number of components, and in the case of normals and tensors, are
##  constrained in the values that some of the components can take (i.e.,
##  normals have magnitude one, and tensors are symmetric).
##
##  @warning
##  In general this class is used for debugging or testing purposes.
##
##  @warning
##  It is possible to generate multiple attributes simultaneously.
##
##  @warning
##  By default, no data is generated. Make sure to enable the generation of
##  some attributes if you want this filter to affect the output. Also note
##  that this filter passes through input geometry, topology and attributes.
##  Newly created attributes may replace attribute data that would have
##  otherwise been passed through.
##
##  @sa
##  vtkBrownianPoints
##

## !!!Ignored construct:  # vtkRandomAttributeGenerator_h [NewLine] # vtkRandomAttributeGenerator_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkPassInputTypeAlgorithm.h [NewLine] class vtkDataSet ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkCompositeDataSet"
## !!!Ignored construct:  class VTKFILTERSGENERAL_EXPORT vtkRandomAttributeGenerator : public vtkPassInputTypeAlgorithm { public : /@{ *
##  Standard methods for construction, type info, and printing.
##  static vtkRandomAttributeGenerator * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPassInputTypeAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPassInputTypeAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkRandomAttributeGenerator :: IsTypeOf ( type ) ; } static vtkRandomAttributeGenerator * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkRandomAttributeGenerator * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkRandomAttributeGenerator * NewInstance ( ) const { return vtkRandomAttributeGenerator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPassInputTypeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRandomAttributeGenerator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRandomAttributeGenerator :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Specify the type of array to create (all components of this array are of this
##  type). This holds true for all arrays that are created.
##  virtual void SetDataType ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  DataType  to  << _arg ) ; if ( this -> DataType != _arg ) { this -> DataType = _arg ; this -> Modified ( ) ; } } ; void SetDataTypeToBit ( ) { this -> SetDataType ( VTK_BIT ) ; } void SetDataTypeToChar ( ) { this -> SetDataType ( VTK_CHAR ) ; } void SetDataTypeToUnsignedChar ( ) { this -> SetDataType ( VTK_UNSIGNED_CHAR ) ; } void SetDataTypeToShort ( ) { this -> SetDataType ( VTK_SHORT ) ; } void SetDataTypeToUnsignedShort ( ) { this -> SetDataType ( VTK_UNSIGNED_SHORT ) ; } void SetDataTypeToInt ( ) { this -> SetDataType ( VTK_INT ) ; } void SetDataTypeToUnsignedInt ( ) { this -> SetDataType ( VTK_UNSIGNED_INT ) ; } void SetDataTypeToLong ( ) { this -> SetDataType ( VTK_LONG ) ; } void SetDataTypeToLongLong ( ) { this -> SetDataType ( VTK_LONG_LONG ) ; } void SetDataTypeToUnsignedLong ( ) { this -> SetDataType ( VTK_UNSIGNED_LONG ) ; } void SetDataTypeToUnsignedLongLong ( ) { this -> SetDataType ( VTK_UNSIGNED_LONG_LONG ) ; } void SetDataTypeToIdType ( ) { this -> SetDataType ( VTK_ID_TYPE ) ; } void SetDataTypeToFloat ( ) { this -> SetDataType ( VTK_FLOAT ) ; } void SetDataTypeToDouble ( ) { this -> SetDataType ( VTK_DOUBLE ) ; } virtual int GetDataType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DataType  of  << this -> DataType ) ; return this -> DataType ; } ; /@} /@{ *
##  Specify the number of components to generate. This value only applies to those
##  attribute types that take a variable number of components. For example, a vector
##  is only three components so the number of components is not applicable; whereas
##  a scalar may support multiple, varying number of components.
##  virtual void SetNumberOfComponents ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << NumberOfComponents  to  << _arg ) ; if ( this -> NumberOfComponents != ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> NumberOfComponents = ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetNumberOfComponentsMinValue ( ) { return 1 ; } virtual int GetNumberOfComponentsMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetDataTypeNumberOfComponents ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfComponents  of  << this -> NumberOfComponents ) ; return this -> NumberOfComponents ; } ; /@} /@{ *
##  Set the minimum component value. This applies to all data that is generated,
##  although normals and tensors have internal constraints that must be
##  observed.
##  virtual void SetDataTypeMinimumComponentValue ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MinimumComponentValue  to  << _arg ) ; if ( this -> MinimumComponentValue != _arg ) { this -> MinimumComponentValue = _arg ; this -> Modified ( ) ; } } ; virtual double GetDataTypeNumberOfComponentsMinimumComponentValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinimumComponentValue  of  << this -> MinimumComponentValue ) ; return this -> MinimumComponentValue ; } ; void SetComponentRange ( double minimumValue , double maximumValue ) { this -> SetMinimumComponentValue ( minimumValue ) ; this -> SetMaximumComponentValue ( maximumValue ) ; } /@} /@{ *
##  Set the maximum component value. This applies to all data that is generated,
##  although normals and tensors have internal constraints that must be
##  observed.
##  virtual void SetDataTypeMinimumComponentValueMaximumComponentValue ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MaximumComponentValue  to  << _arg ) ; if ( this -> MaximumComponentValue != _arg ) { this -> MaximumComponentValue = _arg ; this -> Modified ( ) ; } } ; virtual double GetDataTypeNumberOfComponentsMinimumComponentValueMaximumComponentValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumComponentValue  of  << this -> MaximumComponentValue ) ; return this -> MaximumComponentValue ; } ; /@} /@{ *
##  Specify the number of tuples to generate. This value only applies when creating
##  general field data. In all other cases (i.e., point data or cell data), the number
##  of tuples is controlled by the number of points and cells, respectively.
##  virtual void SetNumberOfComponentsNumberOfTuples ( vtkIdType _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << NumberOfTuples  to  << _arg ) ; if ( this -> NumberOfTuples != ( _arg < 0 ? 0 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> NumberOfTuples = ( _arg < 0 ? 0 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual vtkIdType GetNumberOfComponentsMinValueNumberOfTuplesMinValue ( ) { return 0 ; } virtual vtkIdType GetNumberOfComponentsMaxValueNumberOfTuplesMaxValue ( ) { return VTK_INT_MAX ; } ; virtual vtkIdType GetDataTypeNumberOfComponentsMinimumComponentValueMaximumComponentValueNumberOfTuples ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfTuples  of  << this -> NumberOfTuples ) ; return this -> NumberOfTuples ; } ; /@} /@{ *
##  Indicate that point scalars are to be generated. Note that the specified
##  number of components is used to create the scalar.
##  virtual void SetDataTypeMinimumComponentValueMaximumComponentValueGeneratePointScalars ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GeneratePointScalars  to  << _arg ) ; if ( this -> GeneratePointScalars != _arg ) { this -> GeneratePointScalars = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetDataTypeNumberOfComponentsMinimumComponentValueMaximumComponentValueNumberOfTuplesGeneratePointScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GeneratePointScalars  of  << this -> GeneratePointScalars ) ; return this -> GeneratePointScalars ; } ; virtual void GeneratePointScalarsOn ( ) { this -> SetGeneratePointScalars ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GeneratePointScalarsOff ( ) { this -> SetGeneratePointScalars ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Indicate that point vectors are to be generated. Note that the
##  number of components is always equal to three.
##  virtual void SetDataTypeMinimumComponentValueMaximumComponentValueGeneratePointScalarsGeneratePointVectors ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GeneratePointVectors  to  << _arg ) ; if ( this -> GeneratePointVectors != _arg ) { this -> GeneratePointVectors = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetDataTypeNumberOfComponentsMinimumComponentValueMaximumComponentValueNumberOfTuplesGeneratePointScalarsGeneratePointVectors ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GeneratePointVectors  of  << this -> GeneratePointVectors ) ; return this -> GeneratePointVectors ; } ; virtual void GeneratePointVectorsOn ( ) { this -> SetGeneratePointScalarsGeneratePointVectors ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GeneratePointVectorsOff ( ) { this -> SetGeneratePointScalarsGeneratePointVectors ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Indicate that point normals are to be generated. Note that the
##  number of components is always equal to three.
##  virtual void SetDataTypeMinimumComponentValueMaximumComponentValueGeneratePointScalarsGeneratePointVectorsGeneratePointNormals ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GeneratePointNormals  to  << _arg ) ; if ( this -> GeneratePointNormals != _arg ) { this -> GeneratePointNormals = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetDataTypeNumberOfComponentsMinimumComponentValueMaximumComponentValueNumberOfTuplesGeneratePointScalarsGeneratePointVectorsGeneratePointNormals ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GeneratePointNormals  of  << this -> GeneratePointNormals ) ; return this -> GeneratePointNormals ; } ; virtual void GeneratePointNormalsOn ( ) { this -> SetGeneratePointScalarsGeneratePointVectorsGeneratePointNormals ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GeneratePointNormalsOff ( ) { this -> SetGeneratePointScalarsGeneratePointVectorsGeneratePointNormals ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Indicate that point tensors are to be generated. Note that the
##  number of components is always equal to nine.
##  virtual void SetDataTypeMinimumComponentValueMaximumComponentValueGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensors ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GeneratePointTensors  to  << _arg ) ; if ( this -> GeneratePointTensors != _arg ) { this -> GeneratePointTensors = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetDataTypeNumberOfComponentsMinimumComponentValueMaximumComponentValueNumberOfTuplesGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensors ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GeneratePointTensors  of  << this -> GeneratePointTensors ) ; return this -> GeneratePointTensors ; } ; virtual void GeneratePointTensorsOn ( ) { this -> SetGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensors ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GeneratePointTensorsOff ( ) { this -> SetGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensors ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Indicate that point texture coordinates are to be generated. Note that
##  the specified number of components is used to create the texture
##  coordinates (but must range between one and three).
##  virtual void SetDataTypeMinimumComponentValueMaximumComponentValueGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoords ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GeneratePointTCoords  to  << _arg ) ; if ( this -> GeneratePointTCoords != _arg ) { this -> GeneratePointTCoords = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetDataTypeNumberOfComponentsMinimumComponentValueMaximumComponentValueNumberOfTuplesGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoords ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GeneratePointTCoords  of  << this -> GeneratePointTCoords ) ; return this -> GeneratePointTCoords ; } ; virtual void GeneratePointTCoordsOn ( ) { this -> SetGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoords ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GeneratePointTCoordsOff ( ) { this -> SetGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoords ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Indicate that an arbitrary point array is to be generated. The array is
##  added to the points data but is not labeled as one of scalars, vectors,
##  normals, tensors, or texture coordinates (i.e., AddArray() is
##  used). Note that the specified number of components is used to create
##  the array.
##  virtual void SetDataTypeMinimumComponentValueMaximumComponentValueGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoordsGeneratePointArray ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GeneratePointArray  to  << _arg ) ; if ( this -> GeneratePointArray != _arg ) { this -> GeneratePointArray = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetDataTypeNumberOfComponentsMinimumComponentValueMaximumComponentValueNumberOfTuplesGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoordsGeneratePointArray ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GeneratePointArray  of  << this -> GeneratePointArray ) ; return this -> GeneratePointArray ; } ; virtual void GeneratePointArrayOn ( ) { this -> SetGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoordsGeneratePointArray ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GeneratePointArrayOff ( ) { this -> SetGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoordsGeneratePointArray ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Indicate that cell scalars are to be generated. Note that the specified
##  number of components is used to create the scalar.
##  virtual void SetDataTypeMinimumComponentValueMaximumComponentValueGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoordsGeneratePointArrayGenerateCellScalars ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateCellScalars  to  << _arg ) ; if ( this -> GenerateCellScalars != _arg ) { this -> GenerateCellScalars = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetDataTypeNumberOfComponentsMinimumComponentValueMaximumComponentValueNumberOfTuplesGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoordsGeneratePointArrayGenerateCellScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateCellScalars  of  << this -> GenerateCellScalars ) ; return this -> GenerateCellScalars ; } ; virtual void GenerateCellScalarsOn ( ) { this -> SetGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoordsGeneratePointArrayGenerateCellScalars ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GenerateCellScalarsOff ( ) { this -> SetGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoordsGeneratePointArrayGenerateCellScalars ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Indicate that cell vectors are to be generated. Note that the
##  number of components is always equal to three.
##  virtual void SetDataTypeMinimumComponentValueMaximumComponentValueGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoordsGeneratePointArrayGenerateCellScalarsGenerateCellVectors ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateCellVectors  to  << _arg ) ; if ( this -> GenerateCellVectors != _arg ) { this -> GenerateCellVectors = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetDataTypeNumberOfComponentsMinimumComponentValueMaximumComponentValueNumberOfTuplesGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoordsGeneratePointArrayGenerateCellScalarsGenerateCellVectors ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateCellVectors  of  << this -> GenerateCellVectors ) ; return this -> GenerateCellVectors ; } ; virtual void GenerateCellVectorsOn ( ) { this -> SetGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoordsGeneratePointArrayGenerateCellScalarsGenerateCellVectors ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GenerateCellVectorsOff ( ) { this -> SetGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoordsGeneratePointArrayGenerateCellScalarsGenerateCellVectors ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Indicate that cell normals are to be generated. Note that the
##  number of components is always equal to three.
##  virtual void SetDataTypeMinimumComponentValueMaximumComponentValueGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoordsGeneratePointArrayGenerateCellScalarsGenerateCellVectorsGenerateCellNormals ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateCellNormals  to  << _arg ) ; if ( this -> GenerateCellNormals != _arg ) { this -> GenerateCellNormals = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetDataTypeNumberOfComponentsMinimumComponentValueMaximumComponentValueNumberOfTuplesGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoordsGeneratePointArrayGenerateCellScalarsGenerateCellVectorsGenerateCellNormals ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateCellNormals  of  << this -> GenerateCellNormals ) ; return this -> GenerateCellNormals ; } ; virtual void GenerateCellNormalsOn ( ) { this -> SetGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoordsGeneratePointArrayGenerateCellScalarsGenerateCellVectorsGenerateCellNormals ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GenerateCellNormalsOff ( ) { this -> SetGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoordsGeneratePointArrayGenerateCellScalarsGenerateCellVectorsGenerateCellNormals ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Indicate that cell tensors are to be generated. Note that the
##  number of components is always equal to nine.
##  virtual void SetDataTypeMinimumComponentValueMaximumComponentValueGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoordsGeneratePointArrayGenerateCellScalarsGenerateCellVectorsGenerateCellNormalsGenerateCellTensors ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateCellTensors  to  << _arg ) ; if ( this -> GenerateCellTensors != _arg ) { this -> GenerateCellTensors = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetDataTypeNumberOfComponentsMinimumComponentValueMaximumComponentValueNumberOfTuplesGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoordsGeneratePointArrayGenerateCellScalarsGenerateCellVectorsGenerateCellNormalsGenerateCellTensors ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateCellTensors  of  << this -> GenerateCellTensors ) ; return this -> GenerateCellTensors ; } ; virtual void GenerateCellTensorsOn ( ) { this -> SetGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoordsGeneratePointArrayGenerateCellScalarsGenerateCellVectorsGenerateCellNormalsGenerateCellTensors ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GenerateCellTensorsOff ( ) { this -> SetGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoordsGeneratePointArrayGenerateCellScalarsGenerateCellVectorsGenerateCellNormalsGenerateCellTensors ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Indicate that cell texture coordinates are to be generated. Note that
##  the specified number of components is used to create the texture
##  coordinates (but must range between one and three).
##  virtual void SetDataTypeMinimumComponentValueMaximumComponentValueGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoordsGeneratePointArrayGenerateCellScalarsGenerateCellVectorsGenerateCellNormalsGenerateCellTensorsGenerateCellTCoords ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateCellTCoords  to  << _arg ) ; if ( this -> GenerateCellTCoords != _arg ) { this -> GenerateCellTCoords = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetDataTypeNumberOfComponentsMinimumComponentValueMaximumComponentValueNumberOfTuplesGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoordsGeneratePointArrayGenerateCellScalarsGenerateCellVectorsGenerateCellNormalsGenerateCellTensorsGenerateCellTCoords ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateCellTCoords  of  << this -> GenerateCellTCoords ) ; return this -> GenerateCellTCoords ; } ; virtual void GenerateCellTCoordsOn ( ) { this -> SetGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoordsGeneratePointArrayGenerateCellScalarsGenerateCellVectorsGenerateCellNormalsGenerateCellTensorsGenerateCellTCoords ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GenerateCellTCoordsOff ( ) { this -> SetGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoordsGeneratePointArrayGenerateCellScalarsGenerateCellVectorsGenerateCellNormalsGenerateCellTensorsGenerateCellTCoords ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Indicate that an arbitrary cell array is to be generated. The array is
##  added to the cell data but is not labeled as one of scalars, vectors,
##  normals, tensors, or texture coordinates array (i.e., AddArray() is
##  used). Note that the specified number of components is used to create
##  the array.
##  virtual void SetDataTypeMinimumComponentValueMaximumComponentValueGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoordsGeneratePointArrayGenerateCellScalarsGenerateCellVectorsGenerateCellNormalsGenerateCellTensorsGenerateCellTCoordsGenerateCellArray ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateCellArray  to  << _arg ) ; if ( this -> GenerateCellArray != _arg ) { this -> GenerateCellArray = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetDataTypeNumberOfComponentsMinimumComponentValueMaximumComponentValueNumberOfTuplesGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoordsGeneratePointArrayGenerateCellScalarsGenerateCellVectorsGenerateCellNormalsGenerateCellTensorsGenerateCellTCoordsGenerateCellArray ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateCellArray  of  << this -> GenerateCellArray ) ; return this -> GenerateCellArray ; } ; virtual void GenerateCellArrayOn ( ) { this -> SetGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoordsGeneratePointArrayGenerateCellScalarsGenerateCellVectorsGenerateCellNormalsGenerateCellTensorsGenerateCellTCoordsGenerateCellArray ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GenerateCellArrayOff ( ) { this -> SetGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoordsGeneratePointArrayGenerateCellScalarsGenerateCellVectorsGenerateCellNormalsGenerateCellTensorsGenerateCellTCoordsGenerateCellArray ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Indicate that an arbitrary field data array is to be generated. Note
##  that the specified number of components is used to create the scalar.
##  virtual void SetDataTypeMinimumComponentValueMaximumComponentValueGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoordsGeneratePointArrayGenerateCellScalarsGenerateCellVectorsGenerateCellNormalsGenerateCellTensorsGenerateCellTCoordsGenerateCellArrayGenerateFieldArray ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateFieldArray  to  << _arg ) ; if ( this -> GenerateFieldArray != _arg ) { this -> GenerateFieldArray = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetDataTypeNumberOfComponentsMinimumComponentValueMaximumComponentValueNumberOfTuplesGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoordsGeneratePointArrayGenerateCellScalarsGenerateCellVectorsGenerateCellNormalsGenerateCellTensorsGenerateCellTCoordsGenerateCellArrayGenerateFieldArray ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateFieldArray  of  << this -> GenerateFieldArray ) ; return this -> GenerateFieldArray ; } ; virtual void GenerateFieldArrayOn ( ) { this -> SetGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoordsGeneratePointArrayGenerateCellScalarsGenerateCellVectorsGenerateCellNormalsGenerateCellTensorsGenerateCellTCoordsGenerateCellArrayGenerateFieldArray ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GenerateFieldArrayOff ( ) { this -> SetGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoordsGeneratePointArrayGenerateCellScalarsGenerateCellVectorsGenerateCellNormalsGenerateCellTensorsGenerateCellTCoordsGenerateCellArrayGenerateFieldArray ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Indicate that the generated attributes are
##  constant within a block. This can be used to highlight
##  blocks in a composite dataset.
##  virtual void SetDataTypeMinimumComponentValueMaximumComponentValueGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoordsGeneratePointArrayGenerateCellScalarsGenerateCellVectorsGenerateCellNormalsGenerateCellTensorsGenerateCellTCoordsGenerateCellArrayGenerateFieldArrayAttributesConstantPerBlock ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AttributesConstantPerBlock  to  << _arg ) ; if ( this -> AttributesConstantPerBlock != _arg ) { this -> AttributesConstantPerBlock = _arg ; this -> Modified ( ) ; } } ; virtual bool GetDataTypeNumberOfComponentsMinimumComponentValueMaximumComponentValueNumberOfTuplesGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoordsGeneratePointArrayGenerateCellScalarsGenerateCellVectorsGenerateCellNormalsGenerateCellTensorsGenerateCellTCoordsGenerateCellArrayGenerateFieldArrayAttributesConstantPerBlock ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AttributesConstantPerBlock  of  << this -> AttributesConstantPerBlock ) ; return this -> AttributesConstantPerBlock ; } ; virtual void AttributesConstantPerBlockOn ( ) { this -> SetGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoordsGeneratePointArrayGenerateCellScalarsGenerateCellVectorsGenerateCellNormalsGenerateCellTensorsGenerateCellTCoordsGenerateCellArrayGenerateFieldArrayAttributesConstantPerBlock ( static_cast < bool > ( 1 ) ) ; } virtual void AttributesConstantPerBlockOff ( ) { this -> SetGeneratePointScalarsGeneratePointVectorsGeneratePointNormalsGeneratePointTensorsGeneratePointTCoordsGeneratePointArrayGenerateCellScalarsGenerateCellVectorsGenerateCellNormalsGenerateCellTensorsGenerateCellTCoordsGenerateCellArrayGenerateFieldArrayAttributesConstantPerBlock ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Convenience methods for generating data: all data, all point data, or all cell data.
##  For example, if all data is enabled, then all point, cell and field data is generated.
##  If all point data is enabled, then point scalars, vectors, normals, tensors, tcoords,
##  and a data array are produced.
##  void GenerateAllPointDataOn ( ) { this -> GeneratePointScalarsOn ( ) ; this -> GeneratePointVectorsOn ( ) ; this -> GeneratePointNormalsOn ( ) ; this -> GeneratePointTCoordsOn ( ) ; this -> GeneratePointTensorsOn ( ) ; this -> GeneratePointArrayOn ( ) ; } void GenerateAllPointDataOff ( ) { this -> GeneratePointScalarsOff ( ) ; this -> GeneratePointVectorsOff ( ) ; this -> GeneratePointNormalsOff ( ) ; this -> GeneratePointTCoordsOff ( ) ; this -> GeneratePointTensorsOff ( ) ; this -> GeneratePointArrayOff ( ) ; } void GenerateAllCellDataOn ( ) { this -> GenerateCellScalarsOn ( ) ; this -> GenerateCellVectorsOn ( ) ; this -> GenerateCellNormalsOn ( ) ; this -> GenerateCellTCoordsOn ( ) ; this -> GenerateCellTensorsOn ( ) ; this -> GenerateCellArrayOn ( ) ; } void GenerateAllCellDataOff ( ) { this -> GenerateCellScalarsOff ( ) ; this -> GenerateCellVectorsOff ( ) ; this -> GenerateCellNormalsOff ( ) ; this -> GenerateCellTCoordsOff ( ) ; this -> GenerateCellTensorsOff ( ) ; this -> GenerateCellArrayOff ( ) ; } void GenerateAllDataOn ( ) { this -> GenerateAllPointDataOn ( ) ; this -> GenerateAllCellDataOn ( ) ; this -> GenerateFieldArrayOn ( ) ; } void GenerateAllDataOff ( ) { this -> GenerateAllPointDataOff ( ) ; this -> GenerateAllCellDataOff ( ) ; this -> GenerateFieldArrayOff ( ) ; } /@} protected : vtkRandomAttributeGenerator ( ) ; ~ vtkRandomAttributeGenerator ( ) override = default ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int DataType ; int NumberOfComponents ; vtkIdType NumberOfTuples ; double MinimumComponentValue ; double MaximumComponentValue ; vtkTypeBool GeneratePointScalars ; vtkTypeBool GeneratePointVectors ; vtkTypeBool GeneratePointNormals ; vtkTypeBool GeneratePointTCoords ; vtkTypeBool GeneratePointTensors ; vtkTypeBool GeneratePointArray ; vtkTypeBool GenerateCellScalars ; vtkTypeBool GenerateCellVectors ; vtkTypeBool GenerateCellNormals ; vtkTypeBool GenerateCellTCoords ; vtkTypeBool GenerateCellTensors ; vtkTypeBool GenerateCellArray ; vtkTypeBool GenerateFieldArray ; bool AttributesConstantPerBlock ;  Helper functions vtkDataArray * GenerateData ( int dataType , vtkIdType numTuples , int numComp , int minComp , int maxComp , double min , double max ) ; int RequestData ( vtkDataSet * input , vtkDataSet * output ) ; int RequestData ( vtkCompositeDataSet * input , vtkCompositeDataSet * output ) ; template < class T > void GenerateRandomTuples ( T * data , vtkIdType numTuples , int numComp , int minComp , int maxComp , double min , double max ) ; private : vtkRandomAttributeGenerator ( const vtkRandomAttributeGenerator & ) = delete ; void operator = ( const vtkRandomAttributeGenerator & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
