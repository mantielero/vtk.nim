## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGenericContourFilter.h
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
##  @class   vtkGenericContourFilter
##  @brief   generate isocontours from input dataset
##
##  vtkGenericContourFilter is a filter that takes as input any (generic)
##  dataset and generates on output isosurfaces and/or isolines. The exact
##  form of the output depends upon the dimensionality of the input data.
##  Data consisting of 3D cells will generate isosurfaces, data consisting of
##  2D cells will generate isolines, and data with 1D or 0D cells will
##  generate isopoints. Combinations of output type are possible if the input
##  dimension is mixed.
##
##  To use this filter you must specify one or more contour values.
##  You can either use the method SetValue() to specify each contour
##  value, or use GenerateValues() to generate a series of evenly
##  spaced contours. You can use ComputeNormalsOn to compute the normals
##  without the need of a vtkPolyDataNormals
##
##  This filter has been implemented to operate on generic datasets, rather
##  than the typical vtkDataSet (and subclasses). vtkGenericDataSet is a more
##  complex cousin of vtkDataSet, typically consisting of nonlinear,
##  higher-order cells. To process this type of data, generic cells are
##  automatically tessellated into linear cells prior to isocontouring.
##
##  @sa
##  vtkContourFilter vtkGenericDataSet
##

## !!!Ignored construct:  # vtkGenericContourFilter_h [NewLine] # vtkGenericContourFilter_h [NewLine] # vtkFiltersGenericModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class vtkContourValues ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkIncrementalPointLocator"
discard "forward decl of vtkPointData"
discard "forward decl of vtkCellData"
## !!!Ignored construct:  class VTKFILTERSGENERIC_EXPORT vtkGenericContourFilter : public vtkPolyDataAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkGenericContourFilter :: IsTypeOf ( type ) ; } static vtkGenericContourFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkGenericContourFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkGenericContourFilter * NewInstance ( ) const { return vtkGenericContourFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGenericContourFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGenericContourFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct object with initial range (0,1) and single contour value
##  of 0.0.
##  static vtkGenericContourFilter * New ( ) ; typedef double PointType [ 3 ] ;  Arbitrary definition of a point /@{ *
##  Methods to set / get contour values.
##  void SetValue ( int i , float value ) ; double GetValue ( int i ) ; double * GetValues ( ) ; void GetValues ( double * contourValues ) ; void SetNumberOfContours ( int number ) ; vtkIdType GetNumberOfContours ( ) ; void GenerateValues ( int numContours , double range [ 2 ] ) ; void GenerateValues ( int numContours , double rangeStart , double rangeEnd ) ; /@} *
##  Modified GetMTime Because we delegate to vtkContourValues
##  vtkMTimeType GetMTime ( ) override ; /@{ *
##  Set/Get the computation of normals. Normal computation is fairly
##  expensive in both time and storage. If the output data will be
##  processed by filters that modify topology or geometry, it may be
##  wise to turn Normals and Gradients off.
##  virtual void SetComputeNormals ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeNormals  to  << _arg ) ; if ( this -> ComputeNormals != _arg ) { this -> ComputeNormals = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetComputeNormals ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeNormals  of  << this -> ComputeNormals ) ; return this -> ComputeNormals ; } ; virtual void ComputeNormalsOn ( ) { this -> SetComputeNormals ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ComputeNormalsOff ( ) { this -> SetComputeNormals ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the computation of gradients. Gradient computation is
##  fairly expensive in both time and storage. Note that if
##  ComputeNormals is on, gradients will have to be calculated, but
##  will not be stored in the output dataset.  If the output data
##  will be processed by filters that modify topology or geometry, it
##  may be wise to turn Normals and Gradients off.
##  virtual void SetComputeNormalsComputeGradients ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeGradients  to  << _arg ) ; if ( this -> ComputeGradients != _arg ) { this -> ComputeGradients = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetComputeNormalsComputeGradients ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeGradients  of  << this -> ComputeGradients ) ; return this -> ComputeGradients ; } ; virtual void ComputeGradientsOn ( ) { this -> SetComputeNormalsComputeGradients ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ComputeGradientsOff ( ) { this -> SetComputeNormalsComputeGradients ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the computation of scalars.
##  virtual void SetComputeNormalsComputeGradientsComputeScalars ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeScalars  to  << _arg ) ; if ( this -> ComputeScalars != _arg ) { this -> ComputeScalars = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetComputeNormalsComputeGradientsComputeScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeScalars  of  << this -> ComputeScalars ) ; return this -> ComputeScalars ; } ; virtual void ComputeScalarsOn ( ) { this -> SetComputeNormalsComputeGradientsComputeScalars ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ComputeScalarsOff ( ) { this -> SetComputeNormalsComputeGradientsComputeScalars ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set / get a spatial locator for merging points. By default,
##  an instance of vtkMergePoints is used.
##  void SetLocator ( vtkIncrementalPointLocator * locator ) ; virtual vtkIncrementalPointLocator * GetnameLocator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Locator  address  << static_cast < vtkIncrementalPointLocator * > ( this -> Locator ) ) ; return this -> Locator ; } ; /@} *
##  Create default locator. Used to create one when none is
##  specified. The locator is used to merge coincident points.
##  void CreateDefaultLocator ( ) ; /@{ *
##  If you want to contour by an arbitrary scalar attribute, then set its
##  name here.
##  By default this in nullptr and the filter will use the active scalar array.
##  virtual char * GetInputScalarsSelection ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << InputScalarsSelection  of  << ( this -> InputScalarsSelection ? this -> InputScalarsSelection : (null) ) ) ; return this -> InputScalarsSelection ; } ; virtual void SelectInputScalars ( const char * fieldName ) ; /@} protected : vtkGenericContourFilter ( ) ; ~ vtkGenericContourFilter ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int , vtkInformation * ) override ; vtkContourValues * ContourValues ; vtkTypeBool ComputeNormals ; vtkTypeBool ComputeGradients ; vtkTypeBool ComputeScalars ; vtkIncrementalPointLocator * Locator ; char * InputScalarsSelection ; virtual void SetInputScalarsSelection ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << InputScalarsSelection  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> InputScalarsSelection == nullptr && _arg == nullptr ) { return ; } if ( this -> InputScalarsSelection && _arg && ( ! strcmp ( this -> InputScalarsSelection , _arg ) ) ) { return ; } delete [ ] this -> InputScalarsSelection ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> InputScalarsSelection = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> InputScalarsSelection = nullptr ; } this -> Modified ( ) ; } ;  Used internal by vtkGenericAdaptorCell::Contour() vtkPointData * InternalPD ; vtkPointData * SecondaryPD ; vtkCellData * SecondaryCD ; private : vtkGenericContourFilter ( const vtkGenericContourFilter & ) = delete ; void operator = ( const vtkGenericContourFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
