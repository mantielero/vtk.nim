## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOutlineFilter.h
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
##  @class   vtkOutlineFilter
##  @brief   create wireframe outline for an arbitrary data set or composite dataset
##
##  vtkOutlineFilter is a filter that generates a wireframe outline of any
##  dataset or composite dataset. An outline consists of the twelve edges of
##  the dataset bounding box. An option exists for generating faces instead of
##  a wireframe outline.
##
##  @warning
##  When an input composite dataset is provided, options exist for producing
##  different styles of outline(s). Also, if the composite dataset has
##  non-geometric members (like tables) the result is unpredictable.
##
##  @warning
##  Specialized versions of the outline filter are also available. For example
##  see vtkStructuredGridOutlineFilter, vtkRectilinearGridOutlineFilter, and
##  vtkImageDataOutlineFilter.
##

## !!!Ignored construct:  # vtkOutlineFilter_h [NewLine] # vtkOutlineFilter_h [NewLine] # vtkFiltersModelingModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class VTKFILTERSMODELING_EXPORT vtkOutlineFilter : public vtkPolyDataAlgorithm { public : /@{ *
##  Standard methods for instantiation. type information, and printing.
##  static vtkOutlineFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkOutlineFilter :: IsTypeOf ( type ) ; } static vtkOutlineFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkOutlineFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkOutlineFilter * NewInstance ( ) const { return vtkOutlineFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOutlineFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOutlineFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Generate solid faces for the box. This is off by default.
##  virtual void SetGenerateFaces ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateFaces  to  << _arg ) ; if ( this -> GenerateFaces != _arg ) { this -> GenerateFaces = _arg ; this -> Modified ( ) ; } } ; virtual void GenerateFacesOn ( ) { this -> SetGenerateFaces ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GenerateFacesOff ( ) { this -> SetGenerateFaces ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual vtkTypeBool GetGenerateFaces ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateFaces  of  << this -> GenerateFaces ) ; return this -> GenerateFaces ; } ; /@} enum CompositeOutlineStyle { ROOT_LEVEL = 0 , LEAF_DATASETS = 1 , ROOT_AND_LEAFS = 2 , SPECIFIED_INDEX = 3 } ; /@{ *
##  Specify a style for creating bounding boxes around input composite
##  datasets. (If the filter input is a vtkDataSet type these options have
##  no effect.) There are four choices: 1) place a bounding box around the
##  root of the vtkCompositeDataSet (i.e., all of the data); 2) place
##  separate bounding boxes around each vtkDataSet leaf of the composite
##  dataset; 3) place a bounding box around the root and all dataset leaves;
##  and 4) place a bounding box around each (flat) index of the composite
##  dataset. The default behavior is both root and leafs.
##  virtual void SetGenerateFacesCompositeStyle ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CompositeStyle  to  << _arg ) ; if ( this -> CompositeStyle != _arg ) { this -> CompositeStyle = _arg ; this -> Modified ( ) ; } } ; virtual int GetGenerateFacesCompositeStyle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CompositeStyle  of  << this -> CompositeStyle ) ; return this -> CompositeStyle ; } ; void SetCompositeStyleToRoot ( ) { this -> SetCompositeStyle ( ROOT_LEVEL ) ; } void SetCompositeStyleToLeafs ( ) { this -> SetCompositeStyle ( LEAF_DATASETS ) ; } void SetCompositeStyleToRootAndLeafs ( ) { this -> SetCompositeStyle ( ROOT_AND_LEAFS ) ; } void SetCompositeStyleToSpecifiedIndex ( ) { this -> SetCompositeStyle ( SPECIFIED_INDEX ) ; } /@} /@{ *
##  If the composite style is set to SpecifiedIndex, then one or more flat
##  indices can be specified, and bounding boxes will be drawn around those
##  pieces of the composite dataset. (Recall that the flat index is a
##  non-negative integer, with root index=0, increasing in perorder
##  (depth-first) traversal order.
##  void AddIndex ( unsigned int index ) ; void RemoveIndex ( unsigned int index ) ; void RemoveAllIndices ( ) ; /@} /@{ *
##  Set/get the desired precision for the output points.
##  vtkAlgorithm::SINGLE_PRECISION - Output single-precision floating point.
##  vtkAlgorithm::DOUBLE_PRECISION - Output double-precision floating point.
##  virtual void SetGenerateFacesCompositeStyleOutputPointsPrecision ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputPointsPrecision  to  << _arg ) ; if ( this -> OutputPointsPrecision != _arg ) { this -> OutputPointsPrecision = _arg ; this -> Modified ( ) ; } } ; virtual int GetGenerateFacesCompositeStyleOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ; /@} protected : vtkOutlineFilter ( ) ; ~ vtkOutlineFilter ( ) override ; vtkTypeBool GenerateFaces ; int CompositeStyle ; int OutputPointsPrecision ; class vtkIndexSet ; vtkIndexSet * Indices ; void AppendOutline ( vtkPoints * pts , vtkCellArray * lines , vtkCellArray * faces , double bds [ 6 ] ) ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; private : vtkOutlineFilter ( const vtkOutlineFilter & ) = delete ; void operator = ( const vtkOutlineFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
