## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGridSynchronizedTemplates3D.h
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
##  @class   vtkGridSynchronizedTemplates3D
##  @brief   generate isosurface from structured grids
##
##
##  vtkGridSynchronizedTemplates3D is a 3D implementation of the synchronized
##  template algorithm.
##
##  @warning
##  This filter is specialized to 3D grids.
##
##  @sa
##  vtkContourFilter vtkSynchronizedTemplates3D
##

## !!!Ignored construct:  # vtkGridSynchronizedTemplates3D_h [NewLine] # vtkGridSynchronizedTemplates3D_h [NewLine] # vtkContourValues.h  Because it passes all the calls to it # vtkFiltersCoreModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class vtkStructuredGrid ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSCORE_EXPORT vtkGridSynchronizedTemplates3D : public vtkPolyDataAlgorithm { public : static vtkGridSynchronizedTemplates3D * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkGridSynchronizedTemplates3D :: IsTypeOf ( type ) ; } static vtkGridSynchronizedTemplates3D * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkGridSynchronizedTemplates3D * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkGridSynchronizedTemplates3D * NewInstance ( ) const { return vtkGridSynchronizedTemplates3D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGridSynchronizedTemplates3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGridSynchronizedTemplates3D :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Because we delegate to vtkContourValues
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
##  If this is enabled (by default), the output will be triangles
##  otherwise, the output will be the intersection polygons
##  virtual void SetComputeNormalsComputeGradientsComputeScalarsGenerateTriangles ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateTriangles  to  << _arg ) ; if ( this -> GenerateTriangles != _arg ) { this -> GenerateTriangles = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetComputeNormalsComputeGradientsComputeScalarsGenerateTriangles ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateTriangles  of  << this -> GenerateTriangles ) ; return this -> GenerateTriangles ; } ; virtual void GenerateTrianglesOn ( ) { this -> SetComputeNormalsComputeGradientsComputeScalarsGenerateTriangles ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GenerateTrianglesOff ( ) { this -> SetComputeNormalsComputeGradientsComputeScalarsGenerateTriangles ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} *
##  Set a particular contour value at contour number i. The index i ranges
##  between 0<=i<NumberOfContours.
##  void SetValue ( int i , double value ) { this -> ContourValues -> SetValue ( i , value ) ; } *
##  Get the ith contour value.
##  double GetValue ( int i ) { return this -> ContourValues -> GetValue ( i ) ; } *
##  Get a pointer to an array of contour values. There will be
##  GetNumberOfContours() values in the list.
##  double * GetValues ( ) { return this -> ContourValues -> GetValues ( ) ; } *
##  Fill a supplied list with contour values. There will be
##  GetNumberOfContours() values in the list. Make sure you allocate
##  enough memory to hold the list.
##  void GetValues ( double * contourValues ) { this -> ContourValues -> GetValues ( contourValues ) ; } *
##  Set the number of contours to place into the list. You only really
##  need to use this method to reduce list size. The method SetValue()
##  will automatically increase list size as needed.
##  void SetNumberOfContours ( int number ) { this -> ContourValues -> SetNumberOfContours ( number ) ; } *
##  Get the number of contours in the list of contour values.
##  vtkIdType GetNumberOfContours ( ) { return this -> ContourValues -> GetNumberOfContours ( ) ; } *
##  Generate numContours equally spaced contour values between specified
##  range. Contour values will include min/max range values.
##  void GenerateValues ( int numContours , double range [ 2 ] ) { this -> ContourValues -> GenerateValues ( numContours , range ) ; } *
##  Generate numContours equally spaced contour values between specified
##  range. Contour values will include min/max range values.
##  void GenerateValues ( int numContours , double rangeStart , double rangeEnd ) { this -> ContourValues -> GenerateValues ( numContours , rangeStart , rangeEnd ) ; } *
##  Main execution.
##  void ThreadedExecute ( vtkStructuredGrid * input , vtkInformationVector * * inputVector , vtkInformation * outInfo ) ; *
##  This filter will initiate streaming so that no piece requested
##  from the input will be larger than this value (KiloBytes).
##  void SetInputMemoryLimit ( long limit ) ; /@{ *
##  Set/get the desired precision for the output types. See the documentation
##  for the vtkAlgorithm::DesiredOutputPrecision enum for an explanation of
##  the available precision settings.
##  virtual void SetOutputPointsPrecision ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << OutputPointsPrecision  to  << _arg ) ; if ( this -> OutputPointsPrecision != ( _arg < SINGLE_PRECISION ? SINGLE_PRECISION : ( _arg > DEFAULT_PRECISION ? DEFAULT_PRECISION : _arg ) ) ) { this -> OutputPointsPrecision = ( _arg < SINGLE_PRECISION ? SINGLE_PRECISION : ( _arg > DEFAULT_PRECISION ? DEFAULT_PRECISION : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetOutputPointsPrecisionMinValue ( ) { return SINGLE_PRECISION ; } virtual int GetOutputPointsPrecisionMaxValue ( ) { return DEFAULT_PRECISION ; } ; virtual int GetComputeNormalsComputeGradientsComputeScalarsGenerateTrianglesOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ; /@} protected : vtkGridSynchronizedTemplates3D ( ) ; ~ vtkGridSynchronizedTemplates3D ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; vtkTypeBool ComputeNormals ; vtkTypeBool ComputeGradients ; vtkTypeBool ComputeScalars ; vtkTypeBool GenerateTriangles ; vtkContourValues * ContourValues ; int MinimumPieceSize [ 3 ] ; int OutputPointsPrecision ; private : vtkGridSynchronizedTemplates3D ( const vtkGridSynchronizedTemplates3D & ) = delete ; void operator = ( const vtkGridSynchronizedTemplates3D & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
