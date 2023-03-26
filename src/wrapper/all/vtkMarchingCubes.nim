## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMarchingCubes.h
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
##  @class   vtkMarchingCubes
##  @brief   generate isosurface(s) from volume
##
##  vtkMarchingCubes is a filter that takes as input a volume (e.g., 3D
##  structured point set) and generates on output one or more isosurfaces.
##  One or more contour values must be specified to generate the isosurfaces.
##  Alternatively, you can specify a min/max scalar range and the number of
##  contours to generate a series of evenly spaced contour values.
##
##  @warning
##  This filter is specialized to volumes. If you are interested in
##  contouring other types of data, use the general vtkContourFilter. If you
##  want to contour an image (i.e., a volume slice), use vtkMarchingSquares.
##
##  @sa
##  Much faster implementations for isocontouring are available. In
##  particular, vtkFlyingEdges3D and vtkFlyingEdges2D are much faster
##  and if built with the right options, multithreaded, and scale well
##  with additional processors.
##
##  @sa
##  If you are interested in extracting surfaces from label maps,
##  consider using vtkDiscreteFlyingEdges3D, vtkDiscreteFlyingEdges2D, or
##  vtkDiscreteMarchingCubes.
##
##  @sa
##  vtkFlyingEdges3D vtkFlyingEdges2D vtkSynchronizedTemplates3D
##  vtkSynchronizedTemplates2D vtkContourFilter vtkSliceCubes
##  vtkMarchingSquares vtkDividingCubes vtkDiscreteMarchingCubes
##

## !!!Ignored construct:  # vtkMarchingCubes_h [NewLine] # vtkMarchingCubes_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] # vtkContourValues.h  Needed for direct access to ContourValues [NewLine] class vtkIncrementalPointLocator ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSCORE_EXPORT vtkMarchingCubes : public vtkPolyDataAlgorithm { public : static vtkMarchingCubes * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkMarchingCubes :: IsTypeOf ( type ) ; } static vtkMarchingCubes * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkMarchingCubes * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkMarchingCubes * NewInstance ( ) const { return vtkMarchingCubes :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMarchingCubes :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMarchingCubes :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ;  Methods to set contour values void SetValue ( int i , double value ) ; double GetValue ( int i ) ; double * GetValues ( ) ; void GetValues ( double * contourValues ) ; void SetNumberOfContours ( int number ) ; vtkIdType GetNumberOfContours ( ) ; void GenerateValues ( int numContours , double range [ 2 ] ) ; void GenerateValues ( int numContours , double rangeStart , double rangeEnd ) ;  Because we delegate to vtkContourValues vtkMTimeType GetMTime ( ) override ; /@{ *
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
##  override the default locator.  Useful for changing the number of
##  bins for performance or specifying a more aggressive locator.
##  void SetLocator ( vtkIncrementalPointLocator * locator ) ; virtual vtkIncrementalPointLocator * GetnameLocator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Locator  address  << static_cast < vtkIncrementalPointLocator * > ( this -> Locator ) ) ; return this -> Locator ; } ; /@} *
##  Create default locator. Used to create one when none is
##  specified. The locator is used to merge coincident points.
##  void CreateDefaultLocator ( ) ; protected : vtkMarchingCubes ( ) ; ~ vtkMarchingCubes ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; vtkContourValues * ContourValues ; vtkTypeBool ComputeNormals ; vtkTypeBool ComputeGradients ; vtkTypeBool ComputeScalars ; vtkIncrementalPointLocator * Locator ; private : vtkMarchingCubes ( const vtkMarchingCubes & ) = delete ; void operator = ( const vtkMarchingCubes & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## *
##  Set a particular contour value at contour number i. The index i ranges
##  between 0<=i<NumberOfContours.
##

proc SetValue*(i: cint; value: cdouble) {.importcpp: "VTKFILTERSCORE_EXPORT::SetValue(@)",
                                     header: "vtkMarchingCubes.h".}
## *
##  Get the ith contour value.
##

proc GetValue*(i: cint): cdouble {.importcpp: "VTKFILTERSCORE_EXPORT::GetValue(@)",
                               header: "vtkMarchingCubes.h".}
## *
##  Get a pointer to an array of contour values. There will be
##  GetNumberOfContours() values in the list.
##

proc GetValues*(): ptr cdouble {.importcpp: "VTKFILTERSCORE_EXPORT::GetValues(@)",
                             header: "vtkMarchingCubes.h".}
## *
##  Fill a supplied list with contour values. There will be
##  GetNumberOfContours() values in the list. Make sure you allocate
##  enough memory to hold the list.
##

proc GetValues*(contourValues: ptr cdouble) {.
    importcpp: "VTKFILTERSCORE_EXPORT::GetValues(@)", header: "vtkMarchingCubes.h".}
## *
##  Set the number of contours to place into the list. You only really
##  need to use this method to reduce list size. The method SetValue()
##  will automatically increase list size as needed.
##

proc SetNumberOfContours*(number: cint) {.importcpp: "VTKFILTERSCORE_EXPORT::SetNumberOfContours(@)",
                                       header: "vtkMarchingCubes.h".}
## *
##  Get the number of contours in the list of contour values.
##

proc GetNumberOfContours*(): vtkIdType {.importcpp: "VTKFILTERSCORE_EXPORT::GetNumberOfContours(@)",
                                      header: "vtkMarchingCubes.h".}
## *
##  Generate numContours equally spaced contour values between specified
##  range. Contour values will include min/max range values.
##

proc GenerateValues*(numContours: cint; range: array[2, cdouble]) {.
    importcpp: "VTKFILTERSCORE_EXPORT::GenerateValues(@)",
    header: "vtkMarchingCubes.h".}
## *
##  Generate numContours equally spaced contour values between specified
##  range. Contour values will include min/max range values.
##

proc GenerateValues*(numContours: cint; rangeStart: cdouble; rangeEnd: cdouble) {.
    importcpp: "VTKFILTERSCORE_EXPORT::GenerateValues(@)",
    header: "vtkMarchingCubes.h".}