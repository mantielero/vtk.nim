## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDataObjectToDataSetFilter.h
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
##  @class   vtkDataObjectToDataSetFilter
##  @brief   map field data to concrete dataset
##
##  vtkDataObjectToDataSetFilter is an class that maps a data object (i.e., a field)
##  into a concrete dataset, i.e., gives structure to the field by defining a
##  geometry and topology.
##
##  To use this filter you associate components in the input field data with
##  portions of the output dataset. (A component is an array of values from
##  the field.) For example, you would specify x-y-z points by assigning
##  components from the field for the x, then y, then z values of the points.
##  You may also have to specify component ranges (for each z-y-z) to make
##  sure that the number of x, y, and z values is the same. Also, you may
##  want to normalize the components which helps distribute the data
##  uniformly. Once you've setup the filter to combine all the pieces of
##  data into a specified dataset (the geometry, topology, point and cell
##  data attributes), the various output methods (e.g., GetPolyData()) are
##  used to retrieve the final product.
##
##  This filter is often used in conjunction with
##  vtkFieldDataToAttributeDataFilter.  vtkFieldDataToAttributeDataFilter
##  takes field data and transforms it into attribute data (e.g., point and
##  cell data attributes such as scalars and vectors).  To do this, use this
##  filter which constructs a concrete dataset and passes the input data
##  object field data to its output. and then use
##  vtkFieldDataToAttributeDataFilter to generate the attribute data associated
##  with the dataset.
##
##  @warning
##  Make sure that the data you extract is consistent. That is, if you have N
##  points, extract N x, y, and z components. Also, all the information
##  necessary to define a dataset must be given. For example, vtkPolyData
##  requires points at a minimum; vtkStructuredPoints requires setting the
##  dimensions; vtkStructuredGrid requires defining points and dimensions;
##  vtkUnstructuredGrid requires setting points; and vtkRectilinearGrid
##  requires that you define the x, y, and z-coordinate arrays (by specifying
##  points) as well as the dimensions.
##
##  @warning
##  If you wish to create a dataset of just points (i.e., unstructured points
##  dataset), create vtkPolyData consisting of points. There will be no cells
##  in such a dataset.
##
##  @sa
##  vtkDataObject vtkFieldData vtkDataSet vtkPolyData vtkStructuredPoints
##  vtkStructuredGrid vtkUnstructuredGrid vtkRectilinearGrid
##  vtkDataSetAttributes vtkDataArray
##

