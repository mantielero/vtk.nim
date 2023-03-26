## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGDALVectorReader.h
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
##  @class   vtkGDALVectorReader
##  @brief   Read vector file formats using GDAL.
##
##  vtkGDALVectorReader is a source object that reads vector files and uses
##  GDAL as the underlying library for the task. GDAL is required for this
##  reader. The output of the reader is a vtkMultiBlockDataSet
##
##  This filter uses the ActiveLayer member to only load entries from the
##  specified layer (when ActiveLayer >= 0).
##
##  @sa
##  vtkMultiBlockDataSet
##

## !!!Ignored construct:  # vtkGDALVectorReader_h [NewLine] # vtkGDALVectorReader_h [NewLine] # vtkIOGDALModule.h  For export macro # vtkMultiBlockDataSetAlgorithm.h [NewLine] # < map >  STL required. # < string >  for ivars [NewLine] class VTKIOGDAL_EXPORT vtkGDALVectorReader : public vtkMultiBlockDataSetAlgorithm { public : static vtkGDALVectorReader * New ( ) ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkMultiBlockDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkMultiBlockDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkGDALVectorReader :: IsTypeOf ( type ) ; } static vtkGDALVectorReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkGDALVectorReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkGDALVectorReader * NewInstance ( ) const { return vtkGDALVectorReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMultiBlockDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGDALVectorReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGDALVectorReader :: New ( ) ; } public : ; virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ; *
##  Return number of layers.
##  int GetNumberOfLayers ( ) ; *
##  Given a index return layer type (eg point, line, polygon).
##  int GetLayerType ( int layerIndex = 0 ) ; *
##  Given a layer index return number of features (shapes).
##  int GetFeatureCount ( int layerIndex = 0 ) ; *
##  Return the active layer type (eg point, line, polygon).
##  int GetActiveLayerType ( ) ; *
##  Return the number of features in the active layer (shapes).
##  int GetActiveLayerFeatureCount ( ) ; /@{ *
##  Set and Get the active layer.
##  If ActiveLayer is less than 0 (the default is -1), then all
##  layers are read. Otherwise, only the specified layer is read.
##  virtual void SetActiveLayer ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ActiveLayer  to  << _arg ) ; if ( this -> ActiveLayer != _arg ) { this -> ActiveLayer = _arg ; this -> Modified ( ) ; } } ; virtual int GetActiveLayer ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ActiveLayer  of  << this -> ActiveLayer ) ; return this -> ActiveLayer ; } ; /@} /@{ *
##  Set and Get whether features are appended to a single
##  vtkPolyData. Turning the option on is useful when a shapefile has
##  a number of features which could otherwise lead to a huge
##  multiblock structure.
##  virtual void SetActiveLayerAppendFeatures ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AppendFeatures  to  << _arg ) ; if ( this -> AppendFeatures != _arg ) { this -> AppendFeatures = _arg ; this -> Modified ( ) ; } } ; virtual int GetActiveLayerAppendFeatures ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AppendFeatures  of  << this -> AppendFeatures ) ; return this -> AppendFeatures ; } ; virtual void AppendFeaturesOn ( ) { this -> SetAppendFeatures ( static_cast < int > ( 1 ) ) ; } virtual void AppendFeaturesOff ( ) { this -> SetAppendFeatures ( static_cast < int > ( 0 ) ) ; } ; /@} *
##  Return projection string belonging to each layer in WKT format.
##  std :: map < int , std :: string > GetLayersProjection ( ) ; *
##  Return projection string belonging to a layer in WKT format.
##  const char * GetLayerProjection ( int layerIndex ) ; *
##  Return projection string belonging to a layer in PROJ.4 format
##
##  \note The returned string has to be deleted (via delete[]) by the
##  calling program.
##  const char * GetLayerProjectionAsProj4 ( int layerIndex ) ; /@{ *
##  Set/get whether feature IDs should be generated.
##  Some GDAL primitives (e.g., a polygon with a hole
##  in its interior) are represented by multiple VTK
##  cells. If you wish to identify the primitive
##  responsible for a VTK cell, turn this on. It is
##  off by default for backwards compatibility.
##  The array of feature IDs will be the active
##  cell-data pedigree IDs.
##  virtual void SetActiveLayerAppendFeaturesAddFeatureIds ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AddFeatureIds  to  << _arg ) ; if ( this -> AddFeatureIds != _arg ) { this -> AddFeatureIds = _arg ; this -> Modified ( ) ; } } ; virtual int GetActiveLayerAppendFeaturesAddFeatureIds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AddFeatureIds  of  << this -> AddFeatureIds ) ; return this -> AddFeatureIds ; } ; virtual void AddFeatureIdsOn ( ) { this -> SetAppendFeaturesAddFeatureIds ( static_cast < int > ( 1 ) ) ; } virtual void AddFeatureIdsOff ( ) { this -> SetAppendFeaturesAddFeatureIds ( static_cast < int > ( 0 ) ) ; } ; /@} protected : vtkGDALVectorReader ( ) ; ~ vtkGDALVectorReader ( ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int InitializeInternal ( ) ; / The name of the file that will be opened on the next call to RequestData() char * FileName ; int ActiveLayer ; int AppendFeatures ; int AddFeatureIds ; class Internal ; / Private per-file metadata vtkGDALVectorReader :: Internal * Implementation ; / Global variable indicating whether the OGR library has been registered yet or not. static int OGRRegistered ; / Mapping of layer to projection. std :: map < int , std :: string > LayersProjection ; private : vtkGDALVectorReader ( const vtkGDALVectorReader & ) = delete ; void operator = ( const vtkGDALVectorReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