## !!!Ignored construct:  # vtkDataObjectToDataSetFilter_h [NewLine] # vtkDataObjectToDataSetFilter_h [NewLine] # vtkDataSetAlgorithm.h [NewLine] # vtkFiltersCoreModule.h  For export macro [NewLine] class vtkCellArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDataArray"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkPointSet"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkRectilinearGrid"
discard "forward decl of vtkStructuredGrid"
discard "forward decl of vtkStructuredPoints"
discard "forward decl of vtkUnstructuredGrid"
## !!!Ignored construct:  class VTKFILTERSCORE_EXPORT vtkDataObjectToDataSetFilter : public vtkDataSetAlgorithm { public : static vtkDataObjectToDataSetFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkDataObjectToDataSetFilter :: IsTypeOf ( type ) ; } static vtkDataObjectToDataSetFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkDataObjectToDataSetFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkDataObjectToDataSetFilter * NewInstance ( ) const { return vtkDataObjectToDataSetFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDataObjectToDataSetFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDataObjectToDataSetFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Get the input to the filter.
##  vtkDataObject * GetInput ( ) ; /@{ *
##  Control what type of data is generated for output.
##  void SetDataSetType ( int ) ; virtual int GetDataSetType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DataSetType  of  << this -> DataSetType ) ; return this -> DataSetType ; } ; void SetDataSetTypeToPolyData ( ) { this -> SetDataSetType ( VTK_POLY_DATA ) ; } void SetDataSetTypeToStructuredPoints ( ) { this -> SetDataSetType ( VTK_STRUCTURED_POINTS ) ; } void SetDataSetTypeToStructuredGrid ( ) { this -> SetDataSetType ( VTK_STRUCTURED_GRID ) ; } void SetDataSetTypeToRectilinearGrid ( ) { this -> SetDataSetType ( VTK_RECTILINEAR_GRID ) ; } void SetDataSetTypeToUnstructuredGrid ( ) { this -> SetDataSetType ( VTK_UNSTRUCTURED_GRID ) ; } /@} /@{ *
##  Get the output in different forms. The particular method invoked
##  should be consistent with the SetDataSetType() method. (Note:
##  GetOutput() will always return a type consistent with
##  SetDataSetType(). Also, GetOutput() will return nullptr if the filter
##  aborted due to inconsistent data.)
##  vtkDataSet * GetOutput ( ) ; vtkDataSet * GetOutput ( int idx ) ; vtkPolyData * GetPolyDataOutput ( ) ; vtkStructuredPoints * GetStructuredPointsOutput ( ) ; vtkStructuredGrid * GetStructuredGridOutput ( ) ; vtkUnstructuredGrid * GetUnstructuredGridOutput ( ) ; vtkRectilinearGrid * GetRectilinearGridOutput ( ) ; /@} /@{ *
##  Define the component of the field to be used for the x, y, and z values
##  of the points. Note that the parameter comp must lie between (0,2) and
##  refers to the x-y-z (i.e., 0,1,2) components of the points. To define
##  the field component to use you can specify an array name and the
##  component in that array. The (min,max) values are the range of data in
##  the component you wish to extract. (This method should be used for
##  vtkPolyData, vtkUnstructuredGrid, vtkStructuredGrid, and
##  vtkRectilinearGrid.) A convenience method, SetPointComponent(),is also
##  provided which does not require setting the (min,max) component range or
##  the normalize flag (normalize is set to DefaulatNormalize value).
##  void SetPointComponent ( int comp , const char * arrayName , int arrayComp , int min , int max , int normalize ) ; void SetPointComponent ( int comp , const char * arrayName , int arrayComp ) { this -> SetPointComponent ( comp , arrayName , arrayComp , - 1 , - 1 , this -> DefaultNormalize ) ; } const char * GetPointComponentArrayName ( int comp ) ; int GetPointComponentArrayComponent ( int comp ) ; int GetPointComponentMinRange ( int comp ) ; int GetPointComponentMaxRange ( int comp ) ; int GetPointComponentNormailzeFlag ( int comp ) ; /@} /@{ *
##  Define cell connectivity when creating vtkPolyData. You can define
##  vertices, lines, polygons, and/or triangle strips via these methods.
##  These methods are similar to those for defining points, except
##  that no normalization of the data is possible. Basically, you need to
##  define an array of values that (for each cell) includes the number of
##  points per cell, and then the cell connectivity. (This is the vtk file
##  format described in in the textbook or User's Guide.)
##  void SetVertsComponent ( const char * arrayName , int arrayComp , int min , int max ) ; void SetVertsComponent ( const char * arrayName , int arrayComp ) { this -> SetVertsComponent ( arrayName , arrayComp , - 1 , - 1 ) ; } const char * GetVertsComponentArrayName ( ) ; int GetVertsComponentArrayComponent ( ) ; int GetVertsComponentMinRange ( ) ; int GetVertsComponentMaxRange ( ) ; void SetLinesComponent ( const char * arrayName , int arrayComp , int min , int max ) ; void SetLinesComponent ( const char * arrayName , int arrayComp ) { this -> SetLinesComponent ( arrayName , arrayComp , - 1 , - 1 ) ; } const char * GetLinesComponentArrayName ( ) ; int GetLinesComponentArrayComponent ( ) ; int GetLinesComponentMinRange ( ) ; int GetLinesComponentMaxRange ( ) ; void SetPolysComponent ( const char * arrayName , int arrayComp , int min , int max ) ; void SetPolysComponent ( const char * arrayName , int arrayComp ) { this -> SetPolysComponent ( arrayName , arrayComp , - 1 , - 1 ) ; } const char * GetPolysComponentArrayName ( ) ; int GetPolysComponentArrayComponent ( ) ; int GetPolysComponentMinRange ( ) ; int GetPolysComponentMaxRange ( ) ; void SetStripsComponent ( const char * arrayName , int arrayComp , int min , int max ) ; void SetStripsComponent ( const char * arrayName , int arrayComp ) { this -> SetStripsComponent ( arrayName , arrayComp , - 1 , - 1 ) ; } const char * GetStripsComponentArrayName ( ) ; int GetStripsComponentArrayComponent ( ) ; int GetStripsComponentMinRange ( ) ; int GetStripsComponentMaxRange ( ) ; /@} /@{ *
##  Define cell types and cell connectivity when creating unstructured grid
##  data.  These methods are similar to those for defining points, except
##  that no normalization of the data is possible. Basically, you need to
##  define an array of cell types (an integer value per cell), and another
##  array consisting (for each cell) of a number of points per cell, and
##  then the cell connectivity. (This is the vtk file format described in
##  in the textbook or User's Guide.)
##  void SetCellTypeComponent ( const char * arrayName , int arrayComp , int min , int max ) ; void SetCellTypeComponent ( const char * arrayName , int arrayComp ) { this -> SetCellTypeComponent ( arrayName , arrayComp , - 1 , - 1 ) ; } const char * GetCellTypeComponentArrayName ( ) ; int GetCellTypeComponentArrayComponent ( ) ; int GetCellTypeComponentMinRange ( ) ; int GetCellTypeComponentMaxRange ( ) ; void SetCellConnectivityComponent ( const char * arrayName , int arrayComp , int min , int max ) ; void SetCellConnectivityComponent ( const char * arrayName , int arrayComp ) { this -> SetCellConnectivityComponent ( arrayName , arrayComp , - 1 , - 1 ) ; } const char * GetCellConnectivityComponentArrayName ( ) ; int GetCellConnectivityComponentArrayComponent ( ) ; int GetCellConnectivityComponentMinRange ( ) ; int GetCellConnectivityComponentMaxRange ( ) ; /@} /@{ *
##  Set the default Normalize() flag for those methods setting a default
##  Normalize value (e.g., SetPointComponent).
##  virtual void SetDefaultNormalize ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  DefaultNormalize  to  << _arg ) ; if ( this -> DefaultNormalize != _arg ) { this -> DefaultNormalize = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetDataSetTypeDefaultNormalize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DefaultNormalize  of  << this -> DefaultNormalize ) ; return this -> DefaultNormalize ; } ; virtual void DefaultNormalizeOn ( ) { this -> SetDefaultNormalize ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void DefaultNormalizeOff ( ) { this -> SetDefaultNormalize ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify the dimensions to use if generating a dataset that requires
##  dimensions specification (vtkStructuredPoints, vtkStructuredGrid,
##  vtkRectilinearGrid).
##  virtual void SetDimensions ( int _arg1 , int _arg2 , int _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Dimensions  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Dimensions [ 0 ] != _arg1 ) || ( this -> Dimensions [ 1 ] != _arg2 ) || ( this -> Dimensions [ 2 ] != _arg3 ) ) { this -> Dimensions [ 0 ] = _arg1 ; this -> Dimensions [ 1 ] = _arg2 ; this -> Dimensions [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetDimensions ( const int _arg [ 3 ] ) { this -> SetDimensions ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual int * GetDimensions ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Dimensions  pointer  << this -> Dimensions ) ; return this -> Dimensions ; } VTK_WRAPEXCLUDE virtual void GetDimensions ( int data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Dimensions [ i ] ; } } ; /@} /@{ *
##  Specify the origin to use if generating a dataset whose origin
##  can be set (i.e., a vtkStructuredPoints dataset).
##  virtual void SetDimensionsOrigin ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Origin  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Origin [ 0 ] != _arg1 ) || ( this -> Origin [ 1 ] != _arg2 ) || ( this -> Origin [ 2 ] != _arg3 ) ) { this -> Origin [ 0 ] = _arg1 ; this -> Origin [ 1 ] = _arg2 ; this -> Origin [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetDimensionsOrigin ( const double _arg [ 3 ] ) { this -> SetDimensionsOrigin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetDimensionsOrigin ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Origin  pointer  << this -> Origin ) ; return this -> Origin ; } VTK_WRAPEXCLUDE virtual void GetDimensionsOrigin ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Origin [ i ] ; } } ; /@} /@{ *
##  Specify the spacing to use if generating a dataset whose spacing
##  can be set (i.e., a vtkStructuredPoints dataset).
##  virtual void SetDimensionsOriginSpacing ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Spacing  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Spacing [ 0 ] != _arg1 ) || ( this -> Spacing [ 1 ] != _arg2 ) || ( this -> Spacing [ 2 ] != _arg3 ) ) { this -> Spacing [ 0 ] = _arg1 ; this -> Spacing [ 1 ] = _arg2 ; this -> Spacing [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetDimensionsOriginSpacing ( const double _arg [ 3 ] ) { this -> SetDimensionsOriginSpacing ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetDimensionsOriginSpacing ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Spacing  pointer  << this -> Spacing ) ; return this -> Spacing ; } VTK_WRAPEXCLUDE virtual void GetDimensionsOriginSpacing ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Spacing [ i ] ; } } ; /@} /@{ *
##  Alternative methods to specify the dimensions, spacing, and origin for those
##  datasets requiring this information. You need to specify the name of an array;
##  the component of the array, and the range of the array (min,max). These methods
##  will override the information given by the previous methods.
##  void SetDimensionsComponent ( const char * arrayName , int arrayComp , int min , int max ) ; void SetDimensionsComponent ( const char * arrayName , int arrayComp ) { this -> SetDimensionsComponent ( arrayName , arrayComp , - 1 , - 1 ) ; } void SetSpacingComponent ( const char * arrayName , int arrayComp , int min , int max ) ; void SetSpacingComponent ( const char * arrayName , int arrayComp ) { this -> SetSpacingComponent ( arrayName , arrayComp , - 1 , - 1 ) ; } void SetOriginComponent ( const char * arrayName , int arrayComp , int min , int max ) ; void SetOriginComponent ( const char * arrayName , int arrayComp ) { this -> SetOriginComponent ( arrayName , arrayComp , - 1 , - 1 ) ; } /@} protected : vtkDataObjectToDataSetFilter ( ) ; ~ vtkDataObjectToDataSetFilter ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ;  generate output data int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int RequestDataObject ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; char Updating ;  control flags used to generate the output dataset int DataSetType ;  the type of dataset to generate  Support definition of points char * PointArrays [ 3 ] ;  the name of the arrays int PointArrayComponents [ 3 ] ;  the array components used for x-y-z vtkIdType PointComponentRange [ 3 ] [ 2 ] ;  the range of the components to use int PointNormalize [ 3 ] ;  flags control normalization  These define cells for vtkPolyData char * VertsArray ;  the name of the array int VertsArrayComponent ;  the array component vtkIdType VertsComponentRange [ 2 ] ;  the range of the components to use char * LinesArray ;  the name of the array int LinesArrayComponent ;  the array component used for cell types vtkIdType LinesComponentRange [ 2 ] ;  the range of the components to use char * PolysArray ;  the name of the array int PolysArrayComponent ;  the array component vtkIdType PolysComponentRange [ 2 ] ;  the range of the components to use char * StripsArray ;  the name of the array int StripsArrayComponent ;  the array component vtkIdType StripsComponentRange [ 2 ] ;  the range of the components to use  Used to define vtkUnstructuredGrid datasets char * CellTypeArray ;  the name of the array int CellTypeArrayComponent ;  the array component used for cell types vtkIdType CellTypeComponentRange [ 2 ] ;  the range of the components to use char * CellConnectivityArray ;  the name of the array int CellConnectivityArrayComponent ;  the array components used for cell connectivity vtkIdType CellConnectivityComponentRange [ 2 ] ;  the range of the components to use  helper methods (and attributes) to construct datasets void SetArrayName ( char * & name , char * newName ) ; vtkIdType ConstructPoints ( vtkDataObject * input , vtkPointSet * ps ) ; vtkIdType ConstructPoints ( vtkDataObject * input , vtkRectilinearGrid * rg ) ; int ConstructCells ( vtkDataObject * input , vtkPolyData * pd ) ; int ConstructCells ( vtkDataObject * input , vtkUnstructuredGrid * ug ) ; vtkCellArray * ConstructCellArray ( vtkDataArray * da , int comp , vtkIdType compRange [ 2 ] ) ;  Default value for normalization vtkTypeBool DefaultNormalize ;  Couple of different ways to specify dimensions, spacing, and origin. int Dimensions [ 3 ] ; double Origin [ 3 ] ; double Spacing [ 3 ] ; char * DimensionsArray ;  the name of the array int DimensionsArrayComponent ;  the component of the array used for dimensions vtkIdType DimensionsComponentRange [ 2 ] ;  the ComponentRange of the array for the dimensions char * OriginArray ;  the name of the array int OriginArrayComponent ;  the component of the array used for Origins vtkIdType OriginComponentRange [ 2 ] ;  the ComponentRange of the array for the Origins char * SpacingArray ;  the name of the array int SpacingArrayComponent ;  the component of the array used for Spacings vtkIdType SpacingComponentRange [ 2 ] ;  the ComponentRange of the array for the Spacings void ConstructDimensions ( vtkDataObject * input ) ; void ConstructSpacing ( vtkDataObject * input ) ; void ConstructOrigin ( vtkDataObject * input ) ; private : vtkDataObjectToDataSetFilter ( const vtkDataObjectToDataSetFilter & ) = delete ; void operator = ( const vtkDataObjectToDataSetFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
